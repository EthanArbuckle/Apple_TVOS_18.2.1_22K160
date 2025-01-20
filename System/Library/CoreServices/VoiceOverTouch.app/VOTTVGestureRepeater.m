@interface VOTTVGestureRepeater
- (SCRCTargetSelectorTimer)repeaterTimer;
- (SCRCThread)targetThread;
- (VOTTVGestureRepeater)initWithThread:(id)a3;
- (VOTTVGestureRepeaterDelegate)delegate;
- (double)_delayForCurrentRepeatCount;
- (id)selectButtonReceivedNotificationObserverToken;
- (int64_t)_currentGestureRepeaterEvent;
- (int64_t)_repeatStateForEvent:(id)a3;
- (void)_handleRepeaterTimerDidFire:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRepeaterTimer:(id)a3;
- (void)setSelectButtonReceivedNotificationObserverToken:(id)a3;
- (void)setTargetThread:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation VOTTVGestureRepeater

- (VOTTVGestureRepeater)initWithThread:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VOTTVGestureRepeater;
  v5 = -[VOTTVGestureRepeater init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    -[VOTTVGestureRepeater setTargetThread:](v5, "setTargetThread:", v4);
    v6->_currentRepeatState = 4LL;
    id v7 = objc_allocWithZone(&OBJC_CLASS___SCRCTargetSelectorTimer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater targetThread](v6, "targetThread"));
    id v9 = [v7 initWithTarget:v6 selector:"_handleRepeaterTimerDidFire:" thread:v8];

    -[VOTTVGestureRepeater setRepeaterTimer:](v6, "setRepeaterTimer:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100050B88;
    v15[3] = &unk_100176D60;
    v12 = v6;
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 addObserverForName:@"VOTEventFactoryDidReceiveSelectButtonUpEvent" object:0 queue:v11 usingBlock:v15]);
    -[VOTTVGestureRepeater setSelectButtonReceivedNotificationObserverToken:]( v12,  "setSelectButtonReceivedNotificationObserverToken:",  v13);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
  [v3 invalidate];

  -[VOTTVGestureRepeater setRepeaterTimer:](self, "setRepeaterTimer:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTTVGestureRepeater selectButtonReceivedNotificationObserverToken]( self,  "selectButtonReceivedNotificationObserverToken"));
  [v4 removeObserver:v5];

  -[VOTTVGestureRepeater setSelectButtonReceivedNotificationObserverToken:]( self,  "setSelectButtonReceivedNotificationObserverToken:",  0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTTVGestureRepeater;
  -[VOTTVGestureRepeater dealloc](&v6, "dealloc");
}

- (void)updateWithEvent:(id)a3
{
  id v17 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v17 command]);
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandIdle];

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
    [v6 cancel];

    *(_OWORD *)&self->_int64_t currentRepeatState = xmmword_100132870;
    self->_isSendingFirstRepeatEvent = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v17 command]);
    unsigned int v8 = [v7 isEqualToString:kVOTEventCommandTracking];

    if (v8)
    {
      unint64_t v9 = -[VOTTVGestureRepeater _repeatStateForEvent:](self, "_repeatStateForEvent:", v17);
      if (v9 == 5)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
        [v10 cancel];

        *(_OWORD *)&self->_int64_t currentRepeatState = xmmword_100132860;
      }

      else
      {
        int64_t v12 = v9;
        BOOL v13 = v9 > 3;
        v11 = v17;
        if (v13) {
          goto LABEL_8;
        }
        int64_t currentRepeatState = self->_currentRepeatState;
        if (currentRepeatState == 4)
        {
          self->_int64_t currentRepeatState = v12;
          goto LABEL_8;
        }

        if (currentRepeatState == v12) {
          goto LABEL_8;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
        [v15 cancel];

        self->_int64_t currentRepeatState = v12;
        self->_currentRepeatCount = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
        [v16 dispatchAfterDelay:0.5];
      }
    }

    else
    {
      _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Gesture repeater got an unexpected event: %@");
    }
  }

  v11 = v17;
LABEL_8:
}

- (void)_handleRepeaterTimerDidFire:(id)a3
{
  if (self->_isSendingFirstRepeatEvent)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater delegate](self, "delegate", a3));
    [v4 gestureRepeaterWillSendFirstRepeaterEvent:self];

    self->_isSendingFirstRepeatEvent = 0;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater delegate](self, "delegate", a3));
  objc_msgSend( v5,  "gestureRepeater:repeaterEventDidFire:",  self,  -[VOTTVGestureRepeater _currentGestureRepeaterEvent](self, "_currentGestureRepeaterEvent"));

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVGestureRepeater repeaterTimer](self, "repeaterTimer"));
  -[VOTTVGestureRepeater _delayForCurrentRepeatCount](self, "_delayForCurrentRepeatCount");
  objc_msgSend(v6, "dispatchAfterDelay:");

  ++self->_currentRepeatCount;
}

- (double)_delayForCurrentRepeatCount
{
  return 0.4;
}

- (int64_t)_currentGestureRepeaterEvent
{
  unint64_t v2 = self->_currentRepeatState - 1;
  if (v2 > 4) {
    return 1LL;
  }
  else {
    return qword_100132880[v2];
  }
}

- (int64_t)_repeatStateForEvent:(id)a3
{
  id v3 = a3;
  [v3 touchRawLocation];
  if (sqrt((v5 + -0.5) * (v5 + -0.5) + (v4 + -0.5) * (v4 + -0.5)) >= 0.34)
  {
    id v7 = [v3 tvTouchPadRegion];
    else {
      int64_t v6 = (int64_t)v7;
    }
  }

  else
  {
    int64_t v6 = 5LL;
  }

  return v6;
}

- (VOTTVGestureRepeaterDelegate)delegate
{
  return (VOTTVGestureRepeaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCRCThread)targetThread
{
  return (SCRCThread *)objc_loadWeakRetained((id *)&self->_targetThread);
}

- (void)setTargetThread:(id)a3
{
}

- (SCRCTargetSelectorTimer)repeaterTimer
{
  return self->_repeaterTimer;
}

- (void)setRepeaterTimer:(id)a3
{
}

- (id)selectButtonReceivedNotificationObserverToken
{
  return self->_selectButtonReceivedNotificationObserverToken;
}

- (void)setSelectButtonReceivedNotificationObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end