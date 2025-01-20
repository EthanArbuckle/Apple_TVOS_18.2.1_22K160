@interface CUMobileDeviceMonitorContext
- (CUMobileDevice)device;
- (CUMobileDeviceDiscovery)discovery;
- (void)setDevice:(id)a3;
- (void)setDiscovery:(id)a3;
@end

@implementation CUMobileDeviceMonitorContext

- (CUMobileDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (CUMobileDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end