@interface LARatchetStateValueCollapsed
- (double)duration;
@end

@implementation LARatchetStateValueCollapsed

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueCollapsed;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end