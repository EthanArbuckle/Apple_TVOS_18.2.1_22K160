@interface GEOAPPersistence
+ (id)sharedInstance;
- (BOOL)evalModeEnabled;
- (GEOAPPersistence)init;
- (GEOAPPersistence)initWithDBFilePath:(id)a3;
- (id)selectBatchIdsForBatchUpload;
- (int64_t)_analyticsCount;
- (void)_configureDatabase;
- (void)_setupEvalStmtsOnDb:(id)a3;
- (void)_writeDailyCountElem:(id)a3;
- (void)_writeDailyCountElem:(id)a3 withStmtKey:(id)a4;
- (void)_writeDailySettingsElem:(id)a3;
- (void)_writeLogMsgQueueElem:(id)a3;
- (void)_writeMonthlyCountElem:(id)a3;
- (void)_writeRRLogElem:(id)a3;
- (void)clearAllData;
- (void)clearExpiredLogMsgsWithResultBlock:(id)a3;
- (void)clearPendingLogMsgElemsForBatchUploadWithBatchId:(unint64_t)a3;
- (void)dealloc;
- (void)flushEvalData;
- (void)processMapsAppDeletion;
- (void)selectCountsWithQueryStmtKey:(id)a3 deleteStmtKey:(id)a4 visitorBlock:(id)a5 completionBlock:(id)a6;
- (void)selectDailyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)selectDailySettingsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)selectLogMsgsForBatchUploadWithBatchId:(unint64_t)a3 visitorBlock:(id)a4 completionBlock:(id)a5;
- (void)selectMonthlyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)storeLogMsgElems:(id)a3;
- (void)tearDown;
@end

@implementation GEOAPPersistence

+ (id)sharedInstance
{
  if (qword_100033E48 != -1) {
    dispatch_once(&qword_100033E48, &stru_100029128);
  }
  return (id)qword_100033E40;
}

- (GEOAPPersistence)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"AP.db"]);

  v5 = -[GEOAPPersistence initWithDBFilePath:](self, "initWithDBFilePath:", v4);
  return v5;
}

- (GEOAPPersistence)initWithDBFilePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GEOAPPersistence;
  v6 = -[GEOAPPersistence init](&v9, "init");
  if (v6)
  {
    v6->_shadowEnabled = GEOConfigGetBOOL( GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[0],  GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[1]);
    objc_storeStrong((id *)&v6->_dbFilePath, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOKeyBagNotification sharedObject](&OBJC_CLASS___GEOKeyBagNotification, "sharedObject"));
    v6->_firstAuthComplete = [v7 addDataDidBecomeAvailableAfterFirstUnlockObserver:v6] ^ 1;

    if (v6->_firstAuthComplete) {
      -[GEOAPPersistence _configureDatabase](v6, "_configureDatabase");
    }
  }

  return v6;
}

- (BOOL)evalModeEnabled
{
  return self->_shadowEnabled;
}

- (void)_configureDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOSQLiteDB defaultPragmas](&OBJC_CLASS___GEOSQLiteDB, "defaultPragmas"));
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"foreign_keys"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_dbFilePath));
  v6 = objc_alloc(&OBJC_CLASS___GEOSQLiteDB);
  id v7 = sub_1000127CC();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[1] = 3221225472LL;
  v11[2] = sub_10001292C;
  v11[3] = &unk_100029150;
  v11[4] = self;
  v11[0] = _NSConcreteStackBlock;
  objc_super v9 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:]( v6,  "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:",  "com.apple.geo.analytics.db",  v8,  v5,  3145728LL,  v4,  v11,  &stru_100029170);
  db = self->_db;
  self->_db = v9;

  self->_firstAuthComplete = 1;
}

- (void)_setupEvalStmtsOnDb:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012D84;
  block[3] = &unk_1000288C0;
  id v6 = a3;
  uint64_t v3 = qword_100033E50;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100033E50, block);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEOAPPersistence;
  -[GEOAPPersistence dealloc](&v3, "dealloc");
}

- (void)tearDown
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100012EE4;
  v3[3] = &unk_1000288C0;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

- (int64_t)_analyticsCount
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100012FA4;
  v5[3] = &unk_1000290C0;
  v5[4] = self;
  v5[5] = &v6;
  -[GEOSQLiteDB statementForKey:statementBlock:](db, "statementForKey:statementBlock:", @"count", v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_writeLogMsgQueueElem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 expireTime]);
  [v5 timeIntervalSince1970];
  uint64_t v7 = (uint64_t)v6;

  db = self->_db;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001310C;
  v14[3] = &unk_100029198;
  v14[4] = self;
  id v10 = v4;
  id v15 = v10;
  uint64_t v16 = v7;
  -[GEOSQLiteDB executeStatement:statementBlock:](db, "executeStatement:statementBlock:", @"insA", v14);
  if (self->_shadowEnabled)
  {
    uint64_t v9 = self->_db;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100013228;
    v11[3] = &unk_100028FD0;
    id v12 = v10;
    v13 = self;
    -[GEOSQLiteDB executeStatement:statementBlock:](v9, "executeStatement:statementBlock:", @"insS", v11);
  }
}

- (void)_writeDailyCountElem:(id)a3 withStmtKey:(id)a4
{
  id v6 = a3;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000133EC;
  v9[3] = &unk_100028FD0;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  -[GEOSQLiteDB executeStatement:statementBlock:](db, "executeStatement:statementBlock:", a4, v9);
}

- (void)_writeDailyCountElem:(id)a3
{
}

- (void)_writeMonthlyCountElem:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000127CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "writing monthly elem : %@", (uint8_t *)&v7, 0xCu);
  }

  -[GEOAPPersistence _writeDailyCountElem:withStmtKey:](self, "_writeDailyCountElem:withStmtKey:", v4, @"insMC");
}

- (void)_writeDailySettingsElem:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000137D0;
  v7[3] = &unk_100028FD0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  -[GEOSQLiteDB executeStatement:statementBlock:](db, "executeStatement:statementBlock:", @"insDS", v7);
}

- (void)_writeRRLogElem:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013958;
  v7[3] = &unk_100028FD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[GEOSQLiteDB executeStatement:statementBlock:](db, "executeStatement:statementBlock:", @"insS", v7);
}

- (void)storeLogMsgElems:(id)a3
{
  id v6 = a3;
  if (sub_100012744((uint64_t)self) && [v6 count])
  {
    uint64_t Integer = GEOConfigGetInteger( GeoAnalyticsConfig_AnalyticsPipelineMaxPersist[0],  GeoAnalyticsConfig_AnalyticsPipelineMaxPersist[1]);
    db = self->_db;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100013AD0;
    v7[3] = &unk_1000291E8;
    void v7[4] = self;
    uint64_t v9 = Integer;
    id v8 = v6;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v7);
  }
}

- (id)selectBatchIdsForBatchUpload
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100013E68;
  v9[3] = &unk_100029210;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v9);
  id v6 = v10;
  int v7 = v5;

  return v7;
}

- (void)selectLogMsgsForBatchUploadWithBatchId:(unint64_t)a3 visitorBlock:(id)a4 completionBlock:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if (sub_100012744((uint64_t)self))
  {
    db = self->_db;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100014030;
    v11[3] = &unk_1000292B0;
    void v11[4] = self;
    unint64_t v14 = a3;
    id v12 = v10;
    id v13 = v8;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v11);
  }
}

- (void)selectCountsWithQueryStmtKey:(id)a3 deleteStmtKey:(id)a4 visitorBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1000127CC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[GEOAPPersistence selectCountsWithQueryStmtKey:deleteStmtKey:visitorBlock:completionBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  db = self->_db;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100014528;
  v21[3] = &unk_100029350;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v21);
}

- (void)selectDailyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
}

- (void)selectMonthlyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014B24;
  v7[3] = &unk_100029378;
  id v8 = a3;
  id v6 = v8;
  -[GEOAPPersistence selectCountsWithQueryStmtKey:deleteStmtKey:visitorBlock:completionBlock:]( self,  "selectCountsWithQueryStmtKey:deleteStmtKey:visitorBlock:completionBlock:",  @"qryMC",  @"delMC",  v7,  a4);
}

- (void)selectDailySettingsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100014BD8;
  v11[3] = &unk_1000293C8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v11);
}

- (void)clearExpiredLogMsgsWithResultBlock:(id)a3
{
  id v7 = a3;
  if (sub_100012744((uint64_t)self))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 timeIntervalSince1970];
    db = self->_db;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100014FC8;
    v8[3] = &unk_100029418;
    v8[4] = self;
    uint64_t v10 = (uint64_t)v6;
    id v9 = v7;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  }
}

- (void)clearPendingLogMsgElemsForBatchUploadWithBatchId:(unint64_t)a3
{
  if (sub_100012744((uint64_t)self))
  {
    db = self->_db;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100015418;
    v6[3] = &unk_100028BE8;
    v6[4] = self;
    v6[5] = a3;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  }

- (void)clearAllData
{
  if (sub_100012744((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000155A8;
    v4[3] = &unk_1000288C0;
    v4[4] = self;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v4);
  }

- (void)processMapsAppDeletion
{
  if (sub_100012744((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100015654;
    v4[3] = &unk_1000288C0;
    v4[4] = self;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v4);
    _GEOConfigRemoveValueSync(GeoAnalyticsConfig_MapsLastUseDate[0], GeoAnalyticsConfig_MapsLastUseDate[1]);
    _GEOConfigRemoveValueSync(GeoUserSessionConfig_MapsUserStartDate[0], GeoUserSessionConfig_MapsUserStartDate[1]);
  }

- (void).cxx_destruct
{
}

- (void)setEvalMode:(BOOL)a3
{
  db = self->_db;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001645C;
  v4[3] = &unk_1000294A8;
  v4[4] = self;
  BOOL v5 = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v4);
}

- (void)flushEvalData
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000164F8;
  v3[3] = &unk_1000288C0;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000127CC();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[GEOAPPersistence(Eval) showEvalDataWithVisitorBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100016690;
  v11[3] = &unk_1000294F0;
  void v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v11);
  id v9 = sub_1000127CC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "showEvalDataWithVisitorBlock: done", buf, 2u);
  }
}

@end