@interface CSSiriInCallEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkSiriInCallEnabled;
- (BOOL)isEnabled;
- (CSSiriInCallEnabledMonitor)init;
- (void)_didReceiveSiriInCallChangedInQueue:(BOOL)a3;
- (void)_siriInCallEnabledDidChangeEnabledDidChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSiriInCallEnabledMonitor

- (CSSiriInCallEnabledMonitor)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSSiriInCallEnabledMonitor;
    v4 = -[CSSiriInCallEnabledMonitor init](&v8, "init");
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSSiriInCallEnabledMonitor queue", 0LL);
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
  if (AFDeviceSupportsFullSiriUOD(self, a2)
    && +[AFFeatureFlags isBlushingPhantomEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isBlushingPhantomEnabled"))
  {
    v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSSiriInCallEnabledMonitor _startMonitoringWithQueue:]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s start monitoring Siri in Call settings in AFPreferences",  (uint8_t *)&v6,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10010A6F4,  kAFPreferencesDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDrop);
  }

  self->_isEnabled = -[CSSiriInCallEnabledMonitor _checkSiriInCallEnabled](self, "_checkSiriInCallEnabled");
}

- (void)_stopMonitoring
{
  if (AFDeviceSupportsFullSiriUOD(self, a2)
    && +[AFFeatureFlags isBlushingPhantomEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isBlushingPhantomEnabled"))
  {
    v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "-[CSSiriInCallEnabledMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s stop monitoring Siri Hangup settings in AFPreferences",  (uint8_t *)&v5,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0LL);
  }

- (void)_didReceiveSiriInCallChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10010A6E0;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSSiriInCallEnabledMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)_checkSiriInCallEnabled
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[CSSiriInCallEnabledMonitor _checkSiriInCallEnabled]";
    __int16 v6 = 2114;
    v7 = @"NO";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Siri in Call enabled = %{public}@",  (uint8_t *)&v4,  0x16u);
  }

  return 0;
}

- (void)_siriInCallEnabledDidChangeEnabledDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010A5BC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1002800B8 != -1) {
    dispatch_once(&qword_1002800B8, &stru_10022D730);
  }
  return (id)qword_1002800B0;
}

@end