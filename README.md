# OCSP test image

## Docker image
https://hub.docker.com/r/kujiy/ocsp-tester

## How to Use

```
DOMAIN=example.com
docker build . -t ocsp
docker run --rm --env DOMAIN=$DOMAIN ocsp
```

$DOMAIN is what you want to verify.

## Execution example
```

# DOMAIN=example.com

# docker build . -t ocsp
...
Successfully tagged ocsp:latest


# docker run --rm --env DOMAIN=$DOMAIN ocsp
OCSP=http://ocsp.digicert.com
OCSP_DOMAIN=ocsp.digicert.com
OCSP Request Data:
    Version: 1 (0x0)
    Requestor List:
        Certificate ID:
          Hash Algorithm: sha1
          Issuer Name Hash: E4E395A229D3D4C1C31FF0980C0B4EC0098AABD8
          Issuer Key Hash: B76BA2EAA8AA848C79EAB4DA0F98B2C59576B9F4
          Serial Number: 025216E1C4998E2632AA5D1DA985B43C
    Request Extensions:
        OCSP Nonce:
            04106DCE8CC3CB0354417C5C25B328BF592E
OCSP Response Data:
    OCSP Response Status: successful (0x0)
    Response Type: Basic OCSP Response
    Version: 1 (0x0)
    Responder Id: B76BA2EAA8AA848C79EAB4DA0F98B2C59576B9F4
    Produced At: Dec 23 09:06:24 2021 GMT
    Responses:
    Certificate ID:
      Hash Algorithm: sha1
      Issuer Name Hash: E4E395A229D3D4C1C31FF0980C0B4EC0098AABD8
      Issuer Key Hash: B76BA2EAA8AA848C79EAB4DA0F98B2C59576B9F4
      Serial Number: 025216E1C4998E2632AA5D1DA985B43C
    Cert Status: good
    This Update: Dec 23 08:51:01 2021 GMT
    Next Update: Dec 30 08:06:01 2021 GMT

    Signature Algorithm: sha256WithRSAEncryption
         6f:89:WARNING: no nonce in response
Response verify OK
f3:17:ec:1a:0f:55:2b:4d:a4:be:36:cf:4b:33:1b:ed:
         cc:f5:1e:1e:26:ad:7b:ca:c1:c7:b6:8c:2b:ec:34:c4:3a:56:
         00:b1:fe:f2:ce:ce:74:03:0f:9f:f6:6f:b8:4b:93:99:a2:a9:
         61:fc:ae:20:6f:10:40:38:d5:93:4e:9e:9b:3d:85:3d:5c:2d:
         1e:ee:ea:5c:ab:28:b6:fc:5d:b3:d6:ff:61:c0:ec:09:60:57:
         0c:b6:0d:37:f8:43:5c:3b:6a:97:d3:fd:87:98:a5:27:1d:59:
         92:69:95:8d:9c:f9:0a:83:1c:28:64:a5:68:95:14:50:e8:1e:
         36:ad:a7:8e:9c:cb:fe:1f:ce:e4:0e:0c:c8:6d:82:0e:49:a0:
         73:1e:46:94:36:3b:10:e9:71:31:3b:05:70:91:f1:13:bf:b1:
         ce:b9:4a:d7:87:b0:10:d7:39:d5:18:1a:61:e3:8d:5e:12:de:
         a0:64:3f:49:62:62:38:e8:ec:d7:52:9b:0c:99:b2:50:d6:fd:
         f1:14:aa:68:67:b9:bc:01:b9:17:02:31:24:90:e4:ef:85:33:
         5e:33:f2:82:ff:c8:fd:68:45:3d:51:2f:9b:1f:d6:2c:8e:69:
         1d:1a:5d:b9:23:81:02:00:f4:15:3a:61:7c:fa:57:a0:94:71:
         ac:4a:95:d8
cert.pem: good
	This Update: Dec 23 08:51:01 2021 GMT
	Next Update: Dec 30 08:06:01 2021 GMT
```


