@interface TVSSCameraMosaicView
- (BOOL)centered;
- (NSArray)cameraItems;
- (NSTimer)snapshotTimer;
- (TVHMCameraBadgeView)titleBadge;
- (TVHMCameraContentView)cameraViewFour;
- (TVHMCameraContentView)cameraViewOne;
- (TVHMCameraContentView)cameraViewThree;
- (TVHMCameraContentView)cameraViewTwo;
- (TVSSCameraMosaicView)initWithCameraItems:(id)a3;
- (UIView)horizontalSeparatorView;
- (UIView)verticalSeparatorView;
- (id)_createCameraViewForCameraItem:(id)a3;
- (void)_configureCameraViewFour;
- (void)_configureCameraViewOne;
- (void)_configureCameraViewThree;
- (void)_configureCameraViewTwo;
- (void)_configureCameraViews;
- (void)_configureHorizontalSeparatorWithFullWidth:(BOOL)a3;
- (void)_configureTitleBadge;
- (void)_configureVerticalSeparator;
- (void)_startSnapshotTimer;
- (void)_stopSnapshotTimer;
- (void)dealloc;
- (void)setCameraItems:(id)a3;
- (void)setCameraViewFour:(id)a3;
- (void)setCameraViewOne:(id)a3;
- (void)setCameraViewThree:(id)a3;
- (void)setCameraViewTwo:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setHorizontalSeparatorView:(id)a3;
- (void)setSnapshotTimer:(id)a3;
- (void)setTitleBadge:(id)a3;
- (void)setVerticalSeparatorView:(id)a3;
@end

@implementation TVSSCameraMosaicView

- (TVSSCameraMosaicView)initWithCameraItems:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v7.receiver = v3;
  v7.super_class = (Class)&OBJC_CLASS___TVSSCameraMosaicView;
  v6 = -[TVSSCameraMosaicView init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v9->_cameraItems, location[0]);
    -[TVSSCameraMosaicView _configureCameraViews](v9, "_configureCameraViews");
    -[TVSSCameraMosaicView _configureTitleBadge](v9, "_configureTitleBadge");
  }

  v5 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)setCentered:(BOOL)a3
{
  if (self->_centered != a3)
  {
    self->_centered = a3;
    if (a3) {
      -[TVSSCameraMosaicView _startSnapshotTimer](self, "_startSnapshotTimer");
    }
    else {
      -[TVSSCameraMosaicView _stopSnapshotTimer](self, "_stopSnapshotTimer");
    }
  }

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSCameraMosaicView _stopSnapshotTimer](self, "_stopSnapshotTimer");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSCameraMosaicView;
  -[TVSSCameraMosaicView dealloc](&v2, "dealloc");
}

- (void)_configureCameraViews
{
  objc_super v7 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
  BOOL v8 = (id)-[NSArray count](v7, "count") != (id)2;

  if (v8)
  {
    v5 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
    BOOL v6 = (id)-[NSArray count](v5, "count") != (id)3;

    if (v6)
    {
      -[TVSSCameraMosaicView _configureHorizontalSeparatorWithFullWidth:]( self,  "_configureHorizontalSeparatorWithFullWidth:",  1LL);
      -[TVSSCameraMosaicView _configureCameraViewOne](self, "_configureCameraViewOne");
      -[TVSSCameraMosaicView _configureCameraViewTwo](self, "_configureCameraViewTwo");
      -[TVSSCameraMosaicView _configureCameraViewThree](self, "_configureCameraViewThree");
      -[TVSSCameraMosaicView _configureCameraViewFour](self, "_configureCameraViewFour");
      SEL v3 = -[TVSSCameraMosaicView horizontalSeparatorView](self, "horizontalSeparatorView");
      -[TVSSCameraMosaicView bringSubviewToFront:](self, "bringSubviewToFront:");
    }

    else
    {
      -[TVSSCameraMosaicView _configureHorizontalSeparatorWithFullWidth:]( self,  "_configureHorizontalSeparatorWithFullWidth:",  0LL);
      -[TVSSCameraMosaicView _configureCameraViewOne](self, "_configureCameraViewOne");
      -[TVSSCameraMosaicView _configureCameraViewTwo](self, "_configureCameraViewTwo");
      -[TVSSCameraMosaicView _configureCameraViewThree](self, "_configureCameraViewThree");
      v4 = -[TVSSCameraMosaicView horizontalSeparatorView](self, "horizontalSeparatorView");
      -[TVSSCameraMosaicView bringSubviewToFront:](self, "bringSubviewToFront:");
    }
  }

  else
  {
    -[TVSSCameraMosaicView _configureCameraViewOne](self, "_configureCameraViewOne");
    -[TVSSCameraMosaicView _configureCameraViewTwo](self, "_configureCameraViewTwo");
  }

  objc_super v2 = -[TVSSCameraMosaicView verticalSeparatorView](self, "verticalSeparatorView");
  -[TVSSCameraMosaicView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (void)_configureTitleBadge
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = -[TVHMCameraBadgeView initWithBackgroundStyle:]( objc_alloc(&OBJC_CLASS___TVHMCameraBadgeView),  "initWithBackgroundStyle:",  2LL);
  [v13[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"web.camera");
  objc_msgSend(v13[0], "setLeadingImage:");

  [v13[0] setClipsToBounds:1];
  id v3 = TVSSLocString(@"TVSSHomeKitAllCamerasTitle");
  objc_msgSend(v13[0], "setBadgeText:");

  -[TVSSCameraMosaicView setTitleBadge:](v14, "setTitleBadge:", v13[0]);
  -[TVSSCameraMosaicView addSubview:](v14, "addSubview:", v13[0]);
  id v12 = [v13[0] widthAnchor];
  id v11 = [v12 constraintLessThanOrEqualToConstant:250.0];
  v15[0] = v11;
  id v10 = [v13[0] bottomAnchor];
  id v9 = -[TVSSCameraMosaicView bottomAnchor](v14, "bottomAnchor");
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", -16.0);
  v15[1] = v8;
  id v7 = [v13[0] leadingAnchor];
  id v6 = -[TVSSCameraMosaicView leadingAnchor](v14, "leadingAnchor");
  id v5 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", 16.0);
  v15[2] = v5;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(v13, 0LL);
}

- (void)_configureVerticalSeparator
{
  v19 = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init(&OBJC_CLASS___UIView);
  id v2 = +[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color");
  objc_msgSend(v18[0], "setBackgroundColor:");

  [v18[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVSSCameraMosaicView setVerticalSeparatorView:](v19, "setVerticalSeparatorView:", v18[0]);
  -[TVSSCameraMosaicView addSubview:](v19, "addSubview:", v18[0]);
  id v17 = [v18[0] heightAnchor];
  id v16 = -[TVSSCameraMosaicView heightAnchor](v19, "heightAnchor");
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v20[0] = v15;
  id v14 = [v18[0] widthAnchor];
  id v13 = [v14 constraintEqualToConstant:2.0];
  v20[1] = v13;
  id v12 = [v18[0] topAnchor];
  id v11 = -[TVSSCameraMosaicView topAnchor](v19, "topAnchor");
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v20[2] = v10;
  id v9 = [v18[0] bottomAnchor];
  id v8 = -[TVSSCameraMosaicView bottomAnchor](v19, "bottomAnchor");
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v20[3] = v7;
  id v6 = [v18[0] centerXAnchor];
  id v5 = -[TVSSCameraMosaicView centerXAnchor](v19, "centerXAnchor");
  id v4 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v20[4] = v4;
  id v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 5LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(v18, 0LL);
}

- (void)_configureHorizontalSeparatorWithFullWidth:(BOOL)a3
{
  v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  id location = objc_alloc_init(&OBJC_CLASS___UIView);
  id v7 = +[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color");
  objc_msgSend(location, "setBackgroundColor:");

  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVSSCameraMosaicView setHorizontalSeparatorView:](v27, "setHorizontalSeparatorView:", location);
  -[TVSSCameraMosaicView addSubview:](v27, "addSubview:", location);
  id v8 = [location widthAnchor];
  id v9 = -[TVSSCameraMosaicView widthAnchor](v27, "widthAnchor");
  double v3 = 1.0;
  if (!v25) {
    double v3 = 0.5;
  }
  id v10 = objc_msgSend(v8, "constraintEqualToAnchor:multiplier:", v3);
  v28[0] = v10;
  id v11 = [location heightAnchor];
  id v12 = [v11 constraintEqualToConstant:2.0];
  v28[1] = v12;
  id v13 = [location trailingAnchor];
  id v14 = -[TVSSCameraMosaicView trailingAnchor](v27, "trailingAnchor");
  id v15 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v28[2] = v15;
  id v16 = [location centerYAnchor];
  id v17 = -[TVSSCameraMosaicView centerYAnchor](v27, "centerYAnchor");
  id v18 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v28[3] = v18;
  id v19 = [location leadingAnchor];
  char v22 = 0;
  char v20 = 0;
  if (v25)
  {
    id v23 = -[TVSSCameraMosaicView leadingAnchor](v27, "leadingAnchor");
    char v22 = 1;
    id v6 = v23;
  }

  else
  {
    id v21 = -[TVSSCameraMosaicView centerXAnchor](v27, "centerXAnchor");
    char v20 = 1;
    id v6 = v21;
  }

  id v5 = [v19 constraintEqualToAnchor:v6];
  v28[4] = v5;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 5LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((v20 & 1) != 0) {
  if ((v22 & 1) != 0)
  }

  objc_storeStrong(&location, 0LL);
}

- (void)_configureCameraViewOne
{
  SEL v26 = self;
  v25[1] = (id)a2;
  id v9 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
  v25[0] = -[NSArray firstObject](v9, "firstObject");

  id location = -[TVSSCameraMosaicView _createCameraViewForCameraItem:](v26, "_createCameraViewForCameraItem:", v25[0]);
  -[TVSSCameraMosaicView setCameraViewOne:](v26, "setCameraViewOne:", location);
  -[TVSSCameraMosaicView addSubview:](v26, "addSubview:", location);
  id v10 = [location leadingAnchor];
  id v11 = -[TVSSCameraMosaicView leadingAnchor](v26, "leadingAnchor");
  id v12 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v27[0] = v12;
  id v13 = [location topAnchor];
  id v14 = -[TVSSCameraMosaicView topAnchor](v26, "topAnchor");
  id v15 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v27[1] = v15;
  id v16 = [location bottomAnchor];
  id v17 = -[TVSSCameraMosaicView cameraItems](v26, "cameraItems");
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  if (-[NSArray count](v17, "count") >= 4)
  {
    id v21 = -[TVSSCameraMosaicView horizontalSeparatorView](v26, "horizontalSeparatorView");
    char v20 = 1;
    id v19 = -[UIView topAnchor](v21, "topAnchor");
    char v18 = 1;
    id v8 = v19;
  }

  else
  {
    id v23 = (NSLayoutYAxisAnchor *)-[TVSSCameraMosaicView bottomAnchor](v26, "bottomAnchor");
    char v22 = 1;
    id v8 = v23;
  }

  id v7 = [v16 constraintEqualToAnchor:v8];
  v27[2] = v7;
  id v6 = [location trailingAnchor];
  id v5 = -[TVSSCameraMosaicView verticalSeparatorView](v26, "verticalSeparatorView");
  id v4 = -[UIView leadingAnchor](v5, "leadingAnchor");
  id v3 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v27[3] = v3;
  id v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((v18 & 1) != 0) {
  if ((v20 & 1) != 0)
  }

  if ((v22 & 1) != 0) {
  objc_storeStrong(&location, 0LL);
  }
  objc_storeStrong(v25, 0LL);
}

- (void)_configureCameraViewTwo
{
  SEL v26 = self;
  v25[1] = (id)a2;
  id v5 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
  v25[0] = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 1LL);

  id location = -[TVSSCameraMosaicView _createCameraViewForCameraItem:](v26, "_createCameraViewForCameraItem:", v25[0]);
  -[TVSSCameraMosaicView setCameraViewTwo:](v26, "setCameraViewTwo:", location);
  -[TVSSCameraMosaicView addSubview:](v26, "addSubview:", location);
  id v6 = [location trailingAnchor];
  id v7 = -[TVSSCameraMosaicView trailingAnchor](v26, "trailingAnchor");
  id v8 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v27[0] = v8;
  id v9 = [location topAnchor];
  id v10 = -[TVSSCameraMosaicView topAnchor](v26, "topAnchor");
  id v11 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v27[1] = v11;
  id v13 = [location leadingAnchor];
  id v12 = -[TVSSCameraMosaicView verticalSeparatorView](v26, "verticalSeparatorView");
  id v14 = -[UIView trailingAnchor](v12, "trailingAnchor");
  id v15 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v27[2] = v15;
  id v16 = [location bottomAnchor];
  id v17 = -[TVSSCameraMosaicView cameraItems](v26, "cameraItems");
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  if ((id)-[NSArray count](v17, "count") == (id)2)
  {
    id v23 = (NSLayoutYAxisAnchor *)-[TVSSCameraMosaicView bottomAnchor](v26, "bottomAnchor");
    char v22 = 1;
    id v4 = v23;
  }

  else
  {
    id v21 = -[TVSSCameraMosaicView horizontalSeparatorView](v26, "horizontalSeparatorView");
    char v20 = 1;
    id v19 = -[UIView topAnchor](v21, "topAnchor");
    char v18 = 1;
    id v4 = v19;
  }

  id v3 = [v16 constraintEqualToAnchor:v4];
  v27[3] = v3;
  id v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((v18 & 1) != 0) {
  if ((v20 & 1) != 0)
  }

  if ((v22 & 1) != 0) {
  objc_storeStrong(&location, 0LL);
  }
  objc_storeStrong(v25, 0LL);
}

- (void)_configureCameraViewThree
{
  v33 = self;
  v32[1] = (id)a2;
  id v16 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
  v32[0] = -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 2LL);

  id location = -[TVSSCameraMosaicView _createCameraViewForCameraItem:](v33, "_createCameraViewForCameraItem:", v32[0]);
  -[TVSSCameraMosaicView setCameraViewThree:](v33, "setCameraViewThree:", location);
  -[TVSSCameraMosaicView addSubview:](v33, "addSubview:", location);
  id v17 = [location leadingAnchor];
  char v18 = -[TVSSCameraMosaicView cameraItems](v33, "cameraItems");
  char v29 = 0;
  char v27 = 0;
  char v25 = 0;
  if ((id)-[NSArray count](v18, "count") == (id)3)
  {
    v30 = -[TVSSCameraMosaicView verticalSeparatorView](v33, "verticalSeparatorView");
    char v29 = 1;
    v28 = -[UIView trailingAnchor](v30, "trailingAnchor");
    char v27 = 1;
    id v15 = v28;
  }

  else
  {
    SEL v26 = (NSLayoutXAxisAnchor *)-[TVSSCameraMosaicView leadingAnchor](v33, "leadingAnchor");
    char v25 = 1;
    id v15 = v26;
  }

  id v12 = [v17 constraintEqualToAnchor:v15];
  v34[0] = v12;
  id v13 = [location trailingAnchor];
  id v14 = -[TVSSCameraMosaicView cameraItems](v33, "cameraItems");
  char v23 = 0;
  char v21 = 0;
  char v19 = 0;
  if ((id)-[NSArray count](v14, "count") == (id)3)
  {
    v24 = (NSLayoutXAxisAnchor *)-[TVSSCameraMosaicView trailingAnchor](v33, "trailingAnchor");
    char v23 = 1;
    id v11 = v24;
  }

  else
  {
    char v22 = -[TVSSCameraMosaicView verticalSeparatorView](v33, "verticalSeparatorView");
    char v21 = 1;
    char v20 = -[UIView leadingAnchor](v22, "leadingAnchor");
    char v19 = 1;
    id v11 = v20;
  }

  id v10 = [v13 constraintEqualToAnchor:v11];
  v34[1] = v10;
  id v9 = [location topAnchor];
  id v8 = -[TVSSCameraMosaicView horizontalSeparatorView](v33, "horizontalSeparatorView");
  id v7 = -[UIView bottomAnchor](v8, "bottomAnchor");
  id v6 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v34[2] = v6;
  id v5 = [location bottomAnchor];
  id v4 = -[TVSSCameraMosaicView bottomAnchor](v33, "bottomAnchor");
  id v3 = objc_msgSend(v5, "constraintEqualToAnchor:");
  v34[3] = v3;
  id v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  if ((v19 & 1) != 0) {
  if ((v21 & 1) != 0)
  }

  if ((v23 & 1) != 0) {
  if ((v25 & 1) != 0)
  }

  if ((v27 & 1) != 0) {
  if ((v29 & 1) != 0)
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v32, 0LL);
}

- (void)_configureCameraViewFour
{
  char v20 = self;
  v19[1] = (id)a2;
  id v2 = -[TVSSCameraMosaicView cameraItems](self, "cameraItems");
  v19[0] = -[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 3LL);

  id v18 = -[TVSSCameraMosaicView _createCameraViewForCameraItem:](v20, "_createCameraViewForCameraItem:", v19[0]);
  -[TVSSCameraMosaicView setCameraViewFour:](v20, "setCameraViewFour:", v18);
  -[TVSSCameraMosaicView addSubview:](v20, "addSubview:", v18);
  id v17 = [v18 leadingAnchor];
  id v16 = -[TVSSCameraMosaicView verticalSeparatorView](v20, "verticalSeparatorView");
  id v15 = -[UIView trailingAnchor](v16, "trailingAnchor");
  id v14 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v21[0] = v14;
  id v13 = [v18 trailingAnchor];
  id v12 = -[TVSSCameraMosaicView trailingAnchor](v20, "trailingAnchor");
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v21[1] = v11;
  id v10 = [v18 topAnchor];
  id v9 = -[TVSSCameraMosaicView horizontalSeparatorView](v20, "horizontalSeparatorView");
  id v8 = -[UIView bottomAnchor](v9, "bottomAnchor");
  id v7 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v21[2] = v7;
  id v6 = [v18 bottomAnchor];
  id v5 = -[TVSSCameraMosaicView bottomAnchor](v20, "bottomAnchor");
  id v4 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v21[3] = v4;
  id v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(v19, 0LL);
}

- (id)_createCameraViewForCameraItem:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = [location[0] profile];
  id v9 = objc_alloc_init(&OBJC_CLASS___TVHMCameraContentView);
  -[TVHMCameraContentView setTranslatesAutoresizingMaskIntoConstraints:]( v9,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVHMCameraContentView setClipsToBounds:](v9, "setClipsToBounds:", 1LL);
  -[TVHMCameraContentView setCameraContentMode:](v9, "setCameraContentMode:", 2LL);
  -[TVHMCameraContentView setCameraProfile:](v9, "setCameraProfile:", v10);
  id v5 = [location[0] homeKitObject];
  id v4 = [v5 uniqueIdentifier];
  -[TVHMCameraContentView setHfIdentifier:](v9, "setHfIdentifier:");

  -[TVHMCameraContentView setSize:](v9, "setSize:", 1LL);
  id v6 = v9;
  id v7 = +[TVHMCameraContentViewStyle thumbnailStyle](&OBJC_CLASS___TVHMCameraContentViewStyle, "thumbnailStyle");
  -[TVHMCameraContentView applyStyle:](v6, "applyStyle:");

  id v8 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)_startSnapshotTimer
{
  id v10 = self;
  location[1] = (id)a2;
  -[TVSSCameraMosaicView _stopSnapshotTimer](self, "_stopSnapshotTimer");
  objc_initWeak(location, v10);
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10001F3B4;
  id v7 = &unk_1001B5AB0;
  objc_copyWeak(&v8, location);
  id v2 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v3,  10.0);
  -[TVSSCameraMosaicView setSnapshotTimer:](v10, "setSnapshotTimer:");

  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

- (void)_stopSnapshotTimer
{
  id v2 = -[TVSSCameraMosaicView snapshotTimer](self, "snapshotTimer");
  -[NSTimer invalidate](v2, "invalidate");

  -[TVSSCameraMosaicView setSnapshotTimer:](self, "setSnapshotTimer:", 0LL);
}

- (BOOL)centered
{
  return self->_centered;
}

- (NSArray)cameraItems
{
  return self->_cameraItems;
}

- (void)setCameraItems:(id)a3
{
}

- (UIView)verticalSeparatorView
{
  return self->_verticalSeparatorView;
}

- (void)setVerticalSeparatorView:(id)a3
{
}

- (UIView)horizontalSeparatorView
{
  return self->_horizontalSeparatorView;
}

- (void)setHorizontalSeparatorView:(id)a3
{
}

- (TVHMCameraContentView)cameraViewOne
{
  return self->_cameraViewOne;
}

- (void)setCameraViewOne:(id)a3
{
}

- (TVHMCameraContentView)cameraViewTwo
{
  return self->_cameraViewTwo;
}

- (void)setCameraViewTwo:(id)a3
{
}

- (TVHMCameraContentView)cameraViewThree
{
  return self->_cameraViewThree;
}

- (void)setCameraViewThree:(id)a3
{
}

- (TVHMCameraContentView)cameraViewFour
{
  return self->_cameraViewFour;
}

- (void)setCameraViewFour:(id)a3
{
}

- (TVHMCameraBadgeView)titleBadge
{
  return self->_titleBadge;
}

- (void)setTitleBadge:(id)a3
{
}

- (NSTimer)snapshotTimer
{
  return self->_snapshotTimer;
}

- (void)setSnapshotTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end