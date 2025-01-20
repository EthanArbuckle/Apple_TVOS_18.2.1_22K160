@interface OS_sysmond_process
- (void)dealloc;
@end

@implementation OS_sysmond_process

- (void)dealloc
{
  kern_return_t v3;
  objc_super v4;
  v3 = mach_port_deallocate(mach_task_self_, *(_DWORD *)&self[5].super.super.OS_object_opaque[4]);
  if (v3) {
    _os_assumes_log(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OS_sysmond_process;
  -[OS_sysmond_row dealloc](&v4, "dealloc");
}

@end