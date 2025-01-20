@interface TVSSProfileAddButtonRenderer
+ (id)monogramViewConfigurationForDiameter:(double)a3;
+ (id)rendererWithIdentifier:(id)a3 content:(id)a4;
- (BOOL)wantsFloatingContentView;
- (TVSSProfileAddButtonRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6;
- (TVSUIProfilePictureMonogramView)profilePictureView;
- (void)configureContentView:(id)a3;
@end

@implementation TVSSProfileAddButtonRenderer

+ (id)rendererWithIdentifier:(id)a3 content:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] format:0 content:v8 overrideStylings:&__NSArray0__struct];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (TVSSProfileAddButtonRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v14[1] = (id)a4;
  v14[0] = 0LL;
  objc_storeStrong(v14, a5);
  id v13 = 0LL;
  objc_storeStrong(&v13, a6);
  v6 = v16;
  v16 = 0LL;
  v12.receiver = v6;
  v12.super_class = (Class)&OBJC_CLASS___TVSSProfileAddButtonRenderer;
  v16 = -[TVSSProfileAddButtonRenderer initWithIdentifier:format:content:overrideStylings:]( &v12,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  0LL,  v14[0],  v13);
  objc_storeStrong((id *)&v16, v16);
  v11 = v16;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v11;
}

- (void)configureContentView:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v23.receiver = v25;
  v23.super_class = (Class)&OBJC_CLASS___TVSSProfileAddButtonRenderer;
  -[TVSSProfileAddButtonRenderer configureContentView:](&v23, "configureContentView:", location[0]);
  [location[0] setClipsToBounds:0];
  id v22 = [(id)objc_opt_class(v25) monogramViewConfigurationForDiameter:133.0];
  v3 = objc_alloc(&OBJC_CLASS___TVSUIProfilePictureMonogramView);
  id v4 = -[TVSUIProfilePictureMonogramView initWithConfiguration:](v3, "initWithConfiguration:", v22);
  profilePictureView = v25->_profilePictureView;
  v25->_profilePictureView = v4;

  -[TVSUIProfilePictureMonogramView setTranslatesAutoresizingMaskIntoConstraints:]( v25->_profilePictureView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v6 = v25->_profilePictureView;
  id v8 = -[TVSSProfileAddButtonRenderer content](v25, "content");
  id v7 = [v8 contentTitle];
  -[TVSUIProfilePictureMonogramView setDisplayName:](v6, "setDisplayName:");

  [location[0] addSubview:v25->_profilePictureView];
  id v21 = -[TVSUIProfilePictureMonogramView topAnchor](v25->_profilePictureView, "topAnchor");
  id v20 = [location[0] topAnchor];
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v26[0] = v19;
  id v18 = -[TVSUIProfilePictureMonogramView leadingAnchor](v25->_profilePictureView, "leadingAnchor");
  id v17 = [location[0] leadingAnchor];
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v26[1] = v16;
  id v15 = -[TVSUIProfilePictureMonogramView trailingAnchor](v25->_profilePictureView, "trailingAnchor");
  id v14 = [location[0] trailingAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v26[2] = v13;
  id v12 = -[TVSUIProfilePictureMonogramView bottomAnchor](v25->_profilePictureView, "bottomAnchor");
  id v11 = [location[0] bottomAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v26[3] = v10;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

+ (id)monogramViewConfigurationForDiameter:(double)a3
{
  id v12 = a1;
  SEL v11 = a2;
  double v10 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___TVSUIProfilePictureMonogramViewAddUserButtonConfiguration);
  [v9 setMonogramDiameter:v10];
  [v9 setFocusSizeIncrease:20.0];
  id v4 = v9;
  id v5 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 6LL);
  objc_msgSend(v4, "setDisplayNameFont:");

  id v6 = v9;
  id v7 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001BB588);
  objc_msgSend(v6, "setDisplayNameTextColor:");

  [v9 setDisplayNameOffset:37.0];
  id v8 = v9;
  objc_storeStrong(&v9, 0LL);
  return v8;
}

- (TVSUIProfilePictureMonogramView)profilePictureView
{
  return self->_profilePictureView;
}

- (void).cxx_destruct
{
}

@end