@interface B2PBudVersionGetCommand
- (B2PBudVersionGetCommand)init;
- (B2PBudVersionGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PBudVersionGetCommand

- (B2PBudVersionGetCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PBudVersionGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 296LL);
}

- (B2PBudVersionGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end