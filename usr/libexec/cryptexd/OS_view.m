@interface OS_view
- (void)dealloc;
@end

@implementation OS_view

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_view;
  -[OS_view dealloc](&v3, "dealloc");
}

@end