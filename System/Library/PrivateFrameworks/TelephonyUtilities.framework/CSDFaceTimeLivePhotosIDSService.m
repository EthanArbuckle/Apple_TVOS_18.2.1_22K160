@interface CSDFaceTimeLivePhotosIDSService
+ (CSDFaceTimeLivePhotosIDSService)sharedInstance;
- (CSDFaceTimeLivePhotosIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeLivePhotosIDSService

+ (CSDFaceTimeLivePhotosIDSService)sharedInstance
{
  return (CSDFaceTimeLivePhotosIDSService *)sub_1001DBED8();
}

- (CSDFaceTimeLivePhotosIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (CSDFaceTimeLivePhotosIDSService *)sub_1001DBF18(v7, v8, a4, a5);
}

@end