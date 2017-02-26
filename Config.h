/*
 * Config.h
 *
 * configuration parameters
 */

#ifndef CONFIG_H_
#define CONFIG_H_

/*
 *  Exosite parameters
 *  CIK - Id generated on Exosite for the device
 *  ALIAS - alias names for humidity and temperature on Exosite
 *  CERT DIR - cert directory on SFLASH where the Exosite CA in DER format is
 *             stored and named as "ca.der"
 */
#define EXOSITE_CIK            "504420488eb6cd"
#define EXOSITE_HUMIDITY_ALIAS "humidity"
#define EXOSITE_TEMP_ALIAS     "temp"
#define EXOSITE_CERT_DIR       "/cert"

/*
 *  Router details
 */
#define SSID_NAME           "SSID"
#define SECURITY_KEY        "PASSWORD"
#define SECURITY_TYPE       SL_SEC_TYPE_WPA_WPA2

#endif /* CONFIG_H_ */
