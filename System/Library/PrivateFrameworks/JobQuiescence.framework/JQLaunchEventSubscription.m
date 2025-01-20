@interface JQLaunchEventSubscription
- (_TtC13JobQuiescence25JQLaunchEventSubscription)init;
- (void)dealloc;
@end

@implementation JQLaunchEventSubscription

- (void)dealloc
{
  v2 = *(void (**)(void))((*MEMORY[0x18961B398] & (uint64_t)self->super.isa) + 0xD0);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for JQLaunchEventSubscription();
  -[JQLaunchEventSubscription dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1891E92E8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notification));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13JobQuiescence25JQLaunchEventSubscription_notificationQueue));
}

- (_TtC13JobQuiescence25JQLaunchEventSubscription)init
{
  result = (_TtC13JobQuiescence25JQLaunchEventSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end