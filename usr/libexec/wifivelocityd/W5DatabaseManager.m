@interface W5DatabaseManager
+ (id)sharedObject;
- (W5DatabaseManager)init;
- (id)_getWAAnalyticsAccess;
- (id)_performFetch:(id)a3 error:(id *)a4;
- (id)fetchLastHourFaults;
- (id)fetchLastHourLinkTests;
- (id)fetchLastHourRecoveries;
- (id)performFetch:(id)a3;
- (id)updatedFaultsCallback;
- (id)updatedLinkTestsCallback;
- (id)updatedRecoveriesCallback;
- (void)dealloc;
- (void)performFetchAndReply:(id)a3 reply:(id)a4;
- (void)remoteStoreUpdate:(id)a3;
- (void)setUpdatedFaultsCallback:(id)a3;
- (void)setUpdatedLinkTestsCallback:(id)a3;
- (void)setUpdatedRecoveriesCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5DatabaseManager

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000794F0;
  block[3] = &unk_1000D2790;
  block[4] = a1;
  if (qword_1000F75B0 != -1) {
    dispatch_once(&qword_1000F75B0, block);
  }
  return (id)qword_1000F75A8;
}

- (W5DatabaseManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5DatabaseManager;
  v2 = -[W5DatabaseManager init](&v12, "init");
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifivelocity.dbquery", 0LL),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v3,
        queue,
        v2->_queue))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"Fault"));
    fetchLastHourFaultsDict = v2->_fetchLastHourFaultsDict;
    v2->_fetchLastHourFaultsDict = (NSFetchRequest *)v5;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourFaultsDict, "setResultType:", 2LL);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"LinkTest"));
    fetchLastHourLinkTestsDict = v2->_fetchLastHourLinkTestsDict;
    v2->_fetchLastHourLinkTestsDict = (NSFetchRequest *)v7;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourLinkTestsDict, "setResultType:", 2LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"Recovery"));
    fetchLastHourRecoveriesDict = v2->_fetchLastHourRecoveriesDict;
    v2->_fetchLastHourRecoveriesDict = (NSFetchRequest *)v9;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourRecoveriesDict, "setResultType:", 2LL);
  }

  else
  {

    return 0LL;
  }

  return v2;
}

- (id)_getWAAnalyticsAccess
{
  dispatch_queue_t v3 = self->_analyticsAccess;
  if (!self->_analyticsAccess && sub_100079680())
  {
    id v4 = [sub_100079680() accessWithOptions:0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (WAAnalyticsAccess *)[v5 copy];
    analyticsAccess = self->_analyticsAccess;
    self->_analyticsAccess = v6;
  }

  return v3;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  analyticsAccess = self->_analyticsAccess;
  if (analyticsAccess)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainObjectContext]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10007980C;
    v8[3] = &unk_1000D11C8;
    v8[4] = self;
    [v6 performBlockAndWait:v8];

    analyticsAccess = self->_analyticsAccess;
  }

  self->_analyticsAccess = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___W5DatabaseManager;
  -[W5DatabaseManager dealloc](&v7, "dealloc");
}

- (void)remoteStoreUpdate:(id)a3
{
  id v4 = a3;
  NSLog(@"Got NSNotification %@", v4);
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_100079AA0;
  v36 = sub_100079AB0;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100079AA0;
  v30 = sub_100079AB0;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100079AA0;
  v24 = sub_100079AB0;
  id v25 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourFaults](self, "fetchLastHourFaults"));
  v6 = (void *)v33[5];
  v33[5] = v5;

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourLinkTests](self, "fetchLastHourLinkTests"));
  v8 = (void *)v27[5];
  v27[5] = v7;

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourRecoveries](self, "fetchLastHourRecoveries"));
  v10 = (void *)v21[5];
  v21[5] = v9;

  if (v33[5])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100079AB8;
    block[3] = &unk_1000D1718;
    block[4] = self;
    void block[5] = &v32;
    dispatch_async(v12, block);
  }

  if (v27[5])
  {
    dispatch_queue_global_t v13 = dispatch_get_global_queue(0LL, 0LL);
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100079BB0;
    v18[3] = &unk_1000D1718;
    v18[4] = self;
    v18[5] = &v26;
    dispatch_async(v14, v18);
  }

  if (v21[5])
  {
    dispatch_queue_global_t v15 = dispatch_get_global_queue(0LL, 0LL);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100079CA8;
    v17[3] = &unk_1000D1718;
    v17[4] = self;
    v17[5] = &v20;
    dispatch_async(v16, v17);
  }

  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

- (id)performFetch:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100079AA0;
  v19 = sub_100079AB0;
  id v20 = 0LL;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_100079AA0;
  v13[4] = sub_100079AB0;
  id v14 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100079E9C;
  v9[3] = &unk_1000D2FF0;
  v9[4] = self;
  id v10 = v4;
  v11 = &v15;
  objc_super v12 = v13;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v16[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)_performFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainObjectContext]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 persistentStoreCoordinator]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v10 managedObjectModel]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 entitiesByName]);

  dispatch_queue_global_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 entityName]);
  LOBYTE(v10) = [v13 containsObject:v14];

  if ((v10 & 1) == 0)
  {
    uint64_t v27 = sub_10008C90C();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v6 entityName]);
      int v39 = 136315394;
      v40 = "-[W5DatabaseManager _performFetch:error:]";
      __int16 v41 = 2112;
      v42 = v29;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s: entityName %@ doesn't (yet) exist",  &v39,  22);
    }

    goto LABEL_11;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mainObjectContext]);
  id v38 = 0LL;
  uint64_t v17 = (const char *)[v16 countForFetchRequest:v6 error:&v38];
  id v18 = v38;

  uint64_t v19 = sub_10008C90C();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v21)
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
      int v39 = 138412802;
      v40 = (const char *)v6;
      __int16 v41 = 2112;
      v42 = v31;
      __int16 v43 = 2112;
      v44 = v32;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] Error with countForFetchRequest %@. %@ %@",  &v39,  32);
    }

    goto LABEL_18;
  }

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 entityName]);
    int v39 = 134218242;
    v40 = v17;
    __int16 v41 = 2112;
    v42 = v22;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] retrieving %lu entries from request.entityName %@",  &v39,  22);
  }

  if (!v17)
  {
LABEL_11:
    id v26 = 0LL;
    goto LABEL_12;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mainObjectContext]);
  id v37 = 0LL;
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 executeFetchRequest:v6 error:&v37]);
  id v18 = v37;

  if (!v18)
  {
    id v26 = 0LL;
    id v7 = (void *)v25;
    goto LABEL_12;
  }

  uint64_t v33 = sub_10008C90C();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
    int v39 = 138412802;
    v40 = (const char *)v6;
    __int16 v41 = 2112;
    v42 = v34;
    __int16 v43 = 2112;
    v44 = v35;
    LODWORD(v36) = 32;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] Error with executeFetchRequest %@. %@ %@",  &v39,  v36);
  }

  id v7 = (void *)v25;
LABEL_18:

  if (*a4)
  {
    id v26 = v18;
  }

  else
  {
    id v26 = v18;
    *a4 = v26;
  }

- (id)fetchLastHourFaults
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"date >= %@",  v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourFaultsDict, "setPredicate:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourFaultsDict));

  return v5;
}

- (id)fetchLastHourLinkTests
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"date >= %@",  v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourLinkTestsDict, "setPredicate:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourLinkTestsDict));

  return v5;
}

- (id)fetchLastHourRecoveries
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"date >= %@",  v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourRecoveriesDict, "setPredicate:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourRecoveriesDict));

  return v5;
}

- (void)performFetchAndReply:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007A5C0;
  block[3] = &unk_1000D3018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setUpdatedFaultsCallback:(id)a3
{
  id v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedFaultsCallback = self->_updatedFaultsCallback;
    self->_id updatedFaultsCallback = 0LL;

    id v5 = objc_retainBlock(v8);
    id v6 = self->_updatedFaultsCallback;
    self->_id updatedFaultsCallback = v5;
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A7A0;
    block[3] = &unk_1000D3040;
    block[4] = self;
    id v10 = v8;
    dispatch_sync(queue, block);
    id v6 = v10;
  }
}

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  id v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedLinkTestsCallback = self->_updatedLinkTestsCallback;
    self->_id updatedLinkTestsCallback = 0LL;

    id v5 = objc_retainBlock(v8);
    id v6 = self->_updatedLinkTestsCallback;
    self->_id updatedLinkTestsCallback = v5;
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A8A0;
    block[3] = &unk_1000D3040;
    block[4] = self;
    id v10 = v8;
    dispatch_sync(queue, block);
    id v6 = v10;
  }
}

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  id v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedRecoveriesCallback = self->_updatedRecoveriesCallback;
    self->_id updatedRecoveriesCallback = 0LL;

    id v5 = objc_retainBlock(v8);
    id v6 = self->_updatedRecoveriesCallback;
    self->_id updatedRecoveriesCallback = v5;
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A9A0;
    block[3] = &unk_1000D3040;
    block[4] = self;
    id v10 = v8;
    dispatch_sync(queue, block);
    id v6 = v10;
  }
}

- (void)startEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007AA48;
  block[3] = &unk_1000D11C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007ABB4;
  block[3] = &unk_1000D11C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (void).cxx_destruct
{
}

@end