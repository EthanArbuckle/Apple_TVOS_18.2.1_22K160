@interface MZAsynchronousTask
- (BOOL)taskInvalidationDisabled;
- (MZAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6;
- (MZTaskAssertion)taskAssertion;
- (NSError)error;
- (NSMutableArray)completions;
- (NSString)taskDebugDescription;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)assertionTimeoutTimer;
- (OS_dispatch_source)taskTimeoutTimer;
- (double)assertionTimeout;
- (double)taskTimeout;
- (id)description;
- (id)expirationHandler;
- (id)finishedHandler;
- (id)result;
- (int)cancelType;
- (void)_invalidateAssertionTimer;
- (void)_invalidateTaskAssertionForced:(BOOL)a3;
- (void)_invalidateTaskTimer;
- (void)_onQueueFireExpirationHandlerIfNecesary;
- (void)addTaskCompletionBlock:(id)a3;
- (void)beginTaskOperation;
- (void)dealloc;
- (void)endTaskOperation;
- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)invokeTaskCompletionBlocksWithBlock:(id)a3;
- (void)setAssertionTimeout:(double)a3;
- (void)setAssertionTimeoutTimer:(id)a3;
- (void)setCancelType:(int)a3;
- (void)setCompletions:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setFinishedHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResult:(id)a3;
- (void)setTaskAssertion:(id)a3;
- (void)setTaskDebugDescription:(id)a3;
- (void)setTaskInvalidationDisabled:(BOOL)a3;
- (void)setTaskTimeout:(double)a3;
- (void)setTaskTimeoutTimer:(id)a3;
@end

@implementation MZAsynchronousTask

- (MZAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MZAsynchronousTask;
  v13 = -[MZAsynchronousTask init](&v34, "init");
  v14 = v13;
  if (v13)
  {
    if (a5 > a4) {
      a5 = a4;
    }
    objc_storeStrong((id *)&v13->_handlerQueue, a3);
    dispatch_queue_t v15 = dispatch_queue_create(0LL, 0LL);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    double v17 = a4 - a5;
    if (a4 - a5 < 0.00000011920929) {
      a5 = *(double *)&qword_1002B8960;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v17));
    -[MZAsynchronousTask setCompletions:](v14, "setCompletions:", v18);

    -[MZAsynchronousTask setTaskDebugDescription:](v14, "setTaskDebugDescription:", v12);
    v14->_taskTimeout = a4;
    v19 = dispatch_queue_create(0LL, 0LL);
    dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v19);
    taskTimeoutTimer = v14->_taskTimeoutTimer;
    v14->_taskTimeoutTimer = (OS_dispatch_source *)v20;

    dispatch_source_set_timer( (dispatch_source_t)v14->_taskTimeoutTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
    v22 = (dispatch_source_s *)v14->_taskTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002FB04;
    handler[3] = &unk_10023FF98;
    v23 = v14;
    v33 = v23;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume((dispatch_object_t)v14->_taskTimeoutTimer);
    *((double *)v23 + 13) = a5;
    dispatch_source_t v24 = v23[14];
    v23[14] = 0LL;

    if (*((double *)v23 + 13) != *(double *)&qword_1002B8960)
    {
      *((double *)v23 + 13) = a5;
      v25 = dispatch_queue_create(0LL, 0LL);
      dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v25);
      dispatch_source_t v27 = v23[14];
      v23[14] = v26;

      dispatch_source_set_timer(v23[14], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      v28 = v23[14];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10002FBBC;
      v30[3] = &unk_10023FF98;
      v31 = v23;
      dispatch_source_set_event_handler(v28, v30);
      dispatch_resume(v23[14]);
    }
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v3 = _MTLogCategoryAsyncTask(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc task: %@", buf, 0xCu);
  }

  -[MZAsynchronousTask _invalidateTaskTimer](self, "_invalidateTaskTimer");
  -[MZAsynchronousTask _invalidateAssertionTimer](self, "_invalidateAssertionTimer");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MZAsynchronousTask;
  -[MZAsynchronousTask dealloc](&v5, "dealloc");
}

- (void)_invalidateTaskTimer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FD98;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidateAssertionTimer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FE50;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MZAsynchronousTask;
  id v3 = -[MZAsynchronousTask description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask taskDebugDescription](self, "taskDebugDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ '%@'", v4, v5));

  return v6;
}

- (void)setExpirationHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FFBC;
  block[3] = &unk_1002405F8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)expirationHandler
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100030160;
  v10 = sub_100030188;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100030190;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setFinishedHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030244;
  block[3] = &unk_1002405F8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)finishedHandler
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100030160;
  v10 = sub_100030188;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000303E8;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onQueueFireExpirationHandlerIfNecesary
{
  id v3 = objc_retainBlock(self->_expirationHandler);
  if (v3)
  {
    id expirationHandler = self->_expirationHandler;
    self->_id expirationHandler = 0LL;

    int cancelType = self->_cancelType;
    handlerQueue = (dispatch_queue_s *)self->_handlerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000304C4;
    block[3] = &unk_100241180;
    block[4] = self;
    int v9 = cancelType;
    id v8 = v3;
    dispatch_async(handlerQueue, block);
  }
}

- (void)setCancelType:(int)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000305E0;
  v4[3] = &unk_1002411A8;
  int v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (int)cancelType
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003069C;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setResult:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003072C;
  block[3] = &unk_100240240;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)result
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_1000307EC;
  v10 = sub_1000307FC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100030804;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030894;
  block[3] = &unk_100240240;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NSError)error
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_1000307EC;
  v10 = sub_1000307FC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100030954;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)beginTaskOperation
{
  uint64_t v3 = _MTLogCategoryAsyncTask(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "beginTaskOperation %@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100030AB4;
  v9[3] = &unk_10023FF98;
  v9[4] = self;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask description](self, "description"));
  id v6 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:debugInfo:]( &OBJC_CLASS___MZTaskAssertion,  "newBackgroundTaskWithExpirationHandler:debugInfo:",  v9,  v5);
  -[MZAsynchronousTask setTaskAssertion:](self, "setTaskAssertion:", v6);

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100030AE8;
  v8[3] = &unk_10023FF98;
  v8[4] = self;
  dispatch_sync(queue, v8);
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MZAsynchronousTask setResult:](self, "setResult:", v6);
  -[MZAsynchronousTask setError:](self, "setError:", v7);
  -[MZAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0LL);
  handlerQueue = (dispatch_queue_s *)self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030D14;
  block[3] = &unk_100240980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

- (void)endTaskOperation
{
}

- (void)_invalidateTaskAssertionForced:(BOOL)a3
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_1000307EC;
  double v17 = sub_1000307FC;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030F98;
  block[3] = &unk_100240508;
  BOOL v12 = a3;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(queue, block);
  int v5 = (void *)v14[5];
  if (v5)
  {
    id v6 = [v5 invalidate];
    uint64_t v8 = _MTLogCategoryAsyncTask(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v14[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Releasing the background task assertion %@ for task: %@.",  buf,  0x16u);
    }
  }

  _Block_object_dispose(&v13, 8);
}

- (void)invalidate
{
}

- (void)addTaskCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = v4;
    id v6 = objc_retainBlock(v4);
    id v9 = [v6 copy];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask completions](self, "completions"));
    id v8 = objc_retainBlock(v9);
    [v7 addObject:v8];
  }

- (void)invokeTaskCompletionBlocksWithBlock:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask completions](self, "completions"));
  id v6 = [v5 copy];

  -[MZAsynchronousTask setCompletions:](self, "setCompletions:", 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask result](self, "result"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask error](self, "error"));
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000312B8;
  block[3] = &unk_1002409A8;
  block[4] = self;
  void block[5] = v21;
  dispatch_sync(queue, block);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000312FC;
  v15[3] = &unk_1002411F8;
  uint64_t v10 = dispatch_group_create();
  v16 = v10;
  id v11 = v4;
  id v19 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  [v6 enumerateObjectsUsingBlock:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100031424;
  v14[3] = &unk_1002404E0;
  v14[4] = self;
  v14[5] = v21;
  dispatch_group_notify(v10, &_dispatch_main_q, v14);

  _Block_object_dispose(v21, 8);
}

- (NSString)taskDebugDescription
{
  return self->_taskDebugDescription;
}

- (void)setTaskDebugDescription:(id)a3
{
}

- (MZTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)taskInvalidationDisabled
{
  return self->_taskInvalidationDisabled;
}

- (void)setTaskInvalidationDisabled:(BOOL)a3
{
  self->_taskInvalidationDisabled = a3;
}

- (double)taskTimeout
{
  return self->_taskTimeout;
}

- (void)setTaskTimeout:(double)a3
{
  self->_taskTimeout = a3;
}

- (OS_dispatch_source)taskTimeoutTimer
{
  return self->_taskTimeoutTimer;
}

- (void)setTaskTimeoutTimer:(id)a3
{
}

- (double)assertionTimeout
{
  return self->_assertionTimeout;
}

- (void)setAssertionTimeout:(double)a3
{
  self->_assertionTimeout = a3;
}

- (OS_dispatch_source)assertionTimeoutTimer
{
  return self->_assertionTimeoutTimer;
}

- (void)setAssertionTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end