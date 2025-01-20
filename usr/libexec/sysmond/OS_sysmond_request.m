@interface OS_sysmond_request
- (void)dealloc;
@end

@implementation OS_sysmond_request

- (void)dealloc
{
  v3 = (void *)self[3];
  if (v3) {
    xpc_release(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OS_sysmond_request;
  -[OS_sysmond_request dealloc](&v4, "dealloc");
}

@end