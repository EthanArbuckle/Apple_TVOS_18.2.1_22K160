@interface ZWAppleTVEventProcessor
- (AXEventData)zoomSenderIdentifierData;
- (AXThreadTimer)micButtonTimer;
- (AXThreadTimer)selectButtonTimer;
- (AXThreadTimer)twoFingerTapTimer;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleGameControllerEvent:(id)a3;
- (BOOL)_handleMicButtonEvent:(id)a3;
- (BOOL)_handleSelectButtonEvent:(id)a3;
- (BOOL)_handleTouchEvent:(id)a3;
- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3;
- (BOOL)waitingForLiftDispatch;
- (CGPoint)offsetForAutopanner:(id)a3;
- (NSMutableArray)eventsToDispatch;
- (NSMutableArray)micEventRepostQueue;
- (NSMutableArray)selectEventRepostQueue;
- (NSMutableArray)touchEventRepostQueue;
- (ZWAppleTVEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (id)_debugStatus;
- (unint64_t)_senderIDForRepostingOfEvent:(id)a3;
- (void)_dispatchNextEvent;
- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4;
- (void)setEventsToDispatch:(id)a3;
- (void)setMicButtonTimer:(id)a3;
- (void)setMicEventRepostQueue:(id)a3;
- (void)setSelectButtonTimer:(id)a3;
- (void)setSelectEventRepostQueue:(id)a3;
- (void)setTouchEventRepostQueue:(id)a3;
- (void)setTwoFingerTapTimer:(id)a3;
- (void)setWaitingForLiftDispatch:(BOOL)a3;
- (void)setZoomSenderIdentifierData:(id)a3;
@end

@implementation ZWAppleTVEventProcessor

- (ZWAppleTVEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ZWAppleTVEventProcessor;
  v6 = -[ZWEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( &v25,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  a3,  *(void *)&a4,  a5,  *(void *)&a6);
  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___AXThreadTimer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor HIDEventReceiveThread](v6, "HIDEventReceiveThread"));
    v9 = -[AXThreadTimer initWithThread:](v7, "initWithThread:", v8);

    -[ZWAppleTVEventProcessor setSelectButtonTimer:](v6, "setSelectButtonTimer:", v9);
    -[AXThreadTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v9,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v10 = objc_alloc(&OBJC_CLASS___AXThreadTimer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor HIDEventReceiveThread](v6, "HIDEventReceiveThread"));
    v12 = -[AXThreadTimer initWithThread:](v10, "initWithThread:", v11);

    -[ZWAppleTVEventProcessor setMicButtonTimer:](v6, "setMicButtonTimer:", v12);
    -[AXThreadTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v12,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v13 = objc_alloc(&OBJC_CLASS___AXThreadTimer);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor HIDEventReceiveThread](v6, "HIDEventReceiveThread"));
    v15 = -[AXThreadTimer initWithThread:](v13, "initWithThread:", v14);

    -[ZWAppleTVEventProcessor setTwoFingerTapTimer:](v6, "setTwoFingerTapTimer:", v15);
    -[AXThreadTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v15,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[ZWAppleTVEventProcessor setTouchEventRepostQueue:](v6, "setTouchEventRepostQueue:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[ZWAppleTVEventProcessor setMicEventRepostQueue:](v6, "setMicEventRepostQueue:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[ZWAppleTVEventProcessor setSelectEventRepostQueue:](v6, "setSelectEventRepostQueue:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[ZWAppleTVEventProcessor setEventsToDispatch:](v6, "setEventsToDispatch:", v19);

    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.accessibility.zoomEventDispatch-TV", v21);
    eventRepostQueue = v6->_eventRepostQueue;
    v6->_eventRepostQueue = (OS_dispatch_queue *)v22;
  }

  return v6;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ZOOMLogEvents();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ZWAppleTVEventProcessor _handleEvent:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityData]);
  v14 = (char *)[v13 eventSenderIdentifier];

  if (v14 == (_BYTE *)&dword_0 + 3) {
    goto LABEL_5;
  }
  if ([v4 type] == 1218
    || [v4 type] == 1220
    || [v4 type] == 1219
    || [v4 type] == 1221)
  {
    BOOL v16 = -[ZWAppleTVEventProcessor _handleSelectButtonEvent:](self, "_handleSelectButtonEvent:", v4);
  }

  else if ([v4 type] == 1224 || objc_msgSend(v4, "type") == 1225)
  {
    BOOL v16 = -[ZWAppleTVEventProcessor _handleMicButtonEvent:](self, "_handleMicButtonEvent:", v4);
  }

  else if ([v4 type] == 3001)
  {
    BOOL v16 = -[ZWAppleTVEventProcessor _handleTouchEvent:](self, "_handleTouchEvent:", v4);
  }

  else
  {
    if ([v4 type] != 1300)
    {
LABEL_5:
      uint64_t v15 = 0LL;
      goto LABEL_12;
    }

    BOOL v16 = -[ZWAppleTVEventProcessor _handleGameControllerEvent:](self, "_handleGameControllerEvent:", v4);
  }

  uint64_t v15 = v16;
LABEL_12:
  uint64_t v17 = ZOOMLogEvents();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ZWAppleTVEventProcessor _handleEvent:].cold.1(v15, v18, v19, v20, v21, v22, v23, v24);
  }

  return v15;
}

- (BOOL)_handleSelectButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectEventRepostQueue](self, "selectEventRepostQueue"));
  [v5 addObject:v4];

  objc_initWeak(&location, self);
  if ([v4 type] == 1218 || objc_msgSend(v4, "type") == 1220)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectButtonTimer](self, "selectButtonTimer"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __52__ZWAppleTVEventProcessor__handleSelectButtonEvent___block_invoke;
    v15[3] = &unk_6CB98;
    uint64_t v7 = &v16;
    objc_copyWeak(&v16, &location);
    [v6 afterDelay:v15 processBlock:0.33];
LABEL_4:

    objc_destroyWeak(v7);
    goto LABEL_5;
  }

  if ([v4 type] == 1219 || objc_msgSend(v4, "type") == 1221)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_lastSelectButtonClickTime = v9;
    ++self->_selectButtonClicks;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectButtonTimer](self, "selectButtonTimer"));
    [v10 cancel];

    if (self->_selectButtonClicks == 3)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v11 didGetToggleZoomGestureWithEventProcessor:self];

      self->_selectButtonClicks = 0LL;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectEventRepostQueue](self, "selectEventRepostQueue"));
      -[ZWAppleTVEventProcessor _drainEventRepostQueue:replayEvents:]( self,  "_drainEventRepostQueue:replayEvents:",  v12,  0LL);

      goto LABEL_5;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectButtonTimer](self, "selectButtonTimer"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __52__ZWAppleTVEventProcessor__handleSelectButtonEvent___block_invoke_2;
    v13[3] = &unk_6CB98;
    uint64_t v7 = &v14;
    objc_copyWeak(&v14, &location);
    [v6 afterDelay:v13 processBlock:0.33];
    goto LABEL_4;
  }

void __52__ZWAppleTVEventProcessor__handleSelectButtonEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[7] = 0LL;
    id v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectEventRepostQueue]);
    [v3 _drainEventRepostQueue:v2 replayEvents:1];

    WeakRetained = v3;
  }
}

void __52__ZWAppleTVEventProcessor__handleSelectButtonEvent___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[7] = 0LL;
    id v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectEventRepostQueue]);
    [v3 _drainEventRepostQueue:v2 replayEvents:1];

    WeakRetained = v3;
  }
}

- (BOOL)_handleMicButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_micButtonDown) {
    goto LABEL_4;
  }
  if (!self->_micButtonDown)
  {
LABEL_4:
  }

  self->_micButtonDown = [v5 type] == 1224;
  if ([v5 senderID])
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor micEventRepostQueue](self, "micEventRepostQueue"));
    [v6 addObject:v5];

    if ([v5 type] == 1224)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor micButtonTimer](self, "micButtonTimer"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = __49__ZWAppleTVEventProcessor__handleMicButtonEvent___block_invoke;
      v16[3] = &unk_6CB98;
      uint64_t v8 = &v17;
      objc_copyWeak(&v17, &location);
      [v7 afterDelay:v16 processBlock:0.33];
    }

    else
    {
      ++self->_micButtonClicks;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor micButtonTimer](self, "micButtonTimer"));
      [v10 cancel];

      if (self->_micButtonClicks == 2)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
        [v11 didGetSpeakContentGestureWithATVEventProcessor:self];

        self->_micButtonClicks = 0LL;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor micEventRepostQueue](self, "micEventRepostQueue"));
        -[ZWAppleTVEventProcessor _drainEventRepostQueue:replayEvents:]( self,  "_drainEventRepostQueue:replayEvents:",  v12,  0LL);

        goto LABEL_13;
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor micButtonTimer](self, "micButtonTimer"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __49__ZWAppleTVEventProcessor__handleMicButtonEvent___block_invoke_2;
      v14[3] = &unk_6CB98;
      uint64_t v8 = &v15;
      objc_copyWeak(&v15, &location);
      [v7 afterDelay:v14 processBlock:0.33];
    }

    objc_destroyWeak(v8);
LABEL_13:
    objc_destroyWeak(&location);
    BOOL v9 = 1;
    goto LABEL_14;
  }

void __49__ZWAppleTVEventProcessor__handleMicButtonEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = 0LL;
    id v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained micEventRepostQueue]);
    [v3 _drainEventRepostQueue:v2 replayEvents:1];

    WeakRetained = v3;
  }
}

void __49__ZWAppleTVEventProcessor__handleMicButtonEvent___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = 0LL;
    id v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained micEventRepostQueue]);
    [v3 _drainEventRepostQueue:v2 replayEvents:1];

    WeakRetained = v3;
  }
}

- (id)_debugStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"\n----------\n"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_oneFingerDown));
  [v3 appendFormat:@"  _oneFingerDown: %@\n", v4];

  uint64_t v5 = NSStringFromCGPoint(self->_touchDownInitialLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 appendFormat:@"  _touchDownInitialLocation: %@\n", v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_twoFingersDown));
  [v3 appendFormat:@"  _twoFingersDown: %@\n", v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_twoFingersDownTime));
  [v3 appendFormat:@"  _twoFingersDownTime: %@\n", v8];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_twoFingerTapCount));
  [v3 appendFormat:@"  _twoFingerTapCount: %@\n", v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isDragging));
  [v3 appendFormat:@"  _isDragging: %@\n", v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isZoomPanning));
  [v3 appendFormat:@"  _isZoomPanning: %@\n", v11];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isAdjustingZoomLevel));
  [v3 appendFormat:@"  _isAdjustingZoomLevel: %@\n", v12];

  v13 = NSStringFromCGPoint(self->_initialZoomLevelAdjustLocation);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v3 appendFormat:@"  _initialZoomLevelAdjustLocation: %@\n", v14];

  [v3 appendString:@"----------\n"];
  return v3;
}

- (BOOL)_handleTouchEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  v6 = v5;
  if (v5)
  {
    [v5 currentUIContextForEventProcessor:self];
  }

  else
  {
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v54 = 0u;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor touchEventRepostQueue](self, "touchEventRepostQueue"));
  [v7 addObject:v4];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor twoFingerTapTimer](self, "twoFingerTapTimer"));
  [v8 cancel];

  [v4 location];
  double v10 = v9;
  double v12 = v11;
  if ([v4 isTouchDown])
  {
    self->_didGetTwoFingerMultiTapGesture = 0;
    self->_tapPossible = 1;
    self->_touchDownInitialLocation.x = v10;
    self->_touchDownInitialLocation.y = v12;
    [v4 location];
    -[ZWEventProcessor setCurrentTouchOffset:](self, "setCurrentTouchOffset:", v13 * 2.0 + -1.0, v14 * 2.0 + -1.0);
    -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
    self->_lastTouchDownLocation.x = v15;
    self->_lastTouchDownLocation.y = v16;
    if ([v4 fingerCount] == (char *)&dword_0 + 1)
    {
      self->_oneFingerDown = 1;
      goto LABEL_35;
    }

    self->_oneFingerDown = 0;
LABEL_14:
    self->_twoFingersDown = 1;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_double twoFingersDownTime = v17;
    goto LABEL_35;
  }

  if (![v4 isChordChange])
  {
    if (self->_tapPossible)
    {
      if (sqrt( (self->_touchDownInitialLocation.y - v12) * (self->_touchDownInitialLocation.y - v12)
           + (self->_touchDownInitialLocation.x - v10) * (self->_touchDownInitialLocation.x - v10)) <= 0.02)
        goto LABEL_35;
      self->_tapPossible = 0;
    }

    self->_isDragging = 1;
    if (self->_oneFingerDown)
    {
      if ((BYTE8(v72) & 0x80) != 0) {
        goto LABEL_31;
      }
      -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
      self->_lastTouchDownLocation.x = v18;
      self->_lastTouchDownLocation.y = v19;
      [v4 location];
      -[ZWEventProcessor setCurrentTouchOffset:](self, "setCurrentTouchOffset:", v20 * 2.0 + -1.0, v21 * 2.0 + -1.0);
      if (!HIDWORD(v72)) {
        goto LABEL_31;
      }
      if (self->_isZoomPanning) {
        goto LABEL_31;
      }
      double lastSelectButtonClickTime = self->_lastSelectButtonClickTime;
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      if (vabdd_f64(v23, lastSelectButtonClickTime) < 0.3) {
        goto LABEL_31;
      }
      self->_selectButtonClicks = 0LL;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectButtonTimer](self, "selectButtonTimer"));
      [v24 cancel];

      self->_isZoomPanning = 1;
      objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v25 wantsToStartAutopannerWithATVEventProcessor:self];
    }

    else
    {
      if (!self->_twoFingersDown || self->_twoFingerTapCount != 1) {
        goto LABEL_31;
      }
      if (!self->_isAdjustingZoomLevel)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
        [v30 willBeginAdjustingZoomLevelWithATVEventProcessor:self];

        self->_isAdjustingZoomLevel = 1;
        [v4 location];
        self->_initialZoomLevelAdjustLocation.x = v31;
        self->_initialZoomLevelAdjustLocation.y = v32;
LABEL_31:
        BOOL v33 = !self->_isZoomPanning && !self->_isAdjustingZoomLevel && self->_twoFingerTapCount == 0;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor touchEventRepostQueue](self, "touchEventRepostQueue"));
        -[ZWAppleTVEventProcessor _drainEventRepostQueue:replayEvents:]( self,  "_drainEventRepostQueue:replayEvents:",  v34,  v33);

        goto LABEL_35;
      }

      [v4 location];
      double v27 = v26 - self->_initialZoomLevelAdjustLocation.x;
      [v4 location];
      double v29 = v28 - self->_initialZoomLevelAdjustLocation.y;
      objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      objc_msgSend(v25, "atvEventProcessor:adjustZoomLevelWithDelta:", self, v27, v29);
    }

    goto LABEL_31;
  }

  if (self->_oneFingerDown && [v4 fingerCount] == (char *)&dword_0 + 2)
  {
    self->_oneFingerDown = 0;
    goto LABEL_14;
  }

void __45__ZWAppleTVEventProcessor__handleTouchEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained[17] == 1LL)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mainDisplayDelegate]);
    [v2 didGetTogglePanningModeGestureWithATVEventProcessor:v11];
LABEL_16:

    uint64_t v8 = v11;
    goto LABEL_17;
  }

  uint64_t v3 = _AXSVoiceOverTouchEnabled(WeakRetained);
  if ((_DWORD)v3)
  {
    uint64_t v3 = (uint64_t)v11;
    if (v11[17] == 2LL)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerSingleTap](&OBJC_CLASS___VOSGesture, "TwoFingerSingleTap"));
LABEL_15:
      double v9 = (void *)v4;
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));

      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      [v10 triggerGesture:v2];

      goto LABEL_16;
    }
  }

  uint64_t v5 = _AXSVoiceOverTouchEnabled(v3);
  if ((_DWORD)v5)
  {
    uint64_t v5 = (uint64_t)v11;
    if (v11[17] == 3LL)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerDoubleTap](&OBJC_CLASS___VOSGesture, "TwoFingerDoubleTap"));
      goto LABEL_15;
    }
  }

  uint64_t v6 = _AXSVoiceOverTouchEnabled(v5);
  if ((_DWORD)v6)
  {
    uint64_t v6 = (uint64_t)v11;
    if (v11[17] == 4LL)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerTripleTap](&OBJC_CLASS___VOSGesture, "TwoFingerTripleTap"));
      goto LABEL_15;
    }
  }

  int v7 = _AXSVoiceOverTouchEnabled(v6);
  uint64_t v8 = v11;
  if (v7 && v11[17] == 5LL)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "TwoFingerQuadrupleTap"));
    goto LABEL_15;
  }

- (BOOL)_handleGameControllerEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  uint64_t v6 = v5;
  if (v5) {
    [v5 currentUIContextForEventProcessor:self];
  }
  else {
    __int128 v22 = 0u;
  }

  if ((BYTE8(v22) & 0x80) != 0)
  {
    BOOL v18 = 0;
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 gameControllerInfo]);
    -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
    self->_lastTouchDownLocation.x = v8;
    self->_lastTouchDownLocation.y = v9;
    [v7 rightJoystickX];
    double v11 = v10;
    [v7 rightJoystickY];
    -[ZWEventProcessor setCurrentTouchOffset:](self, "setCurrentTouchOffset:", v11, -v12);
    __asm { FMOV            V0.2D, #0.5 }

    self->_touchDownInitialLocation = _Q0;
    if ([v7 rightJoystickActive])
    {
      BOOL v18 = 1;
      if (!self->_isZoomPanning)
      {
        self->_isZoomPanning = 1;
        CGFloat v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
        [v19 wantsToStartAutopannerWithATVEventProcessor:self];
      }
    }

    else if (self->_isZoomPanning)
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v20 wantsToStopAutopannerWithATVEventProcessor:self];

      self->_isZoomPanning = 0;
      BOOL v18 = 1;
    }

    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)_senderIDForRepostingOfEvent:(id)a3
{
  id v3 = a3;
  if ([v3 creatorHIDEvent]) {
    id SenderID = (id)IOHIDEventGetSenderID();
  }
  else {
    id SenderID = [v3 senderID];
  }
  unint64_t v5 = (unint64_t)SenderID;

  return v5;
}

- (AXEventData)zoomSenderIdentifierData
{
  zoomSenderIdentifierData = self->_zoomSenderIdentifierData;
  if (!zoomSenderIdentifierData)
  {
    id v4 = (AXEventData *)objc_claimAutoreleasedReturnValue(+[AXEventData dataWithSender:](&OBJC_CLASS___AXEventData, "dataWithSender:", 3LL));
    unint64_t v5 = self->_zoomSenderIdentifierData;
    self->_zoomSenderIdentifierData = v4;

    zoomSenderIdentifierData = self->_zoomSenderIdentifierData;
  }

  return zoomSenderIdentifierData;
}

- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = &off_53000;
  if (v4)
  {
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        double v13 = 0LL;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v13);
          CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor zoomSenderIdentifierData](self, "zoomSenderIdentifierData"));
          [v14 setAccessibilityData:v15];

          [v14 applyAccessibilityDataToCreatorHIDEvent];
          [v8 addObject:v14];
          double v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v11);
    }

    eventRepostQueue = (dispatch_queue_s *)self->_eventRepostQueue;
    block[0] = _NSConcreteStackBlock;
    int v7 = &off_53000;
    block[1] = 3221225472LL;
    block[2] = __63__ZWAppleTVEventProcessor__drainEventRepostQueue_replayEvents___block_invoke;
    block[3] = &unk_6D008;
    block[4] = self;
    id v21 = v8;
    id v17 = v8;
    dispatch_async(eventRepostQueue, block);
  }

  [v6 removeAllObjects];
  BOOL v18 = (dispatch_queue_s *)self->_eventRepostQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = *((void *)v7 + 73);
  v19[2] = __63__ZWAppleTVEventProcessor__drainEventRepostQueue_replayEvents___block_invoke_2;
  v19[3] = &unk_6CBC0;
  v19[4] = self;
  dispatch_async(v18, v19);
}

void __63__ZWAppleTVEventProcessor__drainEventRepostQueue_replayEvents___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventsToDispatch]);
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
}

id __63__ZWAppleTVEventProcessor__drainEventRepostQueue_replayEvents___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchNextEvent];
}

- (void)_dispatchNextEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a1 count]));
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_fault_impl( &dword_0,  a2,  OS_LOG_TYPE_FAULT,  "Event dispatch queue count unusually high: %@",  (uint8_t *)&v4,  0xCu);
}

id __45__ZWAppleTVEventProcessor__dispatchNextEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _dispatchNextEvent];
}

- (CGPoint)offsetForAutopanner:(id)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 zoomAutopannerShouldPanWithAcceleration];

  -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
  double v8 = v7;
  if (v5)
  {
    double x = self->_touchDownInitialLocation.x * 2.0 + -1.0;
    double v10 = v6 - (self->_touchDownInitialLocation.y * 2.0 + -1.0);
  }

  else
  {
    double x = self->_lastTouchDownLocation.x;
    -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
    double v10 = v11 - self->_lastTouchDownLocation.y;
    -[ZWEventProcessor currentTouchOffset](self, "currentTouchOffset");
    self->_lastTouchDownLocation.double x = v12;
    self->_lastTouchDownLocation.y = v13;
  }

  double v14 = v8 - x;
  double v15 = v10;
  result.y = v15;
  result.double x = v14;
  return result;
}

- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3
{
  return 1;
}

- (AXThreadTimer)selectButtonTimer
{
  return self->_selectButtonTimer;
}

- (void)setSelectButtonTimer:(id)a3
{
}

- (AXThreadTimer)micButtonTimer
{
  return self->_micButtonTimer;
}

- (void)setMicButtonTimer:(id)a3
{
}

- (AXThreadTimer)twoFingerTapTimer
{
  return self->_twoFingerTapTimer;
}

- (void)setTwoFingerTapTimer:(id)a3
{
}

- (NSMutableArray)touchEventRepostQueue
{
  return self->_touchEventRepostQueue;
}

- (void)setTouchEventRepostQueue:(id)a3
{
}

- (NSMutableArray)selectEventRepostQueue
{
  return self->_selectEventRepostQueue;
}

- (void)setSelectEventRepostQueue:(id)a3
{
}

- (NSMutableArray)micEventRepostQueue
{
  return self->_micEventRepostQueue;
}

- (void)setMicEventRepostQueue:(id)a3
{
}

- (NSMutableArray)eventsToDispatch
{
  return self->_eventsToDispatch;
}

- (void)setEventsToDispatch:(id)a3
{
}

- (void)setZoomSenderIdentifierData:(id)a3
{
}

- (BOOL)waitingForLiftDispatch
{
  return self->_waitingForLiftDispatch;
}

- (void)setWaitingForLiftDispatch:(BOOL)a3
{
  self->_waitingForLiftDispatch = a3;
}

- (void).cxx_destruct
{
}

- (void)_handleEvent:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_handleEvent:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end