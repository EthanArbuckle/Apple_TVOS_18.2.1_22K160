@interface DMDEngineRegisterConfigurationSourceOperation
- (DMDEngineRegisterConfigurationSourceOperationDelegate)delegate;
- (DMFRegisterConfigurationSourceRequest)request;
- (NSString)clientIdentifier;
- (void)delegateUpdatedDeclarationSourceAndEndOperation:(id)a3;
- (void)main;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineRegisterConfigurationSourceOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  id v4 = [v3 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003661C;
  v6[3] = &unk_10009D820;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)delegateUpdatedDeclarationSourceAndEndOperation:(id)a3
{
  id v9 = a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 handleFailureInMethod:a2, self, @"DMDEngineRegisterConfigurationSourceOperation.m", 97, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRegisterConfigurationSourceOperation delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v5,  "registerConfigurationSourceOperation:didUpdateRegistrationForConfigurationSource:") & 1) != 0) {
    [v5 registerConfigurationSourceOperation:self didUpdateRegistrationForConfigurationSource:v9];
  }
  -[DMDEngineRegisterConfigurationSourceOperation setResultObject:](self, "setResultObject:", 0LL);
}

- (DMDEngineRegisterConfigurationSourceOperationDelegate)delegate
{
  return (DMDEngineRegisterConfigurationSourceOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DMFRegisterConfigurationSourceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end