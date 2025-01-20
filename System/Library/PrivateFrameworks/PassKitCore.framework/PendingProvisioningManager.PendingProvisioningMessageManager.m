@interface PendingProvisioningManager.PendingProvisioningMessageManager
- (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager)init;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
@end

@implementation PendingProvisioningManager.PendingProvisioningMessageManager

- (void)connectApplicationMessageSink:(id)a3
{
  v5 = self;
  sub_100431148((uint64_t)a3);
  swift_unknownObjectRelease(a3);
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v7 = a4;
  v8 = self;
  id v9 = sub_10043477C(v7);
  swift_unknownObjectRelease(a3);

  return v9;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_100434A0C(v7);
  swift_unknownObjectRelease(a3);
}

- (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager)init
{
  result = (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager *)_swift_stdlib_reportUnimplementedInitializer( "passd.PendingProvisioningMessageManager",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_carKeyRequirementsChecker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_notificationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_applicationMessageManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_applicationMessageSink));
}

@end