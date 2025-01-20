@interface ZWTouchEventProcessor
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTouchEvent:(id)a3;
- (BOOL)_handleWheelEvent:(id)a3;
- (BOOL)_handleZoomGreySupportAccessibilityEvent:(id)a3;
- (BOOL)_ignoreEventWhileStylusInUse:(id)a3;
- (BOOL)_isZoomContextID:(unsigned int)a3;
- (BOOL)_panBackwardOnMainDisplay;
- (BOOL)_panForwardOnMainDisplay;
- (BOOL)_toggleZoomOnMainDisplay;
- (CGPoint)_convertZoomOffset:(CGPoint)result toScreenCoordinatesFromInterfaceOrientation:(int64_t)a4;
- (CGPoint)_convertZoomPointToSystemPoint:(CGPoint)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6;
- (CGPoint)_flipCoordinates:(CGPoint)result orientation:(int64_t)a4 screenSize:(CGSize)a5;
- (CGPoint)_shiftPointForReplicators:(CGPoint)a3;
- (ZWTouchEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (id)fullscreenEventHandler;
- (id)zoomDelegateForEvent:(id)a3;
- (unint64_t)_mapAXEventToZoomGreyAction:(id)a3;
- (void)_cleanEventUpdateMap;
- (void)_dispatchZoomRemapEvent:(id)a3;
- (void)_dispatchZoomRemapEvent:(id)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6 applyZoom:(BOOL)a7 menuScreenRect:(CGRect)a8;
- (void)_dispatchZoomRemapUpdate:(id)a3;
- (void)_postCancelEvent;
- (void)_setupZoomGreyObservers;
- (void)_updateZoomHandGesturesActionCustomizations;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)dispatchEventToSystem:(id)a3;
- (void)postHandCancelWithSenderID:(unint64_t)a3;
@end

@implementation ZWTouchEventProcessor

- (ZWTouchEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___ZWTouchEventProcessor;
  v12 = -[ZWEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( &v32,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  v10,  v8,  v11,  v6);
  if (v12)
  {
    v13 = objc_alloc(&OBJC_CLASS___ZOTFullscreenEventHandler);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor HIDEventReceiveThread](v12, "HIDEventReceiveThread"));
    v15 = -[ZOTFullscreenEventHandler initWithEventThread:](v13, "initWithEventThread:", v14);
    fullscreenEventHandler = v12->_fullscreenEventHandler;
    v12->_fullscreenEventHandler = v15;

    -[ZOTFullscreenEventHandler setEventDelegate:](v12->_fullscreenEventHandler, "setEventDelegate:", v12);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fullScreenEventQueue = v12->_fullScreenEventQueue;
    v12->_fullScreenEventQueue = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    eventIdentifiersToFinalLocations = v12->_eventIdentifiersToFinalLocations;
    v12->_eventIdentifiersToFinalLocations = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___AXDispatchTimer);
    eventUpdateMapCleanerTimer = v12->_eventUpdateMapCleanerTimer;
    v12->_eventUpdateMapCleanerTimer = v21;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v12->_eventUpdateMapCleanerTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    objc_initWeak(&location, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    v28 = __118__ZWTouchEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
    v29 = &unk_6CB98;
    objc_copyWeak(&v30, &location);
    [v23 registerUpdateBlock:&v26 forRetrieveSelector:"zoomTrackpadGestureEnabled" withListener:v12];

    objc_destroyWeak(&v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", v26, v27, v28, v29));
    v12->_stealTrackpadGestures = [v24 zoomTrackpadGestureEnabled];

    -[ZWTouchEventProcessor _setupZoomGreyObservers](v12, "_setupZoomGreyObservers");
    objc_destroyWeak(&location);
  }

  return v12;
}

void __118__ZWTouchEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke( uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  WeakRetained[140] = [v1 zoomTrackpadGestureEnabled];
}

- (void)_setupZoomGreyObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v3 zoomHandGesturesActionCustomizations]);
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v4;

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __48__ZWTouchEventProcessor__setupZoomGreyObservers__block_invoke;
  v7[3] = &unk_6CB98;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"zoomHandGesturesActionCustomizations" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__ZWTouchEventProcessor__setupZoomGreyObservers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateZoomHandGesturesActionCustomizations];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ZWTouchEventProcessor;
  -[ZWEventProcessor dealloc](&v3, "dealloc");
}

- (id)fullscreenEventHandler
{
  return self->_fullscreenEventHandler;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 senderID] + 0x7FFFFFF7E8CE6C8ELL;
  if (v5 < 8 && ((0x87u >> v5) & 1) != 0
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityData]),
        v7 = (char *)[v6 eventSenderIdentifier],
        v6,
        v7 == (_BYTE *)&dword_0 + 3))
  {
    unsigned __int8 v8 = 0;
    goto LABEL_43;
  }

  if ([v4 type] == 3001)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    unsigned int v10 = [v9 eventType];

    if (v10 == 11)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor hidPostThread](self, "hidPostThread"));
      unsigned __int8 v8 = 1;
      [v11 performSelector:"_dispatchZoomRemapUpdate:" onTarget:self count:1 objects:v4];
      goto LABEL_42;
    }

    eventUpdateMapCleanerTimer = self->_eventUpdateMapCleanerTimer;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = __38__ZWTouchEventProcessor__handleEvent___block_invoke;
    v46[3] = &unk_6CBC0;
    v46[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](eventUpdateMapCleanerTimer, "afterDelay:processBlock:", v46, 1.0);
    id v29 = [v4 copy];
    unsigned __int8 v8 = -[ZWTouchEventProcessor _handleTouchEvent:](self, "_handleTouchEvent:", v29);
  }

  else if ([v4 type] == 1100 {
         || [v4 type] == 3200 && self->_stealTrackpadGestures
  }
         || [v4 type] != 10 && objc_msgSend(v4, "type") != 11)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[ZoomServicesKeyboardManager sharedInstance]( &OBJC_CLASS___ZoomServicesKeyboardManager,  "sharedInstance"));
    v13 = (char *)[v12 keyboardCommandForEvent:v4];

    if (v13 == (_BYTE *)&dword_0 + 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor fullscreenEventHandler](self, "fullscreenEventHandler"));
      unsigned __int8 v15 = [v14 isAnyDisplayZoomedIn];

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor fullscreenEventHandler](self, "fullscreenEventHandler"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
        unsigned int v18 = [v16 isDisplayZoomedIn:v17];

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
          [v19 eventProcessor:self didReceiveKeyboardEventWithCommand:2];
        }

        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor externalDisplayDelegates](self, "externalDisplayDelegates", 0LL));
        id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor fullscreenEventHandler](self, "fullscreenEventHandler"));
              unsigned int v27 = [v26 isDisplayZoomedIn:v25];

              if (v27) {
                [v25 eventProcessor:self didReceiveKeyboardEventWithCommand:2];
              }
            }

            id v22 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }

          while (v22);
        }
      }

      else
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
        [v30 eventProcessor:self didReceiveKeyboardEventWithCommand:2];

        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor externalDisplayDelegates](self, "externalDisplayDelegates"));
        id v31 = [v20 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v43;
          do
          {
            for (j = 0LL; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v43 != v33) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) eventProcessor:self didReceiveKeyboardEventWithCommand:2];
            }

            id v32 = [v20 countByEnumeratingWithState:&v42 objects:v48 count:16];
          }

          while (v32);
        }
      }
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor zoomDelegateForEvent:](self, "zoomDelegateForEvent:", v4));
      [v20 eventProcessor:self didReceiveKeyboardEventWithCommand:v13];
    }

    unsigned __int8 v8 = (unint64_t)(v13 - 17) < 0xFFFFFFFFFFFFFFFDLL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityData]);
  if ([v11 page] != (char *)&dword_0 + 2)
  {
LABEL_42:

    goto LABEL_43;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v36 = [v35 zoomHandGesturesEnabled];

  if (v36) {
    unsigned __int8 v8 = -[ZWTouchEventProcessor _handleZoomGreySupportAccessibilityEvent:]( self,  "_handleZoomGreySupportAccessibilityEvent:",  v4);
  }
LABEL_43:

  return v8;
}

void __38__ZWTouchEventProcessor__handleEvent___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hidPostThread]);
  [v2 performSelector:"_cleanEventUpdateMap" onTarget:*(void *)(a1 + 32) count:0 objects:0];
}

- (BOOL)_handleWheelEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchEventProcessor zoomDelegateForEvent:](self, "zoomDelegateForEvent:", v4));
  uint64_t v6 = (char *)[v4 scrollAmount];
  id v7 = [v4 scrollAccelAmount];

  LOBYTE(self) = [v5 eventProcessor:self didGetWheelEventWithDelta:&v6[(void)v7]];
  return (char)self;
}

- (BOOL)_handleTouchEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  unsigned int v6 = [v5 eventType];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 denormalizedEventRepresentation:0 descale:1]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paths]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstPath]);
  [v10 pathLocation];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = ZOTEventRealFingerCount(v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  v17 = v16;
  if (v16)
  {
    [v16 currentUIContextForEventProcessor:self];
  }

  else
  {
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
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    memset(v57, 0, sizeof(v57));
    __int128 v55 = 0u;
  }

  if (v6 == 1)
  {
    if (self->_userIsTouchingScreen)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke;
      block[3] = &unk_6CBC0;
      id v54 = v7;
      dispatch_async(&_dispatch_main_q, block);
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
    self->_BOOL stylusIsTouchingScreen = [v18 isStylus];

    self->_userIsTouchingScreen = 1;
    self->_BOOL firstTouchWentIntoLensContent = 0;
    -[ZOTFullscreenEventHandler setFirstTouchWentIntoLensContent:]( self->_fullscreenEventHandler,  "setFirstTouchWentIntoLensContent:",  0LL);
    self->_firstTouchWentIntoLensContentOuterPerimeter = 0;
    self->_firstTouchWentIntoSlug = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
    [v19 removeHomeGestureAssertionWithEventProcessor:self];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
    objc_msgSend(v20, "eventProcessor:didGetFirstTouchAtLocation:", self, v12, v14);

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_2;
    v52[3] = &unk_6CBC0;
    v52[4] = self;
    dispatch_async(&_dispatch_main_q, v52);
  }

  else
  {
    switch(v6)
    {
      case 6u:
      case 8u:
      case 0xAu:
        goto LABEL_9;
      case 9u:
        if (self->_userIsTouchingScreen)
        {
LABEL_9:
          self->_userIsTouchingScreen = 0;
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
          unsigned __int8 v22 = [v21 isStylus];
          BOOL stylusIsTouchingScreen = 0;
          if ((v22 & 1) == 0) {
            BOOL stylusIsTouchingScreen = self->_stylusIsTouchingScreen;
          }
          self->_BOOL stylusIsTouchingScreen = stylusIsTouchingScreen;

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
          [v24 lastFingerWasLiftedWithEventProcessor:self firstTouchWentIntoSlug:self->_firstTouchWentIntoSlug];

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
          [v25 removeHomeGestureAssertionWithEventProcessor:self];
        }

        break;
      default:
        break;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  unsigned __int8 v27 = [v26 isBrailleInputUIShowingWithEventProcessor:self];

  if ((v27 & 1) != 0) {
    goto LABEL_13;
  }
  __int16 v29 = WORD4(v68);
  if ((BYTE8(v68) & 0xA) != 0 || (BYTE8(v68) & 0x31) == 1)
  {
    if (v15 == 3)
    {
      -[ZOTFullscreenEventHandler postHandCancelWithSenderID:]( self->_fullscreenEventHandler,  "postHandCancelWithSenderID:",  [v7 senderID]);
LABEL_47:
      BOOL v28 = 1;
      goto LABEL_70;
    }

    goto LABEL_13;
  }

  if (v15 == 1)
  {
    if (self->_firstTouchWentIntoSlug)
    {
      if (v6 != 1)
      {
        if ((WORD4(v68) & 0x200) == 0)
        {
LABEL_20:
          if (!ZOTEventMeetsOrbThreshold(v7) || (WORD4(v68) & 0x800) != 0)
          {
LABEL_22:
            if (self->_firstTouchWentIntoSlug) {
              goto LABEL_23;
            }
            goto LABEL_35;
          }

uint64_t __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke(uint64_t a1)
{
  uint64_t result = AXIsInternalInstall();
  if ((_DWORD)result)
  {
    [*(id *)(a1 + 32) creatorHIDEvent];
    char v3 = 1;
    return _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"Zoom event state is messed up. We got first touch, but bookkeeping says we were already touching. If you can reproduce please file a bug with PEP Zoom. Event: %@ hid: %@");
  }

  return result;
}

void __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainDisplayDelegate]);
  [v2 enableZoomWindowHitTestingWithEventProcessor:*(void *)(a1 + 32)];
}

void __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainDisplayDelegate]);
  [v2 disableZoomWindowHitTestingWithEventProcessor:*(void *)(a1 + 32)];
}

- (id)zoomDelegateForEvent:(id)a3
{
  id v4 = a3;
  else {
    unsigned int lastPointerContextID = self->_lastPointerContextID;
  }
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  if ([v6 currentWindowContextIdForEventProcessor:self] != lastPointerContextID)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor externalDisplayDelegates](self, "externalDisplayDelegates", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (lastPointerContextID == [v12 currentWindowContextIdForEventProcessor:self])
          {
            id v13 = v12;

            unsigned int v6 = v13;
            goto LABEL_15;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (BOOL)_isZoomContextID:(unsigned int)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  unsigned int v6 = [v5 currentWindowContextIdForEventProcessor:self];

  if (v6 == a3) {
    return 1;
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor externalDisplayDelegates](self, "externalDisplayDelegates", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) currentWindowContextIdForEventProcessor:self] == a3)
        {
          BOOL v7 = 1;
          goto LABEL_13;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (CGPoint)_flipCoordinates:(CGPoint)result orientation:(int64_t)a4 screenSize:(CGSize)a5
{
  double v5 = a5.height - result.y;
  double v6 = a5.width - result.x;
  if (a4 == 4) {
    double x = v6;
  }
  else {
    double x = result.x;
  }
  if (a4 == 3) {
    result.CGFloat y = v5;
  }
  else {
    result.double x = x;
  }
  if (a4 == 2)
  {
    result.double x = v6;
    result.CGFloat y = v5;
  }

  return result;
}

- (CGPoint)_shiftPointForReplicators:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  BOOL v7 = v6;
  if (v6)
  {
    [v6 currentUIContextForEventProcessor:self];
  }

  else
  {
    uint64_t v12 = 0LL;
    __int128 v11 = 0u;
    __int128 v10 = 0u;
  }

  switch(v12)
  {
    case 0LL:
      double y = y - *((double *)&v10 + 1);
      break;
    case 1LL:
      double x = x - *((double *)&v10 + 1);
      break;
    case 2LL:
      double x = x + *(double *)&v11 - *((double *)&v10 + 1);
      break;
    case 3LL:
      double y = y + *((double *)&v11 + 1) - *((double *)&v10 + 1);
      break;
    default:
      break;
  }

  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)_convertZoomPointToSystemPoint:(CGPoint)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v10 = a4.origin.y;
  double v11 = a4.origin.x;
  double v12 = a3.y;
  double v13 = a3.x;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  __int128 v16 = v15;
  if (v15)
  {
    [v15 currentUIContextForEventProcessor:self];
  }

  else
  {
    __int128 v46 = 0u;
    memset(v45, 0, sizeof(v45));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
  }

  AX_CGRectGetCenter(v11, v10, width, height);
  if ((BYTE8(v46) & 0x20) == 0)
  {
    double v19 = x + v17 + (v13 - v17) / a6;
    double v20 = y + v18 + (v12 - v18) / a6;
    goto LABEL_22;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  unsigned __int8 v22 = (char *)[v21 currentInterfaceOrientationForEventProcessor:self];

  else {
    double v23 = v12;
  }
  else {
    double v24 = v13;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  [v25 currentScreenSizeForEventProcessor:self];
  double v27 = v26;
  double v29 = v28;

  -[ZWTouchEventProcessor _flipCoordinates:orientation:screenSize:]( self,  "_flipCoordinates:orientation:screenSize:",  v22,  v23,  v24,  v27,  v29);
  double v31 = v30;
  double v33 = v32;
  v48.double x = v30;
  v48.double y = v32;
  if (!CGRectContainsPoint(v45[0], v48))
  {
    __int128 v40 = v43;
    v49.double x = v31;
    v49.double y = v33;
    if (!CGRectContainsPoint(v45[1], v49) && (WORD4(v46) & 0x180) == 0)
    {
      if (self->_firstTouchWentIntoLensContent)
      {
        double v34 = *(double *)&v44 * 0.5
            + *(double *)&v43
            + (v31 - (*(double *)&v42 * 0.5 + *(double *)&v41)) / *(double *)&v42 * *(double *)&v44;
        double v35 = *((double *)&v44 + 1) * 0.5
            + *((double *)&v43 + 1)
            + (v33 - (*((double *)&v42 + 1) * 0.5 + *((double *)&v41 + 1)))
        unsigned int v36 = self;
      }

      else
      {
        if ((BYTE8(v46) & 0x40) != 0) {
          goto LABEL_20;
        }
        unsigned int v36 = self;
        double v34 = v31;
        double v35 = v33;
      }

      -[ZWTouchEventProcessor _shiftPointForReplicators:](v36, "_shiftPointForReplicators:", v34, v35, v43);
      double v31 = v37;
      double v33 = v38;
    }
  }

- (void)_cleanEventUpdateMap
{
  if (-[NSMutableDictionary count](self->_eventIdentifiersToFinalLocations, "count"))
  {
    -[NSMutableDictionary count](self->_eventIdentifiersToFinalLocations, "count");
    char v3 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"There are %u events pending update after %f seconds! Map: %@");
  }

  -[NSMutableDictionary removeAllObjects](self->_eventIdentifiersToFinalLocations, "removeAllObjects");
}

- (void)_dispatchZoomRemapUpdate:(id)a3
{
  id v27 = a3;
  id v4 = -[ZWSenderIDGenerationCountPair initWithSenderID:generationCount:]( [ZWSenderIDGenerationCountPair alloc],  "initWithSenderID:generationCount:",  [v27 senderID],  objc_msgSend(v27, "generationCount"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_eventIdentifiersToFinalLocations,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v27 handInfo]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pathsIncludingMayBeginEvents]);
    id v8 = [v7 count];
    id v9 = [v5 count];

    id v10 = [v5 count];
    if (v8 == v9)
    {
      if (v10)
      {
        uint64_t v11 = 0LL;
        unsigned int v12 = 1;
        do
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v11]);
          [v13 CGPointValue];
          double v15 = v14;
          double v17 = v16;
          double v18 = (void *)objc_claimAutoreleasedReturnValue([v27 handInfo]);
          double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pathsIncludingMayBeginEvents]);
          double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v11]);
          objc_msgSend(v20, "setPathLocation:", v15, v17);

          uint64_t v11 = v12;
        }

        while ((unint64_t)[v5 count] > v12++);
      }

      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
      double v23 = (void *)objc_claimAutoreleasedReturnValue([v27 handInfo]);
      else {
        unint64_t v24 = 0x8000000817319374LL;
      }
      [v22 sendHIDSystemEvent:v27 senderID:v24];
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v27 handInfo]);
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 paths]);
      [v26 count];
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Expected update to have %u paths, but it had %u! This is a serious problem!");
    }
  }

  else
  {
    [v27 generationCount];
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"DID NOT find update for event with generation count %llu!");
  }
}

- (BOOL)_ignoreEventWhileStylusInUse:(id)a3
{
  if (!self->_stylusIsTouchingScreen) {
    return 0;
  }
  char v3 = (void *)objc_claimAutoreleasedReturnValue([a3 handInfo]);
  unsigned int v4 = [v3 eventType];

  return v4 == 10 || (v4 & 0xFFFFFFFE) == 8;
}

- (void)_dispatchZoomRemapEvent:(id)a3
{
  id v4 = a3;
  if (!-[ZWTouchEventProcessor _ignoreEventWhileStylusInUse:](self, "_ignoreEventWhileStylusInUse:", v4))
  {
    if ([v4 willBeUpdated])
    {
      double v5 = -[ZWSenderIDGenerationCountPair initWithSenderID:generationCount:]( [ZWSenderIDGenerationCountPair alloc],  "initWithSenderID:generationCount:",  [v4 senderID],  objc_msgSend(v4, "generationCount"));
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pathsIncludingMayBeginEvents]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handInfo", 0));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pathsIncludingMayBeginEvents]);

      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * (void)i) pathLocation];
            double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
            [v8 addObject:v15];
          }

          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v12);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_eventIdentifiersToFinalLocations,  "setObject:forKeyedSubscript:",  v8,  v5);
    }

    self->_lastSentPathIndexMask = [v4 pathIndexMask];
    [v4 setUseOriginalHIDTime:1];
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    else {
      unint64_t v18 = 0x8000000817319374LL;
    }
    [v16 sendHIDSystemEvent:v4 senderID:v18];
  }
}

- (void)_dispatchZoomRemapEvent:(id)a3 lensFrame:(CGRect)a4 offset:(CGPoint)a5 zoomFactor:(double)a6 applyZoom:(BOOL)a7 menuScreenRect:(CGRect)a8
{
  BOOL v8 = a7;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  id v12 = v11;
  if (v11)
  {
    [v11 currentUIContextForEventProcessor:self];
  }

  else
  {
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 handInfo]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathsIncludingMayBeginEvents]);

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v35 objects:v58 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        __int128 v20 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        [v20 pathLocation];
        double v23 = v21;
        double v24 = v22;
        if (v8)
        {
          -[ZWTouchEventProcessor _convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:]( self,  "_convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:",  v21,  v22,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height,  a5.x,  a5.y,  *(void *)&a6);
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          v59.double x = v25;
          v59.double y = v27;
          if (!CGRectContainsPoint(a8, v59))
          {
            double v23 = v26;
            double v24 = v28;
          }
        }

        else if ((BYTE8(v57) & 0x20) != 0)
        {
          -[ZWTouchEventProcessor _convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:]( self,  "_convertZoomPointToSystemPoint:lensFrame:offset:zoomFactor:",  v21,  v22,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height,  a5.x,  a5.y,  *(void *)&a6);
          double v23 = v29;
          double v24 = v30;
        }

        AXNormalizePoint(1LL, v23, v24);
        objc_msgSend(v20, "setPathLocation:");
      }

      id v17 = [v15 countByEnumeratingWithState:&v35 objects:v58 count:16];
    }

    while (v17);
  }

  double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor hidPostThread](self, "hidPostThread"));
  [v31 performSelector:"_dispatchZoomRemapEvent:" onTarget:self count:1 objects:v10];
}

- (CGPoint)_convertZoomOffset:(CGPoint)result toScreenCoordinatesFromInterfaceOrientation:(int64_t)a4
{
  double v4 = -result.y;
  if (a4 == 4) {
    double y = result.y;
  }
  else {
    double y = result.x;
  }
  if (a4 == 4) {
    result.double y = -result.x;
  }
  if (a4 == 3)
  {
    double y = v4;
    result.double y = result.x;
  }

  if (a4 == 2) {
    double v6 = -result.x;
  }
  else {
    double v6 = y;
  }
  if (a4 == 2) {
    result.double y = v4;
  }
  result.double x = v6;
  return result;
}

- (void)dispatchEventToSystem:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  double v6 = v5;
  if (v5)
  {
    [v5 currentUIContextForEventProcessor:self];
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    *(void *)&__int128 v24 = 0LL;
    __int128 v22 = 0u;
    memset(&v21, 0, sizeof(v21));
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 record]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 denormalizedEventRepresentation:0 descale:1]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handInfo]);
  unsigned int v10 = [v9 eventType];

  if (v10 == 1)
  {
    self->_applyZoomToEventDispatch = 1;
    if ((BYTE8(v26) & 0x10) == 0)
    {
      if ((BYTE8(v26) & 0x80) != 0) {
        goto LABEL_8;
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 handInfo]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 paths]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstPath]);
      [v13 pathLocation];
      v27.double x = v14;
      v27.double y = v15;
      BOOL v16 = CGRectContainsPoint(v21, v27);

      if (!v16) {
LABEL_8:
      }
        self->_applyZoomToEventDispatch = 0;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  id v18 = [v17 currentInterfaceOrientationForEventProcessor:self];

  -[ZWTouchEventProcessor _convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:]( self,  "_convertZoomOffset:toScreenCoordinatesFromInterfaceOrientation:",  v18,  *((double *)&v25 + 1),  *(double *)&v26);
  -[ZWTouchEventProcessor _dispatchZoomRemapEvent:lensFrame:offset:zoomFactor:applyZoom:menuScreenRect:]( self,  "_dispatchZoomRemapEvent:lensFrame:offset:zoomFactor:applyZoom:menuScreenRect:",  v8,  self->_applyZoomToEventDispatch,  *(_OWORD *)&v21.origin,  *(_OWORD *)&v21.size,  v19,  v20,  *(double *)&v24,  v22,  v23);
}

- (void)_postCancelEvent
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation cancelEventForPathIndexMask:]( &OBJC_CLASS___AXEventRepresentation,  "cancelEventForPathIndexMask:",  0LL));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
  else {
    unint64_t v4 = 0x8000000817319374LL;
  }
  [v2 sendHIDSystemEvent:v5 senderID:v4];
}

- (void)postHandCancelWithSenderID:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor hidPostThread](self, "hidPostThread"));
  [v4 performSelector:"_postCancelEvent" onTarget:self count:0 objects:0];
}

- (void)disableSleepTimer:(BOOL)a3
{
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (a3)
  {
    if (!sleepTimerDisabledAssertion)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
      id v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v8 acquireAssertionToDisableIdleTimerWithReason:@"Accessibility-ZWTouchEventProcessor"]);
      double v6 = self->_sleepTimerDisabledAssertion;
      self->_sleepTimerDisabledAssertion = v5;
    }
  }

  else if (sleepTimerDisabledAssertion)
  {
    -[BSInvalidatable invalidate](sleepTimerDisabledAssertion, "invalidate");
    BOOL v7 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0LL;
  }

- (void)_updateZoomHandGesturesActionCustomizations
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  char v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v5 zoomHandGesturesActionCustomizations]);
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v3;
}

- (BOOL)_handleZoomGreySupportAccessibilityEvent:(id)a3
{
  unint64_t v4 = -[ZWTouchEventProcessor _mapAXEventToZoomGreyAction:](self, "_mapAXEventToZoomGreyAction:", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  double v6 = v5;
  if (v5) {
    [v5 currentUIContextForEventProcessor:self];
  }
  else {
    __int128 v8 = 0u;
  }

  if ((BYTE8(v8) & 0x80) != 0) {
    goto LABEL_7;
  }
  if (v4 == 3) {
    return -[ZWTouchEventProcessor _panBackwardOnMainDisplay](self, "_panBackwardOnMainDisplay");
  }
  if (v4 == 2) {
    return -[ZWTouchEventProcessor _panForwardOnMainDisplay](self, "_panForwardOnMainDisplay");
  }
LABEL_7:
  if (v4 == 1) {
    return -[ZWTouchEventProcessor _toggleZoomOnMainDisplay](self, "_toggleZoomOnMainDisplay");
  }
  return 0;
}

- (unint64_t)_mapAXEventToZoomGreyAction:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 accessibilityData]);
  handGestureCommandDict = self->_handGestureCommandDict;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 usage]));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](handGestureCommandDict, "objectForKeyedSubscript:", v6));

  id v8 = [v7 unsignedIntegerValue];
  return (unint64_t)v8;
}

- (BOOL)_toggleZoomOnMainDisplay
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  [v3 didGetToggleZoomGestureWithEventProcessor:self];

  return 1;
}

- (BOOL)_panForwardOnMainDisplay
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  [v3 eventProcessor:self didGetPanEventWithDelta:kZoomGreyPanValue];

  return 1;
}

- (BOOL)_panBackwardOnMainDisplay
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
  [v3 eventProcessor:self didGetPanEventWithDelta:-(uint64_t)kZoomGreyPanValue];

  return 1;
}

- (void).cxx_destruct
{
}

@end