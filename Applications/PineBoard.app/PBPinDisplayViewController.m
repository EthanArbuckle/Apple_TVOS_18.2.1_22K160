@interface PBPinDisplayViewController
- (OS_dispatch_source)timerSource;
- (PBPinDisplayViewController)initWithNumberOfDigits:(unint64_t)a3 separatorIndexes:(id)a4;
- (double)timeout;
- (id)dismissalCompletion;
- (void)_cancelTimer;
- (void)_dismissViewControllerWithValue:(BOOL)a3;
- (void)_handleHomeButton:(id)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_startTimerIfNecessary;
- (void)dealloc;
- (void)setDismissalCompletion:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimerSource:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PBPinDisplayViewController

- (PBPinDisplayViewController)initWithNumberOfDigits:(unint64_t)a3 separatorIndexes:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBPinDisplayViewController;
  v4 = -[PBPinDisplayViewController initWithNumberOfDigits:separatorIndexes:]( &v7,  "initWithNumberOfDigits:separatorIndexes:",  a3,  a4);
  v5 = v4;
  if (v4)
  {
    v4->_timeout = -1.0;
    -[PBPinDisplayViewController setEditable:](v4, "setEditable:", 0LL);
    -[PBPinDisplayViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBPinDisplayViewController dismissalCompletion]( self,  "dismissalCompletion"));
  id dismissalCompletion = self->_dismissalCompletion;
  self->_id dismissalCompletion = 0LL;

  if (v3) {
    v3[2](v3, 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBPinDisplayViewController;
  -[PBPinDisplayViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBPinDisplayViewController;
  -[PBPinDisplayViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPinDisplayViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPinDisplayViewController titleLabel](self, "titleLabel"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v4 setTextColor:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPinDisplayViewController promptLabel](self, "promptLabel"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v6 setTextColor:v7];

  v8 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_1003FE7A0);
  [v3 addGestureRecognizer:v8];
  v9 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v9, "setAllowedPressTypes:", &off_1003FE7B8);
  [v3 addGestureRecognizer:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBPinDisplayViewController;
  -[PBPinDisplayViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PBPinDisplayViewController _startTimerIfNecessary](self, "_startTimerIfNecessary");
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = sub_100082C04();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[PBPinDisplayViewController _handleMenuButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[PBPinDisplayViewController _dismissViewControllerWithValue:](self, "_dismissViewControllerWithValue:", 1LL);
}

- (void)_handleHomeButton:(id)a3
{
  id v4 = sub_100082C04();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[PBPinDisplayViewController _handleHomeButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[PBPinDisplayViewController _dismissViewControllerWithValue:](self, "_dismissViewControllerWithValue:", 1LL);
}

- (void)_dismissViewControllerWithValue:(BOOL)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPinDisplayViewController dismissalCompletion](self, "dismissalCompletion"));
  -[PBPinDisplayViewController setDismissalCompletion:](self, "setDismissalCompletion:", 0LL);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPinDisplayViewController presentingViewController](self, "presentingViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001496FC;
  v8[3] = &unk_1003D4980;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

- (void)_startTimerIfNecessary
{
  if (!self->_timerSource && self->_timeout > 0.0)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    timerSource = self->_timerSource;
    self->_timerSource = v3;

    objc_super v5 = self->_timerSource;
    dispatch_time_t v6 = dispatch_time(0LL, llround(self->_timeout * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    id v7 = self->_timerSource;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100149848;
    v8[3] = &unk_1003D0890;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel((dispatch_source_t)timerSource);
    id v4 = self->_timerSource;
    self->_timerSource = 0LL;
  }

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end