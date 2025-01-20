@interface TVSSCameraZoomButton
+ (id)_textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4 isSelected:(BOOL)a5;
+ (id)_zoomFactorFormatter;
+ (id)configurationForUserInterfaceStyle:(int64_t)a3 controlState:(unint64_t)a4;
- (NSString)text;
- (TVSSCameraZoomButton)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (id)foregroundViews;
- (void)customizeAppearanceForControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setText:(id)a3;
- (void)setZoomFactor:(double)a3 forManualFraming:(BOOL)a4;
@end

@implementation TVSSCameraZoomButton

- (void)setZoomFactor:(double)a3 forManualFraming:(BOOL)a4
{
  v11 = self;
  SEL v10 = a2;
  double v9 = a3;
  BOOL v8 = a4;
  char v7 = -[TVSSCameraZoomButton isSelected](self, "isSelected") & 1;
  v4 = (void *)objc_opt_class(v11);
  BOOL v5 = 1;
  if ((v7 & 1) == 0) {
    BOOL v5 = !v8;
  }
  id v6 = [v4 _textForZoomFactor:v5 showZoomFactorSymbol:v7 & 1 isSelected:v9];
  -[TVSSCameraZoomButton setText:](v11, "setText:", v6);
  objc_storeStrong(&v6, 0LL);
}

+ (id)_textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4 isSelected:(BOOL)a5
{
  id v24 = a1;
  SEL v23 = a2;
  double v22 = a3;
  BOOL v21 = a4;
  BOOL v20 = a5;
  id v19 = [(id)objc_opt_class(a1) _zoomFactorFormatter];
  id v10 = [v19 decimalSeparator];
  unsigned __int8 v11 = [v10 isEqualToString:@","];

  char v18 = v11 & 1;
  char v12 = 1;
  if (!v20) {
    char v12 = v18;
  }
  char v17 = v12;
  [v19 setMinimumIntegerDigits:(v12 & 1) != 0];
  double v9 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22);
  id v16 = objc_msgSend(v19, "stringFromNumber:");

  id location = 0LL;
  if (v21)
  {
    id v14 = TVSSLagunaLocalizedString(@"TVSSCameraZoomFactorSymbol");
    id v13 = TVSSLagunaLocalizedString(@"TVSSCameraZoomFactorFormat");
    BOOL v5 =  +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v13,  @"%@%@",  v16,  v14);
    id v6 = location;
    id location = v5;

    objc_storeStrong(&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    objc_storeStrong(&location, v16);
  }

  id v8 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v19, 0LL);
  return v8;
}

+ (id)_zoomFactorFormatter
{
  v4 = (dispatch_once_t *)&unk_100221C28;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7598);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221C20;
}

- (TVSSCameraZoomButton)initWithFrame:(CGRect)a3
{
  CGRect v38 = a3;
  SEL v36 = a2;
  v37 = 0LL;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomButton;
  v26 = -[TVSSCameraZoomButton initWithFrame:]( &v35,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v37 = (id *)v26;
  objc_storeStrong((id *)&v37, v26);
  if (v26)
  {
    id v13 = [v37 floatingContentView];
    sub_1000B5308();
    double v33 = v3;
    double v34 = v4;
    sub_1000B5308();
    double v31 = v5;
    double v32 = v6;
    objc_msgSend(v13, "setContentMotionRotation:translation:", v33, v34, v5, v6);

    id v14 = [v37 floatingContentView];
    [v14 setFocusedSizeIncrease:3.0];

    char v30 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
    double v7 = 21.0;
    if (!v30) {
      double v7 = 13.0;
    }
    v29[1] = *(id *)&v7;
    v29[0] =  +[UIFont tvss_cameraFontWithWeight:pointSize:]( &OBJC_CLASS___UIFont,  "tvss_cameraFontWithWeight:pointSize:",  UIFontWeightBold,  v7);
    id v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    id v9 = v37[1];
    v37[1] = v8;

    [v37[1] setTextAlignment:1];
    [v37[1] setFont:v29[0]];
    [v37[1] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v28 = [v37 contentContainerView];
    [v28 addSubview:v37[1]];
    double v10 = 60.0;
    if ((v30 & 1) == 0) {
      double v10 = 40.0;
    }
    double v27 = v10;
    id v25 = [v28 widthAnchor];
    id v24 = [v25 constraintEqualToConstant:v27];
    v39[0] = v24;
    id v23 = [v28 heightAnchor];
    id v22 = [v23 constraintEqualToConstant:v27];
    v39[1] = v22;
    id v21 = [v37[1] centerXAnchor];
    id v20 = [v28 centerXAnchor];
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v39[2] = v19;
    id v18 = [v37[1] centerYAnchor];
    id v17 = [v28 centerYAnchor];
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v39[3] = v16;
    v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    [v37 _setCornerRadius:v27 / 2.0];
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(v29, 0LL);
  }

  char v12 = v37;
  objc_storeStrong((id *)&v37, 0LL);
  return v12;
}

  ;
}

- (id)foregroundViews
{
  titleLabel = self->_titleLabel;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &titleLabel, 1LL);
}

+ (id)configurationForUserInterfaceStyle:(int64_t)a3 controlState:(unint64_t)a4
{
  id v20 = a1;
  SEL v19 = a2;
  int64_t v18 = a3;
  unint64_t v17 = a4;
  BOOL v16 = (a4 & 4) != 0;
  if ((a4 & 8) != 0)
  {
    id v15 =  +[TVSPBaseFloatingContentControlConfiguration focusedConfiguration]( &OBJC_CLASS___TVSPBaseFloatingContentControlConfiguration,  "focusedConfiguration");
    if (v16)
    {
      id v7 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
      objc_msgSend(v15, "setForegroundColor:");
    }

    id v21 = v15;
    objc_storeStrong(&v15, 0LL);
  }

  else
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___TVSPBaseFloatingContentControlConfiguration);
    double v6 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL);
    objc_msgSend(v14, "setBackgroundVisualEffect:");

    [v14 setCaptureGroup:@"TVSSCameraButtonGroup"];
    char v12 = 0;
    char v10 = 0;
    char v8 = 0;
    if (v16)
    {
      id v13 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
      char v12 = 1;
      id v5 = v13;
    }

    else
    {
      id v11 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
      char v10 = 1;
      id v9 = objc_msgSend(v11, "tvsp_darkStyleColor");
      char v8 = 1;
      id v5 = v9;
    }

    [v14 setForegroundColor:v5];
    if ((v8 & 1) != 0) {

    }
    if ((v10 & 1) != 0) {
    if ((v12 & 1) != 0)
    }

    id v21 = v14;
    objc_storeStrong(&v14, 0LL);
  }

  return v21;
}

- (void)customizeAppearanceForControlState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v16 = self;
  SEL v15 = a2;
  unint64_t v14 = a3;
  BOOL v13 = a4;
  BOOL v12 = (a3 & 4) != 0;
  id location = -[TVSSCameraZoomButton contentContainerView](self, "contentContainerView");
  id v5 = [location layer];
  [v5 setBorderWidth:1.0];

  id v6 = [location layer];
  char v9 = 0;
  char v7 = 0;
  if (v12)
  {
    id v10 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
    char v9 = 1;
    double v4 = (CGColor *)[v10 CGColor];
  }

  else
  {
    char v8 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.45);
    char v7 = 1;
    double v4 = -[UIColor CGColor](v8, "CGColor");
  }

  objc_msgSend(v6, "setBorderColor:", v4, v4);
  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  objc_storeStrong(&location, 0LL);
  }
}

- (void)setText:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v4->_titleLabel, "setText:", location[0]);
  -[TVSSCameraZoomButton setNeedsLayout](v4, "setNeedsLayout");
  objc_storeStrong(location, 0LL);
}

- (NSString)text
{
  return -[UILabel text](self->_titleLabel, "text", a2, self);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end