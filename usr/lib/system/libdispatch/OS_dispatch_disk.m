@interface OS_dispatch_disk
- (OS_dispatch_disk)init;
@end

@implementation OS_dispatch_disk

- (OS_dispatch_disk)init
{
  qword_18C51C2A8 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end