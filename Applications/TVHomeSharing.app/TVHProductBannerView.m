@interface TVHProductBannerView
+ (TVHProductBannerView)new;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHMediaImageView)imageView;
- (TVHProductBannerView)init;
- (TVHProductBannerView)initWithCoder:(id)a3;
- (TVHProductBannerView)initWithFrame:(CGRect)a3;
- (TVHProductBannerView)initWithStyle:(unint64_t)a3;
- (TVHProductCreditsView)creditsView;
- (TVHProductInfoView)infoView;
- (id)preferredFocusEnvironments;
- (unint64_t)style;
- (void)layoutSubviews;
@end

@implementation TVHProductBannerView

+ (TVHProductBannerView)new
{
  return 0LL;
}

- (TVHProductBannerView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHProductBannerView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHProductBannerView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHProductBannerView)initWithStyle:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHProductBannerView;
  v4 = -[TVHFocusRedirectView initWithFrame:]( &v13,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = objc_alloc_init(&OBJC_CLASS___TVHProductInfoView);
    infoView = v5->_infoView;
    v5->_infoView = v6;

    -[TVHProductInfoView tvh_setDebugLayoutColorType:](v5->_infoView, "tvh_setDebugLayoutColorType:", 7LL);
    -[TVHProductBannerView addSubview:](v5, "addSubview:", v5->_infoView);
    v8 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
    imageView = v5->_imageView;
    v5->_imageView = v8;

    -[TVHMediaImageView tvh_setDebugLayoutColorType:](v5->_imageView, "tvh_setDebugLayoutColorType:", 11LL);
    -[TVHProductBannerView addSubview:](v5, "addSubview:", v5->_imageView);
    if (!v5->_style)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___TVHProductCreditsView);
      creditsView = v5->_creditsView;
      v5->_creditsView = v10;

      -[TVHProductCreditsView tvh_setDebugLayoutColorType:](v5->_creditsView, "tvh_setDebugLayoutColorType:", 8LL);
      -[TVHProductBannerView tvh_safeAddSubview:](v5, "tvh_safeAddSubview:", v5->_creditsView);
    }
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductBannerView infoView](self, "infoView"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductBannerView creditsView](self, "creditsView", a3.width, a3.height));
  BOOL v5 = v4 == 0LL;

  double v6 = dbl_1000C34B0[v5];
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHProductBannerView;
  -[TVHFocusRedirectView layoutSubviews](&v18, "layoutSubviews");
  -[TVHProductBannerView bounds](self, "bounds");
  double v4 = v3;
  id v5 = -[TVHProductBannerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductBannerView creditsView](self, "creditsView"));
  double v7 = v6;
  if (v6)
  {
    double v8 = v4 + -280.0 + -60.0;
    if (!v5) {
      double v8 = 60.0;
    }
    objc_msgSend(v6, "setFrame:", v8, 234.0, 280.0, 432.0);
    double v9 = 388.0;
    double v10 = 625.0;
  }

  else
  {
    double v9 = 180.0;
    double v10 = 669.0;
  }

  if (v5) {
    double v11 = v4 + -806.0 - v9;
  }
  else {
    double v11 = v9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductBannerView infoView](self, "infoView"));
  objc_msgSend(v12, "setFrame:", v11, 60.0, 806.0, v10);

  double v13 = v11;
  uint64_t v14 = 0x404E000000000000LL;
  uint64_t v15 = 0x4089300000000000LL;
  double v16 = v10;
  if (v5) {
    CGRectGetMinX(*(CGRect *)&v13);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v13);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductBannerView imageView](self, "imageView"));
  [v17 sizeToFit];
  UIRectCenteredIntegralRect([v17 frame]);
  objc_msgSend(v17, "setFrame:");
}

- (unint64_t)style
{
  return self->_style;
}

- (TVHProductInfoView)infoView
{
  return self->_infoView;
}

- (TVHMediaImageView)imageView
{
  return self->_imageView;
}

- (TVHProductCreditsView)creditsView
{
  return self->_creditsView;
}

- (void).cxx_destruct
{
}

@end