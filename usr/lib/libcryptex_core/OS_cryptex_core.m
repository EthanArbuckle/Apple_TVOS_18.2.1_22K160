@interface OS_cryptex_core
- (void)dealloc;
@end

@implementation OS_cryptex_core

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_core;
  -[OS_cryptex_core dealloc](&v3, sel_dealloc);
}

@end