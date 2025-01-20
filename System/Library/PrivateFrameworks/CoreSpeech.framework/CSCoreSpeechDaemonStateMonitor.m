@interface CSCoreSpeechDaemonStateMonitor
+ (id)sharedInstance;
- (CSCoreSpeechDaemonStateMonitor)init;
- (void)_didReceiveDaemonStateChanged:(unint64_t)a3;
- (void)_notifyObserver:(id)a3 withDaemonState:(unint64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifyDaemonStateChanged:(unint64_t)a3;
@end

@implementation CSCoreSpeechDaemonStateMonitor

- (CSCoreSpeechDaemonStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSCoreSpeechDaemonStateMonitor;
  result = -[CSCoreSpeechDaemonStateMonitor init](&v3, "init");
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

- (void)notifyDaemonStateChanged:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[CSCoreSpeechDaemonStateMonitor notifyDaemonStateChanged:]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Notifying CoreSpeechDaemon launched",  (uint8_t *)&v4,  0xCu);
    }

    notify_post("com.apple.corespeech.corespeechd.launch");
  }

- (void)_startMonitoringWithQueue:(id)a3
{
  int v4 = (dispatch_queue_s *)a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100127B00;
    handler[3] = &unk_10022EA50;
    handler[4] = self;
    notify_register_dispatch("com.apple.corespeech.corespeechd.launch", &self->_notifyToken, v4, handler);
    v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : corespeechd state";
      goto LABEL_6;
    }
  }

  else
  {
    v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring corespeechd state because it was already started";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSCoreSpeechDaemonStateMonitor _stopMonitoring]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : corespeechd state",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_didReceiveDaemonStateChanged:(unint64_t)a3
{
  int v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSCoreSpeechDaemonStateMonitor _didReceiveDaemonStateChanged:]";
    __int16 v9 = 1026;
    int v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s CoreSpeechDaemon state changed to %{public}u",  buf,  0x12u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100127AF0;
  v6[3] = &unk_10022ED40;
  v6[4] = self;
  v6[5] = a3;
  -[CSCoreSpeechDaemonStateMonitor enumerateObservers:](self, "enumerateObservers:", v6);
}

- (void)_notifyObserver:(id)a3 withDaemonState:(unint64_t)a4
{
  id v6 = a3;
  -[CSCoreSpeechDaemonStateMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector(v6, "coreSpeechDaemonStateMonitor:didReceiveStateChanged:") & 1) != 0) {
    [v6 coreSpeechDaemonStateMonitor:self didReceiveStateChanged:a4];
  }
}

+ (id)sharedInstance
{
  if (qword_100280150 != -1) {
    dispatch_once(&qword_100280150, &stru_10022DF28);
  }
  return (id)qword_100280148;
}

@end