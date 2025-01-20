@interface CSPhraseSpotterEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkPhraseSpotterEnabled;
- (BOOL)isEnabled;
- (CSPhraseSpotterEnabledMonitor)init;
- (void)_didReceivePhraseSpotterSettingChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_phraseSpotterEnabledDidChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSPhraseSpotterEnabledMonitor

- (CSPhraseSpotterEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSPhraseSpotterEnabledMonitor;
  result = -[CSPhraseSpotterEnabledMonitor init](&v3, "init");
  if (result) {
    result->_isPhraseSpotterEnabled = 0;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10004A5B0,  @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification",  0LL,  CFNotificationSuspensionBehaviorDrop);
  self->_isPhraseSpotterEnabled = -[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled]( self,  "_checkPhraseSpotterEnabled");
}

- (void)_stopMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification",  0LL);
}

- (void)_didReceivePhraseSpotterSettingChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004A59C;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSPhraseSpotterEnabledMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[CSPhraseSpotterEnabledMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector(v6, "CSPhraseSpotterEnabledMonitor:didReceiveEnabled:") & 1) != 0) {
    [v6 CSPhraseSpotterEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (BOOL)isEnabled
{
  return self->_isPhraseSpotterEnabled;
}

- (BOOL)_checkPhraseSpotterEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 phraseSpotterEnabled];

  BOOL v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s PhraseSpotter enabled = %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return v3;
}

- (void)_phraseSpotterEnabledDidChange
{
  BOOL v3 = -[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled](self, "_checkPhraseSpotterEnabled");
  BOOL isPhraseSpotterEnabled = self->_isPhraseSpotterEnabled;
  if (isPhraseSpotterEnabled == v3)
  {
    v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v6 = @"ON";
      if (!isPhraseSpotterEnabled) {
        id v6 = @"OFF";
      }
      int v7 = 136315394;
      v8 = "-[CSPhraseSpotterEnabledMonitor _phraseSpotterEnabledDidChange]";
      __int16 v9 = 2114;
      v10 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s PhraseSpotter is already %{public}@, received duplicated notification!",  (uint8_t *)&v7,  0x16u);
    }
  }

  else
  {
    self->_BOOL isPhraseSpotterEnabled = v3;
    -[CSPhraseSpotterEnabledMonitor _didReceivePhraseSpotterSettingChangedInQueue:]( self,  "_didReceivePhraseSpotterSettingChangedInQueue:",  v3);
  }

+ (id)sharedInstance
{
  if (qword_10027FD78 != -1) {
    dispatch_once(&qword_10027FD78, &stru_10022B178);
  }
  return (id)qword_10027FD70;
}

@end