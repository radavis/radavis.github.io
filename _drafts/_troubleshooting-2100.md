git clone https://github.com/18F/cms-hitech-apd.git
cd cms-hitech-apd
git checkout 2100-operation-cookie-crumble
docker compose build
cd api
./endpoint-tests/endpoint.sh
