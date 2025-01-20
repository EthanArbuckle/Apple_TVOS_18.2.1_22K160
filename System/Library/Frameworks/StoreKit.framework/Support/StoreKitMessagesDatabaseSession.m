@interface StoreKitMessagesDatabaseSession
- (BOOL)bundleIDHasMessagesForUserID:(id)a3 bundleID:(id)a4;
- (SQLiteConnection)connection;
- (StoreKitMessagesDatabaseSession)initWithConnection:(id)a3;
- (id)bundleIDsWithMessagesForUserID:(id)a3;
- (id)bundleIDsWithMessagesInBundleIDs:(id)a3 accountID:(id)a4;
- (id)messageForUserID:(id)a3 inApp:(id)a4 messageType:(id)a5;
- (id)revocationsForUserID:(id)a3 inApp:(id)a4;
@end

@implementation StoreKitMessagesDatabaseSession

- (StoreKitMessagesDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___StoreKitMessagesDatabaseSession;
  v6 = -[StoreKitMessagesDatabaseSession init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)messageForUserID:(id)a3 inApp:(id)a4 messageType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v22 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"dsid",  [v7 longLongValue]));
  v32[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v8));
  v32[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  v14 = -[NSMutableArray initWithArray:](v10, "initWithArray:", v13);

  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"message_type",  [v9 longLongValue]));
    -[NSMutableArray addObject:](v14, "addObject:", v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));
  v31[0] = @"dsid";
  v31[1] = @"bundle_id";
  v31[2] = @"status";
  v31[3] = @"allow_developer_control";
  v31[4] = @"message_type";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 5LL));
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10006FFF4;
  v29 = sub_100070004;
  id v30 = 0LL;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___StoreKitMessagesDatabaseEntity,  "queryOnConnection:predicate:",  v18,  v16));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10007000C;
  v24[3] = &unk_1002E8038;
  v24[4] = &v25;
  [v19 enumeratePersistentIDsAndProperties:v17 usingBlock:v24];
  id v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v20;
}

- (id)revocationsForUserID:(id)a3 inApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"dsid",  [v6 longLongValue]));
  v30[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v7));
  v30[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  v29 = @"product_id";
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10006FFF4;
  uint64_t v27 = sub_100070004;
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___StoreKitRevocationsDatabaseEntity,  "queryOnConnection:predicate:",  v13,  v11));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000703F4;
  v19[3] = &unk_1002E9D58;
  id v15 = v6;
  id v20 = v15;
  id v16 = v7;
  id v21 = v16;
  v22 = &v23;
  [v14 enumeratePersistentIDsAndProperties:v12 usingBlock:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (id)bundleIDsWithMessagesForUserID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10006FFF4;
  id v16 = sub_100070004;
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"dsid",  [v4 longLongValue]));
  v18 = @"bundle_id";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___StoreKitMessagesDatabaseEntity,  "queryOnConnection:predicate:",  v7,  v5));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100070650;
  v11[3] = &unk_1002E8038;
  v11[4] = &v12;
  [v8 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v13[5] allObjects]);

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)bundleIDHasMessagesForUserID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"dsid",  [v6 longLongValue]));
  v22[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v7));
  v22[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v21 = @"bundle_id";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___StoreKitMessagesDatabaseEntity,  "queryOnConnection:predicate:",  v13,  v11));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000708E0;
  v16[3] = &unk_1002E8038;
  v16[4] = &v17;
  [v14 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];
  LOBYTE(v13) = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v13;
}

- (id)bundleIDsWithMessagesInBundleIDs:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 count];
    id v9 = &__NSArray0__struct;
    if (v7 && v8)
    {
      uint64_t v19 = 0LL;
      char v20 = &v19;
      uint64_t v21 = 0x3032000000LL;
      v22 = sub_10006FFF4;
      uint64_t v23 = sub_100070004;
      v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"dsid",  [v7 longLongValue]));
      v26[0] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"bundle_id",  v6));
      v26[1] = v11;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

      uint64_t v25 = @"bundle_id";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___StoreKitMessagesDatabaseEntity,  "queryOnConnection:predicate:",  v15,  v13));

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100070B80;
      v18[3] = &unk_1002E8038;
      v18[4] = &v19;
      [v16 enumeratePersistentIDsAndProperties:v14 usingBlock:v18];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v20[5] allObjects]);

      _Block_object_dispose(&v19, 8);
    }
  }

  else
  {
    id v9 = &__NSArray0__struct;
  }

  return v9;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end