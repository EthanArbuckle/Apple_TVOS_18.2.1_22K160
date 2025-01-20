@interface OS_quire
- (void)dealloc;
@end

@implementation OS_quire

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_quire;
  -[OS_cryptex_base dealloc](&v3, "dealloc");
}

@end