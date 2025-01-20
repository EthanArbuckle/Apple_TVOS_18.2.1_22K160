@interface AKPrivateEmailPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)privateEmailCompletion;
- (void)_callCompletionBlockWithEmail:(id)a3 error:(id)a4;
- (void)presentPrivateEmailWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)privateEmailFetchCompletedWith:(id)a3 error:(id)a4 completion:(id)a5;
- (void)setPrivateEmailCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKPrivateEmailPresenter

- (void)presentPrivateEmailWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, AKAltDSID);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  AKPrivateEmailIdentifierKey);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 clientAppBundleId]);
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 clientAppBundleId]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v15,  AKPrivateEmailClientAppBundleIdKey);
  }

  uint64_t v16 = _AKLogHme(v13, v14);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Context info %@", (uint8_t *)&v20, 0xCu);
  }

  v18 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  remoteListener = self->_remoteListener;
  self->_remoteListener = v18;

  -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_remoteListener, "resume");
  -[AKPrivateEmailPresenter setPrivateEmailCompletion:](self, "setPrivateEmailCompletion:", v8);
}

- (void)privateEmailFetchCompletedWith:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v12 = _AKLogHme(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received: %@ (%@)", (uint8_t *)&v14, 0x16u);
  }

  -[AKPrivateEmailPresenter _callCompletionBlockWithEmail:error:](self, "_callCompletionBlockWithEmail:error:", v8, v9);
  v10[2](v10, 1LL, 0LL);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailPresenterHostInterface XPCInterface]( &OBJC_CLASS___AKPrivateEmailPresenterHostInterface,  "XPCInterface"));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)_callCompletionBlockWithEmail:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKPrivateEmailPresenter privateEmailCompletion](self, "privateEmailCompletion"));

  if (v7)
  {
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AKPrivateEmailPresenter privateEmailCompletion]( self,  "privateEmailCompletion"));
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }

  -[AKPrivateEmailPresenter setPrivateEmailCompletion:](self, "setPrivateEmailCompletion:", 0LL);
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)privateEmailCompletion
{
  return self->_privateEmailCompletion;
}

- (void)setPrivateEmailCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end