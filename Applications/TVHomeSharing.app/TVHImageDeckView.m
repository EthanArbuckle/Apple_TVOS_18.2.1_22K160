@interface TVHImageDeckView
- (BOOL)isPaused;
- (CGRect)_crossFadeImageViewFrame;
- (NSArray)imageProxies;
- (NSDirectionalEdgeInsets)crossFadeImageViewMargin;
- (TVHImageDeckView)initWithFrame:(CGRect)a3;
- (UIImage)placeholderImage;
- (double)cycleInterval;
- (double)newDataTransitionDuration;
- (double)transitionDuration;
- (unint64_t)_paradeThreshold;
- (unint64_t)_viewTypeForNumberOfImages:(unint64_t)a3;
- (unint64_t)mode;
- (void)__handleCrossfadeImageViewWillDisplayNotification:(id)a3;
- (void)_displayPlaceholderView;
- (void)_dissolveToPendingView;
- (void)_fadeToBlack;
- (void)_handleScrollingParadeImageViewWillDisplayNotification:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCrossFadeImageViewMargin:(NSDirectionalEdgeInsets)a3;
- (void)setCycleInterval:(double)a3;
- (void)setImageProxies:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNewDataTransitionDuration:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation TVHImageDeckView

- (TVHImageDeckView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHImageDeckView;
  v3 = -[TVHImageDeckView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_cycleInterval = 5.0;
    v3->_transitionDuration = 0.9;
    v3->_newDataTransitionDuration = 0.2;
    v3->_imageLoadTimeout = 5.0;
    v3->_mode = 0LL;
    imageProxies = v3->_imageProxies;
    v3->_imageProxies = (NSArray *)&__NSArray0__struct;

    v4->_viewType = 0LL;
    v4->_pendingViewType = 0LL;
    __int128 v6 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
    *(_OWORD *)&v4->_crossFadeImageViewMargin.top = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
    *(_OWORD *)&v4->_crossFadeImageViewMargin.bottom = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v4 selector:"_handleScrollingParadeImageViewWillDisplayNotification:" name:@"TVHScrollingParadeImageViewWillDisplayNotification" object:0];
    [v7 addObserver:v4 selector:"__handleCrossfadeImageViewWillDisplayNotification:" name:off_100156A08 object:0];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHImageDeckView;
  -[TVHImageDeckView dealloc](&v4, "dealloc");
}

- (void)setImageProxies:(id)a3
{
  id v13 = a3;
  objc_super v4 = (NSArray *)[v13 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v4;

  self->_unint64_t pendingViewType = -[TVHImageDeckView _viewTypeForNumberOfImages:]( self,  "_viewTypeForNumberOfImages:",  -[NSArray count](self->_imageProxies, "count"));
  if (self->_placeholderImage) {
    -[TVHImageDeckView _displayPlaceholderView](self, "_displayPlaceholderView");
  }
  else {
    -[TVHImageDeckView performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_fadeToBlack",  0LL,  self->_imageLoadTimeout);
  }
  unint64_t pendingViewType = self->_pendingViewType;
  if (pendingViewType - 1 < 2)
  {
    v7 = objc_alloc(&OBJC_CLASS___TVHCrossfadeImageView);
    -[TVHImageDeckView _crossFadeImageViewFrame](self, "_crossFadeImageViewFrame");
    v8 = -[TVHCrossfadeImageView initWithFrame:](v7, "initWithFrame:");
    -[TVHImageDeckView cycleInterval](self, "cycleInterval");
    -[UIView setCrossfadePeriod:](v8, "setCrossfadePeriod:");
    -[UIView setCrossfadeDuration:](v8, "setCrossfadeDuration:", 0.0);
    pendingDisplayView = self->_pendingDisplayView;
    self->_pendingDisplayView = v8;
LABEL_8:
    v12 = v8;

    -[UIView setImageProxies:](v12, "setImageProxies:", v13);
    v10 = v13;
    goto LABEL_9;
  }

  v10 = v13;
  if (pendingViewType == 3)
  {
    v11 = objc_alloc(&OBJC_CLASS___TVHScrollingParadeImageView);
    -[TVHImageDeckView bounds](self, "bounds");
    v8 = -[TVHScrollingParadeImageView initWithFrame:](v11, "initWithFrame:");
    pendingDisplayView = self->_pendingDisplayView;
    self->_pendingDisplayView = v8;
    goto LABEL_8;
  }

- (void)setCrossFadeImageViewMargin:(NSDirectionalEdgeInsets)a3
{
  if (self->_crossFadeImageViewMargin.leading != a3.leading
    || self->_crossFadeImageViewMargin.top != a3.top
    || self->_crossFadeImageViewMargin.trailing != a3.trailing
    || self->_crossFadeImageViewMargin.bottom != a3.bottom)
  {
    self->_crossFadeImageViewMargin = a3;
    -[TVHImageDeckView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    displayView = self->_displayView;
    if (!displayView) {
      displayView = self->_pendingDisplayView;
    }
    v5 = displayView;
  }

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHImageDeckView;
  -[TVHImageDeckView layoutSubviews](&v3, "layoutSubviews");
  if (self->_viewType - 1 > 1) {
    -[TVHImageDeckView bounds](self, "bounds");
  }
  else {
    -[TVHImageDeckView _crossFadeImageViewFrame](self, "_crossFadeImageViewFrame");
  }
  -[UIView setFrame:](self->_displayView, "setFrame:");
}

- (void)__handleCrossfadeImageViewWillDisplayNotification:(id)a3
{
  __int128 v6 = (UIView *)objc_claimAutoreleasedReturnValue([a3 object]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckView superview](self, "superview"));
  if (v4)
  {
    pendingDisplayView = self->_pendingDisplayView;

    if (pendingDisplayView == v6)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVHImageDeckView transitionDuration](self, "transitionDuration");
      -[UIView setCrossfadeDuration:](v6, "setCrossfadeDuration:");
      -[TVHImageDeckView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (void)_handleScrollingParadeImageViewWillDisplayNotification:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVHImageDeckView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    pendingDisplayView = self->_pendingDisplayView;
    v7 = (UIView *)objc_claimAutoreleasedReturnValue([v8 object]);

    if (pendingDisplayView == v7)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVHImageDeckView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (CGRect)_crossFadeImageViewFrame
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[TVHImageDeckView crossFadeImageViewMargin](self, "crossFadeImageViewMargin");
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_dissolveToPendingView
{
  pendingDisplayView = self->_pendingDisplayView;
  double v4 = pendingDisplayView;
  double v5 = self->_displayView;
  objc_storeStrong((id *)&self->_displayView, pendingDisplayView);
  double v6 = self->_pendingDisplayView;
  self->_pendingDisplayView = 0LL;

  self->_viewType = self->_pendingViewType;
  self->_unint64_t pendingViewType = 0LL;
  objc_initWeak(&location, self);
  objc_initWeak(&v18, v4);
  objc_initWeak(&from, v5);
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = sub_10001E438;
  v15[4] = sub_10001E448;
  double v16 = self->_placeholderImageView;
  id v7 = objc_loadWeakRetained(&v18);
  [v7 setAlpha:1.0];

  -[TVHImageDeckView newDataTransitionDuration](self, "newDataTransitionDuration");
  double v9 = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001E450;
  v11[3] = &unk_1000FD4A0;
  objc_copyWeak(&v12, &from);
  objc_copyWeak(&v13, &v18);
  v11[4] = v15;
  objc_copyWeak(&v14, &location);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001E4E0;
  v10[3] = &unk_1000FD4C8;
  v10[4] = self;
  +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  self,  5243008LL,  v11,  v10,  v9);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  _Block_object_dispose(v15, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_fadeToBlack
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckView superview](self, "superview"));
  if (v3)
  {
    displayView = self->_displayView;

    if (displayView)
    {
      double v5 = self->_displayView;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10001E5E0;
      v7[3] = &unk_1000FCEA8;
      double v8 = v5;
      double v6 = v5;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.2);
    }
  }

- (void)_displayPlaceholderView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckView superview](self, "superview"));
  if (v3)
  {
    displayView = self->_displayView;

    if (displayView)
    {
      double v5 = -[UIImageView initWithImage:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithImage:",  self->_placeholderImage);
      -[TVHImageDeckView _crossFadeImageViewFrame](self, "_crossFadeImageViewFrame");
      -[UIImageView setFrame:](v5, "setFrame:");
      objc_initWeak(&location, self);
      double v6 = self->_displayView;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10001E754;
      v9[3] = &unk_1000FD4F0;
      v9[4] = self;
      id v7 = v5;
      double v10 = v7;
      double v8 = v6;
      double v11 = v8;
      objc_copyWeak(&v12, &location);
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  self,  5243008LL,  v9,  0LL,  0.2);
      objc_destroyWeak(&v12);

      objc_destroyWeak(&location);
    }
  }

- (unint64_t)_paradeThreshold
{
  return 2LL;
}

- (unint64_t)_viewTypeForNumberOfImages:(unint64_t)a3
{
  if (self->_mode) {
    return 2LL;
  }
  if (a3 < 2) {
    return 1LL;
  }
  if (-[TVHImageDeckView _paradeThreshold](self, "_paradeThreshold") >= a3) {
    return 2LL;
  }
  return 3LL;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (NSDirectionalEdgeInsets)crossFadeImageViewMargin
{
  double top = self->_crossFadeImageViewMargin.top;
  double leading = self->_crossFadeImageViewMargin.leading;
  double bottom = self->_crossFadeImageViewMargin.bottom;
  double trailing = self->_crossFadeImageViewMargin.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void)setCycleInterval:(double)a3
{
  self->_cycleInterval = a3;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)newDataTransitionDuration
{
  return self->_newDataTransitionDuration;
}

- (void)setNewDataTransitionDuration:(double)a3
{
  self->_newDataTransitionDuration = a3;
}

- (void).cxx_destruct
{
}

@end