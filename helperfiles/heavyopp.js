for (var i=0; i < 25000; ++i) {
 
 db.customers_heavy.find({ 'age': { '$gte': ISODate('1990-01-01'), '$lte' : ISODate('2019-12-31') }}).count();
 if (i % 1000 == 0) {
     print('Working... current query : ' + i);
 }
}

db.customers_heavy.find({"_id":{"$ne":i%10}}).count();

// No mirrored reads
db.adminCommand({
    setParameter: 0,
    mirrorReads: {
        samplingRate: 0
    }
 })

// 25% mirrored reads
db.adminCommand({
    setParameter: 1,
    mirrorReads: {
        samplingRate: 0.25
    }
 })
 
// 100% Mirrored reads
 db.adminCommand({
    setParameter: 1,
    mirrorReads: {
        samplingRate: 1
    }
 })
 