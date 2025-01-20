@interface OS_os_workgroup_interval
- (OS_os_workgroup_interval)init;
- (void)_xref_dispose;
- (void)dealloc;
@end

@implementation OS_os_workgroup_interval

- (OS_os_workgroup_interval)init
{
  qword_18C51C2A8 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_workgroup_interval;
  -[OS_os_workgroup _xref_dispose](&v3, sel__xref_dispose);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_workgroup_interval;
  -[OS_os_workgroup dealloc](&v3, sel_dealloc);
}

@end