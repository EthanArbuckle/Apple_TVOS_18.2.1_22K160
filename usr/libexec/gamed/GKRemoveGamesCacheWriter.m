@interface GKRemoveGamesCacheWriter
+ (id)writerWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKRemoveGamesCacheWriter)initWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4;
- (NSDictionary)gameDescriptor;
- (id)removeGamesInsertSQL;
- (id)requestsInsertSQL;
- (void)bindParametersForRemoveGamesStatement:(sqlite3_stmt *)a3 forRemovedBundleID:(id)a4 requestsRowID:(int64_t)a5;
- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4 digest:(id)a5;
- (void)setConnection:(id)a3;
- (void)setGameDescriptor:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7;
@end

@implementation GKRemoveGamesCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithDatabaseConnection:gameDescriptor:", v6, v7);

  return v9;
}

- (GKRemoveGamesCacheWriter)initWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKRemoveGamesCacheWriter;
  uint64_t v8 = -[GKRemoveGamesCacheWriter init](&v11, "init");
  id v9 = v8;
  if (v8)
  {
    -[GKRemoveGamesCacheWriter setConnection:](v8, "setConnection:", v6);
    -[GKRemoveGamesCacheWriter setGameDescriptor:](v9, "setGameDescriptor:", v7);
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"                           INSERT INTO requests(                          adam_id,                            bundle_id,                            bundle_version,                            external_version,                            player_gcid,                            time_stamp)                            VALUES (%s, %s, %s, %s, %s, %s)",  ":adam_id",  ":bundle_id",  ":bundle_version",  ":external_version",  ":player_gcid",  ":time_stamp");
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4 digest:(id)a5
{
  objc_super v11 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v11);
  id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_gameDescriptor,  "objectForKeyedSubscript:",  @"adam-id"));
  GKBindParam(a3, ":adam_id", v7);

  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_gameDescriptor,  "objectForKeyedSubscript:",  @"bundle-id"));
  GKBindParam(a3, ":bundle_id", v8);

  id v9 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_gameDescriptor,  "objectForKeyedSubscript:",  @"bundle-version"));
  GKBindParam(a3, ":bundle_version", v9);

  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_gameDescriptor,  "objectForKeyedSubscript:",  @"external-version"));
  GKBindParam(a3, ":external_version", v10);
}

- (id)removeGamesInsertSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"                           INSERT INTO remove_games(                          request_id,                            removed_bundle_id)                            VALUES (%s,%s);",
           ":request_id",
           ":removed_bundle_id");
}

- (void)bindParametersForRemoveGamesStatement:(sqlite3_stmt *)a3 forRemovedBundleID:(id)a4 requestsRowID:(int64_t)a5
{
  id v7 = (NSString *)a4;
  GKBindParam(a3, ":request_id", a5);
  GKBindParam(a3, ":removed_bundle_id", v7);
}

- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000ABAF4;
  v28[3] = &unk_1002705B0;
  id v15 = v11;
  id v29 = v15;
  id v16 = v14;
  id v30 = v16;
  v17 = objc_retainBlock(v28);
  id v18 = v12;
  int v19 = ((uint64_t (*)(void *, id))v17[2])(v17, v18);
  id v20 = v18;
  if (v13 && v19 == 101)
  {
    id v20 = v13;

    int v19 = ((uint64_t (*)(void *, id))v17[2])(v17, v20);
  }

  if (v19 != 101)
  {
    v22 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_errmsg(a3));
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    v33 = @"SQL";
    id v34 = v20;
    v24 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v23,  objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL)));
    id v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    objc_exception_throw(v25);
    goto LABEL_10;
  }

  int v21 = sqlite3_changes(a3);
  if (v13 && !v21)
  {
    v31 = @"SQL";
    id v32 = v20;
    v26 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"UPDATE statement didn't affect any rows, meaning record unsuccessfully inserted",  objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL)));
    id v27 = (id)objc_claimAutoreleasedReturnValue(v26);
    objc_exception_throw(v27);
LABEL_10:
    __break(1u);
  }
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  id v12 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000ABC5C;
  v13[3] = &unk_100270628;
  id v14 = v6;
  id v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000AC060;
  v11[3] = &unk_100270650;
  id v9 = v7;
  id v10 = v6;
  -[GKDatabaseConnection performAsyncTransaction:handler:](connection, "performAsyncTransaction:handler:", v13, v11);
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSDictionary)gameDescriptor
{
  return self->_gameDescriptor;
}

- (void)setGameDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end