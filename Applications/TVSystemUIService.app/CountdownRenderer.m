@interface CountdownRenderer
+ (id)rendererWithIdentifier:(id)a3 content:(id)a4;
- (CountdownRenderer)initWithIdentifier:(id)a3 content:(id)a4;
- (NSTimer)countdownTimer;
- (TVSSTimerCountdownView)countdownView;
- (UIImageView)sleepImageView;
- (UILabel)endLabel;
- (UILabel)timeLabel;
- (void)configureContentView:(id)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setCountdownView:(id)a3;
- (void)setEndLabel:(id)a3;
- (void)setSleepImageView:(id)a3;
- (void)setTimeLabel:(id)a3;
@end

@implementation CountdownRenderer

+ (id)rendererWithIdentifier:(id)a3 content:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] content:v8];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (CountdownRenderer)initWithIdentifier:(id)a3 content:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  v9 = v21;
  id v10 = location[0];
  v11 = objc_alloc_init(&OBJC_CLASS___CountdownRendererFormatProvider);
  v21 = 0LL;
  v18.receiver = v9;
  v18.super_class = (Class)&OBJC_CLASS___CountdownRenderer;
  v21 = -[CountdownRenderer initWithIdentifier:formatProvider:content:overrideStylings:]( &v18,  "initWithIdentifier:formatProvider:content:overrideStylings:",  v10);
  objc_storeStrong((id *)&v21, v21);

  if (v21)
  {
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_10008DB1C;
    v16 = &unk_1001B77B8;
    v17 = v21;
    id v4 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v12,  0.25);
    countdownTimer = v21->_countdownTimer;
    v21->_countdownTimer = v4;

    objc_storeStrong((id *)&v17, 0LL);
  }

  id v7 = v21;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v7;
}

- (void)configureContentView:(id)a3
{
  v93 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v91.receiver = v93;
  v91.super_class = (Class)&OBJC_CLASS___CountdownRenderer;
  -[CountdownRenderer configureContentView:](&v91, "configureContentView:", location[0]);
  id v90 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001B9470);
  id v89 = -[CountdownRenderer content](v93, "content");
  v54 = objc_alloc(&OBJC_CLASS___TVSSTimerCountdownView);
  id v55 = +[UIColor systemMintColor](&OBJC_CLASS___UIColor, "systemMintColor");
  v88 = -[TVSSTimerCountdownView initWithBarColor:backgroundBarColor:barWidth:]( v54,  "initWithBarColor:backgroundBarColor:barWidth:",  16.0);

  -[TVSSTimerCountdownView setTranslatesAutoresizingMaskIntoConstraints:]( v88,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v88];
  id v87 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001B9490);
  id v56 = [v89 predictedEndDate];
  [v56 timeIntervalSinceNow];
  double v57 = v3;

  double v86 = v57;
  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  timeLabel = v93->_timeLabel;
  v93->_timeLabel = v4;

  v58 = v93->_timeLabel;
  id v59 = (id)FormatTime(v86);
  -[UILabel setText:](v58, "setText:");

  v60 = v93->_timeLabel;
  id v62 =  +[UIFont _preferredFontForTextStyle:weight:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:weight:",  UIFontTextStyleTitle1,  UIFontWeightLight);
  id v61 = objc_msgSend(v62, "tvss_fontWithMonospacedNumbers");
  -[UILabel setFont:](v60, "setFont:");

  -[UILabel setTextColor:](v93->_timeLabel, "setTextColor:", v87);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v93->_timeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v63 = v93->_timeLabel;
  v64 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  -[UILabel setBackgroundColor:](v63, "setBackgroundColor:");

  -[UILabel setTextAlignment:](v93->_timeLabel, "setTextAlignment:");
  -[UILabel setAdjustsFontSizeToFitWidth:](v93->_timeLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
  -[UILabel setBaselineAdjustment:](v93->_timeLabel, "setBaselineAdjustment:", 1LL);
  -[UILabel setLineBreakMode:](v93->_timeLabel, "setLineBreakMode:");
  [location[0] addSubview:v93->_timeLabel];
  id v85 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:");
  id v84 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v85,  2LL);
  v65 = objc_alloc(&OBJC_CLASS___UIImageView);
  id v67 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"power");
  id v66 = [v67 imageWithConfiguration:v84];
  v6 = -[UIImageView initWithImage:](v65, "initWithImage:");
  sleepImageView = v93->_sleepImageView;
  v93->_sleepImageView = v6;

  -[UIImageView setTintColor:](v93->_sleepImageView, "setTintColor:", v87);
  -[UIImageView setContentMode:](v93->_sleepImageView, "setContentMode:", 4LL);
  id v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
  endLabel = v93->_endLabel;
  v93->_endLabel = v8;

  -[UILabel setFont:](v93->_endLabel, "setFont:", v85);
  -[UILabel setTextColor:](v93->_endLabel, "setTextColor:", v87);
  v68 = v93->_endLabel;
  v69 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  -[UILabel setBackgroundColor:](v68, "setBackgroundColor:");

  -[UILabel setTextAlignment:](v93->_endLabel, "setTextAlignment:", 1LL);
  v70 = objc_alloc(&OBJC_CLASS___UIStackView);
  v95[0] = v93->_sleepImageView;
  v95[1] = v93->_endLabel;
  v71 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 2LL);
  id v83 = -[UIStackView initWithArrangedSubviews:](v70, "initWithArrangedSubviews:");

  [v83 setAlignment:3];
  [v83 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v83 setSpacing:10.0];
  id v72 = [v83 layer];
  [v72 setAllowsGroupBlending:0];

  v73 = objc_alloc(&OBJC_CLASS___UIStackView);
  v94[0] = v93->_timeLabel;
  v94[1] = v83;
  v74 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 2LL);
  v82 = -[UIStackView initWithArrangedSubviews:](v73, "initWithArrangedSubviews:");

  -[UIStackView setAxis:](v82, "setAxis:", 1LL);
  -[UIStackView setAlignment:](v82, "setAlignment:", 3LL);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v82,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setSpacing:](v82, "setSpacing:", 3.0);
  id v75 = -[UIStackView layer](v82, "layer");
  [v75 setAllowsGroupBlending:0];

  [location[0] addSubview:v82];
  id v76 = [location[0] traitCollection];
  BOOL v77 = [v76 userInterfaceStyle] == (id)2;

  BOOL v81 = v77;
  if (v77) {
    uint64_t v53 = kCAFilterPlusL;
  }
  else {
    uint64_t v53 = kCAFilterPlusD;
  }
  v80 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v53);
  v12 = v80;
  id v13 = -[UILabel layer](v93->_timeLabel, "layer");
  [v13 setCompositingFilter:v12];

  int v14 = v80;
  id v15 = -[UILabel layer](v93->_endLabel, "layer");
  [v15 setCompositingFilter:v14];

  v16 = v80;
  id v17 = -[UIImageView layer](v93->_sleepImageView, "layer");
  [v17 setCompositingFilter:v16];

  id v19 = [v89 predictedEndDate];
  objc_super v18 =  +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:");
  v79 = -[NSString localizedUppercaseString](v18, "localizedUppercaseString");

  -[UILabel setText:](v93->_endLabel, "setText:", v79);
  v78 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v20 = v78;
  id v23 = -[TVSSTimerCountdownView topAnchor](v88, "topAnchor");
  id v22 = [location[0] topAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v20, "addObject:");

  v24 = v78;
  id v27 = -[TVSSTimerCountdownView bottomAnchor](v88, "bottomAnchor");
  id v26 = [location[0] bottomAnchor];
  id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v24, "addObject:");

  v28 = v78;
  id v31 = -[TVSSTimerCountdownView centerXAnchor](v88, "centerXAnchor");
  id v30 = [location[0] centerXAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v28, "addObject:");

  v32 = v78;
  id v34 = -[TVSSTimerCountdownView widthAnchor](v88, "widthAnchor");
  id v33 = [v34 constraintEqualToConstant:392.0];
  -[NSMutableArray addObject:](v32, "addObject:");

  v35 = v78;
  id v38 = -[UILabel centerXAnchor](v93->_timeLabel, "centerXAnchor");
  id v37 = -[TVSSTimerCountdownView centerXAnchor](v88, "centerXAnchor");
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v35, "addObject:");

  v39 = v78;
  id v41 = -[UIImageView widthAnchor](v93->_sleepImageView, "widthAnchor");
  id v40 = [v41 constraintEqualToConstant:34.0];
  -[NSMutableArray addObject:](v39, "addObject:");

  v42 = v78;
  id v45 = -[UIStackView centerXAnchor](v82, "centerXAnchor");
  id v44 = -[TVSSTimerCountdownView centerXAnchor](v88, "centerXAnchor");
  id v43 = objc_msgSend(v45, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v42, "addObject:");

  v46 = v78;
  id v49 = -[UIStackView centerYAnchor](v82, "centerYAnchor");
  id v48 = -[TVSSTimerCountdownView centerYAnchor](v88, "centerYAnchor");
  id v47 = objc_msgSend(v49, "constraintEqualToAnchor:");
  -[NSMutableArray addObject:](v46, "addObject:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v78);
  -[CountdownRenderer setCountdownView:](v93, "setCountdownView:", v88);
  v50 = v88;
  id v52 = [v89 predictedEndDate];
  [v52 timeIntervalSinceNow];
  double v51 = v10;
  [v89 duration];
  -[TVSSTimerCountdownView setAnimationRemainingTime:totalTime:](v50, "setAnimationRemainingTime:totalTime:", v51, v11);

  -[TVSSTimerCountdownView start](v88, "start");
  objc_storeStrong((id *)&v78, 0LL);
  objc_storeStrong((id *)&v79, 0LL);
  objc_storeStrong((id *)&v80, 0LL);
  objc_storeStrong((id *)&v82, 0LL);
  objc_storeStrong(&v83, 0LL);
  objc_storeStrong(&v84, 0LL);
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong((id *)&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSTimerCountdownView)countdownView
{
  return self->_countdownView;
}

- (void)setCountdownView:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UIImageView)sleepImageView
{
  return self->_sleepImageView;
}

- (void)setSleepImageView:(id)a3
{
}

- (UILabel)endLabel
{
  return self->_endLabel;
}

- (void)setEndLabel:(id)a3
{
}

- (NSTimer)countdownTimer
{
  return self->_countdownTimer;
}

- (void)setCountdownTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end