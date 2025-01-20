@interface B2PDataSessionDataCommand
- (B2PDataSessionDataCommand)initWithSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5;
- (BOOL)parseCommand:(id)a3;
- (NSData)sessionData;
- (id)data;
- (id)description;
- (int)status;
- (unsigned)sessionID;
- (void)setSessionData:(id)a3;
- (void)setSessionID:(unsigned __int8)a3;
- (void)setStatus:(int)a3;
@end

@implementation B2PDataSessionDataCommand

- (B2PDataSessionDataCommand)initWithSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___B2PDataSessionDataCommand;
  v9 = -[B2PCommand initWithOpCode:](&v14, sel_initWithOpCode_, 18LL);
  v10 = v9;
  if (v9)
  {
    v9->_sessionID = a3;
    v9->_status = a4;
    uint64_t v11 = [v8 copy];
    sessionData = v10->_sessionData;
    v10->_sessionData = (NSData *)v11;
  }

  return v10;
}

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendByte:self->_sessionID];
  [v3 appendByte:LOBYTE(self->_status)];
  [v3 appendData:self->_sessionData];
  [MEMORY[0x189603F48] dataWithData:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)parseCommand:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 2)
  {
    id v6 = v4;
    v7 = (unsigned __int8 *)[v6 bytes];
    self->_sessionID = *v7;
    self->_status = v7[1];
    uint64_t v8 = [v6 length];
    if (v8 != 2)
    {
      [MEMORY[0x189603F48] dataWithBytes:v7 + 2 length:v8 - 2];
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      sessionData = self->_sessionData;
      self->_sessionData = v9;
    }
  }

  return v5 > 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___B2PDataSessionDataCommand;
  -[B2PCommand description](&v9, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "appendFormat:",  @"\tSession ID: %u (%s)\n",  self->_sessionID,  stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend(v5, "appendFormat:", @"\tStatus: %s\n", stringForB2PDataSessionStatus(self->_status));
  -[NSData byteString](self->_sessionData, "byteString");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"\tData: %@\n", v6];

  [NSString stringWithString:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned __int8)a3
{
  self->_sessionID = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSData)sessionData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSessionData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end