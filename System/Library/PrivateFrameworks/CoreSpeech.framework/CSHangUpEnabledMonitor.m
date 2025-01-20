@interface CSHangUpEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkCanUseVoiceTriggerDuringCallEnabled;
- (BOOL)isEnabled;
- (CSHangUpEnabledMonitor)init;
- (void)_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:(BOOL)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_voiceTriggerDuringCallEnabledDidChange;
@end

@implementation CSHangUpEnabledMonitor

- (CSHangUpEnabledMonitor)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSHangUpEnabledMonitor;
    v4 = -[CSHangUpEnabledMonitor init](&v8, "init");
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSHangUpEnabledMonitor queue", 0LL);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

      v4->_isEnabled = 0;
    }

    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSHangUpEnabledMonitor _startMonitoringWithQueue:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s start monitoring Siri Hangup settings in VTPreferences",  (uint8_t *)&v6,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100095668,  kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDrop);
  self->_isEnabled = -[CSHangUpEnabledMonitor _checkCanUseVoiceTriggerDuringCallEnabled]( self,  "_checkCanUseVoiceTriggerDuringCallEnabled");
}

- (void)_stopMonitoring
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSHangUpEnabledMonitor _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s stop monitoring Siri Hangup settings in VTPreferences",  (uint8_t *)&v5,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification,  0LL);
}

- (void)_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100095654;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSHangUpEnabledMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)_checkCanUseVoiceTriggerDuringCallEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 canUseVoiceTriggerDuringPhoneCall];

  BOOL v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"NO";
    if (v3) {
      int v5 = @"YES";
    }
    int v7 = 136315394;
    objc_super v8 = "-[CSHangUpEnabledMonitor _checkCanUseVoiceTriggerDuringCallEnabled]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Siri Hangup enabled = %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return v3;
}

- (void)_voiceTriggerDuringCallEnabledDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100095530;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FEA0 != -1) {
    dispatch_once(&qword_10027FEA0, &stru_10022BE88);
  }
  return (id)qword_10027FE98;
}

@end