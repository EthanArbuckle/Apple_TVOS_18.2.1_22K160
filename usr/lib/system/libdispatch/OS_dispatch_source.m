@interface OS_dispatch_source
- (OS_dispatch_source)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_source

- (OS_dispatch_source)init
{
  qword_18C51C2A8 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_dispatch_source;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

@end