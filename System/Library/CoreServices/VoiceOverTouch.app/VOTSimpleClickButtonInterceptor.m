@interface VOTSimpleClickButtonInterceptor
- (BOOL)touchEventOccurred:(id)a3 inTVDirectTouch:(BOOL)a4;
- (NSMutableArray)eventQueue;
- (SCRCTargetSelectorTimer)timer;
- (VOTSimpleClickButtonInterceptor)initWithThreadKey:(id)a3 simpleClickHandler:(id)a4;
- (id)simpleClickHandler;
- (void)_drainQueue:(BOOL)a3;
- (void)_timerFired;
- (void)buttonDownOccurred:(id)a3;
- (void)buttonUpOccurred:(id)a3;
- (void)dealloc;
- (void)setEventQueue:(id)a3;
- (void)setSimpleClickHandler:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation VOTSimpleClickButtonInterceptor

- (VOTSimpleClickButtonInterceptor)initWithThreadKey:(id)a3 simpleClickHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VOTSimpleClickButtonInterceptor;
  v8 = -[VOTSimpleClickButtonInterceptor init](&v16, "init");
  if (v8)
  {
    id v9 = [objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v8 selector:"_timerFired" threadKey:v6];
    id simpleClickHandler = v8->_simpleClickHandler;
    v8->_id simpleClickHandler = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    timer = v8->_timer;
    v8->_timer = (SCRCTargetSelectorTimer *)v11;

    -[VOTSimpleClickButtonInterceptor setSimpleClickHandler:](v8, "setSimpleClickHandler:", v7);
    dispatch_queue_t v13 = dispatch_queue_create("ButtonInterceptorQueue", 0LL);
    v14 = *(void **)&v8->_clickDown;
    *(void *)&v8->_clickDown = v13;
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSimpleClickButtonInterceptor timer](self, "timer"));
  [v3 invalidate];

  v4 = *(void **)&self->_clickDown;
  *(void *)&self->_clickDown = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTSimpleClickButtonInterceptor;
  -[VOTSimpleClickButtonInterceptor dealloc](&v5, "dealloc");
}

- (void)buttonDownOccurred:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTSimpleClickButtonInterceptor;
  -[VOTButtonInterceptor buttonDownOccurred:](&v14, "buttonDownOccurred:", v4);
  *(&self->super._listensPassively + 1) = 1;
  objc_super v5 = *(dispatch_queue_s **)&self->_clickDown;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_1000E5540;
  v11 = &unk_100176DA8;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSimpleClickButtonInterceptor timer](self, "timer", v8, v9, v10, v11, v12));
  [v7 dispatchAfterDelay:0.3];
}

- (void)buttonUpOccurred:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VOTSimpleClickButtonInterceptor;
  -[VOTButtonInterceptor buttonUpOccurred:](&v16, "buttonUpOccurred:", v4);
  objc_super v5 = *(dispatch_queue_s **)&self->_clickDown;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1000E56B4;
  id v13 = &unk_100176DA8;
  objc_super v14 = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v10);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSimpleClickButtonInterceptor timer](self, "timer", v10, v11, v12, v13, v14));
  [v7 cancel];

  if (*(&self->super._listensPassively + 1)
    && (v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VOTSimpleClickButtonInterceptor simpleClickHandler](self, "simpleClickHandler")),
        int v9 = v8[2](),
        v8,
        v9))
  {
    -[VOTSimpleClickButtonInterceptor _drainQueue:](self, "_drainQueue:", 0LL);
  }

  else
  {
    -[VOTSimpleClickButtonInterceptor _drainQueue:](self, "_drainQueue:", 1LL);
    *(&self->super._listensPassively + 2) = 1;
  }

  *(&self->super._listensPassively + 1) = 0;
}

- (void)_timerFired
{
  *(&self->super._listensPassively + 1) = 0;
  *(&self->super._listensPassively + 2) = 1;
  -[VOTSimpleClickButtonInterceptor _drainQueue:](self, "_drainQueue:", 1LL);
}

- (BOOL)touchEventOccurred:(id)a3 inTVDirectTouch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 handInfo]);
  unsigned int v8 = [v7 eventType];

  if (v4)
  {
    if (v8 == 1 && [v6 fingerCount] == (id)2)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      [v9 sendTouchCancelledEvent];
    }

    BOOL v10 = 0;
  }

  else
  {
    BOOL v11 = v8 < 0xB;
    v12 = *(dispatch_queue_s **)&self->_clickDown;
    block[0] = _NSConcreteStackBlock;
    unsigned int v13 = v11 & (0x540u >> v8);
    block[1] = 3221225472LL;
    block[2] = sub_1000E5880;
    block[3] = &unk_10017A210;
    block[4] = self;
    BOOL v17 = v8 == 1;
    char v18 = v11 & (0x540u >> v8);
    id v16 = v6;
    dispatch_sync(v12, block);
    if (v8 == 1)
    {
      *(&self->super._listensPassively + 2) = 0;
    }

    else if (v13 && !*(&self->super._listensPassively + 2))
    {
      -[VOTSimpleClickButtonInterceptor _drainQueue:](self, "_drainQueue:", 0LL);
    }

    BOOL v10 = *(&self->super._listensPassively + 2);
    if (*(&self->super._listensPassively + 2)) {
      -[VOTSimpleClickButtonInterceptor _drainQueue:](self, "_drainQueue:", 1LL);
    }
  }

  return v10;
}

- (void)_drainQueue:(BOOL)a3
{
  v3 = *(dispatch_queue_s **)&self->_clickDown;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E5954;
  v4[3] = &unk_100177C50;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(v3, v4);
}

- (id)simpleClickHandler
{
  return self->_accessQueue;
}

- (void)setSimpleClickHandler:(id)a3
{
}

- (SCRCTargetSelectorTimer)timer
{
  return (SCRCTargetSelectorTimer *)self->_simpleClickHandler;
}

- (void)setTimer:(id)a3
{
}

- (NSMutableArray)eventQueue
{
  return (NSMutableArray *)self->_timer;
}

- (void)setEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end