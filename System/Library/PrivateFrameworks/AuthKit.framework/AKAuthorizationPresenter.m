@interface AKAuthorizationPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)authorizationResponseValidator;
- (id)fetchIconBlock;
- (id)presentationCompletion;
- (void)_callCompletionBlockWithAuthorization:(id)a3 error:(id)a4;
- (void)authorizationRequestFinishedWithAuthorization:(id)a3 error:(id)a4 completion:(id)a5;
- (void)authorizationRequestInitiatedWithUserProvidedInformation:(id)a3 completion:(id)a4;
- (void)continueFetchingIconWithCompletion:(id)a3;
- (void)dealloc;
- (void)presentAuthorizationWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)setAuthorizationResponseValidator:(id)a3;
- (void)setFetchIconBlock:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKAuthorizationPresenter

- (void)presentAuthorizationWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationPresenterHostInterface XPCInterface]( &OBJC_CLASS___AKAuthorizationPresenterHostInterface,  "XPCInterface"));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)authorizationRequestFinishedWithAuthorization:(id)a3 error:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote view sent a finish event", v13, 2u);
  }

  -[AKAuthorizationPresenter _callCompletionBlockWithAuthorization:error:]( self,  "_callCompletionBlockWithAuthorization:error:",  v10,  v9);
  v8[2](v8, 1LL, 0LL);
}

- (void)authorizationRequestInitiatedWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Remote view sent a user response event: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AKAuthorizationPresenter authorizationResponseValidator]( self,  "authorizationResponseValidator"));
  ((void (**)(void, id, id))v10)[2](v10, v6, v7);
}

- (void)continueFetchingIconWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationPresenter fetchIconBlock](self, "fetchIconBlock"));

  if (v5)
  {
    id v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[AKAuthorizationPresenter fetchIconBlock](self, "fetchIconBlock"));
    v6[2](v6, v4);
  }

  else
  {
    id v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7027LL));
    v4[2](v4, 0LL);
  }
}

- (void)_callCompletionBlockWithAuthorization:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationPresenter presentationCompletion](self, "presentationCompletion"));

  if (v7)
  {
    uint64_t v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AKAuthorizationPresenter presentationCompletion]( self,  "presentationCompletion"));
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }

  -[AKAuthorizationPresenter setPresentationCompletion:](self, "setPresentationCompletion:", 0LL);
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10012C980((uint64_t)self, v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKAuthorizationPresenter;
  -[AKAuthorizationPresenter dealloc](&v5, "dealloc");
}

- (id)authorizationResponseValidator
{
  return self->_authorizationResponseValidator;
}

- (void)setAuthorizationResponseValidator:(id)a3
{
}

- (id)fetchIconBlock
{
  return self->_fetchIconBlock;
}

- (void)setFetchIconBlock:(id)a3
{
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