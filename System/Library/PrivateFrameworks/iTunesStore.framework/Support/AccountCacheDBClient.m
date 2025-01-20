@interface AccountCacheDBClient
- (AccountCacheDBClient)init;
- (id)_databasePath;
- (id)dSIDForAppleID:(id)a3;
@end

@implementation AccountCacheDBClient

- (AccountCacheDBClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AccountCacheDBClient;
  v2 = -[AccountCacheDBClient init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountCacheDBClient _databasePath](v2, "_databasePath"));
    v5 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:]( objc_alloc(&OBJC_CLASS___SSSQLiteDatabase),  "initWithDatabaseURL:readOnly:protectionType:",  v4,  1LL,  NSFileProtectionCompleteUntilFirstUserAuthentication);
    database = v3->_database;
    v3->_database = v5;
  }

  return v3;
}

- (id)dSIDForAppleID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT dsid FROM account WHERE apple_id = '%@'",  a3));
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  database = self->_database;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100021C70;
  v10[3] = &unk_10034B380;
  v10[4] = self;
  v7 = v5;
  v11 = v7;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:]( database,  "prepareStatementForSQL:cache:usingBlock:",  v4,  0LL,  v10);
  if (-[NSMutableArray count](v7, "count")) {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v7, "firstObject"));
  }
  else {
    objc_super v8 = 0LL;
  }

  return v8;
}

- (id)_databasePath
{
  v2 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  CPSharedResourcesDirectory(),  @"Library",  @"MusicLibrary",  @"AccountCache.sqlitedb",  0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 0LL));

  return v4;
}

- (void).cxx_destruct
{
}

@end