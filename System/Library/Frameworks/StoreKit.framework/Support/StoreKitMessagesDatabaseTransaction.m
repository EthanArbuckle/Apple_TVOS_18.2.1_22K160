@interface StoreKitMessagesDatabaseTransaction
- (BOOL)addMessageInfo:(id)a3 withError:(id *)a4;
- (BOOL)addRevocationInfo:(id)a3;
- (BOOL)removeMessageInfoForUser:(id)a3 inApp:(id)a4 type:(int64_t)a5 withError:(id *)a6;
- (BOOL)removeRevocationInfoForUser:(id)a3 inApp:(id)a4;
@end

@implementation StoreKitMessagesDatabaseTransaction

- (BOOL)addMessageInfo:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, @"dsid");

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"bundle_id");

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 status]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"status");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 allowDeveloperControl]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v10,  @"allow_developer_control");

  id v11 = [v5 type];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"message_type");

  v13 = objc_alloc(&OBJC_CLASS___StoreKitMessagesDatabaseEntity);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  v15 = -[SQLiteEntity initWithPropertyValues:onConnection:](v13, "initWithPropertyValues:onConnection:", v6, v14);

  LOBYTE(v14) = -[SQLiteEntity existsInDatabase](v15, "existsInDatabase");
  return (char)v14;
}

- (BOOL)removeMessageInfoForUser:(id)a3 inApp:(id)a4 type:(int64_t)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100053B34;
  v18[3] = &unk_1002E92B0;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a6) = objc_msgSend( v13,  "executeStatement:error:bindings:",  @"DELETE FROM storekit_messages WHERE dsid = ? AND bundle_id = ? AND message_type = ?;",
                                  a6,
                                  v18);

  return (char)a6;
}

- (BOOL)addRevocationInfo:(id)a3
{
  v13[0] = @"dsid";
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userID]);
  v14[0] = v5;
  v13[1] = @"bundle_id";
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  v14[1] = v6;
  v13[2] = @"product_id";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 productID]);

  v14[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));

  v9 = objc_alloc(&OBJC_CLASS___StoreKitRevocationsDatabaseEntity);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  id v11 = -[SQLiteEntity initWithPropertyValues:onConnection:](v9, "initWithPropertyValues:onConnection:", v8, v10);

  LOBYTE(v10) = -[SQLiteEntity existsInDatabase](v11, "existsInDatabase");
  return (char)v10;
}

- (BOOL)removeRevocationInfoForUser:(id)a3 inApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitMessagesDatabaseSession connection](self, "connection"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100053DB0;
  v12[3] = &unk_1002E6C38;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  LOBYTE(v7) = objc_msgSend( v8,  "executeStatement:error:bindings:",  @"DELETE FROM storekit_revocations WHERE dsid = ? AND bundle_id = ?;",
                                  0LL,
                                  v12);

  return (char)v7;
}

@end