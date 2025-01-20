@interface CSSmartSiriVolumeManager
+ (CSSmartSiriVolumeManager)sharedInstance;
- (CSConnectionServiceDelegate)delegate;
- (CSSmartSiriVolumeManager)initWithSamplingRate:(float)a3;
- (CSSmartSiriVolumeProcessor)smartSiriVolume;
- (OS_dispatch_queue)queue;
- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5;
- (void)CSAlarmMonitor:(id)a3 didReceiveAlarmChanged:(int64_t)a4;
- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSTimerMonitor:(id)a3 didReceiveTimerChanged:(int64_t)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveAlarmVolumeChanged:(float)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolume:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)startSmartSiriVolume;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
@end

@implementation CSSmartSiriVolumeManager

- (CSSmartSiriVolumeManager)initWithSamplingRate:(float)a3
{
  if ((+[CSUtils supportSmartVolume](&OBJC_CLASS___CSUtils, "supportSmartVolume") & 1) == 0)
  {
    v11 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Smart Siri Volume not supported on this platform - Bailing out",  buf,  0xCu);
    }

    goto LABEL_14;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeManager;
  v5 = -[CSSmartSiriVolumeManager init](&v22, "init");
  self = v5;
  if (v5)
  {
    uint64_t v7 = CSIsHorseman(v5, v6);
    if ((v7 & 1) != 0 || CSIsHorsemanJunior(v7, v8))
    {
      v9 = objc_alloc(&OBJC_CLASS___CSSmartSiriVolumeContextAware);
      *(float *)&double v10 = a3;
    }

    else
    {
      v12 = objc_alloc(&OBJC_CLASS___CSSmartSiriVolume);
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      v9 = (CSSmartSiriVolumeContextAware *)v12;
    }

    v13 = -[CSSmartSiriVolumeContextAware initWithSamplingRate:](v9, "initWithSamplingRate:", v10);
    smartSiriVolume = self->_smartSiriVolume;
    self->_smartSiriVolume = v13;

    if (self->_smartSiriVolume)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSAlarmMonitor sharedInstance](&OBJC_CLASS___CSAlarmMonitor, "sharedInstance"));
      [v15 addObserver:self];

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSTimerMonitor sharedInstance](&OBJC_CLASS___CSTimerMonitor, "sharedInstance"));
      [v16 addObserver:self];

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSVolumeMonitor sharedInstance](&OBJC_CLASS___CSVolumeMonitor, "sharedInstance"));
      [v17 addObserver:self];

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSAutomaticVolumeEnabledMonitor sharedInstance]( &OBJC_CLASS___CSAutomaticVolumeEnabledMonitor,  "sharedInstance"));
      [v18 addObserver:self];

      goto LABEL_11;
    }

    v20 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      __int16 v25 = 2050;
      double v26 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to initialize Smart Siri Volume with sampling %{public}f",  buf,  0x16u);
    }

- (void)startSmartSiriVolume
{
}

- (void)setAsset:(id)a3
{
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  return -[CSSmartSiriVolumeProcessor getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:]( self->_smartSiriVolume,  "getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:",  a3,  a4,  a5);
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
}

- (void)CSAlarmMonitor:(id)a3 didReceiveAlarmChanged:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSAlarmMonitor:didReceiveAlarmChanged:]";
    __int16 v14 = 1026;
    int v15 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s AlarmState changed to %{public}d",  (uint8_t *)&v12,  0x12u);
  }

  -[CSSmartSiriVolumeProcessor didReceiveAlarmChanged:](self->_smartSiriVolume, "didReceiveAlarmChanged:", a4);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "notifyClientsWithBlock:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_10022D690];
  }
}

- (void)CSTimerMonitor:(id)a3 didReceiveTimerChanged:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSTimerMonitor:didReceiveTimerChanged:]";
    __int16 v14 = 1026;
    int v15 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s TimerState changed to %{public}d",  (uint8_t *)&v12,  0x12u);
  }

  -[CSSmartSiriVolumeProcessor didReceiveTimerChanged:](self->_smartSiriVolume, "didReceiveTimerChanged:", a4);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "notifyClientsWithBlock:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_10022D6B0];
  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveMusicVolumeChanged:]";
    __int16 v15 = 2050;
    double v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s MusicVolume changed to %{public}f",  (uint8_t *)&v13,  0x16u);
  }

  *(float *)&double v8 = a4;
  -[CSSmartSiriVolumeProcessor didReceiveMusicVolumeChanged:]( self->_smartSiriVolume,  "didReceiveMusicVolumeChanged:",  v8);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector(WeakRetained, "notifyClientsWithBlock:");

  if ((v11 & 1) != 0)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 notifyClientsWithBlock:&stru_10022D6D0];
  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveAlarmVolumeChanged:(float)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveAlarmVolumeChanged:]";
    __int16 v15 = 2050;
    double v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s AlarmVolume changed to %{public}f",  (uint8_t *)&v13,  0x16u);
  }

  *(float *)&double v8 = a4;
  -[CSSmartSiriVolumeProcessor didReceiveAlarmVolumeChanged:]( self->_smartSiriVolume,  "didReceiveAlarmVolumeChanged:",  v8);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector(WeakRetained, "notifyClientsWithBlock:");

  if ((v11 & 1) != 0)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 notifyClientsWithBlock:&stru_10022D6F0];
  }
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    uint64_t v7 = kVTEIfirstPassTriggerSource;
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
      unsigned int v10 = [v9 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor];

      if (v10) {
        -[CSSmartSiriVolumeProcessor didDetectKeywordWithResult:]( self->_smartSiriVolume,  "didDetectKeywordWithResult:",  v11);
      }
    }
  }
}

- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[CSSmartSiriVolumeManager CSAutomaticVolumeEnabledMonitor:didReceiveEnabled:]";
    __int16 v14 = 1026;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Automatic Volume State changed to %{public}d",  (uint8_t *)&v12,  0x12u);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "notifyClientsWithBlock:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 notifyClientsWithBlock:&stru_10022D710];
  }
}

- (CSConnectionServiceDelegate)delegate
{
  return (CSConnectionServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSSmartSiriVolumeProcessor)smartSiriVolume
{
  return self->_smartSiriVolume;
}

- (void)setSmartSiriVolume:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSSmartSiriVolumeManager)sharedInstance
{
  if (qword_1002800A8 != -1) {
    dispatch_once(&qword_1002800A8, &stru_10022D670);
  }
  return (CSSmartSiriVolumeManager *)(id)qword_1002800A0;
}

@end