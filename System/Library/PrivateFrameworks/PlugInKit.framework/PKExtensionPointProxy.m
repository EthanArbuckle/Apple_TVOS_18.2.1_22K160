@interface PKExtensionPointProxy
+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4;
- (NSDictionary)sdkEntry;
- (NSNumber)platform;
@end

@implementation PKExtensionPointProxy

+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)platform
{
  return 0LL;
}

- (NSDictionary)sdkEntry
{
  return 0LL;
}

@end