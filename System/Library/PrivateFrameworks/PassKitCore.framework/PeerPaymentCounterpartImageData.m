@interface PeerPaymentCounterpartImageData
+ (id)_commonDictionaryForPeerPaymentCounterpartImageData:(id)a3;
+ (id)_peerPaymentCounterpartImageDataWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForPeerPaymentCounterpartImageData;
+ (id)counterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)peerPaymentCounterpartImageDataForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentCounterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntityForCounterpartImageDataIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentCounterpartImageData)initWithPeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)counterpartImageData;
- (void)updateWithPeerPaymentCounterpartImageData:(id)a3;
@end

@implementation PeerPaymentCounterpartImageData

+ (id)databaseTable
{
  return @"cumin";
}

- (PeerPaymentCounterpartImageData)initWithPeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForPeerPaymentCounterpartImageData:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (void)insertOrUpdatePeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v11]);
  v17[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v14]);
  if (v15)
  {
    id v16 = v15;
    [v15 updateWithPeerPaymentCounterpartImageData:v8];
  }

  else
  {
    id v16 = [objc_alloc((Class)a1) initWithPeerPaymentCounterpartImageData:v8 forPeerPaymentAccountPID:a4 inDatabase:v9];
  }
}

- (void)updateWithPeerPaymentCounterpartImageData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 imageData]);
  char v7 = PKEqualObjects(v5, v6);

  if ((v7 & 1) == 0)
  {
    database = self->super._database;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionArchive anyInDatabase:forCounterpartImageDataIdentifier:]( &OBJC_CLASS___PaymentTransactionArchive,  "anyInDatabase:forCounterpartImageDataIdentifier:",  database,  v10));

    if (v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Counterpart image data has changed, marking as unarchived",  v17,  2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 transactionArchive]);
      [v14 updateArchiveLocationsWithType:0 isArchived:0];
      [v11 updateWithTransactionArchive:v14];
    }
  }

  id v15 = objc_msgSend((id)objc_opt_class(self, v8), "_commonDictionaryForPeerPaymentCounterpartImageData:", v4);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v16);
}

- (BOOL)deleteFromDatabase
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PeerPaymentCounterpartImageData;
  return -[SQLiteEntity deleteFromDatabase](&v4, "deleteFromDatabase");
}

+ (void)deleteEntityForCounterpartImageDataIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)counterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)peerPaymentCounterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 counterpartImageData]);
  return v9;
}

+ (id)peerPaymentCounterpartImageDataForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentCounterpartImageDataWithQuery:v8]);
  return v9;
}

+ (id)_peerPaymentCounterpartImageDataWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentCounterpartImageData]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100308A6C;
  v12[3] = &unk_100639BF0;
  v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableArray copy](v8, "copy");
  return v10;
}

- (id)counterpartImageData
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentCounterpartImageData);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentCounterpartImageData");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100308BC0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_propertySettersForPeerPaymentCounterpartImageData
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100655F60;
  v4[1] = &stru_100655F80;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

+ (id)_commonDictionaryForPeerPaymentCounterpartImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 imageData]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  return v4;
}

@end