#/bin/bash

TARGET="librechat.example.local"

# Keycloak server private key and certificate request
openssl genrsa -out "${TARGET}.key" 2048
openssl req -new -key "${TARGET}.key" \
  -out "${TARGET}.csr" \
  -subj "/CN=${TARGET}"

# Include the hostname in the certificate's Subject Alternative Name
touch "${TARGET}.ext"

echo "subjectAltName = DNS:${TARGET}" > "${TARGET}.ext"
echo "extendedKeyUsage = serverAuth" > "${TARGET}.ext"
echo "keyUsage = digitalSignature, keyEncipherment" > "${TARGET}.ext"

# Sign the Keycloak certificate with your CA
openssl x509 -req -sha256 -days 825 \
  -in "${TARGET}.csr" \
  -CA local-ca.crt \
  -CAkey local-ca.key \
  -CAcreateserial \
  -out "${TARGET}.crt" \
  -extfile "${TARGET}.ext"

mkdir -p "${TARGET}"

cat "${TARGET}.crt" local-ca.crt > "${TARGET}/fullchain.pem"
cat "${TARGET}.key" > "${TARGET}/privkey.pem"
