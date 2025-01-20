@interface DMDRemoveAppOperation
+ (BOOL)removeAppMetadataForBundleIdentifier:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
+ (void)removeAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDRemoveAppOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveAppRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5A60;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100051DD4;
  v8[3] = &unk_10009E650;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 setRemovability:0 forBundleIdentifier:v7 completion:v8];
}

+ (BOOL)removeAppMetadataForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 77, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v12 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 78, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  if (([v8 setVPNUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066B00();
    }
    goto LABEL_42;
  }

  if (([v8 setCellularSliceUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066A98();
    }
    goto LABEL_42;
  }

  if (([v8 setContentFilterUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066A30();
    }
    goto LABEL_42;
  }

  if (([v8 setDNSProxyUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000669C8();
    }
    goto LABEL_42;
  }

  if (([v8 setRelayUUIDString:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066960();
    }
    goto LABEL_42;
  }

  if (([v8 setAssociatedDomains:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000668F8();
    }
    goto LABEL_42;
  }

  if (([v8 setAssociatedDomainsEnableDirectDownloads:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066890();
    }
    goto LABEL_42;
  }

  if (([v8 setAllowUserToHide:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066828();
    }
    goto LABEL_42;
  }

  if (([v8 setAllowUserToLock:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000667C0();
    }
    goto LABEL_42;
  }

  if (([v8 setConfiguration:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066758();
    }
    goto LABEL_42;
  }

  if (([v8 setManagementInformation:0 forBundleIdentifier:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000666F0();
    }
    goto LABEL_42;
  }

  if (([v8 removePersonaMappingForBundleID:v7 error:a4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100066688();
    }
LABEL_42:
    BOOL v10 = 0;
    goto LABEL_43;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v9 sendManagedAppsChangedNotification];

  BOOL v10 = 1;
LABEL_43:

  return v10;
}

+ (void)removeAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v10 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 151, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v28 handleFailureInMethod:a2, a1, @"DMDRemoveAppOperation.m", 152, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v11 = DMFAppLog(v8, v9);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v40 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Remove app with bundle identifier: %{public}@",  buf,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppLifeCycle lifeCycleForBundleIdentifier:]( &OBJC_CLASS___DMDAppLifeCycle,  "lifeCycleForBundleIdentifier:",  v7));
  id v15 = [v14 currentState];
  switch((unint64_t)v15)
  {
    case 0uLL:
    case 4uLL:
      uint64_t v22 = DMFAppLog(v15, v16);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Start uninstalling app with bundle identifier: %{public}@",  buf,  0xCu);
      }

      [v13 startUninstallingAppWithBundleIdentifier:v7 completion:v10];
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      uint64_t v17 = DMFAppLog(v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cancel app installation with bundle identifier: %{public}@",  buf,  0xCu);
      }

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10005288C;
      v33[3] = &unk_10009DD00;
      id v34 = v7;
      id v35 = v13;
      v36 = v10;
      [v35 cancelAppInstallationWithBundleIdentifier:v34 completion:v33];

      v19 = v34;
      goto LABEL_12;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      uint64_t v20 = DMFAppLog(v15, v16);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Cancel app update with bundle identifier: %{public}@",  buf,  0xCu);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10005293C;
      v29[3] = &unk_10009DD00;
      id v30 = v7;
      id v31 = v13;
      v32 = v10;
      [v31 cancelAppUpdateWithBundleIdentifier:v30 completion:v29];

      v19 = v30;
LABEL_12:

      break;
    case 8uLL:
      v10[2](v10, 0LL);
      break;
    default:
      uint64_t v37 = DMFBundleIdentifierErrorKey;
      id v38 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      uint64_t v25 = DMFErrorWithCodeAndUserInfo(3LL, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      ((void (**)(void, void *))v10)[2](v10, v26);

      break;
  }
}

@end