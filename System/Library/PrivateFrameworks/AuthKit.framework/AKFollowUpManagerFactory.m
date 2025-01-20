@interface AKFollowUpManagerFactory
+ (id)sharedAuthKitFollowupManager;
+ (id)sharedAuthKitFollowupPushDelegate;
@end

@implementation AKFollowUpManagerFactory

+ (id)sharedAuthKitFollowupManager
{
  if (qword_10020F3D8 != -1) {
    dispatch_once(&qword_10020F3D8, &stru_1001C7C90);
  }
  return (id)qword_10020F3D0;
}

+ (id)sharedAuthKitFollowupPushDelegate
{
  return objc_msgSend((id)objc_opt_class(a1, a2), "sharedAuthKitFollowupManager");
}

@end