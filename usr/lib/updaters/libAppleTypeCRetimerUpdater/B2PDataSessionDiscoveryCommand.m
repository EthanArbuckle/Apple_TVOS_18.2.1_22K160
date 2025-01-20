@interface B2PDataSessionDiscoveryCommand
- (B2PDataSessionDiscoveryCommand)init;
- (B2PDataSessionDiscoveryCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PDataSessionDiscoveryCommand

- (B2PDataSessionDiscoveryCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PDataSessionDiscoveryCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 38LL);
}

- (B2PDataSessionDiscoveryCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end