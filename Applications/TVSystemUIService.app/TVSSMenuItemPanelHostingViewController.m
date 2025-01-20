@interface TVSSMenuItemPanelHostingViewController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (TVSSMenuItem)menuItem;
- (UIView)orthogonalNavigationFocusSinkView;
- (UIViewController)hostedViewController;
- (id)preferredFocusEnvironments;
- (void)_notifyPreviousViewController:(id)a3 nextViewController:(id)a4;
- (void)_updateHostedViewControllerWithPresentationContext:(id)a3 focusHeading:(unint64_t)a4 orthogonalNavigation:(BOOL)a5 completion:(id)a6;
- (void)addOrthogonalNavigationFocusSinkView;
- (void)setHostedViewController:(id)a3;
- (void)setHostedViewController:(id)a3 focusHeading:(unint64_t)a4 orthogonalNavigation:(BOOL)a5 completion:(id)a6;
- (void)setMenuItem:(id)a3;
- (void)setMenuItem:(id)a3 presentationContext:(id)a4;
- (void)setMenuItem:(id)a3 presentationContext:(id)a4 focusHeading:(unint64_t)a5;
- (void)setMenuItem:(id)a3 presentationContext:(id)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6 completion:(id)a7;
- (void)setOrthogonalNavigationDelegate:(id)a3 availableEdges:(unint64_t)a4;
- (void)setOrthogonalNavigationFocusSinkView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSMenuItemPanelHostingViewController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSMenuItemPanelHostingViewController;
  -[TVSSMenuItemPanelHostingViewController viewDidLoad](&v5, "viewDidLoad");
  if ((TVSSDebugGuideLinesEnabled() & 1) != 0)
  {
    v4 = +[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor");
    v3 = -[UIColor colorWithAlphaComponent:](v4, "colorWithAlphaComponent:", 0.1);
    id v2 = -[TVSSMenuItemPanelHostingViewController view](v7, "view");
    [v2 setBackgroundColor:v3];
  }

- (void)setMenuItem:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_menuItem != location[0])
  {
    objc_storeStrong((id *)&v4->_menuItem, location[0]);
    -[TVSSMenuItemPanelHostingViewController _updateHostedViewControllerWithPresentationContext:focusHeading:orthogonalNavigation:completion:]( v4,  "_updateHostedViewControllerWithPresentationContext:focusHeading:orthogonalNavigation:completion:",  0LL,  0LL,  0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMenuItem:(id)a3 presentationContext:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSMenuItemPanelHostingViewController setMenuItem:presentationContext:focusHeading:]( v7,  "setMenuItem:presentationContext:focusHeading:",  location[0],  v5,  0LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setMenuItem:(id)a3 presentationContext:(id)a4 focusHeading:(unint64_t)a5
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  -[TVSSMenuItemPanelHostingViewController setMenuItem:presentationContext:focusHeading:orthogonalNavigation:completion:]( v9,  "setMenuItem:presentationContext:focusHeading:orthogonalNavigation:completion:",  location[0],  v7,  a5,  0LL,  0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setMenuItem:(id)a3 presentationContext:(id)a4 focusHeading:(unint64_t)a5 orthogonalNavigation:(BOOL)a6 completion:(id)a7
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  unint64_t v13 = a5;
  BOOL v12 = a6;
  id v11 = 0LL;
  objc_storeStrong(&v11, a7);
  if (v16->_menuItem == location[0])
  {
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }
  }

  else
  {
    objc_storeStrong((id *)&v16->_menuItem, location[0]);
    -[TVSSMenuItemPanelHostingViewController _updateHostedViewControllerWithPresentationContext:focusHeading:orthogonalNavigation:completion:]( v16,  "_updateHostedViewControllerWithPresentationContext:focusHeading:orthogonalNavigation:completion:",  v14,  v13,  v12,  v11);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = 0;
  if (v6->_orthogonalNavigationFocusSinkView) {
    unsigned __int8 v4 = -[UIView isFocused](v6->_orthogonalNavigationFocusSinkView, "isFocused");
  }
  objc_storeStrong(location, 0LL);
  return (v4 ^ 1) & 1;
}

- (id)preferredFocusEnvironments
{
  if (self->_orthogonalNavigationFocusSinkView)
  {
    orthogonalNavigationFocusSinkView = self->_orthogonalNavigationFocusSinkView;
    v3 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &orthogonalNavigationFocusSinkView,  1LL);
  }

  else if (self->_hostedViewController)
  {
    hostedViewController = self->_hostedViewController;
    v3 =  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &hostedViewController,  1LL);
  }

  else
  {
    v3 = &__NSArray0__struct;
  }

  return v3;
}

- (void)setHostedViewController:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuItemPanelHostingViewController setHostedViewController:focusHeading:orthogonalNavigation:completion:]( v4,  "setHostedViewController:focusHeading:orthogonalNavigation:completion:",  location[0],  0LL,  0LL,  0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setHostedViewController:(id)a3 focusHeading:(unint64_t)a4 orthogonalNavigation:(BOOL)a5 completion:(id)a6
{
  v71 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v69 = a4;
  BOOL v68 = a5;
  id v67 = 0LL;
  objc_storeStrong(&v67, a6);
  if (v71->_hostedViewController == location[0])
  {
    if (v67) {
      (*((void (**)(id, void))v67 + 2))(v67, 0LL);
    }
  }

  else
  {
    id v66 = v71->_hostedViewController;
    v59 = _NSConcreteStackBlock;
    int v60 = -1073741824;
    int v61 = 0;
    v62 = sub_10007F808;
    v63 = &unk_1001B5A60;
    id v64 = v66;
    id v65 = objc_retainBlock(&v59);
    BOOL v28 = 1;
    if (v69 != 4) {
      BOOL v28 = v69 == 8;
    }
    BOOL v58 = v28;
    BOOL v27 = 0;
    if (v28) {
      BOOL v27 = v66 != 0LL;
    }
    BOOL v57 = v27;
    hostedViewController = v71->_hostedViewController;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSPPlatterViewController);
    id v55 = sub_10007F87C(hostedViewController, v6);
    id v56 = v55;
    [v55 _platterControllerWillDisappear:v27];
    if (!v27) {
      (*((void (**)(void))v65 + 2))();
    }
    objc_storeStrong((id *)&v71->_hostedViewController, location[0]);
    if (v71->_hostedViewController)
    {
      -[TVSSMenuItemPanelHostingViewController addChildViewController:]( v71,  "addChildViewController:",  v71->_hostedViewController);
      id v54 = -[UIViewController view](v71->_hostedViewController, "view");
      [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v24 = -[TVSSMenuItemPanelHostingViewController view](v71, "view");
      [v24 addSubview:v54];

      -[UIViewController didMoveToParentViewController:]( v71->_hostedViewController,  "didMoveToParentViewController:",  v71);
      +[TVSPConstants defaultPlatterDesiredWidth](&OBJC_CLASS___TVSPConstants, "defaultPlatterDesiredWidth");
      double v53 = v7;
      v25 = v71->_hostedViewController;
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVSPPlatterViewController);
      id v51 = sub_10007F87C(v25, v8);
      id v52 = v51;
      if (v51)
      {
        [v52 desiredWidth];
        double v53 = v9;
      }

      id v50 = -[TVSSMenuItemPanelHostingViewController view](v71, "view");
      id v23 = [v54 topAnchor];
      id v22 = [v50 topAnchor];
      id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
      v72[0] = v21;
      id v20 = [v54 bottomAnchor];
      id v19 = [v50 bottomAnchor];
      id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
      v72[1] = v18;
      id v17 = [v54 trailingAnchor];
      id v16 = [v50 trailingAnchor];
      id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
      v72[2] = v15;
      id v14 = [v54 widthAnchor];
      id v13 = [v14 constraintEqualToConstant:v53];
      v72[3] = v13;
      BOOL v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 4LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      v44 = _NSConcreteStackBlock;
      int v45 = -1073741824;
      int v46 = 0;
      v47 = sub_10007F93C;
      v48 = &unk_1001B5A60;
      id v49 = v50;
      +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v44);
      if (v57)
      {
        if (v68)
        {
          -[TVSSMenuItemPanelHostingViewController addOrthogonalNavigationFocusSinkView]( v71,  "addOrthogonalNavigationFocusSinkView");
          -[TVSSMenuItemPanelHostingViewController setNeedsFocusUpdate](v71, "setNeedsFocusUpdate");
          -[TVSSMenuItemPanelHostingViewController updateFocusIfNeeded](v71, "updateFocusIfNeeded");
        }

        v43 = -[UIViewController view](v71->_hostedViewController, "view");
        id v42 = [v66 view];
        v10 = objc_alloc(&OBJC_CLASS____TVSSMenuBarPanelSwapAnimationTransaction);
        v41 = -[_TVSSMenuBarPanelSwapAnimationTransaction initWithFromView:toView:focusHeading:]( v10,  "initWithFromView:toView:focusHeading:",  v42,  v43,  v69);
        id v11 = v41;
        v32 = _NSConcreteStackBlock;
        int v33 = -1073741824;
        int v34 = 0;
        v35 = sub_10007F96C;
        v36 = &unk_1001B8F28;
        BOOL v40 = v68;
        v37 = v71;
        id v38 = v65;
        id v39 = v67;
        -[_TVSSMenuBarPanelSwapAnimationTransaction registerBlockObserver:](v11, "registerBlockObserver:", &v32);
        -[_TVSSMenuBarPanelSwapAnimationTransaction begin](v41, "begin");
        objc_storeStrong(&v39, 0LL);
        objc_storeStrong(&v38, 0LL);
        objc_storeStrong((id *)&v37, 0LL);
        objc_storeStrong((id *)&v41, 0LL);
        objc_storeStrong(&v42, 0LL);
        objc_storeStrong((id *)&v43, 0LL);
      }

      else if (v67)
      {
        (*((void (**)(id, uint64_t))v67 + 2))(v67, 1LL);
      }

      -[TVSSMenuItemPanelHostingViewController _notifyPreviousViewController:nextViewController:]( v71,  "_notifyPreviousViewController:nextViewController:",  v66,  location[0]);
      objc_storeStrong(&v49, 0LL);
      objc_storeStrong(&v50, 0LL);
      objc_storeStrong(&v52, 0LL);
      objc_storeStrong(&v54, 0LL);
    }

    else if (v67)
    {
      (*((void (**)(id, uint64_t))v67 + 2))(v67, 1LL);
    }

    objc_storeStrong(&v56, 0LL);
    objc_storeStrong(&v65, 0LL);
    objc_storeStrong(&v64, 0LL);
    objc_storeStrong(&v66, 0LL);
  }

  objc_storeStrong(&v67, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)addOrthogonalNavigationFocusSinkView
{
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = objc_alloc_init(&OBJC_CLASS____TVSSFocusSinkView);
  id v2 = -[TVSSMenuItemPanelHostingViewController view](v14, "view");
  [v2 addSubview:v13[0]];

  [v13[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [v13[0] trailingAnchor];
  id v10 = -[TVSSMenuItemPanelHostingViewController view](v14, "view");
  id v9 = [v10 trailingAnchor];
  id v8 = objc_msgSend(v11, "constraintEqualToAnchor:constant:");
  v15[0] = v8;
  id v7 = [v13[0] topAnchor];
  id v6 = -[TVSSMenuItemPanelHostingViewController view](v14, "view");
  id v5 = [v6 topAnchor];
  id v4 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", 0.0);
  v15[1] = v4;
  v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  id v12 = -[TVSSMenuItemPanelHostingViewController view](v14, "view");
  [v12 sendSubviewToBack:v13[0]];

  objc_storeStrong((id *)&v14->_orthogonalNavigationFocusSinkView, v13[0]);
  objc_storeStrong(v13, 0LL);
}

- (void)setOrthogonalNavigationDelegate:(id)a3 availableEdges:(unint64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  hostedViewController = v8->_hostedViewController;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSPPlatterViewController);
  if ((objc_opt_isKindOfClass(hostedViewController, v4) & 1) != 0) {
    -[UIViewController setOrthogonalNavigationDelegate:availableEdges:]( v8->_hostedViewController,  "setOrthogonalNavigationDelegate:availableEdges:",  location[0],  a4);
  }
  objc_storeStrong(location, 0LL);
}

- (void)_notifyPreviousViewController:(id)a3 nextViewController:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  if ((objc_opt_respondsToSelector( location[0],  "hostingViewController:willTransitionFromViewController:toViewController:") & 1) != 0) {
    [location[0] hostingViewController:v7 willTransitionFromViewController:location[0] toViewController:v5];
  }
  if ((objc_opt_respondsToSelector(v5, "hostingViewController:willTransitionFromViewController:toViewController:") & 1) != 0) {
    [v5 hostingViewController:v7 willTransitionFromViewController:location[0] toViewController:v5];
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateHostedViewControllerWithPresentationContext:(id)a3 focusHeading:(unint64_t)a4 orthogonalNavigation:(BOOL)a5 completion:(id)a6
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v13 = a4;
  BOOL v12 = a5;
  id v11 = 0LL;
  objc_storeStrong(&v11, a6);
  id v9 = -[TVSSMenuItemPanelHostingViewController menuItem](v15, "menuItem");
  id v10 =  -[TVSSMenuItem createPlatterViewControllerWithPresentationContext:]( v9,  "createPlatterViewControllerWithPresentationContext:",  location[0]);

  -[TVSSMenuItemPanelHostingViewController setHostedViewController:focusHeading:orthogonalNavigation:completion:]( v15,  "setHostedViewController:focusHeading:orthogonalNavigation:completion:",  v10,  v13,  v12,  v11);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSMenuItem)menuItem
{
  return self->_menuItem;
}

- (UIViewController)hostedViewController
{
  return self->_hostedViewController;
}

- (UIView)orthogonalNavigationFocusSinkView
{
  return self->_orthogonalNavigationFocusSinkView;
}

- (void)setOrthogonalNavigationFocusSinkView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end