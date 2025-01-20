@interface OS_cryptex_signing_service
- (void)dealloc;
@end

@implementation OS_cryptex_signing_service

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_signing_service;
  -[OS_cryptex_signing_service dealloc](&v3, sel_dealloc);
}

@end