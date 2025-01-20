@interface INBroadcaster
+ (void)broadcastFamilyDidChangeNotification;
@end

@implementation INBroadcaster

+ (void)broadcastFamilyDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, INFamilyDidChangeNotification, 0LL, 0LL, 1u);
}

@end