@interface CSAlarmMonitor
+ (id)sharedInstance;
- (CSAlarmMonitor)init;
- (int64_t)alarmState;
- (void)_alarmDismissed:(id)a3;
- (void)_alarmIsFiring:(id)a3;
- (void)_alarmStateReset:(id)a3;
- (void)_notifyObserver:(id)a3 alarmIsFiringState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)initializeAlarmState;
@end

@implementation CSAlarmMonitor

- (CSAlarmMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAlarmMonitor;
  v2 = -[CSAlarmMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAlarmMonitor queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_alarmFiringState = 0LL;
  }

  return v2;
}

- (void)initializeAlarmState
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager alarms](self->_alarmManager, "alarms"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B1894;
  v6[3] = &unk_10022C368;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 addSuccessBlock:v6]);
  id v5 = [v4 addFailureBlock:&stru_10022C3A8];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSAlarmMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }

  -[CSAlarmMonitor _stopMonitoring](self, "_stopMonitoring");
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2050000000LL;
  objc_super v6 = (void *)qword_10027FF20;
  uint64_t v22 = qword_10027FF20;
  if (!qword_10027FF20)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v24 = sub_1000B1828;
    v25 = &unk_10022E990;
    v26 = &v19;
    sub_1000B1828((uint64_t)&buf);
    objc_super v6 = (void *)v20[3];
  }

  v7 = v6;
  _Block_object_dispose(&v19, 8);
  v8 = (MTAlarmManager *)objc_alloc_init(v7);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v8;

  -[MTAlarmManager checkIn](self->_alarmManager, "checkIn", v19);
  id v10 = sub_1000B157C();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_alarmIsFiring:" name:v11 object:0];
  }

  id v13 = sub_1000B1620();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:self selector:"_alarmDismissed:" name:v14 object:0];
  }

  id v16 = sub_1000B16C4();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:self selector:"_alarmStateReset:" name:v17 object:0];
  }

  self->_alarmFiringState = 0LL;
}

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[CSAlarmMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }

  id v4 = sub_1000B157C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:v5 object:0];
  }

  id v7 = sub_1000B1620();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 removeObserver:self name:v8 object:0];
  }

  id v10 = sub_1000B16C4();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 removeObserver:self name:v11 object:0];
  }

  alarmManager = self->_alarmManager;
  self->_alarmManager = 0LL;

  self->_alarmFiringState = 0LL;
}

- (void)_alarmIsFiring:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    v8 = "-[CSAlarmMonitor _alarmIsFiring:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (self->_alarmFiringState != 1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000B156C;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSAlarmMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_alarmDismissed:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    v8 = "-[CSAlarmMonitor _alarmDismissed:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (self->_alarmFiringState != 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000B155C;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSAlarmMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_alarmStateReset:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    v8 = "-[CSAlarmMonitor _alarmStateReset:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %@", buf, 0x16u);
  }

  if (self->_alarmFiringState)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000B154C;
    v6[3] = &unk_10022EED0;
    v6[4] = self;
    -[CSAlarmMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
  }
}

- (void)_notifyObserver:(id)a3 alarmIsFiringState:(int64_t)a4
{
  id v6 = a3;
  self->_alarmFiringState = a4;
  -[CSAlarmMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector(v6, "CSAlarmMonitor:didReceiveAlarmChanged:") & 1) != 0) {
    [v6 CSAlarmMonitor:self didReceiveAlarmChanged:a4];
  }
}

- (int64_t)alarmState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B1530;
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
  if (qword_10027FF18 != -1) {
    dispatch_once(&qword_10027FF18, &stru_10022C340);
  }
  return (id)qword_10027FF10;
}

@end