if command -v docker &>/dev/null; then
    echo "✅  Docker is installed!"
else
    echo "🛑  Docker desktop is not installed, download it from: https://docs.docker.com/docker-for-mac/install/"
    exit
fi

# Create the internal network where each cluster sees each other
docker network create mongo-sa-44-cluster || true

# Spin-up three containers 
echo "Spinning containers up, if all goes fine you should see their 3 ids popping up below"
docker run \
    -d \
    -p 30011:27017 \
    --name mongo_44_1 \
    --net mongo-sa-44-cluster \
    mongo_44 \
    mongod --replSet replicaset44 --bind_ip_all

docker run \
    -d \
    -p 30012:27017 \
    --name mongo_44_2 \
    --net mongo-sa-44-cluster \
    mongo_44 \
    mongod --replSet replicaset44 --bind_ip_all

docker run \
    -d \
    -p 30013:27017 \
    --name mongo_44_3 \
    --net mongo-sa-44-cluster \
    mongo_44 \
    mongod --replSet replicaset44 --bind_ip_all

echo "Sleeping for 30 seconds to wait for containers to start-up"
sleep 30

docker exec mongo_44_1 mongo localhost:27017/admin rsstart.js

echo "Sleeping for 60 seconds to wait for the replicaset to be configured with the docker containers"
sleep 60

# Import the customers database
echo "Importing some sample data into MongoDB"
docker exec mongo_44_1 mongoimport --host localhost:27017 -d mongo44 -c customers_heavy heavyimport.json
