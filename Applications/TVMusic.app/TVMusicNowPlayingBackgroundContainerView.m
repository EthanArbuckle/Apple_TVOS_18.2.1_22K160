@interface TVMusicNowPlayingBackgroundContainerView
- (BOOL)isBlurAllowed;
- (BOOL)shouldBlur;
- (TVMusicNowPlayingBackgroundContainerView)initWithFrame:(CGRect)a3;
- (TVPMusicNowPlayingBackgroundProvider)backgroundProvider;
- (UIView)containerView;
- (UIVisualEffectView)blurView;
- (void)_updateBlurEffect;
- (void)_updateForBackgroundContrastState;
- (void)layoutSubviews;
- (void)setBackgroundProvider:(id)a3;
- (void)setBlurAllowed:(BOOL)a3;
- (void)setBlurView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicNowPlayingBackgroundContainerView

- (TVMusicNowPlayingBackgroundContainerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingBackgroundContainerView;
  v3 = -[TVMusicNowPlayingBackgroundContainerView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicNowPlayingBackgroundContainerView bounds](v3, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    containerView = v3->_containerView;
    v3->_containerView = v5;

    -[UIView setAutoresizingMask:](v3->_containerView, "setAutoresizingMask:", 18LL);
    -[TVMusicNowPlayingBackgroundContainerView addSubview:](v3, "addSubview:", v3->_containerView);
    -[TVMusicNowPlayingBackgroundContainerView _updateForBackgroundContrastState]( v3,  "_updateForBackgroundContrastState");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v3 selector:"_updateForBackgroundContrastState" name:UIAccessibilityReduceTransparencyStatusDidChangeNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v3 selector:"_updateForBackgroundContrastState" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];
  }

  return v3;
}

- (void)setBlurAllowed:(BOOL)a3
{
  if (self->_blurAllowed != a3)
  {
    -[TVMusicNowPlayingBackgroundContainerView willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"isBlurAllowed");
    self->_blurAllowed = a3;
    -[TVMusicNowPlayingBackgroundContainerView _updateBlurEffect](self, "_updateBlurEffect");
    -[TVMusicNowPlayingBackgroundContainerView didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"isBlurAllowed");
  }

- (void)_updateBlurEffect
{
  if (!-[TVMusicNowPlayingBackgroundContainerView isBlurAllowed](self, "isBlurAllowed")) {
    goto LABEL_4;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView backgroundProvider](self, "backgroundProvider"));
  if ((objc_opt_respondsToSelector(v3, "isBlurDisabled") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView backgroundProvider](self, "backgroundProvider"));
    unsigned __int8 v5 = [v4 isBlurDisabled];

    if ((v5 & 1) != 0)
    {
LABEL_4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView blurView](self, "blurView"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView blurView](self, "blurView"));
        [v7 removeFromSuperview];

        -[TVMusicNowPlayingBackgroundContainerView setBlurView:](self, "setBlurView:", 0LL);
      }

      return;
    }
  }

  else
  {
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView blurView](self, "blurView"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](&OBJC_CLASS___UIBlurEffect, "effectWithBlurRadius:", 80.0));
    objc_super v10 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    -[TVMusicNowPlayingBackgroundContainerView bounds](self, "bounds");
    v11 = -[UIVisualEffectView initWithFrame:](v10, "initWithFrame:");
    v16 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    -[UIVisualEffectView setBackgroundEffects:](v11, "setBackgroundEffects:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v15 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[UIVisualEffectView setContentEffects:](v11, "setContentEffects:", v14);

    -[UIVisualEffectView setAutoresizingMask:](v11, "setAutoresizingMask:", 18LL);
    -[TVMusicNowPlayingBackgroundContainerView addSubview:](self, "addSubview:", v11);
    -[TVMusicNowPlayingBackgroundContainerView setBlurView:](self, "setBlurView:", v11);
  }

- (void)setBackgroundProvider:(id)a3
{
  unsigned __int8 v5 = (TVPMusicNowPlayingBackgroundProvider *)a3;
  p_backgroundProvider = &self->_backgroundProvider;
  backgroundProvider = self->_backgroundProvider;
  v24 = v5;
  if (backgroundProvider != v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicNowPlayingBackgroundProvider view](backgroundProvider, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));

    if (v9 == v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicNowPlayingBackgroundProvider view](*p_backgroundProvider, "view"));
      [v11 removeFromSuperview];
    }
  }

  objc_storeStrong((id *)&self->_backgroundProvider, a3);
  -[TVMusicNowPlayingBackgroundContainerView _updateBlurEffect](self, "_updateBlurEffect");
  if (*p_backgroundProvider)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicNowPlayingBackgroundProvider view](*p_backgroundProvider, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 superview]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));

    if (v13 != v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicNowPlayingBackgroundProvider view](*p_backgroundProvider, "view"));
      v16 = v15;
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 superview]);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));

        if (v17 != v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));
          [v19 bounds];
          objc_msgSend(v16, "setFrame:");

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));
          [v20 addSubview:v16];
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](&OBJC_CLASS___CATransition, "animation"));
      [v21 setType:kCATransitionFade];
      [v21 setDuration:1.0];
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
      [v21 setTimingFunction:v22];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView layer](self, "layer"));
      [v23 addAnimation:v21 forKey:@"crossfade"];
    }
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingBackgroundContainerView;
  -[TVMusicNowPlayingBackgroundContainerView layoutSubviews](&v18, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView backgroundProvider](self, "backgroundProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView backgroundProvider](self, "backgroundProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
    objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView blurView](self, "blurView"));

    if (v8)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[CATransition animation](&OBJC_CLASS___CATransition, "animation"));
      [v12 setType:kCATransitionFade];
      [v12 setDuration:1.0];
      double v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
      [v12 setTimingFunction:v9];

      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView blurView](self, "blurView"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
      [v11 addAnimation:v12 forKey:@"crossfade"];
    }
  }

- (void)_updateForBackgroundContrastState
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));
    [v3 setHidden:1];

    id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.12, 1.0));
    -[TVMusicNowPlayingBackgroundContainerView setBackgroundColor:](self, "setBackgroundColor:", v6);
  }

  else
  {
    BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingBackgroundContainerView containerView](self, "containerView"));
    [v5 setHidden:IsReduceTransparencyEnabled];

    -[TVMusicNowPlayingBackgroundContainerView setBackgroundColor:](self, "setBackgroundColor:", 0LL);
  }

- (BOOL)isBlurAllowed
{
  return self->_blurAllowed;
}

- (TVPMusicNowPlayingBackgroundProvider)backgroundProvider
{
  return self->_backgroundProvider;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (BOOL)shouldBlur
{
  return self->_shouldBlur;
}

- (void).cxx_destruct
{
}

@end