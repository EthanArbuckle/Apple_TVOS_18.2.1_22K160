@interface TVHErrorViewController
- (NSString)messageText;
- (TVHErrorView)errorView;
- (TVHErrorViewController)init;
- (TVHErrorViewController)initWithCoder:(id)a3;
- (TVHErrorViewController)initWithMessage:(id)a3;
- (TVHErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setErrorView:(id)a3;
- (void)setMessageText:(id)a3;
@end

@implementation TVHErrorViewController

- (TVHErrorViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHErrorViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHErrorViewController)initWithMessage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHErrorViewController;
  v5 = -[TVHErrorViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___TVHErrorView);
    errorView = v5->_errorView;
    v5->_errorView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHErrorView messageLabel](v5->_errorView, "messageLabel"));
    [v8 setText:v4];
  }

  return v5;
}

- (void)setMessageText:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHErrorViewController errorView](self, "errorView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 messageLabel]);
  [v5 setText:v4];
}

- (NSString)messageText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHErrorViewController errorView](self, "errorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 messageLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHErrorViewController errorView](self, "errorView"));
  -[TVHErrorViewController setView:](self, "setView:", v3);
}

- (TVHErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end