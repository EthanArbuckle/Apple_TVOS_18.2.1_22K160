@interface CCDFeatures
+ (BOOL)isAppleInternal;
+ (BOOL)sentinelExistsAtPath:(id)a3;
+ (id)depConfigurationEnrollmentURLStringWithURLString:(id)a3;
+ (id)depDeviceSerialNumberWithValue:(id)a3;
+ (id)depProvisionalEnrollmentURLStringWithURLString:(id)a3;
+ (id)depRemoveEnrollmentURLStringWithURLString:(id)a3;
+ (id)depResponseContentTypeFromContentType:(id)a3;
+ (id)depResponseDataFromData:(id)a3;
+ (id)deviceRegisterURLStringWithURLString:(id)a3;
+ (id)stringForDefaultsKey:(id)a3;
@end

@implementation CCDFeatures

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui("com.apple.DeviceManagementClient", a2);
}

+ (id)stringForDefaultsKey:(id)a3
{
  id v4 = a3;
  if ([a1 isAppleInternal])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:v4]);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (BOOL)sentinelExistsAtPath:(id)a3
{
  id v4 = a3;
  if ([a1 isAppleInternal])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)depConfigurationEnrollmentURLStringWithURLString:(id)a3
{
  uint64_t v4 = kCCURLUserDefaultsKey;
  id v5 = a3;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForDefaultsKey:v4]);
  v7 = v6;
  if (!v6) {
    unsigned __int8 v6 = v5;
  }
  id v8 = v6;

  return v8;
}

+ (id)depDeviceSerialNumberWithValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForDefaultsKey:@"MCTeslaDeviceSerialNumber"]);
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depProvisionalEnrollmentURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForDefaultsKey:@"MCTeslaProvisionalEnrollmentURL"]);
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depRemoveEnrollmentURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForDefaultsKey:@"MCTeslaUnenrollURL"]);
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)deviceRegisterURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForDefaultsKey:@"MCTeslaDeviceRegisterURL"]);
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depResponseContentTypeFromContentType:(id)a3
{
  id v4 = a3;
  else {
    id v5 = (__CFString *)v4;
  }

  return v5;
}

+ (id)depResponseDataFromData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCCFakeDEPJSONResponsePath;
  id v6 = [a1 sentinelExistsAtPath:kCCFakeDEPJSONResponsePath];
  if ((_DWORD)v6)
  {
    v9 = *(os_log_s **)(DEPLogObjects(v6, v7, v8) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      uint64_t v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Overriding cloud config with file at path: %{public}@",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v5));

    id v4 = (id)v10;
  }

  return v4;
}

@end