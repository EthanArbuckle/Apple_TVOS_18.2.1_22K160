@interface GKDelayedSetPhotoCacheReader
+ (id)readerWithDatabaseConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKDelayedSetPhotoCacheReader)initWithDatabaseConnection:(id)a3;
- (id)setPhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3;
- (id)setPhotoDescriptorStatement;
- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)readResources:(id)a3 handler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation GKDelayedSetPhotoCacheReader

+ (id)readerWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDatabaseConnection:v4];

  return v5;
}

- (GKDelayedSetPhotoCacheReader)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKDelayedSetPhotoCacheReader;
  id v5 = -[GKDelayedSetPhotoCacheReader init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[GKDelayedSetPhotoCacheReader setConnection:](v5, "setConnection:", v4);
  }

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)setPhotoDescriptorStatement
{
  id v2 = sub_1000AC284((uint64_t)off_100270770);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    SELECT %@     FROM requests     INNER JOIN photos USING (request_id)     WHERE player_gcid = %s     ORDER BY time_stamp DESC;",
                   v3,
                   ":player_gcid"));

  return v4;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
}

- (id)setPhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3
{
  v10 = a3;
  id v4 = sub_1000AE8D8(&v10);
  id v5 =  +[NSDate _gkDateFromScalarServerTimestamp:]( &OBJC_CLASS___NSDate,  "_gkDateFromScalarServerTimestamp:",  sqlite3_column_int64(a3, 1));
  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sqlite3_column_double(a3, 3));
  v12[0] = @"image/png";
  v11[0] = @"content-type";
  v11[1] = @"timestamp";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _gkServerTimestamp]);
  v12[1] = v7;
  v12[2] = v4;
  v11[2] = @"image-data";
  v11[3] = @"avatar-type";
  v12[3] = v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  return v8;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] >= 2)
  {
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is being asked to read photos for multiple players. This is not currently supported.",  objc_opt_class(self, v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

    objc_exception_throw(v20);
    __break(1u);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDelayedSetPhotoCacheReader.mm",  91LL,  "-[GKDelayedSetPhotoCacheReader readResources:handler:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    [v10 setResult:v11];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000AEBC4;
    v24[3] = &unk_1002706C8;
    v24[4] = self;
    id v12 = v6;
    id v25 = v12;
    id v13 = v10;
    id v26 = v13;
    [v13 perform:v24];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000AEF08;
    v21[3] = &unk_1002706F0;
    id v16 = v7;
    id v23 = v16;
    id v17 = v13;
    id v22 = v17;
    [v17 notifyOnQueue:v15 block:v21];
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