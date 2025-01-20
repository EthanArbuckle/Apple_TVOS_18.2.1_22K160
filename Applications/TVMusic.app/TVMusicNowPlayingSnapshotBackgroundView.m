@interface TVMusicNowPlayingSnapshotBackgroundView
- (CADisplayLink)displayLink;
- (TVMusicNowPlayingSnapshotBackgroundViewDelegate)delegate;
- (UIView)currentSnapshot;
- (UIView)targetView;
- (void)_updateSnapshot;
- (void)_updateSnapshotTimer;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation TVMusicNowPlayingSnapshotBackgroundView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingSnapshotBackgroundView;
  -[TVMusicNowPlayingSnapshotBackgroundView dealloc](&v3, "dealloc");
}

- (void)setTargetView:(id)a3
{
}

- (void)_updateSnapshotTimer
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView targetView](self, "targetView"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView window](self, "window")),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView displayLink](self, "displayLink"));

    if (!v6)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_updateSnapshot:"));
      [v10 setPreferredFramesPerSecond:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      [v10 addToRunLoop:v9 forMode:NSDefaultRunLoopMode];

      -[TVMusicNowPlayingSnapshotBackgroundView setDisplayLink:](self, "setDisplayLink:", v10);
      goto LABEL_7;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView displayLink](self, "displayLink"));
    id v10 = v7;
    uint64_t v8 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView displayLink](self, "displayLink"));
    id v10 = v7;
    uint64_t v8 = 1LL;
  }

  [v7 setPaused:v8];
LABEL_7:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingSnapshotBackgroundView;
  -[TVMusicNowPlayingSnapshotBackgroundView didMoveToWindow](&v3, "didMoveToWindow");
  -[TVMusicNowPlayingSnapshotBackgroundView _updateSnapshotTimer](self, "_updateSnapshotTimer");
  -[TVMusicNowPlayingSnapshotBackgroundView _updateSnapshot](self, "_updateSnapshot");
}

- (void)_updateSnapshot
{
  id v32 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView targetView](self, "targetView"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v32 window]);
  if (!v3) {
    goto LABEL_8;
  }
  v4 = (void *)v3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView delegate](self, "delegate"));
  if (!v5)
  {

LABEL_8:
    return;
  }

  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView delegate](self, "delegate"));
  unsigned int v8 = [v7 nowPlayingSnapshotBackgroundViewShouldPerformSnapshot:self];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView targetView](self, "targetView"));
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGAffineTransformMakeScale(&v38, 0.5, 0.5);
    v39.origin.double x = v11;
    v39.origin.double y = v13;
    v39.size.double width = v15;
    v39.size.double height = v17;
    CGRect v40 = CGRectApplyAffineTransform(v39, &v38);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double width = v40.size.width;
    double height = v40.size.height;
    id v22 = [v9 bounds];
    id v27 = objc_msgSend( v9,  "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:",  0,  UIRectCenteredIntegralRect(v22, x, y, width, height, v23, v24, v25, v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[TVMusicNowPlayingSnapshotBackgroundView bounds](self, "bounds");
    objc_msgSend(v28, "setFrame:");
    [v28 setAutoresizingMask:18];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingSnapshotBackgroundView currentSnapshot](self, "currentSnapshot"));
    -[TVMusicNowPlayingSnapshotBackgroundView setCurrentSnapshot:](self, "setCurrentSnapshot:", v28);
    if (v28 && v29)
    {
      -[TVMusicNowPlayingSnapshotBackgroundView insertSubview:belowSubview:]( self,  "insertSubview:belowSubview:",  v28,  v29);
    }

    else if (v28)
    {
      [v28 setAlpha:0.0];
      -[TVMusicNowPlayingSnapshotBackgroundView addSubview:](self, "addSubview:", v28);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100056004;
    v35[3] = &unk_100268B30;
    id v36 = v29;
    id v37 = v28;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100056024;
    v33[3] = &unk_100268F50;
    id v34 = v36;
    id v30 = v36;
    id v31 = v28;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  7LL,  v35,  v33,  1.0,  0.0);
  }

- (TVMusicNowPlayingSnapshotBackgroundViewDelegate)delegate
{
  return (TVMusicNowPlayingSnapshotBackgroundViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIView)targetView
{
  return self->_targetView;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (UIView)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end