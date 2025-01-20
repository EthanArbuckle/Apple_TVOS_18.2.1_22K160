@interface RMLog
+ (id)mDMAppStatus;
@end

@implementation RMLog

+ (id)mDMAppStatus
{
  if (qword_1000086E0 != -1) {
    dispatch_once(&qword_1000086E0, &stru_100004180);
  }
  return (id)qword_1000086D8;
}

@end