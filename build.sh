docker stop tmptest
docker rm tmptest
docker build -t test_container .
docker run -d -it --name tmptest --mount type=tmpfs,destination=/tmp test_container
