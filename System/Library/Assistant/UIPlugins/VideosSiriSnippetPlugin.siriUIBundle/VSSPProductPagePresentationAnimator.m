@interface VSSPProductPagePresentationAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation VSSPProductPagePresentationAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextToViewControllerKey]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v6 setAlpha:0.0];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);
  [v7 addSubview:v6];

  -[VSSPProductPagePresentationAnimator transitionDuration:](self, "transitionDuration:", v4);
  double v9 = v8;
  id v13 = v4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_6C3C;
  v14[3] = &unk_106D0;
  id v15 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_6C48;
  v12[3] = &unk_106F8;
  id v10 = v4;
  id v11 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v14,  v12,  v9,  0.0);
}

@end