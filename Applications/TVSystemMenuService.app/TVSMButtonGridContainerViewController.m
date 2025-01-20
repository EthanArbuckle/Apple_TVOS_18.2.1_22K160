@interface TVSMButtonGridContainerViewController
- (BOOL)definesPresentationContext;
- (CGRect)selectedCellFrame;
- (CGRect)untransformedPlatterFrameInCoordinateSpace:(id)a3;
- (TVSMButtonGridCollectionViewController)collectionViewController;
- (TVSMButtonGridContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSMClockViewController)clockViewController;
- (UIView)effectView;
- (id)preferredFocusEnvironments;
- (void)initialAnimationDidFinish;
- (void)viewDidLoad;
@end

@implementation TVSMButtonGridContainerViewController

- (TVSMButtonGridContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  v4 = v16;
  v16 = 0LL;
  v13.receiver = v4;
  v13.super_class = (Class)&OBJC_CLASS___TVSMButtonGridContainerViewController;
  v12 = -[TVSMButtonGridContainerViewController initWithNibName:bundle:]( &v13,  "initWithNibName:bundle:",  location[0],  v14);
  v16 = v12;
  objc_storeStrong((id *)&v16, v12);
  if (v12)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVSMClockViewController);
    clockViewController = v16->_clockViewController;
    v16->_clockViewController = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TVSMButtonGridCollectionViewController);
    collectionViewController = v16->_collectionViewController;
    v16->_collectionViewController = v7;
  }

  v10 = v16;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v10;
}

- (void)initialAnimationDidFinish
{
}

- (void)viewDidLoad
{
  v48 = self;
  SEL v47 = a2;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVSMButtonGridContainerViewController;
  -[TVSMButtonGridContainerViewController viewDidLoad](&v46, "viewDidLoad");
  id v45 = -[TVSMButtonGridContainerViewController view](v48, "view");
  if (_AXSEnhanceBackgroundContrastEnabled())
  {
    v2 = objc_alloc_init(&OBJC_CLASS___UIView);
    effectView = v48->_effectView;
    v48->_effectView = v2;

    v40 = v48->_effectView;
    v41 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_100049768);
    -[UIView setBackgroundColor:](v40, "setBackgroundColor:");
  }

  else
  {
    v4 = (UIView *)objc_alloc_init(&OBJC_CLASS___TVSMPlatterView);
    v5 = v48->_effectView;
    v48->_effectView = v4;
  }

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v48->_effectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView _setContinuousCornerRadius:](v48->_effectView, "_setContinuousCornerRadius:", 60.0);
  [v45 addSubview:v48->_effectView];
  -[TVSMButtonGridContainerViewController bs_addChildViewController:]( v48,  "bs_addChildViewController:",  v48->_collectionViewController);
  -[TVSMButtonGridContainerViewController bs_addChildViewController:]( v48,  "bs_addChildViewController:",  v48->_clockViewController);
  id v44 = -[TVSMButtonGridCollectionViewController collectionView](v48->_collectionViewController, "collectionView");
  [v44 setContentInsetAdjustmentBehavior:2];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v43 = -[TVSMClockViewController view](v48->_clockViewController, "view");
  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = 0LL;
  v39 = -[UIView widthAnchor](v48->_effectView, "widthAnchor");
  v38 =  -[NSLayoutDimension constraintEqualToConstant:]( v39,  "constraintEqualToConstant:",  *(double *)&qword_1000566F0);
  v49[0] = v38;
  v37 = -[UIView trailingAnchor](v48->_effectView, "trailingAnchor");
  id v36 = [v45 trailingAnchor];
  id v35 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v37, "constraintEqualToAnchor:");
  v49[1] = v35;
  v34 = -[UIView topAnchor](v48->_effectView, "topAnchor");
  id v33 = [v45 topAnchor];
  id v32 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v34, "constraintEqualToAnchor:");
  v49[2] = v32;
  v31 = -[UIView bottomAnchor](v48->_effectView, "bottomAnchor");
  id v30 = [v45 bottomAnchor];
  id v29 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v31, "constraintEqualToAnchor:");
  v49[3] = v29;
  id v28 = [v43 leadingAnchor];
  v27 = -[UIView leadingAnchor](v48->_effectView, "leadingAnchor");
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v49[4] = v26;
  id v25 = [v43 trailingAnchor];
  v24 = -[UIView trailingAnchor](v48->_effectView, "trailingAnchor");
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", *(double *)&qword_1000566F8);
  v49[5] = v23;
  id v22 = [v43 firstBaselineAnchor];
  v21 = -[UIView topAnchor](v48->_effectView, "topAnchor");
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", *(double *)&qword_100056700);
  v49[6] = v20;
  id v19 = [v44 leadingAnchor];
  v18 = -[UIView leadingAnchor](v48->_effectView, "leadingAnchor");
  id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
  v49[7] = v17;
  id v16 = [v44 trailingAnchor];
  v15 = -[UIView trailingAnchor](v48->_effectView, "trailingAnchor");
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v49[8] = v14;
  id v13 = [v44 topAnchor];
  id v12 = [v43 lastBaselineAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", 16.0);
  v49[9] = v11;
  id v10 = [v44 bottomAnchor];
  v9 = -[UIView bottomAnchor](v48->_effectView, "bottomAnchor");
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v49[10] = v8;
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 11LL);
  v7 = v42;
  v42 = v6;

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v42);
  objc_storeStrong((id *)&v42, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  collectionViewController = self->_collectionViewController;
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &collectionViewController,  1LL);
}

- (CGRect)selectedCellFrame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)untransformedPlatterFrameInCoordinateSpace:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = -[TVSMButtonGridContainerViewController view](v27, "view");
  if (v16) {
    [v16 transform];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }

  id v15 = -[TVSMButtonGridContainerViewController view](v27, "view");
  -[UIView frame](v27->_effectView, "frame");
  double v20 = v3;
  double v21 = v4;
  double v22 = v5;
  double v23 = v6;
  objc_msgSend(v15, "convertRect:toCoordinateSpace:", location[0], v3, v4, v5, v6);
  v24.origin.double x = v7;
  v24.origin.double y = v8;
  v24.size.double width = v9;
  v24.size.double height = v10;

  memcpy(&__dst, __b, sizeof(__dst));
  if (CGAffineTransformIsIdentity(&__dst))
  {
    CGRect v28 = v24;
  }

  else
  {
    memcpy(&v17, __b, sizeof(v17));
    CGAffineTransformInvert(&v18, &v17);
    CGRect v28 = CGRectApplyAffineTransform(v24, &v18);
  }

  objc_storeStrong(location, 0LL);
  double y = v28.origin.y;
  double x = v28.origin.x;
  double height = v28.size.height;
  double width = v28.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (TVSMButtonGridCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (TVSMClockViewController)clockViewController
{
  return self->_clockViewController;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
}

@end