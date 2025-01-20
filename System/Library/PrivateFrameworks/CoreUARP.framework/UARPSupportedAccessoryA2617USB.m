@interface UARPSupportedAccessoryA2617USB
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2617USB)init;
@end

@implementation UARPSupportedAccessoryA2617USB

- (UARPSupportedAccessoryA2617USB)init
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2617USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v17, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2617USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2617USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case");
    -[UARPSupportedAccessory setFusingOverrideUnfused:](v2, "setFusingOverrideUnfused:", @"prod");
    v4 = +[UARPSupportedAccessoryA2699 mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA2699,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = +[UARPSupportedAccessoryA2617USB alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2617USB,  "alternativeAppleModelNumbers",  0LL);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          -[UARPSupportedAccessory addAlternativeAppleModelNumber:]( v2,  "addAlternativeAppleModelNumber:",  *(void *)(*((void *)&v13 + 1) + 8 * v9++));
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v7);
    }

    -[UARPSupportedAccessory setPersonalizationNotification:]( v2,  "setPersonalizationNotification:",  @"com.apple.uarp.BTLEServer.personalizationNeeded");
    v10 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryAirPodsCaseUSB vendorID]( &OBJC_CLASS___UARPSupportedAccessoryAirPodsCaseUSB,  "vendorID"),  +[UARPSupportedAccessoryA2617USB productID](&OBJC_CLASS___UARPSupportedAccessoryA2617USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v10;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2617 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2617, "appleModelNumber");
}

+ (id)alternativeAppleModelNumbers
{
  return +[UARPSupportedAccessoryA2617 alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2617,  "alternativeAppleModelNumbers");
}

+ (unsigned)productID
{
  return 4373;
}

- (void).cxx_destruct
{
}

@end