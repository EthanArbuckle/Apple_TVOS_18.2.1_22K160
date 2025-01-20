@interface SecC2DeviceInfo
+ (BOOL)isAppleInternal;
+ (id)buildVersion;
+ (id)processName;
+ (id)processUUID;
+ (id)processVersion;
+ (id)productName;
+ (id)productType;
+ (id)productVersion;
@end

@implementation SecC2DeviceInfo

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_content("com.apple.security.analytics", a2);
}

+ (id)buildVersion
{
  return sub_100139210(@"BuildVersion");
}

+ (id)productName
{
  return sub_100139210(@"ProductName");
}

+ (id)productType
{
  return sub_100139210(@"ProductType");
}

+ (id)productVersion
{
  return sub_100139210(@"ProductVersion");
}

+ (id)processName
{
  id v2 = sub_100139188();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCFBundleIdentifierKey]);

  return v4;
}

+ (id)processVersion
{
  id v2 = sub_100139188();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:_kCFBundleShortVersionStringKey]);

  return v4;
}

+ (id)processUUID
{
  if (qword_1002DECC8 != -1) {
    dispatch_once(&qword_1002DECC8, &stru_100290468);
  }
  return (id)qword_1002DECC0;
}

@end