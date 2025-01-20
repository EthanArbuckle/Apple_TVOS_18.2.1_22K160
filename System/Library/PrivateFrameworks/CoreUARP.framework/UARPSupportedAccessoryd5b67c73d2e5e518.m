@interface UARPSupportedAccessoryd5b67c73d2e5e518
+ (id)appleModelNumber;
+ (id)productGroup;
+ (id)productNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryd5b67c73d2e5e518)init;
- (id)description;
@end

@implementation UARPSupportedAccessoryd5b67c73d2e5e518

- (UARPSupportedAccessoryd5b67c73d2e5e518)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518;
  v2 = -[UARPSupportedAccessoryHID init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productGroup");
    -[UARPSupportedAccessory setProductGroup:](v2, "setProductGroup:", v3);
    v4 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productNumber");
    -[UARPSupportedAccessory setProductNumber:](v2, "setProductNumber:", v4);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Unity Remote");
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Universal Electronics Inc.");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v2, "setSupportsInternalSettings:", 0LL);
    v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryd5b67c73d2e5e518 vendorID]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "vendorID"),  +[UARPSupportedAccessoryd5b67c73d2e5e518 productID]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_opt_new();
  v4 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productGroup");
  v5 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productNumber");
  [v3 appendFormat:@"PG/PN: %@%@, ", v4, v5];

  [v3 appendFormat:@"HardwareID: %@", self->hwID];
  [NSString stringWithString:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)productGroup
{
  return @"d5b67c73";
}

+ (id)productNumber
{
  return @"d2e5e518";
}

+ (id)appleModelNumber
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productGroup");
  v4 = +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber]( &OBJC_CLASS___UARPSupportedAccessoryd5b67c73d2e5e518,  "productNumber");
  [v2 stringWithFormat:@"%@%@", v3, v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unsigned)vendorID
{
  return 147;
}

+ (unsigned)productID
{
  return -24576;
}

- (void).cxx_destruct
{
}

@end