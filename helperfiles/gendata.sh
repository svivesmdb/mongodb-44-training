mgeneratejs heavyschema.json -n 300 > heavyimport.json
mongoimport --host localhost:27017 -d mongo44 -c customers_heavy heavyimport.json --drop
#mongodump --archive=customers_heavy --gzip --db=mongo44
