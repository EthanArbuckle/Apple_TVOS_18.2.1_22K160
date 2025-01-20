@interface Transcript
- (_TtC10LinkDaemon10Transcript)init;
- (void)deleteAllRecordsWithReply:(id)a3;
- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4;
- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7;
- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5;
- (void)donateWithActionRecord:(id)a3 reply:(id)a4;
- (void)requestReadAccessForStream:(id)a3 reply:(id)a4;
- (void)requestReadAccessWithReply:(id)a3;
- (void)startObservingNextActionStreamWithCompletion:(id)a3;
- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4;
@end

@implementation Transcript

- (_TtC10LinkDaemon10Transcript)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10LinkDaemon10Transcript_nextActionObserverConnections));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon10Transcript_nextActionLock));
}

- (void)donateWithActionRecord:(id)a3 reply:(id)a4
{
}

- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  _Block_copy(v8);
  sub_10002AE04(v10, v12, v5, (char *)v13, v8);
  _Block_release(v8);
  sub_10000A1D8(v10, (unint64_t)v12);
}

- (void)requestReadAccessWithReply:(id)a3
{
}

- (void)deleteAllRecordsWithReply:(id)a3
{
}

- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4
{
}

- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  v21 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v17 = v16;

  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  unint64_t v20 = v19;

  _Block_copy(v12);
  sub_10002E4F8(v15, v17, v18, v20, a5, v7, v21, v12);
  _Block_release(v12);
  swift_bridgeObjectRelease(v20);
  sub_10000A1D8(v15, v17);
}

- (void)requestReadAccessForStream:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v9 = v8;
  _Block_copy(v6);
  uint64_t v10 = self;
  sub_10002EBC0(v7, v9, (uint64_t)v10, (void (**)(void, void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)startObservingNextActionStreamWithCompletion:(id)a3
{
}

- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_10002F634((uint64_t)v10, (uint64_t)v12, (void (**)(void, void))v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end