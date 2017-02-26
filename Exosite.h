/*
 * Exosite.h
 *
 * Exosite IoT HTTP POST API
 */

#ifndef EXOSITE_H_
#define EXOSITE_H_

typedef struct Exosite_Struct *Exosite_Handle;

/*
 * Connect to Exosite IoT server
 *
 * The input param 'cik' should be persistent for life cycle of connection
 */
extern Exosite_Handle Exosite_connect(const char *cik, char *certDir);

/*
 * Disconnect from Exosite IoT server
 */
extern void Exosite_disconnect(Exosite_Handle *exo);

/*
 * Send data to Exosite IoT server
 *
 * The "data" should be in the format "<alias1>=<value1>&<alia2>=<value2>"
 */
extern int Exosite_send(Exosite_Handle exo, char *data, int len);

#endif /* EXOSITE_H_ */
