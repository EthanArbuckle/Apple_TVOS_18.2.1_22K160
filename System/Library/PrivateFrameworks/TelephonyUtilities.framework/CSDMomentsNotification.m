@interface CSDMomentsNotification
- (CSDMomentsNotification)init;
- (CSDMomentsNotification)initWithStreamToken:(unint64_t)a3 requesterID:(id)a4;
- (NSString)requesterID;
- (unint64_t)streamToken;
@end

@implementation CSDMomentsNotification

- (unint64_t)streamToken
{
  return sub_10023CB5C();
}

- (NSString)requesterID
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (CSDMomentsNotification)initWithStreamToken:(unint64_t)a3 requesterID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (CSDMomentsNotification *)sub_10023CBDC(a3, v5, v6);
}

- (CSDMomentsNotification)init
{
}

- (void).cxx_destruct
{
}

@end