@interface CPLCloudKitResourceRecordProperties
+ (void)initialize;
@end

@implementation CPLCloudKitResourceRecordProperties

+ (void)initialize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"CPLResourceRecordPropertiesToEncrypt"]);

  v3 = v6;
  if (v6)
  {
    char v4 = objc_opt_respondsToSelector(v6, "unsignedIntegerValue");
    v3 = v6;
    if ((v4 & 1) != 0)
    {
      id v5 = [v6 unsignedIntegerValue];
      v3 = v6;
      qword_1002911C8 = (uint64_t)v5;
    }
  }
}

- (void).cxx_destruct
{
}

@end