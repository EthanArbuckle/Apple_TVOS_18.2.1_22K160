@interface RPCompanionLinkDevice
- (NSString)bm_companionLinkDeviceIdentifier;
@end

@implementation RPCompanionLinkDevice

- (NSString)bm_companionLinkDeviceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self, "idsDeviceIdentifier"));
  id v3 = [v2 copy];

  return (NSString *)v3;
}

@end