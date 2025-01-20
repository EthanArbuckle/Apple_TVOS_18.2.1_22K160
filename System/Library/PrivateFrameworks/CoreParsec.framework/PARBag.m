@interface PARBag
- (BOOL)configBoolForKey:(id)a3;
- (BOOL)isExpired;
- (NSString)searchURLString;
- (id)findConfigForUserAgent:(id)a3;
- (id)rawConfig;
- (id)valueForKey:(id)a3 ofType:(Class)a4;
- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4;
@end

@implementation PARBag

- (BOOL)isExpired
{
  v2 = self;
  BOOL v3 = PARBag.isExpired.getter();

  return v3;
}

- (NSString)searchURLString
{
  v2 = self;
  PARBag.searchURLString.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (id)rawConfig
{
  v2 = self;
  unint64_t v3 = (unint64_t)PARBag.rawConfig()();

  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return v4.super.isa;
}

- (id)findConfigForUserAgent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  PARBag.findConfig(forUserAgent:)(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (id)valueForKey:(id)a3 ofType:(Class)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a4);
  v7 = self;
  PARBag.value(forKey:ofType:)(ObjCClassMetadata, (uint64_t)v15);

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (!v16) {
    return 0LL;
  }
  v9 = sub_100019AFC(v15, v16);
  uint64_t v10 = *(void *)(v8 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v12, v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  sub_1000108B8(v15);
  return v13;
}

- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  v9 = self;
  PARBag.value(forKey:shouldConsiderOverrides:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  uint64_t v10 = v18;
  if (!v18) {
    return 0LL;
  }
  uint64_t v11 = sub_100019AFC(v17, v18);
  uint64_t v12 = *(void *)(v10 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v12 + 16))(v14);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  sub_1000108B8(v17);
  return v15;
}

- (BOOL)configBoolForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = PARBag.configBool(forKey:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

@end