@interface AASetupAssistantService
+ (id)urlConfiguration;
+ (void)resetURLConfiguration;
- (AASetupAssistantService)init;
- (AASetupAssistantService)initWithAccount:(id)a3;
- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4;
- (NSString)appleID;
- (NSString)emailChoice;
- (NSString)password;
- (id)_signingSession;
- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceReprovisioningWithDSID:(id)a3;
- (void)authenticateWithHandler:(id)a3;
- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4;
- (void)dealloc;
- (void)downloadURLConfiguration:(id)a3;
- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4;
- (void)setAppleID:(id)a3;
- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)setEmailChoice:(id)a3;
- (void)setPassword:(id)a3;
- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4;
- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3;
- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3;
@end

@implementation AASetupAssistantService

+ (id)urlConfiguration
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_2FA8;
  v13 = sub_2FB8;
  id v14 = 0LL;
  id v2 = objc_alloc_init(&OBJC_CLASS___AASetupAssistantConfigRequest);
  [v2 setFlushCache:byte_19120];
  byte_19120 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_2FC0;
  v6[3] = &unk_14588;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0LL);
  v7 = v3;
  [v2 performRequestWithHandler:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (void)resetURLConfiguration
{
  byte_19120 = 1;
}

- (AASetupAssistantService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AASetupAssistantService;
  id v2 = -[AASetupAssistantService init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;
  }

  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[AASetupAssistantService init](self, "init");
  if (v8)
  {
    uint64_t v9 = (NSString *)[v6 copy];
    appleID = v8->_appleID;
    v8->_appleID = v9;

    uint64_t v11 = (NSString *)[v7 copy];
    password = v8->_password;
    v8->_password = v11;
  }

  return v8;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5 = a3;
  id v6 = -[AASetupAssistantService init](self, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
    uint64_t v9 = (NSString *)[v8 copy];
    appleID = v7->_appleID;
    v7->_appleID = v9;

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount credential](v7->_account, "credential"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 password]);
    v13 = (NSString *)[v12 copy];
    password = v7->_password;
    v7->_password = v13;
  }

  return v7;
}

- (void)dealloc
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage) {
    CFRelease(cookieStorage);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AASetupAssistantService;
  -[AASetupAssistantService dealloc](&v4, "dealloc");
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage) {
      CFRelease(cookieStorage);
    }
    self->_cookieStorage = a3;
    if (a3) {
      CFRetain(a3);
    }
  }

- (void)downloadURLConfiguration:(id)a3
{
  id v3 = a3;
  objc_super v4 = dispatch_queue_create("urlConfigurationQueue", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_32D0;
  block[3] = &unk_145B0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)authenticateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_create("authenticationRequestQueue", 0LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_33B8;
  v7[3] = &unk_145D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_3650;
  v7[3] = &unk_14628;
  id v8 = a4;
  id v6 = v8;
  -[AASetupAssistantService createAppleIDWithParameters:handlerWithResponse:]( self,  "createAppleIDWithParameters:handlerWithResponse:",  a3,  v7);
}

- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  v10 = dispatch_queue_create("createAppleIDQueue", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_376C;
  block[3] = &unk_14650;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  v10 = dispatch_queue_create("updateAppleIDQueue", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3CAC;
  block[3] = &unk_14650;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  v10 = dispatch_queue_create("setupDelegateAccountsQueue", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_41A4;
  block[3] = &unk_14650;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  v10 = dispatch_queue_create("loginDelegatesQueue", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4690;
  block[3] = &unk_14650;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4ADC;
  v5[3] = &unk_14678;
  id v6 = a3;
  id v4 = v6;
  -[AASetupAssistantService upgradeiCloudTermsIfNecessaryWithCustomHeaders:handler:]( self,  "upgradeiCloudTermsIfNecessaryWithCustomHeaders:handler:",  0LL,  v5);
}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_account)
  {
    uint64_t v8 = dispatch_queue_create("upgradeTermsQueue", 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_4C38;
    block[3] = &unk_14650;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = _AALogSystem();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Error: No AppleAccount set on AASetupAssistant Service",  v11,  2u);
    }

    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.appleaccount",  0LL,  0LL));
    (*((void (**)(id, void, void, dispatch_queue_s *))v7 + 2))(v7, 0LL, 0LL, v8);
  }
}

- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AALogSystem();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AASetupAssistantService appleID](self, "appleID"));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v8, @"apple-id");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AASetupAssistantService password](self, "password"));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v9, @"password");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo appleIDClientIdentifier](&OBJC_CLASS___AADeviceInfo, "appleIDClientIdentifier"));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v10, @"client-id");

  id v11 = [[AASetupAssistantUpgradeStatusRequest alloc] initWithAccount:self->_account];
  if (self->_account)
  {
    id v12 = [[AADeviceProvisioningSession alloc] initWithAccount:self->_account];
    [v12 addProvisioningInfoToAARequest:v11];
  }

  [v11 setCookieStorage:self->_cookieStorage];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_5088;
  v14[3] = &unk_14600;
  id v15 = v4;
  id v13 = v4;
  [v11 performRequestWithHandler:v14];
}

- (id)_signingSession
{
  if (!self->_signingSession) {
    goto LABEL_7;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_signingSessionCreationDate];
  double v5 = v4;

  if (v5 > 540.0)
  {
    uint64_t v6 = _AALogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "shared signing session expired. creating a new signing session.",  buf,  2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0LL;
  }

  if (!self->_signingSession)
  {
LABEL_7:
    uint64_t v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v9;

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AASetupAssistantService urlConfiguration]( &OBJC_CLASS___AASetupAssistantService,  "urlConfiguration"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 signingSessionCertURL]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AASetupAssistantService urlConfiguration]( &OBJC_CLASS___AASetupAssistantService,  "urlConfiguration"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 signingSessionURL]);
    id v24 = 0LL;
    id v15 = (AASigningSession *)objc_claimAutoreleasedReturnValue( +[AASigningSession establishedSessionWithCertURL:sessionURL:error:]( &OBJC_CLASS___AASigningSession,  "establishedSessionWithCertURL:sessionURL:error:",  v12,  v14,  &v24));
    id v16 = (AASigningSession *)v24;
    v17 = self->_signingSession;
    self->_signingSession = v15;

    if (v16)
    {
      uint64_t v18 = _AALogSystem();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }
    }
  }

  uint64_t v20 = _AALogSystem();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    v26 = v22;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  return self->_signingSession;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AADeviceProvisioningSession alloc] initWithDSID:v7];

  [v8 setCookieStorageRef:self->_cookieStorage];
  unsigned int v9 = [v8 provisionDeviceWithData:v6];

  uint64_t v10 = _AALogSystem();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      __int16 v16 = 0;
      id v13 = "Device provisioning failed";
      id v14 = (uint8_t *)&v16;
LABEL_6:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }

  else if (v12)
  {
    __int16 v15 = 0;
    id v13 = "Device provisioning completed sucessfully";
    id v14 = (uint8_t *)&v15;
    goto LABEL_6;
  }
}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AADeviceProvisioningSession alloc] initWithDSID:v7];

  [v8 setCookieStorageRef:self->_cookieStorage];
  unsigned int v9 = [v8 synchronizeProvisioningWithData:v6];

  uint64_t v10 = _AALogSystem();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      __int16 v16 = 0;
      id v13 = "Device provisioning sync failed";
      id v14 = (uint8_t *)&v16;
LABEL_6:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }

  else if (v12)
  {
    __int16 v15 = 0;
    id v13 = "Device provisioning sync completed successfully";
    id v14 = (uint8_t *)&v15;
    goto LABEL_6;
  }
}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  id v3 = a3;
  id v4 = [[AADeviceProvisioningSession alloc] initWithDSID:v3];

  unsigned int v5 = [v4 eraseProvisioning];
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = _AALogSystem();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Something went wrong when trying to erase the device provisioning: %d",  (uint8_t *)v9,  8u);
    }
  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)emailChoice
{
  return self->_emailChoice;
}

- (void)setEmailChoice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end