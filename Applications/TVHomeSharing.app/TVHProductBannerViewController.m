@interface TVHProductBannerViewController
+ (TVHProductBannerViewController)new;
- (TVHProductBannerView)bannerView;
- (TVHProductBannerViewController)init;
- (TVHProductBannerViewController)initWithCoder:(id)a3;
- (TVHProductBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHProductBannerViewController)initWithStyle:(unint64_t)a3;
- (void)loadView;
@end

@implementation TVHProductBannerViewController

+ (TVHProductBannerViewController)new
{
  return 0LL;
}

- (TVHProductBannerViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHProductBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHProductBannerViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHProductBannerViewController)initWithStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHProductBannerViewController;
  v4 = -[TVHProductBannerViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  if (v4)
  {
    v5 = -[TVHProductBannerView initWithStyle:](objc_alloc(&OBJC_CLASS___TVHProductBannerView), "initWithStyle:", a3);
    bannerView = v4->_bannerView;
    v4->_bannerView = v5;
  }

  return v4;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductBannerViewController bannerView](self, "bannerView"));
  -[TVHProductBannerViewController setView:](self, "setView:", v3);
}

- (TVHProductBannerView)bannerView
{
  return self->_bannerView;
}

- (void).cxx_destruct
{
}

@end