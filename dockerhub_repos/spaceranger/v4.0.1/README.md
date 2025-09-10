docker buildx build --platform=linux/amd64 -t spaceranger -f Dockerfile .
docker tag spaceranger:latest ccrsfifx/spaceranger:4.0.1
docker push ccrsfifx/spaceranger:4.0.1
docker run --platform=linux/amd64 --rm ccrsfifx/spaceranger:4.0.1 spaceranger --version

