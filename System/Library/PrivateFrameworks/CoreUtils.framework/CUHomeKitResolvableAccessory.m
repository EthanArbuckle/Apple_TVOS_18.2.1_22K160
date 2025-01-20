@interface CUHomeKitResolvableAccessory
- (HMAccessory)accessory;
- (NSData)irkData;
- (void)setAccessory:(id)a3;
- (void)setIrkData:(id)a3;
@end

@implementation CUHomeKitResolvableAccessory

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end