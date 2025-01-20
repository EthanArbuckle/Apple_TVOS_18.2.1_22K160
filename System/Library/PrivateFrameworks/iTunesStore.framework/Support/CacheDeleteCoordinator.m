@interface CacheDeleteCoordinator
+ (id)sharedInstance;
- (BOOL)_isStale;
- (CacheDeleteCoordinator)init;
- (OS_dispatch_source)scheduledTimer;
- (id)_periodic:(id)a3 urgency:(int)a4;
- (id)_purchaseHistoryCache;
- (id)_purge:(id)a3 urgency:(int)a4;
- (id)_purgeable:(id)a3 urgency:(int)a4;
- (int64_t)_targetVolumeFromString:(id)a3;
- (unint64_t)_currentPurgeable;
- (void)_cancelPurge;
- (void)_pushUpdatedAvailableStorage;
- (void)_refreshPurgeableStorage;
- (void)dealloc;
- (void)registerCacheDeleteInfoCallbacks;
- (void)setScheduledTimer:(id)a3;
- (void)updatePurgeableStorage;
@end

@implementation CacheDeleteCoordinator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040714;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3270 != -1) {
    dispatch_once(&qword_1003A3270, block);
  }
  return (id)qword_1003A3268;
}

- (CacheDeleteCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CacheDeleteCoordinator;
  v2 = -[CacheDeleteCoordinator init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.CacheDeleteCoordinator.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    -[CacheDeleteCoordinator registerCacheDeleteInfoCallbacks](v2, "registerCacheDeleteInfoCallbacks");
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));

  if (v3)
  {
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));
    dispatch_source_cancel(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CacheDeleteCoordinator;
  -[CacheDeleteCoordinator dealloc](&v5, "dealloc");
}

- (void)registerCacheDeleteInfoCallbacks
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100040B74;
  v25[3] = &unk_10034BD38;
  v14 = &v26;
  objc_copyWeak(&v26, &location);
  v17 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100040BDC;
  v23[3] = &unk_10034BD38;
  v15 = &v24;
  objc_copyWeak(&v24, &location);
  v18 = objc_retainBlock(v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100040C44;
  v21[3] = &unk_10034BC98;
  v16 = &v22;
  objc_copyWeak(&v22, &location);
  dispatch_queue_attr_t v3 = objc_retainBlock(v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100040C70;
  v19[3] = &unk_10034BD38;
  objc_copyWeak(&v20, &location);
  v4 = objc_retainBlock(v19);
  int v5 = CacheDeleteRegisterInfoCallbacks(off_1003A2150, v17, v18, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  LODWORD(v7) = [v6 shouldLog];
  unsigned int v8 = [v6 shouldLogToDisk];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  v10 = v9;
  if (v8) {
    LODWORD(v7) = v7 | 2;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_9;
  }
  v11 = (void *)objc_opt_class(self);
  int v28 = 138412802;
  v29 = v11;
  __int16 v30 = 2112;
  v31 = off_1003A2150;
  __int16 v32 = 1024;
  int v33 = v5;
  id v12 = v11;
  v13 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[%@]: Registered cache delete callbacks for clienID: %@ with osResult: %d",  &v28,  28,  &v26,  &v24,  &v22);

  if (v13)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v6, @"%@");
LABEL_9:
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(v16);

  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)updatePurgeableStorage
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));

  if (!v3)
  {
    dispatch_source_t v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    -[CacheDeleteCoordinator setScheduledTimer:](self, "setScheduledTimer:", v4);

    int v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);

    uint64_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100040DDC;
    handler[3] = &unk_10034AC30;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    unsigned int v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));
    dispatch_resume(v8);
  }

- (void)_cancelPurge
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_10;
  }
  int v9 = 138412290;
  id v10 = (id)objc_opt_class(self);
  id v7 = v10;
  unsigned int v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[%@]: Requested cancel purge for service",  &v9,  12);

  if (v8)
  {
    dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_10:
  }
}

- (unint64_t)_currentPurgeable
{
  v2 = objc_alloc_init(&OBJC_CLASS___SSAppPurchaseHistoryCache);
  dispatch_queue_attr_t v3 = (char *)-[SSAppPurchaseHistoryCache purgeableSpace](v2, "purgeableSpace");
  if (+[ISURLOperation sharedCFURLCache](&OBJC_CLASS___ISURLOperation, "sharedCFURLCache")) {
    v3 += CFURLCacheCurrentDiskUsage(+[ISURLOperation sharedCFURLCache](&OBJC_CLASS___ISURLOperation, "sharedCFURLCache"));
  }

  return (unint64_t)v3;
}

- (BOOL)_isStale
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double lastUpdate = self->_lastUpdate;
  return Current - lastUpdate > 3600.0 || lastUpdate == 0.0;
}

- (id)_periodic:(id)a3 urgency:(int)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if (!(_DWORD)v11) {
    goto LABEL_10;
  }
  int v20 = 138412802;
  id v21 = (id)objc_opt_class(self);
  __int16 v22 = 2112;
  v23 = v8;
  __int16 v24 = 2048;
  uint64_t v25 = a4;
  id v13 = v21;
  v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[%@]: Requested to periodic purge %@ with urgency %ld",  &v20,  32);

  if (v14)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(v9, @"%@");
LABEL_10:
  }

  v18[1] = @"CACHE_DELETE_AMOUNT";
  v19[0] = v7;
  v18[0] = @"CACHE_DELETE_VOLUME";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  v19[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

  return v16;
}

- (id)_purchaseHistoryCache
{
  purchaseHistoryCache = self->__purchaseHistoryCache;
  if (!purchaseHistoryCache)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SSAppPurchaseHistoryCache);
    uint64_t v5 = self->__purchaseHistoryCache;
    self->__purchaseHistoryCache = v4;

    purchaseHistoryCache = self->__purchaseHistoryCache;
  }

  return purchaseHistoryCache;
}

- (id)_purge:(id)a3 urgency:(int)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);

  if ((id)-[CacheDeleteCoordinator _targetVolumeFromString:](self, "_targetVolumeFromString:", v7) != (id)2)
  {
    unint64_t v12 = 0LL;
    goto LABEL_16;
  }

  id v9 = [v8 unsignedLongLongValue];
  unint64_t v10 = -[CacheDeleteCoordinator _currentPurgeable](self, "_currentPurgeable");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator _purchaseHistoryCache](self, "_purchaseHistoryCache"));
  [v11 purge:v9];

  if (+[ISURLOperation sharedCFURLCache](&OBJC_CLASS___ISURLOperation, "sharedCFURLCache")) {
    CFURLCacheRemoveAllCachedResponses(+[ISURLOperation sharedCFURLCache](&OBJC_CLASS___ISURLOperation, "sharedCFURLCache"));
  }
  unint64_t v12 = v10 - -[CacheDeleteCoordinator _currentPurgeable](self, "_currentPurgeable");
  id v13 = self;
  objc_sync_enter(v13);
  v13->_double lastUpdate = 0.0;
  combinedSpaceByUrgency = v13->_combinedSpaceByUrgency;
  v13->_combinedSpaceByUrgency = 0LL;

  objc_sync_exit(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  unsigned int v16 = [v15 shouldLog];
  else {
    LODWORD(v17) = v16;
  }
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v17 = v17;
  }
  else {
    v17 &= 2u;
  }
  if (!(_DWORD)v17) {
    goto LABEL_13;
  }
  int v27 = 138413058;
  id v28 = (id)objc_opt_class(v13);
  __int16 v29 = 2112;
  __int16 v30 = v8;
  __int16 v31 = 2048;
  unint64_t v32 = v12;
  __int16 v33 = 2048;
  uint64_t v34 = a4;
  id v19 = v28;
  int v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[%@]: Purge requested: %@ actual purge: %lld with urgency: %ld",  &v27,  42);

  if (v20)
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
    free(v20);
    __int16 v24 = v18;
    SSFileLog(v15, @"%@");
LABEL_13:
  }

LABEL_16:
  v25[1] = @"CACHE_DELETE_AMOUNT";
  v26[0] = v7;
  v25[0] = @"CACHE_DELETE_VOLUME";
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12,  v24));
  v26[1] = v21;
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));

  return v22;
}

- (id)_purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  if ((id)-[CacheDeleteCoordinator _targetVolumeFromString:](self, "_targetVolumeFromString:", v7) == (id)2)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v34 = 138412546;
      id v35 = (id)objc_opt_class(self);
      __int16 v36 = 2048;
      id v37 = (id)(int)v4;
      id v12 = v35;
      id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%@]: Requested purgeable with urgency: %ld",  &v34,  22);

      if (v13)
      {
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
        free(v13);
        __int16 v30 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    else
    {
    }

    unsigned int v16 = self;
    objc_sync_enter(v16);
    if (!v16->_combinedSpaceByUrgency || -[CacheDeleteCoordinator _isStale](v16, "_isStale")) {
      -[CacheDeleteCoordinator _refreshPurgeableStorage](v16, "_refreshPurgeableStorage", v30);
    }
    combinedSpaceByUrgency = v16->_combinedSpaceByUrgency;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4, v30));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](combinedSpaceByUrgency, "objectForKey:", v18));

    if (v19) {
      id v15 = [v19 unsignedLongLongValue];
    }
    else {
      id v15 = 0LL;
    }

    objc_sync_exit(v16);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      __int16 v24 = (void *)objc_opt_class(v16);
      int v34 = 138412802;
      id v35 = v24;
      __int16 v36 = 2048;
      id v37 = v15;
      __int16 v38 = 2048;
      uint64_t v39 = (int)v4;
      id v25 = v24;
      LODWORD(v31) = 32;
      id v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[%@]: Total purgeable is %lld bytes for urgency: %ld",  &v34,  v31);

      if (!v26)
      {
LABEL_29:

        goto LABEL_30;
      }

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      __int16 v30 = v23;
      SSFileLog(v20, @"%@");
    }

    goto LABEL_29;
  }

  id v15 = 0LL;
LABEL_30:
  v32[0] = @"CACHE_DELETE_VOLUME";
  v32[1] = @"CACHE_DELETE_AMOUNT";
  v33[0] = v7;
  int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15, v30));
  v33[1] = v27;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));

  return v28;
}

- (void)_pushUpdatedAvailableStorage
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));

  if (v3)
  {
    uint64_t v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteCoordinator scheduledTimer](self, "scheduledTimer"));
    dispatch_source_cancel(v4);

    -[CacheDeleteCoordinator setScheduledTimer:](self, "setScheduledTimer:", 0LL);
  }

  uint64_t v5 = self;
  objc_sync_enter(v5);
  combinedSpaceByUrgency = v5->_combinedSpaceByUrgency;
  if (combinedSpaceByUrgency) {
    id v7 = -[NSDictionary copy](combinedSpaceByUrgency, "copy");
  }
  else {
    id v7 = 0LL;
  }
  objc_sync_exit(v5);

  if (v7)
  {
    v21[0] = @"CACHE_DELETE_ID";
    v21[1] = @"CACHE_DELETE_VOLUME";
    v22[0] = off_1003A2150;
    v22[1] = @"/private/var/mobile";
    v21[2] = @"CACHE_DELETE_AMOUNT";
    v22[2] = v7;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
    CacheDeleteUpdatePurgeable();
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v15 = 138412802;
      id v16 = (id)objc_opt_class(v5);
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      int v20 = @"/private/var/mobile";
      id v13 = v16;
      v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[%@]: Pushed combined purgeable amounts: %@ volume: %@",  &v15,  32);

      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }

      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_17;
  }

- (void)_refreshPurgeableStorage
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v19 = 138412290;
    id v20 = (id)objc_opt_class(self);
    id v7 = v20;
    unsigned int v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[%@]: Refreshing purgeable storage",  &v19,  12);

    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
      free(v8);
      id v18 = v9;
      SSFileLog(v3, @"%@");
    }
  }

  else
  {
  }

  unint64_t v10 = -[CacheDeleteCoordinator _currentPurgeable](self, "_currentPurgeable");
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v12 = 1LL;
  do
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10, v18));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, v14);

    uint64_t v12 = (v12 + 1);
  }

  while ((_DWORD)v12 != 5);
  int v15 = self;
  objc_sync_enter(v15);
  id v16 = (NSDictionary *)-[NSMutableDictionary copy](v11, "copy");
  combinedSpaceByUrgency = v15->_combinedSpaceByUrgency;
  v15->_combinedSpaceByUrgency = v16;

  v15->_double lastUpdate = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(v15);
}

- (int64_t)_targetVolumeFromString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3 && ([v3 isEqualToString:@"/private/var"] & 1) == 0)
  {
    else {
      int64_t v5 = 1LL;
    }
  }

  else
  {
    int64_t v5 = 1LL;
  }

  return v5;
}

- (OS_dispatch_source)scheduledTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setScheduledTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end