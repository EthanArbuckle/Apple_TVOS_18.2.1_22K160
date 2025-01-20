@interface PBApplicationSupportServiceSingleton
+ (void)startService;
@end

@implementation PBApplicationSupportServiceSingleton

+ (void)startService
{
  if (qword_100470E98 != -1) {
    dispatch_once(&qword_100470E98, &stru_1003D7618);
  }
}

@end