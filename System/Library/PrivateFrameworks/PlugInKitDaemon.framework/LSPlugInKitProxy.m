@interface LSPlugInKitProxy
- (id)launchdIdentifier;
- (id)launchdVersion;
@end

@implementation LSPlugInKitProxy

- (id)launchdIdentifier
{
  return (id)objc_claimAutoreleasedReturnValue(-[LSPlugInKitProxy bundleIdentifier](self, "bundleIdentifier"));
}

- (id)launchdVersion
{
  return (id)objc_claimAutoreleasedReturnValue(-[LSPlugInKitProxy bundleVersion](self, "bundleVersion"));
}

@end