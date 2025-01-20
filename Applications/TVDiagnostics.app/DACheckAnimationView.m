@interface DACheckAnimationView
+ (Class)layerClass;
- (CAShapeLayer)check;
- (DACheckAnimationView)initWithColor:(id)a3 lineWidth:(double)a4 scale:(double)a5;
- (DACheckAnimationView)initWithFrame:(CGRect)a3 color:(id)a4 scale:(double)a5;
- (UIColor)strokeColor;
- (id)animationCompletion;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)hideCheck;
- (void)layoutSubviews;
- (void)playCheckAnimationWithCompletion:(id)a3;
- (void)setAnimationCompletion:(id)a3;
- (void)setCheck:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)showCheck;
@end

@implementation DACheckAnimationView

- (DACheckAnimationView)initWithFrame:(CGRect)a3 color:(id)a4 scale:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___DACheckAnimationView;
  v12 = -[DACheckAnimationView initWithFrame:](&v31, "initWithFrame:", x, y, width, height);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
    objc_msgSend(v13, "moveToPoint:", 0.0, 10.0);
    objc_msgSend(v13, "addLineToPoint:", 10.0, 18.0);
    objc_msgSend(v13, "addLineToPoint:", 24.0, 0.0);
    CGAffineTransformMakeScale(&v30, a5, a5);
    [v13 applyTransform:&v30];
    -[DACheckAnimationView setStrokeColor:](v12, "setStrokeColor:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView layer](v12, "layer"));
    -[DACheckAnimationView setCheck:](v12, "setCheck:", v14);

    id v15 = v13;
    id v16 = [v15 CGPath];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v17 setPath:v16];

    id v18 = objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](v12, "strokeColor"));
    id v19 = [v18 CGColor];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v20 setStrokeColor:v19];

    id v21 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    id v22 = [v21 CGColor];
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v23 setFillColor:v22];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v24 setLineWidth:5.0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v25 setStrokeStart:0.0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v26 setStrokeEnd:0.0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v27 setLineCap:kCALineCapRound];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    [v28 setLineJoin:kCALineJoinRound];
  }

  return v12;
}

- (DACheckAnimationView)initWithColor:(id)a3 lineWidth:(double)a4 scale:(double)a5
{
  v6 = -[DACheckAnimationView initWithFrame:color:scale:]( self,  "initWithFrame:color:scale:",  a3,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height,  a5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v6, "check"));
    [v8 setLineWidth:a4];
  }

  return v7;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CAShapeLayer);
}

- (void)hideCheck
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  [v2 setStrokeEnd:0.0];
}

- (void)showCheck
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  [v2 setStrokeEnd:1.0];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v5 = objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor"));
  id v3 = [v5 CGColor];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  [v4 setStrokeColor:v3];
}

- (void)layoutSubviews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  id v4 = [v3 strokeColor];
  id v5 = objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor"));
  id v6 = [v5 CGColor];

  if (v4 != v6)
  {
    id v7 = objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor"));
    id v8 = [v7 CGColor];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
    [v9 setStrokeColor:v8];
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DACheckAnimationView;
  -[DACheckAnimationView layoutSubviews](&v10, "layoutSubviews");
}

- (void)playCheckAnimationWithCompletion:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  [v4 setStrokeEnd:1.0];

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd"));
  [v8 setDuration:0.375];
  [v8 setFillMode:kCAFillModeBoth];
  [v8 setBeginTime:CACurrentMediaTime() + 0.150000006];
  [v8 setFromValue:&off_10002E8F0];
  [v8 setToValue:&off_10002E900];
  [v8 setDelegate:self];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
  [v8 setTimingFunction:v5];

  LODWORD(v6) = 1.0;
  [v8 setRepeatCount:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  [v7 addAnimation:v8 forKey:@"strokeEndAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView animationCompletion](self, "animationCompletion", a3));

  if (v6)
  {
    id v7 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue(-[DACheckAnimationView animationCompletion](self, "animationCompletion"));
    v7[2](v7, v4);
  }

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (CAShapeLayer)check
{
  return self->_check;
}

- (void)setCheck:(id)a3
{
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end