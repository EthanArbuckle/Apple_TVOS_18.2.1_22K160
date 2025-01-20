@interface OS_protex
- (void)dealloc;
@end

@implementation OS_protex

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_protex;
  -[OS_cryptex_base dealloc](&v3, "dealloc");
}

@end