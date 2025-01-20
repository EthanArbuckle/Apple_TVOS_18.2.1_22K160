@interface B2PFirmwareVersionGetCommand
- (B2PFirmwareVersionGetCommand)init;
- (B2PFirmwareVersionGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PFirmwareVersionGetCommand

- (B2PFirmwareVersionGetCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PFirmwareVersionGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 260LL);
}

- (B2PFirmwareVersionGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end