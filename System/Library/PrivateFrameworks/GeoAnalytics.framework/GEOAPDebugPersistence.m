@interface GEOAPDebugPersistence
+ (id)sharedInstance;
- (GEOAPDebugPersistence)init;
- (GEOAPDebugPersistence)initWithDBFilePath:(id)a3;
- (void)_configureDatabase;
- (void)addInflightUploadWithBatchUUID:(id)a3 createTime:(id)a4 sessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 uploadPolicy:(int)a8 stageNum:(unsigned int)a9;
- (void)addUploadHistoryForBatchUUID:(id)a3 completionTime:(id)a4 latency:(unsigned int)a5 sessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 uploadPolicy:(int)a9 stageNum:(unsigned int)a10;
- (void)dealloc;
- (void)deleteAllHistory;
- (void)removeInflightUploadWithBatchUUID:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)tearDown;
@end

@implementation GEOAPDebugPersistence

+ (id)sharedInstance
{
  if (qword_100033E28 != -1) {
    dispatch_once(&qword_100033E28, &stru_100028E48);
  }
  return (id)qword_100033E20;
}

- (GEOAPDebugPersistence)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"APDebug.db"]);

  v5 = -[GEOAPDebugPersistence initWithDBFilePath:](self, "initWithDBFilePath:", v4);
  return v5;
}

- (GEOAPDebugPersistence)initWithDBFilePath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GEOAPDebugPersistence;
  v6 = -[GEOAPDebugPersistence init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dbFilePath, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOKeyBagNotification sharedObject](&OBJC_CLASS___GEOKeyBagNotification, "sharedObject"));
    v7->_firstAuthComplete = [v8 addDataDidBecomeAvailableAfterFirstUnlockObserver:v7] ^ 1;

    if (v7->_firstAuthComplete) {
      -[GEOAPDebugPersistence _configureDatabase](v7, "_configureDatabase");
    }
  }

  return v7;
}

- (void)_configureDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOSQLiteDB defaultPragmas](&OBJC_CLASS___GEOSQLiteDB, "defaultPragmas"));
  id v10 = [v3 mutableCopy];

  [v10 setObject:0 forKeyedSubscript:@"foreign_keys"];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_dbFilePath));
  id v5 = objc_alloc(&OBJC_CLASS___GEOSQLiteDB);
  id v6 = sub_100010D98();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:]( v5,  "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:",  "com.apple.geo.analytics.debugdb",  v7,  v4,  3145728LL,  v10,  &stru_100028E88,  &stru_100028EC8);
  db = self->_db;
  self->_db = v8;

  self->_firstAuthComplete = 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEOAPDebugPersistence;
  -[GEOAPDebugPersistence dealloc](&v3, "dealloc");
}

- (void)tearDown
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000110EC;
  v3[3] = &unk_1000288C0;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

- (void)deleteAllHistory
{
  if (sub_100010D10((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100011188;
    v4[3] = &unk_1000288C0;
    v4[4] = self;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v4);
  }

- (void)addUploadHistoryForBatchUUID:(id)a3 completionTime:(id)a4 latency:(unsigned int)a5 sessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 uploadPolicy:(int)a9 stageNum:(unsigned int)a10
{
  id v16 = a3;
  id v17 = a4;
  if (sub_100010D10((uint64_t)self))
  {
    id v22 = v17;
    [v17 timeIntervalSince1970];
    unsigned int v18 = a8;
    v20 = (void *)(uint64_t)v19;
    objc_initWeak(&location, self);
    db = self->_db;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100011300;
    v23[3] = &unk_100028F58;
    objc_copyWeak(v25, &location);
    id v24 = v16;
    v25[1] = v20;
    unsigned int v26 = a5;
    int v27 = a6;
    unsigned int v28 = a7;
    unsigned int v29 = v18;
    int v30 = a9;
    unsigned int v31 = a10;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v23);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
    id v17 = v22;
  }
}

- (void)addInflightUploadWithBatchUUID:(id)a3 createTime:(id)a4 sessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 uploadPolicy:(int)a8 stageNum:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  if (sub_100010D10((uint64_t)self))
  {
    [v16 timeIntervalSince1970];
    unsigned int v18 = (void *)(uint64_t)v17;
    objc_initWeak(&location, self);
    db = self->_db;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100011790;
    v20[3] = &unk_100028FA8;
    objc_copyWeak(v22, &location);
    id v21 = v15;
    v22[1] = v18;
    int v23 = a5;
    unsigned int v24 = a6;
    unsigned int v25 = a7;
    int v26 = a8;
    unsigned int v27 = a9;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v20);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

- (void)removeInflightUploadWithBatchUUID:(id)a3
{
  id v4 = a3;
  if (sub_100010D10((uint64_t)self))
  {
    objc_initWeak(&location, self);
    db = self->_db;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100011AFC;
    v6[3] = &unk_100028FF8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
  -[NSDate timeIntervalSince1970](v10, "timeIntervalSince1970");
  v12 = (void *)(vcvtmd_s64_f64(v11) - a3);
  objc_initWeak(&location, self);
  db = self->_db;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100011CF4;
  v16[3] = &unk_100029048;
  objc_copyWeak(v19, &location);
  id v14 = v9;
  id v17 = v14;
  v19[1] = v12;
  id v15 = v8;
  id v18 = v15;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100012054;
  v11[3] = &unk_100029098;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)showUploadCounts:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001232C;
  v7[3] = &unk_1000290E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end