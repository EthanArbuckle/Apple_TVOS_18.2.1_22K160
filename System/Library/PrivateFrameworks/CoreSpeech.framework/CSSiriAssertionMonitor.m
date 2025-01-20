@interface CSSiriAssertionMonitor
+ (CSSiriAssertionMonitor)sharedInstance;
- (BOOL)isEnabled;
- (CSSiriAssertionMonitor)init;
- (void)_notifyObserver:(BOOL)a3;
- (void)_notifyObserverBacklightOn:(BOOL)a3 atHostTime:(unint64_t)a4;
- (void)_stopMonitoring;
- (void)backlightOnAssertionReceived:(BOOL)a3 atHostTime:(unint64_t)a4;
- (void)dealloc;
- (void)disableAssertionReceived;
- (void)enableAssertionReceived;
@end

@implementation CSSiriAssertionMonitor

- (CSSiriAssertionMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSSiriAssertionMonitor;
  v2 = -[CSSiriAssertionMonitor init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_assertionState = 0;
    dispatch_queue_t v4 = dispatch_queue_create("CSSiriAssertionMonitor queue", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSiriAssertionMonitor init]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring: siri assertion enable/disable",  buf,  0xCu);
    }
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSiriAssertionMonitor;
  -[CSSiriAssertionMonitor dealloc](&v3, "dealloc");
}

- (void)_stopMonitoring
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    dispatch_queue_t v4 = "-[CSSiriAssertionMonitor _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring: siri assertion enable/disable",  (uint8_t *)&v3,  0xCu);
  }

- (void)enableAssertionReceived
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100129798;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)disableAssertionReceived
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001296B8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)backlightOnAssertionReceived:(BOOL)a3 atHostTime:(unint64_t)a4
{
}

- (void)_notifyObserver:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100129658;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSSiriAssertionMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserverBacklightOn:(BOOL)a3 atHostTime:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100129608;
  v4[3] = &unk_10022DFC0;
  BOOL v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[CSSiriAssertionMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (BOOL)isEnabled
{
  return self->_assertionState == 2;
}

- (void).cxx_destruct
{
}

+ (CSSiriAssertionMonitor)sharedInstance
{
  if (qword_100280160 != -1) {
    dispatch_once(&qword_100280160, &stru_10022DF98);
  }
  return (CSSiriAssertionMonitor *)(id)qword_100280158;
}

@end