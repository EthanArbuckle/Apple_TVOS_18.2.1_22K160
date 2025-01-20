@interface APSSimulatorSupport
+ (BOOL)isBuildSupported;
+ (BOOL)isHardwareSupported;
+ (BOOL)isSimulator;
@end

@implementation APSSimulatorSupport

+ (BOOL)isSimulator
{
  return 0;
}

+ (BOOL)isBuildSupported
{
  size_t v8 = 100LL;
  if (sysctlbyname("kern.osrelease", v9, &v8, 0LL, 0LL)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v9[0] == 0;
  }
  if (v2) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v9));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"."]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);

  if (!v5) {
    return 0;
  }
  BOOL v6 = (int)[v5 intValue] > 21;

  return v6;
}

+ (BOOL)isHardwareSupported
{
  return 1;
}

@end