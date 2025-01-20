@interface ZWAppleTVHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isVisible;
- (NSTimer)displayTimer;
- (TVSUIBulletinView)bulletinView;
- (void)_displayTimerFired:(id)a3;
- (void)_hide;
- (void)loadView;
- (void)setBulletinView:(id)a3;
- (void)setDisplayTimer:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)showMessage:(id)a3 forDuration:(double)a4 animated:(BOOL)a5;
@end

@implementation ZWAppleTVHUDViewController

- (void)loadView
{
  v14 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[ZWAppleTVHUDViewController setView:](self, "setView:", v14);
  v3 = -[TVSUIBulletinView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___TVSUIBulletinView),  "initWithFrame:style:",  0LL,  160.0,  0.0,  350.0,  130.0);
  id v4 = ZWLocString(@"ZW_TITLE");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIBulletinView titleLabel](v3, "titleLabel"));
  [v6 setText:v5];

  v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"ATVZoomBulletin",  v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 _flatImageWithColor:v10]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIBulletinView imageView](v3, "imageView"));
  [v12 setImage:v11];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController view](self, "view"));
  [v13 addSubview:v3];

  -[ZWAppleTVHUDViewController setBulletinView:](self, "setBulletinView:", v3);
  -[TVSUIBulletinView setAlpha:](v3, "setAlpha:", 0.0);
}

- (void)showMessage:(id)a3 forDuration:(double)a4 animated:(BOOL)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController displayTimer](self, "displayTimer"));
  [v8 invalidate];

  -[ZWAppleTVHUDViewController setDisplayTimer:](self, "setDisplayTimer:", 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController bulletinView](self, "bulletinView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtitleLabel]);
  [v10 setText:v7];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController bulletinView](self, "bulletinView"));
  [v11 setNeedsLayout];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController bulletinView](self, "bulletinView"));
  [v12 layoutIfNeeded];

  -[ZWAppleTVHUDViewController setVisible:](self, "setVisible:", 1LL);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __63__ZWAppleTVHUDViewController_showMessage_forDuration_animated___block_invoke;
  v14[3] = &unk_6CBC0;
  v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __63__ZWAppleTVHUDViewController_showMessage_forDuration_animated___block_invoke_2;
  v13[3] = &unk_6D058;
  v13[4] = self;
  *(double *)&v13[5] = a4;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v14,  v13,  0.25,  0.0);
}

void __63__ZWAppleTVHUDViewController_showMessage_forDuration_animated___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bulletinView]);
  [v1 setAlpha:1.0];
}

void __63__ZWAppleTVHUDViewController_showMessage_forDuration_animated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "_displayTimerFired:",  0LL,  0LL,  *(double *)(a1 + 40)));
    [*(id *)(a1 + 32) setDisplayTimer:v3];
  }

- (void)_hide
{
  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __35__ZWAppleTVHUDViewController__hide__block_invoke;
  v3[3] = &unk_6CBC0;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = __35__ZWAppleTVHUDViewController__hide__block_invoke_2;
  v2[3] = &unk_6D080;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v3,  v2,  0.25,  0.0);
}

void __35__ZWAppleTVHUDViewController__hide__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bulletinView]);
  [v1 setAlpha:0.0];
}

id __35__ZWAppleTVHUDViewController__hide__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisible:0];
}

- (void)_displayTimerFired:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVHUDViewController displayTimer](self, "displayTimer", a3));
  [v4 invalidate];

  -[ZWAppleTVHUDViewController setDisplayTimer:](self, "setDisplayTimer:", 0LL);
  -[ZWAppleTVHUDViewController _hide](self, "_hide");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (TVSUIBulletinView)bulletinView
{
  return self->_bulletinView;
}

- (void)setBulletinView:(id)a3
{
}

- (NSTimer)displayTimer
{
  return self->_displayTimer;
}

- (void)setDisplayTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end