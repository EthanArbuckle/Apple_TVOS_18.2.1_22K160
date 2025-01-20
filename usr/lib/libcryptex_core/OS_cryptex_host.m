@interface OS_cryptex_host
- (void)dealloc;
@end

@implementation OS_cryptex_host

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_host;
  -[OS_cryptex_host dealloc](&v3, sel_dealloc);
}

@end