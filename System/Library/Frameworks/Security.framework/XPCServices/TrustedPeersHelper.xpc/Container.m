@interface Container
- (_TtC18TrustedPeersHelper9Container)init;
@end

@implementation Container

- (_TtC18TrustedPeersHelper9Container)init
{
  result = (_TtC18TrustedPeersHelper9Container *)_swift_stdlib_reportUnimplementedInitializer( "TrustedPeersHelper.Container",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->name[OBJC_IVAR____TtC18TrustedPeersHelper9Container_name];
  swift_bridgeObjectRelease(*(void *)&self->name[OBJC_IVAR____TtC18TrustedPeersHelper9Container_name + 16]);
  swift_bridgeObjectRelease(v3);
  sub_100007600((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper9Container_cuttlefish));

  swift_bridgeObjectRelease(*(void *)&self->name[OBJC_IVAR____TtC18TrustedPeersHelper9Container_operationWithSemaphore]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper9Container_dbAdapter));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18TrustedPeersHelper9Container_managedConfigurationAdapter));
}

@end