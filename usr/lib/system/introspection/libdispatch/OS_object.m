@interface OS_object
- (OS_object)init;
@end

@implementation OS_object

- (OS_object)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end