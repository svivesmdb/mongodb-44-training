
docker run \
    -p 30014:27017 \
    --name mongo_44_4 \
    --net mongo-sa-44-cluster \
    mongo_44 \
    mongod --replSet replicaset44 --bind_ip_all &



docker run \
    -p 30015:27017 \
    --name mongo_44_5 \
    --net mongo-sa-44-cluster \
    mongo_44 \
    mongod --replSet replicaset44 --bind_ip_all &


