@interface EnvironmentManager
+ (id)sharedInstance;
- (id)dumpStatus;
@end

@implementation EnvironmentManager

+ (id)sharedInstance
{
  if (qword_10003E1D8 != -1) {
    dispatch_once(&qword_10003E1D8, &stru_1000308B8);
  }
  return (id)qword_10003E1D0;
}

- (id)dumpStatus
{
  return &__NSDictionary0__struct;
}

@end