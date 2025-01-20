@interface MSDProvisioningProfileUtils
+ (BOOL)installProvisioningProfile:(id)a3;
+ (BOOL)isProvisioningProfileInstalled:(id)a3;
+ (BOOL)uninstallProvisioningProfileByFileName:(id)a3;
+ (BOOL)uninstallProvisioningProfileByUUID:(id)a3;
+ (id)getUUIDFromProvisioningProfileRef:(void *)a3;
+ (id)getUUIDsOfInstalledProvisioningProfiles;
+ (void)loadProvisioningProfileFromFile:(id)a3;
@end

@implementation MSDProvisioningProfileUtils

+ (BOOL)installProvisioningProfile:(id)a3
{
  id v3 = a3;
  v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "loadProvisioningProfileFromFile:",  v3);
  if (v4)
  {
    v5 = v4;
    int v6 = MISInstallProvisioningProfile();
    BOOL v7 = v6 == 0;
    if (v6)
    {
      v8 = (void *)MISCopyErrorStringForErrorCode();
      id v9 = sub_10003A95C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543618;
        id v13 = v3;
        __int16 v14 = 2114;
        v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ERROR - Failed to install provisioning profile:  %{public}@) with error %{public}@",  (uint8_t *)&v12,  0x16u);
      }
    }

    CFRelease(v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)uninstallProvisioningProfileByUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MISRemoveProvisioningProfile();
  int v5 = v4;
  if ((_DWORD)v4)
  {
    int v6 = (void *)MISCopyErrorStringForErrorCode(v4);
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ERROR - Failed to uninstall provisioning profile with UUID:  %{public}@ - Error:  %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }

  return v5 == 0;
}

+ (BOOL)uninstallProvisioningProfileByFileName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "loadProvisioningProfileFromFile:",  v3);
  if (v4)
  {
    int v5 = v4;
    uint64_t UUID = MISProvisioningProfileGetUUID();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(UUID);
    if (v7)
    {
      BOOL v8 = +[MSDProvisioningProfileUtils uninstallProvisioningProfileByUUID:]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "uninstallProvisioningProfileByUUID:",  v7);
    }

    else
    {
      id v10 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100090568((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);
      }

      BOOL v8 = 0;
    }

    CFRelease(v5);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isProvisioningProfileInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MSDProvisioningProfileUtils getUUIDsOfInstalledProvisioningProfiles]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "getUUIDsOfInstalledProvisioningProfiles"));
  int v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 containsObject:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)getUUIDsOfInstalledProvisioningProfiles
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100008DBC;
  uint64_t v16 = sub_100008DCC;
  id v17 = 0LL;
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)v13[5];
  v13[5] = v2;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008DD4;
  v11[3] = &unk_1000F9370;
  v11[4] = &v12;
  uint64_t v4 = MISEnumerateInstalledProvisioningProfiles(0LL, v11);
  if ((_DWORD)v4)
  {
    int v5 = (void *)v13[5];
    v13[5] = 0LL;

    unsigned __int8 v6 = (void *)MISCopyErrorStringForErrorCode(v4);
    id v7 = sub_10003A95C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ERROR - Failed to collect UUIDs of installed provisioning profiles - Error:  %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (void)loadProvisioningProfileFromFile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100090630((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_8;
  }

  unsigned __int8 v6 = (void *)MISProfileCreateWithFile(kCFAllocatorDefault, v3);
  if (!v6)
  {
    id v16 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000905CC((uint64_t)v3, v9, v17, v18, v19, v20, v21, v22);
    }
LABEL_8:

    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

+ (id)getUUIDFromProvisioningProfileRef:(void *)a3
{
  Value = (void *)MISProfileGetValue(a3, @"UUID");
  if (Value) {
    Value = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", Value));
  }
  return Value;
}

@end