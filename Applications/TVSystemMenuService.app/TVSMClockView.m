@interface TVSMClockView
- (TVSMClockView)initWithFrame:(CGRect)a3;
- (UILabel)dateLabel;
- (UILabel)timeLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_updateEffect;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVSMClockView

- (TVSMClockView)initWithFrame:(CGRect)a3
{
  CGRect v35 = a3;
  SEL v33 = a2;
  v34 = 0LL;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVSMClockView;
  v30 = -[TVSMClockView initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v34 = v30;
  objc_storeStrong((id *)&v34, v30);
  if (v30)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    dateLabel = v34->_dateLabel;
    v34->_dateLabel = v3;

    v9 = v34->_dateLabel;
    id v10 = sub_100028F04();
    -[UILabel setFont:](v9, "setFont:");

    -[UILabel setAccessibilityIdentifier:]( v34->_dateLabel,  "setAccessibilityIdentifier:",  @"UIA.ControlCenter.ClockView.Date");
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    timeLabel = v34->_timeLabel;
    v34->_timeLabel = v5;

    v11 = v34->_timeLabel;
    v12 = sub_100028F30();
    -[UILabel setFont:](v11, "setFont:");

    -[UILabel setAccessibilityIdentifier:]( v34->_timeLabel,  "setAccessibilityIdentifier:",  @"UIA.ControlCenter.ClockView.Time");
    v13 = objc_alloc(&OBJC_CLASS___UIStackView);
    v37[0] = v34->_timeLabel;
    v37[1] = v34->_dateLabel;
    v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL);
    v31 = -[UIStackView initWithArrangedSubviews:](v13, "initWithArrangedSubviews:");

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v31,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setSpacing:](v31, "setSpacing:", 32.0);
    -[UIStackView setBaselineRelativeArrangement:](v31, "setBaselineRelativeArrangement:", 1LL);
    -[UIStackView setAlignment:](v31, "setAlignment:");
    -[UIStackView setAxis:](v31, "setAxis:", 1LL);
    -[TVSMClockView addSubview:](v34, "addSubview:", v31);
    id v27 = -[UIStackView leadingAnchor](v31, "leadingAnchor");
    id v26 = -[TVSMClockView leadingAnchor](v34, "leadingAnchor");
    id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
    v36[0] = v25;
    id v24 = -[UIStackView trailingAnchor](v31, "trailingAnchor");
    id v23 = -[TVSMClockView trailingAnchor](v34, "trailingAnchor");
    id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v36[1] = v22;
    id v21 = -[UIStackView topAnchor](v31, "topAnchor");
    id v20 = -[TVSMClockView topAnchor](v34, "topAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v36[2] = v19;
    id v18 = -[UIStackView bottomAnchor](v31, "bottomAnchor");
    id v17 = -[TVSMClockView bottomAnchor](v34, "bottomAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v36[3] = v16;
    v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    id v28 = -[UIStackView layer](v31, "layer");
    [v28 setAllowsGroupBlending:0];

    id v29 = -[TVSMClockView layer](v34, "layer");
    [v29 setAllowsGroupBlending:0];

    -[TVSMClockView _updateEffect](v34, "_updateEffect");
    objc_storeStrong((id *)&v31, 0LL);
  }

  v8 = v34;
  objc_storeStrong((id *)&v34, 0LL);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___TVSMClockView;
  -[TVSMClockView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", location[0]);
  id v3 = [location[0] userInterfaceStyle];
  id v4 = -[TVSMClockView traitCollection](v8, "traitCollection");
  BOOL v5 = v3 == [v4 userInterfaceStyle];

  if (!v5) {
    -[TVSMClockView _updateEffect](v8, "_updateEffect");
  }
  objc_storeStrong(location, 0LL);
}

- (id)viewForFirstBaselineLayout
{
  return -[TVSMClockView timeLabel](self, "timeLabel", a2, self);
}

- (id)viewForLastBaselineLayout
{
  return -[TVSMClockView dateLabel](self, "dateLabel", a2, self);
}

- (void)_updateEffect
{
  id v18 = self;
  v17[1] = (id)a2;
  v17[0] = 0LL;
  v16[8] = 0;
  id v10 = -[TVSMClockView traitCollection](self, "traitCollection");
  BOOL v11 = [v10 userInterfaceStyle] == (id)2;

  *(void *)id v16 = v11;
  if (_AXSEnhanceBackgroundContrastEnabled())
  {
    char v14 = 0;
    char v12 = 0;
    if ((v16[0] & 1) != 0)
    {
      v15 = sub_10002938C();
      char v14 = 1;
      objc_storeStrong((id *)&v16[1], v15);
    }

    else
    {
      v13 = sub_1000293BC();
      char v12 = 1;
      objc_storeStrong((id *)&v16[1], v13);
    }

    if ((v12 & 1) != 0) {

    }
    if ((v14 & 1) != 0) {
  }
    }

  else
  {
    if ((v16[0] & 1) != 0)
    {
      v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
      id v3 = v17[0];
      v17[0] = v2;

      id v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.48627451, 1.0);
    }

    else
    {
      objc_super v6 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
      id v7 = v17[0];
      v17[0] = v6;

      id v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.501960784, 1.0);
    }

    BOOL v5 = *(void **)&v16[1];
    *(void *)&v16[1] = v4;
  }

  -[UILabel setTextColor:](v18->_timeLabel, "setTextColor:", *(void *)&v16[1]);
  id v8 = -[UILabel layer](v18->_timeLabel, "layer");
  [v8 setCompositingFilter:v17[0]];

  -[UILabel setTextColor:](v18->_dateLabel, "setTextColor:", *(void *)&v16[1]);
  id v9 = -[UILabel layer](v18->_dateLabel, "layer");
  [v9 setCompositingFilter:v17[0]];

  objc_storeStrong((id *)&v16[1], 0LL);
  objc_storeStrong(v17, 0LL);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void).cxx_destruct
{
}

@end