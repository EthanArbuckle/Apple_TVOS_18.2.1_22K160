@interface SAUISayIt
- (BOOL)_adui_shouldNotifyOthersOfArrival;
- (void)_adui_notifyOthersOfArrival;
@end

@implementation SAUISayIt

- (BOOL)_adui_shouldNotifyOthersOfArrival
{
  return +[ADUserNotificationAnnouncementSpeakingStatePublisher supportsPublishingArrivalForAceObject:]( &OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher,  "supportsPublishingArrivalForAceObject:",  self);
}

- (void)_adui_notifyOthersOfArrival
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher]( &OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher,  "sharedPublisher"));
  [v3 publishObjectHasArrived:self];
}

@end