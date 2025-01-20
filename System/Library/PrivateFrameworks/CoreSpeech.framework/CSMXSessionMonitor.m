@interface CSMXSessionMonitor
+ (id)GetCurrentlyActiveSessionCategory;
+ (id)GetCurrentlyActiveSessionMode;
+ (id)sharedInstance;
- (CSMXSessionMonitor)init;
- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3;
- (void)_querySomeClientIsActive;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAVSystemControllerLifecycle;
- (void)_startObservingSomeClientIsActive;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
@end

@implementation CSMXSessionMonitor

- (CSMXSessionMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSMXSessionMonitor;
  v2 = -[CSMXSessionMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMXSessionMonitorQueue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    objc_super v6 = "-[CSMXSessionMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[CSMXSessionMonitor _startObservingAVSystemControllerLifecycle](self, "_startObservingAVSystemControllerLifecycle");
  -[CSMXSessionMonitor _startObservingSomeClientIsActive](self, "_startObservingSomeClientIsActive");
  -[CSMXSessionMonitor _querySomeClientIsActive](self, "_querySomeClientIsActive");
}

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    objc_super v6 = "-[CSMXSessionMonitor _stopMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];
}

- (void)_startObservingAVSystemControllerLifecycle
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:v5];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  AVSystemController_ServerConnectionDiedNotification));
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  [v3 addObserver:self selector:"_systemControllerDied:" name:AVSystemController_ServerConnectionDiedNotification object:v5];
}

- (void)_startObservingSomeClientIsActive
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:AVSystemController_SomeClientIsActiveDidChangeNotification object:v3];
  uint64_t v6 = AVSystemController_SomeClientIsActiveDidChangeNotification;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  [v4 addObserver:self selector:"_handleSomeClientIsActiveDidChangeNotification:" name:AVSystemController_SomeClientIsActiveDidChangeNotification object:v3];
}

- (void)_systemControllerDied:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "-[CSMXSessionMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s notification = %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  -[CSMXSessionMonitor _startObservingAVSystemControllerLifecycle](self, "_startObservingAVSystemControllerLifecycle");
  -[CSMXSessionMonitor _startObservingSomeClientIsActive](self, "_startObservingSomeClientIsActive");
  -[CSMXSessionMonitor _handleSomeClientIsActiveDidChangeNotification:]( self,  "_handleSomeClientIsActiveDidChangeNotification:",  0LL);
}

- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012F82C;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_querySomeClientIsActive
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012F5AC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1002801A0 != -1) {
    dispatch_once(&qword_1002801A0, &stru_10022E218);
  }
  return (id)qword_100280198;
}

+ (id)GetCurrentlyActiveSessionCategory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_CurrentlyActiveCategoryAttribute]);

  return v3;
}

+ (id)GetCurrentlyActiveSessionMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_CurrentlyActiveModeAttribute]);

  return v3;
}

@end