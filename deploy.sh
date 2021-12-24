
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build . -t kujiy/ocsp-tester:latest
VERSION=$(docker run -it  kujiy/ocsp-tester:latest openssl version | awk '{print $2}')
echo $VERSION
docker build . -t kujiy/ocsp-tester:$VERSION

docker push  kujiy/ocsp-tester:latest
docker push  kujiy/ocsp-tester:$VERSION
