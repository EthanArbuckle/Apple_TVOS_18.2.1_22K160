@interface TVSSVideoPreviewRenderer
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (TVSSManualFramingView)framingView;
- (TVSSVideoPreviewRenderer)initWithIdentifier:(id)a3 framingView:(id)a4;
- (void)configureContentView:(id)a3;
- (void)setFramingView:(id)a3;
@end

@implementation TVSSVideoPreviewRenderer

- (TVSSVideoPreviewRenderer)initWithIdentifier:(id)a3 framingView:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = -[TVSPContent initWithTitle:](objc_alloc(&OBJC_CLASS___TVSPContent), "initWithTitle:", &stru_1001BDAC8);
  v7 = v18;
  id v8 = location[0];
  id v12 = +[TVSPViewAttribute clipsToBounds:](&OBJC_CLASS___TVSPViewAttribute, "clipsToBounds:", 0LL);
  id v19 = v12;
  v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19);
  v10 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  @"TVSSManualFramingViewDefaultIdentifier");
  v20 = v10;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL);
  v18 = 0LL;
  v14.receiver = v7;
  v14.super_class = (Class)&OBJC_CLASS___TVSSVideoPreviewRenderer;
  v13 = -[TVSSVideoPreviewRenderer initWithIdentifier:format:content:overrideStylings:]( &v14,  "initWithIdentifier:format:content:overrideStylings:",  v8,  0LL,  v15);
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);

  if (v13) {
    objc_storeStrong((id *)&v18->_framingView, v16);
  }
  v5 = v18;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v5;
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (void)configureContentView:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)&OBJC_CLASS___TVSSVideoPreviewRenderer;
  -[TVSSVideoPreviewRenderer configureContentView:](&v18, "configureContentView:", location[0]);
  -[TVSSManualFramingView setTranslatesAutoresizingMaskIntoConstraints:]( v20->_framingView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v20->_framingView];
  framingView = v20->_framingView;
  v4 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  -[TVSSManualFramingView setBackgroundColor:](framingView, "setBackgroundColor:");

  id v17 = -[TVSSManualFramingView leadingAnchor](v20->_framingView, "leadingAnchor");
  id v16 = [location[0] leadingAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:");
  v21[0] = v15;
  id v14 = -[TVSSManualFramingView trailingAnchor](v20->_framingView, "trailingAnchor");
  id v13 = [location[0] trailingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 24.0);
  v21[1] = v12;
  id v11 = -[TVSSManualFramingView topAnchor](v20->_framingView, "topAnchor");
  id v10 = [location[0] topAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -24.0);
  v21[2] = v9;
  id v8 = -[TVSSManualFramingView bottomAnchor](v20->_framingView, "bottomAnchor");
  id v7 = [location[0] bottomAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v21[3] = v6;
  v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(location, 0LL);
}

- (BOOL)isFocusable
{
  return 0;
}

- (TVSSManualFramingView)framingView
{
  return self->_framingView;
}

- (void)setFramingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end