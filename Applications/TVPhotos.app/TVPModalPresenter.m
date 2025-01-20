@interface TVPModalPresenter
+ (id)presenter;
- (TVPModalPresenter)init;
- (UINavigationController)modalRootViewController;
- (UIViewController)presentedViewController;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)hidden_init;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)showController:(id)a3 fromController:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation TVPModalPresenter

- (TVPModalPresenter)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPModalPresenter.m",  51,  @"%s is not available as initializer",  "-[TVPModalPresenter init]");

  abort();
}

- (id)hidden_init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPModalPresenter;
  v2 = -[TVPModalPresenter init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UIViewController);
    v4 = -[_TVPModalPresenterNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS____TVPModalPresenterNavigationController),  "initWithRootViewController:",  v3);
    modalRootViewController = v2->_modalRootViewController;
    v2->_modalRootViewController = &v4->super;

    -[UINavigationController setNavigationBarHidden:](v2->_modalRootViewController, "setNavigationBarHidden:", 1LL);
    -[UINavigationController setDelegate:](v2->_modalRootViewController, "setDelegate:", v2);
    -[UINavigationController setModalPresentationStyle:]( v2->_modalRootViewController,  "setModalPresentationStyle:",  4LL);
    -[UINavigationController setTransitioningDelegate:](v2->_modalRootViewController, "setTransitioningDelegate:", v2);
    v6 = -[TVPModalPresentationAnimator initForPresenting:]( objc_alloc(&OBJC_CLASS___TVPModalPresentationAnimator),  "initForPresenting:",  1LL);
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = v6;

    v8 = -[TVPModalPresentationAnimator initForPresenting:]( objc_alloc(&OBJC_CLASS___TVPModalPresentationAnimator),  "initForPresenting:",  0LL);
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = v8;
  }

  return v2;
}

+ (id)presenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006F20;
  block[3] = &unk_1000C99A8;
  block[4] = a1;
  if (qword_100102E68 != -1) {
    dispatch_once(&qword_100102E68, block);
  }
  return (id)qword_100102E60;
}

- (UIViewController)presentedViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresenter modalRootViewController](self, "modalRootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    v6 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresenter modalRootViewController](self, "modalRootViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 topViewController]);
  }

  return (UIViewController *)v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_presentingAnimator;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self->_dismissingAnimator;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[TVPModalPresentationController initWithPresentedViewController:presentingViewController:]( objc_alloc(&OBJC_CLASS___TVPModalPresentationController),  "initWithPresentedViewController:presentingViewController:",  v7,  v6);

  return v8;
}

- (void)showController:(id)a3 fromController:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100007254;
  v32[3] = &unk_1000C99D0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPModalPresenter modalRootViewController](self, "modalRootViewController"));
  id v33 = v11;
  id v12 = v8;
  id v34 = v12;
  id v13 = v9;
  id v35 = v13;
  id v14 = v10;
  id v36 = v14;
  v15 = objc_retainBlock(v32);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000072FC;
  v26[3] = &unk_1000C99F8;
  id v16 = v11;
  id v27 = v16;
  id v17 = v13;
  id v28 = v17;
  v18 = v15;
  id v30 = v18;
  id v19 = v12;
  id v29 = v19;
  id v20 = v14;
  id v31 = v20;
  v21 = objc_retainBlock(v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v16 transitionCoordinator]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v16 transitionCoordinator]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000742C;
    v24[3] = &unk_1000C9A20;
    v25 = v21;
    [v23 animateAlongsideTransition:0 completion:v24];
  }

  else
  {
    ((void (*)(void *))v21[2])(v21);
  }
}

- (void)hideController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresenter modalRootViewController](self, "modalRootViewController"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 viewControllers]);
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(v11);
      }
      if (*(id *)(*((void *)&v28 + 1) + 8 * v15) == v8) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

    id v16 = v8;

    if (!v16) {
      goto LABEL_16;
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000767C;
    v23[3] = &unk_1000C9A48;
    id v17 = v10;
    id v24 = v17;
    id v11 = v16;
    id v25 = v11;
    BOOL v27 = a4;
    id v26 = v9;
    v18 = objc_retainBlock(v23);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 transitionCoordinator]);

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 transitionCoordinator]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10000773C;
      v21[3] = &unk_1000C9A20;
      v22 = v18;
      [v20 animateAlongsideTransition:0 completion:v21];
    }

    else
    {
      ((void (*)(void *))v18[2])(v18);
    }
  }

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPModalPresenter modalRootViewController](self, "modalRootViewController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100007888;
  v15[3] = &unk_1000C95C8;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = objc_retainBlock(v15);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 presentingViewController]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 presentingViewController]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000078F4;
    v13[3] = &unk_1000C95F0;
    uint64_t v14 = v10;
    [v12 dismissViewControllerAnimated:v4 completion:v13];
  }

  else
  {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (UINavigationController)modalRootViewController
{
  return self->_modalRootViewController;
}

- (void).cxx_destruct
{
}

@end