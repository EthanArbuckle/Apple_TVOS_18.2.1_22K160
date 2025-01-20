@interface FARemotePresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)presentationCompletion;
- (void)_callCompletionWithResponse:(id)a3;
- (void)dealloc;
- (void)presentRemoteUserInterfaceWithOptions:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation FARemotePresenter

- (void)presentRemoteUserInterfaceWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  remoteListener = self->_remoteListener;
  self->_remoteListener = v8;

  -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_remoteListener, "resume");
  -[FARemotePresenter setPresentationCompletion:](self, "setPresentationCompletion:", v6);

  id v10 = objc_alloc(&OBJC_CLASS___SBSRemoteAlertDefinition);
  id v11 = [v10 initWithServiceName:FARemoteServiceName viewControllerClassName:FARemoteAlertServiceViewControllerClassName];
  v12 = (void *)objc_opt_new(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
  [v12 setUserInfo:v7];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](self->_remoteListener, "endpoint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _endpoint]);
  [v12 setXpcEndpoint:v14];

  id v15 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v11,  v12);
  id v16 = [v15 addObserver:self];
  uint64_t v18 = _FALogSystem(v16, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", (uint8_t *)&v21, 0xCu);
  }

  v20 = (void *)objc_opt_new(&OBJC_CLASS___SBSRemoteAlertActivationContext);
  [v15 activateWithContext:v20];
}

- (void)_callCompletionWithResponse:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FARemotePresenter presentationCompletion](self, "presentationCompletion"));

  if (v4)
  {
    v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[FARemotePresenter presentationCompletion]( self,  "presentationCompletion"));
    ((void (**)(void, id))v5)[2](v5, v6);

    -[FARemotePresenter setPresentationCompletion:](self, "setPresentationCompletion:", 0LL);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[FAFamilyPresenterHostInterface XPCInterface]( &OBJC_CLASS___FAFamilyPresenterHostInterface,  "XPCInterface"));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  uint64_t v6 = _FALogSystem(v3, v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Alert handle activated: %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Alert handle deactivated %@",  (uint8_t *)&v10,  0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  FAErrorDomain,  -1005LL,  0LL));
  id v9 = [[FACircleStateResponse alloc] initWithLoadSuccess:0 error:v8 userInfo:0];
  -[FARemotePresenter _callCompletionWithResponse:](self, "_callCompletionWithResponse:", v9);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _FALogSystem(v7, v8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Alert handler interrupted!: %@ %@",  (uint8_t *)&v12,  0x16u);
  }

  if (v7)
  {
    id v11 = [[FACircleStateResponse alloc] initWithLoadSuccess:0 error:v7 userInfo:0];
    -[FARemotePresenter _callCompletionWithResponse:](self, "_callCompletionWithResponse:", v11);
  }
}

- (void)dealloc
{
  uint64_t v3 = _FALogSystem(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002B320((uint64_t)self, v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FARemotePresenter;
  -[FARemotePresenter dealloc](&v5, "dealloc");
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end