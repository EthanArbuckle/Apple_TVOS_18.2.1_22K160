@interface DMDMDMv1StartManagingAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (DMDAppMetadata)metadata;
- (void)_attemptSINFSwap;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_manageApp;
- (void)_promptIfPermittedByPolicyToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6;
- (void)_promptToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6;
- (void)_runWithRequest:(id)a3;
- (void)_setRemovability:(id)a3;
- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)_setTapToPayScreenLock:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation DMDMDMv1StartManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DMFMDMv1StartManagingAppRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5988;
}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000454E0;
  v7[3] = &unk_10009EC08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (void)_runWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v9 = [v8 stateForBundleIdentifier:v6];

  if (v9 == (id)17)
  {
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(1407LL, 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDMDMv1StartManagingAppOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MCCloudConfiguration,  "sharedConfiguration"));
    unsigned int v13 = [v12 isSupervised];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 internal]);
    unsigned int v15 = [v14 BOOLValue];

    if ((v13 & 1) != 0 || v15)
    {
      uint64_t v20 = DMFAppLog(v16, v17);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = @"NO";
        if (v13) {
          v23 = @"YES";
        }
        else {
          v23 = @"NO";
        }
        if (v15) {
          v22 = @"YES";
        }
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        __int16 v30 = 2114;
        v31 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Request to manage app fast-tracked, supervised: %{public}@ internal: %{public}@",  buf,  0x16u);
      }

      -[DMDMDMv1StartManagingAppOperation _manageApp](self, "_manageApp");
      -[DMDMDMv1StartManagingAppOperation _endOperationWithBundleIdentifier:]( self,  "_endOperationWithBundleIdentifier:",  v6);
    }

    else
    {
      -[DMDMDMv1StartManagingAppOperation _setState:forBundleIdentifier:]( self,  "_setState:forBundleIdentifier:",  17LL,  v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 originator]);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000457D0;
      v24[3] = &unk_10009EF78;
      id v25 = v7;
      v26 = self;
      id v19 = v6;
      id v27 = v19;
      -[DMDMDMv1StartManagingAppOperation _promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:]( self,  "_promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:",  v19,  v25,  v18,  v24);

      -[DMDMDMv1StartManagingAppOperation _endOperationWithBundleIdentifier:]( self,  "_endOperationWithBundleIdentifier:",  v19);
    }
  }
}

- (void)_promptIfPermittedByPolicyToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_opt_new(&OBJC_CLASS___DMDManageAppPromptPolicy);
  -[DMDManageAppPromptPolicy readTimestampsFromFile](v14, "readTimestampsFromFile");
  if (-[DMDManageAppPromptPolicy isPromptAllowedRightNow](v14, "isPromptAllowedRightNow"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100045A20;
    v15[3] = &unk_10009EFA0;
    id v17 = v13;
    uint64_t v16 = v14;
    -[DMDMDMv1StartManagingAppOperation _promptToManageApp:appDisplayName:originator:completion:]( self,  "_promptToManageApp:appDisplayName:originator:completion:",  v10,  v11,  v12,  v15);
  }

  else
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 2LL);
  }
}

- (void)_promptToManageApp:(id)a3 appDisplayName:(id)a4 originator:(id)a5 completion:(id)a6
{
  id v26 = a6;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
  id v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"Would you like to let %@ take management of the app “%@”? Your app data will become managed." value:&stru_10009F768 table:@"DMFNotifications"]);

  v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"App Management Change" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setHeader:](v10, "setHeader:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v8, v9));
  -[DMDUserNotification setMessage:](v10, "setMessage:", v17);

  v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"Manage" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setDefaultButtonTitle:](v10, "setDefaultButtonTitle:", v20);

  v21 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"Cancel" value:&stru_10009F768 table:@"DMFNotifications"]);
  -[DMDUserNotification setAlternateButtonTitle:](v10, "setAlternateButtonTitle:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100045CD8;
  v27[3] = &unk_10009EFC8;
  id v28 = v26;
  id v25 = v26;
  [v24 showNotification:v10 completion:v27];
}

- (void)_manageApp
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lifeCycle]);
  id v5 = [v4 currentState];
  v38 = v3;
  if (v5 && v5 != (id)8)
  {
    if (v5 != (id)2)
    {
      uint64_t v9 = 7LL;
      goto LABEL_9;
    }

    uint64_t v7 = DMFAppLog(2LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Marking an app in the installing state as managed but uninstalled",  buf,  2u);
    }
  }

  uint64_t v9 = 8LL;
LABEL_9:
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v4 addObserver:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  v34 = self;
  -[DMDMDMv1StartManagingAppOperation _setState:forBundleIdentifier:](self, "_setState:forBundleIdentifier:", v9, v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation request](self, "request"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v13 VPNUUIDString]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v13 cellularSliceUUIDString]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contentFilterUUIDString]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v13 DNSProxyUUIDString]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v13 relayUUIDString]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 associatedDomains]);
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v13 associatedDomainsEnableDirectDownloads]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v13 allowUserToHide]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 allowUserToLock]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 configuration]);
  id v18 = [v13 managementOptions];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 sourceIdentifier]);
  v35 = v4;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v38 bundleIdentifier]);
  [v37 setVPNUUIDString:v36 cellularSliceUUIDString:v33 contentFilterUUIDString:v14 DNSProxyUUIDString:v32 relayUUIDString:v31 associatedDomain s:v15 enableDirectDownloads:v30 allowUserToHide:v29 allowUserToLock:v16 configuration:v17 options:v18 sourceIdentifier:v19 forBundleIdentifier:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v13 removable]);
  -[DMDMDMv1StartManagingAppOperation _setRemovability:](v34, "_setRemovability:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 tapToPayScreenLock]);
  -[DMDMDMv1StartManagingAppOperation _setTapToPayScreenLock:](v34, "_setTapToPayScreenLock:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v23 sendManagedAppsChangedNotification];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 personaIdentifier]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v38 bundleIdentifier]);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000460B0;
  v39[3] = &unk_10009E650;
  id v40 = v38;
  id v41 = v13;
  id v27 = v13;
  id v28 = v38;
  [v24 updateBundleIDPersonaIDMappingForPersonaID:v25 addingBundleID:v26 completionHandler:v39];
}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v13 = 0LL;
  unsigned __int8 v7 = [v6 setState:a3 forBundleIdentifier:v5 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = DMFAppLog(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000657AC(a3, (uint64_t)v5, v12);
    }
  }
}

- (void)_attemptSINFSwap
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 storeItemIdentifier]);

  if (v7)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation request](self, "request"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 personaIdentifier]);
    [v5 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v7 personaIdentifier:v6 type:2 skipDownloads:1 completion:&stru_10009F008];
  }
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = [v5 stateForBundleIdentifier:v4];

  id v7 = [[DMFMDMv1InstallAppResultObject alloc] initWithBundleIdentifier:v4 state:v6];
  -[DMDMDMv1StartManagingAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
}

- (void)_setRemovability:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000464A0;
  v9[3] = &unk_10009E850;
  id v10 = v4;
  id v8 = v4;
  [v5 setRemovability:v8 forBundleIdentifier:v7 completion:v9];
}

- (void)_setTapToPayScreenLock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDMDMv1StartManagingAppOperation metadata](self, "metadata"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000465CC;
  v9[3] = &unk_10009E850;
  id v10 = v4;
  id v8 = v4;
  [v5 setTapToPayScreenLock:v8 forBundleIdentifier:v7 completion:v9];
}

@end