@interface AKAccountRecoveryController
+ (BOOL)shouldProcessServerUIRequest:(id)a3;
- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4;
- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4 requestDispatcher:(id)a5;
- (id)_recoveryContextFromServerInfo:(id)a3 error:(id *)a4;
- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5;
- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)retrieveRecoveryDataForServerContext:(id)a3 recoveryInfo:(id)a4 completion:(id)a5;
- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation AKAccountRecoveryController

- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4 requestDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AKAccountRecoveryController;
  v12 = -[AKAccountRecoveryController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authUILiaison, a3);
    objc_storeStrong((id *)&v13->_client, a4);
    objc_storeStrong((id *)&v13->_requestDispatcher, a5);
  }

  return v13;
}

- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKRequestDispatcher sharedDispatcher](&OBJC_CLASS___AKRequestDispatcher, "sharedDispatcher"));
  id v9 = -[AKAccountRecoveryController initWithUILiaison:client:requestDispatcher:]( self,  "initWithUILiaison:client:requestDispatcher:",  v7,  v6,  v8);

  return v9;
}

+ (BOOL)shouldProcessServerUIRequest:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:AKActionHeaderKey]);
  else {
    unsigned __int8 v4 = [v3 isEqualToString:AKActionStartICSC];
  }

  return v4;
}

- (void)retrieveRecoveryDataForServerContext:(id)a3 recoveryInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v25 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountRecoveryController _recoveryContextFromServerInfo:error:]( self,  "_recoveryContextFromServerInfo:error:",  v9,  &v25));
  id v12 = v25;
  uint64_t v13 = _AKLogSystem(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  objc_super v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AKAccountRecoveryController recoveryContext is valid %@:",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    authUILiaison = self->_authUILiaison;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 authContext]);
    client = self->_client;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100017D00;
    v20[3] = &unk_1001C6B88;
    objc_copyWeak(&v24, (id *)buf);
    id v21 = v8;
    id v22 = v11;
    id v23 = v10;
    -[AKAuthenticationUILiaison presentNativeRecoveryUIForContext:recoveryContext:client:completion:]( authUILiaison,  "presentNativeRecoveryUIForContext:recoveryContext:client:completion:",  v18,  v22,  client,  v20);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10012D8B4();
    }

    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0LL, 0LL, v12);
  }
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 decodedRecoveryIdentityTokenString]);
  BOOL v9 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v9)
  {
    uint64_t v24 = _AKLogSystem(v9);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10012D9D0();
    }

    uint64_t v26 = -7026LL;
    goto LABEL_12;
  }

  if (![v8 length])
  {
    uint64_t v27 = _AKLogSystem(0LL);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10012D9A4();
    }

    uint64_t v26 = -7056LL;
LABEL_12:
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v26));
    v7[2](v7, 0LL, v11);
    goto LABEL_13;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v11));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 renewRecoveryTokenURL]);

  v14 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v13);
  -[NSMutableURLRequest setHTTPMethod:](v14, "setHTTPMethod:", @"POST");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
  -[NSMutableURLRequest ak_addClientApp:](v14, "ak_addClientApp:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
  -[NSMutableURLRequest ak_addClientBundleIDHeader:](v14, "ak_addClientBundleIDHeader:", v16);

  -[NSMutableURLRequest ak_addClientInfoHeader](v14, "ak_addClientInfoHeader");
  -[NSMutableURLRequest ak_addDeviceUDIDHeader](v14, "ak_addDeviceUDIDHeader");
  -[NSMutableURLRequest ak_addInternalBuildHeader](v14, "ak_addInternalBuildHeader");
  -[NSMutableURLRequest ak_addSeedBuildHeader](v14, "ak_addSeedBuildHeader");
  -[NSMutableURLRequest ak_addFeatureMaskHeader](v14, "ak_addFeatureMaskHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
  -[NSMutableURLRequest ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:]( v14,  "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:",  v8,  v18);

  v32[0] = AKRequestBodyKey;
  v32[1] = AKRequestHeadersKey;
  v33[0] = &__NSDictionary0__struct;
  v33[1] = &__NSDictionary0__struct;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  uint64_t v20 = _AKLogSystem(-[NSMutableURLRequest ak_setBodyWithParameters:](v14, "ak_setBodyWithParameters:", v19));
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Recovery token renewal will start.", buf, 2u);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10001865C;
  v29[3] = &unk_1001C6BB0;
  v30 = v7;
  id v23 = [v22 beginDataTaskWithRequest:v14 completionHandler:v29];

LABEL_13:
}

- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v11)
  {
    id v12 = objc_alloc(&OBJC_CLASS___AKSRPAuthenticationContextHelper);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 authContext]);
    v14 = -[AKSRPAuthenticationContextHelper initWithContext:](v12, "initWithContext:", v13);

    -[AKSRPContextHelper setAccountRecoveryMasterKey:](v14, "setAccountRecoveryMasterKey:", v8);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v9 decodedRecoveryIdentityTokenString]);
    -[AKSRPContextHelper setDecodedRecoveryIdentityToken:](v14, "setDecodedRecoveryIdentityToken:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 decodedRecoveryPETString]);
    -[AKSRPContextHelper setDecodedRecoveryPET:](v14, "setDecodedRecoveryPET:", v16);

    -[AKSRPContextHelper setClient:](v14, "setClient:", self->_client);
    -[AKSRPContextHelper setIgnoreInternalTokens:](v14, "setIgnoreInternalTokens:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 authContext]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v18));
    uint64_t v20 = AKURLBagKeyBasicAuthKey;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100018AEC;
    v24[3] = &unk_1001C6C00;
    id v25 = v14;
    id v26 = v9;
    uint64_t v27 = self;
    id v28 = v10;
    id v21 = v14;
    [v19 urlForKey:v20 completion:v24];
  }

  else
  {
    uint64_t v22 = _AKLogSystem(v11);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10012D9D0();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v18);
  }
}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _AKLogSystem(v9);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to persist verifier", buf, 2u);
  }

  id v12 = [v7 keyType];
  BOOL v13 = v12 != (id)1;
  BOOL v14 = v12 == (id)1;
  objc_super v15 = (id *)&AKURLBagKeyStoreModernRecovery;
  if (v12 == (id)1) {
    objc_super v15 = (id *)&AKURLBagKeyStoreEDPToken;
  }
  id v16 = *v15;
  v17 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider),  "initWithContext:urlBagKey:",  v9,  v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 verifier]);
  -[AKURLRequestProviderImpl setAuthKitBody:](v17, "setAuthKitBody:", v18);

  -[AKGrandSlamRequestProvider setShouldSendIdentityToken:](v17, "setShouldSendIdentityToken:", v13);
  -[AKGrandSlamRequestProvider setRequestBodyType:](v17, "setRequestBodyType:", v14);
  -[AKGrandSlamRequestProvider setExpectedResponseType:](v17, "setExpectedResponseType:", v14);
  v19 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v17);
  id v20 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
  -[AKServiceControllerImpl setAuthenticationDelegate:](v19, "setAuthenticationDelegate:", v20);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100019154;
  v22[3] = &unk_1001C6C28;
  id v23 = v8;
  id v21 = v8;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v19, "executeRequestWithCompletion:", v22);
}

- (id)_recoveryContextFromServerInfo:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKAccountRecoveryContext recoveryContextWithServerInfo:]( &OBJC_CLASS___AKAccountRecoveryContext,  "recoveryContextWithServerInfo:",  a3));
  id v6 = [v5 isValid];
  int v7 = (int)v6;
  uint64_t v8 = _AKLogSystem(v6);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recovery context is valid...", v21, 2u);
    }

    a4 = v5;
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10012DBB0();
    }

    if (a4)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7059LL));
      *a4 = v11;
      uint64_t v12 = _AKLogSystem(v11);
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10012DB48((uint64_t)a4, v13, v14, v15, v16, v17, v18, v19);
      }

      a4 = 0LL;
    }
  }

  return a4;
}

- (void).cxx_destruct
{
}

@end