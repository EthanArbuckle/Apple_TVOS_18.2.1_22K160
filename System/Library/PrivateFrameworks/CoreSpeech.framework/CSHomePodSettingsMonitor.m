@interface CSHomePodSettingsMonitor
+ (id)sharedInstance;
- (BOOL)disableAssistantAssertion;
- (BOOL)shouldAudioMonitoringRecording;
- (BOOL)shouldVoiceTriggerRun;
- (BOOL)voiceTriggerAssertion;
- (HPSAccessorySettingService)accessorySettingsService;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)didUpdateSetting:(id)a3 forKeyPath:(id)a4;
- (void)setAccessorySettingsService:(id)a3;
- (void)setDisableAssistantAssertion:(BOOL)a3;
- (void)setVoiceTriggerAssertion:(BOOL)a3;
@end

@implementation CSHomePodSettingsMonitor

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSHomePodSettingsMonitor _startMonitoringWithQueue:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : HomePodSettings",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2050000000LL;
  v6 = (void *)qword_10027FDD0;
  uint64_t v20 = qword_10027FDD0;
  if (!qword_10027FDD0)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v22 = sub_10005B52C;
    v23 = &unk_10022E990;
    v24 = &v17;
    sub_10005B52C((uint64_t)&buf);
    v6 = (void *)v18[3];
  }

  v7 = v6;
  _Block_object_dispose(&v17, 8);
  id v8 = [[v7 alloc] initWithDelegate:self];
  -[CSHomePodSettingsMonitor setAccessorySettingsService:](self, "setAccessorySettingsService:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSHomePodSettingsMonitor accessorySettingsService](self, "accessorySettingsService"));
  id v10 = sub_10005B30C();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005B598;
  v16[3] = &unk_10022B3E8;
  v16[4] = self;
  [v9 settingForKeyPath:v11 completionHandler:v16];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSHomePodSettingsMonitor accessorySettingsService](self, "accessorySettingsService"));
  id v13 = sub_10005B3B0();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10005B6CC;
  v15[3] = &unk_10022B3E8;
  v15[4] = self;
  [v12 settingForKeyPath:v14 completionHandler:v15];
}

- (void)_stopMonitoring
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSHomePodSettingsMonitor _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : HomePod voiceTriggerAssertion",  (uint8_t *)&v4,  0xCu);
  }

  -[CSHomePodSettingsMonitor setAccessorySettingsService:](self, "setAccessorySettingsService:", 0LL);
}

- (void)setVoiceTriggerAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_voiceTriggerAssertion = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"not taken";
    if (v3) {
      v6 = @"taken";
    }
    *(_DWORD *)__int128 buf = 136315394;
    v9 = "-[CSHomePodSettingsMonitor setVoiceTriggerAssertion:]";
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s HomePod voiceTriggerAssertion = %{public}@",  buf,  0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005B520;
  v7[3] = &unk_10022EED0;
  v7[4] = self;
  -[CSHomePodSettingsMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v7);
}

- (void)setDisableAssistantAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableAssistantAssertion = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"not taken";
    if (v3) {
      v6 = @"taken";
    }
    *(_DWORD *)__int128 buf = 136315394;
    v9 = "-[CSHomePodSettingsMonitor setDisableAssistantAssertion:]";
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s HomePod disableAssistantAssertion = %{public}@",  buf,  0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005B514;
  v7[3] = &unk_10022EED0;
  v7[4] = self;
  -[CSHomePodSettingsMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v7);
}

- (BOOL)shouldVoiceTriggerRun
{
  if (-[CSHomePodSettingsMonitor voiceTriggerAssertion](self, "voiceTriggerAssertion")) {
    return 0;
  }
  else {
    return !-[CSHomePodSettingsMonitor disableAssistantAssertion](self, "disableAssistantAssertion");
  }
}

- (BOOL)shouldAudioMonitoringRecording
{
  return !-[CSHomePodSettingsMonitor disableAssistantAssertion](self, "disableAssistantAssertion");
}

- (void)didUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = v6;
  if (v16)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 keyPath]);
    id v9 = sub_10005B30C();
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    unsigned int v11 = [v8 isEqualToString:v10];

    if (v11) {
      -[CSHomePodSettingsMonitor setVoiceTriggerAssertion:]( self,  "setVoiceTriggerAssertion:",  [v16 BOOLeanValue]);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v16 keyPath]);
    id v13 = sub_10005B3B0();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned int v15 = [v12 isEqualToString:v14];

    if (v15) {
      -[CSHomePodSettingsMonitor setDisableAssistantAssertion:]( self,  "setDisableAssistantAssertion:",  [v16 BOOLeanValue]);
    }
  }
}

- (HPSAccessorySettingService)accessorySettingsService
{
  return self->_accessorySettingsService;
}

- (void)setAccessorySettingsService:(id)a3
{
}

- (BOOL)voiceTriggerAssertion
{
  return self->_voiceTriggerAssertion;
}

- (BOOL)disableAssistantAssertion
{
  return self->_disableAssistantAssertion;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FDC8 != -1) {
    dispatch_once(&qword_10027FDC8, &stru_10022B3C0);
  }
  return (id)qword_10027FDC0;
}

@end