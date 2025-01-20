@interface OS_os_workgroup
- (OS_os_workgroup)init;
- (id)debugDescription;
- (void)_xref_dispose;
- (void)dealloc;
@end

@implementation OS_os_workgroup

- (OS_os_workgroup)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_workgroup;
  -[OS_object _xref_dispose](&v3, "_xref_dispose");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_workgroup;
  -[OS_os_workgroup dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    _os_workgroup_debug((uint64_t)self, __str, 0x800uLL);
    return [v4 stringWithUTF8String:__str];
  }

  return result;
}

@end