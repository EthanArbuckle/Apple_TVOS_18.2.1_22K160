@interface SystemManager
- (_TtC8FaceTime13SystemManager)init;
- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5;
@end

@implementation SystemManager

- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002CA50(v10);
}

- (_TtC8FaceTime13SystemManager)init
{
  result = (_TtC8FaceTime13SystemManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SystemManager",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8FaceTime13SystemManager_suggestionAdvertisementManager));
  sub_10002C9C8( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime13SystemManager_sharePlayState),  *(void **)&self->queue[OBJC_IVAR____TtC8FaceTime13SystemManager_sharePlayState],  self->conversationManager[OBJC_IVAR____TtC8FaceTime13SystemManager_sharePlayState]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime13SystemManager_sharePlayStateCancellable));
}

@end