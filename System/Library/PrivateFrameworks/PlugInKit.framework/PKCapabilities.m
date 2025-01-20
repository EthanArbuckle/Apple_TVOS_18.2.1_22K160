@interface PKCapabilities
+ (BOOL)supportsAutoreleasePoolDuringPlugInLaunch;
+ (id)frameworkQueueAttr;
@end

@implementation PKCapabilities

+ (BOOL)supportsAutoreleasePoolDuringPlugInLaunch
{
  return dyld_program_sdk_at_least();
}

+ (id)frameworkQueueAttr
{
  return 0LL;
}

@end