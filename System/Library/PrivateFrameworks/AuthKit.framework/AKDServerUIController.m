@interface AKDServerUIController
- (AKDServerUIController)initWithClient:(id)a3;
- (AKDServerUIController)initWithLiaison:(id)a3 client:(id)a4 delegate:(id)a5;
- (id)_AKIDSCertificateFetchQueue;
- (id)_errorFromServerResponse:(id)a3;
- (id)_fetchPhoneInformationWithAdditionalInfo:(id)a3 error:(id *)a4;
- (id)resourceLoadDelegateWithContext:(id)a3;
- (id)resourceLoadDelegateWithContext:(id)a3 authResponse:(id)a4;
- (void)_decorateLoadDelegate:(id)a3 withContext:(id)a4;
- (void)_fetchIDSCertificateWithContext:(id)a3 completionHandler:(id)a4;
- (void)_reportPacTelemetryForEvent:(id)a3 context:(id)a4 error:(id)a5;
- (void)_showServerUIWithContext:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithServerContext:(id)a3 completion:(id)a4;
- (void)showServerUIWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKDServerUIController

- (AKDServerUIController)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = -[AKDServerUIController init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (AKDServerUIController)initWithLiaison:(id)a3 client:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = -[AKDServerUIController init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authUILiaison, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_client, a4);
  }

  return v13;
}

- (id)_AKIDSCertificateFetchQueue
{
  if (qword_10020F538 != -1) {
    dispatch_once(&qword_10020F538, &stru_1001CA1C8);
  }
  return (id)qword_10020F530;
}

- (void)showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 requestConfiguration]);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asking client to show server UI with %@...",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 requestConfiguration]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resourceLoadDelegate]);

  if (v12)
  {
    -[AKDServerUIController _showServerUIWithContext:completion:](self, "_showServerUIWithContext:completion:", v6, v7);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100091144;
    v13[3] = &unk_1001CA1F0;
    id v16 = v7;
    id v14 = v6;
    v15 = self;
    -[AKDServerUIController getServerUILoadDelegateWithServerContext:completion:]( self,  "getServerUILoadDelegateWithServerContext:completion:",  v14,  v13);
  }
}

- (void)_showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013CFB8(v6, v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
  objc_initWeak(&location, self);
  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 requestConfiguration]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10009134C;
  v17[3] = &unk_1001CA240;
  objc_copyWeak(&v22, &location);
  id v14 = v6;
  id v18 = v14;
  id v15 = v7;
  id v21 = v15;
  v19 = self;
  id v16 = v10;
  id v20 = v16;
  -[AKAuthenticationUILiaison presentServerProvidedUIForContext:client:withConfiguration:completion:]( authUILiaison,  "presentServerProvidedUIForContext:client:withConfiguration:completion:",  v16,  client,  v13,  v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (id)_errorFromServerResponse:(id)a3
{
  id v3 = +[AKAppleIDServerResourceLoadDelegate signalFromServerResponse:]( &OBJC_CLASS___AKAppleIDServerResourceLoadDelegate,  "signalFromServerResponse:",  a3);
  v4 = 0LL;
  switch((unint64_t)v3)
  {
    case 0uLL:
      uint64_t v5 = _AKLogSystem(0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10013D13C(v6);
      }
      uint64_t v7 = -7039LL;
      goto LABEL_14;
    case 1uLL:
      uint64_t v8 = _AKLogSystem(0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Server UI has been skipped.", buf, 2u);
      }

      uint64_t v7 = -7038LL;
      goto LABEL_14;
    case 2uLL:
      uint64_t v9 = _AKLogSystem(0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Server UI-based authentication has been canceled.",  v14,  2u);
      }

      uint64_t v7 = -7003LL;
      goto LABEL_14;
    case 5uLL:
      uint64_t v10 = _AKLogSystem(0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User elected to try again", v12, 2u);
      }

      uint64_t v7 = -7062LL;
LABEL_14:

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v7));
      break;
    default:
      return v4;
  }

  return v4;
}

- (void)getServerUILoadDelegateWithServerContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 initiatingServerResponse]);
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = _AKLogSystem(v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Creating resource load delegate with auth response",  buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[AKDServerUIController resourceLoadDelegateWithContext:authResponse:]( self,  "resourceLoadDelegateWithContext:authResponse:",  v12,  v9));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](self, "resourceLoadDelegateWithContext:", v12));
  }

  id v14 = (void *)v13;

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100091BC0;
  v19[3] = &unk_1001CA268;
  id v20 = v14;
  id v21 = self;
  id v22 = v6;
  id v23 = v7;
  id v16 = v7;
  id v17 = v6;
  id v18 = v14;
  -[AKDServerUIController _fetchIDSCertificateWithContext:completionHandler:]( self,  "_fetchIDSCertificateWithContext:completionHandler:",  v15,  v19);
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching resource load delegate", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100091E70;
  v13[3] = &unk_1001CA268;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](self, "resourceLoadDelegateWithContext:", v6));
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v14;
  -[AKDServerUIController _fetchIDSCertificateWithContext:completionHandler:]( self,  "_fetchIDSCertificateWithContext:completionHandler:",  v11,  v13);
}

- (id)resourceLoadDelegateWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___AKAppleIDServerResourceLoadDelegate);
  -[AKDServerUIController _decorateLoadDelegate:withContext:](self, "_decorateLoadDelegate:withContext:", v5, v4);

  return v5;
}

- (id)resourceLoadDelegateWithContext:(id)a3 authResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 proxiedDevice]);

  if (v8)
  {
    uint64_t v10 = _AKLogSystem(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Auth response received is for proxy, initializing resource load delegate accordingly",  v25,  2u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSIDforPrimaryiCloudAccount]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 authKitAccountWithAltDSID:v13 error:0]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 masterTokenForAccount:v15]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 masterToken]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 masterToken]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);

    id v21 = 0LL;
    v19 = 0LL;
  }

  id v23 = -[AKAppleIDServerResourceLoadDelegate initWithAltDSID:identityToken:]( objc_alloc(&OBJC_CLASS___AKAppleIDServerResourceLoadDelegate),  "initWithAltDSID:identityToken:",  v13,  v18);
  -[AKAppleIDServerResourceLoadDelegate setProxiedAltDSID:](v23, "setProxiedAltDSID:", v19);
  -[AKAppleIDServerResourceLoadDelegate setProxiedIdentityToken:](v23, "setProxiedIdentityToken:", v21);
  -[AKAppleIDServerResourceLoadDelegate setShouldSendSigningHeaders:]( v23,  "setShouldSendSigningHeaders:",  [v6 requireSigningHeaders]);
  -[AKDServerUIController _decorateLoadDelegate:withContext:](self, "_decorateLoadDelegate:withContext:", v23, v7);

  return v23;
}

- (void)_decorateLoadDelegate:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 decorateWithContext:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
  [v6 setClientAppName:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
  [v6 setClientBundleID:v9];

  id v35 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 authKitAccount:&v35]);
  id v11 = v35;
  id v12 = v11;
  if (!v10)
  {
    uint64_t v26 = _AKLogSystem(v11);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Could not find an existing AuthKit account, so we can't attach account specific headers: %@",  buf,  0xCu);
    }

    goto LABEL_13;
  }

  id v13 = [v7 _shouldSendGrandSlamTokensForRemoteUI];
  if (!(_DWORD)v13)
  {
    uint64_t v27 = _AKLogSystem(v13);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_10013D1D8(v24, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_13;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hearbeatTokenForAccount:v10]);
  [v6 setHeartbeatToken:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeServiceNamesForAccount:v10]);
  [v6 setLoggedInServices:v17];

  if ([v7 _shouldSendIdentityTokenForRemoteUI])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 identityToken]);

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 masterTokenForAccount:v10]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
      [v6 setIdentityToken:v21];
    }
  }

  if (([v7 needsCredentialRecovery] & 1) != 0
    || [v7 needsPasswordChange])
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 continuationTokenForAccount:v10]);
    [v6 setContinuationToken:v23];

    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s passwordResetTokenForAccount:](v24, "passwordResetTokenForAccount:", v10));
    [v6 setPasswordResetToken:v25];

LABEL_13:
  }
}

- (void)_fetchIDSCertificateWithContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, void, id))a4 + 2))(v5, 0LL, 0LL, v6);
}

- (id)_fetchPhoneInformationWithAdditionalInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKCarrierBundleUtilities sharedInstance](&OBJC_CLASS___AKCarrierBundleUtilities, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 phoneBundleInfoWithAdditionalInfo:v5 error:a4]);

  return v7;
}

- (void)_reportPacTelemetryForEvent:(id)a3 context:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10013D274();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  v9,  v7,  v8));
  if (v8) {
    id v13 = &__kCFBooleanFalse;
  }
  else {
    id v13 = &__kCFBooleanTrue;
  }
  [v12 setObject:v13 forKeyedSubscript:kAAFDidSucceed];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v14 sendEvent:v12];

  uint64_t v16 = _AKLogSystem(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10013D208();
  }
}

- (void).cxx_destruct
{
}

@end