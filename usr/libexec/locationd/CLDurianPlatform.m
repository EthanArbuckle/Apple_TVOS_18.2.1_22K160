@interface CLDurianPlatform
+ (BOOL)isInternalInstall;
+ (BOOL)isPhone;
+ (BOOL)isTinkerWatch;
+ (BOOL)isWatch;
+ (NSString)systemModel;
+ (NSString)systemVersion;
@end

@implementation CLDurianPlatform

+ (BOOL)isInternalInstall
{
  if (qword_1019A0538 != -1) {
    dispatch_once(&qword_1019A0538, &stru_101898508);
  }
  return byte_1019A0530;
}

+ (BOOL)isPhone
{
  if (qword_1019A0548 != -1) {
    dispatch_once(&qword_1019A0548, &stru_101898528);
  }
  return byte_1019A0540;
}

+ (BOOL)isWatch
{
  return 0;
}

+ (BOOL)isTinkerWatch
{
  return 0;
}

+ (NSString)systemVersion
{
  if (qword_1019A0558 != -1) {
    dispatch_once(&qword_1019A0558, &stru_101898548);
  }
  return (NSString *)qword_1019A0550;
}

+ (NSString)systemModel
{
  if (qword_1019A0568 != -1) {
    dispatch_once(&qword_1019A0568, &stru_101898568);
  }
  return (NSString *)qword_1019A0560;
}

@end