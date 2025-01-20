@interface CSTimerMonitor
+ (id)sharedInstance;
- (BOOL)_isSleepTimer:(id)a3;
- (CSTimerMonitor)init;
- (int64_t)timerState;
- (void)_notifyObserver:(id)a3 timerIsFiringState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_timerDismissed:(id)a3;
- (void)_timerIsFiring:(id)a3;
- (void)_timerStateReset:(id)a3;
- (void)initializeTimerState;
@end

@implementation CSTimerMonitor

- (CSTimerMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSTimerMonitor;
  v2 = -[CSTimerMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSTimerMonitor queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_timerFiringState = 0LL;
  }

  return v2;
}

- (void)initializeTimerState
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerManager timers](self->_timerManager, "timers"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003FFC0;
  v6[3] = &unk_10022C368;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 addSuccessBlock:v6]);
  id v5 = [v4 addFailureBlock:&stru_10022AF18];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSTimerMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }

  -[CSTimerMonitor _stopMonitoring](self, "_stopMonitoring");
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2050000000LL;
  objc_super v6 = (void *)qword_10027FCE8;
  uint64_t v22 = qword_10027FCE8;
  if (!qword_10027FCE8)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v24 = sub_10003FF54;
    v25 = &unk_10022E990;
    v26 = &v19;
    sub_10003FF54((uint64_t)&buf);
    objc_super v6 = (void *)v20[3];
  }

  v7 = v6;
  _Block_object_dispose(&v19, 8);
  v8 = (MTTimerManager *)objc_alloc_init(v7);
  timerManager = self->_timerManager;
  self->_timerManager = v8;

  -[MTTimerManager checkIn](self->_timerManager, "checkIn", v19);
  id v10 = sub_10003FD68();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_timerIsFiring:" name:v11 object:0];
  }

  id v13 = sub_10003FE0C();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:self selector:"_timerDismissed:" name:v14 object:0];
  }

  id v16 = sub_10003FEB0();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:self selector:"_timerStateReset:" name:v17 object:0];
  }

  self->_timerFiringState = 0LL;
}

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[CSTimerMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }

  id v4 = sub_10003FD68();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:v5 object:0];
  }

  id v7 = sub_10003FE0C();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 removeObserver:self name:v8 object:0];
  }

  id v10 = sub_10003FEB0();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 removeObserver:self name:v11 object:0];
  }

  timerManager = self->_timerManager;
  self->_timerManager = 0LL;

  self->_timerFiringState = 0LL;
}

- (BOOL)_isSleepTimer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  id v5 = (void *)qword_10027FD10;
  uint64_t v23 = qword_10027FD10;
  if (!qword_10027FD10)
  {
    objc_super v6 = (void *)sub_10003FCA8();
    id v5 = dlsym(v6, "MTTimerManagerTimersKey");
    v21[3] = (uint64_t)v5;
    qword_10027FD10 = (uint64_t)v5;
  }

  _Block_object_dispose(&v20, 8);
  if (!v5)
  {
    v15 = dlerror();
    abort_report_np("%s", v15);
    __break(1u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:*v5]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) sound]);
        unsigned __int8 v13 = [v12 interruptAudio];

        if ((v13 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_14;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)_timerIsFiring:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v8 = "-[CSTimerMonitor _timerIsFiring:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (!-[CSTimerMonitor _isSleepTimer:](self, "_isSleepTimer:", v4) && self->_timerFiringState != 1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003FC98;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSTimerMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_timerDismissed:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v8 = "-[CSTimerMonitor _timerDismissed:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (self->_timerFiringState != 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003FC88;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSTimerMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_timerStateReset:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v8 = "-[CSTimerMonitor _timerStateReset:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (self->_timerFiringState)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003FC78;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSTimerMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_notifyObserver:(id)a3 timerIsFiringState:(int64_t)a4
{
  id v6 = a3;
  self->_timerFiringState = a4;
  -[CSTimerMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector(v6, "CSTimerMonitor:didReceiveTimerChanged:") & 1) != 0) {
    [v6 CSTimerMonitor:self didReceiveTimerChanged:a4];
  }
}

- (int64_t)timerState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003FC5C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FCE0 != -1) {
    dispatch_once(&qword_10027FCE0, &stru_10022AEF8);
  }
  return (id)qword_10027FCD8;
}

@end