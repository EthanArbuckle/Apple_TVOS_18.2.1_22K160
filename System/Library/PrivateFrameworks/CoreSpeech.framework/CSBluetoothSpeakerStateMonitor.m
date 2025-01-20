@interface CSBluetoothSpeakerStateMonitor
+ (id)sharedInstance;
- (BOOL)isActive;
- (CSBluetoothSpeakerStateMonitor)init;
- (OS_dispatch_queue)queue;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_didReceiveBluetoothSpeakerStateChangeNotification:(BOOL)a3;
- (void)_fetchSpeakerStateActiveInfo;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setIsActive:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation CSBluetoothSpeakerStateMonitor

- (CSBluetoothSpeakerStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSBluetoothSpeakerStateMonitor;
  v2 = -[CSBluetoothSpeakerStateMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSBluetoothSpeakerStateMonitor queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isActive = 0;
  }

  return v2;
}

- (void)start
{
}

- (void)_fetchSpeakerStateActiveInfo
{
  dispatch_queue_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient]( &OBJC_CLASS___CSAVVoiceTriggerClientManager,  "sharedVoiceTriggerClient"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001BB0C;
  v9[3] = &unk_10022A4B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  [v4 portStateActiveCompletionBlock:v9];

  dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL);
  if (dispatch_group_wait(v5, v6))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001BBC8;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (BOOL)isActive
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BAF0;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient]( &OBJC_CLASS___CSAVVoiceTriggerClientManager,  "sharedVoiceTriggerClient"));
  char v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_10001B7AC;
  v12 = &unk_10022A4D8;
  objc_copyWeak(&v13, &location);
  [v5 setPortStateChangedBlock:&v9];
  v17[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v17[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v18[0] = &__kCFBooleanTrue;
  v18[1] = &__kCFBooleanTrue;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL,  v9,  v10,  v11,  v12));
  [v5 enableListeningOnPorts:v6 completionBlock:&stru_10022A4F8];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v7 addObserver:self];

  uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : BT Speaker state from AVVC",  buf,  0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_stopMonitoring
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient]( &OBJC_CLASS___CSAVVoiceTriggerClientManager,  "sharedVoiceTriggerClient"));
  [v2 setPortStateChangedBlock:0];
  v7[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v7[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v8[0] = &__kCFBooleanFalse;
  v8[1] = &__kCFBooleanFalse;
  char v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  [v2 enableListeningOnPorts:v3 completionBlock:&stru_10022A518];
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSBluetoothSpeakerStateMonitor _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : BT Speaker state from AVVC",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)_didReceiveBluetoothSpeakerStateChangeNotification:(BOOL)a3
{
  self->_isActive = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001B6B4;
  v3[3] = &unk_10022EED0;
  v3[4] = self;
  -[CSBluetoothSpeakerStateMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  v5[0] = @"AVVoiceTriggerPort_BluetoothSpeaker";
  v5[1] = @"AVVoiceTriggerPort_BuiltinSpeaker";
  v6[0] = &__kCFBooleanTrue;
  v6[1] = &__kCFBooleanTrue;
  char v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient]( &OBJC_CLASS___CSAVVoiceTriggerClientManager,  "sharedVoiceTriggerClient"));
  [v4 enableListeningOnPorts:v3 completionBlock:&stru_10022A538];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FC80 != -1) {
    dispatch_once(&qword_10027FC80, &stru_10022A488);
  }
  return (id)qword_10027FC78;
}

@end