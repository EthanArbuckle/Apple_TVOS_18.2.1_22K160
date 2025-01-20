@interface EAREuclid
- (_TtC22localspeechrecognition9EAREuclid)init;
- (void)computeEmbeddings:(id)a3 reply:(id)a4;
- (void)distanceBetweenSource:(id)a3 target:(id)a4 reply:(id)a5;
- (void)embeddingDimWithReply:(id)a3;
- (void)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4 reply:(id)a5;
- (void)fullVersionWithReply:(id)a3;
- (void)majorVersionWithReply:(id)a3;
- (void)maxInputLengthWithReply:(id)a3;
- (void)minorVersionWithReply:(id)a3;
- (void)patchVersionWithReply:(id)a3;
@end

@implementation EAREuclid

- (void)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_10000CE10(v9, v11, a4, (char *)v12, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)distanceBetweenSource:(id)a3 target:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_10000D3B0(v9, v11, v12, v14, (uint64_t)v15, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
}

- (void)computeEmbeddings:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  v8 = self;
  sub_10000D818(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7);
}

- (void)maxInputLengthWithReply:(id)a3
{
}

- (void)embeddingDimWithReply:(id)a3
{
}

- (void)fullVersionWithReply:(id)a3
{
}

- (void)majorVersionWithReply:(id)a3
{
}

- (void)minorVersionWithReply:(id)a3
{
}

- (void)patchVersionWithReply:(id)a3
{
}

- (_TtC22localspeechrecognition9EAREuclid)init
{
}

- (void).cxx_destruct
{
}

@end