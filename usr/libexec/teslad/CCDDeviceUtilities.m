@interface CCDDeviceUtilities
+ (BOOL)isAppleTV;
+ (BOOL)isHomePod;
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningInDiagnosticsMode;
+ (BOOL)isRunningInRecovery;
+ (BOOL)isRunningInRootLaunchdContext;
+ (BOOL)isWatch;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (id)UDID;
+ (id)_systemInfo;
+ (id)deviceCapacity;
+ (id)deviceColor;
+ (id)deviceType;
+ (id)modelNumber;
+ (id)productBuildVersion;
+ (id)productName;
+ (id)productVersion;
+ (id)serialNumber;
@end

@implementation CCDDeviceUtilities

+ (id)deviceType
{
  v2 = (__CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
  if (!v2) {
    v2 = @"iPhone";
  }
  return v2;
}

+ (BOOL)isiPad
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003F80;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_100021598 != -1) {
    dispatch_once(&qword_100021598, block);
  }
  return byte_100021590;
}

+ (BOOL)isAppleTV
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004034;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_1000215A8 != -1) {
    dispatch_once(&qword_1000215A8, block);
  }
  return byte_1000215A0;
}

+ (BOOL)isWatch
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000040E8;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_1000215B8 != -1) {
    dispatch_once(&qword_1000215B8, block);
  }
  return byte_1000215B0;
}

+ (BOOL)isHomePod
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000419C;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_1000215C8 != -1) {
    dispatch_once(&qword_1000215C8, block);
  }
  return byte_1000215C0;
}

+ (BOOL)isiPhone
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004250;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_1000215D8 != -1) {
    dispatch_once(&qword_1000215D8, block);
  }
  return byte_1000215D0;
}

+ (BOOL)isRunningInRecovery
{
  return 0;
}

+ (BOOL)isRunningInRootLaunchdContext
{
  return 0;
}

+ (BOOL)isRunningInDiagnosticsMode
{
  if (qword_1000215E8 != -1) {
    dispatch_once(&qword_1000215E8, &stru_100018878);
  }
  return byte_1000215E0;
}

+ (BOOL)isInternalBuild
{
  return +[CCDFeatures isAppleInternal](&OBJC_CLASS___CCDFeatures, "isAppleInternal");
}

+ (id)serialNumber
{
  return (id)MGCopyAnswer(@"SerialNumber", 0LL);
}

+ (id)UDID
{
  return (id)MGCopyAnswer(@"UniqueDeviceID", 0LL);
}

+ (id)modelNumber
{
  return (id)MGCopyAnswer(@"ModelNumber", 0LL);
}

+ (id)deviceCapacity
{
  v2 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kMGQDiskUsageTotalDataCapacity]);

  return v3;
}

+ (id)deviceColor
{
  return (id)MGCopyAnswer(@"DeviceColor", 0LL);
}

+ (id)_systemInfo
{
  if (qword_1000215F8 != -1) {
    dispatch_once(&qword_1000215F8, &stru_100018898);
  }
  return (id)qword_1000215F0;
}

+ (id)productName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _systemInfo]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ProductName"]);

  return v3;
}

+ (id)productVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _systemInfo]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ProductVersion"]);

  return v3;
}

+ (id)productBuildVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _systemInfo]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ProductBuildVersion"]);

  return v3;
}

@end