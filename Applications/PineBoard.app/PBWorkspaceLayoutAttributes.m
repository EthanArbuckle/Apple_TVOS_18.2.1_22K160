@interface PBWorkspaceLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (PBWorkspaceLayoutAttributes)initWithCenter:(CGPoint)a3 scale:(double)a4 cornerRadius:(double)a5;
- (double)cornerRadius;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PBWorkspaceLayoutAttributes

- (PBWorkspaceLayoutAttributes)initWithCenter:(CGPoint)a3 scale:(double)a4 cornerRadius:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBWorkspaceLayoutAttributes;
  result = -[PBWorkspaceLayoutAttributes init](&v10, "init");
  if (result)
  {
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    result->_scale = a4;
    result->_cornerRadius = a5;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBWorkspaceLayoutAttributes initWithCenter:scale:cornerRadius:]( +[PBMutableWorkspaceLayoutAttributes allocWithZone:]( &OBJC_CLASS___PBMutableWorkspaceLayoutAttributes,  "allocWithZone:",  a3),  "initWithCenter:scale:cornerRadius:",  self->_center.x,  self->_center.y,  self->_scale,  self->_cornerRadius);
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = objc_msgSend(v3, "appendCGPoint:", self->_center.x, self->_center.y);
  id v5 = [v3 appendCGFloat:self->_scale];
  id v6 = [v3 appendCGFloat:self->_cornerRadius];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBWorkspaceLayoutAttributes));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000588AC;
  v20[3] = &unk_1003D2238;
  id v7 = v4;
  id v21 = v7;
  id v8 = objc_msgSend(v6, "appendCGPoint:counterpart:", v20, self->_center.x, self->_center.y);
  double scale = self->_scale;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000588C4;
  v18[3] = &unk_1003D2260;
  id v10 = v7;
  id v19 = v10;
  id v11 = [v6 appendCGFloat:v18 counterpart:scale];
  double cornerRadius = self->_cornerRadius;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000588DC;
  v16[3] = &unk_1003D2260;
  id v17 = v10;
  id v13 = v10;
  id v14 = [v6 appendCGFloat:v16 counterpart:cornerRadius];
  LOBYTE(v10) = [v6 isEqual];

  return (char)v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  if ((BSFloatIsOne( objc_msgSend(v3, "appendPoint:withName:", @"center", self->_center.x, self->_center.y),  self->_scale) & 1) == 0) {
    id v4 = [v3 appendFloat:@"scale" withName:self->_scale];
  }
  if ((BSFloatIsZero(self->_cornerRadius) & 1) == 0) {
    id v5 = [v3 appendFloat:@"cornerRadius" withName:self->_cornerRadius];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v6;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end