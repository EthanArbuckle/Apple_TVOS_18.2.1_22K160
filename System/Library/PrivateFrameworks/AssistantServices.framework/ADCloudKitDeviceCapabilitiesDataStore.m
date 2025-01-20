@interface ADCloudKitDeviceCapabilitiesDataStore
- (ADCloudKitDeviceCapabilitiesDataStore)init;
@end

@implementation ADCloudKitDeviceCapabilitiesDataStore

- (ADCloudKitDeviceCapabilitiesDataStore)init
{
  v3 = objc_alloc_init(&OBJC_CLASS____ADCloudKitDeviceCapabilitiesStoreHelper);
  v4 = -[ADCloudKitCapabilitiesDataStore initWithHelper:](self, "initWithHelper:", v3);

  return v4;
}

@end