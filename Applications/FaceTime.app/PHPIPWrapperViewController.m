@interface PHPIPWrapperViewController
- (BOOL)pipIsBeingResized;
- (CGSize)preferredContentSize;
- (PHPIPWrapperViewController)init;
- (PHPIPWrapperViewControllerDelegateProtocol)delegate;
- (UIViewController)wrappedViewController;
- (id)didAnimatePictureInPictureStopCompletionBlock;
- (id)willAnimatePictureInPictureStopCompletionBlock;
- (void)_layoutWrappedSubview;
- (void)actionButtonTapped;
- (void)dealloc;
- (void)didAnimatePictureInPictureStop;
- (void)setDelegate:(id)a3;
- (void)setDidAnimatePictureInPictureStopCompletionBlock:(id)a3;
- (void)setPipIsBeingResized:(BOOL)a3;
- (void)setWillAnimatePictureInPictureStopCompletionBlock:(id)a3;
- (void)setWrappedViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidResize;
- (void)viewWillResize;
- (void)willAnimatePictureInPictureStart;
- (void)willAnimatePictureInPictureStop;
@end

@implementation PHPIPWrapperViewController

- (PHPIPWrapperViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PHPIPWrapperViewController;
  return -[PHPIPWrapperViewController initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0LL, 0LL);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PHPIPWrapperViewController;
  -[PHPIPWrapperViewController viewDidLoad](&v6, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  [v4 setBackgroundColor:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  [v5 setOpaque:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PHPIPWrapperViewController;
  -[PHPIPWrapperViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[PHPIPWrapperViewController _layoutWrappedSubview](self, "_layoutWrappedSubview");
}

- (void)setWrappedViewController:(id)a3
{
  id obj = a3;
  p_wrappedViewController = &self->_wrappedViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedViewController);

  objc_super v6 = obj;
  if (WeakRetained != obj)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_wrappedViewController);
    v8 = (PHPIPWrapperViewController *)objc_claimAutoreleasedReturnValue([v7 parentViewController]);

    if (v8 == self)
    {
      [v7 willMoveToParentViewController:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
      [v9 removeFromSuperview];

      [v7 removeFromParentViewController];
    }

    objc_storeWeak((id *)p_wrappedViewController, obj);

    objc_super v6 = obj;
  }
}

- (void)willAnimatePictureInPictureStart
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));

  v4 = (os_log_s *)sub_100008BD0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v22 = 138543362;
      v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Moving content into the wrapping PIP controller",  (uint8_t *)&v22,  0xCu);
    }

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    -[PHPIPWrapperViewController addChildViewController:](self, "addChildViewController:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
    [v7 addSubview:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    [v10 didMoveToParentViewController:self];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
    objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);
  }

  else if (v5)
  {
    int v22 = 138543362;
    v23 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Warning: Not moving content into wrapped PIP controller because wrappedViewController is nil",  (uint8_t *)&v22,  0xCu);
  }

- (void)willAnimatePictureInPictureStop
{
  objc_super v3 = (os_log_s *)sub_100008BD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "willAnimatePictureInPictureStop", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPIPWrapperViewController willAnimatePictureInPictureStopCompletionBlock]( self,  "willAnimatePictureInPictureStopCompletionBlock"));

  if (v4)
  {
    BOOL v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PHPIPWrapperViewController willAnimatePictureInPictureStopCompletionBlock]( self,  "willAnimatePictureInPictureStopCompletionBlock"));
    v5[2](v5, 1LL);
  }

- (void)didAnimatePictureInPictureStop
{
  objc_super v3 = (os_log_s *)sub_100008BD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    double v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: PIP Animation to fullscreen did complete",  (uint8_t *)&v12,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPIPWrapperViewController didAnimatePictureInPictureStopCompletionBlock]( self,  "didAnimatePictureInPictureStopCompletionBlock"));

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
    unsigned int v6 = [v5 wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:self];

    if (v6) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    }
    else {
      id v7 = 0LL;
    }
    v9 = (os_log_s *)sub_100008BD0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      double v13 = self;
      __int16 v14 = 2112;
      double v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling didAnimatePictureInPictureStopCompletionBlock with viewControllerToSteal: %@",  (uint8_t *)&v12,  0x16u);
    }

    v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[PHPIPWrapperViewController didAnimatePictureInPictureStopCompletionBlock]( self,  "didAnimatePictureInPictureStopCompletionBlock"));
    ((void (**)(void, uint64_t, void *))v10)[2](v10, 1LL, v7);

    -[PHPIPWrapperViewController setDidAnimatePictureInPictureStopCompletionBlock:]( self,  "setDidAnimatePictureInPictureStopCompletionBlock:",  0LL);
  }

  else
  {
    v8 = (os_log_s *)sub_100008BD0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      double v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Block didAnimatePictureInPictureStopCompletionBlock isn't set, won't restore view controller",  (uint8_t *)&v12,  0xCu);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
  [v11 wrapperViewControllerNeedsCleanup:self];
}

- (CGSize)preferredContentSize
{
  objc_super v3 = (os_log_s *)sub_100008BD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Updating preferredContentSize to use for the PIP wrapper view controller",  (uint8_t *)&v20,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
  char v5 = objc_opt_respondsToSelector(v4, "wrapperViewControllerPreferredContentSize:");

  if ((v5 & 1) != 0)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
    [v6 wrapperViewControllerPreferredContentSize:self];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    v11 = (os_log_s *)sub_100008BD0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      int v12 = "%{public}@: Found delegate with preferred size width=%f, height=%f";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, 0x20u);
    }
  }

  else
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    unsigned int v14 = [v13 conformsToProtocol:&OBJC_PROTOCOL___PHInCallRootViewControllerProtocol];

    if (!v14)
    {
      uint64_t v8 = 0x4059000000000000LL;
      uint64_t v10 = 0x4059000000000000LL;
      goto LABEL_11;
    }

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    [v15 preferredPIPContentAspectRatio];
    uint64_t v8 = v16;
    uint64_t v10 = v17;

    v11 = (os_log_s *)sub_100008BD0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      int v12 = "%{public}@: Found child view controller with preferred size width=%f, height=%f";
      goto LABEL_9;
    }
  }

- (void)actionButtonTapped
{
  objc_super v3 = (os_log_s *)sub_100008BD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: PIP action button tapped, will disconnect the current video call",  (uint8_t *)&v7,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentVideoCall]);
  [v4 disconnectCall:v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PHPIPWrapperViewController;
  -[PHPIPWrapperViewController dealloc](&v3, "dealloc");
}

- (void)viewWillResize
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"PHPIPControllerDidStartResizingNotification" object:self];
}

- (void)viewDidResize
{
  id v3 = (os_log_s *)sub_100008BD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    unsigned int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: PIP view did resize",  (uint8_t *)&v5,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"PHPIPControllerDidFinishResizingNotification" object:self];
}

- (void)_layoutWrappedSubview
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[PHPIPWrapperViewController preferredContentSize](self, "preferredContentSize");
  if (v8 == v9)
  {
    if (v5 >= v7) {
      double v10 = v7;
    }
    else {
      double v10 = v5;
    }
    double v11 = v10;
  }

  else if (v8 <= v9)
  {
    double v11 = v8 * (v7 / fmax(v9, 1.0));
    double v10 = v7;
  }

  else
  {
    double v10 = v9 * (v5 / fmax(v8, 1.0));
    double v11 = v5;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
  objc_msgSend(v12, "setFrame:", (v5 - v11) * 0.5, (v7 - v10) * 0.5, v11, v10);
}

- (UIViewController)wrappedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_wrappedViewController);
}

- (PHPIPWrapperViewControllerDelegateProtocol)delegate
{
  return (PHPIPWrapperViewControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)willAnimatePictureInPictureStopCompletionBlock
{
  return self->_willAnimatePictureInPictureStopCompletionBlock;
}

- (void)setWillAnimatePictureInPictureStopCompletionBlock:(id)a3
{
}

- (id)didAnimatePictureInPictureStopCompletionBlock
{
  return self->_didAnimatePictureInPictureStopCompletionBlock;
}

- (void)setDidAnimatePictureInPictureStopCompletionBlock:(id)a3
{
}

- (BOOL)pipIsBeingResized
{
  return self->_pipIsBeingResized;
}

- (void)setPipIsBeingResized:(BOOL)a3
{
  self->_pipIsBeingResized = a3;
}

- (void).cxx_destruct
{
}

@end