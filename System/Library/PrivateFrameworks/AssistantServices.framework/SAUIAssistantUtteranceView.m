@interface SAUIAssistantUtteranceView
- (BOOL)_adui_should_adui_notifyOthersOfArrival;
- (BOOL)ad_shouldUseExtendedFlowTimeout;
- (void)_adui_notifyOthersOfArrival;
@end

@implementation SAUIAssistantUtteranceView

- (BOOL)_adui_should_adui_notifyOthersOfArrival
{
  return +[ADUserNotificationAnnouncementSpeakingStatePublisher supportsPublishingArrivalForAceObject:]( &OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher,  "supportsPublishingArrivalForAceObject:",  self);
}

- (void)_adui_notifyOthersOfArrival
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher]( &OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher,  "sharedPublisher"));
  [v3 publishObjectHasArrived:self];
}

- (BOOL)ad_shouldUseExtendedFlowTimeout
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAssistantUtteranceView speakableText](self, "speakableText"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAssistantUtteranceView speakableText](self, "speakableText"));
    unsigned int v5 = [v4 isEqualToString:&stru_1004FECA0] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end