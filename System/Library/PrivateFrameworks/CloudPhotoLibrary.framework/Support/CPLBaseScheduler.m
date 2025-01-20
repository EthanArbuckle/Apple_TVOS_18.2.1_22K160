@interface CPLBaseScheduler
- (BOOL)shouldCoalesceServerChangesNotification;
- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3;
- (CPLBaseScheduler)initWithAbstractObject:(id)a3;
- (id)componentName;
- (id)scheduleNextSyncSessionAtDate:(id)a3;
- (unint64_t)_nextSequenceNumber;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)noteSyncSession:(id)a3 failedWithError:(id)a4;
- (void)noteSyncSessionSucceeded:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3;
- (void)unschedulePersistedSyncSession;
- (void)unscheduleSyncSession:(id)a3;
@end

@implementation CPLBaseScheduler

- (CPLBaseScheduler)initWithAbstractObject:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CPLBaseScheduler;
  v3 = -[CPLBaseScheduler initWithAbstractObject:](&v17, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10018CE40();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
      }
    }

    uint64_t v7 = CPLCopyDefaultSerialQueueAttributes(v3);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.scheduler", v8);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v9;

    uint64_t v12 = CPLCopyDefaultSerialQueueAttributes(v11);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cpl.scheduler.sequenceNumber", v13);
    sequenceNumberQueue = v4->_sequenceNumberQueue;
    v4->_sequenceNumberQueue = (OS_dispatch_queue *)v14;
  }

  return v4;
}

- (unint64_t)_nextSequenceNumber
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  sequenceNumberQueue = self->_sequenceNumberQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10018CF14;
  v5[3] = &unk_10023E658;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)sequenceNumberQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldCoalesceServerChangesNotification
{
  return 1;
}

- (void)noteSyncSessionSucceeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D044;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)noteSyncSession:(id)a3 failedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10018D198;
  v14[3] = &unk_10023DE80;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_block_t v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v18 = v9;
  v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D4BC;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D6D8;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)unschedulePersistedSyncSession
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018DB58;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018DCF8;
  v12[3] = &unk_100241620;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

- (id)scheduleNextSyncSessionAtDate:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseScheduler abstractObject](self, "abstractObject"));
  id v6 = objc_alloc(&OBJC_CLASS___CPLSyncSession);
  unint64_t v7 = -[CPLBaseScheduler _nextSequenceNumber](self, "_nextSequenceNumber");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);
  dispatch_block_t v9 = -[CPLSyncSession initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:]( v6,  "initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:",  v7,  v4,  v5,  v8,  0LL);

  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10018DF14;
  v19[3] = &unk_10023DE80;
  v19[4] = self;
  id v20 = v4;
  dispatch_block_t v11 = v9;
  v21 = v11;
  id v12 = v19;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v23 = v12;
  id v13 = queue;
  id v14 = v4;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v15);

  id v16 = v21;
  objc_super v17 = v11;

  return v17;
}

- (void)unscheduleSyncSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018E260;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018E398;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  unint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (id)componentName
{
  return @"scheduler";
}

- (void).cxx_destruct
{
}

@end