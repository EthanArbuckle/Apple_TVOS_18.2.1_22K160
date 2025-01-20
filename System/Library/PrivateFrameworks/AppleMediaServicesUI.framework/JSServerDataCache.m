@interface JSServerDataCache
- (_TtC14amsengagementd17JSServerDataCache)init;
- (id)data:(id)a3 :(id)a4 :(id)a5;
- (id)granularNotificationSettings:(id)a3 :(id)a4 :(id)a5;
- (id)offerRankingItemsForServices:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSServerDataCache

- (id)data:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000A9B64( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A8F8C);
}

- (id)granularNotificationSettings:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000A9B64( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A90E4);
}

- (id)offerRankingItemsForServices:(id)a3 :(id)a4 :(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  v8 = self;
  v9 = (void *)sub_1000A9C30();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC14amsengagementd17JSServerDataCache)init
{
  return (_TtC14amsengagementd17JSServerDataCache *)sub_1000AA904();
}

@end