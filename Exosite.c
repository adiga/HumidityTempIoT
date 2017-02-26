/*
 * Exosite.c
 *
 * Exosite IoT HTTP POST API
 */
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <ti/net/http/httpcli.h>
#include <ti/net/tls.h>
#include "Exosite.h"

#define EXOSITE_HOSTNAME "m2.exosite.com:443"
#define EXOSITE_CIK_TYPE "X-Exosite-CIK"
#define EXOSITE_CONTENT_TYPE "application/x-www-form-urlencoded; charset=utf-8"
#define EXOSITE_URI "/onep:v1/stack/alias"

#define MIN_FIELD_LEN (32)

typedef struct Exosite_Struct {
    TLS_Handle tls;
    HTTPCli_Struct cli;
    HTTPCli_Field fields[4];
} Exosite_Struct;

/*
 *  ======== Exosite_connect ========
 */
Exosite_Handle Exosite_connect(const char *cik, char *certDir)
{
    int ret;
    struct sockaddr_in addr;
    Exosite_Struct *exo;
    HTTPCli_Params httpParams;

    if (!cik || !certDir) {
        goto connectErr;
    }

    exo = (Exosite_Struct *) calloc(sizeof(Exosite_Struct), 1);
    if (!exo) {
        goto connectErr;
    }

    exo->fields[0].name = HTTPStd_FIELD_NAME_HOST;
    exo->fields[0].value = EXOSITE_HOSTNAME;
    exo->fields[1].name = EXOSITE_CIK_TYPE;
    exo->fields[1].value = cik;
    exo->fields[2].name = HTTPStd_FIELD_NAME_CONTENT_TYPE;
    exo->fields[2].value = EXOSITE_CONTENT_TYPE;
    exo->fields[3].name = NULL;
    exo->fields[3].value = NULL;

    exo->tls = TLS_create(TLS_METHOD_CLIENT_TLSV1_2, NULL, certDir);
    if (!exo->tls) {
        goto connectErr;
    }

    HTTPCli_Params_init(&httpParams);
    httpParams.tls = exo->tls;

    HTTPCli_construct(&(exo->cli));

    HTTPCli_setRequestFields(&(exo->cli), exo->fields);

    ret = HTTPCli_initSockAddr((struct sockaddr *)&addr, EXOSITE_HOSTNAME, 0);
    if (ret < 0) {
        goto connectErr;
    }

    ret = HTTPCli_connect(&(exo->cli), (struct sockaddr *)&addr, 0,
            &httpParams);
    if (ret < 0) {
        goto connectErr;
    }

    return ((Exosite_Handle)exo);

connectErr:
    if (exo) {
        if (exo->tls) {
            TLS_delete(&(exo->tls));
        }
        free(exo);
    }

    return (NULL);
}

/*
 *  ======== Exosite_disconnect ========
 */
void Exosite_disconnect(Exosite_Handle *exo)
{
    HTTPCli_disconnect(&((*exo)->cli));
    HTTPCli_destruct(&((*exo)->cli));
    TLS_delete((*exo)->tls);
    free(*exo);
    exo = NULL;
}

/*
 *  ======== Exosite_send ========
 */
int Exosite_send(Exosite_Handle exo, char *data, int len)
{
    int ret;
    int status;
    char fieldData[MIN_FIELD_LEN];
    bool moreFlag;

    snprintf(fieldData, sizeof(fieldData), "%d", len);

    ret = HTTPCli_sendRequest(&(exo->cli), HTTPStd_POST, EXOSITE_URI,
            true);
    if (ret < 0) {
        goto sendErr;
    }

    ret = HTTPCli_sendField(&(exo->cli), HTTPStd_FIELD_NAME_CONTENT_LENGTH,
            fieldData, true);
    if (ret < 0) {
        goto sendErr;
    }

    ret = HTTPCli_sendRequestBody(&(exo->cli), data, len);
    if (ret < 0) {
        goto sendErr;
    }

    status = HTTPCli_getResponseStatus(&(exo->cli));
    if (status < 0) {
        ret = -1;
        goto sendErr;
    }

    ret = HTTPCli_getResponseField(&(exo->cli), fieldData, sizeof(fieldData),
            &moreFlag);
    if (ret != HTTPCli_FIELD_ID_END) {
        goto sendErr;
    }

    if (status != HTTPStd_NO_CONTENT) {
        ret = -2;
        goto sendErr;
    }

    return (0);

sendErr:
    return (ret);
}
