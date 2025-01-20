@interface TVHLoadingViewController
- (TVHLoadingView)loadingView;
- (UIImage)backgroundImage;
- (double)activityIndicatorDelay;
- (void)loadView;
- (void)setActivityIndicatorDelay:(double)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setLoadingView:(id)a3;
@end

@implementation TVHLoadingViewController

- (void)setBackgroundImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHLoadingViewController loadingView](self, "loadingView"));
  [v5 setBackgroundImage:v4];
}

- (UIImage)backgroundImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingViewController loadingView](self, "loadingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundImage]);

  return (UIImage *)v3;
}

- (void)setActivityIndicatorDelay:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHLoadingViewController loadingView](self, "loadingView"));
  [v4 setActivityIndicatorDelay:a3];
}

- (double)activityIndicatorDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLoadingViewController loadingView](self, "loadingView"));
  [v2 activityIndicatorDelay];
  double v4 = v3;

  return v4;
}

- (void)loadView
{
  double v3 = objc_alloc(&OBJC_CLASS___TVHLoadingView);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  id v5 = -[TVHLoadingView initWithFrame:](v3, "initWithFrame:");

  -[TVHLoadingViewController setLoadingView:](self, "setLoadingView:", v5);
  -[TVHLoadingViewController setView:](self, "setView:", v5);
}

- (TVHLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end