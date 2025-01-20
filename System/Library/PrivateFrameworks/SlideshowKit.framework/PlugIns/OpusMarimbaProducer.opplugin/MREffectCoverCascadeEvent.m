@interface MREffectCoverCascadeEvent
- (MREffectCoverCascadeEvent)initWithRelativeX:(char)a3 relativeY:(char)a4 type:(unsigned __int8)a5 relativeStartTime:(double)a6 andDuration:(double)a7;
@end

@implementation MREffectCoverCascadeEvent

- (MREffectCoverCascadeEvent)initWithRelativeX:(char)a3 relativeY:(char)a4 type:(unsigned __int8)a5 relativeStartTime:(double)a6 andDuration:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MREffectCoverCascadeEvent;
  result = -[MREffectCoverCascadeEvent init](&v13, "init");
  if (result)
  {
    result->relativeX = a3;
    result->relativeY = a4;
    result->type = a5;
    result->relativeStartTime = a6;
    result->duration = a7;
  }

  return result;
}

@end