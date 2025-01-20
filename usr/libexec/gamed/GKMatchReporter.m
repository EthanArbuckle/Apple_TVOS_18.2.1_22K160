@interface GKMatchReporter
+ (GKMatchReporter)shared;
+ (void)onInviteReceivedWithBulletin:(id)a3;
- (GKMatchReporter)init;
- (void)recordActiveDevicesWithCount:(id)a3;
- (void)recordGameCompleteWithCompletion:(id)a3;
- (void)recordGameStart;
- (void)recordMatchCompleteWithMatchType:(id)a3 result:(id)a4 completion:(id)a5;
- (void)recordMatchServerWithType:(id)a3;
- (void)recordMatchStartWithType:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5;
- (void)recordSharePlayDevicesWithCount:(id)a3;
@end

@implementation GKMatchReporter

+ (GKMatchReporter)shared
{
  return (GKMatchReporter *)static MatchReporter.shared.getter();
}

- (GKMatchReporter)init
{
  return (GKMatchReporter *)sub_100177600();
}

- (void)recordMatchStartWithType:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  MatchReporter.recordMatchStart(type:minPlayers:maxPlayers:)(v14, (NSNumber)v11, (NSNumber)v12);

  swift_bridgeObjectRelease(v10, v15);
}

- (void)recordMatchServerWithType:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  MatchReporter.recordMatchServer(type:)(v8);

  swift_bridgeObjectRelease(v6, v9);
}

- (void)recordActiveDevicesWithCount:(id)a3
{
  id v4 = a3;
  v5 = self;
  MatchReporter.recordActiveDevices(count:)((NSNumber)v4);
}

- (void)recordSharePlayDevicesWithCount:(id)a3
{
  id v4 = a3;
  v5 = self;
  MatchReporter.recordSharePlayDevices(count:)((NSNumber)v4);
}

- (void)recordMatchCompleteWithMatchType:(id)a3 result:(id)a4 completion:(id)a5
{
  Swift::String v8 = _Block_copy(a5);
  if (!a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v9;
  if (a4)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

- (void)recordGameStart
{
  v2 = self;
  MatchReporter.recordGameStart()();
}

- (void)recordGameCompleteWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100275FE8, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  MatchReporter.recordGameComplete(completion:)();

  swift_release(v5);
}

+ (void)onInviteReceivedWithBulletin:(id)a3
{
  id v3 = a3;
  static MatchReporter.onInviteReceived(bulletin:)();
}

- (void).cxx_destruct
{
}

@end