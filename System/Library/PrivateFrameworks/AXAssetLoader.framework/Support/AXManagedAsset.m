@interface AXManagedAsset
+ (id)assetWithPolicy:(id)a3;
- (AXAssetPolicy)policy;
- (AXManagedAsset)initWithPolicy:(id)a3;
- (double)lastXCPActivityHandlerExecutionTime;
- (id)description;
- (void)_dequeueNextTask;
- (void)_enqueueTask:(id)a3;
- (void)checkInAssetUpdateXPCActivity;
- (void)enqueueAssetUpdateTaskWithContext:(id)a3;
- (void)enqueueCatalogRefreshTaskWithOverrideTimeout:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5;
- (void)enqueueCleanseUnusedCompactResourcesTaskWithContext:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLastXCPActivityHandlerExecutionTime:(double)a3;
- (void)setPolicy:(id)a3;
@end

@implementation AXManagedAsset

+ (id)assetWithPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPolicy:v4];

  return v5;
}

- (AXManagedAsset)initWithPolicy:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AXManagedAsset;
  id v5 = -[AXManagedAsset init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    -[AXManagedAsset setPolicy:](v5, "setPolicy:", v4);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

    id v11 = objc_claimAutoreleasedReturnValue([v4 assetTypeSuffix]);
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v10);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    enqueuedTasks = v6->_enqueuedTasks;
    v6->_enqueuedTasks = (NSMutableArray *)v14;

    v6->_taskLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v6);
    dispatch_source_t v16 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  (dispatch_queue_t)v6->_taskQueue);
    taskQueueSignal = v6->_taskQueueSignal;
    v6->_taskQueueSignal = (OS_dispatch_source *)v16;

    v18 = (dispatch_source_s *)v6->_taskQueueSignal;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100008258;
    v20[3] = &unk_100020770;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, v20);
    dispatch_activate((dispatch_object_t)v6->_taskQueueSignal);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetTypeSuffix]);

  if (v3)
  {
    v6 = NSStringFromClass(v3);
    dispatch_queue_attr_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    dispatch_queue_attr_t v7 = @"<Unknown Class>";
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p> [%@]",  v7,  self,  v5));

  return v8;
}

- (void)checkInAssetUpdateXPCActivity
{
  xpc_object_t v3 = XPC_ACTIVITY_CHECK_IN;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
  id v5 = objc_claimAutoreleasedReturnValue([v4 launchActivityIdentifier]);
  v6 = (const char *)[v5 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008438;
  handler[3] = &unk_100020800;
  objc_copyWeak(&v8, &location);
  handler[4] = self;
  xpc_activity_register(v6, v3, handler);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)enqueueCatalogRefreshTaskWithOverrideTimeout:(id)a3 forceCatalogRefresh:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc(&OBJC_CLASS___AXCatalogRefreshTask);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
  dispatch_queue_t v12 = -[AXCatalogRefreshTask initWithPolicy:forceCatalogRefresh:context:]( v10,  "initWithPolicy:forceCatalogRefresh:context:",  v11,  v5,  v8);

  -[AXCatalogRefreshTask setOverrideTimeout:](v12, "setOverrideTimeout:", v9);
  -[AXManagedAsset _enqueueTask:](self, "_enqueueTask:", v12);
}

- (void)enqueueAssetUpdateTaskWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AXUpdateAssetTask);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
  dispatch_queue_attr_t v7 = -[AXUpdateAssetTask initWithPolicy:context:](v5, "initWithPolicy:context:", v6, v4);

  -[AXManagedAsset _enqueueTask:](self, "_enqueueTask:", v7);
}

- (void)enqueueCleanseUnusedCompactResourcesTaskWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AXCleanseUnusedCompactResourcesTask);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
  dispatch_queue_attr_t v7 = -[AXCleanseUnusedCompactResourcesTask initWithPolicy:context:](v5, "initWithPolicy:context:", v6, v4);

  -[AXManagedAsset _enqueueTask:](self, "_enqueueTask:", v7);
}

- (void)_enqueueTask:(id)a3
{
  p_taskLock = &self->_taskLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008880;
  v5[3] = &unk_100020828;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  AX_PERFORM_WITH_LOCK(p_taskLock, v5);
}

- (void)_dequeueNextTask
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_100008A80;
  id v9 = sub_100008A90;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008A98;
  v4[3] = &unk_100020850;
  v4[4] = self;
  v4[5] = &v5;
  AX_PERFORM_WITH_LOCK(&self->_taskLock, v4);
  v2 = (void *)v6[5];
  if (v2)
  {
    xpc_object_t v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v2 taskBlock]);
    v3[2](v3, v6[5]);
  }

  _Block_object_dispose(&v5, 8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100027788 == a6 && (id v13 = [v10 isEqualToString:@"finished"], (_DWORD)v13))
  {
    uint64_t v14 = AXLogAssetDaemon(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_source_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAsset policy](self, "policy"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetType]);
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[AXManagedAsset: %@]: Notified task did finish: %@",  buf,  0x16u);
    }

    dispatch_source_merge_data((dispatch_source_t)self->_taskQueueSignal, 1uLL);
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___AXManagedAsset;
    -[AXManagedAsset observeValueForKeyPath:ofObject:change:context:]( &v18,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (AXAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (double)lastXCPActivityHandlerExecutionTime
{
  return self->_lastXCPActivityHandlerExecutionTime;
}

- (void)setLastXCPActivityHandlerExecutionTime:(double)a3
{
  self->_lastXCPActivityHandlerExecutionTime = a3;
}

- (void).cxx_destruct
{
}

@end