@interface SRBarSlideNavigationTransitionController
- (SiriUINavigationController)_navigationController;
- (int64_t)operation;
- (void)_setNavigationController:(id)a3;
- (void)configureWithNavigationController:(id)a3;
- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation SRBarSlideNavigationTransitionController

- (void)configureWithNavigationController:(id)a3
{
  id v4 = a3;
  objc_opt_class(&OBJC_CLASS___SiriUINavigationController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    -[SRBarSlideNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
  }

  else
  {
    v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_100069E50(v7);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationBar]);
  [v8 setAlpha:0.0];
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006FC0;
  v7[3] = &unk_1000B9F88;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007000;
  v5[3] = &unk_1000B9FB0;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v7 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriUINavigationController)_navigationController
{
  return (SiriUINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end