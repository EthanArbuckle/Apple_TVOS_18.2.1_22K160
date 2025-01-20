@interface TVAirPlayPresentationViewController
- (CALayer)presentationLayer;
- (PBSPlayPauseButtonEventAssertion)playPauseAssertion;
- (TVAirPlayPresentationSession)session;
- (TVAirPlayPresentationView)presentationView;
- (TVAirPlayPresentationViewController)initWithCoder:(id)a3;
- (TVAirPlayPresentationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVAirPlayPresentationViewController)initWithSession:(id)a3;
- (id)preferredFocusEnvironments;
- (unint64_t)stopCount;
- (void)_buttonPressed:(id)a3;
- (void)_swipeGesture:(id)a3;
- (void)hideProgress;
- (void)setPresentationView:(id)a3;
- (void)setStopCount:(unint64_t)a3;
- (void)showProgress;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVAirPlayPresentationViewController

- (TVAirPlayPresentationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[TVAirPlayPresentationViewController initWithSession:](self, "initWithSession:", 0LL, a4);
}

- (TVAirPlayPresentationViewController)initWithCoder:(id)a3
{
  return -[TVAirPlayPresentationViewController initWithSession:](self, "initWithSession:", 0LL);
}

- (TVAirPlayPresentationViewController)initWithSession:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationViewController;
  v6 = -[TVAirPlayPresentationViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 presentationView]);
    presentationView = v7->_presentationView;
    v7->_presentationView = (TVAirPlayPresentationView *)v8;

    v10 = objc_alloc(&OBJC_CLASS___PBSPlayPauseButtonEventAssertion);
    v11 = (objc_class *)objc_opt_class(v7);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = -[PBSPlayPauseButtonEventAssertion initWithIdentifier:](v10, "initWithIdentifier:", v13);
    playPauseAssertion = v7->_playPauseAssertion;
    v7->_playPauseAssertion = v14;
  }

  return v7;
}

- (id)preferredFocusEnvironments
{
  if (self->_presentationView)
  {
    presentationView = self->_presentationView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &presentationView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationViewController;
  -[TVAirPlayPresentationViewController viewDidLoad](&v15, "viewDidLoad");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationViewController view](self, "view"));
  [v14 addSubview:self->_presentationView];
  v13 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "_swipeGesture:");
  -[UISwipeGestureRecognizer setDirection:](v13, "setDirection:", 2LL);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v13);
  v12 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "_swipeGesture:");
  -[UISwipeGestureRecognizer setDirection:](v12, "setDirection:", 1LL);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v12);
  v11 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "_swipeGesture:");
  -[UISwipeGestureRecognizer setDirection:](v11, "setDirection:", 4LL);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v11);
  v10 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "_swipeGesture:");
  -[UISwipeGestureRecognizer setDirection:](v10, "setDirection:", 8LL);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v10);
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_100033488);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v3);
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_1000334A0);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v4);
  id v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1000334B8);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v5);
  v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1000334D0);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v6);
  v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_1000334E8);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v7);
  uint64_t v8 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_100033500);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v8);
  v9 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_buttonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_100033518);
  -[TVAirPlayPresentationView addGestureRecognizer:](self->_presentationView, "addGestureRecognizer:", v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationViewController;
  -[TVAirPlayPresentationViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PBSPlayPauseButtonEventAssertion acquire](self->_playPauseAssertion, "acquire");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationViewController;
  -[TVAirPlayPresentationViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[PBSPlayPauseButtonEventAssertion relinquish](self->_playPauseAssertion, "relinquish");
}

- (void)_swipeGesture:(id)a3
{
  unint64_t v4 = (unint64_t)[a3 direction] - 1;
  if (v4 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    id v5 = off_100030F10[v4];
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationSession delegate](self->_session, "delegate"));
    [v6 session:self->_session didPerformEvent:v5 withInfo:0];
  }

- (void)_buttonPressed:(id)a3
{
  v13 = @"sessionID";
  session = self->_session;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TVAirPlayPresentationSession sessionID](session, "sessionID")));
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allowedPressTypes]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v10 = [v9 integerValue];

  v11 = @"userPrevious";
  switch((unint64_t)v10)
  {
    case 0uLL:
      v11 = @"userUp";
      goto LABEL_8;
    case 1uLL:
      v11 = @"userDown";
      goto LABEL_8;
    case 2uLL:
      goto LABEL_8;
    case 3uLL:
      v11 = @"userNext";
      goto LABEL_8;
    case 4uLL:
      v11 = @"userSelect";
      goto LABEL_8;
    case 5uLL:
      -[TVAirPlayPresentationSession userStop](self->_session, "userStop");
      break;
    case 6uLL:
      v11 = @"userPlayPause";
LABEL_8:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationSession delegate](self->_session, "delegate"));
      [v12 session:self->_session didPerformEvent:v11 withInfo:v7];

      break;
    default:
      break;
  }
}

- (CALayer)presentationLayer
{
  return (CALayer *)-[TVAirPlayPresentationView presentationLayer](self->_presentationView, "presentationLayer");
}

- (void)showProgress
{
}

- (void)hideProgress
{
}

- (TVAirPlayPresentationSession)session
{
  return self->_session;
}

- (TVAirPlayPresentationView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (unint64_t)stopCount
{
  return self->_stopCount;
}

- (void)setStopCount:(unint64_t)a3
{
  self->_stopCount = a3;
}

- (PBSPlayPauseButtonEventAssertion)playPauseAssertion
{
  return self->_playPauseAssertion;
}

- (void).cxx_destruct
{
}

@end