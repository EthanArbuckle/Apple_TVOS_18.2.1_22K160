@interface Task
- (BOOL)runSubTask:(id)a3 returningError:(id *)a4;
- (BOOL)runTaskReturningError:(id *)a3;
- (BOOL)success;
- (NSError)error;
- (Task)init;
- (Task)initWithoutKeepAlive;
- (void)_dispatchCompletionBlock;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)lock;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)unlock;
@end

@implementation Task

- (Task)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___Task;
  v2 = -[Task init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithFormat:]( &OBJC_CLASS___KeepAlive,  "keepAliveWithFormat:",  @"com.apple.storekit.%@",  v6));
    id v8 = v3->super._private;
    v3->super._private = (id)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v10 = *(void **)&v3->super._private1;
    *(void *)&v3->super._private1 = v9;
  }

  return v3;
}

- (Task)initWithoutKeepAlive
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___Task;
  v2 = -[Task init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v4 = *(void **)&v2->super._private1;
    *(void *)&v2->super._private1 = v3;
  }

  return v2;
}

- (void)completeWithError:(id)a3
{
  v4 = (NSLock *)a3;
  [*(id *)&self->super._private1 lock];
  lock = self->_lock;
  self->_lock = v4;
  objc_super v6 = v4;

  LOBYTE(self->_keepAlive) = 0;
  [*(id *)&self->super._private1 unlock];
}

- (void)completeWithSuccess
{
  lock = self->_lock;
  self->_lock = 0LL;

  LOBYTE(self->_keepAlive) = 1;
  [*(id *)&self->super._private1 unlock];
}

- (void)lock
{
}

- (BOOL)runTaskReturningError:(id *)a3
{
  if (-[Task isAsynchronous](self, "isAsynchronous"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Cannot execute asynchronous tasks inline",  0LL));
    objc_exception_throw(v6);
    return -[Task runSubTask:returningError:](v7, v8, v9, v10);
  }

  else
  {
    if ((-[Task isCancelled](self, "isCancelled") & 1) == 0)
    {
      -[Task main](self, "main");
      -[Task _dispatchCompletionBlock](self, "_dispatchCompletionBlock");
    }

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[Task error](self, "error"));
    }
    return -[Task success](self, "success");
  }

- (BOOL)runSubTask:(id)a3 returningError:(id *)a4
{
  id v5 = a3;
  if ([v5 isAsynchronous])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Cannot execute asynchronous tasks inline",  0LL));
    objc_exception_throw(v8);
    -[Task unlock](v9, v10);
  }

  else
  {
    if (([v5 isCancelled] & 1) == 0)
    {
      [v5 main];
      [v5 _dispatchCompletionBlock];
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v5 error]);
    }
    unsigned __int8 v6 = [v5 success];

    return v6;
  }

  return result;
}

- (void)unlock
{
}

- (void)_dispatchCompletionBlock
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Task completionBlock](self, "completionBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Task completionBlock](self, "completionBlock"));
    id v5 = [v4 copy];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000074F0;
    block[3] = &unk_1002E6A50;
    id v10 = v5;
    id v8 = v5;
    dispatch_async(v7, block);
  }

  -[Task setCompletionBlock:](self, "setCompletionBlock:", 0LL);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)success
{
  return (uint64_t)self->_keepAlive & 1;
}

- (void)setSuccess:(BOOL)a3
{
  LOBYTE(self->_keepAlive) = a3;
}

- (void).cxx_destruct
{
}

@end