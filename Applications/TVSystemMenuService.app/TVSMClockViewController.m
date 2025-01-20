@interface TVSMClockViewController
- (CADisplayLink)displayLink;
- (NSCalendar)calendar;
- (NSDateComponents)lastDateComponents;
- (TVSMClockView)clockView;
- (TVSMClockViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_handleDisplayLink:(id)a3;
- (void)_setClockDate:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSMClockViewController

- (TVSMClockViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0LL;
  v12.receiver = v4;
  v12.super_class = (Class)&OBJC_CLASS___TVSMClockViewController;
  v11 = -[TVSMClockViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", location[0], v13);
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    v5 = +[NSCalendar autoupdatingCurrentCalendar](&OBJC_CLASS___NSCalendar, "autoupdatingCurrentCalendar");
    calendar = v15->_calendar;
    v15->_calendar = v5;

    v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v9,  "addObserver:selector:name:object:",  v15,  "_significantTimeChange:",  UIApplicationSignificantTimeChangeNotification,  0LL);
  }

  v8 = v15;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v8;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v5,  UIApplicationSignificantTimeChangeNotification,  0LL);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMClockViewController;
  -[TVSMClockViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSMClockView);
  clockView = self->_clockView;
  self->_clockView = v2;

  -[TVSMClockViewController setView:](self, "setView:", self->_clockView);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSMClockViewController;
  -[TVSMClockViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v5 = v12;
  v6 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  -[TVSMClockViewController _setClockDate:](v5, "_setClockDate:");

  objc_super v3 =  +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  v12,  "_handleDisplayLink:");
  displayLink = v12->_displayLink;
  v12->_displayLink = v3;

  -[CADisplayLink setPreferredFramesPerSecond:](v12->_displayLink, "setPreferredFramesPerSecond:", 10LL);
  v7 = v12->_displayLink;
  v8 = +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop");
  -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMClockViewController;
  -[TVSMClockViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  -[CADisplayLink invalidate](v6->_displayLink, "invalidate");
  objc_storeStrong((id *)&v6->_displayLink, 0LL);
}

- (void)_handleDisplayLink:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v3 = v6;
  BOOL v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  -[TVSMClockViewController _setClockDate:](v3, "_setClockDate:");

  objc_storeStrong(location, 0LL);
}

- (void)_setClockDate:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = -[NSCalendar components:fromDate:](v20->_calendar, "components:fromDate:", 120LL, location[0]);
  v7 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v8 = -[NSUserDefaults BOOLForKey:](v7, "BOOLForKey:", @"CCClockOverride");

  char v17 = v8 & 1;
  objc_super v9 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v16 = -[NSUserDefaults stringForKey:](v9, "stringForKey:", @"CCDateOverride");

  if ((-[NSDateComponents isEqual:](v20->_lastDateComponents, "isEqual:", v18) & 1) == 0
    || (v17 & 1) != 0
    || v16)
  {
    char v13 = 0;
    if (v16)
    {
      id v3 = v16;
    }

    else
    {
      id v14 = sub_100022138(location[0]);
      char v13 = 1;
      id v3 = v14;
    }

    id v15 = v3;
    if ((v13 & 1) != 0) {

    }
    char v10 = 0;
    if ((v17 & 1) != 0)
    {
      BOOL v4 = @"9:41";
    }

    else
    {
      SEL v11 = sub_1000221BC(location[0]);
      char v10 = 1;
      BOOL v4 = v11;
    }

    objc_super v12 = v4;
    if ((v10 & 1) != 0) {

    }
    SEL v5 = -[TVSMClockView dateLabel](v20->_clockView, "dateLabel");
    -[UILabel setText:](v5, "setText:", v15);

    v6 = -[TVSMClockView timeLabel](v20->_clockView, "timeLabel");
    -[UILabel setText:](v6, "setText:", v12);

    objc_storeStrong((id *)&v20->_lastDateComponents, v18);
    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_significantTimeChange:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_lastDateComponents, 0LL);
  id v3 = v6;
  BOOL v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  -[TVSMClockViewController _setClockDate:](v3, "_setClockDate:");

  objc_storeStrong(location, 0LL);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (TVSMClockView)clockView
{
  return self->_clockView;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (NSDateComponents)lastDateComponents
{
  return self->_lastDateComponents;
}

- (void).cxx_destruct
{
}

@end