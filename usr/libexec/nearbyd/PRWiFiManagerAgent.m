@interface PRWiFiManagerAgent
- (PRWiFiDeviceCapabilities)deviceCapabilities;
@end

@implementation PRWiFiManagerAgent

- (PRWiFiDeviceCapabilities)deviceCapabilities
{
  return (PRWiFiDeviceCapabilities)sub_100014420();
}

@end