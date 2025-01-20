@interface ADApplicationStateChangeEventListener
- (ADApplicationStateChangeEventListener)init;
- (void)applicationStateChanged:(id)a3;
- (void)dealloc;
@end

@implementation ADApplicationStateChangeEventListener

- (ADApplicationStateChangeEventListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADApplicationStateChangeEventListener;
  v2 = -[ADApplicationStateChangeEventListener init](&v9, "init");
  if (v2)
  {
    gADEventListenerLogObject = (uint64_t)os_log_create("com.apple.osanalytics.aggd_event_listener", "default");
    v2->_activeBundles = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v2->_session_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ADSessionSync", v3);
    v4 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
    v2->_appStateMonitor = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_2174;
    v8[3] = &unk_4190;
    v8[4] = v2;
    -[BKSApplicationStateMonitor setHandler:](v4, "setHandler:", v8);
    session_queue = (dispatch_queue_s *)v2->_session_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_21D0;
    v7[3] = &unk_41B8;
    v7[4] = v2;
    notify_register_dispatch("com.apple.session.dump", (int *)&unk_5068, session_queue, v7);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_session_queue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADApplicationStateChangeEventListener;
  -[ADApplicationStateChangeEventListener dealloc](&v3, "dealloc");
}

- (void)applicationStateChanged:(id)a3
{
  uint64_t v5 = mach_absolute_time();
  double v6 = *(double *)&qword_5070;
  if (*(double *)&qword_5070 == 0.0)
  {
    mach_timebase_info(&info);
    LODWORD(v7) = info.numer;
    LODWORD(v8) = info.denom;
    double v6 = (double)v7 / (double)v8 * 0.000000001;
    *(double *)&qword_5070 = v6;
  }

  id v9 = [a3 objectForKey:BKSApplicationStateProcessIDKey];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    uint64_t v11 = (uint64_t)[v9 intValue];
  }
  else {
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  uint64_t v12 = BKSApplicationStateDisplayIDKey;
  id v13 = [a3 objectForKey:BKSApplicationStateDisplayIDKey];
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    if ([v13 isEqualToString:@"com.apple.webapp"] && (v11 & 0x80000000) == 0) {
      id v13 = objc_msgSend( -[BKSApplicationStateMonitor applicationInfoForPID:]( self->_appStateMonitor,  "applicationInfoForPID:",  v11),  "objectForKeyedSubscript:",  v12);
    }
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    {
      id v16 = [a3 objectForKey:BKSApplicationStateKey];
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        double v18 = v6 * (double)v5;
        unsigned int v19 = [v16 intValue];
        if (v19 == 32) {
          int v20 = 4;
        }
        else {
          int v20 = v19;
        }
        [a3 objectForKey:BKSApplicationStateExtensionKey];
        session_queue = self->_session_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_24CC;
        block[3] = &unk_41E0;
        block[4] = self;
        block[5] = v13;
        *(double *)&block[6] = v18;
        int v23 = v20;
        int v24 = v11;
        dispatch_async((dispatch_queue_t)session_queue, block);
      }
    }
  }

@end