@interface OS_dispatch_queue_runloop
- (OS_dispatch_queue_runloop)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_queue_runloop

- (OS_dispatch_queue_runloop)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_dispatch_queue_runloop;
  -[OS_dispatch_queue _xref_dispose](&v3, "_xref_dispose");
}

@end