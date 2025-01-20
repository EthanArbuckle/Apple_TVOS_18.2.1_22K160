@interface AKEducationEnterpriseController
- (AKEducationEnterpriseController)initWithContext:(id)a3 client:(id)a4;
- (void)_handleIdentityProviderResponsePayload:(id)a3 completion:(id)a4;
- (void)_showIdentityProviderUIFromResponse:(id)a3 completion:(id)a4;
- (void)beginFederatedAuthWithInitialResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation AKEducationEnterpriseController

- (AKEducationEnterpriseController)initWithContext:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKEducationEnterpriseController;
  v9 = -[AKEducationEnterpriseController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v10;
}

- (void)beginFederatedAuthWithInitialResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext username](self->_context, "username"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext altDSID](self->_context, "altDSID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 secondaryActionURLKey]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _urlAtKey:v11]);

    if (v12)
    {
      v14 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationContext username](self->_context, "username"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v14,  "setValue:forHTTPHeaderField:",  v15,  AKAccountNameHeaderKey);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 federatedAuthSamlRequest]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"RelayState"]);

      if (v17) {
        -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v14,  "setValue:forHTTPHeaderField:",  v17,  @"X-Apple-I-FA-Relay-State");
      }
      -[AKAppleIDAuthenticationContext set_shouldSendGrandSlamTokensForRemoteUI:]( self->_context,  "set_shouldSendGrandSlamTokensForRemoteUI:",  0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKDServerUIContext serverUIContextFromResponse:authContext:urlRequest:]( &OBJC_CLASS___AKDServerUIContext,  "serverUIContextFromResponse:authContext:urlRequest:",  v6,  self->_context,  v14));
      [v18 setShouldPreventDismissAfterUserSkip:1];
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 requestConfiguration]);
      [v19 setPresentationType:2];

      v20 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthenticationUILiaison sharedInstance]( &OBJC_CLASS___AKAuthenticationUILiaison,  "sharedInstance"));
      v22 = -[AKDServerUIController initWithLiaison:client:delegate:]( v20,  "initWithLiaison:client:delegate:",  v21,  self->_client,  0LL);

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000B4E24;
      v25[3] = &unk_1001C8300;
      v25[4] = self;
      id v26 = v6;
      id v27 = v7;
      -[AKDServerUIController showServerUIWithContext:completion:](v22, "showServerUIWithContext:completion:", v18, v25);
    }

    else
    {
      uint64_t v23 = _AKLogSystem(v13);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100141AD8(v24);
      }

      -[AKEducationEnterpriseController _showIdentityProviderUIFromResponse:completion:]( self,  "_showIdentityProviderUIFromResponse:completion:",  v6,  v7);
    }
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7022LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v9);
  }
}

- (void)_showIdentityProviderUIFromResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 federatedAuthURL]);
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Server says to show UI at IDP URL: %@",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 federatedAuthURL]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v12));
  [v13 setHTTPMethod:@"POST"];
  [v13 setHTTPContentType:@"application/x-www-form-urlencoded"];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 federatedAuthRequestPayload]);
  [v13 setHTTPBody:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKDServerUIContext serverUIContextFromResponse:authContext:urlRequest:]( &OBJC_CLASS___AKDServerUIContext,  "serverUIContextFromResponse:authContext:urlRequest:",  v6,  self->_context,  v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestConfiguration]);
  [v16 setRequestType:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 federatedAuthURLWhiteList]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 requestConfiguration]);
  [v18 setWhitelistedPathURLs:v17];

  v19 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AKAuthenticationUILiaison sharedInstance](&OBJC_CLASS___AKAuthenticationUILiaison, "sharedInstance"));
  v21 = -[AKDServerUIController initWithLiaison:client:delegate:]( v19,  "initWithLiaison:client:delegate:",  v20,  self->_client,  0LL);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000B5184;
  v23[3] = &unk_1001CAC60;
  v23[4] = self;
  id v24 = v7;
  id v22 = v7;
  -[AKDServerUIController showServerUIWithContext:completion:](v21, "showServerUIWithContext:completion:", v15, v23);
}

- (void)_handleIdentityProviderResponsePayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void, void))v7;
  if (v6)
  {
    uint64_t v9 = _AKLogSystem(v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handling IDP response: %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKRequestURLKey]);
    unsigned int v12 = +[AKFeatureManager isYorktownEnabled](&OBJC_CLASS___AKFeatureManager, "isYorktownEnabled");
    uint64_t v13 = &off_1001C54D8;
    if (!v12) {
      uint64_t v13 = &off_1001C5518;
    }
    id v14 = [objc_alloc(*v13) initWithContext:self->_context url:v11];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKRequestBodyKey]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);
    [v14 setAuthKitBodyData:v16];

    [v14 setClient:self->_client];
    v17 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v14);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000B5454;
    v19[3] = &unk_1001C6C28;
    v20 = v8;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v17, "executeRequestWithCompletion:", v19);
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7019LL));
    ((void (**)(void, void, void, void *))v8)[2](v8, 0LL, 0LL, v18);
  }
}

- (void).cxx_destruct
{
}

@end