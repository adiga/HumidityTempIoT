/*
 * Copyright (c) 2015, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *  ======== empty.c ========
 */
#include <stdio.h>
#include <stdint.h>

/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/runtime/System.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>

/* TI-RTOS Header files */
#include <ti/drivers/GPIO.h>
#include <ti/drivers/I2C.h>

#include <simplelink.h>
#include "sockets.h"

#include "AdafruitSi7021.h"
#include "Exosite.h"

/* Example/Board Header files */
#include "Board.h"

#include "Config.h"

/* "=&=" 3 chars, humidity + 3 chars, temp + 3 chars, NULL + 1 char */
#define EXOSITE_DATA_LEN (sizeof(EXOSITE_HUMIDITY_ALIAS) - 1 \
        + sizeof(EXOSITE_TEMP_ALIAS) - 1 + 3 + 3 + 3 + 1)

#define ERROR_SLEEP_MS  (15000)
#define APP_SLEEP_MS   (60000)

#define TASKSTACKSIZE   (4096)

static Task_Struct task0Struct;
static Char task0Stack[TASKSTACKSIZE];

extern void startNTP(void);

/*
 *  ======== humidityTempTask ========
 */
Void humidityTempTask(UArg arg0, UArg arg1)
{
    uint32_t        humidity = 0;
    uint32_t        temperature = 0;
    I2C_Handle      i2c;
    I2C_Params      i2cParams;
    Exosite_Handle  handle;
    char            exositeData[EXOSITE_DATA_LEN];
    int             ret;

    /* Open WiFi and await a connection */
    socketsStartUp(SSID_NAME, SECURITY_KEY, SECURITY_TYPE);

    startNTP();

    handle = Exosite_connect(EXOSITE_CIK, EXOSITE_CERT_DIR);
    if (!handle) {
        while (1);
    }

    /* Create I2C for usage */
    I2C_Params_init(&i2cParams);
    i2cParams.bitRate = I2C_400kHz;
    i2c = I2C_open(Board_I2C_TMP, &i2cParams);
    if (!i2c) {
        while (1);
    }

    ret = AdafruitSi7021_start(i2c);
    if (ret< 0) {
        while (1);
    }

    while (1) {
        /* Turn on user LED */
        GPIO_write(Board_LED0, Board_LED_ON);

        ret = AdafruitSi7021_readHumidity(i2c, &humidity);
        if (ret < 0) {
            Task_sleep(ERROR_SLEEP_MS);
            continue;
        }

        ret = AdafruitSi7021_readTemperature(i2c, &temperature);
        if (ret < 0) {
            Task_sleep(ERROR_SLEEP_MS);
            continue;
        }

        snprintf(exositeData, sizeof(exositeData), "%s=%d&%s=%d",
                EXOSITE_HUMIDITY_ALIAS, humidity, EXOSITE_TEMP_ALIAS,
                temperature);

        ret = Exosite_send(handle, exositeData, strlen(exositeData));
        if (ret < 0) {
            Exosite_disconnect(&handle);
            handle = NULL;
            do {
                Task_sleep(ERROR_SLEEP_MS);
                handle = Exosite_connect(EXOSITE_CIK, EXOSITE_CERT_DIR);
            } while (!handle);
        }

        /* Turn off user LED */
        GPIO_write(Board_LED0, Board_LED_OFF);
        Task_sleep(APP_SLEEP_MS);
    }
}

/*
 *  ======== main ========
 */
int main(void)
{
    Task_Params taskParams;

    /* Call board init functions */
    Board_initGeneral();
    Board_initGPIO();
    Board_initI2C();
    Board_initWiFi();

    /* Construct heartBeat Task  thread */
    Task_Params_init(&taskParams);
    taskParams.stackSize = TASKSTACKSIZE;
    taskParams.stack = &task0Stack;
    Task_construct(&task0Struct, (Task_FuncPtr)humidityTempTask, &taskParams,
            NULL);

    /* Start BIOS */
    BIOS_start();

    return (0);
}
