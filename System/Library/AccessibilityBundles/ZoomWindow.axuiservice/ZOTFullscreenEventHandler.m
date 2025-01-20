@interface ZOTFullscreenEventHandler
- (BOOL)_allowsFingerDistanceToAffectZoom;
- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3;
- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3 isDragging:(BOOL)a4;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTrackpadEvent:(id)a3;
- (BOOL)_hasReachedFlickVelocity:(id)a3;
- (BOOL)_verifyZoomActionIsAppropriate:(id)a3;
- (BOOL)anyFingerDown;
- (BOOL)handleDragEvent:(id)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handleTrackpadEvent:(id)a3;
- (BOOL)isAnyDisplayZoomedIn;
- (BOOL)isDisplayZoomedIn:(id)a3;
- (BOOL)isMainDisplayZoomedIn;
- (CGPoint)_middleFingerForEvent:(id)a3;
- (NSPointerArray)externalDisplayZoomDelegates;
- (ZOTFullscreenEventHandler)initWithEventThread:(id)a3;
- (ZOTFullscreenEventHandlerDelegate)eventDelegate;
- (ZOTFullscreenZoomHandlerDelegate)zoomDelegate;
- (double)_currentVelocity:(id)a3;
- (id)_descriptionForEvent:(id)a3;
- (id)_zoomSenderIdentifierData;
- (unint64_t)_senderIDForRepostingOfEvent:(id)a3;
- (void)_clearState;
- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4 updateEventTimestamps:(BOOL)a5;
- (void)_eventPostTimerCallback;
- (void)_handleDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4;
- (void)_handleTrackpadDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4;
- (void)_handleVoiceOverMultiTapActionWithEvent:(id)a3 tapCount:(int64_t)a4;
- (void)_scheduleTapTimeout;
- (void)_scheduleTapTimeout:(BOOL)a3;
- (void)_scheduleTrackpadTapTimeout;
- (void)_updateAutopanWhileDragging:(BOOL)a3;
- (void)_updateVelocityAndVectorWithEventLocation:(CGPoint)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 forTrackpad:(BOOL)a6;
- (void)postHandCancelWithSenderID:(unint64_t)a3;
- (void)setEventDelegate:(id)a3;
- (void)setExternalDisplayZoomDelegates:(id)a3;
- (void)setFirstTouchWentIntoLensContent:(BOOL)a3;
- (void)setZoomDelegate:(id)a3;
@end

@implementation ZOTFullscreenEventHandler

- (ZOTFullscreenEventHandler)initWithEventThread:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___ZOTFullscreenEventHandler;
  v5 = -[ZOTFullscreenEventHandler init](&v32, "init");
  v6 = v5;
  if (v5)
  {
    v5->_orbFinger = -1LL;
    double v7 = ZOTTimeUnset;
    *(void *)&v5->_snarfLastTime = ZOTTimeUnset;
    v5->_lastPanTime = v7;
    v5->_velocityLastTime = v7;
    v5->_trackpadVelocityLastTime = v7;
    v5->_tapDoubleLastTime = v7;
    v5->_tapLastTime = v7;
    v5->_trackpadTapDoubleLastTime = v7;
    v5->_trackpadTapLastTime = v7;
    v5->_lastAppTransition = v7;
    v5->_flickTime = v7;
    v5->_autopanDelay = v7;
    v5->_borderpanStartTime = v7;
    v5->_twoFingerTapDownWithHold = v7;
    v5->_firstFingerDownTime = v7;
    v5->_secondFingerDownTime = v7;
    v5->_thirdFingerDownTime = v7;
    v5->_anyFingerDownTime = v7;
    v5->_firstTrackpadFingerDownTime = v7;
    v5->_secondTrackpadFingerDownTime = v7;
    v5->_thirdTrackpadFingerDownTime = v7;
    v5->_anyTrackpadFingerDownTime = v7;
    v5->_currentFingerCount = 0LL;
    v5->_oneFingerWasDown = 0;
    v8 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    autopanTimer = v6->_autopanTimer;
    v6->_autopanTimer = v8;

    v10 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    multiTapTimer = v6->_multiTapTimer;
    v6->_multiTapTimer = v10;

    v12 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    passthruEventTimer = v6->_passthruEventTimer;
    v6->_passthruEventTimer = v12;

    v14 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    tapCountResetTimer = v6->_tapCountResetTimer;
    v6->_tapCountResetTimer = v14;

    v16 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    trackpadTapCountResetTimer = v6->_trackpadTapCountResetTimer;
    v6->_trackpadTapCountResetTimer = v16;

    v18 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    editingGestureHoldTimer = v6->_editingGestureHoldTimer;
    v6->_editingGestureHoldTimer = v18;

    v20 = -[AXThreadTimer initWithThread:](objc_alloc(&OBJC_CLASS___AXThreadTimer), "initWithThread:", v4);
    hoverTextTapTimer = v6->_hoverTextTapTimer;
    v6->_hoverTextTapTimer = v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    eventReplayQueue = v6->_eventReplayQueue;
    v6->_eventReplayQueue = (NSMutableArray *)v22;

    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.accessibility.zoomEventDispatch", v25);
    eventReplayDispatchQueue = v6->_eventReplayDispatchQueue;
    v6->_eventReplayDispatchQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    externalDisplayZoomDelegates = v6->_externalDisplayZoomDelegates;
    v6->_externalDisplayZoomDelegates = (NSPointerArray *)v28;

    v30 = v6;
  }

  return v6;
}

- (BOOL)_allowsFingerDistanceToAffectZoom
{
  return ZOTMainScreenSize(self, a2) > 700.0;
}

- (BOOL)isMainDisplayZoomedIn
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  LOBYTE(v2) = -[ZOTFullscreenEventHandler isDisplayZoomedIn:](v2, "isDisplayZoomedIn:", v3);

  return (char)v2;
}

- (BOOL)isAnyDisplayZoomedIn
{
  if (-[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn"))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler externalDisplayZoomDelegates](self, "externalDisplayZoomDelegates"));
    id v3 = [v4 count];

    if (v3)
    {
      unint64_t v5 = 0LL;
      do
      {
        id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler externalDisplayZoomDelegates](self, "externalDisplayZoomDelegates"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pointerAtIndex:v5]);

        LODWORD(v3) = -[ZOTFullscreenEventHandler isDisplayZoomedIn:](self, "isDisplayZoomedIn:", v6);
        if ((_DWORD)v3) {
          break;
        }
        ++v5;
        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler externalDisplayZoomDelegates](self, "externalDisplayZoomDelegates"));
        id v8 = [v7 count];
      }

      while ((unint64_t)v8 > v5);
    }
  }

  return (char)v3;
}

- (BOOL)isDisplayZoomedIn:(id)a3
{
  return v3 >= AXZoomMinimumZoomLevel + 0.0001;
}

- (BOOL)anyFingerDown
{
  return self->_anyFingerDown;
}

- (BOOL)_verifyZoomActionIsAppropriate:(id)a3
{
  id v4 = a3;
  if (-[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn")) {
    goto LABEL_2;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double secondFingerDownTime = self->_secondFingerDownTime;
  if (secondFingerDownTime != ZOTTimeUnset && Current - secondFingerDownTime > 0.75) {
    goto LABEL_17;
  }
  double firstFingerDownTime = self->_firstFingerDownTime;
  double v10 = Current - firstFingerDownTime;
  if (firstFingerDownTime != ZOTTimeUnset && v10 > 0.75) {
    goto LABEL_17;
  }
  if (!-[ZOTFullscreenEventHandler _allowsFingerDistanceToAffectZoom](self, "_allowsFingerDistanceToAffectZoom", v10)) {
    goto LABEL_2;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 fingerAtIndex:0]);
  [v12 location];
  double v14 = v13;
  double v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 fingerAtIndex:1]);
  [v17 location];
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 fingerAtIndex:2]);
  [v22 location];
  double v24 = v23;
  double v26 = v25;

  if (SCRCMathGetDistanceBetweenPoints(v14, v16, v24, v26) <= 0.75
    && SCRCMathGetDistanceBetweenPoints(v19, v21, v24, v26) <= 0.75)
  {
LABEL_2:
    BOOL v5 = 1;
  }

  else
  {
LABEL_17:
    BOOL v5 = 0;
  }

  return v5;
}

- (void)postHandCancelWithSenderID:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
  [v4 postHandCancelWithSenderID:a3];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:]( &OBJC_CLASS___ZOTEvent,  "createEventFromEventRepresentation:",  a3);
  LOBYTE(self) = -[ZOTFullscreenEventHandler _handleEvent:](self, "_handleEvent:", v4);

  return (char)self;
}

- (BOOL)handleTrackpadEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:]( &OBJC_CLASS___ZOTEvent,  "createEventFromEventRepresentation:",  a3);
  LOBYTE(self) = -[ZOTFullscreenEventHandler _handleTrackpadEvent:](self, "_handleTrackpadEvent:", v4);

  return (char)self;
}

- (BOOL)handleDragEvent:(id)a3
{
  id v4 = +[ZOTEvent createEventFromEventRepresentation:]( &OBJC_CLASS___ZOTEvent,  "createEventFromEventRepresentation:",  a3);
  BOOL v5 = v4;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (CGPointZero.x == self->_initialSingleFingerLocation.x && y == self->_initialSingleFingerLocation.y)
  {
    objc_msgSend(v4, "magneticLocation", CGPointZero.x, y);
    self->_initialSingleFingerLocation.double x = x;
    self->_initialSingleFingerLocation.double y = y;
    self->_snarfing = 1;
  }

  -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:isDragging:]( self,  "_autoPanIfNecessaryWithEvent:isDragging:",  v5,  1LL,  x,  y);

  return 0;
}

- (BOOL)_handleEvent:(id)a3
{
  id v5 = a3;
  [v5 time];
  double v7 = v6;
  unsigned int v8 = [v5 handEventType];
  int v9 = v8;
  BOOL v10 = v7 - *(double *)&_handleEvent__LastEventTime < 0.016 && _handleEvent__LastEventType == v8;
  if (!v10 || !self->_zoomPanning || v8 != 2)
  {
    id obj = a3;
    v11 = (char *)[v5 fingerCount];
    multiTapTimer = (AXThreadTimer *)[v5 isTouchEventWeCareAbout];
    BOOL v13 = self->_eventFingersTracking || v7 - self->_snarfLastTime < 0.12;
    self->_snarfing = v13;
    if (!self->_orbZoomToggled) {
      BOOL v13 = 0;
    }
    self->_orbZoomToggled = v13;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
    unsigned __int8 v15 = [v14 isZoomMovingWithVelocityWithFullscreenEventHandler:self];

    if (self->_zoomDisabledForApp)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
      [v16 dispatchEventToSystem:v5];

      goto LABEL_230;
    }

    int anyFingerDown = self->_anyFingerDown;
    self->_currentFingerCount = (unint64_t)v11;
    int v18 = [v5 fingerCount] != 0;
    self->_int anyFingerDown = v18;
    if (!self->_orbSnarfing)
    {
      unint64_t v193 = (unint64_t)v11;
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
      if ([v19 allowsZoomOrb])
      {
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
        unsigned int v21 = ZOTEventMeetsOrbThreshold(v20);

        if (v21)
        {
          if (self->_anyFingerDown)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerAtIndex:0]);
            [v22 location];
            double v24 = v23;

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke;
            block[3] = &unk_6CC98;
            block[4] = self;
            block[5] = ZOTDenormalizePoint(v25, v26, v24);
            block[6] = v27;
            dispatch_async(&_dispatch_main_q, block);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
            -[ZOTFullscreenEventHandler postHandCancelWithSenderID:]( self,  "postHandCancelWithSenderID:",  [v28 senderID]);

            self->_orbSnarfing = 1;
            goto LABEL_230;
          }

          if (anyFingerDown)
          {
LABEL_37:
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            -[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v5);
            objc_msgSend(v48, "fullscreenEventHandler:didReceiveAnyFingerUpAtLocation:", self);

            if (self->_oneFingerWasDown) {
              self->_oneFingerWasDown = 0;
            }
            goto LABEL_42;
          }

          goto LABEL_42;
        }
      }

      else
      {
      }

      int v18 = self->_anyFingerDown;
      if (!self->_orbSnarfing)
      {
        if (!self->_anyFingerDown)
        {
          if (!anyFingerDown) {
            goto LABEL_42;
          }
          goto LABEL_37;
        }

        self->_wasPassingThroughSystemGesture = 0;
        if (v18 != anyFingerDown)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
          -[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v5);
          objc_msgSend(v41, "fullscreenEventHandler:didReceiveAnyFingerDownAtLocation:", self);

          if (v11 == (_BYTE *)&dword_0 + 1)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            unsigned int v43 = [v42 interfaceOrientationWithFullscreenEventHandler:self];
            -[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v5);
            double v46 = v45;
            if (v43 == 4)
            {
              double v47 = 1.0 - v45;
              double v46 = v44;
            }

            else if (v43 == 3)
            {
              double v47 = v45;
              double v46 = 1.0 - v44;
            }

            else
            {
              double v47 = v44;
              if (v43 == 2)
              {
                double v46 = 1.0 - v45;
                double v47 = 1.0 - v44;
              }
            }

            v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            objc_msgSend(v49, "fullscreenEventHandler:didReceiveOneFingerDownAtLocation:", self, v47, v46);

            self->_oneFingerWasDown = 1;
            v11 = (_BYTE *)(&dword_0 + 1);
          }
        }

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v2,  "fullscreenEventHandler:didStartOrbAtLocation:",  *(void *)(a1 + 32),  *(double *)(a1 + 40),  *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v2,  "fullscreenEventHandler:didEndOrbAtLocation:",  *(void *)(a1 + 32),  *(double *)(a1 + 40),  *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v2,  "fullscreenEventHandler:updateOrbMovementAtLocation:",  *(void *)(a1 + 32),  *(double *)(a1 + 40),  *(double *)(a1 + 48));
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_183(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[200])
  {
    id v4 = WeakRetained;
    double v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained eventDelegate]);
    [v3 dispatchEventToSystem:*(void *)(a1 + 32)];

    WeakRetained = v4;
  }
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2_184(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 endZoomMovementWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3_185(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 endZoomMovementWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4_188(uint64_t a1, uint64_t a2)
{
  double v3 = ZOTDenormalizePoint(a1, a2, *(double *)(*(void *)(a1 + 32) + 1224LL));
  double v5 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend(v6, "fullscreenEventHandler:didReceiveThreeFingerTripleTapAtLocation:", *(void *)(a1 + 32), v3, v5);
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleVoiceOverMultiTapActionWithEvent:*(void *)(a1 + 32) tapCount:*(void *)(a1 + 48)];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_7(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 updateStoredZoomedLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

id __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _eventPostTimerCallback];
}

void __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_9(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (BOOL)_handleTrackpadEvent:(id)a3
{
  double v4 = (ZOTEvent *)a3;
  -[ZOTEvent time](v4, "time");
  id v6 = v5;
  double v7 = (char *)-[ZOTEvent fingerCount](v4, "fingerCount");
  unsigned int v8 = -[ZOTEvent isTouchEventWeCareAbout](v4, "isTouchEventWeCareAbout");
  unsigned int v9 = v8;
  BOOL v10 = self->_trackpadEventFingersTracking || *(double *)&v6 - self->_snarfLastTime < 0.12;
  self->_BOOL trackpadSnarfing = v10;
  if (self->_trackpadTapCount == 1)
  {
    if (v7 == (_BYTE *)&dword_0 + 3) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  self->_anyTrackpadFingerDown = -[ZOTEvent fingerCount](v4, "fingerCount") != 0LL;
  if ((-[ZOTEvent handEventType](v4, "handEventType") & 0xFFFFFFFB) == 1)
  {
    if (-[ZOTEvent fingerCount](v4, "fingerCount") == (char *)&dword_0 + 1)
    {
      uint64_t v13 = 194LL;
    }

    else if (-[ZOTEvent fingerCount](v4, "fingerCount") == (char *)&dword_0 + 2)
    {
      uint64_t v13 = 195LL;
    }

    else
    {
      uint64_t v13 = 196LL;
    }

    (&self->super.isa)[v13] = v6;
  }

void __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = ZOTDenormalizePoint(a1, a2, 0.5);
  double v5 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend(v6, "fullscreenEventHandler:didReceiveThreeFingerTripleTapAtLocation:", *(void *)(a1 + 32), v3, v5);
}

void __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 updateStoredZoomedLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (void)_eventPostTimerCallback
{
  self->_allowTimedEventPosting = 0;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
  [v2 dispatchEntireEventQueue];
}

- (void)_clearState
{
  autopanEvent = self->_autopanEvent;
  self->_autopanEvent = 0LL;

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
  [v4 disableSleepTimer:0];

  self->_borderpanMode = 0;
  self->_allowTimedEventPosting = 1;
  self->_pannerTrackDistance = 0.0;
  if (self->_ignoreSnarfingForFingerSession) {
    self->_wasPassingThroughSystemGesture = 1;
  }
  self->_ignoreSnarfingForFingerSession = 0;
  self->_zoomPanning = 0;
  double v5 = ZOTTimeUnset;
  *(void *)&self->_anyFingerDownTime = ZOTTimeUnset;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  [v6 zoomLevelWithFullscreenEventHandler:self];
  self->_mainDisplayZoomLevel = v7;

  self->_timerFingerCount = 0LL;
  self->_flicking = 0;
  CGPoint v8 = CGPointZero;
  self->_flickLocation = CGPointZero;
  self->_flickTime = v5;
  self->_pinchDetectionDistance = 0.0;
  self->_initialSingleFingerLocation = v8;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  [v9 fullscreenEventHandler:self setUsingRelativePushPanning:0];

  self->_firstTouchWentIntoLensContent = 0;
}

- (void)setFirstTouchWentIntoLensContent:(BOOL)a3
{
  self->_firstTouchWentIntoLensContent = a3;
}

- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3
{
  return -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:isDragging:]( self,  "_autoPanIfNecessaryWithEvent:isDragging:",  a3,  0LL);
}

- (BOOL)_autoPanIfNecessaryWithEvent:(id)a3 isDragging:(BOOL)a4
{
  id v7 = a3;
  double v28 = 0.0;
  [v7 magneticLocation];
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  unsigned int v13 = [v12 interfaceOrientationWithFullscreenEventHandler:self];
  double v14 = 1.0 - v9;
  if (v13 == 2) {
    double v15 = 1.0 - v9;
  }
  else {
    double v15 = v9;
  }
  if (v13 == 2) {
    double v16 = 1.0 - v11;
  }
  else {
    double v16 = v11;
  }
  if (v13 == 3) {
    double v15 = v11;
  }
  else {
    double v14 = v16;
  }
  if (v13 == 4) {
    double v17 = 1.0 - v11;
  }
  else {
    double v17 = v15;
  }
  if (v13 != 4) {
    double v9 = v14;
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  if (!objc_msgSend( v18,  "fullscreenEventHandler:autopanShouldStartWithPoint:speedFactor:initialSingleFingerLocation:finge rCount:pointHasBeenMapped:",  self,  &v28,  0,  v17,  v9,  self->_initialSingleFingerLocation.x,  self->_initialSingleFingerLocation.y,  (double)(unint64_t)objc_msgSend(v7, "fingerCount")))
  {

    goto LABEL_21;
  }

  BOOL firstTouchWentIntoLensContent = self->_firstTouchWentIntoLensContent;

  if (!firstTouchWentIntoLensContent)
  {
LABEL_21:
    -[AXThreadTimer cancel](self->_autopanTimer, "cancel");
    BOOL v22 = 0;
    goto LABEL_29;
  }

  double v20 = v28;
  self->_autopanSpeedFactor = v28;
  double v21 = 0.0;
  if (v20 > 0.0)
  {
    if (v20 >= 0.100000001) {
      double v21 = 0.00200000009 / v20;
    }
    else {
      double v21 = 0.0200000014;
    }
  }

  self->_autopanDeladouble y = v21;
  objc_storeStrong((id *)&self->_autopanEvent, a3);
  if (!-[AXThreadTimer isPending](self->_autopanTimer, "isPending")
    || -[AXThreadTimer isCancelled](self->_autopanTimer, "isCancelled"))
  {
    objc_initWeak(&location, self);
    autopanTimer = self->_autopanTimer;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = __69__ZOTFullscreenEventHandler__autoPanIfNecessaryWithEvent_isDragging___block_invoke;
    v25[3] = &unk_6CAB0;
    v25[4] = self;
    BOOL v26 = a4;
    -[AXThreadTimer afterDelay:processBlock:](autopanTimer, "afterDelay:processBlock:", v25, 0.1);
    objc_destroyWeak(&location);
  }

  BOOL v22 = 1;
LABEL_29:

  return v22;
}

id __69__ZOTFullscreenEventHandler__autoPanIfNecessaryWithEvent_isDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutopanWhileDragging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateAutopanWhileDragging:(BOOL)a3
{
  unsigned int v5 = -[AXThreadTimer isCancelled](self->_autopanTimer, "isCancelled");
  autopanEvent = self->_autopanEvent;
  if (v5)
  {
    self->_autopanEvent = 0LL;

    autopanDownEvent = self->_autopanDownEvent;
    self->_autopanDownEvent = 0LL;

    return;
  }

  -[ZOTEvent magneticLocation](autopanEvent, "magneticLocation");
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  unsigned int v13 = [v12 interfaceOrientationWithFullscreenEventHandler:self];
  double v14 = 1.0 - v9;
  if (v13 == 2) {
    double v15 = 1.0 - v9;
  }
  else {
    double v15 = v9;
  }
  if (v13 == 2) {
    double v16 = 1.0 - v11;
  }
  else {
    double v16 = v11;
  }
  if (v13 == 3) {
    double v15 = v11;
  }
  else {
    double v14 = v16;
  }
  if (v13 == 4) {
    double v17 = 1.0 - v11;
  }
  else {
    double v17 = v15;
  }
  if (v13 == 4) {
    double v18 = v9;
  }
  else {
    double v18 = v14;
  }

  double v19 = self->_autopanSpeedFactor * 4.0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke;
  block[3] = &unk_6CD30;
  block[4] = self;
  *(double *)&void block[5] = v17;
  *(double *)&block[6] = v18;
  *(double *)&void block[7] = v19;
  dispatch_async(&_dispatch_main_q, block);
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
  if (([v20 usingRelativePushPanningWithFullscreenEventHandler:self] & 1) == 0)
  {
    BOOL snarfing = self->_snarfing;

    if (snarfing
      || a3
      || (-1431655765 * _updateAutopanWhileDragging__ToggleCount + 715827882) > 0x55555554)
    {
      goto LABEL_23;
    }

    id v20 = -[ZOTEvent copyWithZone:](self->_autopanEvent, "copyWithZone:", 0LL);
    -[AXThreadTimer cancel](self->_eventPostTimer, "cancel");
    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
    [v23 dispatchEventToSystem:v20];
  }

LABEL_23:
  ++_updateAutopanWhileDragging__ToggleCount;
  objc_initWeak(&location, self);
  autopanTimer = self->_autopanTimer;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke_2;
  v24[3] = &unk_6CAB0;
  v24[4] = self;
  BOOL v25 = a3;
  -[AXThreadTimer afterDelay:processBlock:](autopanTimer, "afterDelay:processBlock:", v24, 0.0166666675);
  objc_destroyWeak(&location);
}

void __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v2,  "fullscreenEventHandler:autopanWithLocation:initialSingleFingerLocation:distance:animationDuration:useGutterDistance: pointHasBeenMapped:",  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(*(void *)(a1 + 32) + 1472),  *(double *)(*(void *)(a1 + 32) + 1480),  *(double *)(a1 + 56),  0.0166666675);
}

id __57__ZOTFullscreenEventHandler__updateAutopanWhileDragging___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAutopanWhileDragging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleTrackpadDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  id v6 = a3;
  if (self->_tapDoubleTrackingForTrackpad)
  {
    CGFloat y = self->_zoomerTrackpadTrackStart;
  }

  else
  {
    self->_double zoomerTrackpadTrackStart = y;
    self->_tapDoubleTrackingForTrackpad = 1;
  }

  double v7 = self->_trackingTrackpadLocation.y;
  double v8 = vabdd_f64(y, v7);
  if (self->_trackpadZooming || v8 > 0.0500000007)
  {
    double v9 = y - v7;
    if (self->_trackpadZooming)
    {
      double zoomStartOffset = self->_zoomStartOffset;
    }

    else
    {
      uint64_t v11 = ZOOMLogEvents();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        BOOL trackpadZooming = self->_trackpadZooming;
        double zoomerTrackpadTrackStart = self->_zoomerTrackpadTrackStart;
        *(_DWORD *)buf = 67110144;
        BOOL v23 = trackpadZooming;
        __int16 v24 = 1024;
        BOOL v25 = v8 > 0.0500000007;
        __int16 v26 = 2048;
        double v27 = zoomerTrackpadTrackStart;
        __int16 v28 = 2048;
        double v29 = v7;
        __int16 v30 = 2048;
        double v31 = v9;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Zooming. Canceling timer. trackpadZooming:%d deltaExceeded:%d zoomerTrackpadTrackStart:%f zoomValue:%f normalizedDelta:%f",  buf,  0x2Cu);
      }

      self->_BOOL trackpadZooming = 1;
      *(double *)v15.i64 = -v9;
      v16.i64[0] = 0x3FA99999A0000000LL;
      v17.f64[0] = NAN;
      v17.f64[1] = NAN;
      *(void *)&double zoomStartOffset = vbslq_s8((int8x16_t)vnegq_f64(v17), v16, v15).u64[0];
      self->_double zoomStartOffset = zoomStartOffset;
    }

    double v18 = v9 + zoomStartOffset;
    double v19 = AXZoomMinimumZoomLevel;
    double v20 = self->_mainDisplayZoomLevel + v18 * (AXZoomMaximumZoomLevel - AXZoomMinimumZoomLevel) * 0.5;
    if (v20 >= AXZoomMinimumZoomLevel + 0.000001)
    {
      double v19 = v20;
      if (v20 > AXZoomMaximumZoomLevel) {
        double v19 = AXZoomMaximumZoomLevel;
      }
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __71__ZOTFullscreenEventHandler__handleTrackpadDoubleTapEvent_newLocation___block_invoke;
    v21[3] = &unk_6CD58;
    v21[4] = self;
    *(double *)&v21[5] = v19;
    dispatch_async(&_dispatch_main_q, v21);
  }
}

void __71__ZOTFullscreenEventHandler__handleTrackpadDoubleTapEvent_newLocation___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 fullscreenEventHandler:*(void *)(a1 + 32) setZoomLevelFromTrackpadGesture:*(double *)(a1 + 40)];
}

- (void)_handleDoubleTapEvent:(id)a3 newLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = (char *)[v7 fingerCount];
  if (v8 == (_BYTE *)&dword_0 + 3)
  {
    double v8 = (char *)-[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v7);
    self->_tapPoint.double x = v10;
    self->_tapPoint.double y = v11;
  }

  if (self->_tapDoubleTracking)
  {
    int deviceOrientation = self->_deviceOrientation;
  }

  else
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
    self->_int deviceOrientation = [v13 interfaceOrientationWithFullscreenEventHandler:self];

    int deviceOrientation = self->_deviceOrientation;
    double v14 = 1.0 - y;
    if (deviceOrientation != 2) {
      double v14 = y;
    }
    if (deviceOrientation == 3) {
      double v14 = 1.0 - x;
    }
    if (deviceOrientation == 4) {
      double v14 = x;
    }
    self->_double zoomerTrackStart = v14;
    self->_tapDoubleTracking = 1;
  }

  double v15 = self->_trackingLocation.x;
  if (deviceOrientation != 4)
  {
    if (deviceOrientation == 3)
    {
      double v15 = 1.0 - v15;
    }

    else if (deviceOrientation == 2)
    {
      double v15 = 1.0 - self->_trackingLocation.y;
    }

    else
    {
      double v15 = self->_trackingLocation.y;
    }
  }

  double v18 = ZOTDenormalizeValue((uint64_t)v8, v9, self->_zoomerTrackStart - v15);
  if (self->_shouldPerformEditingGesture)
  {
    if (!_AXSVoiceOverTouchEnabled(v16))
    {
      if (-[NSMutableArray count](self->_eventReplayQueue, "count")) {
        -[ZOTFullscreenEventHandler _drainEventRepostQueue:replayEvents:updateEventTimestamps:]( self,  "_drainEventRepostQueue:replayEvents:updateEventTimestamps:",  self->_eventReplayQueue,  1LL,  1LL);
      }
      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler _zoomSenderIdentifierData](self, "_zoomSenderIdentifierData"));
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
      [v21 setAccessibilityData:v20];

      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
      [v22 applyAccessibilityDataToCreatorHIDEvent];

      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
      unint64_t v24 = -[ZOTFullscreenEventHandler _senderIDForRepostingOfEvent:](self, "_senderIDForRepostingOfEvent:", v23);

      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
      [v19 sendHIDSystemEvent:v25 repostCreatorHIDEvent:1 senderID:v24];

      goto LABEL_29;
    }
  }

  else
  {
    double v26 = v18;
    double v27 = fabs(v18);
    if (self->_zooming || v27 > 20.0)
    {
      if (self->_zooming)
      {
        double zoomStartOffset = self->_zoomStartOffset;
      }

      else
      {
        uint64_t v32 = ZOOMLogEvents();
        double v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          BOOL zooming = self->_zooming;
          double zoomerTrackStart = self->_zoomerTrackStart;
          *(_DWORD *)buf = 67110144;
          BOOL v45 = zooming;
          __int16 v46 = 1024;
          BOOL v47 = v27 > 20.0;
          __int16 v48 = 2048;
          double v49 = zoomerTrackStart;
          __int16 v50 = 2048;
          double v51 = v15;
          __int16 v52 = 2048;
          double v53 = v26;
          _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "Zooming. Canceling timer. zooming:%d deltaExceeded:%d zoomTrackerStart:%f zoomValue:%f normalizedDelta:%f",  buf,  0x2Cu);
        }

        id v16 = -[AXThreadTimer cancel](self->_editingGestureHoldTimer, "cancel");
        self->_BOOL zooming = 1;
        *(double *)v36.i64 = -v26;
        v37.i64[0] = 20.0;
        v38.f64[0] = NAN;
        v38.f64[1] = NAN;
        *(void *)&double zoomStartOffset = vbslq_s8((int8x16_t)vnegq_f64(v38), v37, v36).u64[0];
        self->_double zoomStartOffset = zoomStartOffset;
      }

      double v39 = (v26 + zoomStartOffset) * (AXZoomMaximumZoomLevel - AXZoomMinimumZoomLevel);
      double v40 = v39 / ZOTMainScreenSize(v16, v17);
      double v41 = self->_mainDisplayZoomLevel + ZOTMainScreenScaleFactor() * v40;
      double v42 = AXZoomMinimumZoomLevel;
      if (v41 >= AXZoomMinimumZoomLevel + 0.000001)
      {
        double v42 = v41;
        if (v41 > AXZoomMaximumZoomLevel) {
          double v42 = AXZoomMaximumZoomLevel;
        }
      }

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = __63__ZOTFullscreenEventHandler__handleDoubleTapEvent_newLocation___block_invoke;
      v43[3] = &unk_6CD58;
      v43[4] = self;
      *(double *)&v43[5] = v42;
      dispatch_async(&_dispatch_main_q, v43);
    }

    else if ((-[AXThreadTimer isPending](self->_editingGestureHoldTimer, "isPending") & 1) != 0 {
           || -[AXThreadTimer isActive](self->_editingGestureHoldTimer, "isActive"))
    }
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_eventReplayQueue, "lastObject"));
      double v29 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);

      if (v28 != v29)
      {
        eventReplayQueue = self->_eventReplayQueue;
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
        -[NSMutableArray addObject:](eventReplayQueue, "addObject:", v19);
LABEL_29:
      }
    }
  }
}

void __63__ZOTFullscreenEventHandler__handleDoubleTapEvent_newLocation___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 fullscreenEventHandler:*(void *)(a1 + 32) setZoomLevel:*(double *)(a1 + 40) duration:0.0];
}

- (void)_handleVoiceOverMultiTapActionWithEvent:(id)a3 tapCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 1LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerSingleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerSingleTap"));
      goto LABEL_8;
    case 2LL:
      [v6 time];
      self->_tapDoubleLastTime = v9;
      uint64_t v10 = -[ZOTFullscreenEventHandler isAnyDisplayZoomedIn](self, "isAnyDisplayZoomedIn");
      if ((v10 & 1) != 0)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_2;
        v19[3] = &unk_6CBC0;
        v19[4] = self;
        double v12 = v19;
      }

      else
      {
        double v16 = ZOTDenormalizePoint(v10, v11, self->_tapPoint.x);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke;
        block[3] = &unk_6CC98;
        block[4] = self;
        *(double *)&void block[5] = v16;
        block[6] = v17;
        double v12 = block;
      }

      dispatch_async(&_dispatch_main_q, v12);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_3;
      v18[3] = &unk_6CBC0;
      v18[4] = self;
      dispatch_async(&_dispatch_main_q, v18);
      break;
    case 3LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerDoubleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerDoubleTap"));
      goto LABEL_8;
    case 4LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerTripleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerTripleTap"));
      goto LABEL_8;
    case 5LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerQuadrupleTap"));
LABEL_8:
      unsigned int v13 = (void *)v8;
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));

      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      [v15 triggerGesture:v14];

      break;
    default:
      break;
  }

  self->_unint64_t tapCount = 0LL;
  *(void *)&self->_tapLastTime = ZOTTimeUnset;
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v2,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  *(double *)(a1 + 40),  *(double *)(a1 + 48));

  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v3 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328LL) = v4;

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        id v6 = objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v10),  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  ZOTDenormalizePoint((uint64_t)v6, v7, 0.5));
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v8 = v6;
    }

    while (v6);
  }
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_2( uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMainDisplayZoomedIn])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
    objc_msgSend( v2,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  CGPointZero.x,  CGPointZero.y);

    double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
    [v3 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
    *(void *)(*(void *)(a1 + 32) + 1328LL) = v4;
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    double y = CGPointZero.y;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([*(id *)(a1 + 32) isDisplayZoomedIn:v11]) {
          objc_msgSend( v11,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  CGPointZero.x,  y);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

void __78__ZOTFullscreenEventHandler__handleVoiceOverMultiTapActionWithEvent_tapCount___block_invoke_3( uint64_t a1)
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 zoomDelegate]);
  [v3 storedZoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  double v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v6 zoomLocationWithFullscreenEventHandler:*(void *)(a1 + 32)];
  objc_msgSend( v9,  "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:",  v2,  objc_msgSend(*(id *)(a1 + 32), "isMainDisplayZoomedIn") ^ 1,  *(void *)(*(void *)(a1 + 32) + 1296),  v5,  v7,  v8);
}

- (double)_currentVelocity:(id)a3
{
  id v4 = a3;
  [v4 averageLocation];
  double v7 = v5;
  double v8 = v6;
  if (self->_flickTime == ZOTTimeUnset)
  {
    self->_flickLocation.double x = v5;
    self->_flickLocation.double y = v6;
  }

  [v4 time];
  double v10 = v9;

  double v11 = v10 - self->_flickTime;
  self->_flickTime = v10;
  double DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints(self->_flickLocation.x, self->_flickLocation.y, v7, v8);
  self->_flickLocation.double x = v7;
  self->_flickLocation.double y = v8;
  double result = DistanceBetweenPoints / v11;
  if (v11 <= 0.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)_hasReachedFlickVelocity:(id)a3
{
  return v3 > 1.0;
}

- (CGPoint)_middleFingerForEvent:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  if (ZOTIsWildcat)
  {
    uint64_t v6 = ZOTDeviceRotation();
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
    unsigned int v8 = [v7 interfaceOrientationWithFullscreenEventHandler:self];

    BOOL v9 = v6 == 2;
    BOOL v10 = v6 == 2;
    BOOL v11 = v6 == 2;
    if (v8 == 4) {
      BOOL v11 = 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v8 == 3)
    {
      BOOL v10 = 0;
      BOOL v11 = 0;
    }

    else
    {
      BOOL v9 = 0;
    }

    BOOL v12 = v8 != 2 && v10;
    BOOL v13 = v8 != 2 && v9;
    BOOL v14 = v8 == 2 && v6 == 2;
    BOOL v15 = v8 != 2 && v11;
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerAtIndex:0]);
    [v16 location];
    double v18 = v17;
    double v20 = v19;

    id v21 = [v5 fingerCount];
    if ((uint64_t)v21 >= 2)
    {
      id v22 = v21;
      for (uint64_t i = 1LL; (id)i != v22; ++i)
      {
        unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerAtIndex:i]);
        [v24 location];
        double v26 = v25;
        double v28 = v27;

        if (v14 && v26 < v18) {
          double v29 = v26;
        }
        else {
          double v29 = v18;
        }
        BOOL v30 = v26 > v29 && v15;
        if (v30 || v14 && v26 < v18) {
          double v31 = v28;
        }
        else {
          double v31 = v20;
        }
        int v32 = v12 && v28 < v31;
        if (v12 && v28 < v31) {
          double v31 = v28;
        }
        int v33 = (v13 && v28 > v31) | v32 | v30;
        if (v13 && v28 > v31) {
          double v20 = v28;
        }
        else {
          double v20 = v31;
        }
        if (v33) {
          double v18 = v26;
        }
        else {
          double v18 = v29;
        }
      }
    }
  }

  else
  {
    [v4 magneticLocation];
    double v18 = v34;
    double v20 = v35;
  }

  double v36 = v18;
  double v37 = v20;
  result.double y = v37;
  result.double x = v36;
  return result;
}

- (void)_drainEventRepostQueue:(id)a3 replayEvents:(BOOL)a4 updateEventTimestamps:(BOOL)a5
{
  BOOL v25 = a5;
  BOOL v5 = a4;
  id v7 = a3;
  if (v5)
  {
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler _zoomSenderIdentifierData](self, "_zoomSenderIdentifierData"));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v22 = v7;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      BOOL v11 = 0LL;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          BOOL v15 = objc_msgSend(v14, "HIDTime", v22);
          double v16 = v15;
          if (!v11) {
            BOOL v11 = v15;
          }
          if (v25)
          {
            id v17 = [v14 creatorHIDEvent];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = mach_absolute_time();
              [v14 setHIDTime:v19];
              IOHIDEventSetTimeStamp(v18, v19);
            }
          }

          dispatch_time_t v20 = dispatch_time(0LL, v16 - v11);
          eventReplayDispatchQueue = (dispatch_queue_s *)self->_eventReplayDispatchQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __87__ZOTFullscreenEventHandler__drainEventRepostQueue_replayEvents_updateEventTimestamps___block_invoke;
          block[3] = &unk_6CD80;
          block[4] = v14;
          id v27 = v8;
          id v28 = v24;
          double v29 = self;
          dispatch_after(v20, eventReplayDispatchQueue, block);
        }

        id v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v10);
    }

    id v7 = v22;
  }

  objc_msgSend(v7, "removeAllObjects", v22);
}

id __87__ZOTFullscreenEventHandler__drainEventRepostQueue_replayEvents_updateEventTimestamps___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 48),  "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:",  *(void *)(a1 + 32),  1,  objc_msgSend(*(id *)(a1 + 56), "_senderIDForRepostingOfEvent:", *(void *)(a1 + 32)));
}

- (id)_descriptionForEvent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  uint64_t v6 = (objc_class *)objc_opt_class(v3);
  id v7 = NSStringFromClass(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = AXDebugDescriptionForAXHandEventType([v4 eventType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"<%@ %p> %12@", v8, v3, v10);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 paths]);
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        [v16 pathLocation];
        uint64_t v18 = v17;
        [v16 pathLocation];
        -[NSMutableString appendFormat:](v5, "appendFormat:", @" {%5.3f, %5.3f}", v18, v19);
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  return v5;
}

- (void)_updateVelocityAndVectorWithEventLocation:(CGPoint)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 forTrackpad:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double Current = CFAbsoluteTimeGetCurrent();
  double v21 = 0.0;
  uint64_t v22 = 0LL;
  SCRCMathGetVectorAndDistanceForPoints(&v22, &v21, v10, v9, x, y);
  if (v6)
  {
    uint64_t v14 = 140LL;
  }

  else
  {
    double v21 = v21 / ZOTMainScreenScaleFactor();
    uint64_t v14 = 139LL;
  }

  Class v15 = (&self->super.isa)[v14];
  if (*(double *)&v15 != ZOTTimeUnset)
  {
    double v16 = Current - *(double *)&v15;
    else {
      v13.n128_f64[0] = v21 / v16;
    }
    if (v16 < 0.2 || v13.n128_f64[0] > 125.0)
    {
      uint64_t v18 = 216LL;
      if (v6)
      {
        uint64_t v18 = 656LL;
        uint64_t v19 = &_updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastTrackpadVector;
      }

      else
      {
        uint64_t v19 = &_updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastVector;
      }

      SCRCMathUpdateAverage((char *)self + v18, 10LL, v13);
      if (*(double *)v19 <= 0.0 || vabdd_f64(*(double *)v19, *(double *)&v22) >= 20.0)
      {
        if (v6)
        {
          _updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastTrackpadVector = v22;
          goto LABEL_25;
        }

        _updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad__LastVector = v22;
      }

      else
      {
        if (v6)
        {
          *(void *)&self->_currentTrackpadVector = v22;
          goto LABEL_25;
        }

        *(void *)&self->_double currentVector = v22;
      }

- (id)_zoomSenderIdentifierData
{
  return +[AXEventData dataWithSender:](&OBJC_CLASS___AXEventData, "dataWithSender:", 3LL);
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

- (void)_scheduleTrackpadTapTimeout
{
}

- (void)_scheduleTapTimeout
{
}

- (void)_scheduleTapTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  else {
    int v7 = 1;
  }
  BOOL v8 = v7 == 0;
  double v9 = (objc_class *)(&dword_0 + 3);
  if (v8) {
    double v9 = (objc_class *)&dword_4;
  }
  uint64_t v10 = 160LL;
  if (v3) {
    uint64_t v10 = 161LL;
  }
  double v11 = 0.25;
  if ((&self->super.isa)[v10] == v9)
  {
    uint64_t v12 = 150LL;
    if (v3) {
      uint64_t v12 = 152LL;
    }
    double v11 = Current - *(double *)&(&self->super.isa)[v12] + 0.05;
  }

  uint64_t v13 = 200LL;
  if (v3) {
    uint64_t v13 = 201LL;
  }
  uint64_t v14 = (&self->super.isa)[v13];
  -[objc_class cancel](v14, "cancel");
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke;
  v15[3] = &unk_6CDF8;
  objc_copyWeak(v16, &location);
  BOOL v17 = v3;
  v15[4] = self;
  v16[1] = *(id *)&Current;
  -[objc_class afterDelay:processBlock:cancelBlock:]( v14,  "afterDelay:processBlock:cancelBlock:",  v15,  &__block_literal_global_199,  v11);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = _AXSVoiceOverTouchEnabled(WeakRetained);
  int v5 = *(unsigned __int8 *)(a1 + 56);
  if ((_DWORD)v3)
  {
    if (!*(_BYTE *)(a1 + 56)) {
      goto LABEL_17;
    }
    int v5 = 1;
  }

  uint64_t v6 = 1288LL;
  if (!v5) {
    uint64_t v6 = 1280LL;
  }
  uint64_t v7 = *(void *)&WeakRetained[v6];
  if (v7 == 2)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v5)
    {
      *((void *)WeakRetained + 151) = v10;
      double v11 = -1.0;
      double v12 = -1.0;
    }

    else
    {
      *((void *)WeakRetained + 149) = v10;
      double v11 = ZOTDenormalizePoint(v3, v4, *((double *)WeakRetained + 153));
      double v12 = v13;
    }

    if ([WeakRetained isAnyDisplayZoomedIn])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_3;
      v18[3] = &unk_6CBC0;
      v18[4] = WeakRetained;
      uint64_t v14 = v18;
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_196;
      block[3] = &unk_6CDD0;
      *(double *)&void block[5] = v11;
      *(double *)&block[6] = v12;
      block[4] = WeakRetained;
      char v17 = *(_BYTE *)(a1 + 56);
      uint64_t v14 = block;
    }

    dispatch_async(&_dispatch_main_q, v14);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_197;
    v15[3] = &unk_6CBC0;
    v15[4] = WeakRetained;
    double v9 = v15;
  }

  else
  {
    if (v7 != 1) {
      goto LABEL_17;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_2;
    v19[3] = &unk_6CDA8;
    char v20 = *(_BYTE *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    v19[4] = WeakRetained;
    void v19[5] = v8;
    double v9 = v19;
  }

  dispatch_async(&_dispatch_main_q, v9);
LABEL_17:
  if (*(_BYTE *)(a1 + 56))
  {
    *((void *)WeakRetained + 161) = 0LL;
    *((void *)WeakRetained + 152) = ZOTTimeUnset;
  }

  else
  {
    *((void *)WeakRetained + 160) = 0LL;
    *((void *)WeakRetained + 150) = ZOTTimeUnset;
    [WeakRetained _drainEventRepostQueue:*((void *)WeakRetained + 205) replayEvents:0 updateEventTimestamps:0];
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  uint64_t v4 = (void *)v2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48)) {
    double v6 = ZOTDenormalizePoint(v2, v3, 0.5);
  }
  else {
    [*(id *)(a1 + 32) _middleFingerForEvent:*(void *)(v5 + 176)];
  }
  [v4 fullscreenEventHandler:v5 didReceiveThreeFingerSingleTapAtLocation:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v7 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328LL) = v8;

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v9);
        }
        id v10 = objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v14),  "fullscreenEventHandler:didReceiveThreeFingerSingleTapAtLocation:",  *(void *)(a1 + 40),  ZOTDenormalizePoint((uint64_t)v10, v11, 0.5));
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v12 = v10;
    }

    while (v10);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = ZOOMLogEvents();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "3. did receive three finger double tap at {0,0}", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isMainDisplayZoomedIn])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
    objc_msgSend( v4,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  CGPointZero.x,  CGPointZero.y);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
    [v5 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
    *(void *)(*(void *)(a1 + 32) + 1328LL) = v6;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    double y = CGPointZero.y;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([*(id *)(a1 + 32) isDisplayZoomedIn:v13]) {
          objc_msgSend( v13,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  CGPointZero.x,  y);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_196(uint64_t a1)
{
  uint64_t v2 = ZOOMLogEvents();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = NSStringFromPoint(*(NSPoint *)(a1 + 40));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 138412290;
    BOOL v25 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "4. did receive three finger double tap at %@", buf, 0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  objc_msgSend( v6,  "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:",  *(void *)(a1 + 32),  *(double *)(a1 + 40),  *(double *)(a1 + 48));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v7 zoomLevelWithFullscreenEventHandler:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 32) + 1328LL) = v8;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "externalDisplayZoomDelegates", 0));
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v20;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        __int128 v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v14);
        uint64_t v16 = *(void *)(a1 + 32);
        double v17 = -1.0;
        double v18 = -1.0;
        if (!*(_BYTE *)(a1 + 56)) {
          double v17 = ZOTDenormalizePoint((uint64_t)v10, v11, 0.5);
        }
        id v10 = objc_msgSend(v15, "fullscreenEventHandler:didReceiveThreeFingerDoubleTapAtLocation:", v16, v17, v18);
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v12 = v10;
    }

    while (v10);
  }
}

void __49__ZOTFullscreenEventHandler__scheduleTapTimeout___block_invoke_197(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomDelegate]);
  [v2 updateSystemGestureDisablingAssertionsWithFullscreenEventHandler:*(void *)(a1 + 32)];
}

- (ZOTFullscreenEventHandlerDelegate)eventDelegate
{
  return (ZOTFullscreenEventHandlerDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
}

- (ZOTFullscreenZoomHandlerDelegate)zoomDelegate
{
  return (ZOTFullscreenZoomHandlerDelegate *)objc_loadWeakRetained((id *)&self->_zoomDelegate);
}

- (void)setZoomDelegate:(id)a3
{
}

- (NSPointerArray)externalDisplayZoomDelegates
{
  return self->_externalDisplayZoomDelegates;
}

- (void)setExternalDisplayZoomDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end