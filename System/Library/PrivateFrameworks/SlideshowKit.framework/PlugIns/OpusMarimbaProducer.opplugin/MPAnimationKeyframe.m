@interface MPAnimationKeyframe
- (MPAnimationKeyframe)init;
- (double)postControl;
- (double)preControl;
- (double)time;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullDebugLog;
- (id)parentDocument;
- (id)parentPath;
- (int64_t)relativeTimeCompare:(id)a3;
- (unint64_t)offsetType;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setKeyframe:(id)a3;
- (void)setOffsetType:(unint64_t)a3;
- (void)setParentPath:(id)a3;
- (void)setPostControl:(double)a3;
- (void)setPreControl:(double)a3;
- (void)setTime:(double)a3;
@end

@implementation MPAnimationKeyframe

- (MPAnimationKeyframe)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe;
  v2 = -[MPAnimationKeyframe init](&v4, "init");
  if (v2)
  {
    v2->_attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_time = 0.0;
    v2->_offsetType = 0LL;
    *(int64x2_t *)&v2->_preControl = vdupq_n_s64(0x416312D000000000uLL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  return v4;
}

- (void)dealloc
{
  keyframe = self->_keyframe;
  if (keyframe)
  {

    self->_keyframe = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationKeyframe;
  -[MPAnimationKeyframe dealloc](&v4, "dealloc");
}

- (id)parentPath
{
  return self->_parentPath;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
  keyframe = self->_keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setTimeOffset:](keyframe, "setTimeOffset:");
  }
}

- (void)setOffsetType:(unint64_t)a3
{
  self->_offsetType = a3;
  keyframe = self->_keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setTimeOffsetKind:](keyframe, "setTimeOffsetKind:");
  }
}

- (double)preControl
{
  double result = self->_preControl;
  if (result == 10000000.0) {
    return 0.0;
  }
  return result;
}

- (void)setPreControl:(double)a3
{
  self->_preControl = a3;
  keyframe = self->_keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    -[MCAnimationKeyframe setPreControl:](keyframe, "setPreControl:", a3);
  }

- (double)postControl
{
  double result = self->_postControl;
  if (result == 10000000.0) {
    return 0.0;
  }
  return result;
}

- (void)setPostControl:(double)a3
{
  self->_postControl = a3;
  keyframe = self->_keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    -[MCAnimationKeyframe setPostControl:](keyframe, "setPostControl:", a3);
  }

- (double)time
{
  return self->_time;
}

- (unint64_t)offsetType
{
  return self->_offsetType;
}

- (int64_t)relativeTimeCompare:(id)a3
{
  parentPath = self->_parentPath;
  -[MPAnimationPath relativeTimeForKeyframe:](parentPath, "relativeTimeForKeyframe:", self);
  double v6 = v5;
  -[MPAnimationPath relativeTimeForKeyframe:](parentPath, "relativeTimeForKeyframe:", a3);
  if (v6 < v7) {
    return -1LL;
  }
  else {
    return v6 > v7;
  }
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPAnimationKeyframe description](self, "description"));
}

- (void)setParentPath:(id)a3
{
  if (a3 && self->_parentPath)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A keyframe  may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPAnimationKeyframe parentDocument](v3, v4);
  }

  else
  {
    self->_parentPath = (MPAnimationPath *)a3;
  }

- (id)parentDocument
{
  return -[MPAnimationPath parentDocument](self->_parentPath, "parentDocument");
}

- (void)setKeyframe:(id)a3
{
  keyframe = self->_keyframe;
  if (keyframe)
  {

    self->_keyframe = 0LL;
  }

  double v6 = (MCAnimationKeyframe *)a3;
  self->_keyframe = v6;
  if (v6)
  {
    if (self->_preControl != 10000000.0)
    {
      -[MPAnimationKeyframe preControl](self, "preControl");
      *(float *)&double v7 = v7;
      -[MCAnimationKeyframe setPreControl:](self->_keyframe, "setPreControl:", v7);
    }

    if (self->_postControl != 10000000.0)
    {
      -[MPAnimationKeyframe postControl](self, "postControl");
      *(float *)&double v8 = v8;
      -[MCAnimationKeyframe setPostControl:](self->_keyframe, "setPostControl:", v8);
    }
  }

- (void)copyVars:(id)a3
{
  self->_time = *((double *)a3 + 4);
  self->_offsetType = *((void *)a3 + 5);
  self->_preControl = *((double *)a3 + 6);
  self->_postControl = *((double *)a3 + 7);
}

@end