@interface UARPSupportedAccessoryA2580
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2580)init;
@end

@implementation UARPSupportedAccessoryA2580

- (UARPSupportedAccessoryA2580)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2580;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v16, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2580 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2580, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Charger");
    -[UARPSupportedAccessory setSupportsMappedAnalytics:](v2, "setSupportsMappedAnalytics:", 1LL);
    -[UARPSupportedAccessory setPersonalizationNotification:]( v2,  "setPersonalizationNotification:",  @"com.apple.uarp.UARPUpdaterServiceHID.personalizationNeeded");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v4 = +[UARPSupportedAccessoryA2580 alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2580,  "alternativeAppleModelNumbers",  0LL);
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

    v9 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2580 productID](&OBJC_CLASS___UARPSupportedAccessoryA2580, "productID"));
    hwID = v2->hwID;
    v2->hwID = v9;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2580";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"A3250", 0);
}

+ (unsigned)productID
{
  return 1286;
}

- (void).cxx_destruct
{
}

@end