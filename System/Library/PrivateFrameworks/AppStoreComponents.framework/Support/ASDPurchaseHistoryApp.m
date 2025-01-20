@interface ASDPurchaseHistoryApp
- (NSString)cleanedRedownloadParams;
@end

@implementation ASDPurchaseHistoryApp

- (NSString)cleanedRedownloadParams
{
  v2 = self;
  id v3 = -[ASDPurchaseHistoryApp redownloadParams](v2, "redownloadParams");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  v14[0] = 38LL;
  v14[1] = 0xE100000000000000LL;
  unint64_t v6 = sub_10006A134();
  uint64_t v7 = StringProtocol.components<A>(separatedBy:)(v14, &type metadata for String, &type metadata for String, v6, v6);
  swift_bridgeObjectRelease(v5);
  uint64_t v8 = sub_100029E18(&qword_10013DC00);
  unint64_t v9 = sub_100079024();
  BidirectionalCollection<>.joined(separator:)(38LL, 0xE100000000000000LL, v8, v9);
  uint64_t v11 = v10;

  swift_bridgeObjectRelease(v7);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return (NSString *)v12;
}

@end