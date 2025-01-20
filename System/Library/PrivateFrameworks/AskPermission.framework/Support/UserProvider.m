@interface UserProvider
+ (NSString)previousLocalApprovalUsername;
+ (id)_authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4;
+ (id)localApprovalUser;
+ (id)primaryiCloudUserWithAction:(int64_t)a3 keychainError:(id *)a4;
+ (void)setPreviousLocalApprovalUsername:(id)a3;
@end

@implementation UserProvider

+ (NSString)previousLocalApprovalUsername
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"previousLocalApprovalUsername"]);

  return (NSString *)v3;
}

+ (void)setPreviousLocalApprovalUsername:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setObject:v3 forKey:@"previousLocalApprovalUsername"];
}

+ (id)localApprovalUser
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class(a1);
    id v5 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Getting local approval user",  buf,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 previousLocalApprovalUsername]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _authenticateWithUsername:v6 authenticationType:0]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100019AB8;
  v10[3] = &unk_100030B68;
  v10[4] = a1;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 thenWithBlock:v10]);

  return v8;
}

+ (id)primaryiCloudUserWithAction:(int64_t)a3 keychainError:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v40 = (id)objc_opt_class(a1);
    __int16 v41 = 2050;
    int64_t v42 = a3;
    id v9 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Getting primary iCloud user. Action: %{public}ld",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiCloudAccount"));
  id v12 = v11;
  if (v11)
  {
    v36 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 username]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[BiometricsHandler retreiveTokenWithAction:]( &OBJC_CLASS___BiometricsHandler,  "retreiveTokenWithAction:",  a3));
    id v38 = 0LL;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 resultWithError:&v38]);
    id v37 = v38;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18) {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138543362;
        id v40 = v21;
        id v22 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved active iCloud user with biometrics token.",  buf,  0xCu);
      }

      v23 = -[User initWithDSID:username:password:biometricsToken:]( objc_alloc(&OBJC_CLASS___User),  "initWithDSID:username:password:biometricsToken:",  v14,  v15,  0LL,  v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v23));

      v25 = v37;
    }

    else
    {
      if (!v18) {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138543618;
        id v40 = v32;
        __int16 v41 = 2114;
        int64_t v42 = (int64_t)v37;
        id v35 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retreive biometrics token. Error: %{public}@",  buf,  0x16u);
      }

      v25 = v37;
      if (v36) {
        id *v36 = v37;
      }
      if (a3) {
        uint64_t v33 = 2LL;
      }
      else {
        uint64_t v33 = 1LL;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_authenticateWithUsername:authenticationType:", v15, v33, v35));
    }
  }

  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v26) {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543362;
      id v40 = v28;
      id v29 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@: No active iCloud account",  buf,  0xCu);
    }

    uint64_t v30 = APError(0LL, @"Account error", @"No active iCloud account", 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v14));
  }

  return v24;
}

+ (id)_authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    id v15 = (id)objc_opt_class(a1);
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2050;
    int64_t v19 = a4;
    id v9 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Authenticating user. Username: %@, authentication type: %{public}ld",  (uint8_t *)&v14,  0x20u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  uint64_t v11 = APError(0LL, @"Could not authenticate user", @"Unsupported device platform", 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 finishWithError:v12];

  return v10;
}

@end