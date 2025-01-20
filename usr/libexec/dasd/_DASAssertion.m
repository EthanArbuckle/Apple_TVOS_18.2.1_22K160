@interface _DASAssertion
- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4;
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (NSString)description;
- (OS_os_log)log;
- (_DASAssertion)initWithRBSAssertion:(id)a3 forPid:(int)a4;
- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4;
- (id)invalidationHandler;
- (id)underlyingAssertion;
- (id)warningHandler;
- (int)pid;
- (os_unfair_lock_s)lock;
- (void)_callInvalidationHandler:(BOOL)a3;
- (void)_callWarningHandler;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)dealloc;
- (void)setInvalidationHandler:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setWarningHandler:(id)a3;
@end

@implementation _DASAssertion

- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____DASAssertion;
  v8 = -[_DASAssertion init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_underlyingAssertion, a3);
    v9->_pid = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
    os_log_t v10 = os_log_create("com.apple.duetactivityscheduler", "Assertion");
    log = v9->_log;
    v9->_log = v10;
  }

  return v9;
}

- (_DASAssertion)initWithRBSAssertion:(id)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = -[_DASAssertion _initWithUnderlyingAssertion:forPid:](self, "_initWithUnderlyingAssertion:forPid:", v6, v4);
  if (v7) {
    [v6 addObserver:v7];
  }

  return v7;
}

- (BOOL)acquireWithError:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  LOBYTE(a3) = [v4 acquireWithError:a3];

  return (char)a3;
}

- (BOOL)invalidateWithError:(id *)a3
{
  return -[_DASAssertion _invalidateCallingHandler:withError:](self, "_invalidateCallingHandler:withError:", 1LL, a3);
}

- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if (!-[_DASAssertion isValid](self, "isValid")) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  unsigned __int8 v8 = [v7 invalidateWithError:a4];

  if (v5)
  {
    objc_initWeak(&location, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    os_log_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000054B0;
    v12[3] = &unk_100114FB8;
    objc_copyWeak(&v13, &location);
    dispatch_async(v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (-[_DASAssertion isValid](self, "isValid"))
  {
    id v9 = [[RBSTerminateContext alloc] initWithExplanation:v8];
    BOOL v10 = 1;
    [v9 setReportType:1];
    [v9 setExceptionCode:a4];
    [v9 setMaximumTerminationResistance:20];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[_DASAssertion pid](self, "pid")));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v11));

    id v13 = [[RBSTerminateRequest alloc] initWithPredicate:v12 context:v9];
    id v18 = 0LL;
    unsigned __int8 v14 = [v13 execute:&v18];
    id v15 = v18;
    if ((v14 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1000B0A4C(log, self, (uint64_t)v15);
      }
      BOOL v10 = -[_DASAssertion invalidateWithError:](self, "invalidateWithError:", a5);
    }
  }

  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  unsigned __int8 v3 = [v2 isValid];

  return v3;
}

- (void)_callInvalidationHandler:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion invalidationHandler](self, "invalidationHandler"));

  if (v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = log;
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
      BOOL v10 = (void *)v9;
      v11 = @"NO";
      if (v3) {
        v11 = @"YES";
      }
      int v13 = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling invalidation handler for assertion %@, server-initiated: %@",  (uint8_t *)&v13,  0x16u);
    }

    v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[_DASAssertion invalidationHandler](self, "invalidationHandler"));
    -[_DASAssertion setInvalidationHandler:](self, "setInvalidationHandler:", 0LL);
    -[_DASAssertion setWarningHandler:](self, "setWarningHandler:", 0LL);
    os_unfair_lock_unlock(p_lock);
    if (v12)
    {
      v12[2](v12, v3);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
  }

- (void)_callWarningHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion warningHandler](self, "warningHandler"));

  if (v4)
  {
    BOOL v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[_DASAssertion warningHandler](self, "warningHandler"));
    -[_DASAssertion setWarningHandler:](self, "setWarningHandler:", 0LL);
    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      v5[2](v5);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
  }

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Did invalidate assertion %@",  (uint8_t *)&v7,  0xCu);
  }

  -[_DASAssertion _callInvalidationHandler:](self, "_callInvalidationHandler:", 1LL);
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Will invalidate assertion %@",  (uint8_t *)&v6,  0xCu);
  }

  -[_DASAssertion _callWarningHandler](self, "_callWarningHandler");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_DASAssertion for underlying assertion: %@",  v2));

  return (NSString *)v3;
}

- (void)dealloc
{
  if (-[_DASAssertion isValid](self, "isValid"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT)) {
      sub_1000B0B00((uint64_t)self, log);
    }
    -[_DASAssertion _invalidateCallingHandler:withError:](self, "_invalidateCallingHandler:withError:", 0LL, 0LL);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____DASAssertion;
  -[_DASAssertion dealloc](&v4, "dealloc");
}

- (id)underlyingAssertion
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (int)pid
{
  return self->_pid;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)warningHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWarningHandler:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end