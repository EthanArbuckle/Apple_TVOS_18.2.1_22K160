@interface AppleAccountMonitor
- (void)accountWasAdded:(id)a3;
- (void)dealloc;
@end

@implementation AppleAccountMonitor

- (void)dealloc
{
  v2 = self;
  sub_1000C83C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7parsecd19AppleAccountMonitor_monitoredAccountStore));
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C844C(v4);
}

@end