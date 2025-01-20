@interface ZWSlugCirclePivotingView
- (BOOL)shouldUseRoundedRect;
- (CAShapeLayer)circleLayer;
- (ZWSlugCirclePivotingView)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForExpandedRing;
- (void)layoutSubviews;
- (void)setCircleLayer:(id)a3;
- (void)setShouldUseRoundedRect:(BOOL)a3;
@end

@implementation ZWSlugCirclePivotingView

- (ZWSlugCirclePivotingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWSlugCirclePivotingView;
  v3 = -[ZWSlugCirclePivotingView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView layer](v3, "layer"));
    [v5 addSublayer:v4];

    -[ZWSlugCirclePivotingView setCircleLayer:](v3, "setCircleLayer:", v4);
    id v6 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));
  }

  return v3;
}

- (double)_cornerRadiusForExpandedRing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView traitCollection](self, "traitCollection"));
  [v3 displayCornerRadius];
  if (v4 <= 0.0)
  {
    double v7 = 7.8;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView traitCollection](self, "traitCollection"));
    [v5 displayCornerRadius];
    double v7 = v6 / 5.0;
  }

  return v7 + -3.0;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ZWSlugCirclePivotingView;
  -[ZWSlugCirclePivotingView layoutSubviews](&v28, "layoutSubviews");
  -[ZWSlugCirclePivotingView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
  objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "path"));

  if (-[ZWSlugCirclePivotingView shouldUseRoundedRect](self, "shouldUseRoundedRect"))
  {
    -[ZWSlugCirclePivotingView _cornerRadiusForExpandedRing](self, "_cornerRadiusForExpandedRing");
    id v14 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v13));
    objc_msgSend(v11, "setToValue:", objc_msgSend(v14, "CGPath"));

    -[ZWSlugCirclePivotingView _cornerRadiusForExpandedRing](self, "_cornerRadiusForExpandedRing");
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v4,  v6,  v8,  v10,  v15));
  }

  else
  {
    id v17 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithOvalInRect:", v4, v6, v8, v10));
    objc_msgSend(v11, "setToValue:", objc_msgSend(v17, "CGPath"));

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithOvalInRect:",  v4,  v6,  v8,  v10));
  }

  id v18 = v16;
  v19 = (const CGPath *)[v18 CGPath];

  [v11 setDuration:ZWDefaultZoomAnimationDuration()];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
  BOOL v21 = CGPathEqualToPath((CGPathRef)[v20 path], v19);

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
    [v22 addAnimation:v11 forKey:@"ZWCirclePath"];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
    [v23 setPath:v19];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
    objc_msgSend(v24, "setBounds:", v4, v6, v8, v10);

    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    double MidX = CGRectGetMidX(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    double MidY = CGRectGetMidY(v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugCirclePivotingView circleLayer](self, "circleLayer"));
    objc_msgSend(v27, "setPosition:", MidX, MidY);
  }
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (BOOL)shouldUseRoundedRect
{
  return self->_shouldUseRoundedRect;
}

- (void)setShouldUseRoundedRect:(BOOL)a3
{
  self->_shouldUseRoundedRect = a3;
}

- (void).cxx_destruct
{
}

@end