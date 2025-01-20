@interface TransactionSource
+ (id)_predicateForAccountPersistentID:(int64_t)a3;
+ (id)_predicateForAccountUserPersistentID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3;
+ (id)_predicateForPeerPaymentAccountPersistentID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertTransactionSourceWithType:(unint64_t)a3 inDatabase:(id)a4;
+ (id)transactionSourceIdentifiersInDatabase:(id)a3 ofType:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateTransactionSourcesToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forAccount:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forAccountUser:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPeerPaymentAccount:(id)a4;
+ (void)updateTransactionSourceIdentifier:(id)a3 toNewTransactionSourceIdentifier:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TransactionSource)initWithTransactionSourceType:(unint64_t)a3 inDatabase:(id)a4;
- (id)_commonDictionary;
- (id)identifier;
- (unint64_t)type;
@end

@implementation TransactionSource

+ (id)databaseTable
{
  return @"transaction_source";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v19 = v7;
  if (v7 == @"payment_application.pid") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = [@"payment_application.pid" isEqualToString:v7];

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = @"JOIN payment_application ON payment_application.transaction_source_pid = transaction_source.pid";
LABEL_5:
      [v6 addObject:v9];
      goto LABEL_6;
    }

    v10 = v19;
    if (v10 == @"peer_payment_account.pid"
      || (v11 = v10,
          unsigned __int8 v12 = [@"peer_payment_account.pid" isEqualToString:v10],
          v11,
          (v12 & 1) != 0))
    {
      v9 = @"JOIN peer_payment_account ON peer_payment_account.transaction_source_pid = transaction_source.pid";
      goto LABEL_5;
    }

    v13 = v11;
    if (v13 == @"gooseberry.pid"
      || (v14 = v13,
          unsigned __int8 v15 = [@"gooseberry.pid" isEqualToString:v13],
          v14,
          (v15 & 1) != 0))
    {
      v9 = @"JOIN gooseberry ON gooseberry.transaction_source_pid = transaction_source.pid";
      goto LABEL_5;
    }

    v16 = v14;
    if (v16 == @"pears.pid"
      || (v17 = v16,
          unsigned int v18 = [@"pears.pid" isEqualToString:v16],
          v17,
          v18))
    {
      v9 = @"JOIN pears ON pears.transaction_source_pid = transaction_source.pid";
      goto LABEL_5;
    }
  }

- (TransactionSource)initWithTransactionSourceType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransactionSource _commonDictionary](self, "_commonDictionary"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v7 setObjectOrNull:v8 forKey:@"type"];

  v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v7, v6);
  return v9;
}

+ (id)insertTransactionSourceWithType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithTransactionSourceType:a3 inDatabase:v6];

  return v7;
}

- (id)_commonDictionary
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v2, "setObjectOrNull:forKey:", v4, @"identifier");
  return v2;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:a4]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)transactionSourceIdentifiersInDatabase:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a4]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"identifier";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100066080;
  v14[3] = &unk_10063C0D0;
  unsigned __int8 v15 = v9;
  v11 = v9;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v14];

  id v12 = -[NSMutableSet copy](v11, "copy");
  return v12;
}

+ (void)associateTransactionSourcesToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPIDs:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransactionSource,  "queryWithDatabase:predicate:",  v7,  v9));

  v17 = @"identifier";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100066248;
  v14[3] = &unk_100639E18;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];
}

+ (void)updateTransactionSourceIdentifier:(id)a3 toNewTransactionSourceIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 withIdentifier:v8]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 withIdentifier:v9]);
  if (!v8 || !v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138413058;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      v31 = v11;
      v19 = "A transaction source does not exist for newTransactionSourceIdentifier %@, %@ or oldTransactionSourceIdentifier %@, %@";
      v20 = v18;
      uint32_t v21 = 42;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, v21);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  id v13 = [v11 type];
  if (v13 != [v12 type])
  {
    uint64_t v22 = PKLogFacilityTypeGetObject(6LL);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      v19 = "The new and old transaction source types do not match";
LABEL_14:
      v20 = v18;
      uint32_t v21 = 2;
      goto LABEL_15;
    }

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPaymentApplicationPersistentID:", objc_msgSend(a4, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPeerPaymentAccountPersistentID:", objc_msgSend(a4, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAccountUser:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAccountUserPersistentID:", objc_msgSend(a4, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAccountPersistentID:", objc_msgSend(a4, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransaction deleteEntitiesForTransactionSource:inDatabase:]( &OBJC_CLASS___PaymentTransaction,  "deleteEntitiesForTransactionSource:inDatabase:",  self,  v3);

  int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreRecordFetchTask deleteAllEntriesForTransactionSourcePID:inDatabase:]( &OBJC_CLASS___CloudStoreRecordFetchTask,  "deleteAllEntriesForTransactionSourcePID:inDatabase:",  v4,  v5);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TransactionSource;
  return -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3
{
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.pid",  v4));
  v10[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:0]);
  v10[1] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  return v8;
}

+ (id)_predicateForPeerPaymentAccountPersistentID:(int64_t)a3
{
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account.pid",  v4));
  v10[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:1]);
  v10[1] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  return v8;
}

+ (id)_predicateForAccountUserPersistentID:(int64_t)a3
{
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"gooseberry.pid",  v4));
  v10[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:2]);
  v10[1] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  return v8;
}

+ (id)_predicateForAccountPersistentID:(int64_t)a3
{
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pears.pid",  v4));
  v10[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:3]);
  v10[1] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  return v8;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a3);
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (unint64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

@end