@interface DMDUpdateAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)didPromptUser;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_promptIfNeededAndUpdateAppForRequest:(id)a3 metadata:(id)a4;
- (void)_resumeUpdateForBundleIdentifier:(id)a3;
- (void)_runWithRequest:(id)a3 metadata:(id)a4;
- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)_showUpdateFailurePromptIfNeededForRequest:(id)a3 metadata:(id)a4;
- (void)_startUpdateAppForRequest:(id)a3 metadata:(id)a4;
- (void)endOperationWithError:(id)a3;
- (void)endOperationWithResultObject:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setDidPromptUser:(BOOL)a3;
@end

@implementation DMDUpdateAppOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFUpdateAppRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5D78;
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4 = a3;
  if ((-[DMDUpdateAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DMDUpdateAppOperation;
    -[DMDUpdateAppOperation endOperationWithResultObject:](&v5, "endOperationWithResultObject:", v4);
  }
}

- (void)endOperationWithError:(id)a3
{
  id v4 = a3;
  if ((-[DMDUpdateAppOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___DMDUpdateAppOperation;
    -[DMDUpdateAppOperation endOperationWithError:](&v5, "endOperationWithError:", v4);
  }
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005B8C0;
  v7[3] = &unk_10009EC08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (void)_runWithRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController")),
        id v11 = [v10 stateForBundleIdentifier:v8],
        v10,
        v11 != (id)12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 lifeCycle]);
    unint64_t v15 = (unint64_t)[v14 currentState];

    if (v15 <= 8)
    {
      if (((1LL << v15) & 0x10F) != 0)
      {
        uint64_t v18 = DMFBundleIdentifierErrorKey;
        v19 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        uint64_t v16 = DMFErrorWithCodeAndUserInfo(3LL, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[DMDUpdateAppOperation endOperationWithError:](self, "endOperationWithError:", v17);

        goto LABEL_7;
      }

      if (((1LL << v15) & 0x60) != 0)
      {
        -[DMDUpdateAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v8);
        goto LABEL_8;
      }

      if (v15 == 7)
      {
        -[DMDUpdateAppOperation _resumeUpdateForBundleIdentifier:](self, "_resumeUpdateForBundleIdentifier:", v8);
        goto LABEL_8;
      }
    }

    -[DMDUpdateAppOperation _promptIfNeededAndUpdateAppForRequest:metadata:]( self,  "_promptIfNeededAndUpdateAppForRequest:metadata:",  v6,  v7);
    goto LABEL_8;
  }

  uint64_t v12 = DMFErrorWithCodeAndUserInfo(1407LL, 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[DMDUpdateAppOperation endOperationWithError:](self, "endOperationWithError:", v13);
LABEL_7:

LABEL_8:
}

- (void)_resumeUpdateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Resume update for bundle identifier: %{public}@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005BC28;
  v10[3] = &unk_10009E650;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 resumeAppUpdateWithBundleIdentifier:v9 completion:v10];
}

- (void)_promptIfNeededAndUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    && (id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared")),
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 isInSingleAppMode]),
        unsigned int v11 = [v10 BOOLValue],
        v10,
        v9,
        !v11))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 foregroundBundleIdentifiers]);
    unsigned __int8 v15 = [v14 containsObject:v12];

    if ((v15 & 1) != 0)
    {
      -[DMDUpdateAppOperation setDidPromptUser:](self, "setDidPromptUser:", 1LL);
      -[DMDUpdateAppOperation _setState:forBundleIdentifier:](self, "_setState:forBundleIdentifier:", 12LL, v12);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 originator]);
      v37 = (void *)v16;
      unsigned int v17 = [v7 isStoreApp];
      uint64_t v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v17) {
        v21 = @"%@ is about to update the app “%@” from the App Store.";
      }
      else {
        v21 = @"%@ is about to update the app “%@”.";
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:v21 value:&stru_10009F768 table:@"DMFNotifications"]);

      v22 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
      v23 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"App Update" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setHeader:](v22, "setHeader:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v36, v16, v26));
      -[DMDUserNotification setMessage:](v22, "setMessage:", v27);

      v28 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"Update" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setDefaultButtonTitle:](v22, "setDefaultButtonTitle:", v30);

      v31 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"Cancel" value:&stru_10009F768 table:@"DMFNotifications"]);
      -[DMDUserNotification setAlternateButtonTitle:](v22, "setAlternateButtonTitle:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10005C020;
      v38[3] = &unk_10009F458;
      v38[4] = self;
      id v35 = v12;
      id v39 = v35;
      id v40 = v6;
      id v41 = v7;
      [v34 showNotification:v22 completion:v38];

      -[DMDUpdateAppOperation _endOperationWithBundleIdentifier:](self, "_endOperationWithBundleIdentifier:", v35);
    }

    else
    {
      -[DMDUpdateAppOperation _startUpdateAppForRequest:metadata:](self, "_startUpdateAppForRequest:metadata:", v6, v7);
    }
  }

  else
  {
    -[DMDUpdateAppOperation _startUpdateAppForRequest:metadata:](self, "_startUpdateAppForRequest:metadata:", v6, v7);
  }
}

- (void)_startUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  [v6 setBundleIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 storeItemIdentifier]);
  [v6 setStoreItemIdentifier:v10];

  uint64_t v13 = DMFAppLog(v11, v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Start updating app for request: %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10005C248;
  v19[3] = &unk_10009F480;
  v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v22 = v8;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  [v15 startUpdatingAppForRequest:v18 metadata:v17 completion:v19];
}

- (void)_showUpdateFailurePromptIfNeededForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0 && -[DMDUpdateAppOperation didPromptUser](self, "didPromptUser"))
  {
    v10 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"The app “%@” could not be updated." value:&stru_10009F768 table:@"DMFNotifications"]);

    uint64_t v13 = objc_opt_new(&OBJC_CLASS___DMDUserNotification);
    v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"App Update" value:&stru_10009F768 table:@"DMFNotifications"]);
    -[DMDUserNotification setHeader:](v13, "setHeader:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v12,  v17));
    -[DMDUserNotification setMessage:](v13, "setMessage:", v18);

    v19 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"Dismiss" value:&stru_10009F768 table:@"DMFNotifications"]);
    -[DMDUserNotification setDefaultButtonTitle:](v13, "setDefaultButtonTitle:", v21);

    uint64_t v24 = DMFAppLog(v22, v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000670A8(v25);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
    [v26 showNotification:v13 completion:0];
  }
}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUpdateAppOperation request](self, "request"));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    id v13 = 0LL;
    unsigned __int8 v11 = [v10 setState:a3 forBundleIdentifier:v6 error:&v13];
    id v12 = v13;

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000670E8(a3, (uint64_t)v6);
    }
  }
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUpdateAppOperation request](self, "request"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    id v8 = [v7 stateForBundleIdentifier:v10];

    id v9 = [[DMFMDMv1InstallAppResultObject alloc] initWithBundleIdentifier:v10 state:v8];
  }

  else
  {
    id v9 = 0LL;
  }

  -[DMDUpdateAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);
}

- (BOOL)didPromptUser
{
  return self->_didPromptUser;
}

- (void)setDidPromptUser:(BOOL)a3
{
  self->_didPromptUser = a3;
}

@end