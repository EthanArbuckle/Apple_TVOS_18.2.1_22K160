@interface OS_daemon
- (void)dealloc;
@end

@implementation OS_daemon

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_daemon;
  -[OS_daemon dealloc](&v3, "dealloc");
}

@end