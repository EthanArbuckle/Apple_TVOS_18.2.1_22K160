@interface TVAirPlayPINViewController
- (NSString)clientName;
- (NSString)pinCode;
- (TVSUIDigitEntryViewController)digitViewController;
- (UIVisualEffectView)backgroundView;
- (id)dismissHandler;
- (void)_menuPressed;
- (void)setBackgroundView:(id)a3;
- (void)setClientName:(id)a3;
- (void)setDigitViewController:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setPinCode:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVAirPlayPINViewController

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVAirPlayPINViewController;
  -[TVAirPlayPINViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
  v4 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v3);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  v6 = self->_backgroundView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController view](self, "view"));
  [v7 bounds];
  -[UIVisualEffectView setFrame:](v6, "setFrame:");

  -[UIVisualEffectView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController view](self, "view"));
  [v8 addSubview:self->_backgroundView];

  v9 = -[TVSUIDigitEntryViewController initWithNumberOfDigits:]( objc_alloc(&OBJC_CLASS___TVSUIDigitEntryViewController),  "initWithNumberOfDigits:",  4LL);
  digitViewController = self->_digitViewController;
  self->_digitViewController = v9;

  -[TVSUIDigitEntryViewController setEditable:](self->_digitViewController, "setEditable:", 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController titleLabel](self->_digitViewController, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v11 setTextColor:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController titleLabel](self->_digitViewController, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController title](self, "title"));
  [v13 setText:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController promptLabel](self->_digitViewController, "promptLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v15 setTextColor:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController promptLabel](self->_digitViewController, "promptLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController clientName](self, "clientName"));
  [v17 setText:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController digitGroupView](self->_digitViewController, "digitGroupView"));
  [v19 setText:self->_pinCode];

  -[TVAirPlayPINViewController addChildViewController:](self, "addChildViewController:", self->_digitViewController);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController view](self->_digitViewController, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController view](self, "view"));
  [v21 bounds];
  objc_msgSend(v20, "setFrame:");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController view](self->_digitViewController, "view"));
  [v22 setAutoresizingMask:18];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController view](self->_digitViewController, "view"));
  [v23 addSubview:v24];

  -[TVSUIDigitEntryViewController didMoveToParentViewController:]( self->_digitViewController,  "didMoveToParentViewController:",  self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController traitOverrides](self->_digitViewController, "traitOverrides"));
  [v25 setUserInterfaceStyle:2];

  v26 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v26, "setAllowedPressTypes:", &off_100033530);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPINViewController view](self, "view"));
  [v27 addGestureRecognizer:v26];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVAirPlayPINViewController;
  -[TVAirPlayPINViewController setTitle:](&v6, "setTitle:", v4);
  if (-[TVAirPlayPINViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController titleLabel](self->_digitViewController, "titleLabel"));
    [v5 setText:v4];
  }
}

- (void)setPinCode:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  pinCode = self->_pinCode;
  self->_pinCode = v4;

  if (-[TVAirPlayPINViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController digitGroupView](self->_digitViewController, "digitGroupView"));
    [v6 setText:self->_pinCode];
  }

- (void)setClientName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  clientName = self->_clientName;
  self->_clientName = v4;

  if (-[TVAirPlayPINViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSUIDigitEntryViewController promptLabel](self->_digitViewController, "promptLabel"));
    [v6 setText:self->_clientName];
  }

- (void)_menuPressed
{
  if (!self->_dismissed)
  {
    if (self->_dismissHandler)
    {
      self->_dismissed = 1;
      (*((void (**)(void))self->_dismissHandler + 2))();
    }
  }

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)pinCode
{
  return self->_pinCode;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (TVSUIDigitEntryViewController)digitViewController
{
  return self->_digitViewController;
}

- (void)setDigitViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end