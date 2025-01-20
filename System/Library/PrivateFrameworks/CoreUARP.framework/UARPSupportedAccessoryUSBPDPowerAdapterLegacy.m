@interface UARPSupportedAccessoryUSBPDPowerAdapterLegacy
- (UARPSupportedAccessoryUSBPDPowerAdapterLegacy)init;
@end

@implementation UARPSupportedAccessoryUSBPDPowerAdapterLegacy

- (UARPSupportedAccessoryUSBPDPowerAdapterLegacy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSBPDPowerAdapterLegacy;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setAutoAppliesStagedFirmware:](v2, "setAutoAppliesStagedFirmware:", 1LL);
    -[UARPSupportedAccessory setSupportsAccMode7:](v3, "setSupportsAccMode7:", 0LL);
  }

  return v3;
}

@end