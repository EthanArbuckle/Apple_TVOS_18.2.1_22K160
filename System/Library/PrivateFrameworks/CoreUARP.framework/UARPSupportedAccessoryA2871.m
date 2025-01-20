@interface UARPSupportedAccessoryA2871
+ (id)alternativeAppleModelNumbers;
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2871)init;
- (id)description;
@end

@implementation UARPSupportedAccessoryA2871

- (UARPSupportedAccessoryA2871)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2871;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v16, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2871 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2871, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Studio Buds");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v4 = +[UARPSupportedAccessoryA2871 alternativeAppleModelNumbers]( &OBJC_CLASS___UARPSupportedAccessoryA2871,  "alternativeAppleModelNumbers",  0LL);
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

    v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryBeatsBluetooth vendorID]( &OBJC_CLASS___UARPSupportedAccessoryBeatsBluetooth,  "vendorID"),  +[UARPSupportedAccessoryA2871 productID](&OBJC_CLASS___UARPSupportedAccessoryA2871, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v9;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_opt_new();
  v4 = +[UARPSupportedAccessoryA2871 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2871, "appleModelNumber");
  [v3 appendFormat:@"Apple Model Number: %@\n", v4];

  [v3 appendFormat:@"HardwareID: %@\n", self->hwID];
  -[UARPSupportedAccessory downstreamAppleModelNumbers](self, "downstreamAppleModelNumbers");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (v6)
  {
    -[UARPSupportedAccessory downstreamAppleModelNumbers](self, "downstreamAppleModelNumbers");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@", Downstream Apple Model Numbers = %@", v7];
  }

  -[UARPSupportedAccessory alternativeAppleModelNumbers](self, "alternativeAppleModelNumbers");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = -[UARPSupportedAccessory alternativeAppleModelNumbers](self, "alternativeAppleModelNumbers");
    [v3 appendFormat:@", Alternative Apple Model Numbers = %@", v10];
  }
  v11 = -[UARPSupportedAccessory mobileAssetAppleModelNumber](self, "mobileAssetAppleModelNumber");
  if (v11)
  {
    -[UARPSupportedAccessory mobileAssetAppleModelNumber](self, "mobileAssetAppleModelNumber");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@", Mobile Asset Apple Model Numbers = %@", v12];
  }

  [v3 appendFormat:@"\n"];
  [NSString stringWithString:v3];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)appleModelNumber
{
  return @"A2871";
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"A2872", @"A2952", 0);
}

+ (unsigned)productID
{
  return 8214;
}

- (void).cxx_destruct
{
}

@end