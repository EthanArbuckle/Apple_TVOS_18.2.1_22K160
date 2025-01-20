@interface RMPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)supportsOpportunisticAnchoredTracking;
@end

@implementation RMPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_100023C68 != -1) {
    dispatch_once(&qword_100023C68, &stru_10001CC48);
  }
  return byte_100023C60;
}

+ (BOOL)supportsOpportunisticAnchoredTracking
{
  if (qword_100023C78 != -1) {
    dispatch_once(&qword_100023C78, &stru_10001CC68);
  }
  return byte_100023C70;
}

@end