@interface CLAvengerScannerClientObjectDiscoveryData
- (BOOL)beepOnMoveHigh;
- (BOOL)didCauseWake;
- (BOOL)isApple;
- (BOOL)isNearOwner;
- (BOOL)isPosh;
- (CLAvengerScannerClientObjectDiscoveryData)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 channel:(id)a9 didCauseWake:(BOOL)a10 detailsBitmask:(unsigned int)a11 protocolID:(id)a12;
- (NSData)address;
- (NSData)advertisementData;
- (NSData)reserved;
- (NSDate)scanDate;
- (NSNumber)channel;
- (NSNumber)protocolID;
- (int64_t)rssi;
- (unsigned)detailsBitmask;
- (unsigned)status;
- (void)dealloc;
@end

@implementation CLAvengerScannerClientObjectDiscoveryData

- (CLAvengerScannerClientObjectDiscoveryData)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 channel:(id)a9 didCauseWake:(BOOL)a10 detailsBitmask:(unsigned int)a11 protocolID:(id)a12
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CLAvengerScannerClientObjectDiscoveryData;
  v18 = -[CLAvengerScannerClientObjectDiscoveryData init](&v20, "init");
  if (v18)
  {
    v18->_address = (NSData *)a3;
    v18->_advertisementData = (NSData *)a4;
    v18->_status = a5;
    v18->_reserved = (NSData *)a6;
    v18->_rssi = a7;
    v18->_scanDate = (NSDate *)a8;
    v18->_channel = (NSNumber *)a9;
    v18->_didCauseWake = a10;
    v18->_detailsBitmask = a11;
    v18->_protocolID = (NSNumber *)[a12 copy];
  }

  return v18;
}

- (void)dealloc
{
  self->_address = 0LL;
  self->_advertisementData = 0LL;

  self->_reserved = 0LL;
  self->_scanDate = 0LL;

  self->_channel = 0LL;
  self->_protocolID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScannerClientObjectDiscoveryData;
  -[CLAvengerScannerClientObjectDiscoveryData dealloc](&v3, "dealloc");
}

- (BOOL)isPosh
{
  return self->_detailsBitmask & 1;
}

- (BOOL)isApple
{
  return (LOBYTE(self->_detailsBitmask) >> 1) & 1;
}

- (BOOL)isNearOwner
{
  return (LOBYTE(self->_detailsBitmask) >> 2) & 1;
}

- (BOOL)beepOnMoveHigh
{
  NSUInteger v3 = -[NSData length](self->_reserved, "length");
  if (v3)
  {
    -[NSData getBytes:length:](self->_reserved, "getBytes:length:", &v5, 1LL);
    LODWORD(v3) = (v5 >> 2) & 1;
  }

  return v3;
}

- (NSData)address
{
  return self->_address;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (BOOL)didCauseWake
{
  return self->_didCauseWake;
}

- (unsigned)detailsBitmask
{
  return self->_detailsBitmask;
}

- (NSNumber)protocolID
{
  return self->_protocolID;
}

@end