@interface TVSSPrivacyStateAdapterView
- (TVSSPrivacyState)privacyState;
- (TVSSPrivacyStateAdapterView)initWithDisplayLocation:(int64_t)a3;
- (TVSSPrivacyView)privacyView;
- (int64_t)displayLocation;
- (void)_updateLocationIndicatorView;
- (void)_updatePrivacyStackView;
- (void)_updateRecordingIndicatorView;
- (void)dealloc;
- (void)setPrivacyState:(id)a3;
- (void)setPrivacyView:(id)a3;
@end

@implementation TVSSPrivacyStateAdapterView

- (TVSSPrivacyStateAdapterView)initWithDisplayLocation:(int64_t)a3
{
  SEL v23 = a2;
  int64_t v22 = a3;
  v24 = 0LL;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVSSPrivacyStateAdapterView;
  v24 = -[TVSSPrivacyStateAdapterView initWithFrame:]( &v21,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong((id *)&v24, v24);
  if (v24)
  {
    v24->_displayLocation = v22;
    v3 = objc_alloc_init(&OBJC_CLASS___TVSSPrivacyView);
    privacyView = v24->_privacyView;
    v24->_privacyView = v3;

    -[TVSSPrivacyView setTranslatesAutoresizingMaskIntoConstraints:]( v24->_privacyView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSPrivacyView setAxis:](v24->_privacyView, "setAxis:", v22 == 0);
    -[TVSSPrivacyStateAdapterView addSubview:](v24, "addSubview:", v24->_privacyView);
    id v19 = -[TVSSPrivacyView leadingAnchor](v24->_privacyView, "leadingAnchor");
    id v18 = -[TVSSPrivacyStateAdapterView leadingAnchor](v24, "leadingAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v25[0] = v17;
    id v16 = -[TVSSPrivacyView trailingAnchor](v24->_privacyView, "trailingAnchor");
    id v15 = -[TVSSPrivacyStateAdapterView trailingAnchor](v24, "trailingAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v25[1] = v14;
    id v13 = -[TVSSPrivacyView topAnchor](v24->_privacyView, "topAnchor");
    id v12 = -[TVSSPrivacyStateAdapterView topAnchor](v24, "topAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v25[2] = v11;
    id v10 = -[TVSSPrivacyView bottomAnchor](v24->_privacyView, "bottomAnchor");
    id v9 = -[TVSSPrivacyStateAdapterView bottomAnchor](v24, "bottomAnchor");
    id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v25[3] = v8;
    v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v20 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v20,  "addObserver:selector:name:object:",  v24,  "_updateRecordingIndicatorView",  UIAccessibilityShouldDifferentiateWithoutColorDidChangeNotification,  0LL);

    -[TVSSPrivacyStateAdapterView _updatePrivacyStackView](v24, "_updatePrivacyStackView");
  }

  v6 = v24;
  objc_storeStrong((id *)&v24, 0LL);
  return v6;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v5,  UIAccessibilityShouldDifferentiateWithoutColorDidChangeNotification,  0LL);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSPrivacyStateAdapterView;
  -[TVSSPrivacyStateAdapterView dealloc](&v3, "dealloc");
}

- (void)setPrivacyState:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualObjects(v4->_privacyState, location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_privacyState, location[0]);
    -[TVSSPrivacyStateAdapterView _updatePrivacyStackView](v4, "_updatePrivacyStackView");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updatePrivacyStackView
{
}

- (void)_updateRecordingIndicatorView
{
  id v11 = self;
  v10[1] = (id)a2;
  v7 = -[TVSSPrivacyStateAdapterView privacyView](self, "privacyView");
  v10[0] = -[TVSSPrivacyView recordingIndicatorView](v7, "recordingIndicatorView");

  id v8 = -[TVSSPrivacyStateAdapterView privacyState](v11, "privacyState");
  id location = -[TVSSPrivacyState recordingIndicator](v8, "recordingIndicator");

  if (location
    && (id v6 = [location displayLocation],
        v6 == (id)-[TVSSPrivacyStateAdapterView displayLocation](v11, "displayLocation")))
  {
    [v10[0] setHidden:0];
    SEL v4 = -[TVSSPrivacyStateAdapterView privacyState](v11, "privacyState");
    int64_t v5 = -[TVSSPrivacyState mode](v4, "mode");

    if ((TVSSMenuBarHasBackgroundForMode(v5) & 1) != 0 && [location displayLocation] == (id)1) {
      [v10[0] setDisplayLocation:1];
    }
    else {
      [v10[0] setDisplayLocation:0];
    }
    objc_msgSend(v10[0], "setMenuMode:", -[TVSSPrivacyState mode](v11->_privacyState, "mode"));
    if ([location recordingType] == (id)1)
    {
      id v3 = +[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor");
      objc_msgSend(v10[0], "setIndicatorColor:");

      [v10[0] setIndicatorShape:0];
    }

    else
    {
      id v2 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
      objc_msgSend(v10[0], "setIndicatorColor:");

      [v10[0] setIndicatorShape:(UIAccessibilityShouldDifferentiateWithoutColor() & 1) != 0];
    }
  }

  else
  {
    [v10[0] setHidden:1];
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v10, 0LL);
}

- (void)_updateLocationIndicatorView
{
  v7 = self;
  v6[1] = (id)a2;
  id v3 = -[TVSSPrivacyStateAdapterView privacyView](self, "privacyView");
  v6[0] = -[TVSSPrivacyView locationIndicatorView](v3, "locationIndicatorView");

  SEL v4 = -[TVSSPrivacyStateAdapterView privacyState](v7, "privacyState");
  id location = -[TVSSPrivacyState locationIndicator](v4, "locationIndicator");

  if (location
    && (id v2 = [location displayLocation],
        v2 == (id)-[TVSSPrivacyStateAdapterView displayLocation](v7, "displayLocation")))
  {
    [v6[0] setHidden:0];
  }

  else
  {
    [v6[0] setHidden:1];
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v6, 0LL);
}

- (int64_t)displayLocation
{
  return self->_displayLocation;
}

- (TVSSPrivacyState)privacyState
{
  return self->_privacyState;
}

- (TVSSPrivacyView)privacyView
{
  return self->_privacyView;
}

- (void)setPrivacyView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end