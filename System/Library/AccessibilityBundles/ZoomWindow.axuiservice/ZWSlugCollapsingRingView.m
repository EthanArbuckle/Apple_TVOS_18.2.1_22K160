@interface ZWSlugCollapsingRingView
- (BOOL)shouldUseContinuousCornerRadius;
- (UIImageView)speakFingerImageView;
- (ZWSlugCollapsingRingView)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForExpandedRing;
- (void)layoutSubviews;
- (void)setShouldUseContinuousCornerRadius:(BOOL)a3;
- (void)setSpeakFingerImageView:(id)a3;
@end

@implementation ZWSlugCollapsingRingView

- (ZWSlugCollapsingRingView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ZWSlugCollapsingRingView;
  v3 = -[ZWSlugCollapsingRingView initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](v3, "layer"));
    [v5 setBorderWidth:2.0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](v4, "layer"));
    [v6 setCornerCurve:kCACornerCurveContinuous];

    id v7 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    id v8 = [v7 CGColor];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](v4, "layer"));
    [v9 setBorderColor:v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
    -[ZWSlugCollapsingRingView setEffect:](v4, "setEffect:", v10);

    v11 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v11,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setHidden:](v11, "setHidden:", 1LL);
    -[ZWSlugCollapsingRingView setSpeakFingerImageView:](v4, "setSpeakFingerImageView:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView contentView](v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView speakFingerImageView](v4, "speakFingerImageView"));
    [v12 addSubview:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](v4, "layer"));
    [v14 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView centerXAnchor](v4, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView speakFingerImageView](v4, "speakFingerImageView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 centerXAnchor]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v16]);
    v26[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView centerYAnchor](v4, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView speakFingerImageView](v4, "speakFingerImageView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 centerYAnchor]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v20]);
    v26[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);

    -[ZWSlugCollapsingRingView setShouldUseContinuousCornerRadius:](v4, "setShouldUseContinuousCornerRadius:", 1LL);
  }

  return v4;
}

- (double)_cornerRadiusForExpandedRing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView traitCollection](self, "traitCollection"));
  [v3 displayCornerRadius];
  if (v4 <= 0.0)
  {
    double v7 = 7.8;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView traitCollection](self, "traitCollection"));
    [v5 displayCornerRadius];
    double v7 = v6 / 5.0;
  }

  return v7;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ZWSlugCollapsingRingView;
  -[ZWSlugCollapsingRingView layoutSubviews](&v22, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
  [v3 cornerRadius];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    if (-[ZWSlugCollapsingRingView shouldUseContinuousCornerRadius](self, "shouldUseContinuousCornerRadius"))
    {
      -[ZWSlugCollapsingRingView bounds](self, "bounds");
      double v12 = v11 * 0.5;
    }

    else
    {
      -[ZWSlugCollapsingRingView _cornerRadiusForExpandedRing](self, "_cornerRadiusForExpandedRing");
      double v12 = v17;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v18 setCornerRadius:v12];

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v6 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"cornerRadius"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v7 cornerRadius];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setFromValue:v8];

    if (-[ZWSlugCollapsingRingView shouldUseContinuousCornerRadius](self, "shouldUseContinuousCornerRadius"))
    {
      -[ZWSlugCollapsingRingView bounds](self, "bounds");
      double v10 = v9 * 0.5;
    }

    else
    {
      -[ZWSlugCollapsingRingView _cornerRadiusForExpandedRing](self, "_cornerRadiusForExpandedRing");
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
    [v6 setToValue:v13];

    [v6 setDuration:ZWDefaultZoomAnimationDuration()];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v14 addAnimation:v6 forKey:@"ZWCornerRadius"];

    if (-[ZWSlugCollapsingRingView shouldUseContinuousCornerRadius](self, "shouldUseContinuousCornerRadius"))
    {
      -[ZWSlugCollapsingRingView bounds](self, "bounds");
      double v16 = v15 * 0.5;
    }

    else
    {
      -[ZWSlugCollapsingRingView _cornerRadiusForExpandedRing](self, "_cornerRadiusForExpandedRing");
      double v16 = v19;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v20 setCornerRadius:v16];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView layer](self, "layer"));
    [v21 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
}

- (UIImageView)speakFingerImageView
{
  return self->_speakFingerImageView;
}

- (void)setSpeakFingerImageView:(id)a3
{
}

- (BOOL)shouldUseContinuousCornerRadius
{
  return self->_shouldUseContinuousCornerRadius;
}

- (void)setShouldUseContinuousCornerRadius:(BOOL)a3
{
  self->_shouldUseContinuousCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end