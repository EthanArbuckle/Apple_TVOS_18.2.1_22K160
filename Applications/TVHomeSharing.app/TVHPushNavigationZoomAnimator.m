@interface TVHPushNavigationZoomAnimator
- (double)transitionDuration:(id)a3;
- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6;
- (void)animateTransition:(id)a3;
@end

@implementation TVHPushNavigationZoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextToViewControllerKey]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextFromViewControllerKey]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100087590;
  v9[3] = &unk_1000FCEA8;
  id v10 = v4;
  id v8 = v4;
  -[TVHPushNavigationZoomAnimator _beginZoomAnimationFromViewController:toViewController:containerView:completion:]( self,  "_beginZoomAnimationFromViewController:toViewController:containerView:completion:",  v7,  v6,  v5,  v9);
}

- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a4 view]);
  [v10 bounds];
  objc_msgSend(v12, "setFrame:");
  [v12 setAlpha:0.0];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 layer]);
  [v13 setShouldRasterize:1];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 layer]);
  [v14 setRasterizationScale:1.0];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  [v10 insertSubview:v12 belowSubview:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
  [v16 setShouldRasterize:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
  [v17 setRasterizationScale:1.0];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000877EC;
  v28[3] = &unk_1000FCEA8;
  id v29 = v15;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10008783C;
  v26[3] = &unk_1000FD4C8;
  id v27 = v29;
  id v18 = v29;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x10000LL,  v28,  v26,  0.3,  0.0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000878B4;
  v24[3] = &unk_1000FCEA8;
  id v25 = v12;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000878C0;
  v21[3] = &unk_1000FF360;
  id v22 = v25;
  id v23 = v9;
  id v19 = v9;
  id v20 = v25;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v24,  v21,  0.5);
}

@end