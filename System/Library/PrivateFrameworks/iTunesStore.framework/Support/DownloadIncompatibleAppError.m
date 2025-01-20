@interface DownloadIncompatibleAppError
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation DownloadIncompatibleAppError

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v4);
  id v5 = [(id)ISDeviceIncompatibleAppErrorWithAppTitle(self->super._downloadTitle) localizedFailureReason];
  if (v5) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v5);
  }
  id v6 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadIncompatibleAppError;
  return -[DownloadError copyWithZone:](&v4, "copyWithZone:", a3);
}

@end