

sudo docker build -t cellranger -f Dockerfile .
docker tag cellranger:latest ccrsfifx/cellranger:8.0.1
docker push ccrsfifx/cellranger:8.0.1
