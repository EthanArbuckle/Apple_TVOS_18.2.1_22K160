@interface PBConstantAudioOutputController
+ (BOOL)_postConstantAudioOutputNotificationWithUpdatedState:(unint64_t)a3;
+ (double)_disableAudioPrewarmingIdleTimeout;
- (BOOL)_queue_canEnableConstantAudioOutputForReason:(id)a3;
- (BOOL)_queue_isConstantAudioAlwaysAllowed;
- (BOOL)_queue_isEndpointHDMI;
- (BSAtomicSignal)invalidationSignal;
- (MPAVRoutingController)systemAudioRoutingController;
- (OS_dispatch_queue)queue;
- (PBAttentionAwarenessMonitor)attentionAwarenessMonitor;
- (PBConstantAudioOutputController)init;
- (void)_enableConstantAudioOutputIfNeeded:(BOOL)a3 reason:(id)a4;
- (void)_queue_enableConstantAudioOutputIfNeeded:(BOOL)a3 reason:(id)a4;
- (void)_queue_initialize;
- (void)_queue_invalidate;
- (void)_queue_setConstantAudioOutputEnabled:(BOOL)a3 reason:(id)a4;
- (void)_queue_startControllingConstantAudioOutput:(id)a3;
- (void)_queue_startObserving;
- (void)_queue_stopControllingConstantAudioOutput:(id)a3;
- (void)_queue_stopObserving;
- (void)attentionAwarenessMonitorDidLoseAttention:(id)a3;
- (void)attentionAwarenessMonitorDidRegainAttention:(id)a3;
- (void)dealloc;
- (void)homeAccessoryManager:(id)a3 didChangeOdeonConfigured:(BOOL)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4;
- (void)startControllingConstantAudioOutput:(id)a3;
- (void)stopControllingConstantAudioOutput:(id)a3;
@end

@implementation PBConstantAudioOutputController

- (PBConstantAudioOutputController)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBConstantAudioOutputController;
  v2 = -[PBConstantAudioOutputController init](&v12, "init");
  if (v2)
  {
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS(@"com.apple.PineBoard.ConstantAudioOutputController", 25LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)SerialWithQoS;

    v5 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
    invalidationSignal = v2->_invalidationSignal;
    v2->_invalidationSignal = v5;

    objc_initWeak(&location, v2);
    v7 = (dispatch_queue_s *)v2->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002016B4;
    v9[3] = &unk_1003D0890;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBConstantAudioOutputController;
    -[PBConstantAudioOutputController dealloc](&v4, "dealloc");
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance must be invalidated before being deallocated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292780();
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

- (void)startControllingConstantAudioOutput:(id)a3
{
  id v4 = a3;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance has been invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292828();
    }
    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

  else
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002018B0;
    block[3] = &unk_1003D0300;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    id v6 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)stopControllingConstantAudioOutput:(id)a3
{
  id v4 = a3;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance has been invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002928D0();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100201AF8;
    v9[3] = &unk_1003D0070;
    void v9[4] = self;
    id v10 = v4;
    id v6 = v4;
    v7 = self;
    dispatch_async(queue, v9);
  }

- (void)invalidate
{
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100201C9C;
    block[3] = &unk_1003CFF08;
    void block[4] = self;
    dispatch_sync(queue, block);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003DCDF8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4));
    if (v7)
    {
      id v8 = sub_1000828BC();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v12 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Did set PBDoNotConstantlyOutputSoundDefaultsKey to value: %@",  buf,  0xCu);
      }

      if ([v7 BOOLValue]) {
        -[PBConstantAudioOutputController _enableConstantAudioOutputIfNeeded:reason:]( self,  "_enableConstantAudioOutputIfNeeded:reason:",  0LL,  @"Defaults Override");
      }
    }
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___PBConstantAudioOutputController;
    -[PBConstantAudioOutputController observeValueForKeyPath:ofObject:change:context:]( &v10,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(void))a5;
  -[PBConstantAudioOutputController _enableConstantAudioOutputIfNeeded:reason:]( self,  "_enableConstantAudioOutputIfNeeded:reason:",  0LL,  @"Sleep");
  v6[2](v6);
}

- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
}

- (void)attentionAwarenessMonitorDidLoseAttention:(id)a3
{
  if (!-[PBConstantAudioOutputController _queue_isConstantAudioAlwaysAllowed]( self,  "_queue_isConstantAudioAlwaysAllowed"))
  {
    id v4 = sub_1000828BC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Did lose attention on a non HDMI audio route, stopping constant audio output",  v6,  2u);
    }

    -[PBConstantAudioOutputController _queue_enableConstantAudioOutputIfNeeded:reason:]( self,  "_queue_enableConstantAudioOutputIfNeeded:reason:",  0LL,  @"Attention Lost");
  }

- (void)attentionAwarenessMonitorDidRegainAttention:(id)a3
{
  if (!-[PBConstantAudioOutputController _queue_isConstantAudioAlwaysAllowed]( self,  "_queue_isConstantAudioAlwaysAllowed"))
  {
    id v4 = sub_1000828BC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Did regain attention on a non HDMI audio route, starting constant audio output",  v6,  2u);
    }

    -[PBConstantAudioOutputController _queue_enableConstantAudioOutputIfNeeded:reason:]( self,  "_queue_enableConstantAudioOutputIfNeeded:reason:",  1LL,  @"Attention Regained");
  }

- (void)homeAccessoryManager:(id)a3 didChangeOdeonConfigured:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100201FF0;
  block[3] = &unk_1003D1A50;
  BOOL v9 = a4;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)routingController:(id)a3 pickedRoutesDidChange:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10020214C;
  v6[3] = &unk_1003D0890;
  objc_copyWeak(&v7, &location);
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_queue_initialize
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPAVOutputDeviceRoutingDataSource);
  id v4 = -[MPAVRoutingController initWithDataSource:name:]( objc_alloc(&OBJC_CLASS___MPAVRoutingController),  "initWithDataSource:name:",  v3,  @"com.apple.PineBoard.ConstantAudioOutputController.systemAudio");
  queue_systemAudioRoutingController = self->_queue_systemAudioRoutingController;
  self->_queue_systemAudioRoutingController = v4;

  -[MPAVRoutingController setDelegate:](self->_queue_systemAudioRoutingController, "setDelegate:", self);
  [(id)objc_opt_class(self) _disableAudioPrewarmingIdleTimeout];
  id v7 = -[PBAttentionAwarenessMonitor initWithTimeout:observerQueue:]( objc_alloc(&OBJC_CLASS___PBAttentionAwarenessMonitor),  "initWithTimeout:observerQueue:",  self->_queue,  v6);
  queue_attentionAwarenessMonitor = self->_queue_attentionAwarenessMonitor;
  self->_queue_attentionAwarenessMonitor = v7;

  -[PBConstantAudioOutputController _queue_startObserving](self, "_queue_startObserving");
}

- (void)_queue_invalidate
{
}

- (void)_queue_startObserving
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  [v3 addObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeAccessoryManager sharedInstance](&OBJC_CLASS___PBHomeAccessoryManager, "sharedInstance"));
  [v4 addObserver:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v5 addObserver:self forKeyPath:@"_PBDoNotConstantlyOutputSoundDefaultsKey" options:1 context:&off_1003DCDF8];
}

- (void)_queue_stopObserving
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeAccessoryManager sharedInstance](&OBJC_CLASS___PBHomeAccessoryManager, "sharedInstance"));
  [v3 removeObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  [v4 removeObserver:self];

  -[PBAttentionAwarenessMonitor removeObserver:](self->_queue_attentionAwarenessMonitor, "removeObserver:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v5 removeObserver:self forKeyPath:@"_PBDoNotConstantlyOutputSoundDefaultsKey" context:&off_1003DCDF8];
}

- (void)_queue_startControllingConstantAudioOutput:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    queue_attentionAwarenessMonitor = self->_queue_attentionAwarenessMonitor;
    id v9 = 0LL;
    unsigned int v6 = -[PBAttentionAwarenessMonitor resumeWithError:](queue_attentionAwarenessMonitor, "resumeWithError:", &v9);
    id v7 = v9;
    if (v6)
    {
      -[PBAttentionAwarenessMonitor addObserver:](self->_queue_attentionAwarenessMonitor, "addObserver:", self);
      -[PBConstantAudioOutputController _queue_enableConstantAudioOutputIfNeeded:reason:]( self,  "_queue_enableConstantAudioOutputIfNeeded:reason:",  1LL,  @"Client Start");
      v4[2](v4, 1LL, 0LL);
    }

    else
    {
      ((void (**)(id, uint64_t, id))v4)[2](v4, 0LL, v7);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292978();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)_queue_stopControllingConstantAudioOutput:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    queue_attentionAwarenessMonitor = self->_queue_attentionAwarenessMonitor;
    id v9 = 0LL;
    unsigned int v6 = -[PBAttentionAwarenessMonitor suspendWithError:](queue_attentionAwarenessMonitor, "suspendWithError:", &v9);
    id v7 = v9;
    if (v6)
    {
      -[PBAttentionAwarenessMonitor removeObserver:](self->_queue_attentionAwarenessMonitor, "removeObserver:", self);
      -[PBConstantAudioOutputController _queue_enableConstantAudioOutputIfNeeded:reason:]( self,  "_queue_enableConstantAudioOutputIfNeeded:reason:",  0LL,  @"Client Stop");
      v4[2](v4, 1LL, 0LL);
    }

    else
    {
      ((void (**)(id, uint64_t, id))v4)[2](v4, 0LL, v7);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292A20();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)_enableConstantAudioOutputIfNeeded:(BOOL)a3 reason:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002026EC;
  v9[3] = &unk_1003D96D0;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_queue_enableConstantAudioOutputIfNeeded:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v7 = v4
    && -[PBConstantAudioOutputController _queue_canEnableConstantAudioOutputForReason:]( self,  "_queue_canEnableConstantAudioOutputForReason:",  v6);
  -[PBConstantAudioOutputController _queue_setConstantAudioOutputEnabled:reason:]( self,  "_queue_setConstantAudioOutputEnabled:reason:",  v7,  v6);
}

- (BOOL)_queue_canEnableConstantAudioOutputForReason:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v6 = [v5 powerState];

  if (v6 == (id)1)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v8 = [v7 BOOLForKey:@"_PBDoNotConstantlyOutputSoundDefaultsKey"];

    if (v8)
    {
      id v9 = sub_1000828BC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 134217984;
        id v17 = v4;
        id v11 = "PBDoNotConstantlyOutputSoundDefaultsKey -- Ignoring request to enable constant audio for %public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, 0xCu);
      }
    }

    else
    {
      if (!-[PBAttentionAwarenessMonitor isAttentionLost](self->_queue_attentionAwarenessMonitor, "isAttentionLost")
        || -[PBConstantAudioOutputController _queue_isConstantAudioAlwaysAllowed]( self,  "_queue_isConstantAudioAlwaysAllowed"))
      {
        BOOL v13 = 1;
        goto LABEL_9;
      }

      id v15 = sub_1000828BC();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 134217984;
        id v17 = v4;
        id v11 = "Attention awareness is lost, ignoring request to enable constant audio for %public}@";
        goto LABEL_7;
      }
    }
  }

  else
  {
    id v12 = sub_1000828BC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543362;
      id v17 = v4;
      id v11 = "%{public}@ cannot enable constant audio output when the device is not awake";
      goto LABEL_7;
    }
  }

  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)_queue_isEndpointHDMI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoutingController pickedRoutes](self->_queue_systemAudioRoutingController, "pickedRoutes"));
  unsigned __int8 v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &stru_1003DCE20);

  return v3;
}

- (BOOL)_queue_isConstantAudioAlwaysAllowed
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"_PBConstantAudioAlwaysAllowedOverrideDefaultsKey"]);

  if (v4) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = -[PBConstantAudioOutputController _queue_isEndpointHDMI](self, "_queue_isEndpointHDMI");
  }
  BOOL v6 = v5;

  return v6;
}

- (void)_queue_setConstantAudioOutputEnabled:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_queue_constantAudioOutputEnabled != v4)
  {
    unsigned int v7 = [(id)objc_opt_class(self) _postConstantAudioOutputNotificationWithUpdatedState:v4];
    id v8 = sub_1000828BC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        int v11 = 67109634;
        BOOL v12 = v4;
        __int16 v13 = 2112;
        id v14 = v6;
        __int16 v15 = 1024;
        unsigned int v16 = !-[PBConstantAudioOutputController _queue_isConstantAudioAlwaysAllowed]( self,  "_queue_isConstantAudioAlwaysAllowed");
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Constant audio set to: %i, for reason: %@. Attention heuristics enabled: %d",  (uint8_t *)&v11,  0x18u);
      }

      self->_queue_constantAudioOutputEnabled = v4;
    }

    else
    {
      if (v10)
      {
        int v11 = 67109634;
        BOOL v12 = v4;
        __int16 v13 = 2112;
        id v14 = v6;
        __int16 v15 = 1024;
        unsigned int v16 = !-[PBConstantAudioOutputController _queue_isConstantAudioAlwaysAllowed]( self,  "_queue_isConstantAudioAlwaysAllowed");
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to set constant audio to: %i, for reason: %@. Attention heuristics enabled: %d",  (uint8_t *)&v11,  0x18u);
      }
    }
  }
}

+ (BOOL)_postConstantAudioOutputNotificationWithUpdatedState:(unint64_t)a3
{
  int out_token = 0;
  BOOL v4 = 0;
  if (!notify_register_check("com.apple.appletv.audiostart", &out_token))
  {
    if (notify_set_state(out_token, a3)) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = notify_post("com.apple.appletv.audiostart") == 0;
    }
    notify_cancel(out_token);
  }

  return v4;
}

+ (double)_disableAudioPrewarmingIdleTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 doubleForKey:@"_PBDisableAudioPrewarmingIdleTimeoutDefaultsKey"];
  double v4 = v3;

  double result = 10.0;
  if (v4 > 0.0) {
    return v4;
  }
  return result;
}

- (MPAVRoutingController)systemAudioRoutingController
{
  return self->_queue_systemAudioRoutingController;
}

- (PBAttentionAwarenessMonitor)attentionAwarenessMonitor
{
  return self->_queue_attentionAwarenessMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BSAtomicSignal)invalidationSignal
{
  return self->_invalidationSignal;
}

- (void).cxx_destruct
{
}

@end