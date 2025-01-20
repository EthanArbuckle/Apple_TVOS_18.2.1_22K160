@interface Upsell
+ (BOOL)isSupportedWithType:(int64_t)a3;
+ (void)showPageWithType:(int64_t)a3;
+ (void)showPageWithType:(int64_t)a3 song:(id)a4;
+ (void)showPlaybackUpsellWithId:(id)a3 kind:(id)a4 artworkURL:(id)a5;
- (_TtC7TVMusic6Upsell)init;
@end

@implementation Upsell

+ (BOOL)isSupportedWithType:(int64_t)a3
{
  return sub_100138180(a3) & 1;
}

+ (void)showPageWithType:(int64_t)a3
{
}

+ (void)showPageWithType:(int64_t)a3 song:(id)a4
{
  id v6 = a4;
  sub_100138440(a3, a4);
}

+ (void)showPlaybackUpsellWithId:(id)a3 kind:(id)a4 artworkURL:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  sub_100138938(v7, v9, v10, v12, v13, (uint64_t)a5);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(a5);
}

- (_TtC7TVMusic6Upsell)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Upsell();
  return -[Upsell init](&v3, "init");
}

@end