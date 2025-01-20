@interface PBSharePlayWaitViewController
- (NSString)deviceName;
- (PBSharePlayWaitViewController)initWithDeviceName:(id)a3 deviceModel:(int64_t)a4;
- (UILabel)label;
- (_UICAPackageView)confirmOnNearbyDevicePackageView;
- (int64_t)deviceModel;
- (void)menuPressed:(id)a3;
- (void)setConfirmOnNearbyDevicePackageView:(id)a3;
- (void)setDeviceModel:(int64_t)a3;
- (void)setDeviceName:(id)a3;
- (void)setLabel:(id)a3;
- (void)userNotificationWasCancelled;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBSharePlayWaitViewController

- (PBSharePlayWaitViewController)initWithDeviceName:(id)a3 deviceModel:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBSharePlayWaitViewController;
  v8 = -[PBSharePlayWaitViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceName, a3);
    v9->_deviceModel = a4;
    -[PBSharePlayWaitViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 8LL);
  }

  return v9;
}

- (void)viewDidLoad
{
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___PBSharePlayWaitViewController;
  -[PBSharePlayWaitViewController viewDidLoad](&v61, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS____UICAPackageView);
  v4 = objc_alloc(&OBJC_CLASS___NSDataAsset);
  if (self->_deviceModel == 2) {
    v5 = @"confirmOnNearbyDevicePad";
  }
  else {
    v5 = @"confirmOnNearbyDevicePhone";
  }
  v6 = -[NSDataAsset initWithName:](v4, "initWithName:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDataAsset data](v6, "data"));
  v8 = -[_UICAPackageView initWithData:publishedObjectViewClassMap:]( v3,  "initWithData:publishedObjectViewClassMap:",  v7,  0LL);
  confirmOnNearbyDevicePackageView = self->_confirmOnNearbyDevicePackageView;
  self->_confirmOnNearbyDevicePackageView = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView layer](self->_confirmOnNearbyDevicePackageView, "layer"));
  [v10 setFillMode:kCAFillModeBoth];

  objc_super v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  label = self->_label;
  self->_label = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v13 = self->_label;
  if (self->_deviceName)
  {
    id v14 = sub_1001C307C(@"SharePlayWaitViewControllerLabel", 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v15,  self->_deviceName));
    -[UILabel setText:](v13, "setText:", v16);
  }

  else
  {
    id v17 = sub_1001C307C(@"SharePlayWaitViewControllerUnknownDeviceLabel", 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[UILabel setText:](v13, "setText:", v15);
  }

  v18 = self->_label;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v18, "setTextColor:", v19);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1LL);
  v20 = self->_label;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  -[UILabel setFont:](v20, "setFont:", v21);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2LL);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  v22 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UIView addSubview:](v22, "addSubview:", self->_confirmOnNearbyDevicePackageView);
  -[UIView addSubview:](v22, "addSubview:", self->_label);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  [v23 addSubview:v22];

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v22, "centerXAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v60 centerXAnchor]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58]);
  v62[0] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v22, "centerYAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v56 centerYAnchor]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v53]);
  v62[1] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView heightAnchor](self->_confirmOnNearbyDevicePackageView, "heightAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToConstant:160.0]);
  v62[2] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView widthAnchor](self->_confirmOnNearbyDevicePackageView, "widthAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToConstant:160.0]);
  v62[3] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView centerXAnchor](self->_confirmOnNearbyDevicePackageView, "centerXAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v22, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v46]);
  v62[4] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView topAnchor](self->_confirmOnNearbyDevicePackageView, "topAnchor"));
  v54 = v22;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v22, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43 constant:96.0]);
  v62[5] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_label, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v22, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40]);
  v62[6] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_label, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v38 leadingAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36 constant:48.0]);
  v62[7] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 trailingAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v27 constant:-48.0]);
  v62[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_label, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView bottomAnchor](self->_confirmOnNearbyDevicePackageView, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30 constant:48.0]);
  v62[9] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 10LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v32);

  -[UILabel bounds](self->_label, "bounds");
  -[PBSharePlayWaitViewController setPreferredContentSize:](self, "setPreferredContentSize:", 756.0, v33 + 304.0);
  v34 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v34, "setAllowedPressTypes:", &off_1003FE8D8);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController view](self, "view"));
  [v35 addGestureRecognizer:v34];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSharePlayWaitViewController;
  -[PBSharePlayWaitViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView layer](self->_confirmOnNearbyDevicePackageView, "layer"));
  [v4 setBeginTime:1.79769313e308];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBSharePlayWaitViewController;
  -[PBSharePlayWaitViewController viewDidAppear:](&v8, "viewDidAppear:");
  double v5 = CACurrentMediaTime();
  if (v3) {
    double v6 = v5 + 1.0;
  }
  else {
    double v6 = v5;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UICAPackageView layer](self->_confirmOnNearbyDevicePackageView, "layer"));
  [v7 setBeginTime:v6];
}

- (void)menuPressed:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PBSharePlayWaitViewController navigationController](self, "navigationController", a3));
  double v5 = (void *)v4;
  if (v4) {
    double v6 = (PBSharePlayWaitViewController *)v4;
  }
  else {
    double v6 = self;
  }
  id v7 = v6;

  -[PBSharePlayWaitViewController dismissViewControllerAnimated:completion:]( v7,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (void)userNotificationWasCancelled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 neighborhoodActivityConduit]);
  [v3 cancelPendingJoinRequest];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (int64_t)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(int64_t)a3
{
  self->_deviceModel = a3;
}

- (_UICAPackageView)confirmOnNearbyDevicePackageView
{
  return self->_confirmOnNearbyDevicePackageView;
}

- (void)setConfirmOnNearbyDevicePackageView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end