@interface PKApplicationProxy
+ (id)applicationProxyForBundleURL:(id)a3;
- (BOOL)isPlaceholder;
- (NSArray)plugInKitPlugins;
@end

@implementation PKApplicationProxy

+ (id)applicationProxyForBundleURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)plugInKitPlugins
{
  return 0LL;
}

- (BOOL)isPlaceholder
{
  return 0;
}

@end