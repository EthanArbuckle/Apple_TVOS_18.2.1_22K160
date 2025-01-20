@interface HIDSession
- (void)dealloc;
@end

@implementation HIDSession

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDSession;
  -[HIDSession dealloc](&v3, sel_dealloc);
}

@end