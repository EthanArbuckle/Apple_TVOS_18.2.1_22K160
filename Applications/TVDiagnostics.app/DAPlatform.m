@interface DAPlatform
+ (id)currentPlatform;
@end

@implementation DAPlatform

+ (id)currentPlatform
{
  return +[DAPlatform_tvOS sharedInstance](&OBJC_CLASS___DAPlatform_tvOS, "sharedInstance");
}

@end