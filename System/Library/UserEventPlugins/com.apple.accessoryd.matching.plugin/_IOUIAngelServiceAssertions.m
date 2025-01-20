@interface _IOUIAngelServiceAssertions
- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4;
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (NSString)description;
- (_IOUIAngelServiceAssertions)initWithRBSAssertion:(id)a3 forPid:(int)a4;
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
- (void)setWarningHandler:(id)a3;
@end

@implementation _IOUIAngelServiceAssertions

- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____IOUIAngelServiceAssertions;
  v8 = -[_IOUIAngelServiceAssertions init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_underlyingAssertion, a3);
    v9->_pid = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (_IOUIAngelServiceAssertions)initWithRBSAssertion:(id)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = -[_IOUIAngelServiceAssertions _initWithUnderlyingAssertion:forPid:]( self,  "_initWithUnderlyingAssertion:forPid:",  v6,  v4);
  if (v7) {
    [v6 addObserver:v7];
  }

  return v7;
}

- (BOOL)acquireWithError:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions underlyingAssertion](self, "underlyingAssertion"));
  LOBYTE(a3) = [v4 acquireWithError:a3];

  return (char)a3;
}

- (BOOL)invalidateWithError:(id *)a3
{
  return -[_IOUIAngelServiceAssertions _invalidateCallingHandler:withError:]( self,  "_invalidateCallingHandler:withError:",  1LL,  a3);
}

- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if (!-[_IOUIAngelServiceAssertions isValid](self, "isValid")) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions underlyingAssertion](self, "underlyingAssertion"));
  unsigned __int8 v8 = [v7 invalidateWithError:a4];

  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __67___IOUIAngelServiceAssertions__invalidateCallingHandler_withError___block_invoke;
    v12[3] = &unk_14C68;
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
  if (-[_IOUIAngelServiceAssertions isValid](self, "isValid"))
  {
    id v9 = [[RBSTerminateContext alloc] initWithExplanation:v8];
    BOOL v10 = 1;
    [v9 setReportType:1];
    [v9 setExceptionCode:a4];
    [v9 setMaximumTerminationResistance:20];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[_IOUIAngelServiceAssertions pid](self, "pid")));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v11));

    id v13 = [[RBSTerminateRequest alloc] initWithPredicate:v12 context:v9];
    id v17 = 0LL;
    unsigned __int8 v14 = [v13 execute:&v17];
    id v15 = v17;
    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[_IOUIAngelServiceAssertions invalidateAndKillWithExplanation:code:error:].cold.1(self, (uint64_t)v15);
      }
      BOOL v10 = -[_IOUIAngelServiceAssertions invalidateWithError:](self, "invalidateWithError:", a5);
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions underlyingAssertion](self, "underlyingAssertion"));
  unsigned __int8 v3 = [v2 isValid];

  return v3;
}

- (void)_callInvalidationHandler:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions invalidationHandler](self, "invalidationHandler"));

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions underlyingAssertion](self, "underlyingAssertion"));
      id v8 = (void *)v7;
      id v9 = @"NO";
      if (v3) {
        id v9 = @"YES";
      }
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      unsigned __int8 v14 = v9;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Calling invalidation handler for assertion %@, server-initiated: %@",  (uint8_t *)&v11,  0x16u);
    }

    BOOL v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[_IOUIAngelServiceAssertions invalidationHandler]( self,  "invalidationHandler"));
    -[_IOUIAngelServiceAssertions setInvalidationHandler:](self, "setInvalidationHandler:", 0LL);
    -[_IOUIAngelServiceAssertions setWarningHandler:](self, "setWarningHandler:", 0LL);
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      v10[2](v10, v3);
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
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions warningHandler](self, "warningHandler"));

  if (v4)
  {
    BOOL v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions warningHandler](self, "warningHandler"));
    -[_IOUIAngelServiceAssertions setWarningHandler:](self, "setWarningHandler:", 0LL);
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
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Did invalidate assertion %@",  (uint8_t *)&v6,  0xCu);
  }

  -[_IOUIAngelServiceAssertions _callInvalidationHandler:](self, "_callInvalidationHandler:", 1LL);
}

- (void)assertionWillInvalidate:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Will invalidate assertion %@",  (uint8_t *)&v5,  0xCu);
  }

  -[_IOUIAngelServiceAssertions _callWarningHandler](self, "_callWarningHandler");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_IOUIAngelServiceAssertions underlyingAssertion](self, "underlyingAssertion"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_IOUIAngelServiceAssertions for underlying assertion: %@",  v2));

  return (NSString *)v3;
}

- (void)dealloc
{
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

- (void).cxx_destruct
{
}

- (void)invalidateAndKillWithExplanation:(void *)a1 code:(uint64_t)a2 error:.cold.1( void *a1,  uint64_t a2)
{
  int v3 = 134218242;
  uint64_t v4 = (int)[a1 pid];
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not terminate app with pid %ld due to error: %@, invalidating instead",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_5();
}

@end