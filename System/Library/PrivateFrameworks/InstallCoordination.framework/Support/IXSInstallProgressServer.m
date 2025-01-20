@interface IXSInstallProgressServer
- (void)_setIsPaused:(BOOL)a3 forIdentity:(id)a4;
- (void)progressServer:(id)a3 requestCancelForIdentity:(id)a4 withReason:(id)a5 fromClient:(unint64_t)a6;
- (void)progressServer:(id)a3 requestPauseForIdentity:(id)a4;
- (void)progressServer:(id)a3 requestResumeForIdentity:(id)a4;
@end

@implementation IXSInstallProgressServer

- (void)_setIsPaused:(BOOL)a3 forIdentity:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
  v7 = objc_alloc(&OBJC_CLASS___IXApplicationIdentity);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  if (v6) {
    v9 = -[IXApplicationIdentity initWithBundleID:persona:](v7, "initWithBundleID:persona:", v8, v6);
  }
  else {
    v9 = -[IXApplicationIdentity initWithBundleIdentifier:](v7, "initWithBundleIdentifier:", v8);
  }
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 coordinatorForIdentity:v10]);

  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100034D90;
    v15[3] = &unk_1000CDF38;
    BOOL v16 = v4;
    [v12 externalSetIsPaused:v4 completion:v15];
  }

  else
  {
    v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[IXSInstallProgressServer _setIsPaused:forIdentity:]";
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to fetch the coordinator for %@",  buf,  0x16u);
    }
  }
}

- (void)progressServer:(id)a3 requestPauseForIdentity:(id)a4
{
}

- (void)progressServer:(id)a3 requestResumeForIdentity:(id)a4
{
}

- (void)progressServer:(id)a3 requestCancelForIdentity:(id)a4 withReason:(id)a5 fromClient:(unint64_t)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personaUniqueString]);
  v11 = objc_alloc(&OBJC_CLASS___IXApplicationIdentity);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);

  if (v10) {
    v13 = -[IXApplicationIdentity initWithBundleID:persona:](v11, "initWithBundleID:persona:", v12, v10);
  }
  else {
    v13 = -[IXApplicationIdentity initWithBundleIdentifier:](v11, "initWithBundleIdentifier:", v12);
  }
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 coordinatorForIdentity:v14]);

  if (v16)
  {
    [v16 cancelForReason:v8 client:a6 error:0];
  }

  else
  {
    v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      v20 = "-[IXSInstallProgressServer progressServer:requestCancelForIdentity:withReason:fromClient:]";
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to fetch the coordinator for %@",  (uint8_t *)&v19,  0x16u);
    }
  }
}

@end