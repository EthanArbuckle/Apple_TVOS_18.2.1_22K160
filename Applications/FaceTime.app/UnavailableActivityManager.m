@interface UnavailableActivityManager
- (_TtC8FaceTime26UnavailableActivityManager)init;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4;
@end

@implementation UnavailableActivityManager

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000421B4(v7);
}

- (_TtC8FaceTime26UnavailableActivityManager)init
{
  result = (_TtC8FaceTime26UnavailableActivityManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.UnavailableActivityManager",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_bulletinManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_neighborhoodActivityConduit));
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_sharePlayStateManager));
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_userNotificationManager));
  sub_10002C9C8( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_sharePlayState),  *(void **)&self->queue[OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_sharePlayState],  self->bulletinManager[OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_sharePlayState]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_sharePlayStateCancellable));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime26UnavailableActivityManager_unavailableActivityUUIDs));
}

@end