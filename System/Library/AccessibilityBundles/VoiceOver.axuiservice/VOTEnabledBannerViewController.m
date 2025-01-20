@interface VOTEnabledBannerViewController
- (VOTEnabledBannerView)bannerView;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setBannerView:(id)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation VOTEnabledBannerViewController

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v15 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VOTEnabledBannerViewController setView:](self, "setView:", v15);
  v7 = -[VOTEnabledBannerView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTEnabledBannerView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTEnabledBannerView setAlpha:](v7, "setAlpha:", 0.0);
  -[UIView addSubview:](v15, "addSubview:", v7);
  -[VOTEnabledBannerViewController setBannerView:](self, "setBannerView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView bottomAnchor](v7, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v15, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:-47.0]);
  [v8 addObject:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerView centerXAnchor](v7, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v15, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
  [v8 addObject:v14];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v8);
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerViewController bannerView](self, "bannerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerViewController view](self, "view"));
  [v8 setNeedsLayout];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerViewController view](self, "view"));
  [v9 layoutIfNeeded];

  double v10 = 0.0;
  [v7 setAlpha:0.0];
  if (v4) {
    double v10 = 0.3;
  }
  id v14 = v6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_13B10;
  v15[3] = &unk_247D0;
  id v16 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_13B1C;
  v13[3] = &unk_249C8;
  id v11 = v6;
  id v12 = v7;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v15,  v13,  v10,  0.0);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEnabledBannerViewController bannerView](self, "bannerView"));
  v8 = v7;
  if (v4) {
    double v9 = 0.3;
  }
  else {
    double v9 = 0.0;
  }
  id v13 = v6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_13C2C;
  v14[3] = &unk_247D0;
  id v15 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_13C38;
  v12[3] = &unk_249C8;
  id v10 = v6;
  id v11 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v14,  v12,  v9,  0.0);
}

- (VOTEnabledBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end