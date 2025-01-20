@interface UARPSupportedAccessoryA2699
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (id)mobileAssetAppleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2699)init;
@end

@implementation UARPSupportedAccessoryA2699

- (UARPSupportedAccessoryA2699)init
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2699;
  v2 = -[UARPSupportedAccessoryAirPodsBud init](&v17, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2699 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2699, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2");
    v4 = +[UARPSupportedAccessoryA2699 mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA2699,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = +[UARPSupportedAccessoryA2699 alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2699,  "alternativeAppleModelNumbers",  0LL);
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

    v10 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryAirPodsBud vendorID](&OBJC_CLASS___UARPSupportedAccessoryAirPodsBud, "vendorID"),  +[UARPSupportedAccessoryA2699 productID](&OBJC_CLASS___UARPSupportedAccessoryA2699, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v10;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2699";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"A2618",  @"A2619",  @"A2698",  @"A2931",  0);
}

+ (id)mobileAssetAppleModelNumber
{
  return @"A2618";
}

+ (unsigned)productID
{
  return 8212;
}

- (void).cxx_destruct
{
}

@end