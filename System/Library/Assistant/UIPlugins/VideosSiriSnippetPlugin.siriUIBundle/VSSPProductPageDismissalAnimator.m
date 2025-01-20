@interface VSSPProductPageDismissalAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation VSSPProductPageDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextFromViewControllerKey]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  -[VSSPProductPageDismissalAnimator transitionDuration:](self, "transitionDuration:", v4);
  double v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_6DA4;
  v14[3] = &unk_106D0;
  id v15 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_6DB0;
  v11[3] = &unk_10720;
  id v12 = v15;
  id v13 = v4;
  id v9 = v4;
  id v10 = v15;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v14,  v11,  v8,  0.0);
}

@end