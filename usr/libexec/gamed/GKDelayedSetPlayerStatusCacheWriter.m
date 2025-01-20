@interface GKDelayedSetPlayerStatusCacheWriter
+ (id)writerWithDatabaseConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKDelayedSetPlayerStatusCacheWriter)initWithDatabaseConnection:(id)a3;
- (id)deleteOldStatusesSQL;
- (id)getOldStatusesSQL;
- (id)requestsInsertSQL;
- (id)statusInsertSQL;
- (void)bindParametersForDeleteOldStatusesStatement:(sqlite3_stmt *)a3 requestsRowID:(int64_t)a4;
- (void)bindParametersForGetOldStatusesStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)bindParametersForStatusStatement:(sqlite3_stmt *)a3 status:(id)a4 requestsRowID:(int64_t)a5;
- (void)setConnection:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7;
@end

@implementation GKDelayedSetPlayerStatusCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDatabaseConnection:v4];

  return v5;
}

- (GKDelayedSetPlayerStatusCacheWriter)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKDelayedSetPlayerStatusCacheWriter;
  id v5 = -[GKDelayedSetPlayerStatusCacheWriter init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[GKDelayedSetPlayerStatusCacheWriter setConnection:](v5, "setConnection:", v4);
  }

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO requests(           player_gcid,             time_stamp)             VALUES (%s, %s);",
           ":player_gcid",
           ":time_stamp");
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  v6 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v6);
  id v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  GKBindParam(a3, ":time_stamp", v5);
}

- (id)statusInsertSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT INTO statuses(           request_id,             status)             VALUES (%s, %s);",
           ":request_id",
           ":status");
}

- (void)bindParametersForStatusStatement:(sqlite3_stmt *)a3 status:(id)a4 requestsRowID:(int64_t)a5
{
  v7 = (NSString *)a4;
  GKBindParam(a3, ":request_id", a5);
  GKBindParam(a3, ":status", v7);
}

- (id)deleteOldStatusesSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM requests WHERE request_id = %s;",
           ":request_id");
}

- (void)bindParametersForDeleteOldStatusesStatement:(sqlite3_stmt *)a3 requestsRowID:(int64_t)a4
{
}

- (id)getOldStatusesSQL
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"            SELECT request_id             FROM requests                 INNER JOIN statuses USING (request_id)             WHERE player_gcid = %s;",
           ":player_gcid");
}

- (void)bindParametersForGetOldStatusesStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
}

- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000B23E0;
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
  if ((unint64_t)[v6 count] >= 2)
  {
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is being asked to write statuses for multiple players. This is not currently supported.",  objc_opt_class(self, v8));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v13,  0LL));

    objc_exception_throw(v14);
    __break(1u);
  }

  else
  {
    connection = self->_connection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B25F0;
    v17[3] = &unk_100270628;
    id v10 = v6;
    id v18 = v10;
    int v19 = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000B2BB4;
    v15[3] = &unk_100270650;
    id v11 = v7;
    id v16 = v11;
    -[GKDatabaseConnection performAsyncTransaction:handler:](connection, "performAsyncTransaction:handler:", v17, v15);
  }

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end