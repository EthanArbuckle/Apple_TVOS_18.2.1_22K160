@interface VOTUISonificationViewController
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isPlayheadHidden;
- (CADisplayLink)playheadUpdateDisplayLink;
- (CGRect)convertFrameToViewSpace:(CGRect)a3;
- (CGRect)playbackBounds;
- (CGRect)playheadFrameFromPosition:(double)a3;
- (VOTUISonificationPlayheadView)playheadView;
- (VOTUISonificationViewController)initWithAXUIService:(id)a3;
- (double)playbackDuration;
- (double)playbackStartPosition;
- (double)playbackStartTime;
- (double)playheadProgress;
- (void)handleUpdatePlayheadPositionFromLink;
- (void)pausePlayback;
- (void)resumePlaybackFromPosition:(double)a3 startTime:(double)a4 totalDuration:(double)a5;
- (void)setAxuiService:(id)a3;
- (void)setPlaybackBounds:(CGRect)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setPlaybackStartPosition:(double)a3;
- (void)setPlaybackStartTime:(double)a3;
- (void)setPlayheadHidden:(BOOL)a3;
- (void)setPlayheadProgress:(double)a3;
- (void)setPlayheadUpdateDisplayLink:(id)a3;
- (void)setPlayheadView:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUISonificationViewController

- (VOTUISonificationViewController)initWithAXUIService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTUISonificationViewController;
  v5 = -[VOTUISonificationViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_axuiService, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VOTUISonificationViewController setView:](self, "setView:", v7);

  objc_super v8 = -[VOTUISonificationPlayheadView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTUISonificationPlayheadView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTUISonificationViewController setPlayheadView:](self, "setPlayheadView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
  [v9 addSubview:v10];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTUISonificationViewController;
  -[VOTUISonificationViewController viewDidLoad](&v11, "viewDidLoad");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)convertFrameToViewSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);
  objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController view](self, "view"));
  objc_msgSend(v18, "convertRect:fromView:", 0, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)setPlayheadHidden:(BOOL)a3
{
  self->_playheadHidden = a3;
  if (-[VOTUISonificationViewController isPlayheadHidden](self, "isPlayheadHidden"))
  {
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
    objc_msgSend(v7, "setFrame:", CGRectZero.origin.x, y, width, height);

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadUpdateDisplayLink](self, "playheadUpdateDisplayLink"));
    [v8 invalidate];
  }

- (void)setPlaybackBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_playbackBounds = &self->_playbackBounds;
  if (!CGRectEqualToRect(a3, self->_playbackBounds))
  {
    p_playbackBounds->origin.CGFloat x = x;
    p_playbackBounds->origin.CGFloat y = y;
    p_playbackBounds->size.CGFloat width = width;
    p_playbackBounds->size.CGFloat height = height;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
    [v9 setNeedsLayout];

    v10.origin.CGFloat x = CGRectZero.origin.x;
    v10.origin.CGFloat y = CGRectZero.origin.y;
    v10.size.CGFloat width = CGRectZero.size.width;
    v10.size.CGFloat height = CGRectZero.size.height;
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    -[VOTUISonificationViewController setPlayheadHidden:](self, "setPlayheadHidden:", CGRectEqualToRect(v10, v11));
  }

- (void)resumePlaybackFromPosition:(double)a3 startTime:(double)a4 totalDuration:(double)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadUpdateDisplayLink](self, "playheadUpdateDisplayLink"));
  [v8 invalidate];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "handleUpdatePlayheadPositionFromLink"));
  -[VOTUISonificationViewController setPlayheadUpdateDisplayLink:](self, "setPlayheadUpdateDisplayLink:", v9);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadUpdateDisplayLink](self, "playheadUpdateDisplayLink"));
  CGRect v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v11 addToRunLoop:v10 forMode:NSDefaultRunLoopMode];
}

- (CGRect)playheadFrameFromPosition:(double)a3
{
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double MinX = CGRectGetMinX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v10 = MinX + a3 * CGRectGetWidth(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v22);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
  [v12 lineWidth];
  double v14 = v13;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v15 = CGRectGetHeight(v23);

  double v16 = v10;
  double v17 = MinY;
  double v18 = v14;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)setPlayheadProgress:(double)a3
{
  self->_playheadProgress = a3;
  -[VOTUISonificationViewController playheadProgress](self, "playheadProgress");
  -[VOTUISonificationViewController playheadFrameFromPosition:](self, "playheadFrameFromPosition:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)handleUpdatePlayheadPositionFromLink
{
  double Current = CFAbsoluteTimeGetCurrent();
  -[VOTUISonificationViewController playbackStartTime](self, "playbackStartTime");
  double v5 = Current - v4;
  -[VOTUISonificationViewController playbackDuration](self, "playbackDuration");
  -[VOTUISonificationViewController setPlayheadProgress:](self, "setPlayheadProgress:", v5 / v6);
  -[VOTUISonificationViewController playheadProgress](self, "playheadProgress");
  -[VOTUISonificationViewController playheadFrameFromPosition:](self, "playheadFrameFromPosition:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadView](self, "playheadView"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
}

- (void)pausePlayback
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTUISonificationViewController playheadUpdateDisplayLink](self, "playheadUpdateDisplayLink"));
  [v2 invalidate];
}

- (AXUIService)axuiService
{
  return (AXUIService *)objc_loadWeakRetained((id *)&self->_axuiService);
}

- (void)setAxuiService:(id)a3
{
}

- (BOOL)isPlayheadHidden
{
  return self->_playheadHidden;
}

- (double)playheadProgress
{
  return self->_playheadProgress;
}

- (CGRect)playbackBounds
{
  double x = self->_playbackBounds.origin.x;
  double y = self->_playbackBounds.origin.y;
  double width = self->_playbackBounds.size.width;
  double height = self->_playbackBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (VOTUISonificationPlayheadView)playheadView
{
  return self->_playheadView;
}

- (void)setPlayheadView:(id)a3
{
}

- (CADisplayLink)playheadUpdateDisplayLink
{
  return self->_playheadUpdateDisplayLink;
}

- (void)setPlayheadUpdateDisplayLink:(id)a3
{
}

- (double)playbackStartPosition
{
  return self->_playbackStartPosition;
}

- (void)setPlaybackStartPosition:(double)a3
{
  self->_playbackStartPosition = a3;
}

- (double)playbackStartTime
{
  return self->_playbackStartTime;
}

- (void)setPlaybackStartTime:(double)a3
{
  self->_playbackStartTime = a3;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (void).cxx_destruct
{
}

@end