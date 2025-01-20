@interface AAFDeviceInfo
+ (BOOL)isDeviceInDiagnosticMode;
@end

@implementation AAFDeviceInfo

+ (BOOL)isDeviceInDiagnosticMode
{
  if (qword_10020F630 != -1) {
    dispatch_once(&qword_10020F630, &stru_1001CA860);
  }
  return byte_10020F628;
}

@end