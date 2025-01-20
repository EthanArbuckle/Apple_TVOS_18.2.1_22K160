@interface BiometricsHandler
+ (BOOL)isSupported;
+ (OS_dispatch_queue)storeQueue;
+ (id)retreiveTokenWithAction:(int64_t)a3;
+ (int64_t)state;
+ (void)_presentBiometricsDialogWithCompletion:(id)a3;
+ (void)_removeToken;
+ (void)_retreiveTokenWithAction:(int64_t)a3 completion:(id)a4;
+ (void)_storeToken:(id)a3;
+ (void)removeToken;
+ (void)reset;
+ (void)setState:(int64_t)a3;
+ (void)storeToken:(id)a3;
@end

@implementation BiometricsHandler

+ (int64_t)state
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"biometricsState"];

  return (int64_t)v3;
}

+ (OS_dispatch_queue)storeQueue
{
  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_100030680);
  }
  return (OS_dispatch_queue *)(id)qword_10003A980;
}

+ (BOOL)isSupported
{
  id v3 = objc_alloc_init(&OBJC_CLASS___LAContext);
  id v11 = 0LL;
  unsigned __int8 v4 = -[LAContext canEvaluatePolicy:error:](v3, "canEvaluatePolicy:error:", 1LL, &v11);
  id v5 = v11;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      __int16 v14 = 2114;
      id v15 = v5;
      id v9 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@: Biometrics context error. Error: %{public}@",  buf,  0x16u);
    }
  }

  return v4;
}

+ (void)setState:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setInteger:a3 forKey:@"biometricsState"];
}

+ (void)removeToken
{
}

+ (void)reset
{
}

+ (id)retreiveTokenWithAction:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  if (([a1 isSupported] & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class(a1);
      id v9 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retrieve token as biometrics are not supported",  buf,  0xCu);
    }

    v10 = @"Biometrics are not supported";
    uint64_t v11 = 0LL;
    goto LABEL_14;
  }

  if ([a1 state] != (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class(a1);
      id v14 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retrieve token as biometrics are not enabled",  buf,  0xCu);
    }

    v10 = @"Biometrics are not enabled";
    uint64_t v11 = 6LL;
LABEL_14:
    uint64_t v15 = APError(v11, @"Biometrics error", v10, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v5 finishWithError:v6];
    goto LABEL_15;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100007FE8;
  v17[3] = &unk_1000306A8;
  id v18 = v5;
  [a1 _retreiveTokenWithAction:a3 completion:v17];
  v6 = v18;
LABEL_15:

  return v5;
}

+ (void)storeToken:(id)a3
{
  id v4 = a3;
  if (([a1 isSupported] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v5) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class(a1);
    id v7 = v13;
    v8 = "%{public}@: Failed to store token as biometrics are not supported";
    goto LABEL_14;
  }

  if (![a1 state])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000081F0;
    v9[3] = &unk_1000306D0;
    id v11 = a1;
    id v10 = v4;
    [a1 _presentBiometricsDialogWithCompletion:v9];

    goto LABEL_16;
  }

  if ([a1 state] != (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v5) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class(a1);
    id v7 = v13;
    v8 = "%{public}@: Failed to store token as biometrics are not enabled";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);

LABEL_15:
    goto LABEL_16;
  }

  [a1 _storeToken:v4];
LABEL_16:
}

+ (void)_presentBiometricsDialogWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 138543362;
    *(void *)&v12[4] = objc_opt_class(a1);
    id v7 = *(id *)&v12[4];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Presenting biometrics dialog",  v12,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject", *(_OWORD *)v12));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = (void *)objc_opt_class(a1);
    *(_DWORD *)v12 = 138543362;
    *(void *)&v12[4] = v10;
    id v11 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not present biometrics dialog, unsupported device platform",  v12,  0xCu);
  }

  v4[2](v4, 0LL);
}

+ (void)_removeToken
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(a1);
    id v5 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removing biometrics token",  buf,  0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 storeQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008514;
  block[3] = &unk_1000306F0;
  block[4] = a1;
  dispatch_async(v6, block);
}

+ (void)_retreiveTokenWithAction:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class(a1);
    __int16 v17 = 2050;
    int64_t v18 = a3;
    id v9 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retreiving biometrics token. Action: %{public}ld",  buf,  0x16u);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 storeQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008770;
  v12[3] = &unk_100030718;
  id v13 = v6;
  id v14 = a1;
  id v11 = v6;
  dispatch_async(v10, v12);
}

+ (void)_storeToken:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](&OBJC_CLASS___APLogConfig, "sharedUIServiceConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class(a1);
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Storing biometrics token. Token: %@",  buf,  0x16u);
  }

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 storeQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000089F4;
  block[3] = &unk_1000306F0;
  block[4] = a1;
  dispatch_async(v8, block);
}

@end