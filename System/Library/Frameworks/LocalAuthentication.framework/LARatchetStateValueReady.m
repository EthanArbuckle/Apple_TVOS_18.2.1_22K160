@interface LARatchetStateValueReady
- (double)duration;
@end

@implementation LARatchetStateValueReady

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueReady;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end