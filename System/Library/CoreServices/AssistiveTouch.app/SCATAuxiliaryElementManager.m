@interface SCATAuxiliaryElementManager
- (BOOL)containsElement:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isViewControllerLoaded;
- (BOOL)isVisibilityTiedToFocus;
- (BOOL)providesElements;
- (SCATAuxiliaryElementManagerViewController)viewController;
- (SCATElement)contextElement;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (int64_t)numberOfElements;
- (int64_t)role;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)setContextElement:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setRole:(int64_t)a3;
- (void)setViewController:(id)a3;
- (void)willBecomeCurrentAuxiliaryElementManager;
- (void)willResignCurrentAuxiliaryElementManager;
@end

@implementation SCATAuxiliaryElementManager

- (BOOL)isViewControllerLoaded
{
  return self->_viewController != 0LL;
}

- (BOOL)isVisibilityTiedToFocus
{
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_enabled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_enabled = a3;
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
    v8 = v7;
    if (v5)
    {
      unsigned int v9 = -[SCATAuxiliaryElementManager isVisibilityTiedToFocus](self, "isVisibilityTiedToFocus");
      double v10 = 1.0;
      if (v9) {
        double v10 = 0.0;
      }
      [v8 setAlpha:v10];
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);

      if (!v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scatUIContext]);

        [v14 bounds];
        objc_msgSend(v8, "setFrame:");
        [v15 viewWillAppear:v4];
        [v14 addSubview:v8];
        [v8 setHidden:0];
        [v15 viewDidAppear:v4];

        goto LABEL_10;
      }

      v7 = v8;
      uint64_t v12 = 0LL;
    }

    else
    {
      uint64_t v12 = 1LL;
    }

    [v7 setHidden:v12];
LABEL_10:
  }

- (void)setContextElement:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  [v6 updateWithContextElement:v5];
}

- (void)willBecomeCurrentAuxiliaryElementManager
{
  if (-[SCATAuxiliaryElementManager isVisibilityTiedToFocus](self, "isVisibilityTiedToFocus"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    [v3 setTransitioningToOrFromActive:1];

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
    [v6 bringSubviewToFront:v5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000B228;
    v12[3] = &unk_100121D18;
    id v7 = v5;
    id v13 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v12,  0LL,  0.3,  0.0);
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000B234;
    v10[3] = &unk_100121D18;
    id v11 = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000B240;
    v9[3] = &unk_100121D40;
    id v8 = v7;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v10,  v9,  0.3,  0.0);
  }

- (void)willResignCurrentAuxiliaryElementManager
{
  if (-[SCATAuxiliaryElementManager isVisibilityTiedToFocus](self, "isVisibilityTiedToFocus"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    [v3 setTransitioningToOrFromActive:1];

    v4[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000B334;
    v5[3] = &unk_100121D18;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10000B380;
    v4[3] = &unk_100121D40;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v5,  v4,  0.3,  0.0);
  }

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);

  [v7 updateCustomFocusingViewStateForViewsWithElement:v6];
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  return 0LL;
}

- (id)lastElementWithOptions:(int *)a3
{
  return 0LL;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0LL;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0LL;
}

- (BOOL)containsElement:(id)a3
{
  return 0;
}

- (int64_t)numberOfElements
{
  return 0LL;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (SCATAuxiliaryElementManagerViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (SCATElement)contextElement
{
  return self->_contextElement;
}

- (void).cxx_destruct
{
}

@end