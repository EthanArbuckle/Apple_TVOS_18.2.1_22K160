@interface VSSetupFlowPreparationOperation
- (BOOL)_isInSTBMode;
- (NSOperationQueue)privateQueue;
- (VSDevice)currentDevice;
- (VSOptional)result;
- (VSOptional)storage;
- (VSPreferences)preferences;
- (VSSetupFlowPreparationOperation)init;
- (void)_checkAvailability;
- (void)_checkForExistingAccounts;
- (void)_checkForSupportedAppsButton;
- (void)_checkForSupportedAppsButtonWithFlow:(id)a3;
- (void)_checkForSupportedAppsFromProvider:(id)a3 withCompletion:(id)a4;
- (void)_checkPreferences;
- (void)_fetchAllProviders;
- (void)_fetchAllProvidersIfNeeded;
- (void)_fetchProviderForAccount:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_finishWithFlow:(id)a3;
- (void)_getPersonalAppDescriptions:(id)a3 identityProvider:(id)a4 completion:(id)a5;
- (void)_getSTBProviderFromAllProviders:(id)a3 completionHandler:(id)a4;
- (void)_loadProviderAppDescriptionWithFlow:(id)a3;
- (void)_resolveBundleIDs:(id)a3 forFlow:(id)a4;
- (void)executionDidBegin;
- (void)prepareSTBSetupForAccount:(id)a3 forProvider:(id)a4;
- (void)setCurrentDevice:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation VSSetupFlowPreparationOperation

- (VSSetupFlowPreparationOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VSSetupFlowPreparationOperation;
  v2 = -[VSSetupFlowPreparationOperation init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v5;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", @"VSSetupFlowPreparationOperation");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1LL);
    v7 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___VSDevice);
    currentDevice = v2->_currentDevice;
    v2->_currentDevice = v9;
  }

  return v2;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSErrorLogObject();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_163C8();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithError:](&OBJC_CLASS___VSFailable, "failableWithError:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v7));
  -[VSSetupFlowPreparationOperation setResult:](self, "setResult:", v8);

  -[VSSetupFlowPreparationOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_finishWithFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will finish setup flow with config: %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSFailable failableWithObject:](&OBJC_CLASS___VSFailable, "failableWithObject:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v7));
  -[VSSetupFlowPreparationOperation setResult:](self, "setResult:", v8);

  -[VSSetupFlowPreparationOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (BOOL)_isInSTBMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation preferences](self, "preferences"));
  unsigned __int8 v3 = [v2 isInSTBMode];

  return v3;
}

- (void)_checkPreferences
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Checking preferences.", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation preferences](self, "preferences"));
  if ([v5 shouldSkipSetup])
  {
    v6 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
    -[VSSetupFlowConfiguration setShouldSkipSetupEntirely:](v6, "setShouldSkipSetupEntirely:", 1LL);
    -[VSSetupFlowPreparationOperation _finishWithFlow:](self, "_finishWithFlow:", v6);
  }

  else
  {
    -[VSSetupFlowPreparationOperation _checkAvailability](self, "_checkAvailability");
  }
}

- (void)_checkAvailability
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Checking for feature availability.", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderAvailabilityInfoCenter defaultCenter]( &OBJC_CLASS___VSIdentityProviderAvailabilityInfoCenter,  "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_DD80;
  v6[3] = &unk_24CF0;
  v6[4] = self;
  [v5 determineIdentityProviderAvailabilityWithCompletionHandler:v6];
}

- (void)_checkForExistingAccounts
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Checking for existing account.", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 forceUnwrapObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountStore]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_DF98;
  v8[3] = &unk_24D18;
  v8[4] = self;
  [v7 fetchAccountsWithCompletionHandler:v8];
}

- (void)_getSTBProviderFromAllProviders:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation currentDevice](self, "currentDevice"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_E264;
  v11[3] = &unk_24D40;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchSetTopBoxProfileWithCompletion:v11];
}

- (void)_fetchAllProvidersIfNeeded
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___VSDevice);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_E4EC;
  v4[3] = &unk_24D90;
  v4[4] = self;
  -[VSDevice fetchSetTopBoxProfileWithCompletion:](v3, "fetchSetTopBoxProfileWithCompletion:", v4);
}

- (void)_loadProviderAppDescriptionWithFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identityProvider]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 nonChannelAppDescriptions]);
    v8 = (void *)v7;
    id v9 = &__NSArray0__struct;
    if (v7) {
      id v9 = (void *)v7;
    }
    id v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAppID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
    id v13 = objc_alloc_init(&OBJC_CLASS___VSNonChannelAppDecider);
    [v13 setAppDescriptions:v10];

    [v13 setPreferredAppBundleOrAdamID:v11];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringForAMSDeviceFamilies]);
    [v13 setPreferredDeviceFamily:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 decidedNonChannelApps]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    if (v16)
    {
      [v4 setMsoAppDescription:v16];
    }

    else
    {
      uint64_t v26 = VSDefaultLogObject(0LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "No appDescription", buf, 2u);
      }
    }

    if ([v4 shouldOfferSTBAuthenticationFlow])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
        v44 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
        -[VSSetupFlowPreparationOperation _resolveBundleIDs:forFlow:](self, "_resolveBundleIDs:forFlow:", v30, v4);
      }

      else
      {
        uint64_t v32 = VSErrorLogObject();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_164F8(v33, v34, v35, v36, v37, v38, v39, v40);
        }

        -[VSSetupFlowPreparationOperation _finishWithFlow:](self, "_finishWithFlow:", v4);
      }
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v4 identityProvider]);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_EA84;
      v41[3] = &unk_24A48;
      v41[4] = self;
      id v42 = v4;
      +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:completion:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "determineMultiAppEnabledForProvider:completion:",  v31,  v41);
    }
  }

  else
  {
    uint64_t v17 = VSErrorLogObject();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_16488(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    -[VSSetupFlowPreparationOperation _checkForSupportedAppsButton](self, "_checkForSupportedAppsButton");
  }
}

- (void)_fetchAllProviders
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Fetching all providers", buf, 2u);
  }

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_ED5C;
  id v12 = &unk_24660;
  id v13 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFetchAllOperation);
  v14 = self;
  id v5 = v13;
  uint64_t v6 = VSMainThreadOperationWithBlock(&v9);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "addDependency:", v5, v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation privateQueue](self, "privateQueue"));
  [v8 addOperation:v5];

  VSEnqueueCompletionOperation(v7);
}

- (void)_fetchProviderForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Fetching provider for account", buf, 2u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___VSIdentityProviderFetchOperation);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identityProviderID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 forceUnwrapObject]);
  id v10 = [v7 initWithIdentityProviderID:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation privateQueue](self, "privateQueue"));
  [v11 addOperation:v10];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_F53C;
  v15[3] = &unk_24700;
  id v16 = v10;
  uint64_t v17 = self;
  id v18 = v4;
  id v12 = v4;
  id v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v15));
  [v14 addDependency:v13];
  VSEnqueueCompletionOperation(v14);
}

- (void)prepareSTBSetupForAccount:(id)a3 forProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
  -[VSSetupFlowConfiguration setProviderAccountUsername:](v10, "setProviderAccountUsername:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredAppID]);
  -[VSSetupFlowConfiguration setPreferredAppID:](v10, "setPreferredAppID:", v9);

  -[VSSetupFlowConfiguration setIdentityProvider:](v10, "setIdentityProvider:", v6);
  -[VSSetupFlowConfiguration setShouldOfferSTBAuthenticationFlow:]( v10,  "setShouldOfferSTBAuthenticationFlow:",  -[VSSetupFlowPreparationOperation _isInSTBMode](self, "_isInSTBMode"));
  -[VSSetupFlowPreparationOperation _loadProviderAppDescriptionWithFlow:]( self,  "_loadProviderAppDescriptionWithFlow:",  v10);
}

- (void)_checkForSupportedAppsFromProvider:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Will check for supported apps from provider: %@", buf, 0xCu);
  }

  if ([v6 shouldShowChannelApps]
    && ([v6 shouldShowSubscriptionApps] & 1) != 0)
  {
    uint64_t v10 = 5LL;
  }

  else if ([v6 shouldShowChannelApps])
  {
    uint64_t v10 = 3LL;
  }

  else if ([v6 shouldShowSubscriptionApps])
  {
    uint64_t v10 = 4LL;
  }

  else
  {
    uint64_t v10 = 3LL;
  }

  id v11 = objc_alloc(&OBJC_CLASS___VSIdentityProviderFetchAppsOperation);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 forceUnwrapObject]);
  id v14 = [v11 initWithProviderIdentifier:v13 andType:v10];

  [v14 setShouldFetchImages:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_FBD8;
  v29[3] = &unk_24700;
  id v15 = v14;
  id v30 = v15;
  v31 = self;
  id v16 = v6;
  id v32 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v29));
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 nonChannelAppDescriptions]);
  if (v19) {
    -[NSMutableArray addObjectsFromArray:](v18, "addObjectsFromArray:", v19);
  }
  id v20 = [[VSLoadAllAppIconsOperation alloc] initWithApps:v18 shouldPrecomposeIcon:0];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation privateQueue](self, "privateQueue"));
  [v17 addDependency:v20];
  [v17 addDependency:v15];
  [v21 addOperation:v17];
  [v21 addOperation:v20];
  [v21 addOperation:v15];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_FE64;
  v25[3] = &unk_24B78;
  id v26 = v16;
  id v27 = v21;
  id v28 = v7;
  id v22 = v7;
  id v23 = v21;
  id v24 = v16;
  [v17 setCompletionBlock:v25];
}

- (void)_getPersonalAppDescriptions:(id)a3 identityProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = VSDefaultLogObject(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Will check for personalized channels for provider %@ with response %@",  buf,  0x16u);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___VSAppChannelsFilter);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 appsByChannelID]);
  [v13 setAppsByChannelID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation storage](self, "storage"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 forceUnwrapObject]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 channelsCenter]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1027C;
  v21[3] = &unk_24EC0;
  id v22 = v13;
  id v23 = v9;
  id v24 = v10;
  id v18 = v10;
  id v19 = v9;
  id v20 = v13;
  [v17 fetchAccountChannelsWithCompletionHandler:v21];
}

- (void)_resolveBundleIDs:(id)a3 forFlow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Will resolve bundle IDs: %@", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10674;
  v12[3] = &unk_24A98;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v6;
  +[VUIAccessViewController resolveBundleIDs:completionHandler:]( &OBJC_CLASS___VUIAccessViewController,  "resolveBundleIDs:completionHandler:",  v11,  v12);
}

- (void)_checkForSupportedAppsButton
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Will check for endpoint to show supported apps.", v6, 2u);
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
  -[VSSetupFlowConfiguration setShouldOfferAuthenticationFlow:](v5, "setShouldOfferAuthenticationFlow:", 1LL);
  -[VSSetupFlowPreparationOperation _checkForSupportedAppsButtonWithFlow:]( self,  "_checkForSupportedAppsButtonWithFlow:",  v5);
}

- (void)_checkForSupportedAppsButtonWithFlow:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___VSFetchAllSupportedAppsOperation);
  objc_initWeak(&location, v5);
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1097C;
  id v11 = &unk_24EE8;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v12 = v6;
  id v13 = self;
  [v5 setCompletionBlock:&v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowPreparationOperation privateQueue](self, "privateQueue", v8, v9, v10, v11));
  [v7 addOperation:v5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)executionDidBegin
{
}

- (VSOptional)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (VSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end