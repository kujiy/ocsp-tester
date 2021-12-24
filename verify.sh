# retrieve and extract certs
A=all.pem
openssl s_client -showcerts -connect $DOMAIN:443 -servername $DOMAIN < /dev/null 2>&1 |  sed -n '/-----BEGIN/,/-----END/p' > $A

# Extract 
csplit -z -f individual- $A '/-----BEGIN CERTIFICATE-----/' '{*}' > /dev/null

CERT=individual-00
CHAIN=individual-01
ROOT=individual-02

# Show chain status
openssl verify -show_chain -untrusted individual-01 individual-00 

echo

OCSP=$(openssl x509 -noout -ocsp_uri -in $CERT)
OCSP_DOMAIN=$(echo $OCSP | awk -F'/' '{print $3}')
echo OCSP=$OCSP
echo OCSP_DOMAIN=$OCSP_DOMAIN

echo
# ocsp test
openssl ocsp -issuer $CHAIN  -cert $CERT -text -url $OCSP -header "Host=$OCSP_DOMAIN"
