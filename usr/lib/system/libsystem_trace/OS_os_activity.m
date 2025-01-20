@interface OS_os_activity
- (void)dealloc;
@end

@implementation OS_os_activity

- (void)dealloc
{
  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Activities are all global objects";
  __break(1u);
}

@end