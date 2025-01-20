@interface TVMusicB239FingerRestGestureRecognizer
- (CGPoint)digitizerLocation;
- (CGPoint)digitizerStartLocation;
- (NSTimer)pressDurationTimer;
- (TVMusicB239FingerRestGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)minimumPressDuration;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)recognizeFingerRest;
- (void)setMinimumPressDuration:(double)a3;
- (void)setPressDurationTimer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVMusicB239FingerRestGestureRecognizer

- (TVMusicB239FingerRestGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicB239FingerRestGestureRecognizer;
  v4 = -[TVMusicB239FingerRestGestureRecognizer initWithTarget:action:](&v7, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TVMusicB239FingerRestGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0LL);
    -[TVMusicB239FingerRestGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1002820F0);
    -[TVMusicB239FingerRestGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &off_100282108);
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_stateToEnter = 1LL;
  id v6 = a4;
  id v7 = a3;
  -[TVMusicB239FingerRestGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  id obj = (id)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "recognizeFingerRest",  0LL,  0LL));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [(id)v8 addTimer:obj forMode:NSRunLoopCommonModes];

  objc_storeWeak((id *)&self->_pressDurationTimer, obj);
  LODWORD(v8) = [v7 count];

  self->_touchCount += v8;
  [v6 _digitizerLocation];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  self->_digitizerLocation.x = v10;
  self->_digitizerLocation.y = v12;
  self->_digitizerStartLocation = self->_digitizerLocation;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  p_digitizerLocation = &self->_digitizerLocation;
  objc_msgSend(a4, "_digitizerLocation", a3);
  p_digitizerLocation->x = v6;
  p_digitizerLocation->y = v7;
  if (!self->_selectButtonDepressed)
  {
    if (-[TVMusicB239FingerRestGestureRecognizer state](self, "state")) {
      -[TVMusicB239FingerRestGestureRecognizer setState:](self, "setState:", 2LL);
    }
  }

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  p_digitizerLocation = &self->_digitizerLocation;
  id v7 = a3;
  [a4 _digitizerLocation];
  p_digitizerLocation->x = v8;
  p_digitizerLocation->y = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDurationTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_pressDurationTimer, 0LL);
  LODWORD(a4) = [v7 count];

  int v11 = self->_touchCount - (_DWORD)a4;
  self->_touchCount = v11;
  if (!v11) {
    -[TVMusicB239FingerRestGestureRecognizer setState:](self, "setState:", 3LL);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  p_digitizerLocation = &self->_digitizerLocation;
  id v7 = a3;
  [a4 _digitizerLocation];
  p_digitizerLocation->x = v8;
  p_digitizerLocation->y = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDurationTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_pressDurationTimer, 0LL);
  LODWORD(a4) = [v7 count];

  int v11 = self->_touchCount - (_DWORD)a4;
  self->_touchCount = v11;
  if (!v11) {
    -[TVMusicB239FingerRestGestureRecognizer setState:](self, "setState:", 4LL);
  }
}

- (void)recognizeFingerRest
{
  p_pressDurationTimer = &self->_pressDurationTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDurationTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_pressDurationTimer, 0LL);
  -[TVMusicB239FingerRestGestureRecognizer setState:](self, "setState:", self->_stateToEnter);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "type", (void)v11) == (id)4)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDurationTimer);
          [WeakRetained invalidate];

          objc_storeWeak((id *)&self->_pressDurationTimer, 0LL);
          self->_selectButtonDepressed = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  id v7 = v5;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "type", (void)v16) == (id)4) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        id v7 = v5;
        goto LABEL_14;
      }
    }

    p_pressDurationTimer = &self->_pressDurationTimer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pressDurationTimer);
    [WeakRetained invalidate];

    objc_storeWeak((id *)&self->_pressDurationTimer, 0LL);
    self->_selectButtonDepressed = 0;
    if (!self->_touchCount) {
      goto LABEL_15;
    }
    id v13 = -[TVMusicB239FingerRestGestureRecognizer state](self, "state");
    int64_t v14 = 1LL;
    if (v13 == (id)1) {
      int64_t v14 = 2LL;
    }
    self->_stateToEnter = v14;
    -[TVMusicB239FingerRestGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "recognizeFingerRest",  0LL,  0LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v15 addTimer:v7 forMode:NSRunLoopCommonModes];

    objc_storeWeak((id *)p_pressDurationTimer, v7);
  }

- (CGPoint)digitizerStartLocation
{
  double x = self->_digitizerStartLocation.x;
  double y = self->_digitizerStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)digitizerLocation
{
  double x = self->_digitizerLocation.x;
  double y = self->_digitizerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (NSTimer)pressDurationTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_pressDurationTimer);
}

- (void)setPressDurationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end