@interface TVCacheDeleteManager
- (BOOL)isCanceled;
- (NSString)cacheDeleteID;
- (OS_dispatch_queue)purgeQueue;
- (TVCacheDeleteManager)initWithCacheDeleteID:(id)a3;
- (TVCacheDeleteManagerDelegate)delegate;
- (id)_purgeTasksForUrgency:(int64_t)a3;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4 isPeriodic:(BOOL)a5;
- (int64_t)purgeableAmountWithUrgency:(int64_t)a3;
- (void)cancelPurge;
- (void)registerForCallbacks;
- (void)setCanceled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPurgeQueue:(id)a3;
@end

@implementation TVCacheDeleteManager

- (TVCacheDeleteManager)initWithCacheDeleteID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVCacheDeleteManager;
  v5 = -[TVCacheDeleteManager init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    cacheDeleteID = v5->_cacheDeleteID;
    v5->_cacheDeleteID = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.atvcached.cd.purge", &_dispatch_queue_attr_concurrent);
    purgeQueue = v5->_purgeQueue;
    v5->_purgeQueue = (OS_dispatch_queue *)v8;

    -[TVCacheDeleteManager registerForCallbacks](v5, "registerForCallbacks");
  }

  return v5;
}

- (void)registerForCallbacks
{
  v3 = -[TVCacheDeleteManager cacheDeleteID](self, "cacheDeleteID");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000022C8;
  v10[3] = &unk_10000C328;
  objc_copyWeak(&v11, &location);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002310;
  v8[3] = &unk_10000C350;
  objc_copyWeak(&v9, &location);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000236C;
  v6[3] = &unk_10000C378;
  objc_copyWeak(&v7, &location);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002398;
  v4[3] = &unk_10000C350;
  objc_copyWeak(&v5, &location);
  CacheDeleteRegisterCallbacks(v3, v10, v8, v6, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (int64_t)purgeableAmountWithUrgency:(int64_t)a3
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  id v5 = sub_100007290();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CacheDelete requesting purgeable amount with urgency %d",  buf,  8u);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteManager purgeQueue](self, "purgeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000025B0;
  block[3] = &unk_10000C3A0;
  block[4] = self;
  block[5] = &v14;
  block[6] = a3;
  dispatch_sync(v7, block);

  id v8 = sub_100007290();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v15[3];
    *(_DWORD *)buf = 67109376;
    int v19 = a3;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CacheDelete request for purgeable amount with urgency %d complete: %lld purgeable.",  buf,  0x12u);
  }

  int64_t v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4
{
  return -[TVCacheDeleteManager purgeAmount:withUrgency:isPeriodic:]( self,  "purgeAmount:withUrgency:isPeriodic:",  a3,  a4,  0LL);
}

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4 isPeriodic:(BOOL)a5
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  if (!a5 && !-[TVCacheDeleteManager isCanceled](self, "isCanceled"))
  {
    id v8 = sub_100007290();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v25 = &stru_10000C6B0;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      __int16 v28 = 1024;
      int v29 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CacheDelete requesting %{public}@purge of amount %lld with urgency %d",  buf,  0x1Cu);
    }

    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteManager purgeQueue](self, "purgeQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000029D8;
    v19[3] = &unk_10000C3C8;
    v19[6] = a4;
    v19[7] = a3;
    v19[4] = self;
    v19[5] = &v20;
    dispatch_sync(v10, v19);

    if (-[TVCacheDeleteManager isCanceled](self, "isCanceled"))
    {
      id v11 = sub_100007290();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v21[3];
        *(_DWORD *)buf = 138544130;
        v25 = &stru_10000C6B0;
        __int16 v26 = 2048;
        int64_t v27 = a3;
        __int16 v28 = 1024;
        int v29 = a4;
        __int16 v30 = 2048;
        uint64_t v31 = v13;
        uint64_t v14 = "CacheDelete request for %{public}@purge of amount %lld with urgency %d canceled: %lld purged before cancelation.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x26u);
      }
    }

    else
    {
      id v15 = sub_100007290();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v21[3];
        *(_DWORD *)buf = 138544130;
        v25 = &stru_10000C6B0;
        __int16 v26 = 2048;
        int64_t v27 = a3;
        __int16 v28 = 1024;
        int v29 = a4;
        __int16 v30 = 2048;
        uint64_t v31 = v16;
        uint64_t v14 = "CacheDelete request for %{public}@purge of amount %lld with urgency %d complete: %lld purged.";
        goto LABEL_10;
      }
    }

    -[TVCacheDeleteManager setCanceled:](self, "setCanceled:", 0LL);
  }

  int64_t v17 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (void)cancelPurge
{
  id v2 = sub_100007290();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CacheDelete canceling purge.", v4, 2u);
  }
}

- (id)_purgeTasksForUrgency:(int64_t)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVCacheDeleteManager delegate](self, "delegate"));
  v6 = (void *)v5;
  if (!v5
    || (objc_opt_respondsToSelector(v5, "manager:purgeTasksForUrgency:") & 1) == 0
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 manager:self purgeTasksForUrgency:a3])) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v7;
}

- (NSString)cacheDeleteID
{
  return self->_cacheDeleteID;
}

- (TVCacheDeleteManagerDelegate)delegate
{
  return (TVCacheDeleteManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)purgeQueue
{
  return self->_purgeQueue;
}

- (void)setPurgeQueue:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
}

@end