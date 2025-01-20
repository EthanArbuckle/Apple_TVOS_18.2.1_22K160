@interface ContentPlattersViewCoordinator
- (id)createVisualResponseShownEventWithCardData:(id)a3 responseViewId:(id)a4;
@end

@implementation ContentPlattersViewCoordinator

- (id)createVisualResponseShownEventWithCardData:(id)a3 responseViewId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  swift_retain(self);
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v13 = v12;

  sub_71DA8();
  v15 = v14;
  swift_bridgeObjectRelease(v13, v16, v17, v18, v19, v20, v21, v22);
  sub_DA84(v9, v11);
  swift_release(self);
  return v15;
}

@end