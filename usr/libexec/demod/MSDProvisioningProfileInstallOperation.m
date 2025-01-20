@interface MSDProvisioningProfileInstallOperation
- (BOOL)_installProvisioningProfiles;
- (BOOL)_installProvisioningProfilesInBackup;
- (BOOL)_installStandaloneProvisioningProfile;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDProvisioningProfileInstallOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_installProvisioningProfiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 3LL;
}

- (BOOL)_installProvisioningProfiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MSDContentFilesContext, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0) {
    return -[MSDProvisioningProfileInstallOperation _installProvisioningProfilesInBackup]( self,  "_installProvisioningProfilesInBackup");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MSDInstallableFileContext, v8);
  char v10 = objc_opt_isKindOfClass(v7, v9);

  if ((v10 & 1) != 0) {
    return -[MSDProvisioningProfileInstallOperation _installStandaloneProvisioningProfile]( self,  "_installStandaloneProvisioningProfile");
  }
  id v11 = sub_10003A95C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unrecognized operation context.", v14, 2u);
  }

  return 0;
}

- (BOOL)_installProvisioningProfilesInBackup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 secondaryStagingRootPath]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"/var/MobileDevice/ProvisioningProfiles"]);
  id v6 = sub_10003A95C();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Provisioning profile directory: %{public}@",  buf,  0xCu);
  }

  id v47 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 contentsOfDirectoryAtPath:v5 error:&v47]);
  id v9 = v47;
  BOOL v10 = v8 == 0LL;
  if (!v8)
  {
    id v29 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10009D4D0(v9);
    }
    goto LABEL_34;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v12)
  {

LABEL_28:
    id v31 = sub_10003A95C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Going to delete provision profile dir.",  buf,  2u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    unsigned __int8 v34 = [v33 removeWorkDirectory:v5];

    if ((v34 & 1) != 0)
    {
      BOOL v10 = 1;
      goto LABEL_35;
    }

    id v35 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10009D54C(v30);
    }
LABEL_34:

    goto LABEL_35;
  }

  id v13 = v12;
  id v37 = v9;
  v38 = v8;
  v39 = v4;
  v40 = v3;
  v41 = v2;
  uint64_t v14 = *(void *)v44;
  char v42 = 1;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
      if ((objc_msgSend(v16, "hasPrefix:", @".", v37, v38) & 1) == 0)
      {
        id v17 = v11;
        v18 = v5;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v16]);
        id v20 = sub_10003A95C();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Installing provisioning profile: %{public}@",  buf,  0xCu);
        }

        uint64_t v22 = MISProfileCreateWithFile(kCFAllocatorDefault, v19);
        if (v22)
        {
          v23 = (const void *)v22;
          uint64_t v24 = MISInstallProvisioningProfile();
          if ((_DWORD)v24)
          {
            v25 = (os_log_s *)MISCopyErrorStringForErrorCode(v24);
            id v26 = sub_10003A95C();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v49 = v19;
              __int16 v50 = 2114;
              v51 = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to install %{public}@ with error %{public}@",  buf,  0x16u);
            }

            char v42 = 0;
          }

          else
          {
            id v28 = sub_10003A95C();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Install success for %{public}@",  buf,  0xCu);
            }
          }

          CFRelease(v23);
        }

        id v11 = v17;

        uint64_t v5 = v18;
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v43 objects:v52 count:16];
  }

  while (v13);

  v3 = v40;
  v2 = v41;
  uint64_t v4 = v39;
  id v9 = v37;
  uint64_t v8 = v38;
  if ((v42 & 1) != 0) {
    goto LABEL_28;
  }
  BOOL v10 = v42 & 1;
LABEL_35:

  return v10;
}

- (BOOL)_installStandaloneProvisioningProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stagingRootPath]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 fileHash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "INFO - Installing provisioning profile: %{public}@",  buf,  0xCu);
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  unsigned __int8 v11 = objc_msgSend( v10,  "copyFileIfPresentInCache:toLocation:verifyHash:",  v5,  v6,  objc_msgSend(v2, "verifyFileHash"));

  if ((v11 & 1) != 0)
  {
    BOOL v12 = +[MSDProvisioningProfileUtils installProvisioningProfile:]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "installProvisioningProfile:",  v6);
  }

  else
  {
    id v18 = sub_10003A95C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10009D608((uint64_t)v5, v19);
    }

    BOOL v12 = 0;
  }

  if ([v3 fileExistsAtPath:v6])
  {
    id v20 = 0LL;
    unsigned __int8 v13 = [v3 removeItemAtPath:v6 error:&v20];
    id v14 = v20;
    if ((v13 & 1) == 0)
    {
      id v15 = sub_10003A95C();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10009D58C(v14);
      }
    }
  }

  return v12;
}

@end