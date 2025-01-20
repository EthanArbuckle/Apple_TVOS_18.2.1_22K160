@interface CSCommandControlStreamEventMonitor
+ (id)sharedInstance;
- (BOOL)isStreaming;
- (CSCommandControlStreamEventMonitor)init;
- (void)_notifyStopCommandControl;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)commandControlBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6;
- (void)commandControlBehaviorMonitor:(id)a3 didStopStream:(id)a4;
- (void)commandControlBehaviorMonitor:(id)a3 willStopStream:(id)a4;
@end

@implementation CSCommandControlStreamEventMonitor

- (CSCommandControlStreamEventMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSCommandControlStreamEventMonitor;
  result = -[CSCommandControlStreamEventMonitor init](&v3, "init");
  if (result) {
    result->_isCommandControlStreaming = 0;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSCommandControlBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSCommandControlBehaviorMonitor,  "sharedInstance",  a3));
  [v4 registerObserver:self];

  self->_isCommandControlStreaming = 0;
}

- (void)_stopMonitoring
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSCommandControlBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSCommandControlBehaviorMonitor,  "sharedInstance"));
  [v3 unregisterObserver:self];

  self->_isCommandControlStreaming = 0;
}

- (BOOL)isStreaming
{
  objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCommandControlStreaming = self->_isCommandControlStreaming;
    int v6 = 136315394;
    v7 = "-[CSCommandControlStreamEventMonitor isStreaming]";
    __int16 v8 = 1024;
    BOOL v9 = isCommandControlStreaming;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Fetching CommandControl Listening State: %d",  (uint8_t *)&v6,  0x12u);
  }

  return self->_isCommandControlStreaming;
}

- (void)commandControlBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6
{
  if (a5) {
    self->_BOOL isCommandControlStreaming = 1;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10012CB00;
  v6[3] = &unk_10022EED0;
  v6[4] = self;
  -[CSCommandControlStreamEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6, a4);
}

- (void)commandControlBehaviorMonitor:(id)a3 willStopStream:(id)a4
{
}

- (void)commandControlBehaviorMonitor:(id)a3 didStopStream:(id)a4
{
}

- (void)_notifyStopCommandControl
{
  if (self->_isCommandControlStreaming)
  {
    self->_BOOL isCommandControlStreaming = 0;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10012CAF4;
    v2[3] = &unk_10022EED0;
    v2[4] = self;
    -[CSCommandControlStreamEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v2);
  }

+ (id)sharedInstance
{
  if (qword_100280180 != -1) {
    dispatch_once(&qword_100280180, &stru_10022E068);
  }
  return (id)qword_100280178;
}

@end