@interface MTTVUserSwitchLoadingView
+ (id)loadingScreen;
- (BOOL)hiding;
- (BOOL)isVisible;
- (MTTVUserSwitchLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)userSpinnerView;
- (UILabel)userSwitchLabel;
- (UIView)userSwitchSnapshotView;
- (UIVisualEffectView)userSwitchEffectView;
- (UIWindow)userSwitchOverlayWindow;
- (id)_textForUserSwitchState:(int64_t)a3;
- (void)_timeout;
- (void)hide;
- (void)setHiding:(BOOL)a3;
- (void)setUserSpinnerView:(id)a3;
- (void)setUserSwitchEffectView:(id)a3;
- (void)setUserSwitchLabel:(id)a3;
- (void)setUserSwitchOverlayWindow:(id)a3;
- (void)setUserSwitchSnapshotView:(id)a3;
- (void)showOverKeyWindowUserSwitchState:(int64_t)a3 completion:(id)a4;
@end

@implementation MTTVUserSwitchLoadingView

- (MTTVUserSwitchLoadingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVUserSwitchLoadingView;
  v3 = -[MTTVUserSwitchLoadingView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVUserSwitchLoadingView layer](v3, "layer"));
    [v5 setAllowsGroupOpacity:0];
    [v5 setAllowsGroupBlending:0];
  }

  return v4;
}

+ (id)loadingScreen
{
  if (qword_1002B6908 != -1) {
    dispatch_once(&qword_1002B6908, &stru_1002409E0);
  }
  return (id)qword_1002B6900;
}

- (void)showOverKeyWindowUserSwitchState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_userSwitchOverlayWindow)
  {
    objc_super v7 = objc_alloc(&OBJC_CLASS___MTTVUserSwitchOverlayWindow);
    -[MTTVUserSwitchLoadingView bounds](self, "bounds");
    v8 = -[MTTVUserSwitchOverlayWindow initWithFrame:](v7, "initWithFrame:");
    userSwitchOverlayWindow = self->_userSwitchOverlayWindow;
    self->_userSwitchOverlayWindow = v8;

    -[UIWindow setWindowLevel:](self->_userSwitchOverlayWindow, "setWindowLevel:", UIWindowLevelAlert);
    v10 = self->_userSwitchOverlayWindow;
    v11 = objc_alloc_init(&OBJC_CLASS___UIViewController);
    -[UIWindow setRootViewController:](v10, "setRootViewController:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow layer](self->_userSwitchOverlayWindow, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 superlayer]);
    [v13 setAllowsGroupOpacity:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow layer](self->_userSwitchOverlayWindow, "layer"));
    [v14 setAllowsGroupOpacity:0];

    -[UIWindow setBackgroundColor:](self->_userSwitchOverlayWindow, "setBackgroundColor:", 0LL);
    -[UIWindow setHidden:](self->_userSwitchOverlayWindow, "setHidden:", 1LL);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 keyWindow]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVUserSwitchLoadingView superview](self, "superview"));
  if ([v17 isEqual:v16])
  {
  }

  else
  {
    unsigned __int8 v18 = -[MTTVUserSwitchLoadingView isVisible](self, "isVisible");

    if ((v18 & 1) == 0)
    {
      -[UIWindow setHidden:](self->_userSwitchOverlayWindow, "setHidden:", 0LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_userSwitchOverlayWindow, "rootViewController"));
      [v19 setView:self];

      v20 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", 0LL);
      userSwitchEffectView = self->_userSwitchEffectView;
      self->_userSwitchEffectView = v20;

      -[UIVisualEffectView setUserInteractionEnabled:](self->_userSwitchEffectView, "setUserInteractionEnabled:", 0LL);
      -[UIVisualEffectView setAutoresizingMask:](self->_userSwitchEffectView, "setAutoresizingMask:", 18LL);
      v22 = self->_userSwitchEffectView;
      -[MTTVUserSwitchLoadingView bounds](self, "bounds");
      -[UIVisualEffectView setFrame:](v22, "setFrame:");
      -[MTTVUserSwitchLoadingView addSubview:](self, "addSubview:", self->_userSwitchEffectView);
      v23 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
      userSpinnerView = self->_userSpinnerView;
      self->_userSpinnerView = v23;

      v25 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      userSwitchLabel = self->_userSwitchLabel;
      self->_userSwitchLabel = v25;

      v27 = self->_userSwitchLabel;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
      -[UILabel setFont:](v27, "setFont:", v28);

      v29 = self->_userSwitchLabel;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVUserSwitchLoadingView _textForUserSwitchState:](self, "_textForUserSwitchState:", a3));
      -[UILabel setText:](v29, "setText:", v30);

      -[UILabel sizeToFit](self->_userSwitchLabel, "sizeToFit");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v31));

      v33 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v32);
      -[UIActivityIndicatorView frame](self->_userSpinnerView, "frame");
      double v35 = v34;
      -[UILabel frame](self->_userSwitchLabel, "frame");
      double v37 = fmax(v35, v36);
      -[UIActivityIndicatorView frame](self->_userSpinnerView, "frame");
      double v39 = v38 + 13.0;
      -[UIActivityIndicatorView frame](self->_userSpinnerView, "frame");
      double v41 = v39 + v40;
      -[UIVisualEffectView bounds](self->_userSwitchEffectView, "bounds");
      CGFloat v42 = CGRectGetMidX(v74) - v37 * 0.5;
      -[UIVisualEffectView bounds](self->_userSwitchEffectView, "bounds");
      -[UIVisualEffectView setFrame:](v33, "setFrame:", v42, CGRectGetMidY(v75) - v41 * 0.5, v37, v41);
      v43 = self->_userSwitchLabel;
      -[UIVisualEffectView bounds](v33, "bounds");
      double MidX = CGRectGetMidX(v76);
      -[UILabel frame](self->_userSwitchLabel, "frame");
      -[UILabel setOrigin:](v43, "setOrigin:", MidX - v45 * 0.5, 0.0);
      v46 = self->_userSpinnerView;
      -[UIVisualEffectView bounds](v33, "bounds");
      double v47 = CGRectGetMidX(v77);
      -[UIActivityIndicatorView frame](self->_userSpinnerView, "frame");
      double v49 = v47 - v48 * 0.5;
      -[UILabel frame](self->_userSwitchLabel, "frame");
      double v51 = v50;
      -[UILabel frame](self->_userSwitchLabel, "frame");
      -[UIActivityIndicatorView setOrigin:](v46, "setOrigin:", v49, v51 + v52 + 13.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v33, "contentView"));
      [v53 addSubview:self->_userSwitchLabel];

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v33, "contentView"));
      [v54 addSubview:self->_userSpinnerView];

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_userSwitchEffectView, "contentView"));
      [v55 addSubview:v33];

      v56 = (UIView *)objc_claimAutoreleasedReturnValue([v16 snapshotViewAfterScreenUpdates:0]);
      userSwitchSnapshotView = self->_userSwitchSnapshotView;
      self->_userSwitchSnapshotView = v56;

      -[MTTVUserSwitchLoadingView insertSubview:below:]( self,  "insertSubview:below:",  self->_userSwitchSnapshotView,  self->_userSwitchEffectView);
      -[UILabel setAlpha:](self->_userSwitchLabel, "setAlpha:", 0.0);
      -[UIActivityIndicatorView setAlpha:](self->_userSpinnerView, "setAlpha:", 0.0);
      objc_initWeak(location, self);
      v58 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_1000217B8;
      v71[3] = &unk_100240290;
      objc_copyWeak(&v72, location);
      v59 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v58,  "initWithDuration:curve:animations:",  0LL,  v71,  0.2);
      v60 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_10002181C;
      v68[3] = &unk_100240A08;
      objc_copyWeak(&v70, location);
      id v69 = v16;
      v61 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v60,  "initWithDuration:curve:animations:",  0LL,  v68,  0.55);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_100021898;
      v66[3] = &unk_100240A30;
      id v67 = v6;
      -[UIViewPropertyAnimator addCompletion:](v61, "addCompletion:", v66);
      -[UIActivityIndicatorView startAnimating](self->_userSpinnerView, "startAnimating");
      -[UIViewPropertyAnimator startAnimation](v61, "startAnimation");
      dispatch_time_t v62 = dispatch_time(0LL, 300000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000218AC;
      block[3] = &unk_10023FF98;
      v63 = v59;
      v65 = v63;
      dispatch_after(v62, &_dispatch_main_q, block);
      -[MTTVUserSwitchLoadingView performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_timeout",  0LL,  20.0);

      objc_destroyWeak(&v70);
      objc_destroyWeak(&v72);
      objc_destroyWeak(location);
    }
  }
}

- (void)_timeout
{
  if (-[MTTVUserSwitchLoadingView isVisible](self, "isVisible")) {
    -[MTTVUserSwitchLoadingView hide](self, "hide");
  }
}

- (void)hide
{
  if (-[MTTVUserSwitchLoadingView isVisible](self, "isVisible"))
  {
    if (!self->_hiding)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_timeout",  0LL);
      self->_hiding = 1;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyWindow]);

      objc_initWeak(&location, self);
      v5 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100021B38;
      v19[3] = &unk_100240290;
      objc_copyWeak(&v20, &location);
      id v6 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v5,  "initWithDuration:curve:animations:",  0LL,  v19,  0.2);
      objc_super v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100021BB4;
      v16[3] = &unk_100240A08;
      objc_copyWeak(&v18, &location);
      id v8 = v4;
      id v17 = v8;
      v9 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v7,  "initWithDuration:curve:animations:",  0LL,  v16,  0.45);
      v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      v12 = sub_100021C10;
      v13 = &unk_100240A58;
      objc_copyWeak(&v15, &location);
      v14 = self;
      -[UIViewPropertyAnimator addCompletion:](v9, "addCompletion:", &v10);
      -[UIViewPropertyAnimator startAnimation](v6, "startAnimation", v10, v11, v12, v13);
      -[UIViewPropertyAnimator startAnimation](v9, "startAnimation");
      objc_destroyWeak(&v15);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

- (BOOL)isVisible
{
  userSwitchOverlayWindow = self->_userSwitchOverlayWindow;
  if (userSwitchOverlayWindow) {
    LOBYTE(userSwitchOverlayWindow) = -[UIWindow isHidden](userSwitchOverlayWindow, "isHidden") ^ 1;
  }
  return (char)userSwitchOverlayWindow;
}

- (id)_textForUserSwitchState:(int64_t)a3
{
  switch(a3)
  {
    case 1LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v4 = v3;
      v5 = @"ACCOUNT_SIGNIN";
      break;
    case 2LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v4 = v3;
      v5 = @"ACCOUNT_SIGNOUT";
      break;
    case 3LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v4 = v3;
      v5 = @"ACCOUNT_SWITCH";
      break;
    default:
      id v6 = 0LL;
      return v6;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100248948 table:0]);

  return v6;
}

- (UIWindow)userSwitchOverlayWindow
{
  return self->_userSwitchOverlayWindow;
}

- (void)setUserSwitchOverlayWindow:(id)a3
{
}

- (UIView)userSwitchSnapshotView
{
  return self->_userSwitchSnapshotView;
}

- (void)setUserSwitchSnapshotView:(id)a3
{
}

- (UIVisualEffectView)userSwitchEffectView
{
  return self->_userSwitchEffectView;
}

- (void)setUserSwitchEffectView:(id)a3
{
}

- (UILabel)userSwitchLabel
{
  return self->_userSwitchLabel;
}

- (void)setUserSwitchLabel:(id)a3
{
}

- (UIActivityIndicatorView)userSpinnerView
{
  return self->_userSpinnerView;
}

- (void)setUserSpinnerView:(id)a3
{
}

- (BOOL)hiding
{
  return self->_hiding;
}

- (void)setHiding:(BOOL)a3
{
  self->_hiding = a3;
}

- (void).cxx_destruct
{
}

@end