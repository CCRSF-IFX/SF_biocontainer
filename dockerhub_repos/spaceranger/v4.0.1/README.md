
Problem
Space Ranger is built for x86_64 (linux/amd64). On Apple Silicon (arm64), trying to run it in Docker triggers Rosetta errors like:

Solution
Force the Docker build and run to amd64, and make sure PATH is set correctly in the image.

docker buildx build --platform=linux/amd64 -t spaceranger -f Dockerfile .
docker tag spaceranger:latest ccrsfifx/spaceranger:4.0.1
docker push ccrsfifx/spaceranger:4.0.1
docker run --platform=linux/amd64 --rm ccrsfifx/spaceranger:4.0.1 spaceranger --version
