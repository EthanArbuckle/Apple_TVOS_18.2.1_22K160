@interface NIPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)supportsARKit;
+ (BOOL)supportsAoA;
+ (BOOL)supportsNBAMMS;
+ (BOOL)supportsSyntheticAperture;
+ (BOOL)supportsUWB;
@end

@implementation NIPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_1007F81D0 != -1) {
    dispatch_once(&qword_1007F81D0, &stru_1007B11D0);
  }
  return byte_1007F81C8;
}

+ (BOOL)supportsUWB
{
  if (qword_1007F81E0 != -1) {
    dispatch_once(&qword_1007F81E0, &stru_1007B11F0);
  }
  return byte_1007F81D8;
}

+ (BOOL)supportsAoA
{
  return 0;
}

+ (BOOL)supportsSyntheticAperture
{
  return 0;
}

+ (BOOL)supportsARKit
{
  return 0;
}

+ (BOOL)supportsNBAMMS
{
  return 0;
}

@end