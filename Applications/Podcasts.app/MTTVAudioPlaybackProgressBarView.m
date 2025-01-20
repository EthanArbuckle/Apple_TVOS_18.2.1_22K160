@interface MTTVAudioPlaybackProgressBarView
- (CGRect)_completedFrame;
- (CGRect)_remainingFrame;
- (MTTVAudioPlaybackProgressBarView)initWithFrame:(CGRect)a3;
- (UIView)completedView;
- (UIView)remainingView;
- (double)progress;
- (void)layoutSubviews;
- (void)setCompletedView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 withAnimationDuration:(double)a4;
- (void)setRemainingView:(id)a3;
@end

@implementation MTTVAudioPlaybackProgressBarView

- (MTTVAudioPlaybackProgressBarView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTTVAudioPlaybackProgressBarView;
  v3 = -[MTTVAudioPlaybackProgressBarView initWithFrame:]( &v15,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[MTTVAudioPlaybackProgressBarView addSubview:](v3, "addSubview:", v4);
    completedView = v3->_completedView;
    v3->_completedView = v4;
    v7 = v4;

    v8 = objc_alloc_init(&OBJC_CLASS___UIView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.2));
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterSubtractS));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v8, "layer"));
    v16 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    [v11 setFilters:v12];

    -[MTTVAudioPlaybackProgressBarView addSubview:](v3, "addSubview:", v8);
    remainingView = v3->_remainingView;
    v3->_remainingView = v8;
  }

  return v3;
}

- (void)setProgress:(double)a3 withAnimationDuration:(double)a4
{
  double v6 = fmax(a3, 0.0);
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  self->_progress = v6;
  -[MTTVAudioPlaybackProgressBarView setNeedsLayout](self, "setNeedsLayout");
  if (a4 <= 0.0) {
    uint64_t v7 = 196608LL;
  }
  else {
    uint64_t v7 = 196612LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100097540;
  v8[3] = &unk_10023FF98;
  v8[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  v7,  v8,  0LL,  a4,  0.0);
}

- (void)setProgress:(double)a3
{
}

- (CGRect)_completedFrame
{
  CGFloat y = CGRectZero.origin.y;
  -[MTTVAudioPlaybackProgressBarView bounds](self, "bounds");
  double v5 = v4;
  double v7 = v6;
  -[MTTVAudioPlaybackProgressBarView progress](self, "progress");
  double v9 = floor(v8 * v5);
  double x = CGRectZero.origin.x;
  double v11 = y;
  double v12 = v7;
  result.size.height = v12;
  result.size.width = v9;
  result.origin.CGFloat y = v11;
  result.origin.double x = x;
  return result;
}

- (CGRect)_remainingFrame
{
  CGFloat y = CGRectZero.origin.y;
  -[MTTVAudioPlaybackProgressBarView bounds](self, "bounds");
  double v5 = v4;
  double v7 = v6;
  -[MTTVAudioPlaybackProgressBarView _completedFrame](self, "_completedFrame");
  double v10 = v8 + v9;
  double v11 = v5 - v9;
  double v12 = y;
  double v13 = v7;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.CGFloat y = v12;
  result.origin.double x = v10;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVAudioPlaybackProgressBarView;
  -[MTTVAudioPlaybackProgressBarView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVAudioPlaybackProgressBarView completedView](self, "completedView"));
  -[MTTVAudioPlaybackProgressBarView _completedFrame](self, "_completedFrame");
  objc_msgSend(v3, "setFrame:");

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVAudioPlaybackProgressBarView remainingView](self, "remainingView"));
  -[MTTVAudioPlaybackProgressBarView _remainingFrame](self, "_remainingFrame");
  objc_msgSend(v4, "setFrame:");
}

- (double)progress
{
  return self->_progress;
}

- (UIView)completedView
{
  return self->_completedView;
}

- (void)setCompletedView:(id)a3
{
}

- (UIView)remainingView
{
  return self->_remainingView;
}

- (void)setRemainingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end