@interface Device
- (BOOL)isAppleSiliconMac;
- (BOOL)isHRNMode;
- (NSArray)productVariants;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)iOSSupportVersion;
- (NSString)productVersion;
- (NSUUID)bootSession;
- (id)copyThinningHeadersForPlatform:(int64_t)a3;
@end

@implementation Device

- (BOOL)isAppleSiliconMac
{
  return 0;
}

- (NSString)deviceGUID
{
  return (NSString *)+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID");
}

- (NSString)deviceName
{
  return (NSString *)+[AMSDevice deviceName](&OBJC_CLASS___AMSDevice, "deviceName");
}

- (BOOL)isHRNMode
{
  return 0;
}

- (id)copyThinningHeadersForPlatform:(int64_t)a3
{
  v4 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Device productVariants](self, "productVariants"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@" "]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  @"X-Apple-TA-Device");

  return v4;
}

- (NSString)iOSSupportVersion
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)productVariants
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSUUID)bootSession
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end