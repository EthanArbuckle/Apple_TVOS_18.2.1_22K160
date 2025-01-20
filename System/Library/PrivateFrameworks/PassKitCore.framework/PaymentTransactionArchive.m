@interface PaymentTransactionArchive
+ (id)_archivesForQuery:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForCounterpartImageDataIdentifier:(id)a3;
+ (id)_predicateForCounterpartImageDataPID:(int64_t)a3;
+ (id)_predicateForIsArchived:(BOOL)a3;
+ (id)_predicateForLocationType:(unint64_t)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForRecurringPaymentIdentifier:(id)a3;
+ (id)_predicateForRecurringPaymentPID:(int64_t)a3;
+ (id)_predicateForTransactionIdentifier:(id)a3;
+ (id)_predicateForTransactionPID:(int64_t)a3;
+ (id)_propertySettersForTransactionArchive;
+ (id)anyInDatabase:(id)a3 forCounterpartImageDataIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 forRecurringPaymentIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 forTransaction:(id)a4;
+ (id)anyInDatabase:(id)a3 forTransactionIdentifier:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertArchiveForCounterpartImageData:(id)a3 inDatabase:(id)a4;
+ (id)insertArchiveForRecurringPayment:(id)a3 inDatabase:(id)a4;
+ (id)insertTransactionArchiveForTransaction:(id)a3 inDatabase:(id)a4;
+ (id)transactionArchivesWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 inDatabase:(id)a5;
+ (id)transactionArchivesWithType:(unint64_t)a3 isArchived:(BOOL)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteArchiveForCounterpartImageDataPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveForRecurringPaymentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentTransactionArchive)initWithCounterpartImageData:(id)a3 inDatabase:(id)a4;
- (PaymentTransactionArchive)initWithRecurringPayment:(id)a3 inDatabase:(id)a4;
- (PaymentTransactionArchive)initWithTransaction:(id)a3 inDatabase:(id)a4;
- (id)transactionArchive;
- (void)updateWithTransactionArchive:(id)a3;
@end

@implementation PaymentTransactionArchive

+ (id)databaseTable
{
  return @"payment_transaction_archive";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"payment_transaction_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentRecurringPayment, v4) == a3) {
    return @"bokchoy_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentCounterpartImageData, v5) == a3) {
    return @"cumin_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v25 = v7;
  if (v7 == @"payment_transaction.identifier") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = -[__CFString isEqualToString:]( v7,  "isEqualToString:",  @"payment_transaction.identifier");

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = @"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_archive.payment_transaction_pid";
LABEL_5:
      [v6 addObject:v9];
      goto LABEL_6;
    }

    v10 = v25;
    if (v10 == @"bokchoy.a"
      || (v11 = v10,
          unsigned __int8 v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"bokchoy.a"),
          v11,
          (v12 & 1) != 0))
    {
      v9 = @"JOIN bokchoy ON bokchoy.pid = payment_transaction_archive.bokchoy_pid";
      goto LABEL_5;
    }

    v13 = v11;
    if (v13 == @"cumin.b"
      || (v14 = v13,
          unsigned __int8 v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", @"cumin.b"),
          v14,
          (v15 & 1) != 0))
    {
      v9 = @"JOIN cumin ON cumin.pid = payment_transaction_archive.cumin_pid";
      goto LABEL_5;
    }

    v16 = v14;
    if (v16 == @"payment_transaction_archive_location.cloud_store_zone_pid") {
      goto LABEL_19;
    }
    v17 = v16;
    unsigned __int8 v18 = [@"payment_transaction_archive_location.cloud_store_zone_pid" isEqualToString:v16];

    if ((v18 & 1) != 0) {
      goto LABEL_19;
    }
    v19 = v17;
    if (v19 == @"payment_transaction_archive_location.archived"
      || (v20 = v19,
          unsigned __int8 v21 = [@"payment_transaction_archive_location.archived" isEqualToString:v19],  v20,  (v21 & 1) != 0)
      || (v22 = v20, v22 == @"payment_transaction_archive_location.type")
      || (v23 = v22,
          unsigned int v24 = [@"payment_transaction_archive_location.type" isEqualToString:v22],
          v23,
          v24))
    {
LABEL_19:
      v9 = @"JOIN payment_transaction_archive_location ON payment_transaction_archive_location.archive_pid = payment_transaction_archive.pid";
      goto LABEL_5;
    }
  }

+ (id)insertTransactionArchiveForTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithTransaction:inDatabase:", v7, v6);

  return v9;
}

- (PaymentTransactionArchive)initWithTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"payment_transaction_pid");

  id v11 = -[NSMutableDictionary copy](v8, "copy");
  unsigned __int8 v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v6);

  v13 = v12;
  return v13;
}

+ (id)insertArchiveForRecurringPayment:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithRecurringPayment:inDatabase:", v7, v6);

  return v9;
}

- (PaymentTransactionArchive)initWithRecurringPayment:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"bokchoy_pid");

  id v11 = -[NSMutableDictionary copy](v8, "copy");
  unsigned __int8 v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v6);

  v13 = v12;
  return v13;
}

+ (id)insertArchiveForCounterpartImageData:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithCounterpartImageData:inDatabase:", v7, v6);

  return v9;
}

- (PaymentTransactionArchive)initWithCounterpartImageData:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"cumin_pid");

  id v11 = -[NSMutableDictionary copy](v8, "copy");
  unsigned __int8 v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v6);

  v13 = v12;
  return v13;
}

- (void)updateWithTransactionArchive:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    +[PaymentTransactionArchiveLocation deleteArchiveLocationsForArchivePID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "deleteArchiveLocationsForArchivePID:inDatabase:",  v5,  v6);

    id v10 = (id)objc_claimAutoreleasedReturnValue([v4 locations]);
    int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v9 =  +[PaymentTransactionArchiveLocation insertOrUpdateTransactionArchiveLocations:forArchivePID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "insertOrUpdateTransactionArchiveLocations:forArchivePID:inDatabase:",  v10,  v7,  v8);
  }

+ (id)_predicateForTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_predicateForTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction.identifier",  a3);
}

+ (id)_predicateForRecurringPaymentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bokchoy.a",  a3);
}

+ (id)_predicateForRecurringPaymentPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bokchoy_pid",  v3));

  return v4;
}

+ (id)_predicateForCounterpartImageDataIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cumin.b",  a3);
}

+ (id)_predicateForCounterpartImageDataPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cumin_pid",  v3));

  return v4;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_archive_location.cloud_store_zone_pid",  v3));

  return v4;
}

+ (id)_predicateForIsArchived:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_archive_location.archived",  v3));

  return v4;
}

+ (id)_predicateForLocationType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_archive_location.type",  v3));

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a3);
}

+ (void)deleteArchiveForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveForRecurringPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForRecurringPaymentPID:a3]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveForCounterpartImageDataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCounterpartImageDataPID:a3]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionArchiveLocation deleteArchiveLocationsForArchivePID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "deleteArchiveLocationsForArchivePID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PaymentTransactionArchive;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)anyInDatabase:(id)a3 forTransaction:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForTransactionPID:", objc_msgSend(a4, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 forTransactionIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 forRecurringPaymentIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecurringPaymentIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 forCounterpartImageDataIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCounterpartImageDataIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)transactionArchivesWithType:(unint64_t)a3 isArchived:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT DISTINCT payment_transaction_archive.pid FROM payment_transaction_archive, payment_transaction_archive_location WHERE payment_transaction_archive.pid = payment_transaction_archive_location.archive_pid AND type = %ld AND archived = %ld",  a3,  v5));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002BC458;
  v14[3] = &unk_1006452B8;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v17 = a1;
  id v15 = v8;
  id v10 = v16;
  id v11 = v8;
  sub_1002CCDBC((uint64_t)v11, v9, v14);
  id v12 = -[NSMutableSet copy](v10, "copy");

  return v12;
}

+ (id)transactionArchivesWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v9,  v8));
  id v11 = v10;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForCloudStoreZonePID:", objc_msgSend(v10, "persistentID")));
    v22[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocationType:0]);
    v22[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIsArchived:v6]);
    v22[2] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 3LL));
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

    id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v16]);
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _archivesForQuery:v17]);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
      *(_DWORD *)buf = 138543362;
      unsigned int v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error: no cloud store in local database for %{public}@",  buf,  0xCu);
    }

    unsigned __int8 v18 = 0LL;
  }

  return v18;
}

- (id)transactionArchive
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionArchive);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionArchive _propertySettersForTransactionArchive]( &OBJC_CLASS___PaymentTransactionArchive,  "_propertySettersForTransactionArchive"));
  v30 = @"payment_transaction.identifier";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1002BC9C8;
  v25[3] = &unk_100638EF0;
  v25[4] = self;
  id v6 = v4;
  id v26 = v6;
  int64_t v7 = v3;
  v27 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v25);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionArchive identifier](v7, "identifier"));
  id v9 = [v8 length];

  if (!v9)
  {
    v29 = @"bokchoy.a";
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1002BCA20;
    void v22[3] = &unk_100638EF0;
    v22[4] = self;
    id v23 = v6;
    unsigned int v24 = v7;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v10, v22);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionArchive identifier](v7, "identifier"));
  id v12 = [v11 length];

  if (!v12)
  {
    v28 = @"cumin.b";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1002BCA78;
    v19[3] = &unk_100638EF0;
    v19[4] = self;
    id v20 = v6;
    unsigned __int8 v21 = v7;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v13, v19);
  }

  int64_t v14 = -[SQLiteEntity persistentID](self, "persistentID");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionArchiveLocation transactionArchiveLocationsForArchivePID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "transactionArchiveLocationsForArchivePID:inDatabase:",  v14,  v15));

  -[PKPaymentTransactionArchive setLocations:](v7, "setLocations:", v16);
  id v17 = v7;

  return v17;
}

+ (id)_archivesForQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002BCBA0;
  v7[3] = &unk_100639BF0;
  id v10 = a1;
  id v8 = a3;
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsAndProperties:0 usingBlock:v7];
  if (-[NSMutableSet count](v3, "count")) {
    id v5 = -[NSMutableSet copy](v3, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_propertySettersForTransactionArchive
{
  v3[0] = @"payment_transaction.identifier";
  v3[1] = @"bokchoy.a";
  v4[0] = &stru_100652B50;
  v4[1] = &stru_100652B70;
  v3[2] = @"cumin.b";
  v4[2] = &stru_100652B90;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end