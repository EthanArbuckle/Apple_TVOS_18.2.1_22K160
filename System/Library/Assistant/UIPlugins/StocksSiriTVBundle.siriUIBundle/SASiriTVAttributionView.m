@interface SASiriTVAttributionView
- (SASiriTVAttributionView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UIVisualEffectView)effectView;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)setEffectView:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation SASiriTVAttributionView

- (SASiriTVAttributionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SASiriTVAttributionView;
  v3 = -[SASiriTVAttributionView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    -[SASiriTVAttributionView _createSubviews](v4, "_createSubviews");
    -[SASiriTVAttributionView _createConstraints](v4, "_createConstraints");
  }

  return v4;
}

- (void)_createSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v3));

  v4 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v11);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[SASiriTVAttributionView addSubview:](self, "addSubview:", v4);
  -[SASiriTVAttributionView setEffectView:](self, "setEffectView:", v4);
  v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"ATV-Yahoo-Logo",  v6,  0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageWithRenderingMode:2]);

  v9 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v8);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4, "contentView"));
  [v10 addSubview:v9];

  -[SASiriTVAttributionView setImageView:](self, "setImageView:", v9);
}

- (void)_createConstraints
{
  id v23 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  5LL,  0LL,  self,  5LL,  1.0,  0.0));
  [v23 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  6LL,  0LL,  self,  6LL,  1.0,  0.0));
  [v23 addObject:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  [v23 addObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  4LL,  0LL,  self,  4LL,  1.0,  0.0));
  [v23 addObject:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView imageView](self, "imageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  5LL,  0LL,  v12,  5LL,  1.0,  0.0));
  [v23 addObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView imageView](self, "imageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  6LL,  0LL,  v15,  6LL,  1.0,  0.0));
  [v23 addObject:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView imageView](self, "imageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  3LL,  0LL,  v18,  3LL,  1.0,  0.0));
  [v23 addObject:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView imageView](self, "imageView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SASiriTVAttributionView effectView](self, "effectView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  4LL,  0LL,  v21,  4LL,  1.0,  0.0));
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end