@interface SDAutoUnlockRangingPeer
- (NSData)macAddressData;
- (_NIRangingPeer)niRangingPeer;
- (void)setMacAddressData:(id)a3;
- (void)setNiRangingPeer:(id)a3;
@end

@implementation SDAutoUnlockRangingPeer

- (_NIRangingPeer)niRangingPeer
{
  return self->_niRangingPeer;
}

- (void)setNiRangingPeer:(id)a3
{
}

- (NSData)macAddressData
{
  return self->_macAddressData;
}

- (void)setMacAddressData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end