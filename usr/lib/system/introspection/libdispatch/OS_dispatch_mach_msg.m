@interface OS_dispatch_mach_msg
- (OS_dispatch_mach_msg)init;
@end

@implementation OS_dispatch_mach_msg

- (OS_dispatch_mach_msg)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end