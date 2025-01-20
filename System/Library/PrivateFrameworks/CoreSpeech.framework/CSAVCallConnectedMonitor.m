@interface CSAVCallConnectedMonitor
+ (id)sharedInstance;
- (BOOL)hasConnectedAVCall;
- (CSAVCallConnectedMonitor)init;
- (void)_handleCallActiveDidChangeNotification:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAVCallActiveChange;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
@end

@implementation CSAVCallConnectedMonitor

- (CSAVCallConnectedMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAVCallConnectedMonitor;
  result = -[CSAVCallConnectedMonitor init](&v3, "init");
  if (result) {
    result->_hasConnectedAVCall = 0;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
}

- (void)_handleCallActiveDidChangeNotification:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_CallIsActive]);
  self->_hasConnectedAVCall = [v4 BOOLValue];
}

- (void)_stopMonitoring
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (BOOL)hasConnectedAVCall
{
  return self->_hasConnectedAVCall;
}

- (void)_startObservingAVCallActiveChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_CallIsActiveDidChangeNotification object:0];

  uint64_t v7 = AVSystemController_CallIsActiveDidChangeNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_handleCallActiveDidChangeNotification:" name:AVSystemController_CallIsActiveDidChangeNotification object:0];
}

- (void)_systemControllerDied:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSAVCallConnectedMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s notification = %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  -[CSAVCallConnectedMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAVCallConnectedMonitor _startObservingAVCallActiveChange](self, "_startObservingAVCallActiveChange");
  -[CSAVCallConnectedMonitor _handleCallActiveDidChangeNotification:]( self,  "_handleCallActiveDidChangeNotification:",  0LL);
}

- (void)_startObservingSystemControllerLifecycle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  AVSystemController_ServerConnectionDiedNotification));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v4 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v6 = AVSystemController_ServerConnectionDiedNotification;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v5 addObserver:self selector:"_systemControllerDied:" name:v6 object:v7];
}

+ (id)sharedInstance
{
  if (qword_1002801B0 != -1) {
    dispatch_once(&qword_1002801B0, &stru_10022E2D0);
  }
  return (id)qword_1002801A8;
}

@end