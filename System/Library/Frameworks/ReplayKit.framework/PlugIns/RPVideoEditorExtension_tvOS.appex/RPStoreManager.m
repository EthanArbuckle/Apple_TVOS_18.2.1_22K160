@interface RPStoreManager
+ (id)sharedManager;
@end

@implementation RPStoreManager

+ (id)sharedManager
{
  if (qword_1000123C8 != -1) {
    dispatch_once(&qword_1000123C8, &stru_10000C580);
  }
  return (id)qword_1000123D0;
}

@end