# Version 10.0.0

sudo docker build --platform=linux/amd64 -t cellranger -f Dockerfile .
docker tag cellranger:latest ccrsfifx/cellranger:10.0.0
docker push ccrsfifx/cellranger:10.0.0
