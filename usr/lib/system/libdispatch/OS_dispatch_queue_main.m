@interface OS_dispatch_queue_main
- (OS_dispatch_queue_main)init;
@end

@implementation OS_dispatch_queue_main

- (OS_dispatch_queue_main)init
{
  qword_18C51C2A8 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end