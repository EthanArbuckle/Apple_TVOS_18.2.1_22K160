@interface VOTClickAndHoldButtonInterceptor
- (VOTClickAndHoldButtonInterceptor)initWithThreadKey:(id)a3;
- (double)holdDuration;
- (double)releaseDuration;
- (id)clickAndHoldHandler;
- (id)clickHandler;
- (id)holdHandler;
- (void)_drainQueueAndSendEventsToSystem:(BOOL)a3;
- (void)_holdTimerFired;
- (void)_processStateChangeWithEvent:(int64_t)a3 axEvent:(id)a4;
- (void)_releaseTimerFired;
- (void)_resetStateAndSendPendingEventsToSystem:(BOOL)a3;
- (void)buttonDownOccurred:(id)a3;
- (void)buttonUpOccurred:(id)a3;
- (void)dealloc;
- (void)setClickAndHoldHandler:(id)a3;
- (void)setClickHandler:(id)a3;
- (void)setHoldDuration:(double)a3;
- (void)setHoldHandler:(id)a3;
- (void)setReleaseDuration:(double)a3;
@end

@implementation VOTClickAndHoldButtonInterceptor

- (VOTClickAndHoldButtonInterceptor)initWithThreadKey:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VOTClickAndHoldButtonInterceptor;
  v5 = -[VOTClickAndHoldButtonInterceptor init](&v17, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("VOTClickAndHoldButtonInterceptor", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v5->_state = 0LL;
    v5->_holdDuration = 1.0;
    v5->_releaseDuration = 0.5;
    v10 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v5 selector:"_holdTimerFired" threadKey:v4];
    holdTimer = v5->_holdTimer;
    v5->_holdTimer = v10;

    v12 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v5 selector:"_releaseTimerFired" threadKey:v4];
    releaseTimer = v5->_releaseTimer;
    v5->_releaseTimer = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    eventQueue = v5->_eventQueue;
    v5->_eventQueue = (NSMutableArray *)v14;
  }

  return v5;
}

- (void)dealloc
{
  holdTimer = self->_holdTimer;
  if (holdTimer)
  {
    -[SCRCTargetSelectorTimer invalidate](holdTimer, "invalidate");
    id v4 = self->_holdTimer;
    self->_holdTimer = 0LL;
  }

  releaseTimer = self->_releaseTimer;
  if (releaseTimer)
  {
    -[SCRCTargetSelectorTimer invalidate](releaseTimer, "invalidate");
    dispatch_queue_attr_t v6 = self->_releaseTimer;
    self->_releaseTimer = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTClickAndHoldButtonInterceptor;
  -[VOTClickAndHoldButtonInterceptor dealloc](&v7, "dealloc");
}

- (void)buttonDownOccurred:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTClickAndHoldButtonInterceptor;
  -[VOTButtonInterceptor buttonDownOccurred:](&v9, "buttonDownOccurred:", v4);
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E5DF4;
  v7[3] = &unk_100176DA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)buttonUpOccurred:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTClickAndHoldButtonInterceptor;
  -[VOTButtonInterceptor buttonUpOccurred:](&v9, "buttonUpOccurred:", v4);
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E5EB4;
  v7[3] = &unk_100176DA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_processStateChangeWithEvent:(int64_t)a3 axEvent:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  p_state = &self->_state;
  switch(self->_state)
  {
    case 0LL:
      if (a3) {
        goto LABEL_27;
      }
      -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v6);
      -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_holdTimer, "dispatchAfterDelay:", self->_holdDuration);
      uint64_t v10 = 1LL;
      goto LABEL_26;
    case 1LL:
      if (!a3) {
        goto LABEL_32;
      }
      if (a3 == 1)
      {
        -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v6);
        -[SCRCTargetSelectorTimer cancel](self->_holdTimer, "cancel");
        -[SCRCTargetSelectorTimer dispatchAfterDelay:]( self->_releaseTimer,  "dispatchAfterDelay:",  self->_releaseDuration);
        uint64_t v10 = 2LL;
        goto LABEL_26;
      }

      if (a3 != 2) {
        goto LABEL_27;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTClickAndHoldButtonInterceptor holdHandler](self, "holdHandler"));

      if (v18)
      {
        v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[VOTClickAndHoldButtonInterceptor holdHandler](self, "holdHandler"));
        v19[2]();
      }

      uint64_t v10 = 4LL;
      goto LABEL_26;
    case 2LL:
      if (a3)
      {
        if (a3 == 3)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTClickAndHoldButtonInterceptor clickHandler](self, "clickHandler"));

          if (v11)
          {
            v12 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VOTClickAndHoldButtonInterceptor clickHandler](self, "clickHandler"));
            int v13 = v12[2]();

            uint64_t v14 = v13 ^ 1u;
          }

          else
          {
            uint64_t v14 = 1LL;
          }

          objc_super v17 = self;
        }

        else
        {
LABEL_27:
          uint64_t v20 = VOTLogEvent(v6, v7);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000F5B54(&self->_state, a3, v21);
          }

LABEL_30:
          objc_super v17 = self;
          uint64_t v14 = 0LL;
        }

- (void)_resetStateAndSendPendingEventsToSystem:(BOOL)a3
{
  BOOL v3 = a3;
  self->_state = 0LL;
  -[SCRCTargetSelectorTimer cancel](self->_holdTimer, "cancel");
  -[SCRCTargetSelectorTimer cancel](self->_releaseTimer, "cancel");
  -[VOTClickAndHoldButtonInterceptor _drainQueueAndSendEventsToSystem:](self, "_drainQueueAndSendEventsToSystem:", v3);
}

- (void)_holdTimerFired
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E624C;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_releaseTimerFired
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E62BC;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_drainQueueAndSendEventsToSystem:(BOOL)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v5 = self->_eventQueue;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        objc_super v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend( v4,  "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:",  *(void *)(*((void *)&v10 + 1) + 8 * (void)v9),  1,  0x8000000817319373,  (void)v10);
          usleep(0x3E8u);
          objc_super v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }
  }

  -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects", (void)v10);
}

- (double)holdDuration
{
  return self->_holdDuration;
}

- (void)setHoldDuration:(double)a3
{
  self->_holdDuration = a3;
}

- (double)releaseDuration
{
  return self->_releaseDuration;
}

- (void)setReleaseDuration:(double)a3
{
  self->_releaseDuration = a3;
}

- (id)clickHandler
{
  return self->_clickHandler;
}

- (void)setClickHandler:(id)a3
{
}

- (id)holdHandler
{
  return self->_holdHandler;
}

- (void)setHoldHandler:(id)a3
{
}

- (id)clickAndHoldHandler
{
  return self->_clickAndHoldHandler;
}

- (void)setClickAndHoldHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end