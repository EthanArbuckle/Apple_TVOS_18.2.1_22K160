@interface AXTVSliderViewController
+ (id)sliderWithTitle:(id)a3 subtitle:(id)a4 minimumValue:(double)a5 maximumValue:(double)a6 currentValue:(double)a7 discreteStepAmount:(double)a8 valueChangeHandler:(id)a9 valueFormatHandler:(id)a10;
+ (id)sliderWithTitle:(id)a3 subtitle:(id)a4 minimumValue:(double)a5 maximumValue:(double)a6 currentValue:(double)a7 leftDetailImage:(id)a8 rightDetailImage:(id)a9 discreteStepAmount:(double)a10 valueChangeHandler:(id)a11 valueFormatHandler:(id)a12;
- (AXTVSlider)slider;
- (BOOL)becomeFirstResponder;
- (NSNumber)defaultTickValue;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSTimer)pressLeftTimer;
- (NSTimer)pressRightTimer;
- (UIImage)leftDetailImage;
- (UIImage)rightDetailImage;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILabel)valueDescriptionLabel;
- (UILongPressGestureRecognizer)pressLeft;
- (UILongPressGestureRecognizer)pressRight;
- (double)_currentValuePercentOfMaximum;
- (double)currentValue;
- (double)discreteStepAmount;
- (double)maxValue;
- (double)minValue;
- (id)_detailImageViewForImage:(id)a3;
- (id)accessibilityHeaderElements;
- (id)accessibilityValueFormatHandler;
- (id)preferredFocusEnvironments;
- (id)subtitleTextHandler;
- (id)valueChangedHandler;
- (id)valueFormatHandler;
- (void)_decrementSliderByDiscreteAmount;
- (void)_handlePan:(id)a3;
- (void)_handlePressLeft:(id)a3;
- (void)_handlePressRight:(id)a3;
- (void)_incrementSliderByDiscreteAmount;
- (void)_sustainedPressLeft:(id)a3;
- (void)_sustainedPressRight:(id)a3;
- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3;
- (void)setAccessibilityValueFormatHandler:(id)a3;
- (void)setCurrentValue:(double)a3;
- (void)setDefaultTickValue:(id)a3;
- (void)setDiscreteStepAmount:(double)a3;
- (void)setLeftDetailImage:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setPressLeft:(id)a3;
- (void)setPressLeftTimer:(id)a3;
- (void)setPressRight:(id)a3;
- (void)setPressRightTimer:(id)a3;
- (void)setRightDetailImage:(id)a3;
- (void)setSlider:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleTextHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValueChangedHandler:(id)a3;
- (void)setValueDescriptionLabel:(id)a3;
- (void)setValueFormatHandler:(id)a3;
- (void)updateMinimumValue:(double)a3 maximumValue:(double)a4 currentValue:(double)a5;
- (void)viewDidLoad;
@end

@implementation AXTVSliderViewController

+ (id)sliderWithTitle:(id)a3 subtitle:(id)a4 minimumValue:(double)a5 maximumValue:(double)a6 currentValue:(double)a7 leftDetailImage:(id)a8 rightDetailImage:(id)a9 discreteStepAmount:(double)a10 valueChangeHandler:(id)a11 valueFormatHandler:(id)a12
{
  id v21 = a12;
  id v22 = a11;
  id v23 = a9;
  id v24 = a8;
  id v25 = a4;
  id v26 = a3;
  v27 = -[AXTVSliderViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___AXTVSliderViewController),  "initWithNibName:bundle:",  0LL,  0LL);
  -[AXTVSliderViewController setLocalizedTitle:](v27, "setLocalizedTitle:", v26);

  -[AXTVSliderViewController setLocalizedSubtitle:](v27, "setLocalizedSubtitle:", v25);
  -[AXTVSliderViewController setValueFormatHandler:](v27, "setValueFormatHandler:", v21);

  -[AXTVSliderViewController setValueChangedHandler:](v27, "setValueChangedHandler:", v22);
  -[AXTVSliderViewController setLeftDetailImage:](v27, "setLeftDetailImage:", v24);

  -[AXTVSliderViewController setRightDetailImage:](v27, "setRightDetailImage:", v23);
  -[AXTVSliderViewController setDiscreteStepAmount:](v27, "setDiscreteStepAmount:", a10);
  -[AXTVSliderViewController updateMinimumValue:maximumValue:currentValue:]( v27,  "updateMinimumValue:maximumValue:currentValue:",  a5,  a6,  a7);
  return v27;
}

+ (id)sliderWithTitle:(id)a3 subtitle:(id)a4 minimumValue:(double)a5 maximumValue:(double)a6 currentValue:(double)a7 discreteStepAmount:(double)a8 valueChangeHandler:(id)a9 valueFormatHandler:(id)a10
{
  return +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:leftDetailImage:rightDetailImage:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:leftDetailImage:rightDetailImage:discreteStep Amount:valueChangeHandler:valueFormatHandler:",  a3,  a4,  0LL,  0LL,  a9,  a10,  a5,  a6,  a7,  a8);
}

- (void)setDefaultTickValue:(id)a3
{
  id v5 = a3;
  -[AXTVSlider setDefaultTickValue:](self->_slider, "setDefaultTickValue:", v5);
}

- (void)viewDidLoad
{
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___AXTVSliderViewController;
  -[AXTVSliderViewController viewDidLoad](&v89, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleTextHandler](self, "subtitleTextHandler"));
  BOOL v5 = v4 == 0LL;

  if (!v5)
  {
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleTextHandler](self, "subtitleTextHandler"));
    uint64_t v7 = v6[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[AXTVSliderViewController setLocalizedSubtitle:](self, "setLocalizedSubtitle:", v8);
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController slider](self, "slider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController leftDetailImage](self, "leftDetailImage"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController _detailImageViewForImage:](self, "_detailImageViewForImage:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController rightDetailImage](self, "rightDetailImage"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController _detailImageViewForImage:](self, "_detailImageViewForImage:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController leftDetailImage](self, "leftDetailImage"));
  if (v14)
  {
    BOOL v15 = 1;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController rightDetailImage](self, "rightDetailImage"));
    BOOL v15 = v16 != 0LL;
  }

  v17 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  [v3 addSubview:v83];
  [v3 addSubview:v9];
  [v3 addSubview:v17];
  -[UIView addSubview:](v17, "addSubview:", v10);
  if (v15)
  {
    -[UIView addSubview:](v17, "addSubview:", v81);
    -[UIView addSubview:](v17, "addSubview:", v82);
  }

  -[UIView addSubview:](v17, "addSubview:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v83 lastBaselineAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19 constant:320.0]);
  [v20 setActive:1];

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v83 centerXAnchor]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
  [v23 setActive:1];

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 firstBaselineAnchor]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v83 lastBaselineAnchor]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25 constant:60.0]);
  [v26 setActive:1];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 centerXAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v28]);
  [v29 setActive:1];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v9 leadingAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintGreaterThanOrEqualToAnchor:v31 constant:50.0]);
  [v32 setActive:1];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 trailingAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintLessThanOrEqualToAnchor:v34 constant:50.0]);
  [v35 setActive:1];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v10 topAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 lastBaselineAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37 constant:160.0]);
  [v38 setActive:1];

  v39 = (void *)objc_claimAutoreleasedReturnValue([v10 widthAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToConstant:1000.0]);
  [v40 setActive:1];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v10 heightAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToConstant:60.0]);
  [v42 setActive:1];

  v43 = (void *)objc_claimAutoreleasedReturnValue([v10 centerXAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v44]);
  [v45 setActive:1];

  v46 = v11;
  if (v15)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v81 lastBaselineAnchor]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v48 constant:120.0]);
    [v49 setActive:1];

    v50 = (void *)objc_claimAutoreleasedReturnValue([v81 leadingAnchor]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v10 leadingAnchor]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v51]);
    [v52 setActive:1];

    v53 = (void *)objc_claimAutoreleasedReturnValue([v82 lastBaselineAnchor]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v54 constant:120.0]);
    [v55 setActive:1];

    v56 = (void *)objc_claimAutoreleasedReturnValue([v82 trailingAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v10 trailingAnchor]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57]);
    [v58 setActive:1];

    v46 = v82;
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue([v11 lastBaselineAnchor]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v60 constant:120.0]);
  [v61 setActive:1];

  v62 = (void *)objc_claimAutoreleasedReturnValue([v11 centerXAnchor]);
  v63 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v64 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v63]);
  [v64 setActive:1];

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v17, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v10 topAnchor]);
  v67 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v66]);
  [v67 setActive:1];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v17, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v46 bottomAnchor]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v68 constraintEqualToAnchor:v69]);
  [v70 setActive:1];

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v17, "leftAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v10 leftAnchor]);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v71 constraintEqualToAnchor:v72]);
  [v73 setActive:1];

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v17, "rightAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v10 rightAnchor]);
  v76 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v75]);
  [v76 setActive:1];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_21D38;
  v87[3] = &unk_66168;
  v77 = v17;
  v88 = v77;
  [v10 _setAccessibilityFrameBlock:v87];
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController traitCollection](self, "traitCollection"));
  -[AXTVSliderViewController _updateColorsForUserInterfaceStyle:]( self,  "_updateColorsForUserInterfaceStyle:",  [v78 userInterfaceStyle]);

  objc_initWeak(&location, self);
  uint64_t v90 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v90, 1LL));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_21D58;
  v84[3] = &unk_65958;
  objc_copyWeak(&v85, &location);
  id v80 =  -[AXTVSliderViewController registerForTraitChanges:withHandler:]( self,  "registerForTraitChanges:withHandler:",  v79,  v84);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&location);
}

- (BOOL)becomeFirstResponder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController slider](self, "slider"));
  unsigned __int8 v3 = [v2 becomeFirstResponder];

  return v3;
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController slider](self, "slider"));
  BOOL v5 = v2;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3
{
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
  if ((unint64_t)a3 < 2)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v14 setTextColor:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    [v5 setTextColor:v8];

    double v9 = 0.0;
    double v10 = 0.5;
LABEL_5:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v9, v10));
    [v6 setTextColor:v13];

    goto LABEL_6;
  }

  if (a3 == 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v14 setTextColor:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.25));
    [v5 setTextColor:v12];

    double v9 = 1.0;
    double v10 = 0.25;
    goto LABEL_5;
  }

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle1));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fontDescriptor]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fontDescriptorWithSymbolicTraits:2]);
    [v5 pointSize];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v7));

    -[UILabel setFont:](v4, "setFont:", v8);
    -[UILabel setAccessibilityTraits:](v4, "setAccessibilityTraits:", UIAccessibilityTraitHeader);
    double v9 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (NSString)localizedTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setLocalizedTitle:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  [v5 setText:v4];

  id v6 = [v4 length];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  [v7 setHidden:v6 == 0];
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fontWithSize:38.0]);
    -[UILabel setFont:](v4, "setFont:", v6);

    -[UILabel setAccessibilityTraits:](v4, "setAccessibilityTraits:", UIAccessibilityTraitHeader);
    -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1LL);
    id v7 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    subtitleLabel = self->_subtitleLabel;
  }

  return subtitleLabel;
}

- (NSString)localizedSubtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setLocalizedSubtitle:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  [v5 setText:v4];

  id v6 = [v4 length];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  [v7 setHidden:v6 == 0];
}

- (UILabel)valueDescriptionLabel
{
  valueDescriptionLabel = self->_valueDescriptionLabel;
  if (!valueDescriptionLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle1));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fontWithSize:76.0]);
    -[UILabel setFont:](v4, "setFont:", v6);

    id v7 = self->_valueDescriptionLabel;
    self->_valueDescriptionLabel = v4;

    valueDescriptionLabel = self->_valueDescriptionLabel;
  }

  return valueDescriptionLabel;
}

- (void)setValueFormatHandler:(id)a3
{
  id v4 = [a3 copy];
  id valueFormatHandler = self->_valueFormatHandler;
  self->_id valueFormatHandler = v4;

  id v6 = self->_valueFormatHandler;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
  id v16 = v7;
  if (v6)
  {
    [v7 setHidden:0];

    v8 = (uint64_t (**)(id, double, double, double))self->_valueFormatHandler;
    -[AXTVSliderViewController currentValue](self, "currentValue");
    double v10 = v9;
    -[AXTVSliderViewController minValue](self, "minValue");
    double v12 = v11;
    -[AXTVSliderViewController maxValue](self, "maxValue");
    uint64_t v14 = v8[2](v8, v10, v12, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v14);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
    [v15 setText:v16];
  }

  else
  {
    [v7 setHidden:1];
  }
}

- (id)_detailImageViewForImage:(id)a3
{
  id v3 = a3;
  id v4 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v3);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  -[UIImageView setTintColor:](v4, "setTintColor:", v5);

  -[UIImageView sizeToFit](v4, "sizeToFit");
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  return v4;
}

- (AXTVSlider)slider
{
  slider = self->_slider;
  if (!slider)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___AXTVSlider);
    BOOL v5 = self->_slider;
    self->_slider = v4;

    -[AXTVSlider setTranslatesAutoresizingMaskIntoConstraints:]( self->_slider,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[AXTVSlider setAccessibilityDelegate:](self->_slider, "setAccessibilityDelegate:", self);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController defaultTickValue](self, "defaultTickValue"));
    -[AXTVSlider setDefaultTickValue:](self->_slider, "setDefaultTickValue:", v6);

    id v7 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePan:");
    -[AXTVSlider addGestureRecognizer:](self->_slider, "addGestureRecognizer:", v7);
    v8 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePressLeft:");
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v8, "setMinimumPressDuration:", 0.01);
    -[AXTVSlider addGestureRecognizer:](self->_slider, "addGestureRecognizer:", v8);
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_70078);
    -[AXTVSliderViewController setPressLeft:](self, "setPressLeft:", v8);
    double v9 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePressRight:");
    -[AXTVSlider addGestureRecognizer:](self->_slider, "addGestureRecognizer:", v9);
    -[UILongPressGestureRecognizer setAllowedPressTypes:](v9, "setAllowedPressTypes:", &off_70090);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9, "setMinimumPressDuration:", 0.01);
    -[AXTVSliderViewController setPressRight:](self, "setPressRight:", v9);

    slider = self->_slider;
  }

  return slider;
}

- (void)updateMinimumValue:(double)a3 maximumValue:(double)a4 currentValue:(double)a5
{
}

- (void)setCurrentValue:(double)a3
{
  double discreteStepAmount = self->_discreteStepAmount;
  BOOL v5 = discreteStepAmount <= 0.0;
  double v6 = discreteStepAmount * (double)(uint64_t)round(a3 / discreteStepAmount);
  if (v5) {
    double v7 = a3;
  }
  else {
    double v7 = v6;
  }
  -[AXTVSliderViewController minValue](self, "minValue");
  if (v7 < v8) {
    double v7 = v8;
  }
  -[AXTVSliderViewController maxValue](self, "maxValue");
  if (v7 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v7;
  }
  self->_double currentValue = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController slider](self, "slider"));
  -[AXTVSliderViewController _currentValuePercentOfMaximum](self, "_currentValuePercentOfMaximum");
  objc_msgSend(v11, "setValue:");

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueChangedHandler](self, "valueChangedHandler"));
  if (v12)
  {
    double v13 = (void (**)(double))objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueChangedHandler](self, "valueChangedHandler"));
    v13[2](self->_currentValue);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
  id v40 = (id)objc_claimAutoreleasedReturnValue([v14 text]);

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueFormatHandler](self, "valueFormatHandler"));
  if (v15)
  {
    id v16 = (uint64_t (**)(void, double, double, double))objc_claimAutoreleasedReturnValue( -[AXTVSliderViewController valueFormatHandler]( self,  "valueFormatHandler"));
    double currentValue = self->_currentValue;
    -[AXTVSliderViewController minValue](self, "minValue");
    double v19 = v18;
    -[AXTVSliderViewController maxValue](self, "maxValue");
    uint64_t v21 = v16[2](v16, currentValue, v19, v20);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  if (![v15 length])
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", *(void *)&v10));

    BOOL v15 = (void *)v22;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleTextHandler](self, "subtitleTextHandler"));

  if (v23)
  {
    id v24 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleTextHandler](self, "subtitleTextHandler"));
    uint64_t v25 = v24[2]();
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
    [v27 setText:v26];
  }

  if (([v15 isEqualToString:v40] & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
    [v28 setText:v15];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController valueDescriptionLabel](self, "valueDescriptionLabel"));
    [v29 sizeToFit];

    BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    if (IsVoiceOverRunning || _AXSHoverTextEnabled(IsVoiceOverRunning, v31))
    {
      accessibilityValueFormatHandler = (uint64_t (**)(id, double, double, double))self->_accessibilityValueFormatHandler;
      if (accessibilityValueFormatHandler)
      {
        double v33 = self->_currentValue;
        -[AXTVSliderViewController minValue](self, "minValue");
        double v35 = v34;
        -[AXTVSliderViewController maxValue](self, "maxValue");
        uint64_t v37 = accessibilityValueFormatHandler[2](accessibilityValueFormatHandler, v33, v35, v36);
        id v38 = (id)objc_claimAutoreleasedReturnValue(v37);
      }

      else
      {
        id v38 = v15;
      }

      v39 = v38;
      UIAccessibilityATVPostValueChangedNotification(2LL, v40, v38, 0LL, 0LL);
    }
  }
}

- (void)_sustainedPressLeft:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressLeft](self, "pressLeft"));
  BOOL v5 = (char *)[v4 state];

  if (v5 != (_BYTE *)&dword_0 + 1)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressLeftTimer](self, "pressLeftTimer"));
    [v9 invalidate];

    -[AXTVSliderViewController setPressLeftTimer:](self, "setPressLeftTimer:", 0LL);
    goto LABEL_5;
  }

  -[AXTVSliderViewController _decrementSliderByDiscreteAmount](self, "_decrementSliderByDiscreteAmount");
  [v10 timeInterval];
  double v6 = v10;
  if (v7 == 0.0)
  {
    [v10 invalidate];
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_sustainedPressLeft:",  0LL,  1LL,  0.1));
    -[AXTVSliderViewController setPressLeftTimer:](self, "setPressLeftTimer:", v8);

LABEL_5:
    double v6 = v10;
  }
}

- (void)_sustainedPressRight:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressRight](self, "pressRight"));
  BOOL v5 = (char *)[v4 state];

  if (v5 != (_BYTE *)&dword_0 + 1)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressRightTimer](self, "pressRightTimer"));
    [v9 invalidate];

    -[AXTVSliderViewController setPressRightTimer:](self, "setPressRightTimer:", 0LL);
    goto LABEL_5;
  }

  -[AXTVSliderViewController _incrementSliderByDiscreteAmount](self, "_incrementSliderByDiscreteAmount");
  [v10 timeInterval];
  double v6 = v10;
  if (v7 == 0.0)
  {
    [v10 invalidate];
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_sustainedPressRight:",  0LL,  1LL,  0.1));
    -[AXTVSliderViewController setPressRightTimer:](self, "setPressRightTimer:", v8);

LABEL_5:
    double v6 = v10;
  }
}

- (void)_handlePressLeft:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 1)
  {
    -[AXTVSliderViewController _decrementSliderByDiscreteAmount](self, "_decrementSliderByDiscreteAmount");
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_sustainedPressLeft:",  0LL,  0LL,  0.8));
    -[AXTVSliderViewController setPressLeftTimer:](self, "setPressLeftTimer:", v5);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressLeftTimer](self, "pressLeftTimer"));
    [v4 invalidate];

    -[AXTVSliderViewController setPressLeftTimer:](self, "setPressLeftTimer:", 0LL);
  }

- (void)_handlePressRight:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 1)
  {
    -[AXTVSliderViewController _incrementSliderByDiscreteAmount](self, "_incrementSliderByDiscreteAmount");
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_sustainedPressRight:",  0LL,  0LL,  0.8));
    -[AXTVSliderViewController setPressRightTimer:](self, "setPressRightTimer:", v5);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController pressRightTimer](self, "pressRightTimer"));
    [v4 invalidate];

    -[AXTVSliderViewController setPressRightTimer:](self, "setPressRightTimer:", 0LL);
  }

- (void)_handlePan:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController view](self, "view"));
  unsigned int v5 = [v4 _shouldReverseLayoutDirection];

  double v6 = (char *)[v15 state];
  if (v6 == (_BYTE *)&dword_0 + 2)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController view](self, "view"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);

    [v9 bounds];
    double v11 = v10;
    [v15 translationInView:v9];
    double v13 = v12 / v11;
    double v14 = self->_maxValue - self->_minValue;
    if (v5) {
      double v14 = -v14;
    }
    -[AXTVSliderViewController setCurrentValue:](self, "setCurrentValue:", self->_gestureBeganValue + v14 * v13);
  }

  else if (v6 == (_BYTE *)&dword_0 + 1)
  {
    -[AXTVSliderViewController currentValue](self, "currentValue");
    self->_gestureBeganValue = v7;
  }
}

- (double)_currentValuePercentOfMaximum
{
  return (self->_currentValue - self->_minValue) / (self->_maxValue - self->_minValue);
}

- (void)_incrementSliderByDiscreteAmount
{
  double discreteStepAmount = self->_discreteStepAmount;
  if (discreteStepAmount <= 0.0)
  {
    -[AXTVSliderViewController maxValue](self, "maxValue");
    double v5 = v4;
    -[AXTVSliderViewController minValue](self, "minValue");
    double discreteStepAmount = (v5 - v6) / 50.0;
  }

  -[AXTVSliderViewController currentValue](self, "currentValue");
  -[AXTVSliderViewController setCurrentValue:](self, "setCurrentValue:", discreteStepAmount + v7);
}

- (void)_decrementSliderByDiscreteAmount
{
  double discreteStepAmount = self->_discreteStepAmount;
  if (discreteStepAmount <= 0.0)
  {
    -[AXTVSliderViewController maxValue](self, "maxValue");
    double v5 = v4;
    -[AXTVSliderViewController minValue](self, "minValue");
    double discreteStepAmount = (v5 - v6) / 50.0;
  }

  -[AXTVSliderViewController currentValue](self, "currentValue");
  -[AXTVSliderViewController setCurrentValue:](self, "setCurrentValue:", v7 - discreteStepAmount);
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController titleLabel](self, "titleLabel"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSliderViewController subtitleLabel](self, "subtitleLabel"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v3,  v4));

  return v5;
}

- (UIImage)leftDetailImage
{
  return self->_leftDetailImage;
}

- (void)setLeftDetailImage:(id)a3
{
}

- (UIImage)rightDetailImage
{
  return self->_rightDetailImage;
}

- (void)setRightDetailImage:(id)a3
{
}

- (id)subtitleTextHandler
{
  return self->_subtitleTextHandler;
}

- (void)setSubtitleTextHandler:(id)a3
{
}

- (NSNumber)defaultTickValue
{
  return self->_defaultTickValue;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)discreteStepAmount
{
  return self->_discreteStepAmount;
}

- (void)setDiscreteStepAmount:(double)a3
{
  self->_double discreteStepAmount = a3;
}

- (id)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(id)a3
{
}

- (id)valueFormatHandler
{
  return self->_valueFormatHandler;
}

- (id)accessibilityValueFormatHandler
{
  return self->_accessibilityValueFormatHandler;
}

- (void)setAccessibilityValueFormatHandler:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void)setValueDescriptionLabel:(id)a3
{
}

- (void)setSlider:(id)a3
{
}

- (UILongPressGestureRecognizer)pressLeft
{
  return self->_pressLeft;
}

- (void)setPressLeft:(id)a3
{
}

- (UILongPressGestureRecognizer)pressRight
{
  return self->_pressRight;
}

- (void)setPressRight:(id)a3
{
}

- (NSTimer)pressLeftTimer
{
  return self->_pressLeftTimer;
}

- (void)setPressLeftTimer:(id)a3
{
}

- (NSTimer)pressRightTimer
{
  return self->_pressRightTimer;
}

- (void)setPressRightTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end