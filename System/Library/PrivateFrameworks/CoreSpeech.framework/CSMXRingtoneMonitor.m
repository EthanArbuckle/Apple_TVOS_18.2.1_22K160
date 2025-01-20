@interface CSMXRingtoneMonitor
+ (id)sharedInstance;
- (BOOL)isAnyRingtoneCurrentlyPlaying;
- (CSMXRingtoneMonitor)init;
- (void)_cancelTimeoutTimer;
- (void)_handleEndRingtone;
- (void)_handleStartRingtone;
- (void)_notifyObserversOfRingtoneChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startTimeoutTimer;
- (void)_stopMonitoring;
- (void)_timerCallback;
- (void)mxSessionMonitorSomeClientWentActive:(id)a3;
- (void)setIsAnyRingtoneCurrentlyPlaying:(BOOL)a3;
@end

@implementation CSMXRingtoneMonitor

- (CSMXRingtoneMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSMXRingtoneMonitor;
  v2 = -[CSMXRingtoneMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMXRingtoneMonitorQueue", 0LL);
    eventMonitorQueue = v2->_eventMonitorQueue;
    v2->_eventMonitorQueue = (OS_dispatch_queue *)v3;

    -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](v2, "setIsAnyRingtoneCurrentlyPlaying:", 0LL);
  }

  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXSessionMonitor sharedInstance](&OBJC_CLASS___CSMXSessionMonitor, "sharedInstance"));
  [v5 addObserver:self];
}

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    int v6 = "-[CSMXRingtoneMonitor _stopMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXSessionMonitor sharedInstance](&OBJC_CLASS___CSMXSessionMonitor, "sharedInstance"));
  [v4 removeObserver:self];
}

- (void)mxSessionMonitorSomeClientWentActive:(id)a3
{
  id v4 = a3;
  eventMonitorQueue = (dispatch_queue_s *)self->_eventMonitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006C3A8;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(eventMonitorQueue, v7);
}

- (void)_handleStartRingtone
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSMXRingtoneMonitor _handleStartRingtone]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s _handleStartRingtone : Set isRingtone",  (uint8_t *)&v4,  0xCu);
  }

  -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](self, "setIsAnyRingtoneCurrentlyPlaying:", 1LL);
  -[CSMXRingtoneMonitor _startTimeoutTimer](self, "_startTimeoutTimer");
  -[CSMXRingtoneMonitor _notifyObserversOfRingtoneChange](self, "_notifyObserversOfRingtoneChange");
}

- (void)_handleEndRingtone
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSMXRingtoneMonitor _handleEndRingtone]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s _handleEndRingtone : Reset isRingtone",  (uint8_t *)&v4,  0xCu);
  }

  -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](self, "setIsAnyRingtoneCurrentlyPlaying:", 0LL);
  -[CSMXRingtoneMonitor _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  -[CSMXRingtoneMonitor _notifyObserversOfRingtoneChange](self, "_notifyObserversOfRingtoneChange");
}

- (void)_timerCallback
{
  eventMonitorQueue = (dispatch_queue_s *)self->_eventMonitorQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C2EC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(eventMonitorQueue, block);
}

- (void)_cancelTimeoutTimer
{
  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer) {
    -[NSTimer invalidate](ringtoneTimeoutTimer, "invalidate");
  }
}

- (void)_startTimeoutTimer
{
  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer) {
    -[NSTimer invalidate](ringtoneTimeoutTimer, "invalidate");
  }
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startTimeoutTimer]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C294;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_notifyObserversOfRingtoneChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006C288;
  v2[3] = &unk_10022EED0;
  v2[4] = self;
  -[CSMXRingtoneMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v2);
}

- (BOOL)isAnyRingtoneCurrentlyPlaying
{
  return self->_isAnyRingtoneCurrentlyPlaying;
}

- (void)setIsAnyRingtoneCurrentlyPlaying:(BOOL)a3
{
  self->_isAnyRingtoneCurrentlyPlaying = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FE08 != -1) {
    dispatch_once(&qword_10027FE08, &stru_10022B6E8);
  }
  return (id)qword_10027FE00;
}

@end