@interface CSDFaceTimeMultiwayIDSService
+ (CSDFaceTimeMultiwayIDSService)sharedInstance;
- (CSDFaceTimeMultiwayIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeMultiwayIDSService

+ (CSDFaceTimeMultiwayIDSService)sharedInstance
{
  return (CSDFaceTimeMultiwayIDSService *)sub_1001DEAE4();
}

- (CSDFaceTimeMultiwayIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (CSDFaceTimeMultiwayIDSService *)sub_1001DEB24(v7, v8, a4, a5);
}

@end