@interface CSAudioSessionInfoProvider
+ (id)sharedInstance;
- (CSAudioSessionInfoProvider)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)sessionInfoQueue;
- (unsigned)audioSessionIdForDeviceId:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_audioRouteChanged:(id)a3;
- (void)_deregisterAudioSessionNotifications;
- (void)_handleInterruption:(id)a3;
- (void)_registerAudioRouteChangeNotification;
- (void)_registerAudioSessionNotifications;
- (void)_registerInterruptionNotification;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSessionInfoQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAudioSessionInfoProvider

- (CSAudioSessionInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAudioSessionInfoProvider;
  v2 = -[CSAudioSessionInfoProvider init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioSessionInfoProvider", 0LL);
    sessionInfoQueue = v2->_sessionInfoQueue;
    v2->_sessionInfoQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAudioSessionInfoProvider;
  -[CSAudioSessionInfoProvider dealloc](&v3, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100018AA4;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(sessionInfoQueue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100018A5C;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(sessionInfoQueue, v7);
  }
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CSUtils supportRemoraVoiceTrigger](&OBJC_CLASS___CSUtils, "supportRemoraVoiceTrigger");
  if (v3 && v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForRemoraVoiceTriggerWithDeviceId:",  v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 avvcContextSettings]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVVCSessionFactory sharedInstance](&OBJC_CLASS___AVVCSessionFactory, "sharedInstance"));
    id v15 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForContext:v6 error:&v15]);
    id v9 = v15;

    if (v8)
    {
      unsigned int v10 = [v8 opaqueSessionID];
    }

    else
    {
      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAudioSessionInfoProvider audioSessionIdForDeviceId:]";
        __int16 v18 = 2114;
        v19 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Session Query Failed : %{public}@",  buf,  0x16u);
      }

      unsigned int v10 = 0;
    }
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    unsigned int v10 = [v6 opaqueSessionID];
  }

  return v10;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000188DC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018758;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(sessionInfoQueue, block);
}

- (void)_startMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v3 addObserver:self];

  -[CSAudioSessionInfoProvider _registerAudioSessionNotifications](self, "_registerAudioSessionNotifications");
}

- (void)_stopMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v3 removeObserver:self];

  -[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications](self, "_deregisterAudioSessionNotifications");
}

- (void)_registerInterruptionNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v4 addObserver:self selector:"_handleInterruption:" name:AVAudioSessionInterruptionNotification object:v5];

  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSAudioSessionInfoProvider _registerInterruptionNotification]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : AudioSessionInterruption",  (uint8_t *)&v7,  0xCu);
  }

- (void)_registerAudioRouteChangeNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v4 addObserver:self selector:"_audioRouteChanged:" name:AVAudioSessionRouteChangeNotification object:v5];

  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSAudioSessionInfoProvider _registerAudioRouteChangeNotification]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : AudioSessionRouteChangeNotification",  (uint8_t *)&v7,  0xCu);
  }

- (void)_handleInterruption:(id)a3
{
  id v4 = a3;
  sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000185C8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionInfoQueue, v7);
}

- (void)_audioRouteChanged:(id)a3
{
  id v4 = a3;
  sessionInfoQueue = (dispatch_queue_s *)self->_sessionInfoQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000183F8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(sessionInfoQueue, v7);
}

- (void)_registerAudioSessionNotifications
{
}

- (void)_deregisterAudioSessionNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSAudioSessionInfoProvider _deregisterAudioSessionNotifications]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring AudioSession activities",  (uint8_t *)&v5,  0xCu);
  }

- (OS_dispatch_queue)sessionInfoQueue
{
  return self->_sessionInfoQueue;
}

- (void)setSessionInfoQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FC68 != -1) {
    dispatch_once(&qword_10027FC68, &stru_10022A308);
  }
  return (id)qword_10027FC70;
}

@end