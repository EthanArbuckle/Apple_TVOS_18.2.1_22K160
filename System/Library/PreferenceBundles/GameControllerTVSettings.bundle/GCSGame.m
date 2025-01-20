@interface GCSGame
- (BOOL)customizable;
- (BOOL)profileExistsFor:(id)a3 with:(id)a4;
- (NSString)localizedName;
- (id)profileFor:(id)a3 with:(id)a4;
@end

@implementation GCSGame

- (id)profileFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_17E34(v6, v7);

  return v9;
}

- (BOOL)profileExistsFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_18384(v6, v7);

  return v9;
}

- (BOOL)customizable
{
  v2 = self;
  id v3 = -[GCSGame bundleIdentifier](v2, "bundleIdentifier");
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  id v7 = [(id)objc_opt_self(GCSGame) defaultIdentifier];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n(v6, 2LL);
    char v13 = 0;
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v8, v10, 0LL);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
    char v13 = v12 ^ 1;
  }

  return v13 & 1;
}

- (NSString)localizedName
{
  v2 = self;
  sub_18DC4();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end