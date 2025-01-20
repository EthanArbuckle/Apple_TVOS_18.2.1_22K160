@interface CSSiriDebugConnection
+ (id)_getFalseRejectBannerCommandWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4;
+ (void)launchSiriDebugAppWithMessage:(id)a3;
+ (void)launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4;
@end

@implementation CSSiriDebugConnection

+ (void)launchSiriDebugAppWithMessage:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild() && CSIsIPhone())
  {
    id v4 = [[AFUIApplicationSiriTaskDeliverer alloc] initWithAppBundleIdentifier:@"com.apple.siri.SiriDebug"];
    id v5 = [[AFSiriTaskmaster alloc] initWithTaskDeliverer:v4];
    id v6 = [[AFSiriDebugUIRequest alloc] initWithMessage:v3 makeAppFrontmost:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000562A4;
    v9[3] = &unk_10022F100;
    id v10 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10005635C;
    v7[3] = &unk_10022B248;
    id v8 = v10;
    [v5 handleSiriRequest:v6 deliveryHandler:v9 completionHandler:v7];
  }
}

+ (void)launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[CSSiriDebugConnection _getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:]( &OBJC_CLASS___CSSiriDebugConnection,  "_getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:",  *(void *)&a4));
  +[CSSiriDebugConnection launchSiriDebugAppWithMessage:]( &OBJC_CLASS___CSSiriDebugConnection,  "launchSiriDebugAppWithMessage:",  v4);
}

+ (id)_getFalseRejectBannerCommandWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", *(void *)&a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%0.1f", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.siri.SiriDebug.FeedbackBanner.NearMiss.Notify?triggeredPhraseId={TRIGGERED_PHRASE_ID}&triggerScore={TRIGGER_SCORE}" stringByReplacingOccurrencesOfString:@"{TRIGGERED_PHRASE_ID}" withString:v5]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"{TRIGGER_SCORE}" withString:v6]);

  return v8;
}

@end