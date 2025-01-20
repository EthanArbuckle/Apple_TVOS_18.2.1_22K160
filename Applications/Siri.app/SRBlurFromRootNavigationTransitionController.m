@interface SRBlurFromRootNavigationTransitionController
- (SRBlurFromRootNavigationTransitionController)initWithDelegate:(id)a3;
- (SRBlurFromRootNavigationTransitionControllerDelegate)delegate;
- (UINavigationController)_navigationController;
- (int64_t)operation;
- (void)_coordinateTransitionWithTransitionCoordination:(id)a3;
- (void)_performPopAnimations;
- (void)_performPushAnimations;
- (void)_setNavigationController:(id)a3;
- (void)_updateBlurVisibility;
- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation SRBlurFromRootNavigationTransitionController

- (SRBlurFromRootNavigationTransitionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRBlurFromRootNavigationTransitionController;
  v5 = -[SRBlurFromRootNavigationTransitionController init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v8 = a3;
  if (-[SRBlurFromRootNavigationTransitionController operation](self, "operation"))
  {
    if ((id)-[SRBlurFromRootNavigationTransitionController operation](self, "operation") == (id)2)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRBlurFromRootNavigationTransitionController _navigationController]( self,  "_navigationController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
      id v6 = [v5 count];

      if (v6 == (id)1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
        [v7 blurFromRootNavigationTransitionController:self requestHostBlurVisible:0 requestPresentationBlurVisible:1];
      }
    }

    -[SRBlurFromRootNavigationTransitionController _coordinateTransitionWithTransitionCoordination:]( self,  "_coordinateTransitionWithTransitionCoordination:",  v8);
  }
}

- (void)_coordinateTransitionWithTransitionCoordination:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013700;
  v7[3] = &unk_1000B9FB0;
  objc_copyWeak(&v8, &location);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100013758;
  v5[3] = &unk_1000B9FB0;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v7 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_performPushAnimations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = [v4 count];

  if (v5 == (id)2)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    [v6 blurFromRootNavigationTransitionController:self requestBackgroundBlurViewVisible:1];
  }

- (void)_performPopAnimations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    [v6 blurFromRootNavigationTransitionController:self requestBackgroundBlurViewVisible:0];
  }

- (void)_updateBlurVisibility
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    id v12 = v6;
    v7 = self;
    uint64_t v8 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 viewControllers]);
    id v11 = [v10 count];

    if (v11 != (id)2) {
      return;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    id v12 = v6;
    v7 = self;
    uint64_t v8 = 1LL;
  }

  [v6 blurFromRootNavigationTransitionController:v7 requestHostBlurVisible:v8 requestPresentationBlurVisible:0];
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SRBlurFromRootNavigationTransitionControllerDelegate)delegate
{
  return (SRBlurFromRootNavigationTransitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UINavigationController)_navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end