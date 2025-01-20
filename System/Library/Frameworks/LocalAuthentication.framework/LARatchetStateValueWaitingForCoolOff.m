@interface LARatchetStateValueWaitingForCoolOff
- (double)duration;
@end

@implementation LARatchetStateValueWaitingForCoolOff

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueWaitingForCoolOff;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end