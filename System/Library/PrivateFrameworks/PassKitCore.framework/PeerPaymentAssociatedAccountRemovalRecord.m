@interface PeerPaymentAssociatedAccountRemovalRecord
+ (id)_peerPaymentAssociatedAccountRemovalRecordWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAssociatedAccountRemovalRecord;
+ (id)associatedAccountRemovalRecordsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertAssociatedAccountRemovalRecords:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentAssociatedAccountRemovalRecord)initWithPreviousAccountUser:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)associatedAccountRemovalRecord;
@end

@implementation PeerPaymentAssociatedAccountRemovalRecord

+ (id)databaseTable
{
  return @"peer_payment_associated_account_removal_record";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentAccount, a2) == a3) {
    return @"peer_payment_account_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertAssociatedAccountRemovalRecords:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend( v17,  "initWithPreviousAccountUser:forPeerPaymentAccountPID:inDatabase:",  v16,  a4,  v9,  (void)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 associatedAccountRemovalRecord]);

        if (v19) {
          [v10 addObject:v19];
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  id v20 = [v10 copy];
  return v20;
}

+ (void)deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)associatedAccountRemovalRecordsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentAssociatedAccountRemovalRecordWithQuery:v8]);
  return v9;
}

- (PeerPaymentAssociatedAccountRemovalRecord)initWithPreviousAccountUser:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"peer_payment_account_pid");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v12, @"alt_dsid");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v9 reason], @"reason");
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
  uint64_t v14 = (void *)_SQLValueForDate(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v14, @"date");

  id v15 = [v9 hasPresentedNotification];
  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", v15, @"has_presented_notification");
  uint64_t v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v16;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account_pid",  v3));

  return v4;
}

- (id)associatedAccountRemovalRecord
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAssociatedAccountRemovalRecord);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentAssociatedAccountRemovalRecord");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10016C00C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_peerPaymentAssociatedAccountRemovalRecordWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentAssociatedAccountRemovalRecord]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10016C154;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableSet copy](v8, "copy");
  return v10;
}

+ (id)_propertySettersForPeerPaymentAssociatedAccountRemovalRecord
{
  v3[0] = @"alt_dsid";
  v3[1] = @"reason";
  v4[0] = &stru_1006472B8;
  v4[1] = &stru_1006472D8;
  v3[2] = @"date";
  v3[3] = @"has_presented_notification";
  v4[2] = &stru_1006472F8;
  v4[3] = &stru_100647318;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end