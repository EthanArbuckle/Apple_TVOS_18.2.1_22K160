@interface LARatchetStateValueExpired
- (double)duration;
@end

@implementation LARatchetStateValueExpired

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueExpired;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end