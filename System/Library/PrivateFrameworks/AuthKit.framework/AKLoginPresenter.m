@interface AKLoginPresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)presentationCompletion;
- (void)_callCompletionWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6;
- (void)authenticationRequestFinishedWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6;
- (void)presentOOPLoginUIWithContext:(id)a3 completion:(id)a4;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation AKLoginPresenter

- (void)presentOOPLoginUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100131E40();
  }

  id v38 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v38));
  id v11 = v38;
  v12 = v11;
  if (!v10)
  {
    uint64_t v13 = _AKLogSystem(v11);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100131DD4();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7034LL));
    -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:]( self,  "_callCompletionWithResults:password:additionalData:error:",  0LL,  0LL,  0LL,  v15);
  }

  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v10, @"context");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  &off_1001D8D10,  @"oopUIMode");
  v17 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  remoteListener = self->_remoteListener;
  self->_remoteListener = v17;

  -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_remoteListener, "resume");
  -[AKLoginPresenter setPresentationCompletion:](self, "setPresentationCompletion:", v7);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  id v20 = [v19 canOpenApplication:@"com.apple.AuthKitUIService" reason:&v37];
  if ((_DWORD)v20)
  {
    v35 = v12;
    id v21 = objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
    [v21 setObject:v16 forSetting:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](self->_remoteListener, "endpoint"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 _endpoint]);
    [v21 setObject:v23 forSetting:1];

    id v24 = objc_alloc(&OBJC_CLASS___BSAction);
    id v25 = [v21 copy];
    id v26 = [v24 initWithInfo:v25 responder:0];

    id v39 = v26;
    v40[0] = FBSOpenApplicationOptionKeyActions;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    v41[0] = v27;
    v41[1] = &__kCFBooleanFalse;
    v40[1] = FBSOpenApplicationOptionKeyActivateSuspended;
    v40[2] = FBSOpenApplicationOptionKeyLaunchIntent;
    v41[2] = &off_1001D8D28;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  3LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v28));

    uint64_t v31 = _AKLogSystem(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_100131CFC(v32);
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000366E0;
    v36[3] = &unk_1001C7BE0;
    v36[4] = self;
    [v19 openApplication:@"com.apple.AuthKitUIService" withOptions:v29 completion:v36];

    v12 = v35;
  }

  else
  {
    uint64_t v33 = _AKLogSystem(v20);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100131D3C(&v37, v34);
    }

    id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7034LL));
    -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:]( self,  "_callCompletionWithResults:password:additionalData:error:",  0LL,  0LL,  0LL,  v21);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKLoginPresenterHostInterface XPCInterface]( &OBJC_CLASS___AKLoginPresenterHostInterface,  "XPCInterface"));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)authenticationRequestFinishedWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100131F78(self, v15);
  }

  -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:]( self,  "_callCompletionWithResults:password:additionalData:error:",  v13,  v12,  v11,  v10);
}

- (void)_callCompletionWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKLoginPresenter presentationCompletion](self, "presentationCompletion"));

  if (v13)
  {
    uint64_t v14 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[AKLoginPresenter presentationCompletion]( self,  "presentationCompletion"));
    ((void (**)(void, id, id, id, id))v14)[2](v14, v15, v10, v11, v12);
  }

  -[AKLoginPresenter setPresentationCompletion:](self, "setPresentationCompletion:", 0LL);
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

  ;
}

@end