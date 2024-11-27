#Build the Docker Image
docker build -t docker-challenge

#Create and Run a Container
docker run -d -p 3000:3000 -e PORT=3000 node

#check application running on 3000
curl http://localhost:3000
