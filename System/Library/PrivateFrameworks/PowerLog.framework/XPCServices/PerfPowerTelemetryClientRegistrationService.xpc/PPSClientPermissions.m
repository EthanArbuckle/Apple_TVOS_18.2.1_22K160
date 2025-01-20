@interface PPSClientPermissions
+ (BOOL)checkWritePermissionForSubsystem:(id)a3 category:(id)a4;
+ (BOOL)hasWriteEntitlements;
+ (BOOL)overridePermissionForSubsystem:(id)a3 category:(id)a4;
+ (id)getClientPermissions;
+ (id)getPrivacyClientPermissions;
+ (id)getTestClientPermissions;
+ (id)userDefaults;
@end

@implementation PPSClientPermissions

+ (BOOL)checkWritePermissionForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (+[PPSClientPermissions hasWriteEntitlements](&OBJC_CLASS___PPSClientPermissions, "hasWriteEntitlements"))
    {
      if (+[PPSClientPermissions overridePermissionForSubsystem:category:]( &OBJC_CLASS___PPSClientPermissions,  "overridePermissionForSubsystem:category:",  v5,  v7))
      {
        id v9 = sub_10000277C();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        BOOL v8 = 1;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          id v19 = v5;
          __int16 v20 = 2112;
          v21 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "overridePermissionForSubsystem %@ category %@",  (uint8_t *)&v18,  0x16u);
        }

        goto LABEL_17;
      }

      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PPSClientPermissions getClientPermissions]( &OBJC_CLASS___PPSClientPermissions,  "getClientPermissions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v5));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[PPSClientInterface getMetadataForSubsystem:category:]( &OBJC_CLASS___PPSClientInterface,  "getMetadataForSubsystem:category:",  v5,  v7));
        id v13 = [v12 count];
        BOOL v8 = v13 != 0LL;
        if (v13)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }

        id v14 = sub_10000277C();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          id v19 = v5;
          __int16 v20 = 2112;
          v21 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Missing metric definition for subsystem: %@ category: %@",  (uint8_t *)&v18,  0x16u);
        }
      }

      else
      {
        id v16 = sub_10000277C();
        v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          id v19 = v5;
          __int16 v20 = 2112;
          v21 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "Subsystem/Category: %@::%@ is not registered",  (uint8_t *)&v18,  0x16u);
        }
      }

      BOOL v8 = 0;
      goto LABEL_16;
    }

    BOOL v8 = 0;
  }

+ (BOOL)hasWriteEntitlements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForEntitlement:@"com.apple.PerfPowerServices.data-donation"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForEntitlement:@"com.apple.PerfPowerTelemetry.data-donation"]);
  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0 && ([v3 BOOLValue] & 1) != 0
    || (objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0 && ([v4 BOOLValue] & 1) != 0)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = sub_10000277C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100002D88(v2, v7);
    }

    BOOL v5 = 0;
  }

  return v5;
}

+ (id)userDefaults
{
  if (qword_1000087A8 != -1) {
    dispatch_once(&qword_1000087A8, &stru_100004188);
  }
  return (id)qword_1000087B0;
}

+ (BOOL)overridePermissionForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_diagnostics(&unk_100003EE7))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1 userDefaults]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:@"OverridePermissions"]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::%@",  v6,  v7));
      id v11 = sub_10000277C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100002E0C((uint64_t)v10, (uint64_t)v9, v12);
      }

      unsigned __int8 v13 = [v9 isEqualToString:v10];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (id)getClientPermissions
{
  if ((os_variant_has_internal_diagnostics(&unk_100003EE7) & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getPrivacyClientPermissions]);
    [v3 addEntriesFromDictionary:v4];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([a1 getTestClientPermissions]);
    [v3 addEntriesFromDictionary:v5];
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a1 getPrivacyClientPermissions]);
  }

  return v3;
}

+ (id)getPrivacyClientPermissions
{
  if (qword_1000087B8 != -1) {
    dispatch_once(&qword_1000087B8, &stru_1000041A8);
  }
  return (id)qword_1000087C0;
}

+ (id)getTestClientPermissions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PPSFileUtilities containerPath](&OBJC_CLASS___PPSFileUtilities, "containerPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"/Library/PerfPowerTelemetry/"]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"Test/"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"testAllowlist.plist"]);
  unsigned int v7 = [v2 fileExistsAtPath:v6];

  if (!v7) {
    return &__NSDictionary0__struct;
  }
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[PPSFileUtilities containerPath](&OBJC_CLASS___PPSFileUtilities, "containerPath"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"/Library/PerfPowerTelemetry/"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"Test/"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@"testAllowlist.plist"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v11, 0LL));

  id v20 = 0LL;
  unsigned __int8 v13 = -[NSDictionary initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:error:",  v12,  &v20);
  id v14 = v20;
  id v15 = sub_10000277C();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100002E8C((uint64_t)v14, v17);
    }

    int v18 = (NSDictionary *)&__NSDictionary0__struct;
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Test allowlist: %@", buf, 0xCu);
    }

    int v18 = v13;
  }

  return v18;
}

@end