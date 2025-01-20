@interface DMDtvOSDeviceController
- (id)destinationIdentifier;
@end

@implementation DMDtvOSDeviceController

- (id)destinationIdentifier
{
  v2 = (NSString *)objc_claimAutoreleasedReturnValue(+[DMDMobileGestalt ethernetMacAddress](&OBJC_CLASS___DMDMobileGestalt, "ethernetMacAddress"));
  if (!v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSString);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDMobileGestalt wifiAddressData](&OBJC_CLASS___DMDMobileGestalt, "wifiAddressData"));
    v2 = -[NSString initWithData:encoding:](v3, "initWithData:encoding:", v4, 4LL);

    if (!v2) {
      v2 = (NSString *)objc_claimAutoreleasedReturnValue(+[DMDMobileGestalt wifiAddress](&OBJC_CLASS___DMDMobileGestalt, "wifiAddress"));
    }
  }

  return v2;
}

@end