@interface TVSSCameraFramingButton
+ (id)configurationForUserInterfaceStyle:(int64_t)a3 controlState:(unint64_t)a4;
- (TVSSCameraFramingButton)initWithFrame:(CGRect)a3;
- (UIImageView)symbolImageView;
- (UILabel)titleLabel;
- (id)foregroundViews;
- (void)customizeAppearanceForControlState:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation TVSSCameraFramingButton

- (TVSSCameraFramingButton)initWithFrame:(CGRect)a3
{
  CGRect v30 = a3;
  SEL v28 = a2;
  v29 = 0LL;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVSSCameraFramingButton;
  v23 = -[TVSSCameraFramingButton initWithFrame:]( &v27,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v29 = v23;
  objc_storeStrong((id *)&v29, v23);
  if (v23)
  {
    id v26 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 7LL);
    [v26 pointSize];
    id v25 =  +[UIFont tvss_cameraFontWithWeight:pointSize:]( &OBJC_CLASS___UIFont,  "tvss_cameraFontWithWeight:pointSize:",  UIFontWeightRegular,  v3);
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v29->_titleLabel;
    v29->_titleLabel = v4;

    v8 = v29->_titleLabel;
    id v9 = TVSSLagunaLocalizedString(@"TVSSOneShotFramingAuto");
    -[UILabel setText:](v8, "setText:");

    -[UILabel setFont:](v29->_titleLabel, "setFont:", v25);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v29->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v29->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v24 = -[TVSSCameraFramingButton contentContainerView](v29, "contentContainerView");
    [v24 addSubview:v29->_titleLabel];
    id v22 = -[UILabel leadingAnchor](v29->_titleLabel, "leadingAnchor");
    id v21 = [v24 leadingAnchor];
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", 9.0);
    v31[0] = v20;
    id v19 = -[UILabel trailingAnchor](v29->_titleLabel, "trailingAnchor");
    id v18 = [v24 trailingAnchor];
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", -9.0);
    v31[1] = v17;
    id v16 = -[UILabel topAnchor](v29->_titleLabel, "topAnchor");
    id v15 = [v24 topAnchor];
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", 7.0);
    v31[2] = v14;
    id v13 = -[UILabel bottomAnchor](v29->_titleLabel, "bottomAnchor");
    id v12 = [v24 bottomAnchor];
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", -7.0);
    v31[3] = v11;
    v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSCameraFramingButton _setCornerRadius:](v29, "_setCornerRadius:", 10.0);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
  }

  v7 = v29;
  objc_storeStrong((id *)&v29, 0LL);
  return v7;
}

- (id)foregroundViews
{
  titleLabel = self->_titleLabel;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &titleLabel, 1LL);
}

+ (id)configurationForUserInterfaceStyle:(int64_t)a3 controlState:(unint64_t)a4
{
  id v19 = a1;
  SEL v18 = a2;
  int64_t v17 = a3;
  unint64_t v16 = a4;
  if ((a4 & 4) != 0)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___TVSPBaseFloatingContentControlConfiguration);
    id v9 = v15;
    id v10 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
    objc_msgSend(v9, "setBackgroundColor:");

    id v11 = v15;
    id v13 = +[UIColor systemGray6Color](&OBJC_CLASS___UIColor, "systemGray6Color");
    id v12 = objc_msgSend(v13, "tvsp_darkStyleColor");
    objc_msgSend(v11, "setForegroundColor:");

    id v20 = v15;
    objc_storeStrong(&v15, 0LL);
  }

  else if ((v16 & 8) != 0)
  {
    id v20 =  +[TVSPBaseFloatingContentControlConfiguration focusedConfiguration]( &OBJC_CLASS___TVSPBaseFloatingContentControlConfiguration,  "focusedConfiguration");
  }

  else
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___TVSPBaseFloatingContentControlConfiguration);
    id v5 = v14;
    v6 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL);
    objc_msgSend(v5, "setBackgroundVisualEffect:");

    [v14 setCaptureGroup:@"TVSSCameraButtonGroup"];
    id v7 = v14;
    id v8 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
    objc_msgSend(v7, "setForegroundColor:");

    id v20 = v14;
    objc_storeStrong(&v14, 0LL);
  }

  return v20;
}

- (void)customizeAppearanceForControlState:(unint64_t)a3 animated:(BOOL)a4
{
  id v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  BOOL v10 = a4;
  id location = -[TVSSCameraFramingButton contentContainerView](self, "contentContainerView");
  if (v11)
  {
    id v4 = [location layer];
    [v4 setBorderWidth:0.0];

    id v5 = [location layer];
    [v5 setBorderColor:0];
  }

  else
  {
    id v6 = [location layer];
    objc_msgSend(v6, "setBorderWidth:");

    id v8 = [location layer];
    id v7 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.45);
    objc_msgSend(v8, "setBorderColor:", -[UIColor CGColor](v7, "CGColor"));
  }

  objc_storeStrong(&location, 0LL);
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end