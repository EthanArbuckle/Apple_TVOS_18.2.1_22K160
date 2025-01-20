@interface OS_os_eventlink
- (OS_os_eventlink)init;
- (void)dealloc;
@end

@implementation OS_os_eventlink

- (OS_os_eventlink)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_eventlink;
  -[OS_os_eventlink dealloc](&v3, "dealloc");
}

@end