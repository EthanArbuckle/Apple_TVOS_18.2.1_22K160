@interface ConnectionManager
- (_TtC13appleaccountd17ConnectionManager)init;
- (void)dealloc;
@end

@implementation ConnectionManager

- (_TtC13appleaccountd17ConnectionManager)init
{
  return (_TtC13appleaccountd17ConnectionManager *)sub_1000172F0();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConnectionManager();
  id v2 = v3.receiver;
  -[ConnectionManager dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_notificationServiceListener));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_appleIDAvailabilityScheduler));
}

@end