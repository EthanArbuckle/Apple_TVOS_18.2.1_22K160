@interface MSDIPAUninstallOperation
- (BOOL)_IXUninstallAppIPA;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDIPAUninstallOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_IXUninstallAppIPA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 4LL;
}

- (BOOL)_IXUninstallAppIPA
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  id v4 = sub_10003A95C();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Uninstallig app: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007F824;
  v21[3] = &unk_1000FA8E8;
  id v7 = v3;
  id v22 = v7;
  p___int128 buf = &buf;
  v8 = v6;
  v23 = v8;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:requestUserConfirmation:completion:",  v7,  0LL,  v21);
  dispatch_time_t v9 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v8, v9))
  {
    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for app removal to finish.",  v20,  2u);
    }
  }

  int v12 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
    unsigned int v14 = [v13 containerExist:v7];

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
      unsigned __int8 v16 = [v15 deleteContainer:v7];

      if ((v16 & 1) == 0)
      {
        id v17 = sub_10003A95C();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10009F530((uint64_t)v7, v18);
        }
      }
    }
  }

  _Block_object_dispose(&buf, 8);
  return v12 != 0;
}

@end