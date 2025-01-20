@interface LARatchetStateValueArmed
- (double)duration;
@end

@implementation LARatchetStateValueArmed

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueArmed;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end