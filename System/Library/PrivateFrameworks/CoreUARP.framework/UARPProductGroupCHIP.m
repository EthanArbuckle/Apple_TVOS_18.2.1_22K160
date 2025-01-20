@interface UARPProductGroupCHIP
- (UARPProductGroupCHIP)initWithVendorID:(unsigned __int16)a3;
@end

@implementation UARPProductGroupCHIP

- (UARPProductGroupCHIP)initWithVendorID:(unsigned __int16)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPProductGroupCHIP;
  v5 = -[UARPProductGroup initWithIdentifier:](&v7, sel_initWithIdentifier_, v4);

  return v5;
}

@end