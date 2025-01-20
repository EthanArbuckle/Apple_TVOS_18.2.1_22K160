@interface B2PIdentificationCommand
- (B2PIdentificationCommand)init;
- (B2PIdentificationCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
- (id)data;
- (id)description;
- (int)infoID;
@end

@implementation B2PIdentificationCommand

- (B2PIdentificationCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PIdentificationCommand;
  result = -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 2LL);
  if (result) {
    *(_DWORD *)(&result->super._route + 2) = 0;
  }
  return result;
}

- (B2PIdentificationCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

- (id)data
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendByte:*(&self->super._route + 2)];
  [MEMORY[0x189603F48] dataWithData:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PIdentificationCommand;
  v4 = -[B2PCommand description](&v8, sel_description);
  [v3 stringWithFormat:@"%@\n", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", @"\tInfo ID: %s", stringForB2PInfoID(*(_DWORD *)(&self->super._route + 2)));
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)infoID
{
  return *(_DWORD *)(&self->super._route + 2);
}

@end