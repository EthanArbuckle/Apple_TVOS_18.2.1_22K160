@interface TCCDBinCompatPolicyOverride
- (TCCDBinCompatPolicyOverride)init;
- (id)allowedParser:(id)a3;
- (void)loadAndParse;
@end

@implementation TCCDBinCompatPolicyOverride

- (TCCDBinCompatPolicyOverride)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TCCDBinCompatPolicyOverride;
  v2 = -[TCCDPolicyOverride init](&v9, "init");
  if (v2)
  {
    if (os_variant_allows_internal_security_policies("com.apple.tcc"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v4 = [v3 fileExistsAtPath:@"/Library/Apple/Library/Bundles/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist"];

      if (v4) {
        v5 = @"/Library/Apple/Library/Bundles/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist";
      }
      else {
        v5 = @"/System/Library/Sandbox/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist";
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDPolicyOverride useString:orReadFromDefaults:]( &OBJC_CLASS___TCCDPolicyOverride,  "useString:orReadFromDefaults:",  v5,  @"binCompatOverridePath"));
      -[TCCDPolicyOverride setPlistFilePath:](v2, "setPlistFilePath:", v6);
    }

    v7 = v2;
  }

  return v2;
}

- (id)allowedParser:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return &__kCFBooleanTrue;
  }
}

- (void)loadAndParse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TCCDBinCompatPolicyOverride;
  -[TCCDPolicyOverride loadAndParse](&v4, "loadAndParse");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A170;
  block[3] = &unk_100064D50;
  block[4] = self;
  if (qword_100078300 != -1) {
    dispatch_once(&qword_100078300, block);
  }
}

@end