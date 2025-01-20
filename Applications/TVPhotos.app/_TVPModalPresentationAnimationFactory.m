@interface _TVPModalPresentationAnimationFactory
- (_TVPModalPresentationAnimationFactory)initWithCurve:(unint64_t)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
- (unint64_t)curve;
@end

@implementation _TVPModalPresentationAnimationFactory

- (_TVPModalPresentationAnimationFactory)initWithCurve:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVPModalPresentationAnimationFactory;
  result = -[_TVPModalPresentationAnimationFactory init](&v5, "init");
  if (result) {
    result->_curve = a3;
  }
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return +[CABasicAnimation animationWithKeyPath:](&OBJC_CLASS___CABasicAnimation, "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  unint64_t v4 = -[_TVPModalPresentationAnimationFactory curve](self, "curve", a3, a4);
  if (v4 == 1)
  {
    LODWORD(v5) = 1040522936;
    LODWORD(v6) = 1052938076;
    LODWORD(v7) = 1043878380;
  }

  else
  {
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
      return v9;
    }

    LODWORD(v5) = 1051931443;
    LODWORD(v7) = 1043878380;
    LODWORD(v6) = 0;
  }

  LODWORD(v8) = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v5,  v6,  v7,  v8));
  return v9;
}

- (unint64_t)curve
{
  return self->_curve;
}

@end