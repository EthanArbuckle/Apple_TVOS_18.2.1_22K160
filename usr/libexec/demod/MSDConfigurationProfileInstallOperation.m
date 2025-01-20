@interface MSDConfigurationProfileInstallOperation
- (BOOL)_installConfigurationProfile;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDConfigurationProfileInstallOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_installConfigurationProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 3LL;
}

- (BOOL)_installConfigurationProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stagingRootPath]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 fileHash]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 profileIdentifier]);
  v8 = -[MSDConfigurationProfile initWithFile:andIdentifier:]( objc_alloc(&OBJC_CLASS___MSDConfigurationProfile),  "initWithFile:andIdentifier:",  v6,  v7);
  id v9 = sub_10003A95C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Installing standalone configuration profile: %{public}@",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  unsigned __int8 v13 = objc_msgSend( v12,  "copyFileIfPresentInCache:toLocation:verifyHash:",  v5,  v6,  objc_msgSend(v2, "verifyFileHash"));

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDConfigurationProfileManager sharedInstance]( &OBJC_CLASS___MSDConfigurationProfileManager,  "sharedInstance"));
    unsigned __int8 v15 = [v14 installConfigurationProfile:v8];
  }

  else
  {
    id v21 = sub_10003A95C();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_1000900B0((uint64_t)v5, (os_log_s *)v14, v22);
    }
    unsigned __int8 v15 = 0;
  }

  if ([v3 fileExistsAtPath:v6])
  {
    id v23 = 0LL;
    unsigned __int8 v16 = [v3 removeItemAtPath:v6 error:&v23];
    id v17 = v23;
    if ((v16 & 1) == 0)
    {
      id v18 = sub_10003A95C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100090024(v17, v19);
      }
    }
  }

  return v15;
}

@end