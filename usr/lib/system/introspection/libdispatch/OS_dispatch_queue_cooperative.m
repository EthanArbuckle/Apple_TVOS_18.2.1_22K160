@interface OS_dispatch_queue_cooperative
- (OS_dispatch_queue_cooperative)init;
@end

@implementation OS_dispatch_queue_cooperative

- (OS_dispatch_queue_cooperative)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end