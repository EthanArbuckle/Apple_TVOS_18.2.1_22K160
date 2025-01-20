@interface CSDPowerAssertionManager
- (CSDPowerAssertionManager)init;
@end

@implementation CSDPowerAssertionManager

- (CSDPowerAssertionManager)init
{
  return (CSDPowerAssertionManager *)sub_1001B6094();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDPowerAssertionManager_callCenterObserver));

  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDPowerAssertionManager_acquirePowerAssertionHandler),  *(void *)&self->powerAssertion[OBJC_IVAR___CSDPowerAssertionManager_acquirePowerAssertionHandler]);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDPowerAssertionManager_releasePowerAssertionHandler),  *(void *)&self->powerAssertion[OBJC_IVAR___CSDPowerAssertionManager_releasePowerAssertionHandler]);
}

@end