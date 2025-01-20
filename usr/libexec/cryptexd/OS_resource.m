@interface OS_resource
- (void)dealloc;
@end

@implementation OS_resource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_resource;
  -[OS_resource dealloc](&v3, "dealloc");
}

@end