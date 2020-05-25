for (var i=0; i < 50000; ++i) {
    db.customers_heavy.find({ 'age': { '$gte': ISODate('1990-01-01'), '$lte' : ISODate('2019-12-31') }}).count();
    if (i % 1000 == 0) {print('Working... current query : ' + i);}
}