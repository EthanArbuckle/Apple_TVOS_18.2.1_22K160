@interface CSVoiceTriggerJarvisAPEnabledPolicy
+ (id)sharedInstance;
- (BOOL)isPlaybackAudioSessionActive;
- (CSVoiceTriggerJarvisAPEnabledPolicy)init;
- (NSString)clientRecordRoute;
- (void)_addVoiceTriggerHearstAPEnabledPolicy;
- (void)_subscribeEventMonitors;
- (void)setClientRecordRoute:(id)a3;
- (void)setIsPlaybackAudioSessionActive:(BOOL)a3;
- (void)siriClientBehaviorMonitor:(id)a3 activatedAudioSessionWithReason:(unint64_t)a4;
- (void)siriClientBehaviorMonitorAudioDeviceInfoUpdated:(id)a3;
- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3;
@end

@implementation CSVoiceTriggerJarvisAPEnabledPolicy

- (CSVoiceTriggerJarvisAPEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerJarvisAPEnabledPolicy;
  v2 = -[CSVoiceTriggerJarvisAPEnabledPolicy init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isPlaybackAudioSessionActive = 0;
    -[CSVoiceTriggerJarvisAPEnabledPolicy _addVoiceTriggerHearstAPEnabledPolicy]( v2,  "_addVoiceTriggerHearstAPEnabledPolicy");
    -[CSVoiceTriggerJarvisAPEnabledPolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerJarvisAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
  -[CSVoiceTriggerJarvisAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamActivityMonitor sharedInstance]( &OBJC_CLASS___CSAudioStreamActivityMonitor,  "sharedInstance"));
  -[CSVoiceTriggerJarvisAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
  -[CSVoiceTriggerJarvisAPEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriClientBehaviorMonitor sharedInstance](&OBJC_CLASS___CSSiriClientBehaviorMonitor, "sharedInstance"));
  [v7 registerObserver:self];
}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472LL;
  objc_super v5 = sub_10011E90C;
  v6 = &unk_10022EC40;
  objc_copyWeak(&v7, &location);
  -[CSVoiceTriggerJarvisAPEnabledPolicy addConditions:](self, "addConditions:", &v3);
  -[CSVoiceTriggerJarvisAPEnabledPolicy addConditions:](self, "addConditions:", &stru_10022DDA8, v3, v4, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)siriClientBehaviorMonitor:(id)a3 activatedAudioSessionWithReason:(unint64_t)a4
{
  if (a4 - 3 <= 1)
  {
    -[CSVoiceTriggerJarvisAPEnabledPolicy setIsPlaybackAudioSessionActive:]( self,  "setIsPlaybackAudioSessionActive:",  1LL);
    -[CSVoiceTriggerJarvisAPEnabledPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0LL);
  }

- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3
{
}

- (void)siriClientBehaviorMonitorAudioDeviceInfoUpdated:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 recordDeviceInfo]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 route]);
  -[CSVoiceTriggerJarvisAPEnabledPolicy setClientRecordRoute:](self, "setClientRecordRoute:", v5);

  -[CSVoiceTriggerJarvisAPEnabledPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0LL);
}

- (BOOL)isPlaybackAudioSessionActive
{
  return self->_isPlaybackAudioSessionActive;
}

- (void)setIsPlaybackAudioSessionActive:(BOOL)a3
{
  self->_isPlaybackAudioSessionActive = a3;
}

- (NSString)clientRecordRoute
{
  return self->_clientRecordRoute;
}

- (void)setClientRecordRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100280118 != -1) {
    dispatch_once(&qword_100280118, &stru_10022DD48);
  }
  return (id)qword_100280110;
}

@end