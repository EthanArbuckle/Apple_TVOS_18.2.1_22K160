@interface OS_cryptex_scrivener
- (void)dealloc;
@end

@implementation OS_cryptex_scrivener

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_cryptex_scrivener;
  -[OS_cryptex_base dealloc](&v3, sel_dealloc);
}

@end