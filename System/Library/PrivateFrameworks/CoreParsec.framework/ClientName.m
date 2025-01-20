@interface ClientName
+ (id)extractClientNameFromString:(id)a3;
+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4;
- (_TtC7parsecd10ClientName)init;
@end

@implementation ClientName

+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    unint64_t v8 = 0LL;
  }

  swift_getObjCClassMetadata(a1);
  static ClientName.extractClientNameFromUserAgent(_:allowAbbreviation:)(v6, v8, a4);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v11 = 0LL;
  }

  return v11;
}

+ (id)extractClientNameFromString:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v5 = 0LL;
  }

  static ClientName.extractClientNameFromString(_:)(v3, v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v8 = 0LL;
  }

  return v8;
}

- (_TtC7parsecd10ClientName)init
{
  return (_TtC7parsecd10ClientName *)ClientName.init()();
}

@end