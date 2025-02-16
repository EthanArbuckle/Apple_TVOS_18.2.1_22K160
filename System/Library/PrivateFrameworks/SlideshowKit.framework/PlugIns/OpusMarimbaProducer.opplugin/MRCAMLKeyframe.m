@interface MRCAMLKeyframe
- (MRCAMLBezierData)spline;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setSpline:(id)a3;
@end

@implementation MRCAMLKeyframe

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRCAMLKeyframe;
  -[MRCAMLKeyframe dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (double *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSpline:", -[MRCAMLKeyframe spline](self, "spline"));
  v4[4] = self->time;
  v4[2] = self->value0;
  v4[3] = self->value1;
  return v4;
}

- (MRCAMLBezierData)spline
{
  return self->spline;
}

- (void)setSpline:(id)a3
{
}

@end