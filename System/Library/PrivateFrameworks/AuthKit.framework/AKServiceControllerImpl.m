@interface AKServiceControllerImpl
- (AKAuthHandler)reauthHandler;
- (AKRequestDispatcher)requestDispatcher;
- (AKServiceControllerImpl)initWithRequestProvider:(id)a3;
- (AKURLRequestProvider)requestProvider;
- (void)executeRequestWithCompletion:(id)a3;
- (void)setAuthenticationDelegate:(id)a3;
- (void)setReauthHandler:(id)a3;
- (void)setRequestDispatcher:(id)a3;
- (void)setRequestProvider:(id)a3;
@end

@implementation AKServiceControllerImpl

- (AKServiceControllerImpl)initWithRequestProvider:(id)a3
{
  id v5 = a3;
  v6 = -[AKServiceControllerImpl init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestProvider, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKRequestDispatcher sharedDispatcher](&OBJC_CLASS___AKRequestDispatcher, "sharedDispatcher"));
    requestDispatcher = v7->_requestDispatcher;
    v7->_requestDispatcher = (AKRequestDispatcher *)v8;
  }

  return v7;
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (void)executeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AKDispatchableURLRequest);
  requestProvider = self->_requestProvider;
  reauthHandler = self->_reauthHandler;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006A67C;
  v11[3] = &unk_1001C9130;
  id v12 = v4;
  id v8 = v4;
  v9 = -[AKDispatchableURLRequest initWithURLRequestProvider:authenticationHandler:completionHandler:]( v5,  "initWithURLRequestProvider:authenticationHandler:completionHandler:",  requestProvider,  reauthHandler,  v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKServiceControllerImpl requestDispatcher](self, "requestDispatcher"));
  [v10 submitDispatchableRequest:v9];
}

- (AKRequestDispatcher)requestDispatcher
{
  return self->_requestDispatcher;
}

- (void)setRequestDispatcher:(id)a3
{
}

- (AKURLRequestProvider)requestProvider
{
  return self->_requestProvider;
}

- (void)setRequestProvider:(id)a3
{
}

- (AKAuthHandler)reauthHandler
{
  return self->_reauthHandler;
}

- (void)setReauthHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end