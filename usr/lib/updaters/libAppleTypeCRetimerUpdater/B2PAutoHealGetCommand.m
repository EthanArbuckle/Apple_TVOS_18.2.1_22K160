@interface B2PAutoHealGetCommand
- (B2PAutoHealGetCommand)init;
- (B2PAutoHealGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PAutoHealGetCommand

- (B2PAutoHealGetCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PAutoHealGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 374LL);
}

- (B2PAutoHealGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end