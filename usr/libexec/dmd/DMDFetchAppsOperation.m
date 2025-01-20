@interface DMDFetchAppsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
+ (void)_fetchAppsForBundleIdentifier:(id)a3 type:(unint64_t)a4 completion:(id)a5;
+ (void)fetchAppsForRequest:(id)a3 completion:(id)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchAppsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchAppsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A56D0;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003A730;
  v5[3] = &unk_10009EB18;
  v5[4] = self;
  [(id)objc_opt_class(self) fetchAppsForRequest:v4 completion:v5];
}

+ (void)fetchAppsForRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2, a1, @"DMDFetchAppsOperation.m", 48, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v28 handleFailureInMethod:a2, a1, @"DMDFetchAppsOperation.m", 49, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestURL]);
  uint64_t v13 = DMFAppLog(v11, v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestURL]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 host]);
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetch app with manifest url from: %{public}@",  buf,  0xCu);
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10003AAB4;
    v33[3] = &unk_10009EB40;
    v18 = (id *)v35;
    v35[0] = v9;
    v35[1] = a1;
    v19 = &v34;
    id v34 = v7;
    id v20 = v7;
    id v21 = v9;
    [v10 getBundleIdentifierForManifestURL:v11 completion:v33];
  }

  else
  {
    if (v15)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifiers]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v7 storeItemIdentifier]);
      *(_DWORD *)buf = 138543618;
      v37 = v22;
      __int16 v38 = 2114;
      v39 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetch apps with bundle ids: %{public}@, store item id: %{public}@",  buf,  0x16u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10003AB24;
    v29[3] = &unk_10009EB68;
    v18 = &v32;
    v19 = &v30;
    v32 = v9;
    id v30 = v7;
    id v24 = v10;
    id v31 = v24;
    id v25 = v7;
    id v26 = v9;
    [v24 handleFetchRequest:v25 completion:v29];
  }
}

+ (void)_fetchAppsForBundleIdentifier:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchAppsRequest);
  id v12 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  [v10 setBundleIdentifiers:v11];
  [v10 setType:a4];
  [a1 fetchAppsForRequest:v10 completion:v8];
}

@end