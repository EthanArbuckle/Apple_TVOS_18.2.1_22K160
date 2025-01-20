@interface Task
- (BOOL)runSubTask:(id)a3 returningError:(id *)a4;
- (BOOL)runTaskReturningError:(id *)a3;
- (Task)init;
- (Task)initWithoutKeepAlive;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)lock;
- (void)unlock;
@end

@implementation Task

- (Task)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___Task;
  v2 = -[Task init](&v13, "init");
  v4 = v2;
  if (v2)
  {
    v5 = (objc_class *)objc_opt_class(v2, v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithFormat:]( &OBJC_CLASS___KeepAlive,  "keepAliveWithFormat:",  @"com.apple.appstored.%@",  v7));
    id v9 = v4->super._private;
    v4->super._private = (id)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v11 = *(void **)&v4->super._private1;
    *(void *)&v4->super._private1 = v10;
  }

  return v4;
}

- (Task)initWithoutKeepAlive
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___Task;
  v2 = -[Task init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
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
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Cannot execute asynchronous tasks inline",  0LL));
    objc_exception_throw(v8);
  }

  else
  {
    if ((-[Task isCancelled](self, "isCancelled") & 1) == 0)
    {
      -[Task main](self, "main");
      sub_10024FF64(self);
    }

    if (a3)
    {
      if (self) {
        id v6 = objc_getProperty(self, v5, 32LL, 1);
      }
      else {
        id v6 = 0LL;
      }
      *a3 = v6;
    }

    if (self) {
      return (uint64_t)self->_keepAlive & 1;
    }
  }

  return 0;
}

- (BOOL)runSubTask:(id)a3 returningError:(id *)a4
{
  v5 = a3;
  if ([v5 isAsynchronous])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Cannot execute asynchronous tasks inline",  0LL));
    objc_exception_throw(v10);
LABEL_12:
    BOOL v8 = 0;
    goto LABEL_10;
  }

  if (([v5 isCancelled] & 1) == 0)
  {
    [v5 main];
    sub_10024FF64(v5);
  }

  if (a4)
  {
    if (v5) {
      id v7 = objc_getProperty(v5, v6, 32LL, 1);
    }
    else {
      id v7 = 0LL;
    }
    *a4 = v7;
  }

  if (!v5) {
    goto LABEL_12;
  }
  BOOL v8 = v5[24] & 1;
LABEL_10:

  return v8;
}

- (void)unlock
{
}

- (void).cxx_destruct
{
}

@end