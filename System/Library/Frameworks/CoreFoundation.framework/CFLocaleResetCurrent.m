@interface CFLocaleResetCurrent
@end

@implementation CFLocaleResetCurrent

void ____CFLocaleResetCurrent_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification( LocalCenter,  @"kCFLocaleCurrentLocaleDidChangeNotification-4",  0LL,  0LL,  1u);
  CFNotificationCenterPostNotification( LocalCenter,  @"kCFLocaleCurrentLocaleDidChangeNotification-2",  0LL,  0LL,  1u);
  CFNotificationCenterPostNotification(LocalCenter, @"kCFLocaleCurrentLocaleDidChangeNotification", 0LL, 0LL, 1u);
}

@end