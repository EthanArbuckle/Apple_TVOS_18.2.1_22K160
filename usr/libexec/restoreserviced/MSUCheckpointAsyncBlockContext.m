@interface MSUCheckpointAsyncBlockContext
- (BOOL)wait;
- (BOOL)waitUntilDate:(id)a3;
- (MSUCheckpointAsyncBlockContext)initWithQueue:(id)a3 block:(id)a4;
- (OS_dispatch_queue)workQueue;
- (id)workBlock;
- (void)dealloc;
- (void)runForCheckpoint:(void *)a3;
- (void)runSynchronousForCheckpoint:(void *)a3;
- (void)setWorkBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MSUCheckpointAsyncBlockContext

- (MSUCheckpointAsyncBlockContext)initWithQueue:(id)a3 block:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSUCheckpointAsyncBlockContext;
  v6 = -[MSUCheckpointAsyncContext init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      -[MSUCheckpointAsyncBlockContext setWorkQueue:](v6, "setWorkQueue:", a3);
    }

    else
    {
      qos_class_t v8 = qos_class_self();
      v9 = dispatch_queue_attr_make_with_qos_class(0LL, v8, 0);
      dispatch_queue_t v10 = dispatch_queue_create(0LL, v9);
      -[MSUCheckpointAsyncBlockContext setWorkQueue:](v7, "setWorkQueue:", v10);
      dispatch_release(v10);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3254779904LL;
  v12[2] = sub_10000DAD4;
  v12[3] = &unk_1000249F0;
  v12[4] = v7;
  v12[5] = a4;
  -[MSUCheckpointAsyncBlockContext setWorkBlock:]( v7,  "setWorkBlock:",  dispatch_block_create((dispatch_block_flags_t)0LL, v12));
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUCheckpointAsyncBlockContext;
  -[MSUCheckpointAsyncContext dealloc](&v3, "dealloc");
}

- (void)runSynchronousForCheckpoint:(void *)a3
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context]( self,  "checkpoint_closure_context"));
  ramrod_log_msg( "[AsyncCP][DispatchSync] Checkpoint %s dispatched synchronously because async is disabled.\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(step_desc + 8));
  dispatch_sync( (dispatch_queue_t)-[MSUCheckpointAsyncBlockContext workQueue](self, "workQueue"),  -[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"));
}

- (void)runForCheckpoint:(void *)a3
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context]( self,  "checkpoint_closure_context"));
  ramrod_log_msg( "[AsyncCP][DispatchAsync] Checkpoint %s dispatched asynchronously.\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(step_desc + 8));
  dispatch_async( (dispatch_queue_t)-[MSUCheckpointAsyncBlockContext workQueue](self, "workQueue"),  -[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"));
}

- (BOOL)wait
{
  return -[MSUCheckpointAsyncBlockContext waitUntilDate:]( self,  "waitUntilDate:",  +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
}

- (BOOL)waitUntilDate:(id)a3
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context]( self,  "checkpoint_closure_context"));
  [a3 timeIntervalSinceNow];
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)rint(v6 * 1000000000.0));
  ramrod_log_msg( "[AsyncCP][WaitStart] Start to Wait checkpoint %s.\n",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(step_desc + 8));
  LOBYTE(v7) = dispatch_block_wait(-[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"), v7) == 0;
  ramrod_log_msg( "[AsyncCP][WaitEnd] Wait checkpoint %s %s.\n",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  *(void *)(step_desc + 8));
  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWorkBlock:(id)a3
{
}

@end