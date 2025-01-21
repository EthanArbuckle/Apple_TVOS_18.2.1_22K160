@interface BKHIDProximityEventProcessor
- (BKHIDProximityEventProcessor)initWithContext:(id)a3;
- (BOOL)isObjectWithinProximity;
- (BOOL)isProximityDetectionActive;
- (BOOL)shouldSuppressTouchesWhileObjectWithinProximity;
- (id)setObservesProximitySensorDetectionMaskChanges:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_lock_postDetectionMaskChangeToObservers;
- (void)_lock_postSyntheticEventWithDetectionMaskToClients:(unsigned int)a3;
- (void)_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:(unint64_t)a3;
- (void)_locked_postEventWithDetectionMask:(unsigned int)a3 toDestinations:(id)a4 dispatcher:(id)a5 reason:(id)a6;
- (void)_locked_setObjectWithinProximity:(BOOL)a3 notify:(BOOL)a4;
- (void)_locked_updateTouchSuppressionAssertion;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)dealloc;
- (void)setShouldSuppressTouchesWhileObjectWithinProximity:(BOOL)a3;
@end

@implementation BKHIDProximityEventProcessor

- (BKHIDProximityEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = [BKHIDProximityEventProcessor class];
  BKHIDProximityEventProcessor *v5 = [[BKHIDProximityEventProcessor alloc] init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_lock_shouldSuppressTouchesWhileObjectWithinProximity = 1;
    BKSProximityDetectionMaskChangeEvent *v7 = [BKSProximityDetectionMaskChangeEvent build:&stru_1000B6388];
    lock_lastEvent = v6->_lock_lastEvent;
    v6->_lock_lastEvent = (BKSProximityDetectionMaskChangeEvent *)v7;

    BKHIDDomainServiceServer *v9 = [[BKHIDDomainServiceServer alloc] init];
    uint64_t v10 = BKSProximitySensorBSServiceName;
    uint64_t v11 = BKLogUISensor();
    v12 = [v11 autorelease];
    BKProximitySensorServer *v13 = [[BKProximitySensorServer alloc] initWithDelegate:v9 serverTarget:v6 serverProtocol:[BKSProximitySensorServer_IPC class] clientProtocol:[BKSProximitySensorClient_IPC class] serviceName:v10 queue:_dispatch_main_q log:v12 entitlement:BKProximityDetectionEntitlement];
    server = v6->_server;
    v6->_server = v13;

    [location release];
location = v6;
[location retain];
    SLGNotificationActivatedLogger *v15 = [[SLGNotificationActivatedLogger alloc] init];
    SLGActivatableLogger *v16 = [[SLGActivatableLogger alloc] init];
    v17 = [SLGLog sharedInstance];
    id v18 = [v16 initWithLogger:v17];
    SLGNotificationActivatedLogger *v19 = [[SLGNotificationActivatedLogger alloc] initWithLogger:v18];
    studyLog = v6->_studyLog;
    v6->_studyLog = v19;

    [v6->_studyLog addBeginNotification:@"SBStudyLogBeginCameraButtonLogging" endNotification:@"SBStudyLogEndCameraButtonLogging"];
    v21 = v6->_studyLog;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10002A558;
    v26[3] = &unk_1000B63B0;
    [v27 copy];
    [v21 setActivationHandler:v26];
    v22 = v6->_studyLog;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002A600;
    v24[3] = &unk_1000B63B0;
    [v25 copy];
    [v22 setDeactivationHandler:v24];
    [v6->_server activate];
    [v25 release];
    [v27 release];
    [location release];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = [BKHIDProximityEventProcessor class];
  [v3 dealloc];
}

- (BOOL)isObjectWithinProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_objectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isProximityDetectionActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_proximityDetectionActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldSuppressTouchesWhileObjectWithinProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldSuppressTouchesWhileObjectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldSuppressTouchesWhileObjectWithinProximity:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldSuppressTouchesWhileObjectWithinProximity = a3;
  [self _locked_updateTouchSuppressionAssertion];
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *a3;
  uint64_t v11 = BKLogUISensor();
  v12 = v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t ConciseDescription = BKSHIDEventGetConciseDescription(*a3);
    v14 = [ConciseDescription description];
    *(_DWORD *)buf = 138543362;
    v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-> %{public}@", buf, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lastProximitySender = v8;
  self->_lastProximityDispatcher = v9;
  if (-[SLGNotificationActivatedLogger isEnabled](self->_studyLog, "isEnabled"))
  {
    BOOL v16 = IOHIDEventGetIntegerValue(v10, 917504LL) != 0;
    if (self->_studyLogProxState != v16)
    {
      studyLog = self->_studyLog;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_10002A4B8;
      v48[3] = &unk_1000B63D0;
      BOOL v49 = v16;
      [studyLog logBlock:v48 domain:@"com.apple.backboard.hid.proximity"];
      self->_studyLogProxState = v16;
    }
  }

  unsigned int IntegerValue = IOHIDEventGetIntegerValue(v10, 917504LL);
  self->_rawDetectionMask = IntegerValue;
  if (self->_proximityDetectionActive) {
    int v19 = 1088;
  }
  else {
    int v19 = 1024;
  }
  uint64_t v20 = v19 & IntegerValue;
  kdebug_trace(730464696LL, v20, 0LL, 0LL, 0LL);
  v43 = [NSMutableSet set];
  if (self->_modeDetectionMask != (_DWORD)v20)
  {
    v40 = v10;
    id v41 = v9;
    id v42 = v8;
    self->_modeDetectionMask = v20;
    if (self->_proximityDetectionActive) {
      [self _locked_setObjectWithinProximity:(v20 >> 6) & 1 notify:1];
    }
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    v21 = [self->_eventClients allValues];
    id v22 = [v21 countByEnumeratingWithState:v44 objects:v50 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v45;
      do
      {
        id v25 = 0LL;
        do
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v25);
          if (v26) {
            id v27 = (void *)v26[1];
          }
          else {
            id v27 = 0LL;
          }
          if (([v27 unsignedIntValue] & v20) == 0)
          {
            if (v26) {
              v28 = (void *)v26[3];
            }
            else {
              v28 = 0LL;
            }
            id v29 = v28;
            v30 = [NSSet setWithObject:v29];
            if (v26) {
              uint64_t v31 = v26[2];
            }
            else {
              uint64_t v31 = 0LL;
            }
            [self _locked_postEventWithDetectionMask:0LL toDestinations:v30 dispatcher:v31 reason:@"client mask mismatch"];

            [v43 addObject:v29];
            [self->_eventClients removeObjectForKey:(int)[v29 pid]];
          }

          id v25 = (char *)v25 + 1;
        }

        while (v23 != v25);
        id v32 = [v21 countByEnumeratingWithState:v44 objects:v50 count:16];
        id v23 = v32;
      }

      while (v32);
    }

    if ((_DWORD)v20 && self->_proximityDetectionActive)
    {
      [self _lock_postSyntheticEventWithDetectionMaskToClients:v20];
      id v9 = v41;
      id v8 = v42;
      p_lock = &self->_lock;
      uint64_t v10 = v40;
    }

    else
    {
      id v9 = v41;
      id v8 = v42;
      p_lock = &self->_lock;
      uint64_t v10 = v40;
      if (v20 < 0x400)
      {
        if ((_DWORD)v20)
        {
          uint64_t v33 = BKLogUISensor();
          v34 = v33;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            uint64_t v35 = BKSHIDEventGetConciseDescription(v40);
            v36 = [v35 autorelease];
            *(_DWORD *)buf = 138543362;
            v52 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Ignoring %{public}@", buf, 0xCu);
          }
        }
      }

      else
      {
        [self _lock_postSyntheticEventWithDetectionMaskToClients:1024LL];
      }
    }
  }

  if (!self->_rawDetectionMask)
  {
    v37 = (void *)[v9 destinationsForEvent:v10 fromSender:v8];
    if ([v37 count])
    {
      id v38 = [v37 mutableCopy];
      [v38 minusSet:v43];
      [self _locked_postEventWithDetectionMask:0LL toDestinations:v38 dispatcher:v9 reason:@"HID zero mask"];
    }
  }

  [self _locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:IOHIDEventGetTimeStamp(v10)];
  os_unfair_lock_unlock(p_lock);

  return 1LL;
}

- (void)_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:(unint64_t)a3
{
  unsigned int modeDetectionMask = self->_modeDetectionMask;
  int detectionMode = self->_detectionMode;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002A464;
  v9[3] = &unk_1000B63F0;
  v9[4] = a3;
  unsigned int v10 = modeDetectionMask;
  int v11 = detectionMode;
  BKSProximityDetectionMaskChangeEvent *v7 = [BKSProximityDetectionMaskChangeEvent build:v9];
  lock_lastEvent = self->_lock_lastEvent;
  self->_lock_lastEvent = v7;

  [_lock_postDetectionMaskChangeToObservers];
}

- (void)_lock_postDetectionMaskChangeToObservers
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_super v3 = self->_observingProximityConnections;
  [v3 countByEnumeratingWithState:v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v7);
        uint64_t v9 = [self->_server userInfoForConnection:v8];
        unsigned int v10 = (void *)v9;
        if (v9) {
          int v11 = *(void **)(v9 + 8);
        }
        else {
          int v11 = 0LL;
        }
        id v12 = v11;
        unsigned int v13 = [v12 detectionMask];
        unsigned int v14 = [self->_lock_lastEvent detectionMask];

        if (v13 != v14)
        {
          sub_10002A454((uint64_t)v10, self->_lock_lastEvent);
          v15 = [v8 remoteTarget];
          [v15 proximityDetectionMaskDidChange:self->_lock_lastEvent];
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      [v3 countByEnumeratingWithState:v17 objects:v21 count:16];
      id v5 = v16;
    }

    while (v16);
  }
}

- (void)_locked_postEventWithDetectionMask:(unsigned int)a3 toDestinations:(id)a4 dispatcher:(id)a5 reason:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v32 = a6;
  uint64_t v35 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v11 = v9;
  id v12 = v10;
  id obj = v11;
  id v13 = [v11 countByEnumeratingWithState:v37 objects:v47 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    uint64_t v16 = a3;
    __int128 v17 = &AWStartAttentionAwarenessServer_ptr;
    do
    {
      __int128 v18 = 0LL;
      id v33 = v14;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v18);
        uint64_t v20 = mach_absolute_time();
        ProximtyEvent = (const void *)IOHIDEventCreateProximtyEvent(0LL, v20, a3, 0LL);
        IOHIDEventSetIntegerValue(ProximtyEvent, 917504LL, v16);
        id v22 = [v17[322] baseAttributesFromProvider:v19];
        [v22 setProximityDetectionMode:v35->_detectionMode];
        uint64_t v23 = BKSHIDEventSetAttributes(ProximtyEvent, v22);
        uint64_t v24 = BKLogUISensor(v23);
        os_log_s *v25 = [v24 autorelease];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t ConciseDescription = BKSHIDEventGetConciseDescription(ProximtyEvent);
          uint64_t v27 = v16;
          uint64_t v28 = v15;
          id v29 = v17;
          v30 = v12;
          uint64_t v31 = (void *)ConciseDescription;
          *(_DWORD *)buf = 138543874;
          id v42 = v31;
          __int16 v43 = 2114;
          uint64_t v44 = v19;
          __int16 v45 = 2114;
          id v46 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "send prox event:%{public}@ to %{public}@ [%{public}@]",  buf,  0x20u);

          id v12 = v30;
          __int128 v17 = v29;
          uint64_t v15 = v28;
          uint64_t v16 = v27;
          id v14 = v33;
        }

        [v12 postEvent:ProximtyEvent toDestination:v19];
        CFRelease(ProximtyEvent);

        __int128 v18 = (char *)v18 + 1;
      }

      while (v14 != v18);
      id v14 = [obj countByEnumeratingWithState:v37 objects:v47 count:16];
    }

    while (v14);
  }
}

- (void)_locked_updateTouchSuppressionAssertion
{
  BOOL objectWithinProximity = self->_objectWithinProximity;
  if (objectWithinProximity)
  {
    suppressTouchesAssertion = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    id v4 = suppressTouchesAssertion;
    BOOL objectWithinProximity = *((_BYTE *)p_suppressTouchesAssertion - 72) != 0;
    BOOL v7 = suppressTouchesAssertion == 0LL;
    if (*((_BYTE *)p_suppressTouchesAssertion - 72)) {
      BOOL v8 = v4 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      BKHIDEventProcessorRegistry *v9 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v11 = [v9 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      uint64_t v16 = [v11 autorelease];

      uint64_t v12 = [v16 cancelAndSuppressTouchesOnDisplay:0 reason:@"objectWithinProximity"];
      id v13 = *p_suppressTouchesAssertion;
      *p_suppressTouchesAssertion = (BSInvalidatable *)v12;

      return;
    }
  }

  else
  {
    id v14 = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    id v4 = v14;
    BOOL v7 = v14 == 0LL;
  }

  if (!v7 && !objectWithinProximity)
  {
    [v4 invalidate];
    uint64_t v15 = *p_suppressTouchesAssertion;
    *p_suppressTouchesAssertion = 0LL;
  }

- (void)_locked_setObjectWithinProximity:(BOOL)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_objectWithinProximity != v5)
  {
    self->_BOOL objectWithinProximity = v5;
    if (v4)
    {
      int v7 = dword_1000DAC80;
      if (dword_1000DAC80 != -1
        || (notify_register_check("com.apple.backboard.proximity.changed", &dword_1000DAC80),
            int v7 = dword_1000DAC80,
            dword_1000DAC80 != -1))
      {
        notify_set_state(v7, v5);
        notify_post("com.apple.backboard.proximity.changed");
      }
    }

    [self _locked_updateTouchSuppressionAssertion];
  }

- (void)_lock_postSyntheticEventWithDetectionMaskToClients:(unsigned int)a3
{
  id WeakRetained = [self->_lastProximitySender retain];
  id v5 = self->_lastProximityDispatcher;
  __int128 v38 = v5;
  if (!WeakRetained || (uint64_t v6 = v5) == 0LL)
  {
    uint64_t v7 = BKLogUISensor(v5);
    BOOL v8 = [v7 autorelease];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)__int128 v47 = a3;
      *(_WORD *)&v47[4] = 2114;
      *(void *)&v47[6] = v38;
      *(_WORD *)&v47[14] = 2114;
      *(void *)&v47[16] = WeakRetained;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "ignoring synth:0x%X dispatcher:%{public}@ sender:%{public}@",  buf,  0x1Cu);
    }

    uint64_t v6 = v38;
  }

  uint64_t v9 = mach_absolute_time();
  uint64_t ProximtyEvent = IOHIDEventCreateProximtyEvent(0LL, v9, a3, 0LL);
  IOHIDEventSetIntegerValue(ProximtyEvent, 917504LL, a3);
  CFTypeRef cf = (CFTypeRef)ProximtyEvent;
  v36 = WeakRetained;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = [v6 destinationsForEvent:ProximtyEvent fromSender:WeakRetained];
  id v11 = [obj countByEnumeratingWithState:v41 objects:v45 count:16];
  uint64_t v12 = v6;
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        uint64_t v17 = [self->_eventClients objectForKey:[v16 pid]];
        if (v17)
        {
          __int128 v18 = (BKGenericClientEventRecord *)v17;
          uint64_t v19 = (void *)[NSNumber numberWithUnsignedInt:a3];
          objc_setProperty_nonatomic_copy(v18, v20, v19, 8LL);
        }

        else
        {
          v21 = [NSNumber numberWithUnsignedInt:a3];
          id v22 = v12;
          uint64_t v23 = v16;
          BKGenericClientEventRecord *self;
          BKGenericClientEventRecord *v18 = [[BKGenericClientEventRecord alloc] init];
          context = v18->_context;
          v18->_context = v21;
          id v25 = v21;

          eventDispatcher = v18->_eventDispatcher;
          v18->_eventDispatcher = v22;
          uint64_t v27 = v22;

          destination = v18->_destination;
          v18->_destination = v23;

          [self->_eventClients setObject:v18 forKey:[BKSHIDEventDeferringResolution pid]:v23];
        }

        Copy = (const void *)IOHIDEventCreateCopy(0LL, cf);
        BKSHIDEventProximityAttributes *v30 = [BKSHIDEventProximityAttributes baseAttributesFromProvider:v16];
        [v30 setProximityDetectionMode:self->_detectionMode];
        uint64_t v31 = BKSHIDEventSetAttributes(Copy, v30);
        uint64_t v32 = BKLogUISensor(v31);
        os_log_s *v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t ConciseDescription = BKSHIDEventGetConciseDescription(Copy);
          uint64_t v35 = (void *)ConciseDescription;
          *(_DWORD *)buf = 138543618;
          *(void *)__int128 v47 = v35;
          *(_WORD *)&v47[8] = 2114;
          *(void *)&v47[10] = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "send prox event:%{public}@ to %{public}@",  buf,  0x16u);
        }

        uint64_t v12 = v38;
        [v38 postEvent:Copy toDestination:v16];
        CFRelease(Copy);
      }

      id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v13);
  }

  CFRelease(cf);
}

- (id)setObservesProximitySensorDetectionMaskChanges:(id)a3
{
  id v4 = a3;
  id v5 = [BSServiceConnection currentContext];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [self->_server userInfoForConnection:v5];
  unsigned int v8 = [v4 BOOLValue];

  if (!v8)
  {
    sub_10002A454((uint64_t)v7, 0LL);
    [self->_observingProximityConnections removeObject:v5];
    goto LABEL_7;
  }

  if (self->_observingProximityConnections)
  {
    if (v7) {
      goto LABEL_4;
    }
  }

  else
  {
    NSMutableSet *v11 = [[NSMutableSet alloc] init];
    observingProximityConnections = self->_observingProximityConnections;
    self->_observingProximityConnections = v11;

    if (v7) {
      goto LABEL_4;
    }
  }

  BKProximityServerClientRecord *v7 = [[BKProximityServerClientRecord alloc] init];
  [self->_server setUserInfo:v7 forConnection:v5];
LABEL_4:
  if ((-[NSMutableSet containsObject:](self->_observingProximityConnections, "containsObject:", v5) & 1) != 0)
  {
LABEL_7:
    uint64_t v9 = 0LL;
    goto LABEL_8;
  }

  [self->_observingProximityConnections addObject:v5];
  uint64_t v9 = self->_lock_lastEvent;
  sub_10002A454((uint64_t)v7, v9);
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [self->_observingProximityConnections removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end