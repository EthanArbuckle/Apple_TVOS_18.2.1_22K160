@interface OS_proc
- (void)dealloc;
@end

@implementation OS_proc

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_proc;
  -[OS_proc dealloc](&v3, "dealloc");
}

@end