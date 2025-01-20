@interface KTDeviceInfo
- (id)modelID;
- (id)osVersion;
- (id)serialNumber;
@end

@implementation KTDeviceInfo

- (id)modelID
{
  if (qword_1002EECC8 != -1) {
    dispatch_once(&qword_1002EECC8, &stru_100287230);
  }
  return (id)qword_1002EECC0;
}

- (id)osVersion
{
  __int128 v13 = 0u;
  memset(v12, 0, sizeof(v12));
  size_t v9 = 256LL;
  int v2 = sysctlbyname("kern.osrelease", v12, &v9, 0LL, 0LL);
  __int128 v11 = 0u;
  memset(v10, 0, sizeof(v10));
  size_t v8 = 256LL;
  if (sysctlbyname("kern.osversion", v10, &v8, 0LL, 0LL) | v2
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        (v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s (%s)",  v12,  v10))) == 0LL))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 operatingSystemVersionString]);

    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"Version" withString:&stru_10028E390]);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5));

  return v6;
}

- (id)serialNumber
{
  int v6 = 0;
  int v2 = (void *)MGCopyAnswerWithError(@"SerialNumber", 0LL, &v6);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    int v2 = 0LL;
  }

  return v2;
}

@end