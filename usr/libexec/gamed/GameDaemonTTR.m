@interface GameDaemonTTR
- (_TtC14GameDaemonCore13GameDaemonTTR)init;
- (_TtC14GameDaemonCore13GameDaemonTTR)initWithClientProxyBundleIdentifier:(id)a3 localPlayer:(id)a4;
- (id)getURLForExistingMultiplayerRadarWithRadarID:(id)a3;
- (id)getURLForNewMultiplayerRadarWithCallbackIdentifier:(id)a3 descriptionAddition:(id)a4;
@end

@implementation GameDaemonTTR

- (_TtC14GameDaemonCore13GameDaemonTTR)initWithClientProxyBundleIdentifier:(id)a3 localPlayer:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC14GameDaemonCore13GameDaemonTTR *)GameDaemonTTR.init(clientProxyBundleIdentifier:localPlayer:)( v5,  v6,  a4);
}

- (id)getURLForNewMultiplayerRadarWithCallbackIdentifier:(id)a3 descriptionAddition:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
    if (v4)
    {
LABEL_3:
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
      id v4 = v10;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    v8 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
  }

  uint64_t v9 = 0LL;
LABEL_6:
  v11 = self;
  v12.value._countAndFlagsBits = v6;
  v12.value._object = v8;
  v13.value._countAndFlagsBits = v9;
  v13.value._object = v4;
  object = GameDaemonTTR.getURLForNewMultiplayerRadar(callbackIdentifier:descriptionAddition:)(v12, v13).value._object;

  swift_bridgeObjectRelease(v4, v15);
  swift_bridgeObjectRelease(v8, v16);
  if (object)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object, v18);
  }

  else
  {
    NSString v17 = 0LL;
  }

  return v17;
}

- (id)getURLForExistingMultiplayerRadarWithRadarID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = GameDaemonTTR.getURLForExistingMultiplayerRadar(radarID:)(v8).value._object;

  swift_bridgeObjectRelease(v6, v10);
  if (object)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object, v12);
  }

  else
  {
    NSString v11 = 0LL;
  }

  return v11;
}

- (_TtC14GameDaemonCore13GameDaemonTTR)init
{
}

- (void).cxx_destruct
{
}

@end