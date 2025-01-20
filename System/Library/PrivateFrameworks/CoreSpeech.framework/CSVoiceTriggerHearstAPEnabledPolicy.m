@interface CSVoiceTriggerHearstAPEnabledPolicy
+ (id)sharedInstance;
- (BOOL)_isOtherStreamsActiveOnDoAPRoute;
- (CSVoiceTriggerHearstAPEnabledPolicy)init;
- (void)_addVoiceTriggerHearstAPEnabledPolicy;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerHearstAPEnabledPolicy

- (CSVoiceTriggerHearstAPEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerHearstAPEnabledPolicy;
  v2 = -[CSVoiceTriggerHearstAPEnabledPolicy init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerHearstAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]( v2,  "_addVoiceTriggerHearstAPEnabledPolicy");
    -[CSVoiceTriggerHearstAPEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSOpportuneSpeakEventMonitor sharedInstance]( &OBJC_CLASS___CSOpportuneSpeakEventMonitor,  "sharedInstance"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamActivityMonitor sharedInstance]( &OBJC_CLASS___CSAudioStreamActivityMonitor,  "sharedInstance"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  -[CSVoiceTriggerHearstAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);
}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100021A3C;
  v3[3] = &unk_10022A5A0;
  v3[4] = self;
  -[CSVoiceTriggerHearstAPEnabledPolicy addConditions:](self, "addConditions:", v3);
  -[CSVoiceTriggerHearstAPEnabledPolicy addConditions:](self, "addConditions:", &stru_10022A5C0);
  -[CSVoiceTriggerHearstAPEnabledPolicy addConditions:](self, "addConditions:", &stru_10022A5E0);
}

- (BOOL)_isOtherStreamsActiveOnDoAPRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamActivityMonitor sharedInstance]( &OBJC_CLASS___CSAudioStreamActivityMonitor,  "sharedInstance"));
  unsigned __int8 v3 = [v2 hasNonVoiceTriggerStreamsOrStreamHoldersActive];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  id v5 = [v4 hearstRouteStatus];

  if (v5 == (id)1) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (id)sharedInstance
{
  if (qword_10027FC90 != -1) {
    dispatch_once(&qword_10027FC90, &stru_10022A558);
  }
  return (id)qword_10027FC88;
}

@end