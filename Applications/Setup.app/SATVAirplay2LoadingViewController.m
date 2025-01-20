@interface SATVAirplay2LoadingViewController
- (UIActivityIndicatorView)_activityIndicatorView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVAirplay2LoadingViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2LoadingViewController;
  -[SATVAirplay2LoadingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2LoadingViewController _activityIndicatorView](self, "_activityIndicatorView"));
  [v3 setBackgroundView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVAirplay2LoadingViewController;
  -[SATVPreviewTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2LoadingViewController _activityIndicatorView](self, "_activityIndicatorView"));
  [v4 startAnimating];
}

- (UIActivityIndicatorView)_activityIndicatorView
{
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    objc_super v5 = self->_activityIndicatorView;
    self->_activityIndicatorView = v4;

    activityIndicatorView = self->_activityIndicatorView;
  }

  return activityIndicatorView;
}

- (void).cxx_destruct
{
}

@end