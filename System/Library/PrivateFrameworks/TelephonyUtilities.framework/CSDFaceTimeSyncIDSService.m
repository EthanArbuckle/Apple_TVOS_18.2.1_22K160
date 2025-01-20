@interface CSDFaceTimeSyncIDSService
+ (CSDFaceTimeSyncIDSService)sharedInstance;
- (CSDFaceTimeSyncIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeSyncIDSService

+ (CSDFaceTimeSyncIDSService)sharedInstance
{
  return (CSDFaceTimeSyncIDSService *)sub_100252480();
}

- (CSDFaceTimeSyncIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (CSDFaceTimeSyncIDSService *)sub_1002524C0(v7, v8, a4, a5);
}

@end