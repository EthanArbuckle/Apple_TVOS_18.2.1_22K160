@interface CSVSAuthenticationContentViewController
- (CSVSAuthenticationContentConfiguration)configuration;
- (void)_applyBodyConfiguration;
- (void)_applyConfiguration;
- (void)_applyImageConfiguration;
- (void)_applyTitleConfiguration;
- (void)setConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSVSAuthenticationContentViewController

- (void)viewDidLoad
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationContentViewController;
  -[CSVSAuthenticationContentViewController viewDidLoad](&v50, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  v5 = self->_imageView;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  200.0));
  -[UIImageView setPreferredSymbolConfiguration:](v5, "setPreferredSymbolConfiguration:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v7 setCornerCurve:kCACornerCurveContinuous];

  v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
  titleTextLabel = self->_titleTextLabel;
  self->_titleTextLabel = v8;

  v10 = self->_titleTextLabel;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle3,  1024LL));
  -[UILabel setFont:](v10, "setFont:", v11);

  -[UILabel setTextAlignment:](self->_titleTextLabel, "setTextAlignment:", 1LL);
  v12 = self->_titleTextLabel;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  -[UILabel setNumberOfLines:](self->_titleTextLabel, "setNumberOfLines:", 2LL);
  v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
  bodyTextLabel = self->_bodyTextLabel;
  self->_bodyTextLabel = v14;

  v16 = self->_bodyTextLabel;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v16, "setFont:", v17);

  -[UILabel setTextAlignment:](self->_bodyTextLabel, "setTextAlignment:", 1LL);
  v18 = self->_bodyTextLabel;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v18, "setTextColor:", v19);

  -[UILabel setNumberOfLines:](self->_bodyTextLabel, "setNumberOfLines:", 0LL);
  v20 = objc_alloc(&OBJC_CLASS___UIStackView);
  v21 = self->_titleTextLabel;
  v52[0] = self->_imageView;
  v52[1] = v21;
  v52[2] = self->_bodyTextLabel;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 3LL));
  v23 = -[UIStackView initWithArrangedSubviews:](v20, "initWithArrangedSubviews:", v22);

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v23,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setAlignment:](v23, "setAlignment:", 3LL);
  -[UIStackView setAxis:](v23, "setAxis:", 1LL);
  -[UIStackView setBaselineRelativeArrangement:](v23, "setBaselineRelativeArrangement:", 1LL);
  -[UIStackView setCustomSpacing:afterView:](v23, "setCustomSpacing:afterView:", self->_imageView, 105.0);
  -[UIStackView setCustomSpacing:afterView:](v23, "setCustomSpacing:afterView:", self->_titleTextLabel, 50.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  [v24 addSubview:v23];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v23, "centerXAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v49 centerXAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
  v51[0] = v46;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v23, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 centerYAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43]);
  v51[1] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v23, "widthAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 widthAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintLessThanOrEqualToAnchor:v39]);
  v51[2] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](v23, "heightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v37 heightAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintLessThanOrEqualToAnchor:v35]);
  v51[3] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_titleTextLabel, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 widthAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintLessThanOrEqualToAnchor:v26]);
  v51[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_bodyTextLabel, "widthAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 widthAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintLessThanOrEqualToAnchor:v30]);
  v51[5] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 6LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v32);

  -[CSVSAuthenticationContentViewController _applyConfiguration](self, "_applyConfiguration");
}

- (void)setConfiguration:(id)a3
{
  v4 = (CSVSAuthenticationContentConfiguration *)[a3 copy];
  configuration = self->_configuration;
  self->_configuration = v4;

  -[CSVSAuthenticationContentViewController _applyConfiguration](self, "_applyConfiguration");
}

- (void)_applyConfiguration
{
  if (-[CSVSAuthenticationContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CSVSAuthenticationContentViewController _applyImageConfiguration](self, "_applyImageConfiguration");
    -[CSVSAuthenticationContentViewController _applyTitleConfiguration](self, "_applyTitleConfiguration");
    -[CSVSAuthenticationContentViewController _applyBodyConfiguration](self, "_applyBodyConfiguration");
  }

- (void)_applyImageConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration image](self->_configuration, "image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
  [v9 cornerRadius];
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
  id v13 = objc_claimAutoreleasedReturnValue([v12 shadowColor]);
  id v14 = [v13 CGColor];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
  id v16 = [v15 contentMode];

  -[UIImageView setImage:](self->_imageView, "setImage:", v3);
  -[UIImageView setHidden:](self->_imageView, "setHidden:", v3 == 0LL);
  if (v3 && (v6 != 0.0 || v8 != 0.0))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToConstant:v6]);

    LODWORD(v19) = 1144750080;
    [v18 setPriority:v19];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToConstant:v8]);

    LODWORD(v22) = 1144750080;
    [v21 setPriority:v22];
    v59[0] = v18;
    v59[1] = v21;
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
    imageSizeConstraints = self->_imageSizeConstraints;
    self->_imageSizeConstraints = v23;

    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_imageSizeConstraints);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v25 setCornerRadius:v11];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v26 setMasksToBounds:fabs(v11) >= 2.22044605e-16];

  imageShadowView = self->_imageShadowView;
  if (v14)
  {
    if (!imageShadowView)
    {
      v28 = objc_alloc_init(&OBJC_CLASS____CSVSImageShadowView);
      v29 = self->_imageShadowView;
      self->_imageShadowView = &v28->super;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_imageShadowView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentViewController view](self, "view"));
      [v30 insertSubview:self->_imageShadowView atIndex:0];

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_imageShadowView, "leadingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v55]);
      v58[0] = v54;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_imageShadowView, "trailingAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_imageView, "trailingAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v52]);
      v58[1] = v51;
      objc_super v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_imageShadowView, "topAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_imageView, "topAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v49]);
      v58[2] = v48;
      v57 = v3;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_imageShadowView, "bottomAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_imageView, "bottomAnchor"));
      id v33 = v16;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
      v58[3] = v34;
      id v35 = v14;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v36);

      id v14 = v35;
      id v16 = v33;

      v3 = v57;
      imageShadowView = self->_imageShadowView;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](imageShadowView, "layer"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
    [v38 shadowRadius];
    objc_msgSend(v37, "setShadowRadius:");

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_imageShadowView, "layer"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
    [v40 shadowOffset];
    objc_msgSend(v39, "setShadowOffset:");

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_imageShadowView, "layer"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration imageProperties](self->_configuration, "imageProperties"));
    [v42 shadowOpacity];
    *(float *)&double v43 = v43;
    [v41 setShadowOpacity:v43];

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_imageShadowView, "layer"));
    [v44 setShadowColor:v14];

    v45 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  CGPointZero.x,  CGPointZero.y,  v6,  v8,  v11));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_imageShadowView, "layer"));
    v47 = v45;
    objc_msgSend(v46, "setShadowPath:", -[UIView CGPath](v47, "CGPath"));
  }

  else
  {
    -[UIView removeFromSuperview](imageShadowView, "removeFromSuperview");
    v47 = self->_imageShadowView;
    self->_imageShadowView = 0LL;
  }

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v16);
}

- (void)_applyTitleConfiguration
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration titleText](self->_configuration, "titleText"));
  -[UILabel setText:](self->_titleTextLabel, "setText:", v3);
  -[UILabel setHidden:](self->_titleTextLabel, "setHidden:", v3 == 0LL);
}

- (void)_applyBodyConfiguration
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentConfiguration bodyText](self->_configuration, "bodyText"));
  -[UILabel setText:](self->_bodyTextLabel, "setText:", v3);
  -[UILabel setHidden:](self->_bodyTextLabel, "setHidden:", v3 == 0LL);
}

- (CSVSAuthenticationContentConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end