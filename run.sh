# retrieve and extract certs
# cert
openssl s_client -connect $DOMAIN:443 -servername $DOMAIN < /dev/null 2>&1 |  sed -n '/-----BEGIN/,/-----END/p' > cert.pem
# intermediate
T=/tmp/i
openssl s_client -showcerts -connect $DOMAIN:443 -servername $DOMAIN < /dev/null 2>&1 |  sed -n '/-----BEGIN/,/-----END/p' > $T
diff -n cert.pem $T | tail -n +2 > chain.pem

OCSP=$(openssl x509 -noout -ocsp_uri -in cert.pem)
OCSP_DOMAIN=$(echo $OCSP | awk -F'/' '{print $3}')
echo OCSP=$OCSP
echo OCSP_DOMAIN=$OCSP_DOMAIN

# ocsp test
openssl ocsp -issuer chain.pem -cert cert.pem  -text -url $OCSP -header "Host=$OCSP_DOMAIN"
