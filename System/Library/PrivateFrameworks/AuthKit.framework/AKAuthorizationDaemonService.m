@interface AKAuthorizationDaemonService
- (AKAuthorizationDaemonService)init;
- (AKAuthorizationDaemonService)initWithClient:(id)a3;
- (AKAuthorizationDaemonServiceDelegate)delegate;
- (AKAuthorizationEndorserRapportDiscovery)endorserRapportDiscovery;
- (AKAuthorizationRapportClient)rapportClient;
- (AKAuthorizationStoreManager)localAccountsStorageController;
- (AKClient)client;
- (AKCredentialRequestContext)originalRequestContext;
- (BOOL)_isPCSAccessForContext:(id)a3;
- (BOOL)_shouldAllowPCSKeyAccessForContext:(id)a3;
- (BOOL)_shouldEarlyReturnRequest:(id)a3 forCredentialState:(int64_t)a4;
- (BOOL)_shouldStartSatoriVerificationForRequestContext:(id)a3;
- (BOOL)_verifyEntitlementsForRequest:(id)a3;
- (NSArray)safariPasswordCredentials;
- (id)_accountDisplayNameWithPresentationContext:(id)a3;
- (id)_clientForContext:(id)a3;
- (id)_credentialStateController;
- (id)authorizationContextHelperWithContext:(id)a3 client:(id)a4;
- (id)authorizationContextWithUserResponse:(id)a3 client:(id)a4;
- (int64_t)_credentialStateForRequestContext:(id)a3;
- (void)_completeAuthorizationWithServerResponse:(id)a3 userResponse:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_createAndPerformRequest:(id)a3 completion:(id)a4;
- (void)_determineUIAndPerformRequest:(id)a3 completion:(id)a4;
- (void)_extractWebSessionAuthorizationFromResponse:(id)a3;
- (void)_fetchAuthContextWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_fetchCredentialsForAssociatedDomains:(id)a3 completion:(id)a4;
- (void)_fetchSafariCredentialsWithCompletion:(id)a3;
- (void)_getPresentationContextForRequestContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_initiateAuthorizationWithRequestContext:(id)a3 completion:(id)a4;
- (void)_initiateRapportAuthorizationWithRequestContext:(id)a3 completion:(id)a4;
- (void)_performRequest:(id)a3 completion:(id)a4;
- (void)_performSRPAuthorizationForUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_performSilentRequest:(id)a3 withCompletion:(id)a4;
- (void)_prepareRequestContext:(id)a3 forCredentialState:(int64_t)a4;
- (void)_processUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_requestUserAuthorizationForContext:(id)a3 completion:(id)a4;
- (void)_safePerformSRPWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_sendPermissionRequestWithCompletion:(id)a3;
- (void)_setupLoginChoicesForPresentationContext:(id)a3;
- (void)_validateAndProcessUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)fetchAppleIDAuthorizationURLSetWithCompletion:(id)a3;
- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3;
- (void)fetchAppleOwnedDomainSetWithCompletion:(id)a3;
- (void)fetchNativeTakeoverURLSetWithCompletion:(id)a3;
- (void)fetchPrimaryApplicationInformationForWebServiceWithInfo:(id)a3 completion:(id)a4;
- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4;
- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4;
- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4;
- (void)performAuthorization:(id)a3 completion:(id)a4;
- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5;
- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4;
- (void)revokeUpgradeWithContext:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEndorserRapportDiscovery:(id)a3;
- (void)setLocalAccountsStorageController:(id)a3;
- (void)setOriginalRequestContext:(id)a3;
- (void)setRapportClient:(id)a3;
- (void)setSafariPasswordCredentials:(id)a3;
- (void)startDiscoveryWithCompletion:(id)a3;
- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5;
@end

@implementation AKAuthorizationDaemonService

- (AKAuthorizationDaemonService)init
{
  return 0LL;
}

- (AKAuthorizationDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AKAuthorizationDaemonService;
  v6 = -[AKAuthorizationDaemonService init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v7->_authorizationRealUserLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[AKAuthorizationSessionManager sharedInstance]( &OBJC_CLASS___AKAuthorizationSessionManager,  "sharedInstance"));
    authSessionManager = v7->_authSessionManager;
    v7->_authSessionManager = (AKAuthorizationSessionManager *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v10;

    id v12 = [v5 authorizationRequiresRapport];
    if ((_DWORD)v12)
    {
      v14 = -[AKAuthorizationRapportClient initWithClient:]( objc_alloc(&OBJC_CLASS___AKAuthorizationRapportClient),  "initWithClient:",  v5);
      rapportClient = v7->_rapportClient;
      v7->_rapportClient = v14;
    }

    uint64_t v16 = _AKLogSiwa(v12, v13);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Daemon service initialized with client: %@",  buf,  0xCu);
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSiwa(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10013A76C();
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKAuthorizationDaemonService;
  -[AKAuthorizationDaemonService dealloc](&v5, "dealloc");
}

- (void)performAuthorization:(id)a3 completion:(id)a4
{
  v6 = (AKClient *)a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    *(_DWORD *)buf = 138412290;
    v35 = client;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client before perform authorization execution %@",  buf,  0xCu);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AKClient _proxiedClientBundleID](v6, "_proxiedClientBundleID"));
  if (v12)
  {
    v14 = (void *)v12;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[AKClient _proxiedClientTeamID](v6, "_proxiedClientTeamID"));
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      unsigned int v17 = -[AKClient isPermittedToProxyAuthorizationBundleIdentifier]( self->_client,  "isPermittedToProxyAuthorizationBundleIdentifier");

      if (!v17) {
        goto LABEL_10;
      }
      uint64_t v18 = _AKLogSiwa(v12, v13);
      objc_super v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (AKClient *)objc_claimAutoreleasedReturnValue(-[AKClient _proxiedClientBundleID](v6, "_proxiedClientBundleID"));
        *(_DWORD *)buf = 138412290;
        v35 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Proxied bundle detected (%@), proxying...",  buf,  0xCu);
      }

      -[AKClient set_shouldUseProxiedClientBundleIDForSRP:](v6, "set_shouldUseProxiedClientBundleIDForSRP:", 1LL);
      id v21 = objc_alloc(&OBJC_CLASS___AKOwnerProxyClient);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient xpcConnection](self->_client, "xpcConnection"));
      v22 = -[AKOwnerProxyClient initWithCredentialRequest:connection:]( v21,  "initWithCredentialRequest:connection:",  v6,  v14);
      v23 = self->_client;
      self->_client = v22;
    }
  }

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userID]);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Attempting to get credential state for User identifier: %@",  buf,  0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008A550;
  v15[3] = &unk_1001C9F50;
  id v16 = v7;
  id v12 = v7;
  uint64_t v13 = objc_retainBlock(v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationDaemonService _credentialStateController](self, "_credentialStateController"));
  [v14 getCredentialStateForRequest:v6 completion:v13];
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AKAuthorizationDaemonService _credentialStateController](self, "_credentialStateController"));
  [v8 getCredentialStateForClientID:v7 completion:v6];
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess"))
  {
    objc_super v5 = -[AKAuthorizationEndorserRapportDiscovery initWithClient:]( objc_alloc(&OBJC_CLASS___AKAuthorizationEndorserRapportDiscovery),  "initWithClient:",  self->_client);
    endorserRapportDiscovery = self->_endorserRapportDiscovery;
    self->_endorserRapportDiscovery = v5;

    id v7 = self->_endorserRapportDiscovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10008A754;
    v13[3] = &unk_1001C78D0;
    id v8 = v4;
    id v14 = v8;
    -[AKAuthorizationEndorserRapportDiscovery setDidDeactivateBlock:](v7, "setDidDeactivateBlock:", v13);
    uint64_t v9 = self->_endorserRapportDiscovery;
    id v12 = 0LL;
    LOBYTE(v7) = -[AKAuthorizationEndorserRapportDiscovery activateWithError:](v9, "activateWithError:", &v12);
    id v10 = v12;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v11);
  }
}

- (void)fetchAppleIDAuthorizationURLSetWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDAuthorizationURLs]);
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0LL);
}

- (void)fetchNativeTakeoverURLSetWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v5 = _AKLogSiwa(v3, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Daemon is fetching native takeover urls",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v8 = AKURLBagKeyAppleIDAuthorizationURLs;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008A8D4;
  v10[3] = &unk_1001C9FA0;
  id v11 = v3;
  id v9 = v3;
  [v7 configurationValueForKey:v8 fromCache:1 completion:v10];
}

- (void)fetchAppleOwnedDomainSetWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  uint64_t v5 = _AKLogSiwa(v3, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Daemon is fetching apple owned domain", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appleOwnedDomains]);

  uint64_t v11 = _AKLogSiwa(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Daemon is returning apple owned domain",  v13,  2u);
  }

  v3[2](v3, v8, 0LL);
}

- (void)revokeUpgradeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008ADAC;
  v14[3] = &unk_1001C6990;
  id v7 = a4;
  id v15 = v7;
  uint64_t v8 = objc_retainBlock(v14);
  if (-[AKClient hasInternalAccess](self->_client, "hasInternalAccess"))
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationRevokeUpgradeController);
    client = self->_client;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10008AE64;
    v11[3] = &unk_1001C7460;
    id v12 = v6;
    uint64_t v13 = v8;
    -[AKAuthorizationRevokeUpgradeController revokeUpgradeWithContext:client:completion:]( v9,  "revokeUpgradeWithContext:client:completion:",  v12,  client,  v11);
  }

  else
  {
    uint64_t v9 = (AKAuthorizationRevokeUpgradeController *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7026LL));
    ((void (*)(void *, void, AKAuthorizationRevokeUpgradeController *))v8[2])(v8, 0LL, v9);
  }
}

- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (v5)
  {
    uint64_t v7 = _AKLogSiwa(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Starting to fetch appleIDAuthorizeHTMLResponseURL",  buf,  2u);
    }

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager altDSIDforPrimaryiCloudAccount]( self->_accountManager,  "altDSIDforPrimaryiCloudAccount"));
    -[AKAppleIDAuthenticationContext setAltDSID:](v9, "setAltDSID:", v10);

    uint64_t v11 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
    id v12 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( v11,  "initWithContext:urlBagKey:shouldCacheResource:",  v9,  AKURLBagKeyAppleIDAuthorizeHTMLResponse,  1LL);
    -[AKURLRequestProviderImpl setClient:](v12, "setClient:", self->_client);
    -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v12, "setAuthenticatedRequest:", 1LL);
    -[AKGrandSlamRequestProvider setExpectedResponseType:](v12, "setExpectedResponseType:", 2LL);
    uint64_t v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008B0A0;
    v17[3] = &unk_1001C6C28;
    id v18 = v4;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v13, "executeRequestWithCompletion:", v17);
  }

  else
  {
    uint64_t v9 = (AKAppleIDAuthenticationContext *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7026LL));
    uint64_t v14 = (*((uint64_t (**)(id, void, AKAppleIDAuthenticationContext *))v4 + 2))(v4, 0LL, v9);
    uint64_t v16 = _AKLogSiwa(v14, v15);
    id v12 = (AKGrandSlamRequestProvider *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_10013C340();
    }
  }
}

- (void)fetchPrimaryApplicationInformationForWebServiceWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager altDSIDforPrimaryiCloudAccount]( self->_accountManager,  "altDSIDforPrimaryiCloudAccount"));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKApplicationInformationController sharedController]( &OBJC_CLASS___AKApplicationInformationController,  "sharedController"));
      [v12 fetchPrimaryApplicationInformationForAltDSID:v11 appInformation:v6 client:self->_client completion:v7];
    }

    else
    {
      uint64_t v15 = _AKLogSiwa(0LL, v10);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10013C400();
      }

      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
      v7[2](v7, 0LL, v17);
    }
  }

  else
  {
    uint64_t v13 = _AKLogSiwa(v8, v9);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v7[2](v7, 0LL, v11);
  }
}

- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  BOOL v8 = (void (**)(id, void, void *))a4;
  BOOL v9 = -[AKClient hasOwnerAccess](client, "hasOwnerAccess");
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationIconManager sharedManager]( &OBJC_CLASS___AKAuthorizationIconManager,  "sharedManager"));
    [v11 continueFetchingIconWithRequestContext:v6 completion:v8];
  }

  else
  {
    uint64_t v12 = _AKLogSiwa(v9, v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013C42C();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v8[2](v8, 0LL, v11);
  }
}

- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if (-[AKClient hasSiwaDefaultEntitlementAccess](self->_client, "hasSiwaDefaultEntitlementAccess")
    || (BOOL v8 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess")))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager primaryAuthKitAccount](self->_accountManager, "primaryAuthKitAccount"));
    if (!-[AKAccountManager userUnderAgeForAccount:]( self->_accountManager,  "userUnderAgeForAccount:",  v10)
      || -[AKClient hasSiwaUnderageEntitlementAccess](self->_client, "hasSiwaUnderageEntitlementAccess")
      || (BOOL v11 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess")))
    {
      if (v6)
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
        uint64_t v15 = (void *)v13;
        if (v13)
        {
          uint64_t v16 = _AKLogSiwa(v13, v14);
          unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 138412290;
            v28 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Establishing connection with notification center for client (%@).",  (uint8_t *)&v27,  0xCu);
          }

          id v18 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v6);
          objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationNotificationHandlerInterface XPCInterface]( &OBJC_CLASS___AKAuthorizationNotificationHandlerInterface,  "XPCInterface"));
          -[NSXPCConnection setRemoteObjectInterface:](v18, "setRemoteObjectInterface:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationConnectionManager sharedManager]( &OBJC_CLASS___AKAuthorizationConnectionManager,  "sharedManager"));
          [v20 addConnection:v18 forBundleID:v15];

          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](v18, "remoteObjectProxy"));
          [v21 activate];

          v7[2](v7, 1LL, 0LL);
        }

        else
        {
          id v18 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7074LL));
          ((void (**)(id, uint64_t, NSXPCConnection *))v7)[2](v7, 0LL, v18);
        }

        goto LABEL_21;
      }

      uint64_t v24 = -7056LL;
    }

    else
    {
      uint64_t v25 = _AKLogSiwa(v11, v12);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10013C458();
      }

      uint64_t v24 = -7026LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v24));
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0LL, v15);
LABEL_21:

    goto LABEL_22;
  }

  uint64_t v22 = _AKLogSiwa(v8, v9);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10013C458();
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
  ((void (**)(id, uint64_t, void *))v7)[2](v7, 0LL, v10);
LABEL_22:
}

- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasPrivateAccess](self->_client, "hasPrivateAccess");
  if (!v8)
  {
    uint64_t v18 = -7026LL;
LABEL_8:
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v18));
    v7[2](v7, 0LL, v19);

    goto LABEL_9;
  }

  if (!v6)
  {
    uint64_t v18 = -7056LL;
    goto LABEL_8;
  }

  uint64_t v10 = _AKLogSiwa(v8, v9);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    int v20 = 138412290;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Establishing connection with state broadcast handler for client (%@).",  (uint8_t *)&v20,  0xCu);
  }

  uint64_t v13 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationStateBroadcastHandlerInterface XPCInterface]( &OBJC_CLASS___AKAuthorizationStateBroadcastHandlerInterface,  "XPCInterface"));
  -[NSXPCConnection setRemoteObjectInterface:](v13, "setRemoteObjectInterface:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationConnectionManager sharedManager]( &OBJC_CLASS___AKAuthorizationConnectionManager,  "sharedManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
  [v15 addConnection:v13 forBundleID:v16];

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](v13, "remoteObjectProxy"));
  [v17 activate];

  v7[2](v7, 1LL, 0LL);
LABEL_9:
}

- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (-[AKClient hasSiwaAccountListAccess](self->_client, "hasSiwaAccountListAccess")
    || (BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
    if (v10)
    {
      uint64_t v12 = (void *)v10;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 authkitAccount]);

      if (!v14)
      {
        uint64_t v15 = _AKLogSiwa(v10, v11);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Handling request with missing account, default to primary AuthKit account if not data separated account",  buf,  2u);
        }

        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 authKitAccountRequestingAuthorization]);
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
        [v19 setAuthkitAccount:v18];
      }
    }

    uint64_t v20 = _AKLogSiwa(v10, v11);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Client owner detected, checking for proxied bundle",  v26,  2u);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationDaemonService _clientForContext:](self, "_clientForContext:", v6));
    -[AKAuthorizationDaemonService _getPresentationContextForRequestContext:client:completion:]( self,  "_getPresentationContextForRequestContext:client:completion:",  v6,  v22,  v7);
  }

  else
  {
    uint64_t v23 = _AKLogSiwa(v8, v9);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Client doesn't have owner or entitlement access, operation not permitted",  v25,  2u);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v7[2](v7, 0LL, v22);
  }
}

- (id)_credentialStateController
{
  return  -[AKAuthorizationCredentialStateController initWithClient:]( objc_alloc(&OBJC_CLASS___AKAuthorizationCredentialStateController),  "initWithClient:",  self->_client);
}

- (id)_clientForContext:(id)a3
{
  id v4 = (AKClient *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationSessionManager clientForContext:]( self->_authSessionManager,  "clientForContext:",  a3));
  uint64_t v6 = _AKLogSiwa(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Existing client found from the session manager and using it %@",  (uint8_t *)&v12,  0xCu);
    }

    client = v4;
  }

  else
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Using the client initiated with the daemon service's connection",  (uint8_t *)&v12,  2u);
    }

    client = self->_client;
  }

  uint64_t v10 = client;

  return v10;
}

- (void)_createAndPerformRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authkitAccount]);

    if (!v11)
    {
      uint64_t v14 = _AKLogSiwa(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Handling request with missing account, default to primary AuthKit account if not data separated account",  buf,  2u);
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 authKitAccountRequestingAuthorization]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
      [v18 setAuthkitAccount:v17];
    }
  }

  if (!-[AKAuthorizationDaemonService _verifyEntitlementsForRequest:](self, "_verifyEntitlementsForRequest:", v6))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v7[2](v7, 0LL, v28);

    goto LABEL_23;
  }

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);

  if (!v19)
  {
LABEL_22:
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10008BF40;
    v36[3] = &unk_1001C9FC8;
    v36[4] = self;
    v37 = v7;
    -[AKAuthorizationDaemonService _determineUIAndPerformRequest:completion:]( self,  "_determineUIAndPerformRequest:completion:",  v6,  v36);

    goto LABEL_23;
  }

  uint64_t v20 = (AKCredentialRequestContext *)v6;
  id v21 = v20;
  if (-[AKClient authorizationClientProvidesUI](self->_client, "authorizationClientProvidesUI"))
  {
    id v21 = self->_originalRequestContext;
  }

  int64_t v22 = -[AKAuthorizationDaemonService _credentialStateForRequestContext:]( self,  "_credentialStateForRequestContext:",  v21);
  BOOL v23 = -[AKAuthorizationDaemonService _shouldEarlyReturnRequest:forCredentialState:]( self,  "_shouldEarlyReturnRequest:forCredentialState:",  v21,  v22);
  if (!v23)
  {
    -[AKAuthorizationDaemonService _prepareRequestContext:forCredentialState:]( self,  "_prepareRequestContext:forCredentialState:",  v21,  v22);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKCredentialRequestContext authorizationRequest](v21, "authorizationRequest"));
    if ([v29 _isSilentAppTransfer])
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKCredentialRequestContext authorizationRequest](v21, "authorizationRequest"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 userIdentifier]);

      if (v31)
      {
        uint64_t v34 = _AKLogSiwa(v32, v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Will attempt to perform silent authorization using provided user ID.",  buf,  2u);
        }

        -[AKCredentialRequestContext set_shouldSkipAuthorizationUI:](v20, "set_shouldSkipAuthorizationUI:", 1LL);
      }
    }

    else
    {
    }

    goto LABEL_22;
  }

  uint64_t v25 = _AKLogSiwa(v23, v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Early returning the request as it meets preferImmediatelyAvailableCredentials criteria.",  buf,  2u);
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7089LL));
  v7[2](v7, 0LL, v27);

LABEL_23:
}

- (BOOL)_shouldEarlyReturnRequest:(id)a3 forCredentialState:(int64_t)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [v5 requestOptions];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 passwordRequest]);

  if (a4 == 1) {
    return 0;
  }
  else {
    return v6 & (v7 == 0LL);
  }
}

- (void)_determineUIAndPerformRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _shouldSkipAuthorizationUI];
  if ((_DWORD)v8)
  {
    uint64_t v10 = _AKLogSiwa(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requested to skip auth UI...", v12, 2u);
    }

    -[AKAuthorizationDaemonService _performSilentRequest:withCompletion:]( self,  "_performSilentRequest:withCompletion:",  v6,  v7);
  }

  else
  {
    -[AKAuthorizationDaemonService _performRequest:completion:](self, "_performRequest:completion:", v6, v7);
  }
}

- (void)_performRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;

  id v8 = [v6 _shouldForceUI];
  uint64_t v10 = _AKLogSiwa(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Requesting interactive authorization...",  v12,  2u);
  }

  -[AKAuthorizationDaemonService _initiateAuthorizationWithRequestContext:completion:]( self,  "_initiateAuthorizationWithRequestContext:completion:",  v6,  v7);
}

- (void)_performSilentRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, AKAuthorizationUserResponse *))a4;
  id v34 = 0LL;
  unsigned __int8 v8 = +[AKAuthorizationValidator canPerformCredentialRequest:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "canPerformCredentialRequest:error:",  v6,  &v34);
  uint64_t v9 = (AKAuthorizationUserResponse *)v34;
  uint64_t v11 = v9;
  if ((v8 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
    uint64_t v14 = v12;
    if (v12)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 authkitAccount]);

      if (v15)
      {
        uint64_t v18 = _AKLogSiwa(v16, v17);
        objc_super v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v33 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Attempting safe SRP for first object...",  (uint8_t *)&v33,  2u);
        }

        uint64_t v20 = objc_opt_new(&OBJC_CLASS___AKAuthorizationUserResponse);
        -[AKAuthorizationUserResponse setSelectedRequest:](v20, "setSelectedRequest:", v14);
        id v21 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationScopesUserSelection);
        -[AKAuthorizationUserResponse setUserSelection:](v20, "setUserSelection:", v21);

        id v22 = [v6 _shouldForcePrivateEmail];
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationUserResponse userSelection](v20, "userSelection"));
        [v23 setMakePrivateEmail:v22];

        if ([v14 _isAuthorizingUsingSharedAccount])
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 _sharedAccount]);

          if (v24)
          {
            id v25 = objc_alloc(&OBJC_CLASS___AKAuthorizationSharedAccountLoginChoice);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v14 _sharedAccount]);
            id v27 = [v25 initWithSignInWithAppleAccount:v26];
            -[AKAuthorizationUserResponse setLoginChoice:](v20, "setLoginChoice:", v27);
          }
        }

        -[AKAuthorizationDaemonService _safePerformSRPWithUserResponse:client:completion:]( self,  "_safePerformSRPWithUserResponse:client:completion:",  v20,  self->_client,  v7);
        goto LABEL_18;
      }

      uint64_t v32 = -7025LL;
    }

    else
    {
      uint64_t v30 = _AKLogSiwa(0LL, v13);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10013C484();
      }

      uint64_t v32 = -7013LL;
    }

    uint64_t v20 = (AKAuthorizationUserResponse *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v32));
    v7[2](v7, 0LL, v20);
LABEL_18:

    goto LABEL_19;
  }

  uint64_t v28 = _AKLogSiwa(v9, v10);
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10013C4B0();
  }

  v7[2](v7, 0LL, v11);
LABEL_19:
}

- (BOOL)_verifyEntitlementsForRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  uint64_t v6 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  unsigned __int8 v7 = -[AKClient hasPrivateAccess](self->_client, "hasPrivateAccess");
  accountManager = self->_accountManager;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authkitAccount]);
  unsigned int v11 = -[AKAccountManager userUnderAgeForAccount:](accountManager, "userUnderAgeForAccount:", v10);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 passwordRequest]);
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
    BOOL v14 = v13 == 0LL;
  }

  else
  {
    BOOL v14 = 0;
  }

  uint64_t v17 = _AKLogSiwa(v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = @"NO";
    if (v14) {
      objc_super v19 = @"YES";
    }
    int v43 = 138412290;
    v44 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Requesting password only: %@",  (uint8_t *)&v43,  0xCu);
  }

  if (v5)
  {
    uint64_t v22 = _AKLogSiwa(v20, v21);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Owner detected!",  (uint8_t *)&v43,  2u);
    }

    LOBYTE(v6) = 1;
    goto LABEL_18;
  }

  id v23 = [v4 _shouldSkipBiometrics];
  if ((v23 & 1) != 0
    || (id v23 = [v4 _shouldSkipAuthorizationUI], (v23 & 1) != 0)
    || (id v23 = [v4 _shouldForceUI], (_DWORD)v23))
  {
    uint64_t v25 = _AKLogSiwa(v23, v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
      int v43 = 138412290;
      v44 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Internal request made by internal client? %@",  (uint8_t *)&v43,  0xCu);
    }

    goto LABEL_18;
  }

  if ([v4 _isFirstPartyLogin])
  {
LABEL_23:
    LOBYTE(v6) = v6 | v7;
    goto LABEL_18;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 _iconData]);
  if (v29 || (id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 _iconName])) != 0)
  {

    goto LABEL_23;
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v4 _upgradeContext]);

  if (v30) {
    goto LABEL_23;
  }
  uint64_t v33 = _AKLogSiwa(v31, v32);
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    -[AKClient hasSiwaDefaultEntitlementAccess](self->_client, "hasSiwaDefaultEntitlementAccess");
    int v43 = 138412290;
    v44 = @"has";
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Client %@ default access level in SiwA entitlement",  (uint8_t *)&v43,  0xCu);
  }

  uint64_t v37 = _AKLogSiwa(v35, v36);
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    -[AKClient hasSiwaUnderageEntitlementAccess](self->_client, "hasSiwaUnderageEntitlementAccess");
    int v43 = 138412290;
    v44 = @"has";
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Client %@ underage-users access level in SiwA entitlement",  (uint8_t *)&v43,  0xCu);
  }

  if (-[AKClient hasSiwaUnderageEntitlementAccess](self->_client, "hasSiwaUnderageEntitlementAccess")
    || -[AKClient hasSiwaDefaultEntitlementAccess](self->_client, "hasSiwaDefaultEntitlementAccess"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v40 = [v39 isTiburonU13Enabled];

    client = self->_client;
    if ((v11 & v40) == 1) {
      unsigned __int8 v42 = -[AKClient hasSiwaUnderageEntitlementAccess](client, "hasSiwaUnderageEntitlementAccess");
    }
    else {
      unsigned __int8 v42 = -[AKClient hasSiwaDefaultEntitlementAccess](client, "hasSiwaDefaultEntitlementAccess");
    }
    LOBYTE(v6) = v42;
  }

  else
  {
    LOBYTE(v6) = v6 | v7 | v14;
  }

- (void)_initiateAuthorizationWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAuthorizationIconManager sharedManager](&OBJC_CLASS___AKAuthorizationIconManager, "sharedManager"));
  [v8 startFetchingIconWithRequestContext:v6];

  if (-[AKClient authorizationRequiresRapport](self->_client, "authorizationRequiresRapport"))
  {
    -[AKAuthorizationDaemonService _initiateRapportAuthorizationWithRequestContext:completion:]( self,  "_initiateRapportAuthorizationWithRequestContext:completion:",  v6,  v7);
  }

  else if (-[AKClient authorizationClientProvidesUI](self->_client, "authorizationClientProvidesUI"))
  {
    -[AKAuthorizationDaemonService presentAuthorizationUIForContext:completion:]( self,  "presentAuthorizationUIForContext:completion:",  self->_originalRequestContext,  v7);
  }

  else
  {
    client = self->_client;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10008C988;
    v10[3] = &unk_1001C9FF0;
    void v10[4] = self;
    id v11 = v7;
    -[AKAuthorizationDaemonService _getPresentationContextForRequestContext:client:completion:]( self,  "_getPresentationContextForRequestContext:client:completion:",  v6,  client,  v10);
  }
}

- (void)_initiateRapportAuthorizationWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Rapport authorization is required for request %@",  buf,  0xCu);
  }

  id v18 = 0LL;
  unsigned int v11 = +[AKAuthorizationValidator canPerformCredentialRequest:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "canPerformCredentialRequest:error:",  v6,  &v18);
  id v12 = v18;
  BOOL v14 = v12;
  if (v11)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
    [v15 setAuthkitAccount:0];

    -[AKAuthorizationRapportClient performAuthorization:completion:]( self->_rapportClient,  "performAuthorization:completion:",  v6,  v7);
  }

  else
  {
    uint64_t v16 = _AKLogSiwa(v12, v13);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rapport request is not eligible for authorization",  buf,  2u);
    }

    v7[2](v7, 0LL, v14);
  }
}

- (BOOL)_shouldStartSatoriVerificationForRequestContext:(id)a3
{
  id v4 = a3;
  if ((id)-[AKAuthorizationDaemonService _credentialStateForRequestContext:]( self,  "_credentialStateForRequestContext:",  v4) == (id)2 && ([v4 _isWebLogin] & 1) == 0)
  {
    unsigned int v5 = [v4 _isEligibleForUpgradeFromPassword] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, AKOwnerProxyClient *))a5;
  BOOL v11 = -[AKClient hasPrivateAccess](self->_client, "hasPrivateAccess");
  if (!v11)
  {
    uint64_t v23 = _AKLogSiwa(v11, v12);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10013C508();
    }

    uint64_t v25 = -7026LL;
    goto LABEL_12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 _proxiedClientBundleID]);

  uint64_t v16 = _AKLogSiwa(v14, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (!v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10013C4DC();
    }

    uint64_t v25 = -7044LL;
LABEL_12:
    objc_super v19 = (AKOwnerProxyClient *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v25));
    v10[2](v10, 0LL, v19);
    goto LABEL_13;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Storing authorization for proxied request (%@).",  (uint8_t *)&v26,  0xCu);
  }

  objc_super v19 = -[AKOwnerProxyClient initWithCredentialRequest:]( objc_alloc(&OBJC_CLASS___AKOwnerProxyClient),  "initWithCredentialRequest:",  v9);
  id v20 = objc_alloc_init(&OBJC_CLASS___AKApplicationAuthorizationController);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 authorizationRequest]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 altDSID]);
  -[AKApplicationAuthorizationController storeAuthorization:withAltDSID:forClient:]( v20,  "storeAuthorization:withAltDSID:forClient:",  v8,  v22,  v19);

  v10[2](v10, 1LL, 0LL);
LABEL_13:
}

- (void)_getPresentationContextForRequestContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  v78[0] = 0LL;
  unsigned __int8 v11 = +[AKAuthorizationValidator canPerformCredentialRequest:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "canPerformCredentialRequest:error:",  v8,  v78);
  id v12 = v78[0];
  uint64_t v14 = v12;
  if ((v11 & 1) != 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationPresentationContext presentationContextForRequestContext:client:]( &OBJC_CLASS___AKAuthorizationPresentationContext,  "presentationContextForRequestContext:client:",  v8,  v9));
    id v71 = v8;
    objc_msgSend( v15,  "setSignInAllowsPCSKeyAccess:",  -[AKAuthorizationDaemonService _shouldAllowPCSKeyAccessForContext:]( self,  "_shouldAllowPCSKeyAccessForContext:",  v8));
    v72 = objc_alloc_init(&OBJC_CLASS___AKUserInfoController);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 credentialRequestContext]);
    id v77 = 0LL;
    unsigned int v17 = +[AKAuthorizationValidator canPerformAuthorizationRequest:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "canPerformAuthorizationRequest:error:",  v16,  &v77);
    id v70 = v77;

    char v76 = 0;
    if ((v17 & 1) == 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 credentialRequestContext]);
      [v18 setAuthorizationRequest:0];
    }

    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v15 credentialRequestContext]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 authorizationRequest]);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 credentialRequestContext]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 passwordRequest]);

    uint64_t v23 = dispatch_group_create();
    if (v20) {
      int v24 = v17;
    }
    else {
      int v24 = 0;
    }
    int v69 = v24;
    if (v24 != 1)
    {
      uint64_t v37 = 0LL;
      if (!v22)
      {
LABEL_40:
        dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
        id v58 = -[AKAuthorizationDaemonService _setupLoginChoicesForPresentationContext:]( self,  "_setupLoginChoicesForPresentationContext:",  v15);
        if (v24)
        {
          v10[2](v10, v15, 0LL);
          v46 = v70;
          goto LABEL_46;
        }

        uint64_t v60 = _AKLogSiwa(v58, v59);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10013C534();
        }

        v46 = v70;
        if (v70)
        {
          ((void (**)(id, void *, id))v10)[2](v10, 0LL, v70);
          goto LABEL_46;
        }

        v38 = v37;
        v62 = v20;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
        ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v63);

        id v20 = v62;
        goto LABEL_26;
      }

- (BOOL)_shouldAllowPCSKeyAccessForContext:(id)a3
{
  unsigned int v3 = -[AKAuthorizationDaemonService _isPCSAccessForContext:](self, "_isPCSAccessForContext:", a3);
  if (v3) {
    LOBYTE(v3) = +[AKCDPFactory isEligibleToArmDeviceForPCSAuth]( &OBJC_CLASS___AKCDPFactory,  "isEligibleToArmDeviceForPCSAuth");
  }
  return v3;
}

- (BOOL)_isPCSAccessForContext:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 authorizationRequest]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appProvidedData]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"originURL"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
  LOBYTE(v4) = [v7 containsString:@"icloud.com"];

  return (char)v4;
}

- (void)_prepareRequestContext:(id)a3 forCredentialState:(int64_t)a4
{
  id v6 = a3;
  uint64_t v8 = _AKLogSiwa(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Checking for genesis event!",  (uint8_t *)&v29,  2u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);
  objc_msgSend(v10, "set_isSilentAppTransfer:", 0);
  [v10 setExistingStatus:a4];
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager primaryAuthKitAccount](self->_accountManager, "primaryAuthKitAccount"));
  unsigned int v12 = -[AKAccountManager userUnderAgeForAccount:](self->_accountManager, "userUnderAgeForAccount:", v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v14 = [v13 isTiburonU13Enabled];

  if (a4 == 1)
  {
    uint64_t v17 = _AKLogSiwa(v15, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v10 clientID]);
      int v29 = 138412290;
      uint64_t v30 = v19;
      id v20 = "Previous credential for client %@ is authorized";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v29, 0xCu);

      goto LABEL_17;
    }

    goto LABEL_17;
  }

  id v21 = [v6 _isEligibleForUpgradeFromPassword];
  if ((_DWORD)v21)
  {
    uint64_t v23 = _AKLogSiwa(v21, v22);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v10 requestedScopes]);
      int v29 = 138412290;
      uint64_t v30 = v19;
      id v20 = "Resetting scopes %@ for upgrade from keychain";
      goto LABEL_16;
    }

- (int64_t)_credentialStateForRequestContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationDaemonService _credentialStateController](self, "_credentialStateController"));
  id v6 = [v5 getInternalCredentialStateForCredentialRequestContext:v4];

  return (int64_t)v6;
}

- (void)_setupLoginChoicesForPresentationContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialRequestContext]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authorizationRequest]);

  id v8 = [v7 existingStatus];
  if (!v7)
  {
LABEL_6:
    unsigned int v17 = 0;
    goto LABEL_10;
  }

  id v10 = v8;
  uint64_t v11 = _AKLogSiwa(v8, v9);
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10 == (id)1)
  {
    if (v13) {
      sub_10013C6D4();
    }

    id v14 = objc_alloc(&OBJC_CLASS___AKAuthorizationLoginChoice);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationDaemonService _accountDisplayNameWithPresentationContext:]( self,  "_accountDisplayNameWithPresentationContext:",  v4));
    id v16 = [v14 initWithUser:v15 site:&stru_1001D1450];

    [v16 setAppleIDAuth:1];
    -[NSMutableArray addObject:](v5, "addObject:", v16);

    goto LABEL_6;
  }

  if (v13) {
    sub_10013C700();
  }

  unsigned int v17 = [v7 shouldHideCreateOption] ^ 1;
LABEL_10:
  NSUInteger v18 = -[NSArray count](self->_safariPasswordCredentials, "count");
  NSUInteger v19 = v18;
  if (v18)
  {
    unsigned int v39 = v17;
    NSUInteger v40 = v18;
    v41 = self;
    unsigned __int8 v42 = v7;
    id v43 = v4;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v20 = self->_safariPasswordCredentials;
    id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v44,  v50,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v45;
      do
      {
        uint64_t v24 = 0LL;
        do
        {
          if (*(void *)v45 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v24);
          id v26 = objc_alloc(&OBJC_CLASS___AKAuthorizationLoginChoice);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 user]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 site]);
          id v29 = [v26 initWithUser:v27 site:v28];

          uint64_t v32 = _AKLogSiwa(v30, v31);
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            sub_10013C660(v48, v29, &v49, v33);
          }

          -[NSMutableArray addObject:](v5, "addObject:", v29);
          uint64_t v24 = (char *)v24 + 1;
        }

        while (v22 != v24);
        id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v44,  v50,  16LL);
      }

      while (v22);
    }

    uint64_t v7 = v42;
    id v4 = v43;
    NSUInteger v19 = v40;
    self = v41;
    unsigned int v17 = v39;
  }

  if (v17)
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialRequestContext]);
    unsigned int v35 = [v34 _isRapportLogin];

    if (v19)
    {
      if (v35)
      {
        id v36 = objc_alloc(&OBJC_CLASS___AKAuthorizationLoginChoice);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationDaemonService _accountDisplayNameWithPresentationContext:]( self,  "_accountDisplayNameWithPresentationContext:",  v4));
        id v38 = [v36 initWithUser:v37 site:@"create"];

        [v38 setAppleIDAuth:1];
        [v38 setCreateAppleID:1];
        -[NSMutableArray addObject:](v5, "addObject:", v38);
      }
    }
  }

  [v4 setLoginChoices:v5];
}

- (void)_fetchSafariCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _AKLogSiwa(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10013C72C((uint64_t)self, v7);
  }

  if (sub_100021CFC(0LL)) {
    id v8 = sub_100022028();
  }
  else {
    id v8 = 0LL;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient appID](self->_client, "appID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10008DC9C;
  v11[3] = &unk_1001CA060;
  id v12 = v4;
  id v10 = v4;
  [v8 getCredentialsForAppWithAppID:v9 completionHandler:v11];
}

- (void)_fetchCredentialsForAssociatedDomains:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = _AKLogSiwa(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetching credentials for proxied associated domains. {proxiedAssociatedDomains=%@}",  buf,  0xCu);
  }

  if (sub_100021CFC(0LL)) {
    id v10 = sub_100022028();
  }
  else {
    id v10 = 0LL;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008DE38;
  v12[3] = &unk_1001CA060;
  id v13 = v6;
  id v11 = v6;
  [v10 getCredentialsForAppWithAppID:0 externallyVerifiedAndApprovedSharedWebCredentialDomains:v5 completionHandler:v12];
}

- (void)_requestUserAuthorizationForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "presenting authorization UI for request %@",  buf,  0xCu);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationPresenter);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10008DFF4;
  v20[3] = &unk_1001CA088;
  id v21 = v6;
  id v22 = self;
  id v12 = v6;
  -[AKAuthorizationPresenter setAuthorizationResponseValidator:](v11, "setAuthorizationResponseValidator:", v20);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAuthorizationIconManager sharedManager](&OBJC_CLASS___AKAuthorizationIconManager, "sharedManager"));
  [v13 setFetchIconBlockForPresenter:v11 withContext:v12];

  client = self->_client;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10008E0E4;
  v17[3] = &unk_1001CA0B0;
  NSUInteger v18 = v11;
  id v19 = v7;
  id v15 = v11;
  id v16 = v7;
  -[AKAuthorizationPresenter presentAuthorizationWithContext:client:completion:]( v15,  "presentAuthorizationWithContext:client:completion:",  v12,  client,  v17);
}

- (void)_safePerformSRPWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___AKAuthorizationRequest, v12);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

  uint64_t v17 = _AKLogSiwa(v15, v16);
  NSUInteger v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Attempting authorization with response %@, and client: %@",  (uint8_t *)&v21,  0x16u);
    }

    -[AKAuthorizationDaemonService _performSRPAuthorizationForUserResponse:client:completion:]( self,  "_performSRPAuthorizationForUserResponse:client:completion:",  v8,  v9,  v10);
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10013C884(v8, v19);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
    v10[2](v10, 0LL, v20);

    id v10 = (void (**)(id, void, uint64_t))v20;
  }
}

- (void)_performSRPAuthorizationForUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008E380;
  v15[3] = &unk_1001CA0D8;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  NSUInteger v18 = -[AKSRPService initWithClient:](objc_alloc(&OBJC_CLASS___AKSRPService), "initWithClient:", v9);
  id v19 = v10;
  id v11 = v10;
  uint64_t v12 = v18;
  id v13 = v8;
  id v14 = v9;
  -[AKAuthorizationDaemonService _fetchAuthContextWithUserResponse:client:completion:]( self,  "_fetchAuthContextWithUserResponse:client:completion:",  v13,  v14,  v15);
}

- (void)_fetchAuthContextWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationDaemonService authorizationContextWithUserResponse:client:]( self,  "authorizationContextWithUserResponse:client:",  v8,  a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userSelection]);
  [v10 setUserSelection:v11];

  id v12 = -[AKCredentialRequestContext _isWebLogin](self->_originalRequestContext, "_isWebLogin");
  if ((_DWORD)v12)
  {
    id v12 = -[AKCredentialRequestContext _isFirstPartyLogin](self->_originalRequestContext, "_isFirstPartyLogin");
    uint64_t v14 = (uint64_t)v12;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = _AKLogSiwa(v12, v13);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10013CA7C(v14, v16, v17, v18, v19, v20, v21, v22);
  }

  if ((_DWORD)v14)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory walrusStatusLiveValue](&OBJC_CLASS___AKCDPFactory, "walrusStatusLiveValue"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 captureCurrentValue]);

    if ([v26 unsignedIntegerValue] == (id)1)
    {
      uint64_t v28 = _AKLogSiwa(1LL, v27);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_10013C964();
      }

      objc_msgSend(v10, "set_shouldRequestToArmDeviceToAllowPCSKeyUpload:", 1);
      v9[2](v9, v10);
      goto LABEL_29;
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
    accountManager = self->_accountManager;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 altDSID]);
    id v62 = 0LL;
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v34,  &v62));
    id v36 = v62;

    if (v35)
    {
      id v39 = -[AKAccountManager edpStateValueForAccount:](self->_accountManager, "edpStateValueForAccount:", v35);
      uint64_t v41 = _AKLogSiwa(v39, v40);
      unsigned __int8 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_10013CA14(v39 == (id)1, v42, v43, v44, v45, v46, v47, v48);
      }

      uint64_t v51 = _AKLogSiwa(v49, v50);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
      if (v39 == (id)1)
      {
        if (v53) {
          sub_10013C9BC();
        }

        unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v32 altDSID]);
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory contextForAltDSID:](&OBJC_CLASS___AKCDPFactory, "contextForAltDSID:", v54));

        v56 = objc_opt_new(&OBJC_CLASS___AKEDPRequestController);
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_10008E838;
        v59[3] = &unk_1001CA100;
        id v60 = v10;
        v61 = v9;
        -[AKEDPRequestController isEDPHealthyForCDPContext:completion:]( v56,  "isEDPHealthyForCDPContext:completion:",  v55,  v59);

        goto LABEL_28;
      }

      if (v53) {
        sub_10013C9E8();
      }
    }

    else
    {
      uint64_t v57 = _AKLogSiwa(v37, v38);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        sub_10013C990();
      }
    }

    v9[2](v9, v10);
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }

  uint64_t v30 = _AKLogSiwa(v23, v24);
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_10013C938();
  }

  v9[2](v9, v10);
LABEL_30:
}

- (void)_completeAuthorizationWithServerResponse:(id)a3 userResponse:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v45 = a5;
  id v12 = (void (**)(id, void, id))a6;
  if ([v10 isUnderAgeOfMajority]
    && ([v10 isFirstPartyApp] & 1) == 0)
  {
    accountManager = self->_accountManager;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v14,  0LL));

    -[AKAccountManager setUserUnderage:forAccount:]( self->_accountManager,  "setUserUnderage:forAccount:",  [v10 isUnderAgeOfMajority],  v15);
    id v16 = self->_accountManager;
    id v46 = 0LL;
    LOBYTE(accountManager) = -[AKAccountManager saveAccount:error:]( v16,  "saveAccount:error:",  v15,  &v46);
    id v17 = v46;
    id v19 = v17;
    if ((accountManager & 1) == 0)
    {
      uint64_t v20 = _AKLogSiwa(v17, v18);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10013CB48();
      }
    }

    if (!-[AKClient hasSiwaUnderageEntitlementAccess](self->_client, "hasSiwaUnderageEntitlementAccess"))
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7076LL));
      v12[2](v12, 0LL, v22);
      goto LABEL_22;
    }
  }

  uint64_t v44 = v12;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 selectedRequest]);
  id v19 = objc_alloc_init(&OBJC_CLASS___AKAuthorization);
  id v22 = [[AKAuthorizationCredential alloc] initWithServerResponse:v10];
  [v19 setCredential:v22];
  [v19 setAuthorizedRequest:v15];
  -[AKAuthorizationDaemonService _extractWebSessionAuthorizationFromResponse:]( self,  "_extractWebSessionAuthorizationFromResponse:",  v10);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userInformation]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 requestedScopes]);
  unsigned int v25 = [v24 containsObject:AKAuthorizationScopeEmail];

  if (v25)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 userSelection]);
    unsigned __int8 v27 = [v26 makePrivateEmail];

    if ((v27 & 1) == 0)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 userSelection]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 userInformation]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 selectedEmail]);
      [v23 setSelectedEmail:v30];
    }
  }

  else
  {
    [v23 setSelectedEmail:0];
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v15 requestedScopes]);
  unsigned int v32 = [v31 containsObject:AKAuthorizationScopeFullName];

  if (v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v11 userSelection]);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 userInformation]);
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 givenName]);
    [v23 setGivenName:v35];

    id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 userSelection]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 userInformation]);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 familyName]);
    [v23 setFamilyName:v38];
  }

  if (-[AKClient hasSiwaUnderageEntitlementAccess](self->_client, "hasSiwaUnderageEntitlementAccess")) {
    uint64_t v39 = [v10 isUnderAgeOfMajority];
  }
  else {
    uint64_t v39 = 0LL;
  }
  [v23 setUserAgeRange:v39];
  if ([v15 isEligibleForUpgradeFromPassword])
  {
    uint64_t v40 = -[AKOwnerProxyClient initWithCredentialRequest:]( objc_alloc(&OBJC_CLASS___AKOwnerProxyClient),  "initWithCredentialRequest:",  self->_originalRequestContext);
    uint64_t v41 = objc_opt_new(&OBJC_CLASS___AKApplicationAuthorizationController);
    unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v11 selectedRequest]);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 altDSID]);
    -[AKApplicationAuthorizationController storeAuthorization:withAltDSID:forClient:]( v41,  "storeAuthorization:withAltDSID:forClient:",  v19,  v43,  v40);
  }

  else
  {
    uint64_t v40 = objc_opt_new(&OBJC_CLASS___AKApplicationAuthorizationController);
    uint64_t v41 = (AKApplicationAuthorizationController *)objc_claimAutoreleasedReturnValue([v11 selectedRequest]);
    unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue(-[AKApplicationAuthorizationController altDSID](v41, "altDSID"));
    -[AKOwnerProxyClient storeAuthorization:withAltDSID:forClient:]( v40,  "storeAuthorization:withAltDSID:forClient:",  v19,  v42,  v45);
  }

  id v12 = v44;

  ((void (**)(id, id, id))v12)[2](v12, v19, 0LL);
LABEL_22:
}

- (id)authorizationContextHelperWithContext:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[AKSRPAuthorizationContextHelper initWithContext:]( objc_alloc(&OBJC_CLASS___AKSRPAuthorizationContextHelper),  "initWithContext:",  v6);

  if (+[AKCDPFactory isWalrusEnabled](&OBJC_CLASS___AKCDPFactory, "isWalrusEnabled"))
  {
    -[AKSRPContextHelper setWalrusEnabled:](v7, "setWalrusEnabled:", 1LL);
    -[AKSRPContextHelper setWalrusWebAccessEnabled:]( v7,  "setWalrusWebAccessEnabled:",  +[AKCDPFactory isWebAccessEnabled](&OBJC_CLASS___AKCDPFactory, "isWebAccessEnabled"));
  }

  -[AKSRPContextHelper setClient:](v7, "setClient:", v5);

  return v7;
}

- (id)authorizationContextWithUserResponse:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 selectedRequest]);
  id v8 = -[AKAuthorizationContext initWithRequest:]( objc_alloc(&OBJC_CLASS___AKAuthorizationContext),  "initWithRequest:",  v7);
  -[AKAuthorizationContext setAppProvidedContext:](v8, "setAppProvidedContext:", @"AuthorizationServices");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  -[AKAuthorizationContext setAltDSID:](v8, "setAltDSID:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  -[AKAuthorizationContext setClientID:](v8, "setClientID:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);
  -[AKAuthorizationContext setTeamID:](v8, "setTeamID:", v11);

  -[AKAuthorizationContext setRealUserVerificationData:]( v8,  "setRealUserVerificationData:",  self->_realUserVerificationResults);
  id v12 = [v6 hasInternalEntitledAccess];
  LODWORD(v11) = (_DWORD)v12;
  uint64_t v14 = _AKLogSiwa(v12, v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v11)
  {
    if (v16)
    {
      *(_DWORD *)id v46 = 138412290;
      *(void *)&v46[4] = v6;
      unsigned int v35 = "Client do not have special access, so not overriding the context. Using the given client: %@";
      id v36 = v15;
      uint32_t v37 = 12;
      goto LABEL_17;
    }

- (void)_extractWebSessionAuthorizationFromResponse:(id)a3
{
  id v4 = a3;
  if ([v4 isFirstPartyApp])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory walrusStatusLiveValue](&OBJC_CLASS___AKCDPFactory, "walrusStatusLiveValue"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 captureCurrentValue]);

    if ([v6 unsignedIntegerValue] == (id)1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serverProvidedData]);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AKPCSAuthContext contextFromSRPServerResponseWithShorterTTL:]( &OBJC_CLASS___AKPCSAuthContext,  "contextFromSRPServerResponseWithShorterTTL:",  v7));

      if (v8) {
        goto LABEL_13;
      }
    }

    accountManager = self->_accountManager;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
    id v24 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v10,  &v24));
    id v12 = v24;

    if (v12)
    {
      uint64_t v15 = _AKLogSiwa(v13, v14);
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10013CC34();
      }
    }

    id v17 = -[AKAccountManager edpStateValueForAccount:](self->_accountManager, "edpStateValueForAccount:", v11);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 serverProvidedData]);
    if (v11 && v17 == (id)1) {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[AKPCSAuthContext contextFromSRPServerResponseWithShorterTTL:]( &OBJC_CLASS___AKPCSAuthContext,  "contextFromSRPServerResponseWithShorterTTL:",  v18));
    }
    else {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[AKPCSAuthContext contextFromSRPServerResponse:]( &OBJC_CLASS___AKPCSAuthContext,  "contextFromSRPServerResponse:",  v18));
    }
    id v8 = (os_log_s *)v19;

    if (v8)
    {
LABEL_13:
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKWebSessionPCSKeyProvider sharedInstance]( &OBJC_CLASS___AKWebSessionPCSKeyProvider,  "sharedInstance"));
      [v22 saveContext:v8 completion:&stru_1001CA120];
    }

    else
    {
      uint64_t v23 = _AKLogSiwa(v20, v21);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10013CC08();
      }
    }
  }
}

- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013CCF4(v9);
  }

  client = self->_client;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10008F4DC;
  v19[3] = &unk_1001C8648;
  id v11 = v7;
  id v20 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient proxyWithErrorHandler:](client, "proxyWithErrorHandler:", v19));
  uint64_t v14 = v12;
  if (v12)
  {
    [v12 presentAuthorizationUIForContext:v6 completion:v11];
  }

  else
  {
    uint64_t v15 = _AKLogSiwa(0LL, v13);
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client proxy object to present UI is not created",  v18,  2u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7061LL));
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v17);
  }
}

- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v12 = (void (**)(id, void, void *))a5;
  p_originalRequestContext = &self->_originalRequestContext;
  if (!self->_originalRequestContext) {
    objc_storeStrong((id *)p_originalRequestContext, a3);
  }
  uint64_t v14 = _AKLogSiwa(p_originalRequestContext, v11);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    int v24 = 138412290;
    unsigned int v25 = client;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client before perform authorization for user info execution %@",  (uint8_t *)&v24,  0xCu);
  }

  BOOL v17 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  BOOL v18 = v17;
  uint64_t v20 = _AKLogSiwa(v17, v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v22)
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client owner detected", (uint8_t *)&v24, 2u);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationDaemonService _clientForContext:](self, "_clientForContext:", v9));
    -[AKAuthorizationDaemonService _validateAndProcessUserResponse:client:completion:]( self,  "_validateAndProcessUserResponse:client:completion:",  v10,  v23,  v12);
  }

  else
  {
    if (v22)
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Client doesn't have owner access, operation not permitted",  (uint8_t *)&v24,  2u);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v12[2](v12, 0LL, v23);
  }
}

- (void)_validateAndProcessUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___AKCATiburonRequestAttemptReporter);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestIdentifier]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  uint64_t v15 = -[AKCATiburonRequestAttemptReporter initWithRequestID:](v11, "initWithRequestID:", v14);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10008F934;
  v26[3] = &unk_1001C9FC8;
  BOOL v16 = v15;
  uint64_t v27 = v16;
  id v17 = v10;
  id v28 = v17;
  BOOL v18 = objc_retainBlock(v26);
  id v25 = 0LL;
  unsigned int v19 = +[AKAuthorizationValidator shouldContinueWithResponse:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "shouldContinueWithResponse:error:",  v8,  &v25);
  id v20 = v25;
  uint64_t v22 = _AKLogSiwa(v20, v21);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10013CD80();
  }

  if (v19)
  {
    -[AKAuthorizationDaemonService _processUserResponse:client:completion:]( self,  "_processUserResponse:client:completion:",  v8,  v9,  v18);
  }

  else if (v20)
  {
    ((void (*)(void *, void, id))v18[2])(v18, 0LL, v20);
  }

  else
  {
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7062LL));
    ((void (*)(void *, void, void *))v18[2])(v18, 0LL, v24);
  }
}

- (void)_processUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "authorizationDaemonServiceWillProcessUserResponse:") & 1) != 0) {
    [WeakRetained authorizationDaemonServiceWillProcessUserResponse:self];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v13 = [v12 isTiburonU13Enabled];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___AKAuthorizationRequest, v15);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v16);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v20 = _AKLogSiwa(v18, v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v60 = 138412546;
      id v61 = v8;
      __int16 v62 = 2112;
      id v63 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Got a response from user: %@ and client: %@",  (uint8_t *)&v60,  0x16u);
    }

    -[AKAuthorizationDaemonService _safePerformSRPWithUserResponse:client:completion:]( self,  "_safePerformSRPWithUserResponse:client:completion:",  v8,  v9,  v10);
    goto LABEL_23;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___AKPasswordRequest, v23);
  char v25 = objc_opt_isKindOfClass(v22, v24);

  if ((v25 & 1) == 0)
  {
    id v47 = [v8 requestParentalPermission];
    if ((v47 & v13) == 1)
    {
      -[AKAuthorizationDaemonService _sendPermissionRequestWithCompletion:]( self,  "_sendPermissionRequestWithCompletion:",  v10);
      goto LABEL_23;
    }

    uint64_t v49 = _AKLogSiwa(v47, v48);
    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10013CE70();
    }

    uint64_t v51 = -7012LL;
LABEL_22:
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v51));
    v10[2](v10, 0LL, v59);

    goto LABEL_23;
  }

  uint64_t v28 = _AKLogSiwa(v26, v27);
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v60) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Detected password request",  (uint8_t *)&v60,  2u);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 loginChoice]);
  uint64_t v33 = _AKLogSiwa(v31, v32);
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  unsigned int v35 = v34;
  if (!v30)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10013CE08(v35, v52, v53, v54, v55, v56, v57, v58);
    }

    uint64_t v51 = -7044LL;
    goto LABEL_22;
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v8 userSelection]);
    int v60 = 138412802;
    id v61 = v8;
    __int16 v62 = 2112;
    id v63 = v36;
    __int16 v64 = 2112;
    id v65 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Got a response from user: %@, userSelection: %@ and client: %@",  (uint8_t *)&v60,  0x20u);
  }

  id v37 = objc_alloc_init(&OBJC_CLASS___AKAuthorization);
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v8 loginChoiceIndex]);
  uint64_t v39 = (int)[v38 intValue];

  id v40 = objc_alloc(&OBJC_CLASS___AKPasswordCredential);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_safariPasswordCredentials,  "objectAtIndexedSubscript:",  v39));
  unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 user]);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_safariPasswordCredentials,  "objectAtIndexedSubscript:",  v39));
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 password]);
  id v45 = [v40 initWithUser:v42 password:v44];
  [v37 setCredential:v45];

  id v46 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedRequest]);
  [v37 setAuthorizedRequest:v46];

  ((void (**)(id, id, void *))v10)[2](v10, v37, 0LL);
LABEL_23:
}

- (void)_sendPermissionRequestWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _AKLogSiwa();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending permission request", v6, 2u);
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0LL, 0LL);
}

- (id)_accountDisplayNameWithPresentationContext:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInformation]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountName]);

  return v4;
}

- (AKClient)client
{
  return self->_client;
}

- (AKAuthorizationDaemonServiceDelegate)delegate
{
  return (AKAuthorizationDaemonServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationRapportClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (AKAuthorizationEndorserRapportDiscovery)endorserRapportDiscovery
{
  return self->_endorserRapportDiscovery;
}

- (void)setEndorserRapportDiscovery:(id)a3
{
}

- (NSArray)safariPasswordCredentials
{
  return self->_safariPasswordCredentials;
}

- (void)setSafariPasswordCredentials:(id)a3
{
}

- (AKCredentialRequestContext)originalRequestContext
{
  return self->_originalRequestContext;
}

- (void)setOriginalRequestContext:(id)a3
{
}

- (AKAuthorizationStoreManager)localAccountsStorageController
{
  return self->_localAccountsStorageController;
}

- (void)setLocalAccountsStorageController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end