@interface OS_dispatch_channel
- (OS_dispatch_channel)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_channel

- (OS_dispatch_channel)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_dispatch_channel;
  -[OS_object _xref_dispose](&v3, "_xref_dispose");
}

@end