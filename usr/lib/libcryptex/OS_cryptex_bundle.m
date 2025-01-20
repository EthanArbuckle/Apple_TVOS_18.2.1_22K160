@interface OS_cryptex_bundle
- (void)dealloc;
@end

@implementation OS_cryptex_bundle

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_bundle;
  -[OS_cryptex_bundle dealloc](&v3, sel_dealloc);
}

@end