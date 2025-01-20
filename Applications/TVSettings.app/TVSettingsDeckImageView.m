@interface TVSettingsDeckImageView
- (BOOL)isInOrder;
- (BOOL)isPaused;
- (BOOL)isShuffled;
- (CGRect)imageFrame;
- (NSArray)imageProxies;
- (TVSettingsDeckImageView)initWithFrame:(CGRect)a3;
- (UIImage)placeholderImage;
- (double)cycleInterval;
- (double)newDataTransitionDuration;
- (double)transitionDuration;
- (unint64_t)_paradeThreshold;
- (unint64_t)_viewTypeForNumberOfImages:(unint64_t)a3;
- (unint64_t)deckViewParadeType;
- (void)_crossfadeViewReadyNotification:(id)a3;
- (void)_displayPlaceholderView;
- (void)_dissolveToPendingView;
- (void)_fadeToBlack;
- (void)_legacyCrossfadeViewReadyNotification:(id)a3;
- (void)_paradeViewReadyNotification:(id)a3;
- (void)_scrollingParadeViewReadyNotification:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pause;
- (void)resume;
- (void)setCycleInterval:(double)a3;
- (void)setDeckViewParadeType:(unint64_t)a3;
- (void)setImageFrame:(CGRect)a3;
- (void)setImageProxies:(id)a3;
- (void)setInOrder:(BOOL)a3;
- (void)setInOrderParade:(BOOL)a3;
- (void)setNewDataTransitionDuration:(double)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setShuffled:(BOOL)a3;
- (void)setShuffledParade:(BOOL)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation TVSettingsDeckImageView

- (TVSettingsDeckImageView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsDeckImageView;
  v5 = -[TVSettingsDeckImageView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    v5->_cycleInterval = 5.0;
    v5->_transitionDuration = 0.9;
    v5->_newDataTransitionDuration = 0.2;
    v5->_imageLoadTimeout = 5.0;
    v5->_deckViewParadeType = 0LL;
    v5->_viewType = 0LL;
    v5->_pendingViewType = 0LL;
    v5->_imageFrame.origin.x = 0.0;
    v5->_imageFrame.origin.y = 0.0;
    v5->_imageFrame.size.CGFloat width = width;
    v5->_imageFrame.size.CGFloat height = height;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v6 selector:"_paradeViewReadyNotification:" name:off_1001DF4F0 object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v6 selector:"_scrollingParadeViewReadyNotification:" name:@"TVSettingsScrollingParadeViewWillDisplayNotification" object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v6 selector:"_crossfadeViewReadyNotification:" name:off_1001DF9D0 object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v6 selector:"_legacyCrossfadeViewReadyNotification:" name:off_1001DF288 object:0];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsDeckImageView;
  -[TVSettingsDeckImageView dealloc](&v4, "dealloc");
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsDeckImageView;
  -[TVSettingsDeckImageView layoutSubviews](&v3, "layoutSubviews");
  if (self->_viewType - 1 > 1) {
    -[TVSettingsDeckImageView bounds](self, "bounds");
  }
  else {
    -[TVSettingsDeckImageView imageFrame](self, "imageFrame");
  }
  -[UIView setFrame:](self->_displayView, "setFrame:");
}

- (void)_crossfadeViewReadyNotification:(id)a3
{
  v6 = (UIView *)objc_claimAutoreleasedReturnValue([a3 object]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v4)
  {
    pendingDisplayView = self->_pendingDisplayView;

    if (pendingDisplayView == v6)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVSettingsDeckImageView transitionDuration](self, "transitionDuration");
      -[UIView setCrossfadeDuration:](v6, "setCrossfadeDuration:");
      -[TVSettingsDeckImageView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (void)_legacyCrossfadeViewReadyNotification:(id)a3
{
  v6 = (UIView *)objc_claimAutoreleasedReturnValue([a3 object]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v4)
  {
    pendingDisplayView = self->_pendingDisplayView;

    if (pendingDisplayView == v6)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVSettingsDeckImageView transitionDuration](self, "transitionDuration");
      -[UIView setCrossfadeDuration:](v6, "setCrossfadeDuration:");
      -[TVSettingsDeckImageView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (void)_paradeViewReadyNotification:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    pendingDisplayView = self->_pendingDisplayView;
    v7 = (UIView *)objc_claimAutoreleasedReturnValue([v8 object]);

    if (pendingDisplayView == v7)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVSettingsDeckImageView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (void)_scrollingParadeViewReadyNotification:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    pendingDisplayView = self->_pendingDisplayView;
    v7 = (UIView *)objc_claimAutoreleasedReturnValue([v8 object]);

    if (pendingDisplayView == v7)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_fadeToBlack",  0LL);
      -[TVSettingsDeckImageView _dissolveToPendingView](self, "_dissolveToPendingView");
    }
  }
}

- (void)setImageProxies:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v4;

  self->_unint64_t pendingViewType = -[TVSettingsDeckImageView _viewTypeForNumberOfImages:]( self,  "_viewTypeForNumberOfImages:",  -[NSArray count](self->_imageProxies, "count"));
  if (self->_placeholderImage) {
    -[TVSettingsDeckImageView _displayPlaceholderView](self, "_displayPlaceholderView");
  }
  else {
    -[TVSettingsDeckImageView performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_fadeToBlack",  0LL,  self->_imageLoadTimeout);
  }
  unint64_t pendingViewType = self->_pendingViewType;
  if (pendingViewType - 1 < 2)
  {
    if (self->_deckViewParadeType == 2) {
      v7 = &OBJC_CLASS___TVSettingsLegacyImageCrossfadeView;
    }
    else {
      v7 = &OBJC_CLASS___TVSettingsImageCrossfadeView;
    }
    id v9 = objc_alloc(v7);
    -[TVSettingsDeckImageView imageFrame](self, "imageFrame");
    v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
    -[TVSettingsDeckImageView cycleInterval](self, "cycleInterval");
    -[UIView setCrossfadePeriod:](v10, "setCrossfadePeriod:");
    -[UIView setCrossfadeDuration:](v10, "setCrossfadeDuration:", 0.0);
    pendingDisplayView = self->_pendingDisplayView;
    self->_pendingDisplayView = v10;
LABEL_15:
    v13 = v10;

    -[UIView setImageProxies:](v13, "setImageProxies:", self->_imageProxies);
    return;
  }

  if (pendingViewType == 3)
  {
    if (self->_deckViewParadeType == 2) {
      id v8 = &OBJC_CLASS___TVSettingsParadeView;
    }
    else {
      id v8 = &OBJC_CLASS___TVSettingsScrollingParadeView;
    }
    id v12 = objc_alloc(v8);
    -[TVSettingsDeckImageView bounds](self, "bounds");
    v10 = (UIView *)objc_msgSend(v12, "initWithFrame:");
    pendingDisplayView = self->_pendingDisplayView;
    self->_pendingDisplayView = v10;
    goto LABEL_15;
  }

- (void)setImageFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_imageFrame = &self->_imageFrame;
  if (!CGRectEqualToRect(self->_imageFrame, a3))
  {
    p_imageFrame->origin.CGFloat x = x;
    p_imageFrame->origin.CGFloat y = y;
    p_imageFrame->size.CGFloat width = width;
    p_imageFrame->size.CGFloat height = height;
    -[TVSettingsDeckImageView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)pause
{
  displayView = self->_displayView;
  if (!displayView) {
    displayView = self->_pendingDisplayView;
  }
  objc_super v3 = displayView;
  if ((objc_opt_respondsToSelector(v3, "setPaused:") & 1) != 0) {
    -[UIView setPaused:](v3, "setPaused:", 1LL);
  }
}

- (BOOL)isPaused
{
  displayView = self->_displayView;
  if (!displayView) {
    displayView = self->_pendingDisplayView;
  }
  objc_super v3 = displayView;
  if ((objc_opt_respondsToSelector(v3, "isPaused") & 1) != 0) {
    unsigned __int8 v4 = -[UIView isPaused](v3, "isPaused");
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)resume
{
  displayView = self->_displayView;
  if (!displayView) {
    displayView = self->_pendingDisplayView;
  }
  objc_super v3 = displayView;
  if ((objc_opt_respondsToSelector(v3, "setPaused:") & 1) != 0) {
    -[UIView setPaused:](v3, "setPaused:", 0LL);
  }
}

- (void)setShuffled:(BOOL)a3
{
  BOOL v3 = a3;
  displayView = self->_displayView;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSettingsParadeView);
  if ((objc_opt_isKindOfClass(displayView, v6) & 1) != 0) {
    -[UIView setShuffled:](self->_displayView, "setShuffled:", v3);
  }
}

- (BOOL)isShuffled
{
  displayView = self->_displayView;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSettingsParadeView);
  if ((objc_opt_isKindOfClass(displayView, v4) & 1) != 0) {
    return -[UIView isShuffled](self->_displayView, "isShuffled");
  }
  else {
    return 0;
  }
}

- (void)setInOrder:(BOOL)a3
{
  BOOL v3 = a3;
  displayView = self->_displayView;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSettingsParadeView);
  if ((objc_opt_isKindOfClass(displayView, v6) & 1) != 0) {
    -[UIView setInOrder:](self->_displayView, "setInOrder:", v3);
  }
}

- (BOOL)isInOrder
{
  displayView = self->_displayView;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSettingsParadeView);
  if ((objc_opt_isKindOfClass(displayView, v4) & 1) != 0) {
    return -[UIView isInOrder](self->_displayView, "isInOrder");
  }
  else {
    return 1;
  }
}

- (void)_dissolveToPendingView
{
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = sub_1000BC300;
  v15[4] = sub_1000BC310;
  v16 = self->_placeholderImageView;
  BOOL v3 = (UIView *)objc_loadWeakRetained(&location);
  displayView = self->_displayView;
  self->_displayView = v3;

  pendingDisplayView = self->_pendingDisplayView;
  self->_pendingDisplayView = 0LL;

  self->_viewType = self->_pendingViewType;
  self->_unint64_t pendingViewType = 0LL;
  objc_initWeak(&v14, self);
  id v6 = objc_loadWeakRetained(&location);
  [v6 setAlpha:1.0];
  -[TVSettingsDeckImageView newDataTransitionDuration](self, "newDataTransitionDuration");
  double v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BC318;
  v10[3] = &unk_100193C00;
  v10[4] = v15;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &v14);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BC3A4;
  v9[3] = &unk_10018EC08;
  v9[4] = self;
  +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  self,  5243008LL,  v10,  v9,  v8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v14);
  _Block_object_dispose(v15, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_fadeToBlack
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v3)
  {
    displayView = self->_displayView;

    if (displayView)
    {
      v5 = self->_displayView;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000BC4A4;
      v7[3] = &unk_10018E440;
      double v8 = v5;
      id v6 = v5;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.2);
    }
  }

- (void)_displayPlaceholderView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDeckImageView superview](self, "superview"));
  if (v3)
  {
    displayView = self->_displayView;

    if (displayView)
    {
      v5 = -[UIImageView initWithImage:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithImage:",  self->_placeholderImage);
      -[TVSettingsDeckImageView imageFrame](self, "imageFrame");
      -[UIImageView setFrame:](v5, "setFrame:");
      id v6 = self->_displayView;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000BC5BC;
      v9[3] = &unk_10018EA28;
      v9[4] = self;
      v10 = v5;
      id v11 = v6;
      double v7 = v6;
      double v8 = v5;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  self,  5243008LL,  v9,  0LL,  0.2);
    }
  }

- (unint64_t)_paradeThreshold
{
  if (self->_deckViewParadeType == 2) {
    return 5LL;
  }
  else {
    return 2LL;
  }
}

- (unint64_t)_viewTypeForNumberOfImages:(unint64_t)a3
{
  if (self->_deckViewParadeType == 1) {
    return 2LL;
  }
  if (a3 < 2) {
    return 1LL;
  }
  if (-[TVSettingsDeckImageView _paradeThreshold](self, "_paradeThreshold") >= a3) {
    return 2LL;
  }
  return 3LL;
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (CGRect)imageFrame
{
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setShuffledParade:(BOOL)a3
{
  self->_shuffledParade = a3;
}

- (void)setInOrderParade:(BOOL)a3
{
  self->_inOrderParade = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (unint64_t)deckViewParadeType
{
  return self->_deckViewParadeType;
}

- (void)setDeckViewParadeType:(unint64_t)a3
{
  self->_deckViewParadeType = a3;
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