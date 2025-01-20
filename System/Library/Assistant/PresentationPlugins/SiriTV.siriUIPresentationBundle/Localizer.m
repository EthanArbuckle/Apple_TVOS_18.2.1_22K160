@interface Localizer
+ (id)localizedString:(id)a3;
+ (id)siriUI_localizedString:(id)a3;
@end

@implementation Localizer

+ (id)localizedString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  sub_6F00C(v4, (uint64_t)v6);
  v8 = (_TtC6SiriTV27ConversationViewCoordinator *)v7;
  swift_bridgeObjectRelease(v6, v7, v9, v10, v11, v12, v13, v14);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8, v16, v17, v18, v19, v20, v21, v22);
  return v15;
}

+ (id)siriUI_localizedString:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (_TtC6SiriTV27ConversationViewCoordinator *)v4;
  sub_6F190(v3, v4);
  v7 = (_TtC6SiriTV27ConversationViewCoordinator *)v6;
  swift_bridgeObjectRelease(v5, v6, v8, v9, v10, v11, v12, v13);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7, v15, v16, v17, v18, v19, v20, v21);
  return v14;
}

@end