@interface SRCardStackNavigationTransitionController
- (BOOL)_isCancelling;
- (BOOL)_isGesturing;
- (CGAffineTransform)_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:(SEL)a3 withSemanticContentAttribute:(double)a4;
- (CGAffineTransform)_prepareFromPlatteredCardViewForTransitionWithContext:(SEL)a3;
- (CGRect)_backgroundEmptyPlatterViewOriginalFrame;
- (CGRect)_convertFrameForFromPlatteredCardView:(id)a3 toContainerView:(id)a4;
- (CGRect)_fromPlatteredCardViewOriginalFrame;
- (CGRect)_prepareBackgroundEmptyPlatteredViewForTransitionInContext:(id)a3;
- (CGRect)_prepareToPlatteredCardViewForTransitionInContext:(id)a3;
- (NSMutableArray)_recentViewControllers;
- (SRCardStackNavigationTransitionController)initWithCompactResultViewController:(id)a3;
- (SiriSharedUICompactResultView)_compactResultView;
- (SiriSharedUICompactResultViewController)compactResultViewController;
- (UINavigationController)_navigationController;
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (double)_transitionDurationForOperation:(int64_t)a3 context:(id)a4;
- (double)transitionDuration:(id)a3;
- (id)_backgroundPlatteredCardViewForOperation:(int64_t)a3 recentViewControllers:(id)a4;
- (id)_fromPlatteredCardViewGivenFromViewController:(id)a3;
- (id)_popTransitionContextGivenOriginalContext:(id)a3 revealedViewController:(id)a4 poppedViewController:(id)a5 duration:(double)a6;
- (id)_safelyExtractSnippetPlatterViewControllerFromViewController:(id)a3;
- (id)_toPlatteredCardViewGivenToViewController:(id)a3;
- (id)interactionControllerForAnimationController:(id)a3;
- (int64_t)operation;
- (unint64_t)_expectedPopCountForTransitionContext:(id)a3;
- (void)_animateMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)_animateOnePopTransition:(id)a3 originalContext:(id)a4 andComplete:(BOOL)a5 completion:(id)a6;
- (void)_animatePushTransition:(id)a3;
- (void)_animateTransitionForOperation:(int64_t)a3 context:(id)a4;
- (void)_panGestureRecognizerDidPan:(id)a3;
- (void)_performPushTransitionFromViewController:(id)a3 andView:(id)a4 toViewController:(id)a5 andView:(id)a6 inContainerView:(id)a7 recentViewControllers:(id)a8 transitionDuration:(double)a9 animated:(BOOL)a10 transitionCompletion:(id)a11 completion:(id)a12;
- (void)_recursivelyAnimateNextMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5;
- (void)_setBackgroundEmptyPlatterViewOriginalFrame:(CGRect)a3;
- (void)_setCancelling:(BOOL)a3;
- (void)_setFromPlatteredCardViewOriginalFrame:(CGRect)a3;
- (void)_setGesturing:(BOOL)a3;
- (void)_setNavigationController:(id)a3;
- (void)_setRecentViewControllers:(id)a3;
- (void)_transitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)animateTransition:(id)a3;
- (void)configureWithNavigationController:(id)a3;
- (void)layout;
- (void)setOperation:(int64_t)a3;
- (void)setPanGestureRecognizer:(id)a3;
@end

@implementation SRCardStackNavigationTransitionController

- (SRCardStackNavigationTransitionController)initWithCompactResultViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SRCardStackNavigationTransitionController;
  v6 = -[SRCardStackNavigationTransitionController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_compactResultViewController, a3);
    v8 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  v7,  "_panGestureRecognizerDidPan:");
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = v8;
  }

  return v7;
}

- (void)configureWithNavigationController:(id)a3
{
  id v4 = a3;
  -[SRCardStackNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
  [v4 setNavigationBarHidden:1];
}

- (id)interactionControllerForAnimationController:(id)a3
{
  if (-[SRCardStackNavigationTransitionController _isGesturing](self, "_isGesturing", a3)) {
    id v4 = self;
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (void)_animateTransitionForOperation:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = v6;
    -[SRCardStackNavigationTransitionController _recursivelyAnimateNextMultiPopKeyframe:outOfTotalKeyframes:transitionContext:]( self,  "_recursivelyAnimateNextMultiPopKeyframe:outOfTotalKeyframes:transitionContext:",  0LL,  -[SRCardStackNavigationTransitionController _expectedPopCountForTransitionContext:]( self,  "_expectedPopCountForTransitionContext:",  v6),  v6);
    goto LABEL_5;
  }

  if (!a3)
  {
    id v7 = v6;
    -[SRCardStackNavigationTransitionController _animatePushTransition:](self, "_animatePushTransition:", v6);
LABEL_5:
    id v6 = v7;
  }
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SRCardStackNavigationTransitionController operation](self, "operation");
  if (v5 == 2)
  {
    id v6 = self;
    uint64_t v7 = 1LL;
LABEL_8:
    -[SRCardStackNavigationTransitionController _animateTransitionForOperation:context:]( v6,  "_animateTransitionForOperation:context:",  v7,  v4);
    goto LABEL_9;
  }

  if (v5 == 1)
  {
    id v6 = self;
    uint64_t v7 = 0LL;
    goto LABEL_8;
  }

  if (!v5 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
    sub_10006C148();
  }
LABEL_9:
}

- (double)_transitionDurationForOperation:(int64_t)a3 context:(id)a4
{
  if (a3 != 1) {
    return 0.5;
  }
  unint64_t v6 = -[SRCardStackNavigationTransitionController _expectedPopCountForTransitionContext:]( self,  "_expectedPopCountForTransitionContext:",  a4,  v4,  v5);
  return 0.5 / (double)v6 + (double)(v6 - 1) * 0.05;
}

- (double)transitionDuration:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[SRCardStackNavigationTransitionController operation](self, "operation");
  switch(v6)
  {
    case 2LL:
      uint64_t v7 = self;
      uint64_t v8 = 1LL;
LABEL_8:
      -[SRCardStackNavigationTransitionController _transitionDurationForOperation:context:]( v7,  "_transitionDurationForOperation:context:",  v8,  v5);
      double v3 = v9;
      break;
    case 1LL:
      uint64_t v7 = self;
      uint64_t v8 = 0LL;
      goto LABEL_8;
    case 0LL:
      double v3 = 0.0;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
        sub_10006C1B4();
      }
      break;
  }

  return v3;
}

- (void)layout
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _navigationController](self, "_navigationController"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    __int128 v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
    __int128 v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
    __int128 v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:]( self,  "_fromPlatteredCardViewGivenFromViewController:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v9),  v16,  v17,  v18));
        v20[0] = v18;
        v20[1] = v17;
        v20[2] = v16;
        [v10 setTransform:v20];
        [v10 setNeedsLayout];

        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v7);
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v5 reverseObjectEnumerator]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);

  id v13 = [[SRUIFMutableStack alloc] initWithArray:v12];
  id v14 = objc_alloc_init(&OBJC_CLASS___SRUIFMutableStack);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 popTopObject]);
  if (v15) {
    [v14 pushObject:v15];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100038F10;
  v19[3] = &unk_1000BAF18;
  v19[4] = v14;
  v19[5] = self;
  [v13 popObjectsUsingBlock:v19];
}

- (SiriSharedUICompactResultView)_compactResultView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController compactResultViewController]( self,  "compactResultViewController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 compactResultView]);

  return (SiriSharedUICompactResultView *)v3;
}

- (void)_performPushTransitionFromViewController:(id)a3 andView:(id)a4 toViewController:(id)a5 andView:(id)a6 inContainerView:(id)a7 recentViewControllers:(id)a8 transitionDuration:(double)a9 animated:(BOOL)a10 transitionCompletion:(id)a11 completion:(id)a12
{
  id v19 = a3;
  id v55 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v57 = a11;
  id v24 = a12;
  v53 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _backgroundPlatteredCardViewForOperation:recentViewControllers:]( self,  "_backgroundPlatteredCardViewForOperation:recentViewControllers:",  0LL,  v23));
  v56 = v19;
  v26 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:]( self,  "_fromPlatteredCardViewGivenFromViewController:",  v19));
  v54 = v20;
  uint64_t v27 = objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:]( self,  "_toPlatteredCardViewGivenToViewController:",  v20));
  [v22 bounds];
  objc_msgSend(v21, "setFrame:");
  v52 = v21;
  [v22 addSubview:v21];
  [v26 frame];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v26 superview]);
  objc_msgSend(v22, "convertRect:fromView:", v36, v29, v31, v33, v35);
  -[SRCardStackNavigationTransitionController _setFromPlatteredCardViewOriginalFrame:]( self,  "_setFromPlatteredCardViewOriginalFrame:");

  if (v25)
  {
    [v25 frame];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue([v25 superview]);
    objc_msgSend(v22, "convertRect:fromView:", v45, v38, v40, v42, v44);
    -[SRCardStackNavigationTransitionController _setBackgroundEmptyPlatterViewOriginalFrame:]( self,  "_setBackgroundEmptyPlatterViewOriginalFrame:");
  }

  v46 = -[SRCardStackNavigationTransitionContext initWithCompletion:]( objc_alloc(&OBJC_CLASS___SRCardStackNavigationTransitionContext),  "initWithCompletion:",  v57);
  -[SRCardStackNavigationTransitionContext setPercentComplete:](v46, "setPercentComplete:", 1.0);
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardView:](v46, "setBackgroundPlatteredCardView:", v25);
  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame]( self,  "_backgroundEmptyPlatterViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardViewOriginalFrame:]( v46,  "setBackgroundPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionController _fromPlatteredCardViewOriginalFrame]( self,  "_fromPlatteredCardViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardViewOriginalFrame:]( v46,  "setFromPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardView:](v46, "setFromPlatteredCardView:", v26);
  v47 = (void *)v27;
  -[SRCardStackNavigationTransitionContext setToPlatteredCardView:](v46, "setToPlatteredCardView:", v27);
  -[SRCardStackNavigationTransitionContext setContainerView:](v46, "setContainerView:", v22);
  -[SRCardStackNavigationTransitionContext setTransitionDuration:](v46, "setTransitionDuration:", a9);
  objc_initWeak(location, self);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000393D4;
  v59[3] = &unk_1000BAF40;
  objc_copyWeak(&v62, location);
  v48 = v46;
  v60 = v48;
  BOOL v63 = a10;
  id v49 = v24;
  id v61 = v49;
  v50 = objc_retainBlock(v59);
  v51 = v50;
  if (a10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100039414;
    block[3] = &unk_1000BA470;
    block[4] = v50;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    ((void (*)(void *))v50[2])(v50);
  }

  objc_destroyWeak(&v62);
  objc_destroyWeak(location);
}

- (void)_animatePushTransition:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextFromViewControllerKey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 viewForKey:UITransitionContextFromViewKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllerForKey:UITransitionContextToViewControllerKey]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 viewForKey:UITransitionContextToViewKey]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:]( self,  "_toPlatteredCardViewGivenToViewController:",  v7));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000396A0;
  v29[3] = &unk_1000BAD80;
  id v10 = v4;
  id v30 = v10;
  id v19 = objc_retainBlock(v29);
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000396AC;
  v21[3] = &unk_1000BAF68;
  objc_copyWeak(&v27, &location);
  id v11 = v9;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  id v13 = v5;
  id v24 = v13;
  id v14 = v6;
  id v25 = v14;
  id v15 = v8;
  id v26 = v15;
  __int128 v16 = objc_retainBlock(v21);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  -[SRCardStackNavigationTransitionController transitionDuration:](self, "transitionDuration:", v12);
  LOBYTE(v18) = 1;
  -[SRCardStackNavigationTransitionController _performPushTransitionFromViewController:andView:toViewController:andView:inContainerView:recentViewControllers:transitionDuration:animated:transitionCompletion:completion:]( self,  "_performPushTransitionFromViewController:andView:toViewController:andView:inContainerView:recentViewControllers:tran sitionDuration:animated:transitionCompletion:completion:",  v20,  v14,  v7,  v15,  v13,  v17,  v18,  v19,  v16);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_recursivelyAnimateNextMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000398A8;
  v10[3] = &unk_1000BAF90;
  v12[1] = (id)a3;
  v12[2] = (id)a4;
  objc_copyWeak(v12, &location);
  id v9 = v8;
  id v11 = v9;
  -[SRCardStackNavigationTransitionController _animateMultiPopKeyframe:outOfTotalKeyframes:transitionContext:completion:]( self,  "_animateMultiPopKeyframe:outOfTotalKeyframes:transitionContext:completion:",  a3,  a4,  v9,  v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_animateMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  id v13 = (char *)[v12 count];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v13 - 1]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v13 - 2]);
  -[SRCardStackNavigationTransitionController transitionDuration:](self, "transitionDuration:", v10);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _popTransitionContextGivenOriginalContext:revealedViewController:poppedViewController:duration:]( self,  "_popTransitionContextGivenOriginalContext:revealedViewController:poppedViewController:duration:",  v10,  v15,  v14));
  BOOL v17 = a4 - 1 == a3;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100039AA0;
  v19[3] = &unk_1000BAFB8;
  BOOL v22 = v17;
  objc_copyWeak(&v21, &location);
  id v18 = v11;
  id v20 = v18;
  -[SRCardStackNavigationTransitionController _animateOnePopTransition:originalContext:andComplete:completion:]( self,  "_animateOnePopTransition:originalContext:andComplete:completion:",  v16,  v10,  v17,  v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)_popTransitionContextGivenOriginalContext:(id)a3 revealedViewController:(id)a4 poppedViewController:(id)a5 duration:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 containerView]);
  [v13 setClipsToBounds:0];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:]( self,  "_fromPlatteredCardViewGivenFromViewController:",  v12));

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:]( self,  "_toPlatteredCardViewGivenToViewController:",  v11));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _backgroundPlatteredCardViewForOperation:recentViewControllers:]( self,  "_backgroundPlatteredCardViewForOperation:recentViewControllers:",  1LL,  v16));

  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame]( self,  "_backgroundEmptyPlatterViewOriginalFrame");
  v35.origin.x = CGRectZero.origin.x;
  v35.origin.y = CGRectZero.origin.y;
  v35.size.width = CGRectZero.size.width;
  v35.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v34, v35))
  {
    [v14 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 superview]);
    objc_msgSend(v13, "convertRect:fromView:", v26, v19, v21, v23, v25);
    -[SRCardStackNavigationTransitionController _setBackgroundEmptyPlatterViewOriginalFrame:]( self,  "_setBackgroundEmptyPlatterViewOriginalFrame:");
  }

  id v27 = objc_alloc(&OBJC_CLASS___SRCardStackNavigationTransitionContext);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100039D64;
  v32[3] = &unk_1000BAD80;
  id v33 = v10;
  id v28 = v10;
  double v29 = -[SRCardStackNavigationTransitionContext initWithCompletion:](v27, "initWithCompletion:", v32);
  -[SRCardStackNavigationTransitionContext setPercentComplete:](v29, "setPercentComplete:", 0.0);
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardView:](v29, "setBackgroundPlatteredCardView:", v17);
  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame]( self,  "_backgroundEmptyPlatterViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardViewOriginalFrame:]( v29,  "setBackgroundPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionController _fromPlatteredCardViewOriginalFrame]( self,  "_fromPlatteredCardViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardViewOriginalFrame:]( v29,  "setFromPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardView:](v29, "setFromPlatteredCardView:", v14);
  -[SRCardStackNavigationTransitionContext setToPlatteredCardView:](v29, "setToPlatteredCardView:", v15);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 containerView]);
  -[SRCardStackNavigationTransitionContext setContainerView:](v29, "setContainerView:", v30);

  -[SRCardStackNavigationTransitionContext setTransitionDuration:](v29, "setTransitionDuration:", a6);
  return v29;
}

- (void)_animateOnePopTransition:(id)a3 originalContext:(id)a4 andComplete:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100039EA8;
  v16[3] = &unk_1000BAFE0;
  id v13 = v10;
  id v17 = v13;
  objc_copyWeak(&v20, &location);
  BOOL v21 = a5;
  id v14 = v11;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  -[SRCardStackNavigationTransitionController _transitionWithContext:animated:completion:]( self,  "_transitionWithContext:animated:completion:",  v13,  1LL,  v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_transitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 backgroundPlatteredCardView]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 fromPlatteredCardView]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 toPlatteredCardView]);
  -[SRCardStackNavigationTransitionController _prepareFromPlatteredCardViewForTransitionWithContext:]( self,  "_prepareFromPlatteredCardViewForTransitionWithContext:",  v8);
  -[SRCardStackNavigationTransitionController _prepareToPlatteredCardViewForTransitionInContext:]( self,  "_prepareToPlatteredCardViewForTransitionInContext:",  v8);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  -[SRCardStackNavigationTransitionController _prepareBackgroundEmptyPlatteredViewForTransitionInContext:]( self,  "_prepareBackgroundEmptyPlatteredViewForTransitionInContext:",  v8);
  uint64_t v35 = v21;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10003A378;
  v42[3] = &unk_1000BB008;
  id v28 = v11;
  id v43 = v28;
  __int128 v47 = v58;
  __int128 v48 = v59;
  __int128 v49 = v60;
  id v29 = v12;
  id v44 = v29;
  uint64_t v50 = v14;
  uint64_t v51 = v16;
  uint64_t v52 = v18;
  uint64_t v53 = v20;
  id v30 = v8;
  id v45 = v30;
  id v31 = v10;
  id v46 = v31;
  uint64_t v54 = v35;
  uint64_t v55 = v23;
  uint64_t v56 = v25;
  uint64_t v57 = v27;
  double v32 = objc_retainBlock(v42);
  objc_initWeak(&location, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10003A3EC;
  v38[3] = &unk_1000BB030;
  id v33 = v9;
  id v39 = v33;
  objc_copyWeak(&v40, &location);
  CGRect v34 = objc_retainBlock(v38);
  if (v6)
  {
    [v30 transitionDuration];
    v36[4] = v34;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10003A494;
    v37[3] = &unk_1000BA470;
    v37[4] = v32;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10003A4A0;
    v36[3] = &unk_1000BAA38;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:",  0LL,  v37,  v36);
  }

  else
  {
    ((void (*)(void *))v32[2])(v32);
    ((void (*)(void *, uint64_t))v34[2])(v34, 1LL);
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (id)_safelyExtractSnippetPlatterViewControllerFromViewController:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "contentPlatterViewController") & 1) != 0) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentPlatterViewController]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_backgroundPlatteredCardViewForOperation:(int64_t)a3 recentViewControllers:(id)a4
{
  BOOL v6 = a3 == 0;
  id v7 = a4;
  id v8 = (char *)[v7 count];
  if (a3 == 1) {
    unint64_t v9 = 3LL;
  }
  else {
    unint64_t v9 = 2LL * v6;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _compactResultView](self, "_compactResultView"));
  if ((unint64_t)v8 >= v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:&v8[-v9]]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:]( self,  "_safelyExtractSnippetPlatterViewControllerFromViewController:",  v12));

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 contentPlatterView]);
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    else {
      uint64_t v16 = v10;
    }
    id v11 = v16;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (unint64_t)_expectedPopCountForTransitionContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 viewControllerForKey:UITransitionContextToViewControllerKey]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  unint64_t v6 = (unint64_t)[v5 indexOfObject:v4];
  id v7 = (char *)[v5 count] + ~v6;

  return (unint64_t)v7;
}

- (id)_fromPlatteredCardViewGivenFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _compactResultView](self, "_compactResultView"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:]( self,  "_safelyExtractSnippetPlatterViewControllerFromViewController:",  v4));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentPlatterView]);
  id v8 = v7;
  if (!v7) {
    id v7 = v5;
  }
  id v9 = v7;

  return v9;
}

- (id)_toPlatteredCardViewGivenToViewController:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:]( self,  "_safelyExtractSnippetPlatterViewControllerFromViewController:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentPlatterView]);

  return v4;
}

- (CGRect)_convertFrameForFromPlatteredCardView:(id)a3 toContainerView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 superview]);

  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGAffineTransform)_prepareFromPlatteredCardViewForTransitionWithContext:(SEL)a3
{
  id v5 = a4;
  [v5 percentComplete];
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 fromPlatteredCardView]);
  id v9 = [v5 semanticContentAttribute];

  -[SRCardStackNavigationTransitionController _calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:]( self,  "_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:",  v9,  1.0 - v7);
  -[SRCardStackNavigationTransitionController _calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:]( self,  "_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:",  v9,  v7);
  v11[0] = v11[3];
  v11[1] = v11[4];
  v11[2] = v11[5];
  [v8 setTransform:v11];

  return result;
}

- (CGAffineTransform)_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:(SEL)a3 withSemanticContentAttribute:(double)a4
{
  double v8 = -30.0;
  if (a5 == 4) {
    double v8 = 30.0;
  }
  __int128 v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformTranslate(&v13, &v12, v8 * a4, 0.0);
  __int128 v11 = *(_OWORD *)&v13.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v13.a;
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v13.tx;
  return result;
}

- (CGRect)_prepareToPlatteredCardViewForTransitionInContext:(id)a3
{
  id v3 = a3;
  [v3 percentComplete];
  double v44 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 toPlatteredCardView]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  [v3 fromPlatteredCardViewOriginalFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v3 semanticContentAttribute];

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
  objc_msgSend(v16, "convertRect:fromView:", v6, v8, v10, v12, v14);
  double v18 = v17;
  double v20 = v19;
  double v43 = v21;
  double v23 = v22;
  [v6 bounds];
  double v25 = v24;
  double v27 = v26;
  double v28 = v24 - v18;
  double v29 = -(v24 - v18);
  [v6 safeAreaInsets];
  double v31 = v20 + v23 - v30;
  objc_msgSend(v5, "sizeThatFits:", v25, v27);
  if (v32 >= v31) {
    double v33 = v31;
  }
  else {
    double v33 = v32;
  }
  if (v33 >= v23) {
    double v34 = v33;
  }
  else {
    double v34 = v23;
  }
  if (v15 == (id)4) {
    double v35 = v29;
  }
  else {
    double v35 = v28;
  }
  double v36 = v18 + v35 * v44;
  double v37 = v20 - (v34 - v23);
  if (v15 == (id)4) {
    double v38 = -((1.0 - v44) * v25);
  }
  else {
    double v38 = (1.0 - v44) * v25;
  }
  objc_msgSend(v5, "setFrame:", v36, v37, v43, v34);

  double v39 = v18 + v38;
  double v40 = v37;
  double v41 = v43;
  double v42 = v34;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)_prepareBackgroundEmptyPlatteredViewForTransitionInContext:(id)a3
{
  id v3 = a3;
  [v3 percentComplete];
  double v5 = v4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 backgroundPlatteredCardView]);
  [v3 backgroundPlatteredCardViewOriginalFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 containerView]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 superview]);
  objc_msgSend(v16, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  id v25 = [v3 semanticContentAttribute];
  double v26 = -12.0;
  if (v25 != (id)4) {
    double v26 = 12.0;
  }
  double v27 = v18 + v26 * (1.0 - v5);
  double v28 = v18 + v26 * v5;
  objc_msgSend(v6, "setFrame:", v27, v20, v22, v24);

  double v29 = v28;
  double v30 = v20;
  double v31 = v22;
  double v32 = v24;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_panGestureRecognizerDidPan:(id)a3
{
  id v16 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
  [v16 translationInView:v4];
  double v6 = v5;
  [v4 bounds];
  double v8 = v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  [v9 bounds];
  double v11 = v8 + v10;
  if ([v4 semanticContentAttribute] == (id)4) {
    double v11 = -v11;
  }
  switch((unint64_t)[v16 state])
  {
    case 1uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 1LL);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _navigationController](self, "_navigationController"));
      id v13 = [v12 popViewControllerAnimated:1];

      break;
    case 2uLL:
      double v14 = fmin(v6 / v11, 1.0);
      if (v14 < 0.0) {
        double v14 = 0.0;
      }
      -[SRCardStackNavigationTransitionController updateInteractiveTransition:]( self,  "updateInteractiveTransition:",  v14);
      break;
    case 3uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 0LL);
      [v16 velocityInView:v4];
      if ((v6 + v15 * 0.2) / v11 <= 0.15)
      {
        -[SRCardStackNavigationTransitionController _setCancelling:](self, "_setCancelling:", 1LL);
        goto LABEL_12;
      }

      -[SRCardStackNavigationTransitionController finishInteractiveTransition](self, "finishInteractiveTransition");
      break;
    case 4uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 0LL);
LABEL_12:
      -[SRCardStackNavigationTransitionController cancelInteractiveTransition](self, "cancelInteractiveTransition");
      break;
    default:
      break;
  }
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriSharedUICompactResultViewController)compactResultViewController
{
  return self->_compactResultViewController;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (BOOL)_isGesturing
{
  return self->_gesturing;
}

- (void)_setGesturing:(BOOL)a3
{
  self->_gesturing = a3;
}

- (BOOL)_isCancelling
{
  return self->_cancelling;
}

- (void)_setCancelling:(BOOL)a3
{
  self->_cancelling = a3;
}

- (UINavigationController)_navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
}

- (CGRect)_fromPlatteredCardViewOriginalFrame
{
  double x = self->_fromPlatteredCardViewOriginalFrame.origin.x;
  double y = self->_fromPlatteredCardViewOriginalFrame.origin.y;
  double width = self->_fromPlatteredCardViewOriginalFrame.size.width;
  double height = self->_fromPlatteredCardViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setFromPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_fromPlatteredCardViewOriginalFrame = a3;
}

- (CGRect)_backgroundEmptyPlatterViewOriginalFrame
{
  double x = self->_backgroundEmptyPlatterViewOriginalFrame.origin.x;
  double y = self->_backgroundEmptyPlatterViewOriginalFrame.origin.y;
  double width = self->_backgroundEmptyPlatterViewOriginalFrame.size.width;
  double height = self->_backgroundEmptyPlatterViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setBackgroundEmptyPlatterViewOriginalFrame:(CGRect)a3
{
  self->_backgroundEmptyPlatterViewOriginalFrame = a3;
}

- (NSMutableArray)_recentViewControllers
{
  return self->_recentViewControllers;
}

- (void)_setRecentViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end