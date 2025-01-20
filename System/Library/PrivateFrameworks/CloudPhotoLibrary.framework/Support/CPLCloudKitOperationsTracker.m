@interface CPLCloudKitOperationsTracker
- (CPLCloudKitOperationsTracker)init;
- (id)_pendingTaskStatus;
- (id)status;
- (id)statusDictionary;
- (void)_emitLogForCurrentTasks;
- (void)cancelAllOperationsWithCompletionHandler:(id)a3;
- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3;
- (void)operationDidFinish:(id)a3;
- (void)operationHasBeenCancelled:(id)a3;
- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5;
- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5 bundleIdentifiers:(id)a6;
- (void)taskWillStart:(id)a3;
- (void)waitForAllTasksToFinishWithCompletionHandler:(id)a3;
@end

@implementation CPLCloudKitOperationsTracker

- (CPLCloudKitOperationsTracker)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLCloudKitOperationsTracker;
  v2 = -[CPLCloudKitOperationsTracker init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = CPLCopyDefaultSerialQueueAttributes(v2);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.cloudkit.operations", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    tasks = v3->_tasks;
    v3->_tasks = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitOperationCounter);
    operationCounter = v3->_operationCounter;
    v3->_operationCounter = v10;
  }

  return v3;
}

- (id)_pendingTaskStatus
{
  if (-[NSMutableArray count](self->_tasks, "count"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v4 = self->_tasks;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v8) trackingContext]);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 statusPerOperationType]);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_100058984;
          v15[3] = &unk_10023FA00;
          v16 = v3;
          [v10 enumerateKeysAndObjectsUsingBlock:v15];

          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v6);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100058A14;
    v13[3] = &unk_100240640;
    v11 =  -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"Pending CloudKit operations:");
    v14 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  }

  else
  {
    v11 = (NSMutableString *)@"No pending CloudKit operations";
  }

  return v11;
}

- (void)_emitLogForCurrentTasks
{
  id v3 = sub_100058B6C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5 && !_CPLSilentLogging)
  {
    id v6 = sub_100058B6C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitOperationsTracker _pendingTaskStatus](self, "_pendingTaskStatus"));
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
    }
  }

- (void)taskWillStart:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CPLCloudKitOperationCounter beginTask:](self->_operationCounter, "beginTask:", v5);
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100058CD0;
  v13[3] = &unk_10023DA98;
  id v14 = v5;
  v15 = self;
  id v16 = v6;
  SEL v17 = a2;
  v8 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v19 = v8;
  int v9 = queue;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v12);
}

- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[CPLCloudKitOperationsTracker _bundleIdentifiersFromCKOperation:]( self,  "_bundleIdentifiersFromCKOperation:",  v10));
  -[CPLCloudKitOperationsTracker operationWillStart:forTask:withContext:bundleIdentifiers:]( self,  "operationWillStart:forTask:withContext:bundleIdentifiers:",  v10,  v9,  v8,  v11);
}

- (void)operationWillStart:(id)a3 forTask:(id)a4 withContext:(id)a5 bundleIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  objc_super v13 = (CPLCloudKitOperationContext *)a5;
  id v14 = a6;
  id v15 = [v11 resolvedConfiguration];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  objc_msgSend(v11, "cpl_setTask:", v12);
  if (!v13) {
    objc_super v13 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitOperationContext);
  }
  -[CPLCloudKitOperationContext setOperation:](v13, "setOperation:", v11);
  -[CPLCloudKitOperationContext setBundleIdentifiers:](v13, "setBundleIdentifiers:", v14);
  -[CPLCloudKitOperationContext setStartDate:](v13, "setStartDate:", v16);
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100059084;
  v25[3] = &unk_100240668;
  id v26 = v12;
  id v27 = v11;
  v28 = self;
  id v29 = v14;
  v30 = v13;
  SEL v31 = a2;
  __int128 v18 = v25;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v33 = v18;
  id v19 = queue;
  __int128 v20 = v13;
  id v21 = v14;
  id v22 = v11;
  id v23 = v12;
  dispatch_block_t v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v19, v24);
}

- (void)operationDidFinish:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059790;
  block[3] = &unk_10023EFC8;
  id v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)operationHasBeenCancelled:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000599FC;
  v11[3] = &unk_10023EFC8;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v15 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)cancelAllOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100059F34;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005A1B0;
  v7[3] = &unk_1002406B8;
  v7[4] = self;
  BOOL v8 = a3;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v10 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (id)status
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_block_t v9 = sub_100058514;
  id v10 = sub_100058524;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005A414;
  v5[3] = &unk_10023E658;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)statusDictionary
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_block_t v9 = sub_100058514;
  id v10 = sub_100058524;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005A5BC;
  v5[3] = &unk_10023E658;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)waitForAllTasksToFinishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005A858;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B664;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void).cxx_destruct
{
}

@end