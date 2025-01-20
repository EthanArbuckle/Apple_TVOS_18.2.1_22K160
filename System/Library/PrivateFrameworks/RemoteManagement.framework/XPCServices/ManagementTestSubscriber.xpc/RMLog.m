@interface RMLog
+ (id)managementTestAdapter;
+ (id)managementTestStatus;
@end

@implementation RMLog

+ (id)managementTestAdapter
{
  if (qword_10000CF20 != -1) {
    dispatch_once(&qword_10000CF20, &stru_1000082B8);
  }
  return (id)qword_10000CF18;
}

+ (id)managementTestStatus
{
  if (qword_10000CF30 != -1) {
    dispatch_once(&qword_10000CF30, &stru_100008328);
  }
  return (id)qword_10000CF28;
}

@end