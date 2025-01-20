@interface AXTouchAccommodationsEventProcessor
- (AXEventRepresentation)event;
- (AXEventRepresentation)finalTouchEvent;
- (AXEventRepresentation)initialTouchEvent;
- (AXTouchAccommodationsEventProcessor)init;
- (AXTouchAccommodationsEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (AXTouchAccommodationsEventProcessorDelegate)delegate;
- (BOOL)_bypassForSwipeGestureDueToEvent:(id)a3;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)_handleTimerEvents;
- (BOOL)_isLiftEvent:(unsigned int)a3;
- (BOOL)_shouldAllowBypassForSwipeGestures;
- (BOOL)_shouldPassAlongWithoutHandlingEvent:(id)a3;
- (BOOL)canBeginIgnoreRepeatTimer;
- (BOOL)shouldSendFakeTouchDownIfNeeded;
- (double)_distanceBetweenPath:(id)a3 otherPath:(id)a4;
- (double)_minimumDistanceForSwipeGestureBypass;
- (id)_pathAtInitialTouchForPathIndex:(unint64_t)a3;
- (id)_pathAtPreviousPointForPathIndex:(unint64_t)a3;
- (void)_clearEventsToReplayForSwipeGestureBypass;
- (void)_endHoldDurationAndAllowTapAssistance:(BOOL)a3;
- (void)_handleEventAfterTimerEnd;
- (void)_handleHoldDurationAfterTimerBegan;
- (void)_handleTapActivationAfterTimerBegan;
- (void)_handleTapActivationMethodActivateOnRelease;
- (void)_handleTapActivationMethodActivateOnTouch;
- (void)_initiateHoldDurationTimer;
- (void)_initiateIgnoreRepeatTimer;
- (void)_initiateTapTimeoutTimer;
- (void)_notifyUserEventOccurred;
- (void)_processTimerEventsFromCurrentState;
- (void)_sendFakeEvent:(id)a3 forTheFirstTime:(BOOL)a4;
- (void)_sendFakeEventAfterTimerEnded:(id)a3;
- (void)_sendHIDEventUnconditionally:(id)a3 shouldUseOriginalTime:(BOOL)a4;
- (void)_setTimerState:(int64_t)a3;
- (void)_trackUpdateStatusForEvent:(id)a3;
- (void)_updateTouchAccommodationsBasedOnTapActivation;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)setCanBeginIgnoreRepeatTimer:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFinalTouchEvent:(id)a3;
- (void)setInitialTouchEvent:(id)a3;
- (void)setShouldSendFakeTouchDownIfNeeded:(BOOL)a3;
@end

@implementation AXTouchAccommodationsEventProcessor

- (AXTouchAccommodationsEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___AXTouchAccommodationsEventProcessor;
  v12 = -[AXTouchAccommodationsEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( &v42,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  v10,  v8,  v11,  v6);
  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    sentGenerationsAnticipatingUpdate = v12->_sentGenerationsAnticipatingUpdate;
    v12->_sentGenerationsAnticipatingUpdate = (NSMutableSet *)v13;

    v12->_touchEventAfterIgnoreRepeatTimerBegan = 0;
    v12->_generationsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_3EC0;
    v38[3] = &unk_C4E8;
    v16 = v12;
    v39 = v16;
    objc_copyWeak(&v40, &location);
    [v15 registerUpdateBlock:v38 forRetrieveSelector:"touchAccommodationsIgnoreRepeatEnabled" withListener:v16];

    objc_destroyWeak(&v40);
    -[AXTouchAccommodationsEventProcessor setHIDEventFilterMask:](v16, "setHIDEventFilterMask:", 1LL);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("TouchAccommodationsHIDDispatchQueue", v18);
    hidDispatchQueue = v16->_hidDispatchQueue;
    v16->_hidDispatchQueue = (OS_dispatch_queue *)v19;

    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472LL;
    v35 = sub_3FE4;
    v36 = &unk_C510;
    objc_copyWeak(&v37, &location);
    -[AXTouchAccommodationsEventProcessor setHIDEventHandler:](v16, "setHIDEventHandler:", &v33);
    id v21 = objc_allocWithZone(&OBJC_CLASS___AXDispatchTimer);
    v22 = (AXDispatchTimer *)objc_msgSend(v21, "initWithTargetSerialQueue:", v16->_hidDispatchQueue, v33, v34, v35, v36);
    tapTimeoutTimer = v16->_tapTimeoutTimer;
    v16->_tapTimeoutTimer = v22;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v16->_tapTimeoutTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v24 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:v16->_hidDispatchQueue];
    holdDurationTimer = v16->_holdDurationTimer;
    v16->_holdDurationTimer = v24;

    v26 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:v16->_hidDispatchQueue];
    ignoreRepeatTimer = v16->_ignoreRepeatTimer;
    v16->_ignoreRepeatTimer = v26;

    v28 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  v16->_hidDispatchQueue);
    updateSetMaintenanceTimer = v16->_updateSetMaintenanceTimer;
    v16->_updateSetMaintenanceTimer = v28;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v16->_updateSetMaintenanceTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v16->_shouldSendFakeTouchDownIfNeeded = 1;
    dispatch_queue_t v30 = dispatch_queue_create("TouchAccommodationsEventsToReplay", 0LL);
    eventsToReplayLock = v16->_eventsToReplayLock;
    v16->_eventsToReplayLock = (OS_dispatch_queue *)v30;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (AXTouchAccommodationsEventProcessor)init
{
  return -[AXTouchAccommodationsEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( self,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  TouchAccommodationsHIDEventTapIdentifier,  35LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTouchAccommodationsEventProcessor;
  -[AXTouchAccommodationsEventProcessor dealloc](&v3, "dealloc");
}

- (void)_setTimerState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state == a3)
  {
    if (a3 == 2)
    {
      self->_int64_t state = 2LL;
      -[AXTouchAccommodationsEventProcessor _initiateTapTimeoutTimer](self, "_initiateTapTimeoutTimer");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paths]);
      [v6 eventProcessor:self didResetTouchAccommodationsProgressAtPathInfos:v9];
LABEL_4:

LABEL_5:
      -[AXTouchAccommodationsEventProcessor _handleTapActivationAfterTimerBegan]( self,  "_handleTapActivationAfterTimerBegan");
    }
  }

  else
  {
    switch(state)
    {
      case 0LL:
        switch(a3)
        {
          case 0LL:
            goto LABEL_22;
          case 1LL:
            self->_int64_t state = 1LL;
            -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 1LL);
            -[AXTouchAccommodationsEventProcessor _initiateHoldDurationTimer](self, "_initiateHoldDurationTimer");
            id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
            id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handInfo]);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 paths]);
            [v10 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v13];

            -[AXTouchAccommodationsEventProcessor _handleHoldDurationAfterTimerBegan]( self,  "_handleHoldDurationAfterTimerBegan");
            break;
          case 2LL:
            self->_int64_t state = 2LL;
            -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 1LL);
            -[AXTouchAccommodationsEventProcessor _initiateTapTimeoutTimer](self, "_initiateTapTimeoutTimer");
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
            v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
            v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paths]);
            [v6 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v9];
            goto LABEL_4;
          case 3LL:
            goto LABEL_23;
          default:
            return;
        }

        break;
      case 1LL:
        switch(a3)
        {
          case 0LL:
            self->_int64_t state = 0LL;
            -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 0LL);
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
            [v15 didStopTimersInEventProcessor:self];

            goto LABEL_22;
          case 2LL:
            self->_int64_t state = 2LL;
            -[AXTouchAccommodationsEventProcessor _initiateTapTimeoutTimer](self, "_initiateTapTimeoutTimer");
            -[AXTouchAccommodationsEventProcessor _updateTouchAccommodationsBasedOnTapActivation]( self,  "_updateTouchAccommodationsBasedOnTapActivation");
            goto LABEL_5;
          case 3LL:
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
            [v16 didStopTimersInEventProcessor:self];

            self->_int64_t state = 0LL;
            break;
          case 4LL:
            self->_int64_t state = 4LL;
            -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 0LL);
            dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
            [v17 didStopTimersInEventProcessor:self];

            goto LABEL_31;
          default:
            return;
        }

        break;
      case 2LL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
        [v14 didStopTimersInEventProcessor:self];

        switch(a3)
        {
          case 0LL:
            goto LABEL_14;
          case 3LL:
            self->_int64_t state = 3LL;
            goto LABEL_25;
          case 4LL:
            self->_int64_t state = 4LL;
            -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 0LL);
LABEL_31:
            -[AXTouchAccommodationsEventProcessor _handleEventAfterTimerEnd](self, "_handleEventAfterTimerEnd");
            break;
        }

        break;
      case 3LL:
        if (!a3)
        {
LABEL_14:
          self->_int64_t state = 0LL;
          -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 0LL);
          goto LABEL_22;
        }

        break;
      case 4LL:
        if (a3 == 3)
        {
LABEL_23:
          self->_int64_t state = 3LL;
          -[AXTouchAccommodationsEventProcessor disableSleepTimer:](self, "disableSleepTimer:", 1LL);
LABEL_25:
          -[AXTouchAccommodationsEventProcessor _initiateIgnoreRepeatTimer](self, "_initiateIgnoreRepeatTimer");
        }

        else if (!a3)
        {
          self->_int64_t state = 0LL;
          goto LABEL_22;
        }

        break;
      default:
        if (!a3) {
LABEL_22:
        }
          -[AXTouchAccommodationsEventProcessor _clearEventsToReplayForSwipeGestureBypass]( self,  "_clearEventsToReplayForSwipeGestureBypass");
        break;
    }
  }

- (void)_initiateHoldDurationTimer
{
  holdDurationTimer = self->_holdDurationTimer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 touchAccommodationsHoldDuration];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_457C;
  v7[3] = &unk_C538;
  objc_copyWeak(&v8, &location);
  -[AXDispatchTimer afterDelay:processBlock:](holdDurationTimer, "afterDelay:processBlock:", v7, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_initiateTapTimeoutTimer
{
  tapTimeoutTimer = self->_tapTimeoutTimer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 touchAccommodationsTapActivationTimeout];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_46AC;
  v7[3] = &unk_C538;
  objc_copyWeak(&v8, &location);
  -[AXDispatchTimer afterDelay:processBlock:](tapTimeoutTimer, "afterDelay:processBlock:", v7, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_initiateIgnoreRepeatTimer
{
  ignoreRepeatTimer = self->_ignoreRepeatTimer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 touchAccommodationsIgnoreRepeatDuration];
  double v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_47D4;
  v7[3] = &unk_C538;
  objc_copyWeak(&v8, &location);
  -[AXDispatchTimer afterDelay:processBlock:](ignoreRepeatTimer, "afterDelay:processBlock:", v7, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleEventAfterTimerEnd
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v7 = [v6 touchAccommodationsIgnoreRepeatEnabled];

    if (v7) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 0LL;
    }
    -[AXTouchAccommodationsEventProcessor _setTimerState:](self, "_setTimerState:", v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
    -[AXTouchAccommodationsEventProcessor _sendFakeEvent:forTheFirstTime:](self, "_sendFakeEvent:forTheFirstTime:");
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
    -[AXTouchAccommodationsEventProcessor _sendFakeEventAfterTimerEnded:](self, "_sendFakeEventAfterTimerEnded:");
  }
}

- (void)_processTimerEventsFromCurrentState
{
  int64_t state = self->_state;
  switch(state)
  {
    case 1LL:
      -[AXTouchAccommodationsEventProcessor _handleHoldDurationAfterTimerBegan]( self,  "_handleHoldDurationAfterTimerBegan");
      break;
    case 2LL:
      -[AXTouchAccommodationsEventProcessor _handleTapActivationAfterTimerBegan]( self,  "_handleTapActivationAfterTimerBegan");
      break;
    case 4LL:
      -[AXTouchAccommodationsEventProcessor _handleEventAfterTimerEnd](self, "_handleEventAfterTimerEnd");
      break;
  }

- (BOOL)_handleTimerEvents
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 touchAccommodationsHoldDurationEnabled])
  {

LABEL_4:
    hidDispatchQueue = (dispatch_queue_s *)self->_hidDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_49D8;
    block[3] = &unk_C3A8;
    block[4] = self;
    dispatch_async(hidDispatchQueue, block);
    return 1;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 touchAccommodationsTapActivationMethod];

  if (v5) {
    goto LABEL_4;
  }
  return 0;
}

- (void)_sendFakeEventAfterTimerEnded:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[AXTouchAccommodationsEventProcessor shouldSendFakeTouchDownIfNeeded](self, "shouldSendFakeTouchDownIfNeeded");
  if (v4) {
    -[AXTouchAccommodationsEventProcessor setShouldSendFakeTouchDownIfNeeded:]( self,  "setShouldSendFakeTouchDownIfNeeded:",  0LL);
  }
  -[AXTouchAccommodationsEventProcessor _sendFakeEvent:forTheFirstTime:]( self,  "_sendFakeEvent:forTheFirstTime:",  v5,  v4);
}

- (void)_trackUpdateStatusForEvent:(id)a3
{
  id v10 = a3;
  if ([v10 willBeUpdated])
  {
    id v4 = [v10 generationCount];
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    sentGenerationsAnticipatingUpdate = self->_sentGenerationsAnticipatingUpdate;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v4));
    -[NSMutableSet addObject:](sentGenerationsAnticipatingUpdate, "addObject:", v7);
LABEL_5:

    os_unfair_lock_unlock(p_generationsLock);
    goto LABEL_6;
  }

  if ([v10 isUpdate])
  {
    id v8 = [v10 generationCount];
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    id v9 = self->_sentGenerationsAnticipatingUpdate;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v8));
    -[NSMutableSet removeObject:](v9, "removeObject:", v7);
    goto LABEL_5;
  }

- (void)_sendHIDEventUnconditionally:(id)a3 shouldUseOriginalTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
  unint64_t v7 = (unint64_t)[v6 handEventMask] & 0xF042000;

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
  [v8 setAdditionalHandEventFlagsForGeneratedEvents:v7];

  [v5 setUseOriginalHIDTime:v4];
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
  [v9 sendHIDSystemEvent:v5 senderID:0x8000000817319376];
}

- (void)_sendFakeEvent:(id)a3 forTheFirstTime:(BOOL)a4
{
  id v6 = a3;
  -[AXTouchAccommodationsEventProcessor _willSendEvent:](self, "_willSendEvent:", v6);
  hidDispatchQueue = (dispatch_queue_s *)self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4C90;
  block[3] = &unk_C560;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(hidDispatchQueue, block);
}

- (BOOL)_isLiftEvent:(unsigned int)a3
{
  return (a3 < 0xB) & (0x640u >> a3);
}

- (void)_handleTapActivationMethodActivateOnTouch
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor initialTouchEvent](self, "initialTouchEvent"));
  -[AXTouchAccommodationsEventProcessor _willSendEvent:](self, "_willSendEvent:", v3);

  hidDispatchQueue = (dispatch_queue_s *)self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4DE0;
  block[3] = &unk_C3A8;
  void block[4] = self;
  dispatch_async(hidDispatchQueue, block);
}

- (void)_handleTapActivationMethodActivateOnRelease
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor finalTouchEvent](self, "finalTouchEvent"));
  -[AXTouchAccommodationsEventProcessor _willSendEvent:](self, "_willSendEvent:", v3);

  hidDispatchQueue = (dispatch_queue_s *)self->_hidDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4F4C;
  block[3] = &unk_C3A8;
  void block[4] = self;
  dispatch_async(hidDispatchQueue, block);
}

- (id)_pathAtPreviousPointForPathIndex:(unint64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v4 = self->_pointOfReferencePaths;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "pathIndex", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (void)_handleTapActivationAfterTimerBegan
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (v5)
  {
    -[AXTouchAccommodationsEventProcessor _setTimerState:](self, "_setTimerState:", 0LL);
    -[AXDispatchTimer cancel](self->_tapTimeoutTimer, "cancel");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    if ([v6 touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 1)
    {
      -[AXTouchAccommodationsEventProcessor _handleTapActivationMethodActivateOnTouch]( self,  "_handleTapActivationMethodActivateOnTouch");
    }

    else if ([v6 touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 2)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
      id v8 = (AXEventRepresentation *)[v7 copy];
      finalTouchEvent = self->_finalTouchEvent;
      self->_finalTouchEvent = v8;

      -[AXTouchAccommodationsEventProcessor _handleTapActivationMethodActivateOnRelease]( self,  "_handleTapActivationMethodActivateOnRelease");
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handInfo]);
  unsigned int v12 = [v11 eventType];

  if (v12 == 2)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    __int128 v14 = (char *)[v13 touchAccommodationsTapActivationMethod];

    if (v14 == (_BYTE *)&dword_0 + 2)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event", 0LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handInfo]);
      dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 paths]);

      id v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            v23 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsEventProcessor _pathAtPreviousPointForPathIndex:]( self,  "_pathAtPreviousPointForPathIndex:",  [v22 pathIndex]));
            -[AXTouchAccommodationsEventProcessor _distanceBetweenPath:otherPath:]( self,  "_distanceBetweenPath:otherPath:",  v22,  v23);
            if (v24 > 40.0)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
              v26 = (void *)objc_claimAutoreleasedReturnValue([v25 handInfo]);
              v27 = (NSArray *)objc_claimAutoreleasedReturnValue([v26 paths]);
              pointOfReferencePaths = self->_pointOfReferencePaths;
              self->_pointOfReferencePaths = v27;

              -[AXTouchAccommodationsEventProcessor _setTimerState:](self, "_setTimerState:", 2LL);
              goto LABEL_19;
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

- (void)_updateTouchAccommodationsBasedOnTapActivation
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v4 = (char *)[v3 touchAccommodationsTapActivationMethod];

  if (v4 != (_BYTE *)&dword_0 + 1)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 paths]);
    [v8 eventProcessor:self didUpdateTouchAccommodationsAtPathInfos:v7];
  }

- (void)_handleHoldDurationAfterTimerBegan
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor event](self, "event"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  unsigned int v5 = -[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", [v4 eventType]);

  if (!v5) {
    return;
  }
  -[AXDispatchTimer cancel](self->_holdDurationTimer, "cancel");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v7 = Current;
  int holdDurationCancelCount = self->_holdDurationCancelCount;
  if (!holdDurationCancelCount)
  {
    self->_firstHoldDurationCancelTime = Current;
    int v11 = 1;
LABEL_9:
    self->_int holdDurationCancelCount = v11;
    goto LABEL_10;
  }

  unsigned int v9 = holdDurationCancelCount + 1;
  self->_int holdDurationCancelCount = v9;
  if (v9 >= 0xA)
  {
    if (Current - self->_firstHoldDurationCancelTime <= 3.0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
      [v10 panickedHoldDurationInEventProcessor:self];
    }

    int v11 = 0;
    goto LABEL_9;
  }

- (void)_endHoldDurationAndAllowTapAssistance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[AXDispatchTimer cancel](self->_holdDurationTimer, "cancel");
  int64_t state = self->_state;
  uint64_t v7 = AXLogTouchAccommodations(v5);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = v8;
  if (state == 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_6AE8(v9);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v11 = [v10 touchAccommodationsTapActivationMethod];

    if (v11 && v3)
    {
      unsigned int v12 = self;
      uint64_t v13 = 2LL;
    }

    else
    {
      -[AXTouchAccommodationsEventProcessor _clearEventsToReplayForSwipeGestureBypass]( self,  "_clearEventsToReplayForSwipeGestureBypass");
      unsigned int v12 = self;
      uint64_t v13 = 4LL;
    }

    -[AXTouchAccommodationsEventProcessor _setTimerState:](v12, "_setTimerState:", v13);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_6B84(&self->_state, v9);
    }
  }

- (BOOL)_shouldPassAlongWithoutHandlingEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isUpdate])
  {
    p_generationsLock = &self->_generationsLock;
    os_unfair_lock_lock(&self->_generationsLock);
    sentGenerationsAnticipatingUpdate = self->_sentGenerationsAnticipatingUpdate;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v4 generationCount]));
    unsigned __int8 v8 = -[NSMutableSet containsObject:](sentGenerationsAnticipatingUpdate, "containsObject:", v7);

    os_unfair_lock_unlock(p_generationsLock);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldAllowBypassForSwipeGestures
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 touchAccommodationsAllowsSwipeGesturesToBypass];

  return v3;
}

- (id)_pathAtInitialTouchForPathIndex:(unint64_t)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor initialTouchEvent](self, "initialTouchEvent", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paths]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v11 pathIndex] == a3)
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (double)_minimumDistanceForSwipeGestureBypass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 touchAccommodationsSwipeGestureMinimumDistance];
  double v4 = v3;

  return v4;
}

- (BOOL)_bypassForSwipeGestureDueToEvent:(id)a3
{
  id v4 = a3;
  if (!-[AXTouchAccommodationsEventProcessor _shouldAllowBypassForSwipeGestures]( self,  "_shouldAllowBypassForSwipeGestures")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AccessibilityFrameworks/Source/TouchAccommodationsUIServer/AXTouchAccommodat ionsEventProcessor.m",  644LL,  "-[AXTouchAccommodationsEventProcessor _bypassForSwipeGestureDueToEvent:]",  @"Should not have been allowed to try to bypass hold duration.");
  }
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paths]);

  id v7 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v55;
    *(void *)&__int128 v8 = 138477827LL;
    __int128 v48 = v8;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v55 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsEventProcessor _pathAtInitialTouchForPathIndex:]( self,  "_pathAtInitialTouchForPathIndex:",  objc_msgSend(v11, "pathIndex", v48)));
      if (v12)
      {
        -[AXTouchAccommodationsEventProcessor _distanceBetweenPath:otherPath:]( self,  "_distanceBetweenPath:otherPath:",  v11,  v12);
        double v14 = v13;
        id v15 = -[AXTouchAccommodationsEventProcessor _minimumDistanceForSwipeGestureBypass]( self,  "_minimumDistanceForSwipeGestureBypass");
        if (v14 >= v16)
        {
          uint64_t v19 = AXLogTouchAccommodations(v15);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            sub_6C2C(v20, v22, v23, v24, v25, v26, v27, v28);
          }

          uint64_t v30 = AXLogTouchAccommodations(v29);
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            sub_6BF8(v31, v32, v33, v34, v35, v36, v37, v38);
          }

          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v60 = 0x3032000000LL;
          v61 = sub_5DB4;
          v62 = sub_5DC4;
          id v63 = 0LL;
          eventsToReplayLock = (dispatch_queue_s *)self->_eventsToReplayLock;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_5DCC;
          block[3] = &unk_C588;
          void block[4] = self;
          void block[5] = &buf;
          dispatch_sync(eventsToReplayLock, block);
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v40 = *(id *)(*((void *)&buf + 1) + 40LL);
          id v41 = [v40 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v50;
            do
            {
              for (i = 0LL; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v50 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
                -[AXTouchAccommodationsEventProcessor _willSendEvent:](self, "_willSendEvent:", v44);
                -[AXTouchAccommodationsEventProcessor _sendHIDEventUnconditionally:shouldUseOriginalTime:]( self,  "_sendHIDEventUnconditionally:shouldUseOriginalTime:",  v44,  1LL);
              }

              id v41 = [v40 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }

            while (v41);
          }

          -[AXTouchAccommodationsEventProcessor setShouldSendFakeTouchDownIfNeeded:]( self,  "setShouldSendFakeTouchDownIfNeeded:",  0LL);
          int64_t state = self->_state;
          if (state != 2)
          {
            if (state == 1)
            {
              -[AXTouchAccommodationsEventProcessor _endHoldDurationAndAllowTapAssistance:]( self,  "_endHoldDurationAndAllowTapAssistance:",  0LL);
LABEL_34:
              _Block_object_dispose(&buf, 8);

              BOOL v46 = 1;
              goto LABEL_35;
            }

            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AccessibilityFrameworks/Source/TouchAccommodationsUIServer/AXTouchAc commodationsEventProcessor.m",  686LL,  "-[AXTouchAccommodationsEventProcessor _bypassForSwipeGestureDueToEvent:]",  @"Attempted to bypass with swipe gesture, but neither Hold Duration nor Tap Assistance was in progress");
          }

          -[AXTouchAccommodationsEventProcessor _setTimerState:](self, "_setTimerState:", 4LL);
          goto LABEL_34;
        }
      }

      else
      {
        uint64_t v17 = AXLogTouchAccommodations(0LL);
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = v48;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_debug_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "Path with no initial touch path: %{private}@",  (uint8_t *)&buf,  0xCu);
        }
      }

      if (v7 == (id)++v10)
      {
        id v7 = [v6 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  BOOL v46 = 0;
LABEL_35:

  return v46;
}

- (void)_clearEventsToReplayForSwipeGestureBypass
{
  uint64_t v3 = AXLogTouchAccommodations(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_6C94(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  eventsToReplayLock = (dispatch_queue_s *)self->_eventsToReplayLock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_5E9C;
  block[3] = &unk_C3A8;
  void block[4] = self;
  dispatch_sync(eventsToReplayLock, block);
}

- (void)setFinalTouchEvent:(id)a3
{
}

- (AXEventRepresentation)finalTouchEvent
{
  return self->_finalTouchEvent;
}

- (void)setShouldSendFakeTouchDownIfNeeded:(BOOL)a3
{
  self->_shouldSendFakeTouchDownIfNeeded = a3;
}

- (BOOL)shouldSendFakeTouchDownIfNeeded
{
  return self->_shouldSendFakeTouchDownIfNeeded;
}

- (void)setInitialTouchEvent:(id)a3
{
}

- (AXEventRepresentation)initialTouchEvent
{
  return self->_initialTouchEvent;
}

- (void)setEvent:(id)a3
{
}

- (AXEventRepresentation)event
{
  return self->_event;
}

- (BOOL)_handleEvent:(id)a3
{
  id v4 = a3;
  -[AXTouchAccommodationsEventProcessor _notifyUserEventOccurred](self, "_notifyUserEventOccurred");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  id v7 = [v6 eventType];

  id v8 = [v4 senderID];
  updateSetMaintenanceTimer = self->_updateSetMaintenanceTimer;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_63AC;
  v48[3] = &unk_C3A8;
  v48[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](updateSetMaintenanceTimer, "afterDelay:processBlock:", v48, 30.0);
  id v10 = [v5 touchAccommodationsUsageConfirmed];
  if ((_DWORD)v10
    && ((unint64_t)v8 + 0x7FFFFFF7E8CE6C8FLL >= 9 || ((0x12Bu >> ((_BYTE)v8 - 113)) & 1) == 0)
    && !_AXSVoiceOverTouchEnabled(v10))
  {
    id v13 = [v4 copy];
    hidDispatchQueue = (dispatch_queue_s *)self->_hidDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_6444;
    block[3] = &unk_C470;
    void block[4] = self;
    id v15 = v13;
    id v47 = v15;
    dispatch_async(hidDispatchQueue, block);
    if (-[AXTouchAccommodationsEventProcessor _shouldPassAlongWithoutHandlingEvent:]( self,  "_shouldPassAlongWithoutHandlingEvent:",  v4))
    {
LABEL_8:
      -[AXTouchAccommodationsEventProcessor _trackUpdateStatusForEvent:]( self,  "_trackUpdateStatusForEvent:",  v4,  v27,  v28,  v29,  v30,  v31);
      BOOL v11 = 0;
LABEL_38:

      goto LABEL_6;
    }

    if ([v4 isUpdate])
    {
LABEL_37:
      BOOL v11 = 1;
      goto LABEL_38;
    }

    if ([v5 touchAccommodationsHoldDurationEnabled] && self->_state == 1)
    {
      double v16 = (dispatch_queue_s *)self->_hidDispatchQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_644C;
      v45[3] = &unk_C3A8;
      v45[4] = self;
      dispatch_async(v16, v45);
    }

    if ([v5 touchAccommodationsTapActivationMethod] && self->_state == 2)
    {
      uint64_t v17 = (dispatch_queue_s *)self->_hidDispatchQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_6454;
      v44[3] = &unk_C3A8;
      v44[4] = self;
      dispatch_async(v17, v44);
    }

    if ((_DWORD)v7 != 1)
    {
      if (self->_touchEventAfterIgnoreRepeatTimerBegan) {
        unsigned __int8 v19 = 1;
      }
      else {
        unsigned __int8 v19 = -[AXTouchAccommodationsEventProcessor _handleTimerEvents](self, "_handleTimerEvents");
      }
      if (-[AXTouchAccommodationsEventProcessor _isLiftEvent:](self, "_isLiftEvent:", v7))
      {
        uint64_t v23 = (dispatch_queue_s *)self->_hidDispatchQueue;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_652C;
        v34[3] = &unk_C5D8;
        id v35 = v5;
        uint64_t v36 = self;
        int v37 = (int)v7;
        dispatch_async(v23, v34);
      }

- (void)disableSleepTimer:(BOOL)a3
{
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (a3)
  {
    if (!sleepTimerDisabledAssertion)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
      uint64_t v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v8 acquireAssertionToDisableIdleTimerWithReason:@"TouchAccommodations"]);
      uint64_t v6 = self->_sleepTimerDisabledAssertion;
      self->_sleepTimerDisabledAssertion = v5;
    }
  }

  else if (sleepTimerDisabledAssertion)
  {
    -[BSInvalidatable invalidate](sleepTimerDisabledAssertion, "invalidate");
    id v7 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0LL;
  }

- (void)_notifyUserEventOccurred
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_67D8;
  block[3] = &unk_C3A8;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (double)_distanceBetweenPath:(id)a3 otherPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  AXDeviceGetMainScreenBounds();
  double v8 = v7;
  double v10 = v9;
  [v6 pathLocation];
  double v12 = v11;
  double v14 = v13;

  [v5 pathLocation];
  double v16 = v15;
  double v18 = v17;

  AX_CGPointGetDistanceToPoint(v12 * v8, v14 * v10, v8 * v16, v10 * v18);
  return result;
}

- (AXTouchAccommodationsEventProcessorDelegate)delegate
{
  return (AXTouchAccommodationsEventProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canBeginIgnoreRepeatTimer
{
  return self->_canBeginIgnoreRepeatTimer;
}

- (void)setCanBeginIgnoreRepeatTimer:(BOOL)a3
{
  self->_canBeginIgnoreRepeatTimer = a3;
}

- (void).cxx_destruct
{
}

@end