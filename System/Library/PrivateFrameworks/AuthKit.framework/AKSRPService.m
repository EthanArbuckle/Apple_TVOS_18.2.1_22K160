@interface AKSRPService
- (AKSRPService)initWithClient:(id)a3;
- (AKSRPService)initWithClient:(id)a3 requestDispatcher:(id)a4;
- (BOOL)_shouldClearCKForFailedMagicAuthWithError:(int64_t)a3 authContextHelper:(id)a4;
- (id)_anisetteActionTargetForServerResponse:(id)a3 andContext:(id)a4;
- (void)_continueSRPContractWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_doURLSwitchWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_handleError:(id)a3 withServerResponse:(id)a4 context:(id)a5 andCompletion:(id)a6;
- (void)_parseFailedServerResponse:(id)a3 withError:(id)a4 context:(id)a5 completion:(id)a6;
- (void)_reprovisionAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_resyncAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)performSRPContractWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKSRPService

- (AKSRPService)initWithClient:(id)a3 requestDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKSRPService;
  v9 = -[AKSRPService init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_requestDispatcher, a4);
  }

  return v10;
}

- (AKSRPService)initWithClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKRequestDispatcher sharedDispatcher](&OBJC_CLASS___AKRequestDispatcher, "sharedDispatcher"));
  v6 = -[AKSRPService initWithClient:requestDispatcher:](self, "initWithClient:requestDispatcher:", v4, v5);

  return v6;
}

- (void)performSRPContractWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v8));
  uint64_t v10 = AKURLBagKeyBasicAuthKey;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006C884;
  v13[3] = &unk_1001C91A8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 urlForKey:v10 completion:v13];
}

- (void)_continueSRPContractWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc(&OBJC_CLASS___AKSRPRequest);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006CA28;
  v15[3] = &unk_1001C91D0;
  id v16 = v8;
  id v17 = v9;
  v15[4] = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = -[AKSRPRequest initWithURL:contextHelper:completionHandler:]( v11,  "initWithURL:contextHelper:completionHandler:",  v10,  v12,  v15);

  -[AKRequestDispatcher submitDispatchableRequest:](self->_requestDispatcher, "submitDispatchableRequest:", v14);
}

- (void)_parseFailedServerResponse:(id)a3 withError:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = _AKLogSystem(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001381D8((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);
  }

  if ([v10 isAnisetteResyncRequired])
  {
    -[AKSRPService _resyncAnisetteWithServerResponse:context:completion:]( self,  "_resyncAnisetteWithServerResponse:context:completion:",  v10,  v12,  v13);
    goto LABEL_24;
  }

  if ([v10 isAnisetteReprovisioningRequired])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_generalErrorWithCode:errorDomain:underlyingError:]( &OBJC_CLASS___NSError,  "ak_generalErrorWithCode:errorDomain:underlyingError:",  -8027LL,  AKAnisetteErrorDomain,  v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:error:",  @"com.apple.authkit.midInvalidated",  v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
    [v24 sendEvent:v23];

    -[AKSRPService _reprovisionAnisetteWithServerResponse:context:completion:]( self,  "_reprovisionAnisetteWithServerResponse:context:completion:",  v10,  v12,  v13);
LABEL_7:

    goto LABEL_24;
  }

  if ([v10 isURLSwitchingRequired])
  {
    -[AKSRPService _doURLSwitchWithServerResponse:context:completion:]( self,  "_doURLSwitchWithServerResponse:context:completion:",  v10,  v12,  v13);
    goto LABEL_24;
  }

  if ([v10 isRetryRequired]
    && (id v25 = [v12 retryAuth], (v25 & 1) == 0))
  {
    uint64_t v30 = _AKLogSystem(v25);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Server told us to retry. Retrying auth...",  v36,  2u);
    }

    [v12 setRetryAuth:1];
    -[AKSRPService performSRPContractWithContext:completion:]( self,  "performSRPContractWithContext:completion:",  v12,  v13);
  }

  else
  {
    id v26 = [v10 isSecondaryActionRequired];
    if (!(_DWORD)v26)
    {
      if (!v11 || [v11 code] != (id)6)
      {
        -[AKSRPService _handleError:withServerResponse:context:andCompletion:]( self,  "_handleError:withServerResponse:context:andCompletion:",  v11,  v10,  v12,  v13);
        goto LABEL_24;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7005LL,  v11));
      +[AKCAAuthEventReporter reportAuthEventOfType:success:error:]( &OBJC_CLASS___AKCAAuthEventReporter,  "reportAuthEventOfType:success:error:",  AKAuthEventType_SRP_AUTH_FAILURE,  0LL,  v22);
      id v29 = [v12 retryAuth];
      if ((v29 & 1) != 0)
      {
        v13[2](v13, 0LL, v22);
      }

      else
      {
        uint64_t v32 = _AKLogSystem(v29);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34[0] = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Network error. Retrying auth once...",  (uint8_t *)v34,  2u);
        }

        [v12 setRetryAuth:1];
        -[AKSRPService performSRPContractWithContext:completion:]( self,  "performSRPContractWithContext:completion:",  v12,  v13);
      }

      goto LABEL_7;
    }

    uint64_t v27 = _AKLogSystem(v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Auth failed but the server says to try a secondary auth action anyway. Let's how this goes...",  buf,  2u);
    }

    ((void (**)(id, id, void *))v13)[2](v13, v10, 0LL);
  }

- (id)_anisetteActionTargetForServerResponse:(id)a3 andContext:(id)a4
{
  id v5 = a4;
  if ([a3 shouldProxyAnisetteAction])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authContext]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 proxiedDevice]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  }

  return v7;
}

- (void)_resyncAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Need Anisette resync...", buf, 2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKSRPService _anisetteActionTargetForServerResponse:andContext:]( self,  "_anisetteActionTargetForServerResponse:andContext:",  v10,  v8));
  uint64_t v14 = objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService);
  client = self->_client;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 authContext]);
  uint64_t v17 = -[AKAnisetteProvisioningService initWithClient:authenticationContext:]( v14,  "initWithClient:authenticationContext:",  client,  v16);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 anisetteResyncData]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10006D060;
  v21[3] = &unk_1001C7EC8;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v19 = v9;
  id v20 = v8;
  -[AKAnisetteProvisioningService syncAnisetteWithSIMData:device:completion:]( v17,  "syncAnisetteWithSIMData:device:completion:",  v18,  v13,  v21);
}

- (void)_reprovisionAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Need Anisette reprovisioning...", buf, 2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKSRPService _anisetteActionTargetForServerResponse:andContext:]( self,  "_anisetteActionTargetForServerResponse:andContext:",  v10,  v8));
  uint64_t v14 = objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService);
  client = self->_client;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 authContext]);
  uint64_t v17 = -[AKAnisetteProvisioningService initWithClient:authenticationContext:]( v14,  "initWithClient:authenticationContext:",  client,  v16);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006D39C;
  v20[3] = &unk_1001C7EC8;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  -[AKAnisetteProvisioningService eraseAnisetteForDevice:completion:]( v17,  "eraseAnisetteForDevice:completion:",  v13,  v20);
}

- (void)_doURLSwitchWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "URLSwitching needed...", buf, 2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 urlSwitchingData]);
  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v15));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 urlSwitchingData]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10006D734;
    v21[3] = &unk_1001C7EC8;
    v21[4] = self;
    id v22 = v9;
    id v23 = v10;
    [v16 forceUpdateBagWithUrlSwitchData:v17 completion:v21];
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v14);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10013823C(v19);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7087LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v20);
  }
}

- (void)_handleError:(id)a3 withServerResponse:(id)a4 context:(id)a5 andCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v54 = (void (**)(id, void, id))a6;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 errorMessage]);
  if (v14
    && (id v15 = (void *)v14,
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 errorMessageTitle]),
        v16,
        v15,
        v16))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 errorMessageTitle]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v17,  NSLocalizedFailureErrorKey);

    uint64_t v18 = &NSLocalizedFailureReasonErrorKey;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);

    if (!v19) {
      goto LABEL_7;
    }
    uint64_t v18 = &NSLocalizedDescriptionKey;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 errorMessage]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, *v18);

LABEL_7:
  v55 = v12;
  if (![v10 errorCode])
  {
    id v22 = 0LL;
    uint64_t v27 = 0LL;
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }

  uint64_t v21 = AKAppleIDAuthenticationServerErrorDomain;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  AKAppleIDAuthenticationServerErrorDomain,  [v10 errorCode],  0));
  if ([v10 subErrorCode])
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v21,  [v10 subErrorCode],  0));
    NSErrorUserInfoKey v56 = NSUnderlyingErrorKey;
    v57 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    id v25 = v13;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ak_errorByAppendingUserInfo:", v24));

    id v22 = (void *)v26;
    id v13 = v25;
  }

  if (v9)
  {
LABEL_15:
    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 underlyingErrors]);
    id v29 = [v28 count];

    if (v29 || !v22)
    {
      NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    }

    else
    {
      uint64_t v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v22,  NSUnderlyingErrorKey);
      -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v13);
      uint64_t v32 = v13;
      uint64_t v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ak_errorByAppendingUserInfo:", v30));

      id v9 = (id)v33;
      id v13 = v32;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v9, v31);
    uint64_t v27 = v9;
    goto LABEL_20;
  }

  if (v22) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v22, NSUnderlyingErrorKey);
  }
  uint64_t v27 = 0LL;
LABEL_20:
  if ([v10 errorCode] == (id)-20101
    || [v10 errorCode] == (id)-22406
    || [v10 errorCode] == (id)-22407)
  {
    uint64_t v34 = -7006LL;
  }

  else
  {
    uint64_t v34 = -7018LL;
  }

  if ([v10 errorCode] == (id)-28043) {
    uint64_t v34 = -7093LL;
  }
  if ([v10 errorCode] == (id)-28044) {
    uint64_t v34 = -7094LL;
  }
  if ([v10 errorCode] == (id)-80039) {
    uint64_t v34 = -7120LL;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue([v11 authKitAccount]);
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    if ([v36 isManagedAppleIDForAccount:v35])
    {
      v52 = v13;
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 managedOrganizationNameForAccount:v35]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localizedAppName]);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v55,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  AKIsManagedAccountKey);
      if ([v37 length]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v55,  "setObject:forKeyedSubscript:",  v37,  AKManagedOrganizationNameKey);
      }
      if ([v39 length]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v55,  "setObject:forKeyedSubscript:",  v39,  AKManagedLocalizedAppNameKey);
      }
      if ([v10 errorCode] == (id)-24019) {
        uint64_t v34 = -7027LL;
      }

      id v13 = v52;
    }
  }

  if ([v10 errorCode] == (id)-310003) {
    uint64_t v34 = -7100LL;
  }
  if ([v10 errorCode] == (id)-27420) {
    uint64_t v40 = -7095LL;
  }
  else {
    uint64_t v40 = v34;
  }
  if (v22 && v40 == -7018)
  {
    v41 = v27;
    id v42 = v27;
  }

  else
  {
    -[NSMutableDictionary addEntriesFromDictionary:](v55, "addEntriesFromDictionary:", v13);
    id v42 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAppleIDAuthenticationErrorDomain,  v40,  v55));
    v41 = v27;
  }

  +[AKCAAuthEventReporter reportAuthEventOfType:success:error:]( &OBJC_CLASS___AKCAAuthEventReporter,  "reportAuthEventOfType:success:error:",  AKAuthEventType_SRP_AUTH_FAILURE,  0LL,  v42);
  if ([v10 errorCode] == (id)-22406
    || [v10 errorCode] == (id)-22407
    || -[AKSRPService _shouldClearCKForFailedMagicAuthWithError:authContextHelper:]( self,  "_shouldClearCKForFailedMagicAuthWithError:authContextHelper:",  [v10 errorCode],  v11))
  {
    [v11 clearContinuationTokenIfSupportedWithError:v42];
  }

  if ([v10 errorCode] == (id)-22446)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordResetToken]);

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v11 authContext]);
      if (v44)
      {
        v45 = v13;
        v46 = (void *)objc_claimAutoreleasedReturnValue([v11 authContext]);
        uint64_t v48 = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationContext, v47);
        char isKindOfClass = objc_opt_isKindOfClass(v46, v48);

        if ((isKindOfClass & 1) != 0)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue([v11 authContext]);
          v44 = (void *)objc_claimAutoreleasedReturnValue([v50 telemetryFlowID]);
        }

        else
        {
          v44 = 0LL;
        }

        id v13 = v45;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      [v51 removePasswordResetTokenForAccount:v35 telemetryFlowID:v44 error:v42];

      v41 = v27;
    }
  }

  if (v54) {
    v54[2](v54, 0LL, v42);
  }
}

- (BOOL)_shouldClearCKForFailedMagicAuthWithError:(int64_t)a3 authContextHelper:(id)a4
{
  if (a3 != -22446) {
    return 0;
  }
  uint64_t v13 = v4;
  uint64_t v14 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 authContext]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 companionDevice]);

  if (!v7) {
    return 0;
  }
  uint64_t v9 = _AKLogSystem(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Invalid PRK returned from server and we're doing a companion auth. We should clear CK",  v12,  2u);
  }

  return 1;
}

- (void).cxx_destruct
{
}

@end