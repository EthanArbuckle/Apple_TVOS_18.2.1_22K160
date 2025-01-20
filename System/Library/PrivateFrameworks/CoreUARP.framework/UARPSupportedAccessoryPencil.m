@interface UARPSupportedAccessoryPencil
+ (unsigned)vendorID;
- (UARPSupportedAccessoryPencil)init;
@end

@implementation UARPSupportedAccessoryPencil

- (UARPSupportedAccessoryPencil)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryPencil;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Apple Pencil");
  }
  return v3;
}

+ (unsigned)vendorID
{
  return 76;
}

@end