@interface TVHPopNavigationZoomAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TVHPopNavigationZoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllerForKey:UITransitionContextToViewControllerKey]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllerForKey:UITransitionContextFromViewControllerKey]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAlpha:0.0];
  CGAffineTransformMakeScale(&v37, 1.5, 1.5);
  [v7 setTransform:&v37];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  [v8 setShouldRasterize:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v10 scale];
  if (v11 <= 1.0) {
    double v12 = 1.0;
  }
  else {
    double v12 = 1.5;
  }
  [v9 setRasterizationScale:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 layer]);
  [v14 setShouldRasterize:1];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 layer]);
  [v15 setRasterizationScale:1.0];

  [v4 insertSubview:v7 aboveSubview:v13];
  objc_initWeak(&location, v3);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100046F10;
  v32[3] = &unk_1000FE028;
  id v16 = v7;
  id v33 = v16;
  id v17 = v13;
  id v34 = v17;
  objc_copyWeak(&v35, &location);
  v18 = objc_retainBlock(v32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100046FC4;
  v29[3] = &unk_1000FCDB8;
  id v19 = v17;
  id v30 = v19;
  id v20 = v16;
  id v31 = v20;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v29,  0LL,  0.33,  0.0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100046FF4;
  v26[3] = &unk_1000FCDB8;
  id v21 = v20;
  id v27 = v21;
  id v22 = v19;
  id v28 = v22;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000470D8;
  v24[3] = &unk_1000FE050;
  v23 = v18;
  id v25 = v23;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v26,  v24,  0.5,  0.0);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

@end