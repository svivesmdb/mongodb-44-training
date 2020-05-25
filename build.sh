#docker container stop mongo_44_1 || true
#docker container stop mongo_44_2 || true
#docker container stop mongo_44_3 || true
#docker container rm mongo_44_1 || true
#docker container rm mongo_44_2 || true
#docker container rm mongo_44_3 || true

# docker build . --tag mongo_44 --no-cache
docker build . --tag svives/mongodb-44-training:latest
