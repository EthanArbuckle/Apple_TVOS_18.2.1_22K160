@interface TCCDSitePolicyOverride
- (TCCDSitePolicyOverride)init;
@end

@implementation TCCDSitePolicyOverride

- (TCCDSitePolicyOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TCCDSitePolicyOverride;
  v2 = -[TCCDPolicyOverride init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDPolicyOverride useString:orReadFromDefaults:]( &OBJC_CLASS___TCCDPolicyOverride,  "useString:orReadFromDefaults:",  @"/Library/Application Support/com.apple.TCC/SiteOverrides.plist",  @"sitePolicyOverridePath"));
    -[TCCDPolicyOverride setPlistFilePath:](v2, "setPlistFilePath:", v3);

    v4 = v2;
  }

  return v2;
}

@end