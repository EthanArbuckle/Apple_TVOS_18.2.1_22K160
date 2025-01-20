@interface OS_cryptex_actor
- (void)dealloc;
@end

@implementation OS_cryptex_actor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_actor;
  -[OS_cryptex_actor dealloc](&v3, sel_dealloc);
}

@end