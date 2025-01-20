@interface UARPSupportedAccessoryA2513
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2513)init;
@end

@implementation UARPSupportedAccessoryA2513

- (UARPSupportedAccessoryA2513)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2513;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v16, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2513 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2513, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Studio Buds");
    -[UARPSupportedAccessory setSupportsHeySiriCompact:](v2, "setSupportsHeySiriCompact:", 0LL);
    -[UARPSupportedAccessory setSupportsVoiceAssist:](v2, "setSupportsVoiceAssist:", 1LL);
    -[UARPSupportedAccessory addSupplementalAssetName:](v2, "addSupplementalAssetName:", @"VoiceAssist");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v4 = +[UARPSupportedAccessoryA2513 alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2513,  "alternativeAppleModelNumbers",  0LL);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          -[UARPSupportedAccessory addAlternativeAppleModelNumber:]( v2,  "addAlternativeAppleModelNumber:",  *(void *)(*((void *)&v12 + 1) + 8 * v8++));
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v6);
    }

    v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryBeatsBluetooth vendorID]( &OBJC_CLASS___UARPSupportedAccessoryBeatsBluetooth,  "vendorID"),  +[UARPSupportedAccessoryA2513 productID](&OBJC_CLASS___UARPSupportedAccessoryA2513, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v9;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2513";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"A2512", 0);
}

+ (unsigned)productID
{
  return 8209;
}

- (void).cxx_destruct
{
}

@end