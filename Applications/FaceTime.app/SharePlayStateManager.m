@interface SharePlayStateManager
- (_TtC8FaceTime21SharePlayStateManager)init;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)neighborhoodActivityConduit:(id)a3 joinedSplitSessionWithID:(id)a4 fromDevice:(id)a5 handoffContext:(id)a6;
- (void)neighborhoodActivityConduit:(id)a3 leftSplitSessionWithID:(id)a4;
- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3;
@end

@implementation SharePlayStateManager

- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004F50C("Refreshing SharePlay state because nearby conversations changing.");
}

- (void)neighborhoodActivityConduit:(id)a3 joinedSplitSessionWithID:(id)a4 fromDevice:(id)a5 handoffContext:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  sub_10004F39C((uint64_t)v14, "Refreshing SharePlay state because we joined a split session.");

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)neighborhoodActivityConduit:(id)a3 leftSplitSessionWithID:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  uint64_t v12 = self;
  sub_10004F39C((uint64_t)v10, "Refreshing SharePlay state because we left a split session.");

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_10004F50C("Refreshing SharePlay state because a conversation changed state.");
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10004F50C("Refreshing SharePlay state because an active conversation was added.");
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10004F50C("Refreshing SharePlay state because an active conversation was removed.");
}

- (_TtC8FaceTime21SharePlayStateManager)init
{
  result = (_TtC8FaceTime21SharePlayStateManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SharePlayStateManager",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime21SharePlayStateManager_neighborhoodActivityConduit));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime21SharePlayStateManager_sharePlayState));
}

@end