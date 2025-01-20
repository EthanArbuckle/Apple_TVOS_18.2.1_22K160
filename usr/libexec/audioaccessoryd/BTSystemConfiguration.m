@interface BTSystemConfiguration
+ (BOOL)isBuddyComplete;
+ (BOOL)isFirstUnlocked;
+ (id)addBuddyCompleteObserver:(id)a3;
+ (id)addFirstUnlockObserver:(id)a3;
@end

@implementation BTSystemConfiguration

+ (BOOL)isBuddyComplete
{
  else {
    char HasCompletedInitialRun = 1;
  }
  byte_100237280 = HasCompletedInitialRun;
  v3 = (os_log_s *)qword_10023DCB8;
  if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
    sub_100190AB0(v3);
  }
  return byte_100237280;
}

+ (BOOL)isFirstUnlocked
{
  byte_100237281 = MKBDeviceUnlockedSinceBoot(a1, a2) != 0;
  v2 = (os_log_s *)qword_10023DCB8;
  if (os_log_type_enabled((os_log_t)qword_10023DCB8, OS_LOG_TYPE_DEBUG)) {
    sub_100190B30(v2);
  }
  return byte_100237281;
}

+ (id)addBuddyCompleteObserver:(id)a3
{
  return +[BTStateWatcher monitorBuddyStateWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorBuddyStateWithAction:",  a3);
}

+ (id)addFirstUnlockObserver:(id)a3
{
  return +[BTStateWatcher monitorFirstUnlockWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorFirstUnlockWithAction:",  a3);
}

@end