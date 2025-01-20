@interface DMDMDMv1InstallAppOperation
+ (id)descriptionForChangeType:(int64_t)a3;
+ (id)whitelistedClassesForRequest;
- (BOOL)_canManageBundleIdentifier:(id)a3;
- (id)_getRequiredAppIDFromDisk;
- (id)_storeAppFormat;
- (void)_applyManagementPiecesForRequest:(id)a3;
- (void)_attemptSINFSwapForRequest:(id)a3 completion:(id)a4;
- (void)_downloadStoreAppForRequest:(id)a3 type:(int64_t)a4;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_installEnterpriseAppForRequest:(id)a3;
- (void)_installStoreAppForRequest:(id)a3;
- (void)_installSystemAppWithBundleIdentifier:(id)a3;
- (void)_promptIfNeededWithMessageFormat:(id)a3 success:(id)a4;
- (void)_promptToSignInAndInstallAppForRequest:(id)a3;
- (void)_purchaseFreeAppForRequest:(id)a3;
- (void)_redeemAppWithRedemptionCode:(id)a3;
- (void)_redownloadDeviceAppForRequest:(id)a3;
- (void)_redownloadUserAppForRequest:(id)a3;
- (void)_resetRemovabilityWithBundleIdentifier:(id)a3;
- (void)_resetTapToPayScreenLock;
- (void)_setRedemptionCode:(id)a3;
- (void)_setRemovability:(id)a3;
- (void)_setState:(unint64_t)a3;
- (void)_setTapToPayScreenLock:(id)a3;
- (void)_setUnusedRedemptionCode:(id)a3;
- (void)_showInstallationFailurePromptIfNeeded;
- (void)_showStorePromptToSignInAndInstallAppForRequest:(id)a3;
- (void)_updateManagementInfoWithBlock:(id)a3;
- (void)endOperationWithError:(id)a3;
- (void)endOperationWithResultObject:(id)a3;
- (void)installAppForRequest:(id)a3;
@end

@implementation DMDMDMv1InstallAppOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFMDMv1InstallAppRequest));
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4 = a3;
  if ((-[DMDMDMv1InstallAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DMDMDMv1InstallAppOperation;
    -[DMDMDMv1InstallAppOperation endOperationWithResultObject:](&v5, "endOperationWithResultObject:", v4);
  }
}

- (void)endOperationWithError:(id)a3
{
  id v4 = a3;
  if ((-[DMDMDMv1InstallAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DMDMDMv1InstallAppOperation;
    -[DMDMDMv1InstallAppOperation endOperationWithError:](&v5, "endOperationWithError:", v4);
  }
}

- (void)installAppForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v8 = [v7 stateForBundleIdentifier:v6];

  if (v8 == (id)3)
  {
    uint64_t v11 = DMFAppLog(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006511C(self, v12);
    }

    uint64_t v20 = DMFBundleIdentifierErrorKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    id v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    uint64_t v16 = DMFErrorWithCodeAndUserInfo(2603LL, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[DMDMDMv1InstallAppOperation endOperationWithError:](self, "endOperationWithError:", v17);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 redemptionCode]);
    if (v13)
    {
      -[DMDMDMv1InstallAppOperation _redeemAppWithRedemptionCode:](self, "_redeemAppWithRedemptionCode:", v13);
      goto LABEL_10;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 manifestURL]);

    if (v18)
    {
      -[DMDMDMv1InstallAppOperation _installEnterpriseAppForRequest:](self, "_installEnterpriseAppForRequest:", v4);
      goto LABEL_10;
    }

    id v14 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v6 error:0];
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 compatibilityObject]);
    v15 = (void *)v19;
    if (v14 && v19) {
      -[DMDMDMv1InstallAppOperation _installSystemAppWithBundleIdentifier:]( self,  "_installSystemAppWithBundleIdentifier:",  v6);
    }
    else {
      -[DMDMDMv1InstallAppOperation _installStoreAppForRequest:](self, "_installStoreAppForRequest:", v4);
    }
  }

LABEL_10:
}

- (id)_storeAppFormat
{
  if (qword_1000CCD18 != -1) {
    dispatch_once(&qword_1000CCD18, &stru_10009EC88);
  }
  return (id)qword_1000CCD10;
}

- (id)_getRequiredAppIDFromDisk
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths mdmFilePath](&OBJC_CLASS___DMDPaths, "mdmFilePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"RequiredAppIDForMDM"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    v6 = v4;
  }
  else {
    v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (void)_redeemAppWithRedemptionCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  if ([v7 stateForBundleIdentifier:v6] == (id)1)
  {
    -[DMDMDMv1InstallAppOperation _setRedemptionCode:](self, "_setRedemptionCode:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _storeAppFormat](self, "_storeAppFormat"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100041E0C;
    v9[3] = &unk_10009ECD8;
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    id v13 = v4;
    -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:]( self,  "_promptIfNeededWithMessageFormat:success:",  v8,  v9);
  }

  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2611LL);
  }
}

- (void)_installEnterpriseAppForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"%@ is about to install and manage the app “%@”.\nYour iTunes account will not be charged for this app." value:&stru_10009F768 table:@"DMFNotifications"]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 manifestURL]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000421D8;
  v30[3] = &unk_10009E850;
  v30[4] = self;
  id v10 = objc_retainBlock(v30);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100042270;
  v25[3] = &unk_10009ED28;
  v25[4] = self;
  id v11 = v4;
  id v26 = v11;
  id v27 = v8;
  id v12 = v9;
  id v28 = v12;
  id v13 = v10;
  id v29 = v13;
  id v14 = v8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000424C8;
  v19[3] = &unk_10009ED78;
  id v20 = v12;
  id v21 = v11;
  v22 = self;
  id v23 = v13;
  v24 = objc_retainBlock(v25);
  v15 = v24;
  uint64_t v16 = v13;
  id v17 = v11;
  id v18 = v12;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:]( self,  "_promptIfNeededWithMessageFormat:success:",  v7,  v19);
}

- (void)_installSystemAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"%@ is about to install the app “%@”.\nYour iTunes account will not be charged for this app." value:&stru_10009F768 table:@"DMFNotifications"]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100042784;
  v9[3] = &unk_10009D820;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:]( self,  "_promptIfNeededWithMessageFormat:success:",  v7,  v9);
}

+ (id)descriptionForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 >= 6) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown change type (%ld)",  a3));
  }
  else {
    return off_10009EF40[a3];
  }
}

- (void)_installStoreAppForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  unsigned int v8 = [v7 needsRedownload];

  uint64_t v11 = DMFAppLog(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting re-download of app because metadata says it is necessary: %{public}@",  buf,  0xCu);
    }

    -[DMDMDMv1InstallAppOperation _redownloadDeviceAppForRequest:](self, "_redownloadDeviceAppForRequest:", v4);
  }

  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting SINF swap to install app: %{public}@",  buf,  0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100042AEC;
    v14[3] = &unk_10009EDA0;
    id v15 = v6;
    uint64_t v16 = self;
    id v17 = v4;
    -[DMDMDMv1InstallAppOperation _attemptSINFSwapForRequest:completion:]( self,  "_attemptSINFSwapForRequest:completion:",  v17,  v14);
  }
}

- (void)_attemptSINFSwapForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000432E0;
  v17[3] = &unk_10009DD28;
  id v7 = a4;
  id v18 = v7;
  unsigned int v8 = objc_retainBlock(v17);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  uint64_t v11 = DMFAppLog(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v6 personaIdentifier]);
    *(_DWORD *)buf = 138543362;
    id v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "attempt SINF swap, persona:%{public}@",  buf,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 storeItemIdentifier]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 personaIdentifier]);
  [v9 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v15 personaIdentifier:v16 type:2 skipDownloads:1 completion:v8];
}

- (void)_redownloadDeviceAppForRequest:(id)a3
{
}

- (void)_redownloadUserAppForRequest:(id)a3
{
}

- (void)_purchaseFreeAppForRequest:(id)a3
{
}

- (void)_downloadStoreAppForRequest:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100043530;
  v29[3] = &unk_10009E850;
  v29[4] = self;
  unsigned int v8 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100043584;
  v25[3] = &unk_10009EDC8;
  v25[4] = self;
  id v9 = v7;
  id v26 = v9;
  id v10 = v6;
  id v27 = v10;
  uint64_t v11 = v8;
  id v28 = v11;
  id v12 = objc_retainBlock(v25);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _storeAppFormat](self, "_storeAppFormat"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000437E4;
  v18[3] = &unk_10009EE18;
  id v19 = v9;
  id v20 = v10;
  id v21 = self;
  id v22 = v11;
  id v23 = v12;
  int64_t v24 = a4;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  -[DMDMDMv1InstallAppOperation _promptIfNeededWithMessageFormat:success:]( self,  "_promptIfNeededWithMessageFormat:success:",  v13,  v18);
}

- (void)_applyManagementPiecesForRequest:(id)a3
{
  id v4 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 VPNUUIDString]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cellularSliceUUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentFilterUUIDString]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 DNSProxyUUIDString]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 relayUUIDString]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedDomains]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedDomainsEnableDirectDownloads]);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v4 allowUserToHide]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allowUserToLock]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
  id v9 = [v4 managementOptions];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  [v19 setVPNUUIDString:v18 cellularSliceUUIDString:v5 contentFilterUUIDString:v6 DNSProxyUUIDString:v17 relayUUIDString:v16 associatedDomain s:v15 enableDirectDownloads:v14 allowUserToHide:v13 allowUserToLock:v7 configuration:v8 options:v9 sourceIdentifier:v10 forBundleIdentifier:v12];
}

- (void)_promptIfNeededWithMessageFormat:(id)a3 success:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v44 handleFailureInMethod:a2, self, @"DMDMDMv1InstallAppOperation+iphoneOS.m", 446, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100044188;
  v51[3] = &unk_10009E3A0;
  v51[4] = self;
  id v9 = v8;
  id v52 = v9;
  id v10 = objc_retainBlock(v51);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](&OBJC_CLASS___MCCloudConfiguration, "sharedConfiguration"));
  unsigned int v12 = [v11 isSupervised];

  if (v12)
  {
    ((void (*)(void *))v10[2])(v10);
  }

  else
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation _getRequiredAppIDFromDisk](self, "_getRequiredAppIDFromDisk"));
    if (v13
      && (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata")),
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 storeItemIdentifier]),
          unsigned int v16 = [v15 isEqualToNumber:v13],
          v15,
          v14,
          v16))
    {
      ((void (*)(void *))v10[2])(v10);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1InstallAppOperation request](self, "request"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 originator]);

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 displayName]);

      uint64_t v23 = DMFAppLog(v21, v22);
      int64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v54 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Prompting user to install app: %{public}@",  buf,  0xCu);
      }

      v47 = v13;

      id v50 = 0LL;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v7,  @"%@%@",  &v50,  v18,  v20));
      id v26 = v50;
      id v28 = v26;
      if (!v25)
      {
        uint64_t v29 = DMFAppLog(v26, v27);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100065404();
        }
      }

      v45 = (void *)v18;
      v46 = v28;
      v31 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
      v32 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"App Installation" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setHeader:](v31, "setHeader:", v34);

      -[DMDUserNotification setMessage:](v31, "setMessage:", v25);
      v35 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"Install" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setDefaultButtonTitle:](v31, "setDefaultButtonTitle:", v37);

      v38 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue( [v39 localizedStringForKey:@"Cancel" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setAlternateButtonTitle:](v31, "setAlternateButtonTitle:", v40);

      -[DMDMDMv1InstallAppOperation _setState:](self, "_setState:", 3LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_100044208;
      v48[3] = &unk_10009EE40;
      v48[4] = self;
      v49 = v10;
      [v41 showNotification:v31 completion:v48];

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 bundleIdentifier]);
      -[DMDMDMv1InstallAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v43);

      BOOL v13 = v47;
    }
  }
}

- (void)_promptToSignInAndInstallAppForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Show our prompt to sign in", buf, 2u);
  }

  -[DMDMDMv1InstallAppOperation _setState:](self, "_setState:", 4LL);
  id v8 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
  id v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"App Installation" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setHeader:](v8, "setHeader:", v11);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 originator]);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"Sign in to iTunes to allow %1$@ to manage and install apps.",  v12));
  -[DMDUserNotification setMessage:](v8, "setMessage:", v13);

  id v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"Sign In" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setDefaultButtonTitle:](v8, "setDefaultButtonTitle:", v16);

  id v17 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"Cancel" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setAlternateButtonTitle:](v8, "setAlternateButtonTitle:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000444C0;
  v22[3] = &unk_10009EE68;
  v22[4] = self;
  id v23 = v4;
  id v21 = v4;
  [v20 showNotification:v8 completion:v22];
}

- (void)_showStorePromptToSignInAndInstallAppForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Show store prompt to sign in", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000445F8;
  v10[3] = &unk_10009EEB8;
  v10[4] = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v12 = v4;
  id v8 = v4;
  id v9 = v11;
  [v9 promptUserToSignInWithCompletion:v10];
}

- (void)_showInstallationFailurePromptIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](&OBJC_CLASS___MCCloudConfiguration, "sharedConfiguration"));
  unsigned __int8 v4 = [v3 isSupervised];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"The app “%@” could not be installed." value:&stru_10009F768 table:@"DMFNotifications"]);

    id v8 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
    id v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"App Installation" value:&stru_10009F768 table:@"DMFNotifications"]);
    -[DMDUserNotification setHeader:](v8, "setHeader:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 displayName]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v7,  v13));
    -[DMDUserNotification setMessage:](v8, "setMessage:", v14);

    id v15 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"Dismiss" value:&stru_10009F768 table:@"DMFNotifications"]);
    -[DMDUserNotification setDefaultButtonTitle:](v8, "setDefaultButtonTitle:", v17);

    uint64_t v20 = DMFAppLog(v18, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100065464(v21);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
    [v22 showNotification:v8 completion:0];
  }

- (void)_setState:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  if (-[DMDMDMv1InstallAppOperation _canManageBundleIdentifier:](self, "_canManageBundleIdentifier:", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    id v14 = 0LL;
    unsigned __int8 v8 = [v7 setState:a3 forBundleIdentifier:v6 error:&v14];
    id v9 = v14;

    if ((v8 & 1) == 0)
    {
      uint64_t v12 = DMFAppLog(v10, v11);
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000654A4();
      }
    }
  }
}

- (void)_setRedemptionCode:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set redemption code for bundle identifier: %{public}@",  buf,  0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100044B54;
  v11[3] = &unk_10009EEE0;
  id v12 = v4;
  id v10 = v4;
  -[DMDMDMv1InstallAppOperation _updateManagementInfoWithBlock:](self, "_updateManagementInfoWithBlock:", v11);
}

- (void)_setUnusedRedemptionCode:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set unused redemption code for bundle identifier: %{public}@",  buf,  0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100044C8C;
  v11[3] = &unk_10009EEE0;
  id v12 = v4;
  id v10 = v4;
  -[DMDMDMv1InstallAppOperation _updateManagementInfoWithBlock:](self, "_updateManagementInfoWithBlock:", v11);
}

- (void)_updateManagementInfoWithBlock:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"DMDMDMv1InstallAppOperation+iphoneOS.m", 608, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  BOOL v8 = -[DMDMDMv1InstallAppOperation _canManageBundleIdentifier:](self, "_canManageBundleIdentifier:", v7);
  if (v8)
  {
    uint64_t v10 = DMFAppLog(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Update management information for bundle identifier: %{public}@",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managementInformationForBundleIdentifier:v7]);
    if (!v13) {
      BOOL v13 = (void *)objc_opt_new(&OBJC_CLASS___DMFAppManagementInformation);
    }
    v5[2](v5, v13);
    id v21 = 0LL;
    unsigned __int8 v14 = [v12 setManagementInformation:v13 forBundleIdentifier:v7 error:&v21];
    id v15 = v21;
    id v17 = v15;
    if ((v14 & 1) == 0)
    {
      uint64_t v18 = DMFAppLog(v15, v16);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10006552C((uint64_t)v7);
      }
    }
  }
}

- (BOOL)_canManageBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];

  return v4 == 0LL;
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = [v5 stateForBundleIdentifier:v4];

  id v7 = [[DMFMDMv1InstallAppResultObject alloc] initWithBundleIdentifier:v4 state:v6];
  -[DMDMDMv1InstallAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
}

- (void)_resetRemovabilityWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v4 setRemovability:0 forBundleIdentifier:v3 completion:&stru_10009EF00];
}

- (void)_resetTapToPayScreenLock
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  [v5 setTapToPayScreenLock:0 forBundleIdentifier:v4 completion:&stru_10009EF20];
}

- (void)_setRemovability:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000451AC;
  v9[3] = &unk_10009E850;
  id v10 = v4;
  id v8 = v4;
  [v5 setRemovability:v8 forBundleIdentifier:v7 completion:v9];
}

- (void)_setTapToPayScreenLock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000452D8;
  v9[3] = &unk_10009E850;
  id v10 = v4;
  id v8 = v4;
  [v5 setTapToPayScreenLock:v8 forBundleIdentifier:v7 completion:v9];
}

@end