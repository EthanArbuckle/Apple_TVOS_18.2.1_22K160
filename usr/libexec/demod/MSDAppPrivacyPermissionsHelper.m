@interface MSDAppPrivacyPermissionsHelper
+ (id)sharedInstance;
- (BOOL)grantNetworkPermission:(BOOL)a3 toBundleID:(id)a4;
- (BOOL)grantTCCPermission:(BOOL)a3 forResource:(id)a4 toBundleID:(id)a5;
- (BOOL)isCoreLocationOwnedResource:(id)a3;
- (BOOL)isNetworkOwnedResource:(id)a3;
- (BOOL)isTccOwnedResource:(id)a3;
- (BOOL)saveNetworkPrivacyConfiguration:(id)a3;
- (MSDAppPrivacyPermissionsHelper)init;
- (NSSet)coreLocationOwnedResources;
- (NSSet)networkOwnedResources;
- (NSSet)tccOwnedResources;
- (id)getCLPermissionForBundleID:(id)a3;
- (id)getCoreLocationOwnedResources;
- (id)getNetworkAccessPermissionForBundleID:(id)a3;
- (id)getNetworkOwnedResources;
- (id)getNetworkPrivacyConfiguration;
- (id)getPrivacyPermissionsForAppBundleID:(id)a3;
- (id)getTCCPermissionsForBundleID:(id)a3;
- (id)getTccOwnedResources;
- (void)grantCLPermission:(id)a3 toBundleID:(id)a4;
- (void)grantPrivacyPermissions:(id)a3 forAppBundleID:(id)a4;
- (void)grantPrivacyPermissionsForAllApps;
- (void)revokeCLPermissionForBundleID:(id)a3;
- (void)revokeNetworkPermissionForBundleID:(id)a3;
- (void)revokePrivacyPermissions:(id)a3 forAppBundleID:(id)a4;
- (void)revokePrivacyPermissionsForAllApps;
- (void)revokeTCCPermissionForResource:(id)a3 toBundleID:(id)a4;
- (void)savePrivacyPermissionsForAllApps:(id)a3;
- (void)setCoreLocationOwnedResources:(id)a3;
- (void)setNetworkOwnedResources:(id)a3;
- (void)setTccOwnedResources:(id)a3;
@end

@implementation MSDAppPrivacyPermissionsHelper

+ (id)sharedInstance
{
  if (qword_100125228 != -1) {
    dispatch_once(&qword_100125228, &stru_1000F92D8);
  }
  return (id)qword_100125220;
}

- (MSDAppPrivacyPermissionsHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDAppPrivacyPermissionsHelper;
  v2 = -[MSDAppPrivacyPermissionsHelper init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getTccOwnedResources](v2, "getTccOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setTccOwnedResources:](v3, "setTccOwnedResources:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getCoreLocationOwnedResources](v3, "getCoreLocationOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setCoreLocationOwnedResources:](v3, "setCoreLocationOwnedResources:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getNetworkOwnedResources](v3, "getNetworkOwnedResources"));
    -[MSDAppPrivacyPermissionsHelper setNetworkOwnedResources:](v3, "setNetworkOwnedResources:", v6);
  }

  return v3;
}

- (void)grantPrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v11);
        id v13 = sub_10003A95C();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          __int16 v33 = 2114;
          uint64_t v34 = v12;
          __int16 v35 = 2114;
          id v36 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s - Granting privacy permission for resource: %{public}@ to app: %{public}@",  buf,  0x20u);
        }

        if (-[MSDAppPrivacyPermissionsHelper isTccOwnedResource:](self, "isTccOwnedResource:", v12))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v12]);
          id v16 = [v15 BOOLValue];

          if (-[MSDAppPrivacyPermissionsHelper grantTCCPermission:forResource:toBundleID:]( self,  "grantTCCPermission:forResource:toBundleID:",  v16,  v12,  v7))
          {
            goto LABEL_21;
          }

          id v17 = sub_10003A95C();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315906;
          v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
          __int16 v33 = 2114;
          uint64_t v34 = v12;
          __int16 v35 = 2114;
          id v36 = v7;
          __int16 v37 = 1024;
          int v38 = (int)v16;
          v19 = v18;
          v20 = "%s - Failed to grant TCC resource:  %{public}@ to bundle:  %{public}@ isGranted:  %{BOOL}d";
LABEL_12:
          uint32_t v21 = 38;
LABEL_24:
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
          goto LABEL_20;
        }

        if (-[MSDAppPrivacyPermissionsHelper isCoreLocationOwnedResource:](self, "isCoreLocationOwnedResource:", v12))
        {
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v12]);
          -[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:]( self,  "grantCLPermission:toBundleID:",  v18,  v7);
        }

        else if (-[MSDAppPrivacyPermissionsHelper isNetworkOwnedResource:](self, "isNetworkOwnedResource:", v12))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v12]);
          id v23 = [v22 BOOLValue];

          if (-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:]( self,  "grantNetworkPermission:toBundleID:",  v23,  v7))
          {
            goto LABEL_21;
          }

          id v24 = sub_10003A95C();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            __int16 v33 = 2114;
            uint64_t v34 = v12;
            __int16 v35 = 2114;
            id v36 = v7;
            __int16 v37 = 1024;
            int v38 = (int)v23;
            v19 = v18;
            v20 = "%s - Failed to grant network permission:  %{public}@ to bundle:  %{public}@ allow:  %{BOOL}d";
            goto LABEL_12;
          }
        }

        else
        {
          id v25 = sub_10003A95C();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v32 = "-[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]";
            __int16 v33 = 2114;
            uint64_t v34 = v12;
            __int16 v35 = 2114;
            id v36 = v7;
            v19 = v18;
            v20 = "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@";
            uint32_t v21 = 32;
            goto LABEL_24;
          }
        }

- (void)revokePrivacyPermissions:(id)a3 forAppBundleID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(const char **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        id v13 = sub_10003A95C();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v12;
          __int16 v23 = 2114;
          id v24 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Revoking privacy permission for resource: %{public}@ to app: %{public}@",  buf,  0x16u);
        }

        if (-[MSDAppPrivacyPermissionsHelper isTccOwnedResource:](self, "isTccOwnedResource:", v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeTCCPermissionForResource:toBundleID:]( self,  "revokeTCCPermissionForResource:toBundleID:",  v12,  v7);
        }

        else if (-[MSDAppPrivacyPermissionsHelper isCoreLocationOwnedResource:]( self,  "isCoreLocationOwnedResource:",  v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeCLPermissionForBundleID:](self, "revokeCLPermissionForBundleID:", v7);
        }

        else if (-[MSDAppPrivacyPermissionsHelper isNetworkOwnedResource:](self, "isNetworkOwnedResource:", v12))
        {
          -[MSDAppPrivacyPermissionsHelper revokeNetworkPermissionForBundleID:]( self,  "revokeNetworkPermissionForBundleID:",  v7);
        }

        else
        {
          id v15 = sub_10003A95C();
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v22 = "-[MSDAppPrivacyPermissionsHelper revokePrivacyPermissions:forAppBundleID:]";
            __int16 v23 = 2114;
            id v24 = v12;
            __int16 v25 = 2114;
            id v26 = v7;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s - Unknown resource recorded in manifest:  %{public}@ for bundle:  %{public}@",  buf,  0x20u);
          }
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }

    while (v9);
  }
}

- (id)getPrivacyPermissionsForAppBundleID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppPrivacyPermissionsHelper getTCCPermissionsForBundleID:]( self,  "getTCCPermissionsForBundleID:",  v4));
  if (v6) {
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper getCLPermissionForBundleID:](self, "getCLPermissionForBundleID:", v4));
  if (v7) {
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v7);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppPrivacyPermissionsHelper getNetworkAccessPermissionForBundleID:]( self,  "getNetworkAccessPermissionForBundleID:",  v4));
  if (v8) {
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v8);
  }

  return v5;
}

- (id)getTccOwnedResources
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"kTCCServiceAddressBook",  @"kTCCServiceCalendar",  @"kTCCServiceMediaLibrary",  @"kTCCServicePhotos",  @"kTCCServicePhotosAdd",  @"kTCCServiceReminders",  @"kTCCServiceBluetoothAlways",  @"kTCCServiceBluetoothPeripheral",  @"kTCCServiceMotion",  @"kTCCServiceLiverpool",  @"kTCCServiceUbiquity",  0LL);
}

- (id)getCoreLocationOwnedResources
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"kCLServiceLocationService", 0LL);
}

- (id)getNetworkOwnedResources
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"kNetworkServiceNetworkAccess", 0LL);
}

- (BOOL)grantTCCPermission:(BOOL)a3 forResource:(id)a4 toBundleID:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10003A95C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315906;
    id v16 = "-[MSDAppPrivacyPermissionsHelper grantTCCPermission:forResource:toBundleID:]";
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s - isGranted:  %{BOOL}d - resources:  %{public}@ - bundleID:  %{public}@",  (uint8_t *)&v15,  0x26u);
  }

  int v11 = TCCAccessSetForBundleId(v7, v8, v6);
  if (!v11)
  {
    id v13 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009034C((uint64_t)v7, (uint64_t)v8, v14);
    }
  }

  return v11 != 0;
}

- (void)grantCLPermission:(id)a3 toBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:]";
    __int16 v11 = 1024;
    unsigned int v12 = [v5 BOOLValue];
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - status:  %{BOOL}d - bundleID:  %{public}@",  (uint8_t *)&v9,  0x1Cu);
  }

  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:]( CLLocationManager,  "setAuthorizationStatusByType:forBundleIdentifier:",  [v5 integerValue],  v6);
}

- (BOOL)grantNetworkPermission:(BOOL)a3 toBundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:]";
    __int16 v48 = 1024;
    BOOL v49 = v4;
    __int16 v50 = 2114;
    id v51 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - allow:  %{BOOL}d - bundleID:  %{public}@",  buf,  0x1Cu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration]( self,  "getNetworkPrivacyConfiguration"));
  uint64_t v10 = v9;
  if (!v9)
  {
    id v31 = sub_10003A95C();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000903C4(v21, v32, v33, v34, v35, v36, v37, v38);
    }
    __int16 v11 = 0LL;
LABEL_14:

LABEL_15:
    BOOL v29 = 0;
    goto LABEL_17;
  }

  BOOL v39 = v4;
  v40 = self;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 pathController]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathRules]);
  id v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v13)
  {
LABEL_12:

    id v20 = sub_10003A95C();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000903F4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_14;
  }

  id v14 = v13;
  uint64_t v15 = *(void *)v42;
LABEL_6:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v42 != v15) {
      objc_enumerationMutation(v12);
    }
    __int16 v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 matchSigningIdentifier]);
    unsigned int v19 = [v18 isEqualToString:v6];

    if (v19) {
      break;
    }
    if (v14 == (id)++v16)
    {
      id v14 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }

  [v17 setDenyMulticast:!v39];
  BOOL v29 = 1;
  [v17 setMulticastPreferenceSet:1];

  if (!-[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:](v40, "saveNetworkPrivacyConfiguration:", v10)) {
    goto LABEL_15;
  }
LABEL_17:

  return v29;
}

- (id)getTCCPermissionsForBundleID:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (char *)TCCAccessCopyInformationForBundleId(v3);
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TCC info list: %{public}@", buf, 0xCu);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:kTCCInfoService]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:kTCCInfoGranted]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, v14);
        id v16 = sub_10003A95C();
        __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v18 = [v15 BOOLValue];
          *(_DWORD *)buf = 136315650;
          uint64_t v26 = "-[MSDAppPrivacyPermissionsHelper getTCCPermissionsForBundleID:]";
          __int16 v27 = 2114;
          uint64_t v28 = v14;
          __int16 v29 = 1024;
          unsigned int v30 = v18;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s - resource:  %{public}@ - isGranted:  %{BOOL}d",  buf,  0x1Cu);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }

    while (v10);
  }

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
  return v19;
}

- (id)getCLPermissionForBundleID:(id)a3
{
  signed int v3 = +[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  a3);
  BOOL v4 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
  id v6 = -[NSDictionary initWithObjectsAndKeys:]( v4,  "initWithObjectsAndKeys:",  v5,  @"kCLServiceLocationService",  0LL);

  return v6;
}

- (id)getNetworkAccessPermissionForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration]( self,  "getNetworkPrivacyConfiguration"));
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathController]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pathRules]);
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 matchSigningIdentifier]);
          unsigned int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            id v17 = sub_10003A95C();
            unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v19 = [v13 denyMulticast];
              *(_DWORD *)buf = 67109378;
              int v37 = v19 ^ 1;
              __int16 v38 = 2114;
              id v39 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found network access permission: %d for bundleID: %{public}@",  buf,  0x12u);
            }

            id v20 = objc_alloc(&OBJC_CLASS___NSDictionary);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 denyMulticast] ^ 1));
            id v16 = -[NSDictionary initWithObjectsAndKeys:]( v20,  "initWithObjectsAndKeys:",  v21,  @"kNetworkServiceNetworkAccess",  0LL);

            goto LABEL_14;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    id v24 = sub_10003A95C();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_1000903C4((os_log_s *)v8, v25, v26, v27, v28, v29, v30, v31);
    }
    id v7 = 0LL;
  }

  id v16 = 0LL;
LABEL_14:

  __int128 v22 = v16;
  return v22;
}

- (void)revokeTCCPermissionForResource:(id)a3 toBundleID:(id)a4
{
}

- (void)revokeCLPermissionForBundleID:(id)a3
{
  id v5 = a3;
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    -[MSDAppPrivacyPermissionsHelper grantCLPermission:toBundleID:](self, "grantCLPermission:toBundleID:", v4, v5);
  }
}

- (void)revokeNetworkPermissionForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppPrivacyPermissionsHelper getNetworkPrivacyConfiguration]( self,  "getNetworkPrivacyConfiguration"));
  id v6 = v5;
  if (v5)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 pathController]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v26 pathRules]);
    id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 matchSigningIdentifier]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            [v12 setDenyMulticast:1];
            [v12 setMulticastPreferenceSet:0];

            -[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:]( self,  "saveNetworkPrivacyConfiguration:",  v6);
            goto LABEL_14;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v15 = sub_10003A95C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unable to find the appropriate privacy rule.",  buf,  2u);
    }

LABEL_14:
    id v17 = (os_log_s *)v26;
  }

  else
  {
    id v18 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000903C4(v17, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (id)getNetworkPrivacyConfiguration
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_1000078F4;
  uint64_t v20 = sub_100007904;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_1000078F4;
  unsigned int v14 = sub_100007904;
  id v15 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000790C;
  v9[3] = &unk_1000F9300;
  v9[4] = &v10;
  v9[5] = &v16;
  [v2 loadConfigurationsWithCompletionQueue:v4 handler:v9];

  id v5 = (dispatch_semaphore_s *)v17[5];
  dispatch_time_t v6 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

- (BOOL)saveNetworkPrivacyConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  unsigned int v14 = sub_1000078F4;
  id v15 = sub_100007904;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007CB4;
  v10[3] = &unk_1000F9328;
  v10[4] = &v17;
  v10[5] = &v11;
  [v4 saveConfiguration:v3 withCompletionQueue:v6 handler:v10];

  id v7 = (dispatch_semaphore_s *)v12[5];
  dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v7, v8);
  LOBYTE(v7) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return (char)v7;
}

- (BOOL)isTccOwnedResource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper tccOwnedResources](self, "tccOwnedResources"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isCoreLocationOwnedResource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper coreLocationOwnedResources](self, "coreLocationOwnedResources"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isNetworkOwnedResource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppPrivacyPermissionsHelper networkOwnedResources](self, "networkOwnedResources"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)tccOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTccOwnedResources:(id)a3
{
}

- (NSSet)coreLocationOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCoreLocationOwnedResources:(id)a3
{
}

- (NSSet)networkOwnedResources
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setNetworkOwnedResources:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)grantPrivacyPermissionsForAllApps
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"AppPrivacyPermissions"]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v12));
        -[MSDAppPrivacyPermissionsHelper grantPrivacyPermissions:forAppBundleID:]( self,  "grantPrivacyPermissions:forAppBundleID:",  v11,  v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)revokePrivacyPermissionsForAllApps
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"AppPrivacyPermissions"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v5 removeObjectForKey:@"AppPrivacyPermissions"];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&__int128 v8 = 136315650LL;
    __int128 v16 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12, v16, (void)v17));
        id v14 = sub_10003A95C();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = "-[MSDAppPrivacyPermissionsHelper(manager) revokePrivacyPermissionsForAllApps]";
          __int16 v23 = 2114;
          uint64_t v24 = v12;
          __int16 v25 = 2114;
          uint64_t v26 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s - Revoking appId:  %{public}@ permissions:  %{public}@",  buf,  0x20u);
        }

        -[MSDAppPrivacyPermissionsHelper revokePrivacyPermissions:forAppBundleID:]( self,  "revokePrivacyPermissions:forAppBundleID:",  v13,  v12);
      }

      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }

    while (v9);
  }
}

- (void)savePrivacyPermissionsForAllApps:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 getSystemAppDataList]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 getSystemAppPrivacyPermissions:v10]);
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v7);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 getAppList]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)j);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 getAppPrivacyPermissions:v17]);
        if (v18) {
          [v4 setObject:v18 forKey:v17];
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }

    while (v14);
  }

  if ([v4 count])
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v19 setObject:v4 forKey:@"AppPrivacyPermissions"];
  }

  id v20 = sub_10003A95C();
  dispatch_semaphore_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AppPrivacyPermissions:  %{public}@", buf, 0xCu);
  }
}

@end