@interface CTXPCServiceSubscriptionContext
- (BOOL)csd_isTelephony;
@end

@implementation CTXPCServiceSubscriptionContext

- (BOOL)csd_isTelephony
{
  return -[CTXPCServiceSubscriptionContext slotID](self, "slotID") != 0LL;
}

@end