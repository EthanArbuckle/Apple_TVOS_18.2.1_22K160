@interface AFSiriNotificationRequest
- (AFSiriNotificationRequest)initWithNotifications:(id)a3 sourceAppId:(id)a4;
@end

@implementation AFSiriNotificationRequest

- (AFSiriNotificationRequest)initWithNotifications:(id)a3 sourceAppId:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 firstObject]);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AFSiriNotificationRequest;
  v8 = -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:]( &v10,  "initWithUserNotification:sourceAppId:",  v7,  v6);

  return v8;
}

@end