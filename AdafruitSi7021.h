/*
 * AdafruitSi7021.h
 *
 * TI-RTOS Driver for Adafruit Si7021 Humidity and
 * Temperature break out board.
 *
 * Based on https://github.com/adafruit/Adafruit_Si7021
 */

#ifndef ADAFRUITSI7021_H_
#define ADAFRUITSI7021_H_
#include <stdint.h>
#include <ti/drivers/I2C.h>

/*
 * @brief Setup and start the Si7021 sensor
 */
extern int AdafruitSi7021_start(I2C_Handle i2c);

/*
 * @brief Read the humidity value into the 'humidity' param
 */
extern int AdafruitSi7021_readHumidity(I2C_Handle i2c, uint32_t *humidity);

/*
 * @brief Read the temperature value (in F) into 'temperature' param
 */
extern int AdafruitSi7021_readTemperature(I2C_Handle i2c,
        uint32_t *temperature);

#endif /* ADAFRUITSI7021_H_ */
