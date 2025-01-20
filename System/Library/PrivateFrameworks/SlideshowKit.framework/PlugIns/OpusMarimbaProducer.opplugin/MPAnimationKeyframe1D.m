@interface MPAnimationKeyframe1D
+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4;
+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (double)scalar;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)setScalar:(double)a3;
@end

@implementation MPAnimationKeyframe1D

+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4
{
  return [objc_alloc((Class)a1) initKeyframe1DWithScalar:0 atTime:a3 offsetType:a4];
}

+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  return [objc_alloc((Class)a1) initKeyframe1DWithScalar:a5 atTime:a3 offsetType:a4];
}

- (id)initKeyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe1D;
  id result = -[MPAnimationKeyframe init](&v9, "init");
  if (result)
  {
    *((double *)result + 8) = a3;
    *((double *)result + 4) = a4;
    *((void *)result + 5) = a5;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe1D;
  id v4 = -[MPAnimationKeyframe copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setScalar:self->_scalar];
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"================================ Keyframe1D ====================================\n");
  -[MPAnimationKeyframe time](self, "time");
  v5 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                          Time: %f\n",  v4),  "stringByAppendingFormat:",  @"\t                        Offset: %f\n",  (double)-[MPAnimationKeyframe offsetType](self, "offsetType"));
  -[MPAnimationKeyframe1D scalar](self, "scalar");
  v7 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                        Scalar: %f\n",  v6);
  if (self->super._keyframe) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"\t               Has MCKayeframe: %@\n",  v8);
}

- (double)scalar
{
  return self->_scalar;
}

- (void)setScalar:(double)a3
{
  self->_scalar = a3;
  if (self->super._keyframe)
  {
    double v4 = a3;
    id v5 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MPFilter, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      id v9 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
      *(float *)&double v10 = v4;
      objc_msgSend( objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10),  -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey")),  "floatValue");
      double v4 = *(float *)&v8;
    }

    *(float *)&double v8 = v4;
    -[MCAnimationKeyframe setValue:](self->super._keyframe, "setValue:", v8);
  }

  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v12 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPSlide, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (id)keyframe
{
  return self->super._keyframe;
}

@end