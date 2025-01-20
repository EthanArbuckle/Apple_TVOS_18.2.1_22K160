@interface OS_cryptex_attr
- (void)dealloc;
@end

@implementation OS_cryptex_attr

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_attr;
  -[OS_cryptex_attr dealloc](&v3, sel_dealloc);
}

@end