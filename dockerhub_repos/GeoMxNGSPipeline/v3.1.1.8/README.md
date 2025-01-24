

1. Go to: 

https://nanostring.app.box.com/v/GeoMxNGSPipeline

2. Download `GeoMxNGSPipeline_Linux_3.1.1.8.zip`

3. Unzip the zip file

4. Build docker image

```
docker build -t geomxngspipeline -f Dockerfile .
```

5. Tag the image

```
docker tag geomxngspipeline:latest ccrsfifx/geomxngspipeline:3.1.1.8
```

6. Push the image to dockerhub 


7. Analyze test datasets 

```
docker run -w "${PWD}" -v "${PWD}:${PWD}" geomxngspipeline:latest bash GeoMx-test.sh
```
