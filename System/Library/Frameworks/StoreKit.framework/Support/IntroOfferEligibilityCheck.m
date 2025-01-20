@interface IntroOfferEligibilityCheck
- (IntroOfferEligibilityCheck)init;
- (NSString)bundleID;
- (NSString)groupID;
- (NSString)logKey;
- (NSString)storefrontID;
- (id)initForGroupID:(id)a3 bundleID:(id)a4 storefrontID:(id)a5 logKey:(id)a6;
- (int64_t)eligibilityBasedOnStatus:(id)a3;
@end

@implementation IntroOfferEligibilityCheck

- (NSString)groupID
{
  return (NSString *)sub_1000F4424((uint64_t)self, (uint64_t)a2, sub_1000F435C);
}

- (NSString)bundleID
{
  return (NSString *)sub_1000F4424((uint64_t)self, (uint64_t)a2, sub_1000F438C);
}

- (NSString)storefrontID
{
  if (v2)
  {
    uint64_t v3 = v2;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    NSString v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NSString)logKey
{
  return (NSString *)sub_1000F4424((uint64_t)self, (uint64_t)a2, sub_1000F4458);
}

- (id)initForGroupID:(id)a3 bundleID:(id)a4 storefrontID:(id)a5 logKey:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v14 = v13;
  if (!a5)
  {
    uint64_t v16 = 0LL;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v17 = 0LL;
    unint64_t v19 = 0LL;
    return sub_1000F447C(v9, v11, v12, v14, (uint64_t)a5, v16, v17, v19);
  }

  a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v16 = v15;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  unint64_t v19 = v18;
  return sub_1000F447C(v9, v11, v12, v14, (uint64_t)a5, v16, v17, v19);
}

- (int64_t)eligibilityBasedOnStatus:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8);
  }
  else {
    uint64_t v4 = 0LL;
  }
  v5 = self;
  int64_t v6 = sub_1000F4658(v4);

  swift_bridgeObjectRelease(v4);
  return v6;
}

- (IntroOfferEligibilityCheck)init
{
}

- (void).cxx_destruct
{
}

@end