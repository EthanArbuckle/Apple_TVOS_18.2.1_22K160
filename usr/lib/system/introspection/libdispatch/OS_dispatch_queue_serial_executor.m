@interface OS_dispatch_queue_serial_executor
- (OS_dispatch_queue_serial_executor)init;
@end

@implementation OS_dispatch_queue_serial_executor

- (OS_dispatch_queue_serial_executor)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end