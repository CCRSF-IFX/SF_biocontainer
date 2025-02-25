

sudo docker build -t cellranger -f Dockerfile .
docker tag cellranger:latest ccrsfifx/cellranger:9.0.1
docker push ccrsfifx/cellranger:9.0.1
