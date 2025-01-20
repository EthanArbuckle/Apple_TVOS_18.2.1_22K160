@interface B2PDataSessionConnectCommand
- (B2PDataSessionConnectCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
- (B2PDataSessionConnectCommand)initWithSessionID:(unsigned __int8)a3 state:(int)a4;
- (id)data;
- (id)description;
- (int)state;
- (unsigned)sessionID;
- (void)setSessionID:(unsigned __int8)a3;
- (void)setState:(int)a3;
@end

@implementation B2PDataSessionConnectCommand

- (B2PDataSessionConnectCommand)initWithSessionID:(unsigned __int8)a3 state:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___B2PDataSessionConnectCommand;
  result = -[B2PCommand initWithOpCode:](&v7, sel_initWithOpCode_, 16LL);
  if (result)
  {
    *(&result->super._route + 2) = a3;
    *(_DWORD *)&result->_sessionID = a4;
  }

  return result;
}

- (B2PDataSessionConnectCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendByte:*(&self->super._route + 2)];
  [v3 appendByte:self->_sessionID];
  [MEMORY[0x189603F48] dataWithData:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PDataSessionConnectCommand;
  v4 = -[B2PCommand description](&v8, sel_description);
  [v3 stringWithFormat:@"%@\n", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "appendFormat:",  @"\tSession ID: %u (%s)\n",  *(&self->super._route + 2),  stringForB2PDataSessionID(*(&self->super._route + 2)));
  objc_msgSend(v5, "appendFormat:", @"\tState: %s", stringForB2PDataSessionState(*(_DWORD *)&self->_sessionID));
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)sessionID
{
  return *(&self->super._route + 2);
}

- (void)setSessionID:(unsigned __int8)a3
{
  *(&self->super._route + 2) = a3;
}

- (int)state
{
  return *(_DWORD *)&self->_sessionID;
}

- (void)setState:(int)a3
{
  *(_DWORD *)&self->_sessionID = a3;
}

@end