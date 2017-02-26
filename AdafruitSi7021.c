/*
 * AdafruitSi7021.c
 *
 * TI-RTOS Driver for Adafruit Si7021 Humidity and
 * Temperature break out board.
 *
 * Based on https://github.com/adafruit/Adafruit_Si7021
 */
#include <ti/sysbios/knl/Task.h>
#include "AdafruitSi7021.h"

/* Slave address */
#define SI7021_DEFAULT_ADDRESS           (0x40)

/* Breakout board commands */
#define SI7021_MEASRH_HOLD_CMD           (0xE5)
#define SI7021_MEASRH_NOHOLD_CMD         (0xF5)
#define SI7021_MEASTEMP_HOLD_CMD         (0xE3)
#define SI7021_MEASTEMP_NOHOLD_CMD       (0xF3)
#define SI7021_READPREVTEMP_CMD          (0xE0)
#define SI7021_RESET_CMD                 (0xFE)
#define SI7021_WRITERHT_REG_CMD          (0xE6)
#define SI7021_READRHT_REG_CMD           (0xE7)
#define SI7021_WRITEHEATER_REG_CMD       (0x51)
#define SI7021_READHEATER_REG_CMD        (0x11)
#define SI7021_ID1_CMD                   (0xFA0F)
#define SI7021_ID2_CMD                   (0xFCC9)
#define SI7021_FIRMVERS_CMD              (0x84B8)

/*
 *  ======== transfer ========
 */
static int transfer(I2C_Handle i2c, uint8_t *tx, int txLen, uint8_t *rx,
        int rxLen)
{
    I2C_Transaction i2cTransaction;
    bool ret;

    i2cTransaction.slaveAddress = SI7021_DEFAULT_ADDRESS;
    i2cTransaction.writeBuf = tx;
    i2cTransaction.writeCount = txLen;
    i2cTransaction.readBuf = rx;
    i2cTransaction.readCount = rxLen;

    ret = I2C_transfer(i2c, &i2cTransaction);
    if (!ret) {
        return (-1);
    }

    return (0);
}

/*
 *  ======== AdafruitSi7021_start ========
 */
int AdafruitSi7021_start(I2C_Handle i2c)
{
    int ret = 0;
    uint8_t cmd = SI7021_RESET_CMD;
    uint8_t recv = 0;

    ret = transfer(i2c, &cmd, 1, NULL, 0);
    if (ret < 0) {
        return (-1);
    }

    Task_sleep(50);

    cmd = SI7021_READRHT_REG_CMD;
    ret = transfer(i2c, &cmd, 1, &recv, 1);
    if ((ret < 0) || (recv != 0x3A)) {
        return (-2);
    }

    return (0);
}

/*
 *  ======== AdafruitSi7021_readHumidity ========
 */
int AdafruitSi7021_readHumidity(I2C_Handle i2c, uint32_t *humidity)
{
    uint8_t cmd = SI7021_MEASRH_HOLD_CMD;
    uint8_t recv[3] = {0};
    int ret = 0;

    if (!humidity) {
        return (-1);
    }

    ret = transfer(i2c, &cmd, 1, recv, 3);
    if (ret < 0) {
        return (-2);
    }

    *humidity = (((recv[0] << 8 | recv[1]) * 125) / 65536) - 6;

    return (0);
}

/*
 *  ======== AdafruitSi7021_readTemperature ========
 */
int AdafruitSi7021_readTemperature(I2C_Handle i2c, uint32_t *temperature)
{
    uint8_t cmd = SI7021_MEASTEMP_HOLD_CMD;
    uint8_t recv[3] = {0};
    int ret = 0;

    if (!temperature) {
        return (-1);
    }

    ret = transfer(i2c, &cmd, 1, recv, 3);
    if (ret < 0) {
        return (-2);
    }

    *temperature = (((recv[0] << 8 | recv[1]) * 175.72) / 65536) - 46.85;
    *temperature = ((*temperature * 9) / 5) + 32;

    return (0);
}
