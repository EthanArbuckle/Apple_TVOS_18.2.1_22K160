@interface SHNotificationCenterProvider
+ (id)matchResultNotificationCenter;
@end

@implementation SHNotificationCenterProvider

+ (id)matchResultNotificationCenter
{
  if (qword_100088950 != -1) {
    dispatch_once(&qword_100088950, &stru_10006CF10);
  }
  return (id)qword_100088948;
}

@end