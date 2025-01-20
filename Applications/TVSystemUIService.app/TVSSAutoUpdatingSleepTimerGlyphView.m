@interface TVSSAutoUpdatingSleepTimerGlyphView
- (CADisplayLink)displayLink;
- (TVSSSleepTimerController)sleepTimerController;
- (void)_updatePercentage;
- (void)_updateTimer;
- (void)didMoveToWindow;
- (void)setDisplayLink:(id)a3;
- (void)setSleepTimerController:(id)a3;
@end

@implementation TVSSAutoUpdatingSleepTimerGlyphView

- (void)setSleepTimerController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v4->_sleepTimerController)
  {
    objc_storeStrong((id *)&v4->_sleepTimerController, location[0]);
    -[TVSSAutoUpdatingSleepTimerGlyphView _updateTimer](v4, "_updateTimer");
  }

  objc_storeStrong(location, 0LL);
}

- (void)didMoveToWindow
{
}

- (void)_updateTimer
{
  id v6 = -[TVSSAutoUpdatingSleepTimerGlyphView window](self, "window");
  BOOL v7 = 0;
  if (v6) {
    BOOL v7 = self->_sleepTimerController != 0LL;
  }

  if (v7)
  {
    v2 =  +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_updatePercentage");
    displayLink = self->_displayLink;
    self->_displayLink = v2;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 1LL);
    v4 = self->_displayLink;
    v5 = +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](v4, "addToRunLoop:forMode:");
  }

  else
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    objc_storeStrong((id *)&self->_displayLink, 0LL);
  }

  -[TVSSAutoUpdatingSleepTimerGlyphView _updatePercentage](self, "_updatePercentage");
}

- (void)_updatePercentage
{
  double v9 = 1.0;
  if (self->_sleepTimerController)
  {
    v5 = -[TVSSSleepTimerController currentScheduledSleep](self->_sleepTimerController, "currentScheduledSleep");
    id v4 = -[PBSScheduledSleep predictedEndDate](v5, "predictedEndDate");
    [v4 timeIntervalSinceNow];
    double v6 = v2;

    BOOL v7 = -[TVSSSleepTimerController currentScheduledSleep](self->_sleepTimerController, "currentScheduledSleep");
    -[PBSScheduledSleep duration](v7, "duration");
    double v8 = v3;

    double v9 = (v8 - v6) / v8;
  }

  -[TVSSSleepTimerGlyphView setPercentComplete:](self, "setPercentComplete:", v9);
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end