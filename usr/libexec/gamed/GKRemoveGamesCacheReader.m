@interface GKRemoveGamesCacheReader
+ (id)readerWithDatabaseConnection:(id)a3 bundleID:(id)a4;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKRemoveGamesCacheReader)initWithDatabaseConnection:(id)a3 bundleID:(id)a4;
- (NSString)bundleID;
- (id)getAllRemoveGamesRequestIDsStatement;
- (id)getRemoveGamesDescriptorsStatement;
- (id)removeGamesForExecutedStatement:(sqlite3_stmt *)a3;
- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4 bundleID:(id)a5;
- (void)readResources:(id)a3 handler:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation GKRemoveGamesCacheReader

+ (id)readerWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = -[GKRemoveGamesCacheReader initWithDatabaseConnection:bundleID:]( objc_alloc(&OBJC_CLASS___GKRemoveGamesCacheReader),  "initWithDatabaseConnection:bundleID:",  v5,  v6);

  return v7;
}

- (GKRemoveGamesCacheReader)initWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKRemoveGamesCacheReader;
  v8 = -[GKRemoveGamesCacheReader init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKRemoveGamesCacheReader setConnection:](v8, "setConnection:", v6);
    -[GKRemoveGamesCacheReader setBundleID:](v9, "setBundleID:", v7);
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)getRemoveGamesDescriptorsStatement
{
  id v2 = sub_1000AC284((uint64_t)off_100270670);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT %@     FROM requests     INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;",
                   v3,
                   ":player_gcid"));

  return v4;
}

- (id)getAllRemoveGamesRequestIDsStatement
{
  id v2 = sub_1000AC3D0(&off_100270690);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT %@     FROM requests INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;",
                   v3,
                   ":player_gcid"));

  return v4;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4 bundleID:(id)a5
{
  v8 = (NSString *)a4;
  id v7 = (NSString *)a5;
  GKBindParam(a3, ":player_gcid", v8);
  GKBindParam(a3, ":bundle_id", v7);
}

- (id)removeGamesForExecutedStatement:(sqlite3_stmt *)a3
{
  v10 = a3;
  v4 = sub_1000AC5D8(&v10);
  sqlite3_int64 v5 = sqlite3_column_int64(a3, 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"bundle-id",  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  @"game",  v7,  @"timestamp",  0LL));

  return v8;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKRemoveGamesCacheReader.mm",  101LL,  "-[GKRemoveGamesCacheReader readResources:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  [v9 setResult:v10];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000AC820;
  v20[3] = &unk_1002706C8;
  v20[4] = self;
  id v11 = v6;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  [v12 perform:v20];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000ACE74;
  v17[3] = &unk_1002706F0;
  id v15 = v7;
  id v19 = v15;
  id v16 = v12;
  id v18 = v16;
  [v16 notifyOnQueue:v14 block:v17];
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end