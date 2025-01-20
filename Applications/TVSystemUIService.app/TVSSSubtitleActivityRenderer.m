@interface TVSSSubtitleActivityRenderer
+ (id)rendererWithIdentifier:(id)a3 subtitle:(id)a4;
- (TVSSSubtitleActivityRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (void)applyStylingsWithAnimator:(id)a3;
- (void)configureContentView:(id)a3;
@end

@implementation TVSSSubtitleActivityRenderer

+ (id)rendererWithIdentifier:(id)a3 subtitle:(id)a4
{
  Class v12 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v7 = objc_alloc(v12);
  id v6 = location[0];
  v8 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", v10);
  id v9 = objc_msgSend(v7, "initWithIdentifier:format:content:overrideStylings:", v6, 3);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (TVSSSubtitleActivityRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v17 = a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = 0LL;
  objc_storeStrong(&v15, a6);
  id v6 = v19;
  v19 = 0LL;
  v14.receiver = v6;
  v14.super_class = (Class)&OBJC_CLASS___TVSSSubtitleActivityRenderer;
  v19 = -[TVSSSubtitleActivityRenderer initWithIdentifier:format:content:overrideStylings:]( &v14,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  v17,  v16,  v15);
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    id v7 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:16];
    activityIndicatorView = v19->_activityIndicatorView;
    v19->_activityIndicatorView = v7;

    -[UIActivityIndicatorView _setCustomWidth:](v19->_activityIndicatorView, "_setCustomWidth:", 29.0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v19->_activityIndicatorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  }

  id v10 = v19;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  return v10;
}

- (void)configureContentView:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v19.receiver = v21;
  v19.super_class = (Class)&OBJC_CLASS___TVSSSubtitleActivityRenderer;
  -[TVSSSubtitleActivityRenderer configureContentView:](&v19, "configureContentView:", location[0]);
  [location[0] addSubview:v21->_activityIndicatorView];
  -[UIActivityIndicatorView startAnimating](v21->_activityIndicatorView, "startAnimating");
  v18 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001B95E0);
  -[UIActivityIndicatorView setColor:](v21->_activityIndicatorView, "setColor:", v18);
  +[TVSPConstants defaultSpacerWidth](&OBJC_CLASS___TVSPConstants, "defaultSpacerWidth");
  double v17 = v3;
  id v4 = -[TVSSSubtitleActivityRenderer subviews](v21, "subviews");
  id v16 = [v4 titleLabel];

  id v14 = -[UIActivityIndicatorView leadingAnchor](v21->_activityIndicatorView, "leadingAnchor");
  id v13 = [v16 trailingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v17);
  v22[0] = v12;
  id v11 = -[UIActivityIndicatorView centerYAnchor](v21->_activityIndicatorView, "centerYAnchor");
  id v10 = [location[0] centerYAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v22[1] = v9;
  id v8 = -[UIActivityIndicatorView heightAnchor](v21->_activityIndicatorView, "heightAnchor");
  id v7 = objc_msgSend(v8, "constraintEqualToConstant:");
  v22[2] = v7;
  id v6 = -[UIActivityIndicatorView widthAnchor](v21->_activityIndicatorView, "widthAnchor");
  id v5 = [v6 constraintEqualToConstant:20.0];
  v22[3] = v5;
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyStylingsWithAnimator:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVSSSubtitleActivityRenderer;
  -[TVSSSubtitleActivityRenderer applyStylingsWithAnimator:](&v7, "applyStylingsWithAnimator:", location[0]);
  if (-[TVSSSubtitleActivityRenderer effectiveUserInterfaceStyle](v9, "effectiveUserInterfaceStyle") == (id)2)
  {
    activityIndicatorView = v9->_activityIndicatorView;
    id v6 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    -[UIActivityIndicatorView setColor:](activityIndicatorView, "setColor:");
  }

  else
  {
    double v3 = v9->_activityIndicatorView;
    id v4 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    -[UIActivityIndicatorView setColor:](v3, "setColor:");
  }

  objc_storeStrong(location, 0LL);
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = [location[0] titleLabel];
  id v14 = [v17 leadingAnchor];
  id v13 = [v18 leadingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v20[0] = v12;
  id v11 = [v17 topAnchor];
  id v10 = [v18 topAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v20[1] = v9;
  id v8 = [v17 bottomAnchor];
  id v7 = [v18 bottomAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v20[2] = v6;
  id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL);

  id v15 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

- (void).cxx_destruct
{
}

@end