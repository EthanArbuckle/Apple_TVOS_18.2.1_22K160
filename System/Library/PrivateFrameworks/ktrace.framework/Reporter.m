@interface Reporter
- (void)failWithReason:(id)a3;
- (void)warnWithMessage:(id)a3;
@end

@implementation Reporter

- (void)failWithReason:(id)a3
{
  uint64_t v4 = sub_186C5AD2C();
  uint64_t v6 = v5;
  Class isa = self->super.isa[29].isa;
  swift_retain();
  ((void (*)(uint64_t, uint64_t))isa)(v4, v6);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)warnWithMessage:(id)a3
{
}

@end