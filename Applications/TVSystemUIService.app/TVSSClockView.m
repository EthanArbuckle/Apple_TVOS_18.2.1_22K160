@interface TVSSClockView
- (CADisplayLink)displayLink;
- (NSCalendar)calendar;
- (NSDateComponents)lastDateComponents;
- (NSDateFormatter)formatter;
- (TVSSClockView)init;
- (UILabel)timeLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_clockWillAppear;
- (void)_handleDisplayLink:(id)a3;
- (void)_setClockDate:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)_updateEffect;
- (void)_willDisappear;
- (void)dealloc;
- (void)setFormatter:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVSSClockView

- (TVSSClockView)init
{
  SEL v29 = a2;
  v30 = 0LL;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVSSClockView;
  v30 = -[TVSSClockView init](&v28, "init");
  objc_storeStrong((id *)&v30, v30);
  if (v30)
  {
    v2 = +[NSCalendar autoupdatingCurrentCalendar](&OBJC_CLASS___NSCalendar, "autoupdatingCurrentCalendar");
    calendar = v30->_calendar;
    v30->_calendar = v2;

    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    timeLabel = v30->_timeLabel;
    v30->_timeLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v30->_timeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v9 = v30->_timeLabel;
    id v10 = sub_1000BF998();
    -[UILabel setFont:](v9, "setFont:");

    -[UILabel setAccessibilityIdentifier:]( v30->_timeLabel,  "setAccessibilityIdentifier:",  @"UIA.StatusBar.ClockView.Time");
    -[TVSSClockView addSubview:](v30, "addSubview:", v30->_timeLabel);
    id v23 = -[UILabel leadingAnchor](v30->_timeLabel, "leadingAnchor");
    id v22 = -[TVSSClockView leadingAnchor](v30, "leadingAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    v32[0] = v21;
    id v20 = -[UILabel trailingAnchor](v30->_timeLabel, "trailingAnchor");
    id v19 = -[TVSSClockView trailingAnchor](v30, "trailingAnchor");
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v32[1] = v18;
    id v17 = -[UILabel topAnchor](v30->_timeLabel, "topAnchor");
    id v16 = -[TVSSClockView topAnchor](v30, "topAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
    v32[2] = v15;
    id v14 = -[UILabel bottomAnchor](v30->_timeLabel, "bottomAnchor");
    id v13 = -[TVSSClockView bottomAnchor](v30, "bottomAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v32[3] = v12;
    v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    id v24 = -[TVSSClockView layer](v30, "layer");
    [v24 setAllowsGroupBlending:0];

    v25 = v30;
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v26 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL);
    id v6 = -[TVSSClockView registerForTraitChanges:withAction:](v25, "registerForTraitChanges:withAction:");

    v27 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v27,  "addObserver:selector:name:object:",  v30,  "_significantTimeChange:",  UIApplicationSignificantTimeChangeNotification,  0LL);
  }

  v8 = v30;
  objc_storeStrong((id *)&v30, 0LL);
  return v8;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v5,  UIApplicationSignificantTimeChangeNotification,  0LL);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSClockView;
  -[TVSSClockView dealloc](&v3, "dealloc");
}

- (void)willMoveToWindow:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSClockView;
  -[TVSSClockView willMoveToWindow:](&v3, "willMoveToWindow:", location[0]);
  if (location[0]) {
    -[TVSSClockView _clockWillAppear](v5, "_clockWillAppear");
  }
  else {
    -[TVSSClockView _willDisappear](v5, "_willDisappear");
  }
  objc_storeStrong(location, 0LL);
}

- (id)viewForFirstBaselineLayout
{
  return -[TVSSClockView timeLabel](self, "timeLabel", a2, self);
}

- (id)viewForLastBaselineLayout
{
  return -[TVSSClockView timeLabel](self, "timeLabel", a2, self);
}

- (void)_clockWillAppear
{
  id v10 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v11 = -[NSUserDefaults BOOLForKey:](v10, "BOOLForKey:", @"CCClockOverride");

  if ((v11 & 1) != 0)
  {
    calendar = self->_calendar;
    v9 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    v8 =  -[NSCalendar dateBySettingHour:minute:second:ofDate:options:]( calendar,  "dateBySettingHour:minute:second:ofDate:options:",  9LL,  41LL,  0LL);
    -[TVSSClockView _setClockDate:](self, "_setClockDate:");
  }

  else
  {
    SEL v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    -[TVSSClockView _setClockDate:](self, "_setClockDate:");

    v2 =  +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_handleDisplayLink:");
    displayLink = self->_displayLink;
    self->_displayLink = v2;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 10LL);
    v5 = self->_displayLink;
    id v6 = +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:");

    -[TVSSClockView _updateEffect](self, "_updateEffect");
  }

- (void)_willDisappear
{
}

- (void)_handleDisplayLink:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v3 = v6;
  SEL v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  -[TVSSClockView _setClockDate:](v3, "_setClockDate:");

  objc_storeStrong(location, 0LL);
}

- (void)_setClockDate:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[NSCalendar components:fromDate:](v8->_calendar, "components:fromDate:", 120LL, location[0]);
  if ((-[NSDateComponents isEqual:](v8->_lastDateComponents, "isEqual:", v6) & 1) == 0)
  {
    objc_super v3 =  +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  location[0],  0LL,  1LL);
    v5 = -[NSString localizedUppercaseString](v3, "localizedUppercaseString");

    SEL v4 = -[TVSSClockView timeLabel](v8, "timeLabel");
    -[UILabel setText:](v4, "setText:", v5);

    objc_storeStrong((id *)&v8->_lastDateComponents, v6);
    objc_storeStrong((id *)&v5, 0LL);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateEffect
{
  unsigned __int8 v11 = self;
  SEL v10 = a2;
  id v6 = -[TVSSClockView traitCollection](self, "traitCollection");
  BOOL v7 = [v6 userInterfaceStyle] == (id)2;

  BOOL v9 = v7;
  if (v7) {
    uint64_t v5 = kCAFilterPlusL;
  }
  else {
    uint64_t v5 = kCAFilterPlusD;
  }
  v8 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v5);
  timeLabel = v11->_timeLabel;
  objc_super v3 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  -[UILabel setTextColor:](timeLabel, "setTextColor:");

  id v4 = -[UILabel layer](v11->_timeLabel, "layer");
  [v4 setCompositingFilter:v8];

  objc_storeStrong((id *)&v8, 0LL);
}

- (void)_significantTimeChange:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_lastDateComponents, 0LL);
  objc_super v3 = v6;
  id v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  -[TVSSClockView _setClockDate:](v3, "_setClockDate:");

  objc_storeStrong(location, 0LL);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (NSDateComponents)lastDateComponents
{
  return self->_lastDateComponents;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end