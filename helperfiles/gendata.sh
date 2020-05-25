mgeneratejs heavyschema.json -n 5000 > ..//heavyimport.json
mongoimport --host localhost:27017 -d mongo44 -c customers_heavy ../heavyimport.json --drop