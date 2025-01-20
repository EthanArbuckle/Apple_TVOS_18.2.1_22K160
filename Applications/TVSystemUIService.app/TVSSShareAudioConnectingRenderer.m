@interface TVSSShareAudioConnectingRenderer
+ (id)rendererWithIdentifier:(id)a3 title:(id)a4;
- (TVSSShareAudioConnectingRenderer)initWithIdentifier:(id)a3 title:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (UILayoutGuide)layoutGuide;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (void)configureContentView:(id)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setSpinnerView:(id)a3;
@end

@implementation TVSSShareAudioConnectingRenderer

+ (id)rendererWithIdentifier:(id)a3 title:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] title:v8];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (TVSSShareAudioConnectingRenderer)initWithIdentifier:(id)a3 title:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v7 = v13;
  id v8 = location[0];
  v9 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", v11);
  v13 = 0LL;
  v10.receiver = v7;
  v10.super_class = (Class)&OBJC_CLASS___TVSSShareAudioConnectingRenderer;
  v13 = -[TVSSShareAudioConnectingRenderer initWithIdentifier:format:content:overrideStylings:]( &v10,  "initWithIdentifier:format:content:overrideStylings:",  v8,  4LL);
  objc_storeStrong((id *)&v13, v13);

  v5 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v5;
}

- (void)configureContentView:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v26 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  -[TVSSShareAudioConnectingRenderer setLayoutGuide:](v28, "setLayoutGuide:", v26);
  [location[0] addLayoutGuide:v26];
  id v25 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:16];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  objc_msgSend(v25, "setColor:");

  objc_msgSend(v25, "_setCustomWidth:");
  [v25 startAnimating];
  -[TVSSShareAudioConnectingRenderer setSpinnerView:](v28, "setSpinnerView:", v25);
  [location[0] addSubview:v25];
  v23 = -[UILayoutGuide topAnchor](v26, "topAnchor");
  id v22 = [location[0] topAnchor];
  id v21 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v23, "constraintEqualToAnchor:");
  v29[0] = v21;
  v20 = -[UILayoutGuide bottomAnchor](v26, "bottomAnchor");
  id v19 = [location[0] bottomAnchor];
  id v18 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v20, "constraintEqualToAnchor:");
  v29[1] = v18;
  v17 = -[UILayoutGuide centerXAnchor](v26, "centerXAnchor");
  id v16 = [location[0] centerXAnchor];
  id v15 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v17, "constraintEqualToAnchor:");
  v29[2] = v15;
  id v14 = [v25 leadingAnchor];
  v13 = -[UILayoutGuide leadingAnchor](v26, "leadingAnchor");
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v29[3] = v12;
  id v11 = [v25 centerYAnchor];
  objc_super v10 = -[UILayoutGuide centerYAnchor](v26, "centerYAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v29[4] = v9;
  id v8 = [v25 widthAnchor];
  id v7 = [v8 constraintEqualToConstant:29.0];
  v29[5] = v7;
  id v6 = [v25 heightAnchor];
  id v5 = [v6 constraintEqualToConstant:29.0];
  v29[6] = v5;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 7LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  v24.receiver = v28;
  v24.super_class = (Class)&OBJC_CLASS___TVSSShareAudioConnectingRenderer;
  -[TVSSShareAudioConnectingRenderer configureContentView:](&v24, "configureContentView:", location[0]);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v3 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v5 = v3;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = [location[0] titleLabel];
  id v18 = [v19 leadingAnchor];
  v17 = -[TVSSShareAudioConnectingRenderer spinnerView](v22, "spinnerView");
  id v16 = -[UIActivityIndicatorView trailingAnchor](v17, "trailingAnchor");
  id v15 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", 8.0);
  v23[0] = v15;
  id v14 = [v19 trailingAnchor];
  v13 = -[TVSSShareAudioConnectingRenderer layoutGuide](v22, "layoutGuide");
  id v12 = -[UILayoutGuide trailingAnchor](v13, "trailingAnchor");
  id v11 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v23[1] = v11;
  id v10 = [v19 centerYAnchor];
  id v9 = -[TVSSShareAudioConnectingRenderer layoutGuide](v22, "layoutGuide");
  id v8 = -[UILayoutGuide centerYAnchor](v9, "centerYAnchor");
  id v6 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v23[2] = v6;
  id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL);

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end