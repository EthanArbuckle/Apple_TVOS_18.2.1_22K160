@interface TITestUserPersonaKeyInfo
- (CGPoint)center;
- (TIFitAffineMLLMatrixWrapper)rotationMatrix;
- (TIGaussianErrorGenerator)errorGenerator;
- (id)description;
- (void)setCenter:(CGPoint)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setRotationMatrix:(id)a3;
@end

@implementation TITestUserPersonaKeyInfo

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TITestUserPersonaKeyInfo;
  id v3 = -[TITestUserPersonaKeyInfo description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ @ {%.1f, %.1f}",  v4,  *(void *)&self->_center.x,  *(void *)&self->_center.y));

  return v5;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (TIGaussianErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIFitAffineMLLMatrixWrapper)rotationMatrix
{
  return self->_rotationMatrix;
}

- (void)setRotationMatrix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end