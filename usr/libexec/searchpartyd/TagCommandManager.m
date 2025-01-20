@interface TagCommandManager
- (_TtC12searchpartyd17TagCommandManager)init;
@end

@implementation TagCommandManager

- (_TtC12searchpartyd17TagCommandManager)init
{
  result = (_TtC12searchpartyd17TagCommandManager *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.TagCommandManager",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_batteryFetchInFlight));
  swift_release(*(void *)&self->commandQueue[OBJC_IVAR____TtC12searchpartyd17TagCommandManager_commandManagerCreator]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_commandManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_beaconStore));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_tagCommandHandlers));
}

@end