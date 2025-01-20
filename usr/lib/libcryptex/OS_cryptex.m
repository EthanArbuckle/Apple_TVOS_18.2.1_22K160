@interface OS_cryptex
- (void)dealloc;
@end

@implementation OS_cryptex

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex;
  -[OS_cryptex dealloc](&v3, sel_dealloc);
}

@end