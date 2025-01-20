@interface TVPModalPresentationAnimator
+ (id)_alphaAnimationFactory;
+ (id)_transformAnimationFactory;
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)initForPresenting:(BOOL)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TVPModalPresentationAnimator

- (id)initForPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPModalPresentationAnimator;
  id result = -[TVPModalPresentationAnimator init](&v5, "init");
  if (result) {
    *((_BYTE *)result + 8) = a3;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  unsigned int v3 = -[TVPModalPresentationAnimator isPresenting](self, "isPresenting", a3);
  double result = 0.7;
  if (!v3) {
    return 0.5;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[TVPModalPresentationAnimator isPresenting](self, "isPresenting");
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 viewForKey:UITransitionContextToViewKey]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 viewForKey:UITransitionContextFromViewKey]);
  v8 = (void *)v7;
  if (v5) {
    v9 = (void *)v6;
  }
  else {
    v9 = (void *)v7;
  }
  id v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);
  [v11 bounds];
  objc_msgSend(v10, "setFrame:");
  [v11 addSubview:v10];
  if (v5)
  {
    CGAffineTransformMakeScale(&v46, 0.9, 0.9);
    __int128 v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v45.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v45.c = v12;
    *(_OWORD *)&v45.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    double v13 = 0.0;
    double v14 = 1.0;
  }

  else
  {
    __int128 v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v46.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v46.c = v15;
    *(_OWORD *)&v46.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformMakeScale(&v45, 0.9, 0.9);
    double v13 = 1.0;
    double v14 = 0.0;
  }

  CGAffineTransform v44 = v46;
  objc_msgSend(v10, "setTransform:", &v44, v6);
  [v10 setAlpha:v13];
  -[TVPModalPresentationAnimator transitionDuration:](self, "transitionDuration:", v4);
  double v17 = v16;
  if (-[TVPModalPresentationAnimator isPresenting](self, "isPresenting")) {
    double v19 = v17 * 0.4;
  }
  else {
    double v19 = 0.0;
  }
  id v20 = objc_msgSend((id)objc_opt_class(self, v18), "_alphaAnimationFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v23 = objc_msgSend((id)objc_opt_class(self, v22), "_transformAnimationFactory");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v32[0] = _NSConcreteStackBlock;
  CGAffineTransform v41 = v45;
  v32[1] = 3221225472LL;
  v32[2] = sub_100028C10;
  v32[3] = &unk_1000CA4F8;
  char v43 = v5;
  double v38 = v17;
  uint64_t v39 = 0x403E000000000000LL;
  id v33 = v24;
  id v34 = v10;
  uint64_t v37 = 0x4045000000000000LL;
  id v35 = v21;
  double v40 = v19;
  double v42 = v14;
  id v36 = v4;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100028F38;
  v30[3] = &unk_1000C9680;
  id v31 = v36;
  id v25 = v36;
  id v26 = v21;
  id v27 = v10;
  id v28 = v24;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393248LL,  v26,  v32,  v30,  v17,  0.0);
}

+ (id)_alphaAnimationFactory
{
  return  -[_TVPModalPresentationAnimationFactory initWithCurve:]( objc_alloc(&OBJC_CLASS____TVPModalPresentationAnimationFactory),  "initWithCurve:",  0LL);
}

+ (id)_transformAnimationFactory
{
  return  -[_TVPModalPresentationAnimationFactory initWithCurve:]( objc_alloc(&OBJC_CLASS____TVPModalPresentationAnimationFactory),  "initWithCurve:",  1LL);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end