@interface TVNavigationZoomAnimator
- (double)transitionDuration:(id)a3;
- (void)_beginZoomAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6;
- (void)animateTransition:(id)a3;
@end

@implementation TVNavigationZoomAnimator

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
  v9[2] = sub_100098D54;
  v9[3] = &unk_100268CF0;
  id v10 = v4;
  id v8 = v4;
  -[TVNavigationZoomAnimator _beginZoomAnimationFromViewController:toViewController:containerView:completion:]( self,  "_beginZoomAnimationFromViewController:toViewController:containerView:completion:",  v7,  v6,  v5,  v9);
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
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);

  [v10 insertSubview:v12 belowSubview:v13];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100098F0C;
  v23[3] = &unk_100268CF0;
  id v14 = v13;
  id v24 = v14;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x10000LL,  v23,  0LL,  0.3,  0.0);
  id v20 = v9;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100098F5C;
  v21[3] = &unk_100268CF0;
  id v22 = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100098F68;
  v18[3] = &unk_10026CB08;
  id v19 = v14;
  id v15 = v9;
  id v16 = v14;
  id v17 = v12;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v21,  v18,  0.5);
}

@end