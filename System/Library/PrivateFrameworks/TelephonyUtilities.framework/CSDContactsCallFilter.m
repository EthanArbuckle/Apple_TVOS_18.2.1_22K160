@interface CSDContactsCallFilter
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (CSDContactsCallFilter)init;
@end

@implementation CSDContactsCallFilter

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10025727C(v4);

  return self & 1;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v14 = v13;
  v15 = self;
  sub_100257930(v8, v10, v11, (unint64_t)a4);
  char v17 = v16;

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(a4);
  return v17 & 1;
}

- (CSDContactsCallFilter)init
{
  return (CSDContactsCallFilter *)sub_1002585F4();
}

- (void).cxx_destruct
{
}

@end