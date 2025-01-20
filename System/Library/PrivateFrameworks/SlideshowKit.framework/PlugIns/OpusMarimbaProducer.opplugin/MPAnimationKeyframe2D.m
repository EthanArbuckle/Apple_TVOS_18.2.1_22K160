@interface MPAnimationKeyframe2D
+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4;
+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (CGPoint)point;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)setPoint:(CGPoint)a3;
@end

@implementation MPAnimationKeyframe2D

+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initKeyframe2DWithPoint:atTime:offsetType:", 0, a3.x, a3.y, a4);
}

+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initKeyframe2DWithPoint:atTime:offsetType:", a5, a3.x, a3.y, a4);
}

- (id)initKeyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe2D;
  id result = -[MPAnimationKeyframe init](&v10, "init");
  if (result)
  {
    *((CGFloat *)result + 8) = x;
    *((CGFloat *)result + 9) = y;
    *((double *)result + 4) = a4;
    *((void *)result + 5) = a5;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe2D;
  id v4 = -[MPAnimationKeyframe copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setPoint:", self->_point.x, self->_point.y);
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"================================ Keyframe2D ====================================\n");
  -[MPAnimationKeyframe time](self, "time");
  v5 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                          Time: %f\n",  v4),  "stringByAppendingFormat:",  @"\t                        Offset: %f\n",  (double)-[MPAnimationKeyframe offsetType](self, "offsetType"));
  -[MPAnimationKeyframe2D point](self, "point");
  objc_super v6 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                         Point: %@\n",  NSStringFromCGPoint(v9));
  if (self->super._keyframe) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v6,  "stringByAppendingFormat:",  @"\t               Has MCKayeframe: %@\n",  v7);
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
  if (self->super._keyframe)
  {
    double y = a3.y;
    double x = a3.x;
    id v6 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPFilter, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
      v16.double x = x;
      v16.double y = y;
      objc_super v10 = (NSString *)objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  NSStringFromCGPoint(v16),  -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey"));
      CGPoint v11 = CGPointFromString(v10);
      double x = v11.x;
      double y = v11.y;
    }

    -[MCAnimationKeyframe setPoint:](self->super._keyframe, "setPoint:", x, y);
  }

  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v13 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPSlide, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (id)keyframe
{
  return self->super._keyframe;
}

@end