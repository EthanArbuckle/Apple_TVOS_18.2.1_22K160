@interface TVSettingsRegulatoryViewController
- (TVSettingsImageView)imageView;
- (id)_regulatoryImage;
- (void)setImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVSettingsRegulatoryViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsRegulatoryViewController;
  -[TVSettingsRegulatoryViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegulatoryViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegulatoryViewController _regulatoryImage](self, "_regulatoryImage"));
  v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsImageView);
  imageView = self->_imageView;
  self->_imageView = v5;

  -[TVSettingsImageView setImage:](self->_imageView, "setImage:", v4);
  -[TVSettingsImageView setContentMode:](self->_imageView, "setContentMode:", 1LL);
  [v3 addSubview:self->_imageView];
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsRegulatoryViewController;
  -[TVSettingsRegulatoryViewController viewDidLayoutSubviews](&v17, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegulatoryViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  double v12 = v11 + -206.0 + -20.0;
  -[TVSettingsImageView sizeThatFits:](self->_imageView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v15 = v13;
  if (v14 <= v12) {
    double v12 = v14;
  }
  else {
    double v15 = v13 * (v12 / v14 + 206.0);
  }
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double Width = CGRectGetWidth(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v15;
  v19.size.height = v12;
  -[TVSettingsImageView setFrame:](self->_imageView, "setFrame:", (Width - CGRectGetWidth(v19)) * 0.5, 206.0, v15, v12);
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsRegulatoryViewController;
  id v4 = a3;
  -[TVSettingsRegulatoryViewController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRegulatoryViewController traitCollection]( self,  "traitCollection",  v12.receiver,  v12.super_class));
  [v5 displayScale];
  double v7 = v6;

  [v4 displayScale];
  double v9 = v8;

  if (v9 != v7)
  {
    imageView = self->_imageView;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegulatoryViewController _regulatoryImage](self, "_regulatoryImage"));
    -[TVSettingsImageView setImage:](imageView, "setImage:", v11);
  }

- (id)_regulatoryImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[TVSDevice modelNumber](&OBJC_CLASS___TVSDevice, "modelNumber"));
  id v4 = (void *)MGCopyAnswer(@"HWModelStr", 0LL);
  if (!v3)
  {
    if ([v2 hasPrefix:@"AppleTV5,"])
    {
      v3 = @"A1625";
    }

    else if ([v2 hasPrefix:@"AppleTV6,"])
    {
      v3 = @"A1842";
    }

    else if ([v2 hasPrefix:@"AppleTV11,"])
    {
      v3 = @"A2169";
    }

    else
    {
      v3 = 0LL;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000F79BC((uint64_t)v3);
    }
  }

  uint64_t v5 = SFBuiltInRegulatoryImageForModelAndVariant(v4, v3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (TVSettingsImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end