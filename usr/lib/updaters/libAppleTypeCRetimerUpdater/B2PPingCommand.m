@interface B2PPingCommand
- (B2PPingCommand)init;
- (B2PPingCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
- (id)data;
- (id)description;
@end

@implementation B2PPingCommand

- (B2PPingCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PPingCommand;
  result = -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 0LL);
  if (result) {
    *(&result->super._route + 1) = 2;
  }
  return result;
}

- (B2PPingCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

- (id)data
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendByte:0];
  [v3 appendByte:*(&self->super._route + 1)];
  [MEMORY[0x189603F48] dataWithData:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PPingCommand;
  v4 = -[B2PCommand description](&v8, sel_description);
  [v3 stringWithFormat:@"%@\n", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "appendFormat:",  @"\tProtocol Version: %s",  stringForB2PProtocolVersion(*(&self->super._route + 1)));
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end