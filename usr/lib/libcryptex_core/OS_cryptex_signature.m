@interface OS_cryptex_signature
- (void)dealloc;
@end

@implementation OS_cryptex_signature

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_signature;
  -[OS_cryptex_signature dealloc](&v3, sel_dealloc);
}

@end