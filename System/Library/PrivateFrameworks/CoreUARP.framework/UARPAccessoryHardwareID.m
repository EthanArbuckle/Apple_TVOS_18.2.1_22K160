@interface UARPAccessoryHardwareID
- (UARPAccessoryHardwareID)init;
- (UARPAccessoryHardwareID)initWithTransport:(int64_t)a3;
- (int64_t)transport;
@end

@implementation UARPAccessoryHardwareID

- (UARPAccessoryHardwareID)init
{
  return 0LL;
}

- (UARPAccessoryHardwareID)initWithTransport:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPAccessoryHardwareID;
  result = -[UARPAccessoryHardwareID init](&v5, sel_init);
  if (result) {
    result->_transport = a3;
  }
  return result;
}

- (int64_t)transport
{
  return self->_transport;
}

@end