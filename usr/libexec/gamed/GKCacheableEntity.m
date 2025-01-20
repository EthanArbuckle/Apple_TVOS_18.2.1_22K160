@interface GKCacheableEntity
- (NSString)debugDescription;
- (_TtC14GameDaemonCore17GKCacheableEntity)init;
@end

@implementation GKCacheableEntity

- (NSString)debugDescription
{
  return (NSString *)sub_100152584(self, (uint64_t)a2, sub_1001525CC);
}

- (_TtC14GameDaemonCore17GKCacheableEntity)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14GameDaemonCore17GKCacheableEntity_entity));
  swift_bridgeObjectRelease( *(void *)&self->id[OBJC_IVAR____TtC14GameDaemonCore17GKCacheableEntity_bagKeyOverride],  v3);
}

@end