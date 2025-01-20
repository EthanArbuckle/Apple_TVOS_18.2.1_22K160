@interface MPAnimationKeyframeFunction
+ (id)keyframeFunctionWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 withDuration:(double)a6;
+ (id)keyframeFunctionWithFunction:(id)a3 atTime:(double)a4 withDuration:(double)a5;
- (NSDictionary)functionParameters;
- (NSString)function;
- (double)duration;
- (double)functionTimeFactor;
- (double)functionTimeOffset;
- (double)innerEaseInControl;
- (double)innerEaseOutControl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframeFunctionWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 withDuration:(double)a6;
- (id)keyframe;
- (void)dealloc;
- (void)setDuration:(double)a3;
- (void)setFunction:(id)a3;
- (void)setFunctionParameters:(id)a3;
- (void)setFunctionTimeFactor:(double)a3;
- (void)setFunctionTimeOffset:(double)a3;
- (void)setInnerEaseInControl:(double)a3;
- (void)setInnerEaseOutControl:(double)a3;
@end

@implementation MPAnimationKeyframeFunction

+ (id)keyframeFunctionWithFunction:(id)a3 atTime:(double)a4 withDuration:(double)a5
{
  return  [objc_alloc((Class)a1) initKeyframeFunctionWithFunction:a3 atTime:0 offsetType:a4 withDuration:a5];
}

+ (id)keyframeFunctionWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 withDuration:(double)a6
{
  return  [objc_alloc((Class)a1) initKeyframeFunctionWithFunction:a3 atTime:a5 offsetType:a4 withDuration:a6];
}

- (id)initKeyframeFunctionWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 withDuration:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeFunction;
  v10 = -[MPAnimationKeyframe init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_duration = a6;
    v10->_function = (NSString *)a3;
    v11->_functionTimeOffset = 0.0;
    v11->_functionTimeFactor = 1.0;
    v11->_innerEaseInControl = 0.0;
    v11->_innerEaseOutControl = 0.0;
    v11->super._time = a4;
    v11->super._offsetType = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeFunction;
  id v4 = -[MPAnimationKeyframe copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setFunction:self->_function];
  objc_msgSend(v4, "setFunctionParameters:", -[NSDictionary copy](self->_functionParameters, "copy"));
  [v4 setDuration:self->_duration];
  [v4 setFunctionTimeOffset:self->_functionTimeOffset];
  [v4 setFunctionTimeFactor:self->_functionTimeFactor];
  [v4 setInnerEaseInControl:self->_innerEaseInControl];
  [v4 setInnerEaseOutControl:self->_innerEaseOutControl];
  return v4;
}

- (void)dealloc
{
  self->_function = 0LL;
  self->_functionParameters = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframeFunction;
  -[MPAnimationKeyframe dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"================================ Keyframe1D ====================================\n");
  -[MPAnimationKeyframe time](self, "time");
  v5 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                          Time: %f\n",  v4),  "stringByAppendingFormat:",  @"\t                        Offset: %f\n",  (double)-[MPAnimationKeyframe offsetType](self, "offsetType"));
  if (self->super._keyframe) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t               Has MCKeyframe: %@\n",  v6);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  keyframe = self->super._keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setDuration:](keyframe, "setDuration:");
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v6 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPSlide, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setFunctionTimeOffset:(double)a3
{
  self->_functionTimeOffset = a3;
  keyframe = self->super._keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setFunctionTimeOffset:](keyframe, "setFunctionTimeOffset:");
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v6 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPSlide, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setFunctionTimeFactor:(double)a3
{
  self->_functionTimeFactor = a3;
  keyframe = self->super._keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setFunctionTimeFactor:](keyframe, "setFunctionTimeFactor:");
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v6 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPSlide, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setInnerEaseInControl:(double)a3
{
  self->_innerEaseInControl = a3;
  keyframe = self->super._keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    -[MCAnimationKeyframe setInnerEaseInControl:](keyframe, "setInnerEaseInControl:", a3);
  }

  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v6 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPSlide, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setInnerEaseOutControl:(double)a3
{
  self->_innerEaseOutControl = a3;
  keyframe = self->super._keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    -[MCAnimationKeyframe setInnerEaseOutControl:](keyframe, "setInnerEaseOutControl:", a3);
  }

  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v6 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPSlide, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setFunction:(id)a3
{
  function = self->_function;
  if (function)
  {

    self->_function = 0LL;
  }

  self->_function = (NSString *)[a3 copy];
  keyframe = self->super._keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setFunction:](keyframe, "setFunction:", a3);
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v8 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPSlide, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (void)setFunctionParameters:(id)a3
{
  functionParameters = self->_functionParameters;
  if (functionParameters)
  {

    self->_functionParameters = 0LL;
  }

  self->_functionParameters = (NSDictionary *)[a3 copy];
  keyframe = self->super._keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setFunctionParameters:](keyframe, "setFunctionParameters:", a3);
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    id v8 = -[MPAnimationPath animatedParent](parentPath, "animatedParent");
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPSlide, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
      objc_msgSend( -[MPAnimationPath animatedParent](self->super._parentPath, "animatedParent"),  "duplicateAnimationPaths");
    }
  }

- (double)duration
{
  return self->_duration;
}

- (NSString)function
{
  return self->_function;
}

- (NSDictionary)functionParameters
{
  return self->_functionParameters;
}

- (double)functionTimeOffset
{
  return self->_functionTimeOffset;
}

- (double)functionTimeFactor
{
  return self->_functionTimeFactor;
}

- (double)innerEaseInControl
{
  return self->_innerEaseInControl;
}

- (double)innerEaseOutControl
{
  return self->_innerEaseOutControl;
}

- (id)keyframe
{
  return self->super._keyframe;
}

@end