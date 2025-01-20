@interface DMDiphoneOSAppController
+ (id)_appStoreAccountIdentifierForPersona:(id)a3;
+ (id)_appleAccountForPersona:(id)a3;
+ (id)changeTypeAsString:(int64_t)a3;
+ (id)enumeratorForOrdinaryApps;
+ (id)enumeratorForSystemAppPlaceholders;
+ (id)enumeratorForUserAppPlaceholders;
+ (id)metadataPath;
- (ASDJobManager)jobManager;
- (ASDUpdatesService)updatesService;
- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)userIsSignedIn;
- (BOOL)writeManagementInformationToDiskWithError:(id *)a3;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSArray)_foregroundBundleIdentifiers;
- (NSMutableDictionary)bundleIDsToAssertions;
- (NSString)singleAppModeBundleIndentifier;
- (id)_allPropertyKeys;
- (id)_managedDefaultsForBundleIdentifier:(id)a3;
- (id)configurationForBundleIdentifier:(id)a3;
- (id)feedbackForBundleIdentifier:(id)a3;
- (id)foregroundBundleIdentifiers;
- (id)initPrivate;
- (unint64_t)appTypeFromProxy:(id)a3;
- (void)_applyStoreDictionary:(id)a3 toAppMetadata:(id)a4;
- (void)_downloadAppForRequest:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)_getMetadataForBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 completion:(id)a6;
- (void)_installDeviceLicensedAppForRequest:(id)a3 completion:(id)a4;
- (void)_installUserAppForRequest:(id)a3 completion:(id)a4;
- (void)_startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)_uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_updateEndedForLifeCycle:(id)a3;
- (void)_updateForegroundBundleIdentifiers;
- (void)_withSandboxExtensionForApp:(id)a3 do:(id)a4;
- (void)addTerminationAssertion:(id)a3 forBundleIdentifier:(id)a4;
- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)didCancelUpdatingForLifeCycle:(id)a3;
- (void)didFailUpdatingForLifeCycle:(id)a3;
- (void)didFinishUpdatingForLifeCycle:(id)a3;
- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5;
- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4;
- (void)handleFetchRequest:(id)a3 completion:(id)a4;
- (void)installSystemAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)promptUserToSignInWithCompletion:(id)a3;
- (void)removeTerminationAssertionForBundleIdentifier:(id)a3;
- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)sendAppRequestWithBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 type:(int64_t)a6 skipDownloads:(BOOL)a7 completion:(id)a8;
- (void)setBundleIDsToAssertions:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setSingleAppModeBundleIndentifier:(id)a3;
- (void)set_foregroundBundleIdentifiers:(id)a3;
- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4;
- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4;
- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4;
- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
@end

@implementation DMDiphoneOSAppController

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100013A58;
  v13[3] = &unk_10009DC18;
  v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController updatesService](self, "updatesService"));
  id v16 = v6;
  v17 = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v6 storeItemIdentifier]);
  id v19 = v7;
  id v8 = v7;
  id v9 = v18;
  id v10 = v6;
  id v11 = v15;
  v12 = v14;
  [v11 getManagedUpdatesWithCompletionBlock:v13];
}

+ (id)enumeratorForUserAppPlaceholders
{
  return +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  64LL);
}

+ (id)enumeratorForSystemAppPlaceholders
{
  return +[LSApplicationRecord systemPlaceholderEnumerator]( &OBJC_CLASS___LSApplicationRecord,  "systemPlaceholderEnumerator");
}

+ (id)enumeratorForOrdinaryApps
{
  return +[LSApplicationRecord enumeratorWithOptions:](&OBJC_CLASS___LSApplicationRecord, "enumeratorWithOptions:", 0LL);
}

- (unint64_t)appTypeFromProxy:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 applicationType]);
  else {
    unint64_t v4 = [v3 isEqualToString:LSSystemApplicationType];
  }

  return v4;
}

- (id)_allPropertyKeys
{
  if (qword_1000CCBC0 != -1) {
    dispatch_once(&qword_1000CCBC0, &stru_10009DC38);
  }
  return (id)qword_1000CCBB8;
}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ASDExternalManifestRequestOptions alloc] initWithURL:v6];

  [v7 setShouldHideUserPrompts:1];
  id v8 = [[ASDExternalManifestRequest alloc] initWithOptions:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000149B8;
  v10[3] = &unk_10009DC60;
  id v11 = v5;
  id v9 = v5;
  [v8 startWithCompletionBlock:v10];
}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  id v9 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v8 error:0];
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 compatibilityObject]);
  id v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    unsigned __int8 v13 = [v6 licenseType];
    if ((v13 & 1) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100014C58;
      v16[3] = &unk_10009DC88;
      char v19 = (v13 & 2) >> 1;
      v16[4] = self;
      id v17 = v6;
      id v18 = v7;
      -[DMDiphoneOSAppController _installDeviceLicensedAppForRequest:completion:]( self,  "_installDeviceLicensedAppForRequest:completion:",  v17,  v16);
    }

    else if ((v13 & 2) != 0)
    {
      -[DMDiphoneOSAppController _installUserAppForRequest:completion:]( self,  "_installUserAppForRequest:completion:",  v6,  v7);
    }

    else
    {
      uint64_t v14 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      (*((void (**)(id, void *))v7 + 2))(v7, v15);
    }
  }

  else
  {
    -[DMDiphoneOSAppController installSystemAppWithBundleIdentifier:completion:]( self,  "installSystemAppWithBundleIdentifier:completion:",  v8,  v7);
  }
}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = DMFAppLog(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Resume app installation for bundle identifier: %{public}@",  buf,  0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100014E08;
  v14[3] = &unk_10009DCD8;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController jobManager](self, "jobManager"));
  id v17 = v7;
  id v15 = v6;
  id v11 = v16;
  id v12 = v7;
  id v13 = v6;
  [v11 getJobsUsingBlock:v14];
}

- (void)_installDeviceLicensedAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = DMFAppLog(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Install device licensed app for request: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  -[DMDiphoneOSAppController _downloadAppForRequest:type:completion:]( self,  "_downloadAppForRequest:type:completion:",  v6,  2LL,  v7);
}

- (void)_installUserAppForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = DMFAppLog(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Install user licensed app for request: %{public}@",  buf,  0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100015318;
  v13[3] = &unk_10009DD00;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  -[DMDiphoneOSAppController _downloadAppForRequest:type:completion:]( self,  "_downloadAppForRequest:type:completion:",  v12,  1LL,  v13);
}

- (void)_downloadAppForRequest:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 storeItemIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 personaIdentifier]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000154F8;
  v14[3] = &unk_10009DD28;
  id v15 = v8;
  id v13 = v8;
  -[DMDiphoneOSAppController sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:]( self,  "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:",  v10,  v11,  v12,  a4,  0LL,  v14);
}

- (id)initPrivate
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppController;
  v2 = -[DMDAppController initPrivate](&v14, "initPrivate");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)v2[7];
    v2[7] = &__NSArray0__struct;

    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForDefaultMainDisplayMonitor"));
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    uint64_t v10 = sub_100015718;
    id v11 = &unk_10009DD50;
    objc_copyWeak(&v12, &location);
    [v4 setTransitionHandler:&v8];
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:",  v4,  v8,  v9,  v10,  v11));
    id v6 = (void *)v2[6];
    v2[6] = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (id)foregroundBundleIdentifiers
{
  return -[DMDiphoneOSAppController _foregroundBundleIdentifiers](self, "_foregroundBundleIdentifiers");
}

- (ASDJobManager)jobManager
{
  if (qword_1000CCBD0 != -1) {
    dispatch_once(&qword_1000CCBD0, &stru_10009DD70);
  }
  return (ASDJobManager *)(id)qword_1000CCBC8;
}

- (ASDUpdatesService)updatesService
{
  if (qword_1000CCBE0 != -1) {
    dispatch_once(&qword_1000CCBE0, &stru_10009DD90);
  }
  return (ASDUpdatesService *)(id)qword_1000CCBD8;
}

- (void)addTerminationAssertion:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = DMFAppLog(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Add termination assertion for bundle identifier: %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  if (!v11)
  {
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[DMDiphoneOSAppController setBundleIDsToAssertions:](self, "setBundleIDsToAssertions:", v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  [v13 setObject:v7 forKeyedSubscript:v6];
}

- (void)removeTerminationAssertionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Remove termination assertion for bundle identifier: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);
  [v9 invalidate];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController bundleIDsToAssertions](self, "bundleIDsToAssertions"));
  [v10 setObject:0 forKeyedSubscript:v4];
}

- (BOOL)userIsSignedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)promptUserToSignInWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  if (v5) {
    id v6 = [[SSMutableAuthenticationContext alloc] initWithAccount:v5];
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[SSMutableAuthenticationContext contextForSignIn]( &OBJC_CLASS___SSMutableAuthenticationContext,  "contextForSignIn"));
  }
  id v7 = v6;
  [v6 setPromptStyle:0];
  [v7 setAccountNameEditable:0];
  [v7 setCanCreateNewAccount:1];
  id v8 = [[SSAuthenticateRequest alloc] initWithAuthenticationContext:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100015BCC;
  v10[3] = &unk_10009DDB8;
  id v11 = v3;
  id v9 = v3;
  [v8 startWithAuthenticateResponseBlock:v10];
}

- (void)sendAppRequestWithBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 type:(int64_t)a6 skipDownloads:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v19 = v17;
  if (!v9)
  {

    id v14 = 0LL;
  }

  else {
    v20 = off_10009DEC8[a6 - 1];
  }
  uint64_t v21 = DMFAppLog(v17, v18);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = @"YES";
    *(_DWORD *)buf = 138544386;
    id v33 = v14;
    if (v9) {
      v23 = @"NO";
    }
    v24 = @"override";
    __int16 v34 = 2114;
    v37 = v20;
    id v35 = v15;
    __int16 v36 = 2114;
    if (!v16) {
      v24 = @"default";
    }
    __int16 v38 = 2114;
    v39 = v23;
    __int16 v40 = 2114;
    v41 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Send app store request for bundle identifier: %{public}@, store item identifier: %{public}@, type: %{public}@, dow nload: %{public}@, persona: %{public}@",  buf,  0x34u);
  }

  id v25 = [[ASDManagedApplicationRequestOptions alloc] initWithItemIdentifer:v15 externalVersionIdentifier:0 bundleIdentifier:v14 bundleVersion:0 skipDownloads:v9];
  [v25 setRequestType:a6];
  id v26 = [(id)objc_opt_class(self) _appStoreAccountIdentifierForPersona:v16];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v25 setAccountIdentifier:v27];

  id v28 = [[ASDManagedApplicationRequest alloc] initWithOptions:v25];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100015E84;
  v30[3] = &unk_10009DDE0;
  v30[4] = self;
  id v31 = v19;
  id v29 = v19;
  [v28 sendRequestWithCompletionBlock:v30];
}

+ (id)_appStoreAccountIdentifierForPersona:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(id)objc_opt_class(a1) _appleAccountForPersona:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v8 = v6;
    if (v6)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
      uint64_t v11 = DMFAppLog(v9, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        id v16 = v4;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "persona:%{public}@ -> accountIdentifier:%{public}@",  (uint8_t *)&v15,  0x16u);
      }
    }

    else
    {
      uint64_t v13 = DMFAppLog(0LL, v7);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "persona:%{public}@ -> accountIdentifier:<none>",  (uint8_t *)&v15,  0xCu);
      }

      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  return v9;
}

+ (id)_appleAccountForPersona:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 accountsWithAccountType:v5]);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    __int16 v17 = v5;
    uint64_t v9 = *(void *)v19;
    uint64_t v10 = ACAccountPropertyPersonaIdentifier;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0
          && ([v13 isEqualToString:v3] & 1) != 0)
        {
          id v15 = v12;

          goto LABEL_12;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    id v15 = 0LL;
LABEL_12:
    id v5 = v17;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)changeTypeAsString:(int64_t)a3
{
  else {
    return off_10009DEE0[a3];
  }
}

- (void)installSystemAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"DMDAppController+iphoneOS.m" lineNumber:328 description:@"We must have a bundle identifier to be installing a system app"];
  }

  id v9 = [[ASDSystemAppRequest alloc] initWithBundleID:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001640C;
  v12[3] = &unk_10009DE08;
  id v13 = v8;
  id v10 = v8;
  [v9 startWithErrorHandler:v12];
}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppController;
  BOOL v3 = -[DMDAppController writeManagementInformationToDiskWithError:]( &v6,  "writeManagementInformationToDiskWithError:",  a3);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v4 rereadManagedAppAttributes];
  }

  return v3;
}

+ (id)metadataPath
{
  return +[DMDPaths managedAppsManifest](&OBJC_CLASS___DMDPaths, "managedAppsManifest");
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000165F4;
  v9[3] = &unk_10009D9B8;
  id v10 = a5;
  id v8 = v10;
  -[DMDiphoneOSAppController _getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:]( self,  "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:",  0LL,  a3,  a4,  v9);
}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  id v22 = a3;
  id v7 = (void (**)(id, DMDAppMetadata *, void))a4;
  id v8 = v22;
  if (v22)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"DMDAppController+iphoneOS.m", 390, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    id v8 = 0LL;
    if (v7) {
      goto LABEL_3;
    }
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v21 handleFailureInMethod:a2, self, @"DMDAppController+iphoneOS.m", 391, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

  id v8 = v22;
LABEL_3:
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  id v10 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v9 error:0];
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 compatibilityObject]);
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v15 = (DMDAppMetadata *)objc_claimAutoreleasedReturnValue([v22 storeItemIdentifier]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v22 personaIdentifier]);
    -[DMDiphoneOSAppController _getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:]( self,  "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:",  v9,  v15,  v14,  v7);
  }

  else
  {
    id v15 = objc_opt_new(&OBJC_CLASS___DMDAppMetadata);
    -[DMDAppMetadata setBundleIdentifier:](v15, "setBundleIdentifier:", v9);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 itemID]);
    -[DMDAppMetadata setStoreItemIdentifier:](v15, "setStoreItemIdentifier:", v16);

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 localizedName]);
    __int128 v18 = (void *)v17;
    if (v17)
    {
      -[DMDAppMetadata setDisplayName:](v15, "setDisplayName:", v17);
    }

    else
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 itemName]);
      -[DMDAppMetadata setDisplayName:](v15, "setDisplayName:", v19);
    }

    -[DMDAppMetadata setIsStoreApp:](v15, "setIsStoreApp:", 0LL);
    -[DMDAppMetadata setIsFree:](v15, "setIsFree:", 1LL);
    -[DMDAppMetadata setIsUserLicensed:](v15, "setIsUserLicensed:", 1LL);
    v7[2](v7, v15, 0LL);
  }
}

- (id)configurationForBundleIdentifier:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[DMDiphoneOSAppController _managedDefaultsForBundleIdentifier:]( self,  "_managedDefaultsForBundleIdentifier:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"com.apple.configuration.managed"]);

  return v4;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = DMFAppLog(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"non-nil";
    if (!v7) {
      id v12 = @"nil";
    }
    *(_DWORD *)buf = 138543618;
    __int128 v19 = v12;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set configuration: %{public}@, for bundle identifier: %{public}@",  buf,  0x16u);
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[DMDiphoneOSAppController _managedDefaultsForBundleIdentifier:]( self,  "_managedDefaultsForBundleIdentifier:",  v8));
  uint64_t v14 = (NSMutableDictionary *)[v13 mutableCopy];

  if (!v14) {
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v7,  @"com.apple.configuration.managed");
  _CFPreferencesWriteManagedDomain(v14, @"mobile", 0LL, v8);
  id v17 = v8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  _CFPreferencesManagementStatusChangedForDomains();
  _CFPreferencesPostValuesChangedInDomains(v15);

  return 1;
}

- (void)_withSandboxExtensionForApp:(id)a3 do:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(id, void *, uint64_t))a4;
  if (v6)
  {
    uint64_t v19 = 1LL;
    id v7 = v5;
    uint64_t v8 = container_create_or_lookup_for_current_user(2, [v7 UTF8String], 0, 0, 0, &v19);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v19 = 1LL;
      uint64_t v10 = container_copy_path(v8, &v19);
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
        if (v12)
        {
          free(v11);
          uint64_t v19 = 1LL;
          uint64_t v13 = container_acquire_sandbox_extension(v9, 0LL, &v19);
          int v14 = v13;
          uint64_t v16 = DMFAppLog(v13, v15);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          __int128 v18 = v17;
          if (v14)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v21 = v7;
              __int16 v22 = 2114;
              uint64_t v23 = (uint64_t)v12;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "container_acquire_sandbox_extension %{public}@ succeeded for path '%{public}@'",  buf,  0x16u);
            }
          }

          else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v21 = v7;
            __int16 v22 = 2048;
            uint64_t v23 = v19;
            __int16 v24 = 2114;
            id v25 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "container_acquire_sandbox_extension %{public}@ failed, error %llu, path '%{public}@'",  buf,  0x20u);
          }

          v6[2](v6, v12, v19);
          container_free_object(v9);
        }

        else
        {
          v6[2](v6, 0LL, 1LL);
          container_free_object(v9);
          free(v11);
        }
      }

      else
      {
        v6[2](v6, 0LL, v19);
        container_free_object(v9);
      }
    }

    else
    {
      v6[2](v6, 0LL, v19);
    }
  }
}

- (id)feedbackForBundleIdentifier:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_100016DB0;
  int v14 = sub_100016DC0;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100016DC8;
  v7[3] = &unk_10009DE30;
  id v4 = a3;
  id v8 = v4;
  uint64_t v9 = &v10;
  -[DMDiphoneOSAppController _withSandboxExtensionForApp:do:](self, "_withSandboxExtensionForApp:do:", v4, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = DMFAppLog(v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"non-nil";
    if (!v8) {
      uint64_t v13 = @"nil";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Set feedback: %{public}@, for bundle identifier: %{public}@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000170A4;
  v18[3] = &unk_10009DE58;
  id v14 = v9;
  id v19 = v14;
  __int16 v22 = a5;
  id v15 = v8;
  id v20 = v15;
  id v21 = buf;
  -[DMDiphoneOSAppController _withSandboxExtensionForApp:do:](self, "_withSandboxExtensionForApp:do:", v14, v18);
  BOOL v16 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

  _Block_object_dispose(buf, 8);
  return v16;
}

- (id)_managedDefaultsForBundleIdentifier:(id)a3
{
  BOOL v3 = (void *)_CFPreferencesCopyPathForManagedDomain(a3, @"mobile", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v3));

  return v4;
}

- (void)_applyStoreDictionary:(id)a3 toAppMetadata:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:ASDManagedLookupBundleID]);
  if (v6) {
    [v5 setBundleIdentifier:v6];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:ASDManagedLookupItemID]);
  if (v7) {
    [v5 setStoreItemIdentifier:v7];
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:ASDManagedLookupBundleDisplayName]);
  if (v8) {
    [v5 setDisplayName:v8];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:ASDManagedLookupIsAppFree]);
  uint64_t v10 = v9;
  if (v9) {
    objc_msgSend(v5, "setIsFree:", objc_msgSend(v9, "BOOLValue"));
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:ASDManagedLookupIsActiveAccountAppOwner]);
  uint64_t v12 = v11;
  if (v11) {
    objc_msgSend(v5, "setIsUserLicensed:", objc_msgSend(v11, "BOOLValue"));
  }
}

- (void)_getMetadataForBundleIdentifier:(id)a3 storeItemIdentifier:(id)a4 personaIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = DMFAppLog(v13, v14);
  BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2114;
    id v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Get metadata for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@",  buf,  0x20u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000174C8;
  v22[3] = &unk_10009DEA8;
  id v23 = v10;
  id v24 = v11;
  id v26 = v12;
  id v27 = v13;
  id v25 = self;
  id v17 = v12;
  id v18 = v13;
  id v19 = v11;
  id v20 = v10;
  id v21 = objc_retainBlock(v22);
  -[DMDiphoneOSAppController sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:]( self,  "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:",  v20,  v19,  v17,  3LL,  1LL,  v21);
}

- (void)_updateForegroundBundleIdentifiers
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2 object:self file:@"DMDAppController+iphoneOS.m" lineNumber:689 description:@"_updateForegroundBundleIdentifiers should always be called on the main thread"];
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController layoutMonitor](self, "layoutMonitor"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentLayout]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elements]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)v12),  "bundleIdentifier",  (void)v20));
        if (v13) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  id v14 = [v7 copy];
  -[DMDiphoneOSAppController set_foregroundBundleIdentifiers:](self, "set_foregroundBundleIdentifiers:", v14);

  uint64_t v17 = DMFAppLog(v15, v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_1000610CC((uint64_t)v7, v18);
  }
}

- (NSString)singleAppModeBundleIndentifier
{
  return self->_singleAppModeBundleIndentifier;
}

- (void)setSingleAppModeBundleIndentifier:(id)a3
{
}

- (NSMutableDictionary)bundleIDsToAssertions
{
  return self->_bundleIDsToAssertions;
}

- (void)setBundleIDsToAssertions:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (NSArray)_foregroundBundleIdentifiers
{
  return self->__foregroundBundleIdentifiers;
}

- (void)set_foregroundBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100017B50;
  v8[3] = &unk_10009DF40;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[DMDiphoneOSAppController promptUserToSignInWithCompletion:](self, "promptUserToSignInWithCompletion:", v8);
}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017EE8;
  v11[3] = &unk_10009DCD8;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController jobManager](self, "jobManager"));
  id v14 = v7;
  id v12 = v6;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  [v8 getJobsUsingBlock:v11];
}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(&OBJC_CLASS___BKSTerminationAssertion);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_1000182E0;
  uint64_t v16 = &unk_10009DF68;
  uint64_t v17 = self;
  id v18 = v7;
  id v19 = v8;
  SEL v20 = a2;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 initWithBundleIdentifier:v11 efficacy:3 name:@"com.apple.dmd.remove-foreground-app" withHandler:&v13];
  -[DMDiphoneOSAppController addTerminationAssertion:forBundleIdentifier:]( self,  "addTerminationAssertion:forBundleIdentifier:",  v12,  v11,  v13,  v14,  v15,  v16,  v17);
}

- (void)_uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___IXUninstallOptions);
  [v7 setRequestUserConfirmation:0];
  [v7 setWaitForDeletion:0];
  [v7 setIgnoreRemovability:1];
  [v7 setIgnoreRestrictions:1];
  [v7 setIgnoreAppProtection:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100018514;
  v9[3] = &unk_10009DF90;
  id v10 = v5;
  id v8 = v5;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:options:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:options:completion:",  v6,  v7,  v9);
}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController foregroundBundleIdentifiers](self, "foregroundBundleIdentifiers"));
  unsigned __int8 v13 = [v12 containsObject:v11];

  if ((v13 & 1) != 0)
  {
    uint64_t v16 = DMFAppLog(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138543362;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating foreground app for request: %{public}@, so will take termination assertion",  (uint8_t *)&v25,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 isInSingleAppMode]);
    unsigned int v20 = [v19 BOOLValue];

    if (v20)
    {
      uint64_t v23 = DMFAppLog(v21, v22);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543362;
        id v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "We will need to restart the app after updating bundle identifier: %{public}@",  (uint8_t *)&v25,  0xCu);
      }

      -[DMDiphoneOSAppController setSingleAppModeBundleIndentifier:](self, "setSingleAppModeBundleIndentifier:", v11);
    }
  }

  -[DMDiphoneOSAppController _startUpdatingAppForRequest:metadata:completion:]( self,  "_startUpdatingAppForRequest:metadata:completion:",  v8,  v9,  v10);
}

- (void)didCancelUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppController;
  id v4 = a3;
  -[DMDAppController didCancelUpdatingForLifeCycle:](&v5, "didCancelUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:]( self,  "_updateEndedForLifeCycle:",  v4,  v5.receiver,  v5.super_class);
}

- (void)didFailUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppController;
  id v4 = a3;
  -[DMDAppController didFailUpdatingForLifeCycle:](&v5, "didFailUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:]( self,  "_updateEndedForLifeCycle:",  v4,  v5.receiver,  v5.super_class);
}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDiphoneOSAppController;
  id v4 = a3;
  -[DMDAppController didFinishUpdatingForLifeCycle:](&v5, "didFinishUpdatingForLifeCycle:", v4);
  -[DMDiphoneOSAppController _updateEndedForLifeCycle:]( self,  "_updateEndedForLifeCycle:",  v4,  v5.receiver,  v5.super_class);
}

- (void)_startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 lifeCycle]);
  [v10 addObserver:self];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100018AA8;
  v28[3] = &unk_10009DD00;
  v28[4] = self;
  id v11 = v10;
  id v29 = v11;
  id v12 = v9;
  id v30 = v12;
  unsigned __int8 v13 = objc_retainBlock(v28);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 manifestURL]);
  uint64_t v16 = (void *)v14;
  if (v14)
  {
    uint64_t v17 = DMFAppLog(v14, v15);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 host]);
      *(_DWORD *)buf = 138543362;
      id v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Start updating enterprise app with manifest URL from: %{public}@",  buf,  0xCu);
    }

    -[DMDiphoneOSAppController startInstallingEnterpriseAppWithManifestURL:completion:]( self,  "startInstallingEnterpriseAppWithManifestURL:completion:",  v16,  v13);
  }

  else
  {
    unsigned int v20 = (void *)objc_opt_new(&OBJC_CLASS___DMFInstallAppRequest);
    [v20 setLicenseType:3];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    [v20 setBundleIdentifier:v21];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 storeItemIdentifier]);
    [v20 setStoreItemIdentifier:v22];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 personaIdentifier]);
    [v20 setPersonaIdentifier:v23];

    uint64_t v26 = DMFAppLog(v24, v25);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v8;
      __int16 v33 = 2114;
      __int16 v34 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Start updating non-enterprise app for request: %{public}@, new install request: %{public}@",  buf,  0x16u);
    }

    -[DMDiphoneOSAppController startInstallingNonEnterpriseAppForRequest:completion:]( self,  "startInstallingNonEnterpriseAppForRequest:completion:",  v20,  v13);
  }
}

- (void)_updateEndedForLifeCycle:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleIdentifier]);
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DMF registered app update complete for bundle identifier: %{public}@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDiphoneOSAppController singleAppModeBundleIndentifier](self, "singleAppModeBundleIndentifier"));
  unsigned __int8 v9 = [v4 isEqualToString:v8];

  uint64_t v12 = DMFAppLog(v10, v11);
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "DMF restarting app with bundle identifier: %{public}@...",  buf,  0xCu);
    }

    v19[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v19[1] = FBSOpenApplicationOptionKeyUnlockDevice;
    v20[0] = &__kCFBooleanTrue;
    v20[1] = &__kCFBooleanTrue;
    v19[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
    v20[2] = @"com.apple.dmd.restart-single-app-mode";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v15));

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100018D60;
    v17[3] = &unk_10009DFB8;
    id v18 = v4;
    [v16 openApplication:v18 withOptions:v13 completion:v17];

    -[DMDiphoneOSAppController setSingleAppModeBundleIndentifier:](self, "setSingleAppModeBundleIndentifier:", 0LL);
  }

  else if (v14)
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "DMF ignoring app restart for bundle identifier: %{public}@",  buf,  0xCu);
  }
}

@end