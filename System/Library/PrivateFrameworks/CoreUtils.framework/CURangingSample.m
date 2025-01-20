@interface CURangingSample
- (NSData)deviceAddress;
- (NSString)deviceModel;
- (id)description;
- (int)channel;
- (int)rawRSSI;
- (void)setChannel:(int)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setRawRSSI:(int)a3;
@end

@implementation CURangingSample

- (id)description
{
  return NSPrintF();
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (void)setRawRSSI:(int)a3
{
  self->_rawRSSI = a3;
}

- (void).cxx_destruct
{
}

@end