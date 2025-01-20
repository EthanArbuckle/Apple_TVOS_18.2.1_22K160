@interface TCCDPlatformIOSFamily
- (BOOL)isChinaSKUDevice;
- (BOOL)isNonAppBundleIdentifierValid:(id)a3;
- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3;
- (id)homeRelativePathToStateDirectory;
- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3;
@end

@implementation TCCDPlatformIOSFamily

- (id)homeRelativePathToStateDirectory
{
  return @"Library/TCC";
}

- (BOOL)isNonAppBundleIdentifierValid:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
  if ([v5 allowsInternalSecurityPolicies])
  {
    unsigned int v6 = [v4 hasPrefix:@"com.appleinternal.health.Lime."];

    if (v6)
    {
      v7 = @"com.appleinternal.health.Lime";
      goto LABEL_7;
    }
  }

  else
  {
  }

  if (![v4 hasPrefix:@"com.apple.Research.study."])
  {
    unsigned __int8 v11 = 0;
    goto LABEL_12;
  }

  v7 = @"com.apple.Research";
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v7));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 appState]);
    unsigned __int8 v11 = [v10 isInstalled];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

LABEL_12:
  return v11;
}

- (BOOL)removalOfAppBundleIdentifierRequiresPruning:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Research"])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
    else {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPlatform server](self, "server"));
  if (([v5 allowsInternalSecurityPolicies] & 1) == 0)
  {

    goto LABEL_6;
  }

  unsigned int v6 = [v4 isEqualToString:@"com.appleinternal.health.Lime"];

  if (!v6)
  {
LABEL_6:
    v7 = 0LL;
    goto LABEL_7;
  }

- (BOOL)isChinaSKUDevice
{
  return 0;
}

@end