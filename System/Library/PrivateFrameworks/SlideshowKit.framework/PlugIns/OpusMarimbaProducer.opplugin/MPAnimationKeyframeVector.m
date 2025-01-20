@interface MPAnimationKeyframeVector
+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4;
+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (MPVector)vector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)dealloc;
- (void)setVector:(id)a3;
@end

@implementation MPAnimationKeyframeVector

+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4
{
  return [objc_alloc((Class)a1) initKeyframeVectorWithVector:a3 atTime:0 offsetType:a4];
}

+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  return [objc_alloc((Class)a1) initKeyframeVectorWithVector:a3 atTime:a5 offsetType:a4];
}

- (id)initKeyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeVector;
  v8 = -[MPAnimationKeyframe init](&v10, "init");
  if (v8)
  {
    v8->_vector = (MPVector *)a3;
    v8->super._time = a4;
    v8->super._offsetType = a5;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeVector;
  id v4 = -[MPAnimationKeyframe copyWithZone:](&v7, "copyWithZone:", a3);
  id v5 = -[MPVector copy](self->_vector, "copy");
  [v4 setVector:v5];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeVector;
  -[MPAnimationKeyframe dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"============================== KeyframeVector ==================================\n");
  -[MPAnimationKeyframe time](self, "time");
  id v5 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                          Time: %f\n",  v4),  "stringByAppendingFormat:",  @"\t                        Offset: %f\n",  (double)-[MPAnimationKeyframe offsetType](self, "offsetType")),  "stringByAppendingFormat:",  @"\t                        Vector: %@\n",  -[MPVector string](-[MPAnimationKeyframeVector vector](self, "vector"), "string"));
  if (self->super._keyframe) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t               Has MCKayeframe: %@\n",  v6);
}

- (void)setVector:(id)a3
{
  vector = self->_vector;
  if (vector) {

  }
  self->_vector = (MPVector *)a3;
  if (self->super._keyframe)
  {
    if (a3)
    {
      [a3 vector];
    }

    else
    {
      __int128 v14 = 0uLL;
      int v15 = 0;
    }

    id v6 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPFilter, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent");
      __int128 v12 = v14;
      int v13 = v15;
      id v10 = objc_msgSend( v9,  "convertMPAttributeToMCAttribute:withKey:",  MCVectorToString((uint64_t)&v12),  -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey"));
      MCStringToVector(v10, (uint64_t)&v12);
      __int128 v14 = v12;
      int v15 = v13;
    }

    keyframe = self->super._keyframe;
    __int128 v12 = v14;
    int v13 = v15;
    -[MCAnimationKeyframe setVector:](keyframe, "setVector:", &v12);
  }

- (MPVector)vector
{
  return self->_vector;
}

- (id)keyframe
{
  return self->super._keyframe;
}

@end