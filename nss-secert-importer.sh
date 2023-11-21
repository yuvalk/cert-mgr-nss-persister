#!/bin/bash -xe

NSS_DB_DIR="${NSS_DB_DIR:-/var/lib/ipsec/nss}"
echo "INFO: nss db dir=$NSS_DB_DIR"

if [ ! -f $NSS_DB_DIR/cert9.db ]
then
	certutil -N -d $NSS_DB_DIR --empty-password
fi

openssl pkcs12 -export -out tls.pfx -inkey /certs/tls.key -in /certs/tls.crt -certfile /certs/ca.crt -password env:TMP_PASS
pk12util -i tls.pfx -d $NSS_DB_DIR -W "$TMP_PASS"
rm tls.pfx
certutil -A -n CA -i /certs/ca.crt -d $NSS_DB_DIR -t "CT,c,c"
