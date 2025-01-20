@interface SHLSyncSession
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)startTransactionWithError:(id *)a3;
- (BOOL)undoTransactionWithError:(id *)a3;
- (OS_dispatch_queue)sessionDispatchQueue;
- (SHLLocalStateTransactionable)transaction;
- (SHLSyncSession)initWithConfiguration:(id)a3;
- (SHLSyncSessionDelegate)delegate;
- (SHLTaskSchedulerFactory)schedulerFactory;
- (void)executeFetchTask:(id)a3;
- (void)executeModifyTask:(id)a3;
- (void)executeTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSchedulerFactory:(id)a3;
- (void)setSessionDispatchQueue:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SHLSyncSession

- (SHLSyncSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLSyncSession;
  v5 = -[SHLSyncSession init](&v11, "init");
  if (v5)
  {
    v6 = -[SHLTaskSchedulerFactory initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLTaskSchedulerFactory),  "initWithConfiguration:",  v4);
    schedulerFactory = v5->_schedulerFactory;
    v5->_schedulerFactory = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.shazam.ShazamLibrary.syncSession.dispatchQueue", 0LL);
    sessionDispatchQueue = v5->_sessionDispatchQueue;
    v5->_sessionDispatchQueue = (OS_dispatch_queue *)v8;
  }

  return v5;
}

- (void)executeTask:(id)a3
{
  id v5 = a3;
  id v4 = [v5 type];
  if (v4 == (id)1)
  {
    -[SHLSyncSession executeFetchTask:](self, "executeFetchTask:", v5);
  }

  else if (!v4)
  {
    -[SHLSyncSession executeModifyTask:](self, "executeModifyTask:", v5);
  }
}

- (void)executeModifyTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession delegate](self, "delegate"));
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___SHLSyncSessionModifyTaskDelegate];

  if ((v6 & 1) == 0)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  @"You must conform to the protocol of the modify task you're trying to add."));
    objc_exception_throw(v13);
    v15 = v14;
    objc_destroyWeak((id *)&self->super.isa);
    objc_destroyWeak(&location);
    _Unwind_Resume(v15);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession delegate](self, "delegate"));
  [v4 setDelegate:v7];

  [v4 setSession:self];
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession schedulerFactory](self, "schedulerFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modifyTaskScheduler]);

  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preconditions]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003A2E0;
  v16[3] = &unk_10006DD50;
  objc_copyWeak(&v19, &location);
  id v11 = v4;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  +[SHLTaskPreconditionEvaluator evaluatePreconditions:withCompletion:]( &OBJC_CLASS___SHLTaskPreconditionEvaluator,  "evaluatePreconditions:withCompletion:",  v10,  v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)executeFetchTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession delegate](self, "delegate"));
  unsigned __int8 v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___SHLSyncSessionFetchTaskDelegate];

  if ((v6 & 1) == 0)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  @"You must conform to the protocol of the fetch task you're trying to add."));
    objc_exception_throw(v13);
    v15 = v14;
    objc_destroyWeak((id *)&self->super.isa);
    objc_destroyWeak(&location);
    _Unwind_Resume(v15);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession delegate](self, "delegate"));
  [v4 setDelegate:v7];

  [v4 setSession:self];
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession schedulerFactory](self, "schedulerFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchTaskScheduler]);

  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preconditions]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003A6DC;
  v16[3] = &unk_10006DD50;
  objc_copyWeak(&v19, &location);
  id v11 = v4;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  +[SHLTaskPreconditionEvaluator evaluatePreconditions:withCompletion:]( &OBJC_CLASS___SHLTaskPreconditionEvaluator,  "evaluatePreconditions:withCompletion:",  v10,  v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (BOOL)startTransactionWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession schedulerFactory](self, "schedulerFactory"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 createTransaction]);
  -[SHLSyncSession setTransaction:](self, "setTransaction:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession transaction](self, "transaction"));
  LOBYTE(a3) = [v7 startTransactionWithError:a3];

  return (char)a3;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession transaction](self, "transaction"));
  LOBYTE(a3) = [v5 commitTransactionWithError:a3];

  -[SHLSyncSession setTransaction:](self, "setTransaction:", 0LL);
  return (char)a3;
}

- (BOOL)undoTransactionWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLSyncSession transaction](self, "transaction"));
  LOBYTE(a3) = [v5 undoTransactionWithError:a3];

  -[SHLSyncSession setTransaction:](self, "setTransaction:", 0LL);
  return (char)a3;
}

- (SHLSyncSessionDelegate)delegate
{
  return (SHLSyncSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHLTaskSchedulerFactory)schedulerFactory
{
  return self->_schedulerFactory;
}

- (void)setSchedulerFactory:(id)a3
{
}

- (SHLLocalStateTransactionable)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)sessionDispatchQueue
{
  return self->_sessionDispatchQueue;
}

- (void)setSessionDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end