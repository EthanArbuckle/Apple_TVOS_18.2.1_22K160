@interface TVSSMenuBarActiveItemIdentifierTrait
+ (BOOL)affectsColorAppearance;
+ (NSObject)defaultValue;
+ (NSString)identifier;
+ (NSString)name;
@end

@implementation TVSSMenuBarActiveItemIdentifierTrait

+ (NSObject)defaultValue
{
  return 0LL;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.TVSystemUIService.TVSSMenuBarActiveItemIdentifierTrait";
}

+ (NSString)name
{
  return (NSString *)@"MenuBarActiveItemIdentifier";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

@end