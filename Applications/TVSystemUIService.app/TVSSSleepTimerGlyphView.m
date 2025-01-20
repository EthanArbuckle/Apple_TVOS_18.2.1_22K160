@interface TVSSSleepTimerGlyphView
+ (CGAffineTransform)currentRotationTransformForPercentComplete:(SEL)a3;
+ (CGPath)arcPathForBounds:(CGRect)a3 percentComplete:(double)a4 timerSize:(unint64_t)a5;
+ (CGPath)circlePathForBounds:(CGRect)a3 timerSize:(unint64_t)a4;
+ (double)lineWidthForTimerSize:(unint64_t)a3;
+ (id)staticTimerImageForTimerSize:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)constraints;
- (TVSSSleepTimerGlyphView)initWithFrame:(CGRect)a3;
- (UIImageView)timerHandView;
- (_TVSSSleepTimerShapeView)gutterView;
- (_TVSSSleepTimerShapeView)progressView;
- (double)percentComplete;
- (unint64_t)timerSize;
- (void)_updateConstraintsForTimerSize:(unint64_t)a3;
- (void)_updateLayerLineWidth;
- (void)_updateTintColor;
- (void)layoutSubviews;
- (void)setPercentComplete:(double)a3;
- (void)setTimerSize:(unint64_t)a3;
- (void)tintColorDidChange;
@end

@implementation TVSSSleepTimerGlyphView

+ (id)staticTimerImageForTimerSize:(unint64_t)a3
{
  id v24 = a1;
  SEL v23 = a2;
  v22 = (void *)a3;
  v21 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"clockhand");
  double v20 = 1.0;
  sub_100017F64();
  double v18 = v3 + 1.0 + 2.0;
  double v19 = v4 + 1.0 + 2.0;
  [v24 lineWidthForTimerSize:v22];
  v17 = v5;
  v16 = -[UIGraphicsImageRenderer initWithSize:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithSize:",  v18,  v19);
  v7 = v16;
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_100017F90;
  v13 = &unk_1001B64F8;
  v14[1] = COERCE_ID(1.0);
  v14[2] = v17;
  v14[3] = v24;
  v14[4] = v22;
  v14[0] = v21;
  v15 = -[UIGraphicsImageRenderer imageWithActions:](v7, "imageWithActions:", &v9);
  v8 = -[UIImage imageWithRenderingMode:](v15, "imageWithRenderingMode:", 2LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v8;
}

  ;
}

- (TVSSSleepTimerGlyphView)initWithFrame:(CGRect)a3
{
  CGRect v23 = a3;
  SEL v21 = a2;
  p_isa = 0LL;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerGlyphView;
  double v18 = -[TVSSSleepTimerGlyphView initWithFrame:]( &v20,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  p_isa = (id *)&v18->super.super.super.isa;
  objc_storeStrong((id *)&p_isa, v18);
  if (v18)
  {
    [p_isa setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = [p_isa layer];
    [v12 setAllowsGroupBlending:0];

    double v3 = objc_alloc_init(&OBJC_CLASS____TVSSSleepTimerShapeView);
    id v4 = p_isa[3];
    p_isa[3] = v3;

    id v14 = [p_isa[3] shapeLayer];
    v13 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    objc_msgSend(v14, "setFillColor:", -[UIColor CGColor](v13, "CGColor"));

    [p_isa[3] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[3]];
    v5 = objc_alloc_init(&OBJC_CLASS____TVSSSleepTimerShapeView);
    id v6 = p_isa[4];
    p_isa[4] = v5;

    id v15 = [p_isa[4] shapeLayer];
    [v15 setLineCap:kCALineCapRound];

    id v17 = [p_isa[4] shapeLayer];
    v16 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    objc_msgSend(v17, "setFillColor:", -[UIColor CGColor](v16, "CGColor"));

    [p_isa[4] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[4]];
    double v19 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"clockhand");
    v7 = objc_alloc(&OBJC_CLASS___UIImageView);
    v8 = -[UIImageView initWithImage:](v7, "initWithImage:", v19);
    id v9 = p_isa[5];
    p_isa[5] = v8;

    [p_isa[5] setContentMode:1];
    [p_isa[5] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[5]];
    objc_storeStrong(p_isa + 6, &__NSArray0__struct);
    [p_isa _updateConstraintsForTimerSize:p_isa[2]];
    [p_isa _updateLayerLineWidth];
    [p_isa _updateTintColor];
    objc_storeStrong((id *)&v19, 0LL);
  }

  int v11 = p_isa;
  objc_storeStrong((id *)&p_isa, 0LL);
  return v11;
}

- (void)layoutSubviews
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerGlyphView;
  -[TVSSSleepTimerGlyphView layoutSubviews](&v14, "layoutSubviews");
  id v11 = -[_TVSSSleepTimerShapeView shapeLayer](v16->_gutterView, "shapeLayer");
  int v10 = (void *)objc_opt_class(v16);
  -[TVSSSleepTimerGlyphView bounds](v16, "bounds");
  objc_msgSend(v11, "setPath:", objc_msgSend(v10, "circlePathForBounds:timerSize:", v16->_timerSize, v2, v3, v4, v5));

  id v13 = -[_TVSSSleepTimerShapeView shapeLayer](v16->_progressView, "shapeLayer");
  id v12 = (void *)objc_opt_class(v16);
  -[TVSSSleepTimerGlyphView bounds](v16, "bounds");
  objc_msgSend( v13,  "setPath:",  objc_msgSend( v12,  "arcPathForBounds:percentComplete:timerSize:",  v16->_timerSize,  v6,  v7,  v8,  v9,  v16->_percentComplete));
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPercentComplete:(double)a3
{
  double v18 = self;
  SEL v17 = a2;
  double v16 = a3;
  if (self->_percentComplete != a3)
  {
    v18->_percentComplete = v16;
    id v8 = -[_TVSSSleepTimerShapeView shapeLayer](v18->_progressView, "shapeLayer");
    double v7 = (void *)objc_opt_class(v18);
    -[TVSSSleepTimerGlyphView bounds](v18, "bounds");
    double v12 = v3;
    double v13 = v4;
    double v14 = v5;
    double v15 = v6;
    objc_msgSend( v8,  "setPath:",  objc_msgSend( v7,  "arcPathForBounds:percentComplete:timerSize:",  v18->_timerSize,  v3,  v4,  v5,  v6,  v18->_percentComplete));

    timerHandView = v18->_timerHandView;
    int v10 = (void *)objc_opt_class(v18);
    if (v10) {
      [v10 currentRotationTransformForPercentComplete:v16];
    }
    else {
      memset(__b, 0, sizeof(__b));
    }
    -[UIImageView setTransform:](timerHandView, "setTransform:", __b);
  }

- (void)setTimerSize:(unint64_t)a3
{
  if (self->_timerSize != a3)
  {
    self->_timerSize = a3;
    -[TVSSSleepTimerGlyphView _updateConstraintsForTimerSize:]( self,  "_updateConstraintsForTimerSize:",  self->_timerSize);
    -[TVSSSleepTimerGlyphView _updateLayerLineWidth](self, "_updateLayerLineWidth");
    -[TVSSSleepTimerGlyphView setNeedsLayout](self, "setNeedsLayout");
    -[TVSSSleepTimerGlyphView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

+ (CGPath)circlePathForBounds:(CGRect)a3 timerSize:(unint64_t)a4
{
  CGRect v9 = CGRectInset(a3, v4 / 2.0, v4 / 2.0);
  double v6 =  +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithOvalInRect:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height);
  double v7 = -[UIBezierPath CGPath](v6, "CGPath");

  return v7;
}

+ (CGPath)arcPathForBounds:(CGRect)a3 percentComplete:(double)a4 timerSize:(unint64_t)a5
{
  CGRect v26 = a3;
  id v25 = a1;
  SEL v24 = a2;
  double v23 = a4;
  unint64_t v22 = a5;
  double v21 = 0.01;
  if (a4 <= 0.5)
  {
    double v19 = v21 + 0.5;
    double v18 = v23;
    if (v21 + 0.5 >= v23) {
      double v10 = v18;
    }
    else {
      double v10 = v19;
    }
    double v17 = v10;
    double v11 = v10;
  }

  else
  {
    double v11 = v23 + v21;
  }

  double v20 = v11;
  double v16 = 6.28318531 * v11;
  unint64_t v15 = 0xBFF921FB54442D18LL;
  double v14 = -1.57079633 - 6.28318531 * v11;
  [(id)objc_opt_class(v25) lineWidthForTimerSize:v22];
  double v13 = v5;
  CGRectGetMidX(v26);
  CGRectGetMidY(v26);
  sub_100018D70();
  id v12 =  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v6,  v7,  (CGRectGetWidth(v26) - v13) / 2.0,  -1.57079633,  v14);
  CGRect v9 = (CGPath *)[v12 CGPath];
  objc_storeStrong(&v12, 0LL);
  return v9;
}

  ;
}

+ (CGAffineTransform)currentRotationTransformForPercentComplete:(SEL)a3
{
  return CGAffineTransformMakeRotation(retstr, 6.28318531 * (1.0 - a4));
}

+ (double)lineWidthForTimerSize:(unint64_t)a3
{
  if (a3 != 1) {
    return 4.0;
  }
  sub_100017F64();
  double v6 = 4.0 * v3;
  sub_100017F64();
  return v6 / v4;
}

- (void)tintColorDidChange
{
  double v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerGlyphView;
  -[TVSSSleepTimerGlyphView tintColorDidChange](&v2, "tintColorDidChange");
  -[TVSSSleepTimerGlyphView _updateTintColor](v4, "_updateTintColor");
}

- (void)_updateTintColor
{
  id v4 = -[_TVSSSleepTimerShapeView shapeLayer](self->_gutterView, "shapeLayer");
  id v3 = -[TVSSSleepTimerGlyphView tintColor](self, "tintColor");
  id v2 = [v3 colorWithAlphaComponent:0.3];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v2, "CGColor"));

  id v6 = -[_TVSSSleepTimerShapeView shapeLayer](self->_progressView, "shapeLayer");
  id v5 = -[TVSSSleepTimerGlyphView tintColor](self, "tintColor");
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  timerHandView = self->_timerHandView;
  id v8 = -[TVSSSleepTimerGlyphView tintColor](self, "tintColor");
  -[UIImageView setTintColor:](timerHandView, "setTintColor:");
}

- (void)_updateLayerLineWidth
{
  double v5 = v2;
  id v3 = -[_TVSSSleepTimerShapeView shapeLayer](self->_progressView, "shapeLayer");
  [v3 setLineWidth:v5];

  id v4 = -[_TVSSSleepTimerShapeView shapeLayer](self->_gutterView, "shapeLayer");
  [v4 setLineWidth:v5];
}

- (void)_updateConstraintsForTimerSize:(unint64_t)a3
{
  double v41 = v3;
  double v42 = v4;
  id v40 = -[TVSSSleepTimerGlyphView widthAnchor](self, "widthAnchor");
  id v39 = [v40 constraintEqualToConstant:v41];
  v44[0] = v39;
  id v38 = -[TVSSSleepTimerGlyphView heightAnchor](self, "heightAnchor");
  id v37 = [v38 constraintEqualToConstant:v42];
  v44[1] = v37;
  id v36 = -[_TVSSSleepTimerShapeView widthAnchor](self->_gutterView, "widthAnchor");
  id v35 = [v36 constraintEqualToConstant:v41];
  v44[2] = v35;
  id v34 = -[_TVSSSleepTimerShapeView heightAnchor](self->_gutterView, "heightAnchor");
  id v33 = [v34 constraintEqualToConstant:v42];
  v44[3] = v33;
  id v32 = -[_TVSSSleepTimerShapeView centerXAnchor](self->_gutterView, "centerXAnchor");
  id v31 = -[TVSSSleepTimerGlyphView centerXAnchor](self, "centerXAnchor");
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v44[4] = v30;
  id v29 = -[_TVSSSleepTimerShapeView centerYAnchor](self->_gutterView, "centerYAnchor");
  id v28 = -[TVSSSleepTimerGlyphView centerYAnchor](self, "centerYAnchor");
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v44[5] = v27;
  id v26 = -[_TVSSSleepTimerShapeView widthAnchor](self->_progressView, "widthAnchor");
  id v25 = [v26 constraintEqualToConstant:v41];
  v44[6] = v25;
  id v24 = -[_TVSSSleepTimerShapeView heightAnchor](self->_progressView, "heightAnchor");
  id v23 = [v24 constraintEqualToConstant:v42];
  v44[7] = v23;
  id v22 = -[_TVSSSleepTimerShapeView centerXAnchor](self->_progressView, "centerXAnchor");
  id v21 = -[TVSSSleepTimerGlyphView centerXAnchor](self, "centerXAnchor");
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v44[8] = v20;
  id v19 = -[_TVSSSleepTimerShapeView centerYAnchor](self->_progressView, "centerYAnchor");
  id v18 = -[TVSSSleepTimerGlyphView centerYAnchor](self, "centerYAnchor");
  id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
  v44[9] = v17;
  id v16 = -[UIImageView widthAnchor](self->_timerHandView, "widthAnchor");
  id v15 = [v16 constraintEqualToConstant:v41];
  v44[10] = v15;
  id v14 = -[UIImageView heightAnchor](self->_timerHandView, "heightAnchor");
  id v13 = [v14 constraintEqualToConstant:v42];
  v44[11] = v13;
  id v12 = -[UIImageView centerXAnchor](self->_timerHandView, "centerXAnchor");
  id v11 = -[TVSSSleepTimerGlyphView centerXAnchor](self, "centerXAnchor");
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v44[12] = v10;
  id v9 = -[UIImageView centerYAnchor](self->_timerHandView, "centerYAnchor");
  id v8 = -[TVSSSleepTimerGlyphView centerYAnchor](self, "centerYAnchor");
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v44[13] = v7;
  double v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 14LL);
  constraints = self->_constraints;
  self->_constraints = v5;

  +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_constraints);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (unint64_t)timerSize
{
  return self->_timerSize;
}

- (_TVSSSleepTimerShapeView)gutterView
{
  return self->_gutterView;
}

- (_TVSSSleepTimerShapeView)progressView
{
  return self->_progressView;
}

- (UIImageView)timerHandView
{
  return self->_timerHandView;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
}

@end