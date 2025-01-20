@interface IMServiceImpl
+ (id)tvs_faceTimeService;
@end

@implementation IMServiceImpl

+ (id)tvs_faceTimeService
{
  return +[IMServiceImpl serviceWithInternalName:]( &OBJC_CLASS___IMServiceImpl,  "serviceWithInternalName:",  @"FaceTime");
}

@end