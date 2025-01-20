@interface AKAuthorizationRapportClient
- (AKAuthorizationRapportClient)init;
- (AKAuthorizationRapportClient)initWithClient:(id)a3;
- (AKAuthorizationTVServicePresenter)companionServicePresenter;
- (AKClient)client;
- (AKCredentialRequestContext)credentialRequestContext;
- (BOOL)hasEndorserAuthorizing;
- (NSData)tvAppIconData;
- (NSNumber)tvAppIconScale;
- (PBSUserPresentationRequest)userPresentationRequest;
- (PBSUserPresentationService)userPresentation;
- (RPAppSignInService)advertisingService;
- (RPCompanionLinkClient)linkClient;
- (id)authorizationCompletion;
- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4;
- (void)_configureLinkClientWithService:(id)a3 companionLinkClient:(id)a4 requestContext:(id)a5;
- (void)_dismissUI;
- (void)_fetchAssociatedDomainsWithCompletionHandler:(id)a3;
- (void)_fetchTVAppIcon;
- (void)_handleAuthorizationDidFinishWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleDidStartServerAuthorizationWithEvent:(id)a3 options:(id)a4;
- (void)_handleStartAuthorizingWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_invalidate;
- (void)_presentUI;
- (void)_presentUIWithControllerClassName:(id)a3 extraOptions:(id)a4 presentationServiceCompletion:(id)a5;
- (void)_sendDidTapNotificationMessage;
- (void)_verifyAccountTrustWithRequestContext:(id)a3 completion:(id)a4;
- (void)performAuthorization:(id)a3 companionLinkClient:(id)a4 advertisingService:(id)a5 completion:(id)a6;
- (void)performAuthorization:(id)a3 completion:(id)a4;
- (void)setAdvertisingService:(id)a3;
- (void)setAuthorizationCompletion:(id)a3;
- (void)setCompanionServicePresenter:(id)a3;
- (void)setCredentialRequestContext:(id)a3;
- (void)setHasEndorserAuthorizing:(BOOL)a3;
- (void)setLinkClient:(id)a3;
- (void)setTvAppIconData:(id)a3;
- (void)setTvAppIconScale:(id)a3;
- (void)setUserPresentation:(id)a3;
- (void)setUserPresentationRequest:(id)a3;
@end

@implementation AKAuthorizationRapportClient

- (AKAuthorizationRapportClient)init
{
  return 0LL;
}

- (AKAuthorizationRapportClient)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKAuthorizationRapportClient;
  v6 = -[AKAuthorizationRapportClient init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationTVServicePresenter);
    companionServicePresenter = v7->_companionServicePresenter;
    v7->_companionServicePresenter = v8;
  }

  return v7;
}

- (void)performAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)sub_1000641E8(0LL);
  if (v8) {
    v8 = (objc_class *)sub_100064304();
  }
  id v9 = objc_alloc_init(v8);
  v10 = (objc_class *)sub_1000641E8(0LL);
  if (v10) {
    v10 = (objc_class *)sub_100064718();
  }
  id v11 = objc_alloc_init(v10);
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B1150;
  v16[3] = &unk_1001CAAD0;
  objc_copyWeak(&v21, &location);
  id v12 = v6;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v15 = v7;
  id v20 = v15;
  -[AKAuthorizationRapportClient _verifyAccountTrustWithRequestContext:completion:]( self,  "_verifyAccountTrustWithRequestContext:completion:",  v12,  v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_verifyAccountTrustWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 authkitAccount]);

  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance")),
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 continuationTokenForAccount:v9]),
        v11,
        v10,
        !v11))
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 authkitAccount]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
    -[AKAppleIDAuthenticationContext setUsername:](v12, "setUsername:", v15);

    -[AKAppleIDAuthenticationContext setIsUsernameEditable:](v12, "setIsUsernameEditable:", 0LL);
    id v16 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B1388;
    v17[3] = &unk_1001C7640;
    v17[4] = self;
    id v18 = v7;
    [v16 authenticateWithContext:v12 completion:v17];
  }

  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
  }
}

- (void)_configureLinkClientWithService:(id)a3 companionLinkClient:(id)a4 requestContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_linkClient = &self->_linkClient;
  objc_storeStrong((id *)&self->_linkClient, a4);
  -[RPCompanionLinkClient setControlFlags:](self->_linkClient, "setControlFlags:", 12LL);
  objc_initWeak(location, self);
  linkClient = self->_linkClient;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B16E0;
  v30[3] = &unk_1001C6EE8;
  objc_copyWeak(&v31, location);
  -[RPCompanionLinkClient setInvalidationHandler:](linkClient, "setInvalidationHandler:", v30);
  id v19 = v9;
  id v13 = self->_linkClient;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000B175C;
  v28[3] = &unk_1001CAAF8;
  objc_copyWeak(&v29, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"com.apple.AuthKit.StartAuthorization",  0LL,  v28);
  id v14 = *p_linkClient;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000B17D4;
  v26[3] = &unk_1001CAAF8;
  objc_copyWeak(&v27, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:]( v14,  "registerRequestID:options:handler:",  @"com.apple.AuthKit.AuthorizationDidFinish",  0LL,  v26);
  id v15 = *p_linkClient;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000B184C;
  v24[3] = &unk_1001CAB20;
  objc_copyWeak(&v25, location);
  -[RPCompanionLinkClient registerEventID:options:handler:]( v15,  "registerEventID:options:handler:",  @"com.apple.AuthKit.DidStartServerAuthorization",  0LL,  v24);
  id v16 = *p_linkClient;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000B18B0;
  v20[3] = &unk_1001CAB48;
  objc_copyWeak(&v23, location);
  id v17 = v8;
  id v21 = v17;
  id v18 = v10;
  id v22 = v18;
  -[RPCompanionLinkClient activateWithCompletion:](v16, "activateWithCompletion:", v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)performAuthorization:(id)a3 companionLinkClient:(id)a4 advertisingService:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v16 = (void (**)(void, void, void))v14;
  if (self->_advertisingService || self->_linkClient)
  {
    uint64_t v17 = _AKLogSiwa(v14, v15);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100141598();
    }

    uint64_t v19 = -7071LL;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordRequest]);

    if (!v21)
    {
      objc_storeStrong((id *)&self->_credentialRequestContext, a3);
      id v26 = [v16 copy];
      id authorizationCompletion = self->_authorizationCompletion;
      self->_id authorizationCompletion = v26;

      -[AKAuthorizationRapportClient _presentUI](self, "_presentUI");
      -[AKAuthorizationRapportClient _configureLinkClientWithService:companionLinkClient:requestContext:]( self,  "_configureLinkClientWithService:companionLinkClient:requestContext:",  v13,  v12,  v11);
      goto LABEL_7;
    }

    uint64_t v24 = _AKLogSiwa(v22, v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315138;
      id v29 = "-[AKAuthorizationRapportClient performAuthorization:companionLinkClient:advertisingService:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Unable to satisfy password request",  (uint8_t *)&v28,  0xCu);
    }

    uint64_t v19 = -7027LL;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v19));
  ((void (**)(void, void, void *))v16)[2](v16, 0LL, v20);

LABEL_7:
}

- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[AKAuthorizationRapportClient _dismissUI](self, "_dismissUI");
  id v8 = (void (**)(id, id, id))objc_retainBlock(self->_authorizationCompletion);
  -[AKAuthorizationRapportClient _invalidate](self, "_invalidate");
  id v9 = objc_opt_new(&OBJC_CLASS___AKApplicationAuthorizationController);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizedRequest]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
  -[AKApplicationAuthorizationController storeAuthorization:withAltDSID:forClient:]( v9,  "storeAuthorization:withAltDSID:forClient:",  v6,  v11,  self->_client);

  if (v8)
  {
    v8[2](v8, v6, v7);
  }

  else
  {
    uint64_t v14 = _AKLogSiwa(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
      int v17 = 138413058;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v16;
      __int16 v21 = 2048;
      id v22 = [v7 code];
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rapport authorization called with no completion callback. {authorization=%@, errorDomain=%{public}@, errorCode=%ld, error=%@}",  (uint8_t *)&v17,  0x2Au);
    }
  }
}

- (void)_presentUIWithControllerClassName:(id)a3 extraOptions:(id)a4 presentationServiceCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v11 = v9;
  if (self->_userPresentation)
  {
    uint64_t v12 = _AKLogSiwa(v9, v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      userPresentation = self->_userPresentation;
      userPresentationRequest = self->_userPresentationRequest;
      *(_DWORD *)buf = 138412546;
      v37 = userPresentation;
      __int16 v38 = 2112;
      v39 = userPresentationRequest;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Asked to present UI for Rapport authorization, but one seems to be already present. {proxy=%@, request=%@}",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)[a4 mutableCopy];
    id v16 = sub_1000B0E70();
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[os_log_s setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v8, v17);

    id v18 = sub_1000B0F1C();
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_1000B0D18();
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[os_log_s setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v19, v21);

    id v22 = sub_1000B0DC4();
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[os_log_s setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"com.apple.AuthKitUIService",  v23);

    id v24 = (objc_class *)sub_1000B0960(0LL);
    if (v24) {
      id v24 = (objc_class *)sub_1000B0A7C();
    }
    id v25 = objc_alloc(v24);
    id v26 = -[os_log_s copy](v13, "copy");
    id v27 = (PBSUserPresentationRequest *)[v25 initWithType:0 options:v26];

    int v28 = (void *)sub_1000B0960(0LL);
    if (v28) {
      int v28 = sub_1000B0B84();
    }
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 sharedInstance]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000B204C;
    v34[3] = &unk_1001CAB70;
    id v35 = v11;
    [v29 presentUIWithRequest:v27 completion:v34];
    v30 = self->_userPresentation;
    self->_userPresentation = (PBSUserPresentationService *)v29;
    id v31 = v29;

    v32 = self->_userPresentationRequest;
    self->_userPresentationRequest = v27;
    v33 = v27;
  }
}

- (void)_presentUI
{
  uint64_t v8 = AKAuthorizationTVServicePresenterOptionsKeyBundleID;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
  id v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B21A8;
  v5[3] = &unk_1001CAB98;
  objc_copyWeak(&v6, &location);
  -[AKAuthorizationRapportClient _presentUIWithControllerClassName:extraOptions:presentationServiceCompletion:]( self,  "_presentUIWithControllerClassName:extraOptions:presentationServiceCompletion:",  @"AKAuthorizationRemoteViewController",  v4,  v5);
  -[AKAuthorizationRapportClient _fetchTVAppIcon](self, "_fetchTVAppIcon");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchTVAppIcon
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching TV App Icon...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  userPresentation = self->_userPresentation;
  userPresentationRequest = self->_userPresentationRequest;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationTVServicePresenter buildFetchAppIconMessage]( self->_companionServicePresenter,  "buildFetchAppIconMessage"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B2344;
  v8[3] = &unk_1001CABC0;
  objc_copyWeak(&v9, buf);
  -[PBSUserPresentationService messageUIWithRequest:message:reply:]( userPresentation,  "messageUIWithRequest:message:reply:",  userPresentationRequest,  v7,  v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_handleStartAuthorizingWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _AKLogSiwa(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received StartAuthorization. {request=%@, options=%@}",  buf,  0x16u);
  }

  if (self->_hasEndorserAuthorizing)
  {
    uint64_t v16 = _AKLogSiwa(v14, v15);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ignoring StartAuthorization, one is already in progress.",  buf,  2u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7071LL));
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v18);
  }

  else
  {
    self->_hasEndorserAuthorizing = 1;
    -[RPAppSignInService invalidate](self->_advertisingService, "invalidate");
    advertisingService = self->_advertisingService;
    self->_advertisingService = 0LL;

    -[AKAuthorizationRapportClient _sendDidTapNotificationMessage](self, "_sendDidTapNotificationMessage");
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient localizedAppName](self->_client, "localizedAppName"));
    -[AKCredentialRequestContext set_proxiedClientAppName:]( self->_credentialRequestContext,  "set_proxiedClientAppName:",  v20);

    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    -[AKCredentialRequestContext set_proxiedClientBundleID:]( self->_credentialRequestContext,  "set_proxiedClientBundleID:",  v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient appID](self->_client, "appID"));
    -[AKCredentialRequestContext set_proxiedClientAppID:]( self->_credentialRequestContext,  "set_proxiedClientAppID:",  v22);

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
    -[AKCredentialRequestContext set_proxiedClientTeamID:]( self->_credentialRequestContext,  "set_proxiedClientTeamID:",  v23);

    uint64_t DeviceName = MCLockdownGetDeviceName();
    id v25 = (void *)objc_claimAutoreleasedReturnValue(DeviceName);
    -[AKCredentialRequestContext set_proxiedDeviceName:](self->_credentialRequestContext, "set_proxiedDeviceName:", v25);

    id v26 = (void *)MGGetStringAnswer(@"DeviceName");
    -[AKCredentialRequestContext set_proxiedDeviceClass:]( self->_credentialRequestContext,  "set_proxiedDeviceClass:",  v26);

    -[AKCredentialRequestContext set_iconData:](self->_credentialRequestContext, "set_iconData:", self->_tvAppIconData);
    -[AKCredentialRequestContext set_iconScale:]( self->_credentialRequestContext,  "set_iconScale:",  self->_tvAppIconScale);
    -[AKCredentialRequestContext set_requirePassword:](self->_credentialRequestContext, "set_requirePassword:", 0LL);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000B2890;
    v31[3] = &unk_1001C7438;
    v31[4] = self;
    id v32 = v10;
    id v27 = objc_retainBlock(v31);
    int v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKCredentialRequestContext passwordRequest](self->_credentialRequestContext, "passwordRequest"));

    if (v28)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000B29CC;
      v29[3] = &unk_1001CABE8;
      v29[4] = self;
      v30 = v27;
      -[AKAuthorizationRapportClient _fetchAssociatedDomainsWithCompletionHandler:]( self,  "_fetchAssociatedDomainsWithCompletionHandler:",  v29);
    }

    else
    {
      ((void (*)(void *))v27[2])(v27);
    }
  }
}

- (void)_sendDidTapNotificationMessage
{
  userPresentation = self->_userPresentation;
  userPresentationRequest = self->_userPresentationRequest;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[AKAuthorizationTVServicePresenter buildDidTapNotificationMessage]( self->_companionServicePresenter,  "buildDidTapNotificationMessage"));
  -[PBSUserPresentationService messageUIWithRequest:message:reply:]( userPresentation,  "messageUIWithRequest:message:reply:",  userPresentationRequest,  v4,  0LL);
}

- (void)_handleAuthorizationDidFinishWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _AKLogSiwa(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received AuthorizationDidFinish. {request=%@, options=%@}",  buf,  0x16u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Error"]);
  if (v15)
  {
    id v33 = 0LL;
    id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError, v14),  v15,  &v33);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = v33;
    id v20 = v18;
    if (!v17)
    {
      uint64_t v21 = _AKLogSiwa(v18, v19);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100141738();
      }
    }
  }

  else
  {
    int v17 = 0LL;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Authorization"]);
  if (v24)
  {
    id v32 = 0LL;
    id v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___AKAuthorization, v23),  v24,  &v32);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v27 = v32;
    id v29 = v27;
    if (!v26)
    {
      uint64_t v30 = _AKLogSiwa(v27, v28);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1001416D8();
      }
    }
  }

  else
  {
    id v26 = 0LL;
  }

  (*((void (**)(id, void, void, void))v10 + 2))(v10, 0LL, 0LL, 0LL);
  -[AKAuthorizationRapportClient _callCompletionWithAuthorization:error:]( self,  "_callCompletionWithAuthorization:error:",  v26,  v17);
}

- (void)_dismissUI
{
}

- (void)_invalidate
{
  advertisingService = self->_advertisingService;
  self->_advertisingService = 0LL;

  -[RPCompanionLinkClient invalidate](self->_linkClient, "invalidate");
  linkClient = self->_linkClient;
  self->_linkClient = 0LL;

  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0LL;

  userPresentation = self->_userPresentation;
  self->_userPresentation = 0LL;

  userPresentationRequest = self->_userPresentationRequest;
  self->_userPresentationRequest = 0LL;
}

- (void)_fetchAssociatedDomainsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (sub_100021CFC(0LL)) {
    id v5 = sub_100022028();
  }
  else {
    id v5 = 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient appID](self->_client, "appID"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B2DD8;
  v8[3] = &unk_1001CA060;
  id v9 = v4;
  id v7 = v4;
  [v5 getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:v6 completionHandler:v8];
}

- (void)_handleDidStartServerAuthorizationWithEvent:(id)a3 options:(id)a4
{
  userPresentation = self->_userPresentation;
  userPresentationRequest = self->_userPresentationRequest;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[AKAuthorizationTVServicePresenter buildDidStartServerAuthorizationMessage]( self->_companionServicePresenter,  "buildDidStartServerAuthorizationMessage",  a3,  a4));
  -[PBSUserPresentationService messageUIWithRequest:message:reply:]( userPresentation,  "messageUIWithRequest:message:reply:",  userPresentationRequest,  v6,  0LL);
}

- (AKClient)client
{
  return self->_client;
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
}

- (id)authorizationCompletion
{
  return self->_authorizationCompletion;
}

- (void)setAuthorizationCompletion:(id)a3
{
}

- (AKAuthorizationTVServicePresenter)companionServicePresenter
{
  return self->_companionServicePresenter;
}

- (void)setCompanionServicePresenter:(id)a3
{
}

- (RPAppSignInService)advertisingService
{
  return self->_advertisingService;
}

- (void)setAdvertisingService:(id)a3
{
}

- (BOOL)hasEndorserAuthorizing
{
  return self->_hasEndorserAuthorizing;
}

- (void)setHasEndorserAuthorizing:(BOOL)a3
{
  self->_hasEndorserAuthorizing = a3;
}

- (AKCredentialRequestContext)credentialRequestContext
{
  return self->_credentialRequestContext;
}

- (void)setCredentialRequestContext:(id)a3
{
}

- (NSData)tvAppIconData
{
  return self->_tvAppIconData;
}

- (void)setTvAppIconData:(id)a3
{
}

- (NSNumber)tvAppIconScale
{
  return self->_tvAppIconScale;
}

- (void)setTvAppIconScale:(id)a3
{
}

- (PBSUserPresentationService)userPresentation
{
  return self->_userPresentation;
}

- (void)setUserPresentation:(id)a3
{
}

- (PBSUserPresentationRequest)userPresentationRequest
{
  return self->_userPresentationRequest;
}

- (void)setUserPresentationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end