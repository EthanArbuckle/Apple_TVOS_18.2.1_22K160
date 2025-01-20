@interface LARatchetStateValueWaitingForSecondAuthentication
- (double)duration;
@end

@implementation LARatchetStateValueWaitingForSecondAuthentication

- (double)duration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LARatchetStateValueWaitingForSecondAuthentication;
  -[LARatchetStateValue duration](&v3, sel_duration);
  return result;
}

@end