@interface FFConfiguration(Subscriptions)
@end

@implementation FFConfiguration(Subscriptions)

- (void)addSubscription:()Subscriptions atLevel:.cold.1(NSString *format)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: Requested level is invalid";
  qword_18C68F010 = (uint64_t)format;
  __break(1u);
  NSLog(format);
}

@end