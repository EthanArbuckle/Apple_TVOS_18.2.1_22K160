@interface PBApplicationSceneTransitionView
- (BOOL)isAnimating;
- (BOOL)isContentViewClassKindOfClass:(Class)a3;
- (UIView)contentView;
- (UIView)pendingContentView;
- (UIViewPropertyAnimator)transitionAnimator;
- (void)accessContentView:(id)a3;
- (void)modifyContentViews:(id)a3;
- (void)setContentView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)stopAnimation;
@end

@implementation PBApplicationSceneTransitionView

- (BOOL)isAnimating
{
  transitionAnimator = self->_transitionAnimator;
  if (transitionAnimator) {
    LOBYTE(transitionAnimator) = -[UIViewPropertyAnimator state](transitionAnimator, "state") == (id)1;
  }
  return (char)transitionAnimator;
}

- (void)stopAnimation
{
  if (-[PBApplicationSceneTransitionView isAnimating](self, "isAnimating"))
  {
    -[UIViewPropertyAnimator stopAnimation:](self->_transitionAnimator, "stopAnimation:", 0LL);
    -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_transitionAnimator, "finishAnimationAtPosition:", 0LL);
    transitionAnimator = self->_transitionAnimator;
    self->_transitionAnimator = 0LL;
  }

- (void)setContentView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = (UIView *)a3;
  id v9 = a5;
  if (v8)
  {
    if (self->_contentView != v8)
    {
      WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_pendingContentView);

      if (WeakRetained != v8)
      {
        v11 = v8;
        -[PBApplicationSceneTransitionView stopAnimation](self, "stopAnimation");
        id v12 = objc_loadWeakRetained((id *)&self->_pendingContentView);

        if (v12)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_pendingContentView);
          [v13 removeFromSuperview];
        }

        objc_storeWeak((id *)&self->_pendingContentView, v11);
        v14 = self->_contentView;
        v15 = v11;
        -[PBApplicationSceneTransitionView insertSubview:atIndex:](self, "insertSubview:atIndex:", v15, 0LL);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_1000395B8;
        v31[3] = &unk_1003CFF08;
        v16 = v14;
        v32 = v16;
        v17 = objc_retainBlock(v31);
        objc_initWeak(&location, self);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_1000395D4;
        v26[3] = &unk_1003D1838;
        objc_copyWeak(&v29, &location);
        v18 = v16;
        v27 = v18;
        id v28 = v9;
        v19 = objc_retainBlock(v26);
        if (v6 && v18)
        {
          v20 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:curve:animations:",  0LL,  v17,  0.25);
          transitionAnimator = self->_transitionAnimator;
          self->_transitionAnimator = v20;

          -[UIViewPropertyAnimator setUserInteractionEnabled:]( self->_transitionAnimator,  "setUserInteractionEnabled:",  1LL);
          v23[0] = _NSConcreteStackBlock;
          v22 = self->_transitionAnimator;
          v23[1] = 3221225472LL;
          v23[2] = sub_100039658;
          v23[3] = &unk_1003D1860;
          objc_copyWeak(&v25, &location);
          v24 = v19;
          -[UIViewPropertyAnimator addCompletion:](v22, "addCompletion:", v23);
          -[UIViewPropertyAnimator startAnimation](self->_transitionAnimator, "startAnimation");

          objc_destroyWeak(&v25);
        }

        else
        {
          ((void (*)(void *))v17[2])(v17);
          ((void (*)(void *, uint64_t))v19[2])(v19, 1LL);
        }

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)modifyContentViews:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (v4)
  {
    if (self->_contentView)
    {
      (*((void (**)(id))v4 + 2))(v4);
      p_pendingContentView = &self->_pendingContentView;
      id WeakRetained = objc_loadWeakRetained((id *)p_pendingContentView);

      if (WeakRetained)
      {
        id v8 = objc_loadWeakRetained((id *)p_pendingContentView);
        ((void (**)(void, id))v5)[2](v5, v8);
      }
    }
  }
}

- (void)accessContentView:(id)a3
{
  id v4 = (void (**)(id, UIView *))a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingContentView);

    if (WeakRetained && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10027337C();
    }
    v4[2](v4, self->_contentView);
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)pendingContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pendingContentView);
}

- (UIViewPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void).cxx_destruct
{
}

- (BOOL)isContentViewClassKindOfClass:(Class)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100039908;
  v5[3] = &unk_1003D1888;
  v5[4] = &v6;
  v5[5] = a3;
  -[PBApplicationSceneTransitionView accessContentView:](self, "accessContentView:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end