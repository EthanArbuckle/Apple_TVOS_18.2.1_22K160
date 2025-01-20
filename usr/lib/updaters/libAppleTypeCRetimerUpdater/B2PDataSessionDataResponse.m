@interface B2PDataSessionDataResponse
- (B2PDataSessionDataResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 sessionID:(unsigned __int8)a5 dataSessionStatus:(int)a6 data:(id)a7;
- (BOOL)parseResponse:(id)a3;
- (NSData)sessionData;
- (id)data;
- (id)description;
- (int)dataSessionStatus;
- (unsigned)sessionID;
@end

@implementation B2PDataSessionDataResponse

- (B2PDataSessionDataResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 sessionID:(unsigned __int8)a5 dataSessionStatus:(int)a6 data:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = a3;
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___B2PDataSessionDataResponse;
  v13 = -[B2PResponse initWithOpCode:route:status:](&v18, sel_initWithOpCode_route_status_, 19LL, v10, v9);
  v14 = v13;
  if (v13)
  {
    v13->_sessionID = a5;
    v13->_dataSessionStatus = a6;
    uint64_t v15 = [v12 copy];
    sessionData = v14->_sessionData;
    v14->_sessionData = (NSData *)v15;
  }

  return v14;
}

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 2)
  {
    id v6 = v4;
    v7 = (unsigned __int8 *)[v6 bytes];
    self->_sessionID = *v7;
    self->_dataSessionStatus = v7[1];
    uint64_t v8 = [v6 length];
    if (v8 != 2)
    {
      [MEMORY[0x189603F48] dataWithBytes:v7 + 2 length:v8 - 2];
      uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      sessionData = self->_sessionData;
      self->_sessionData = v9;
    }
  }

  return v5 > 1;
}

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendByte:self->_sessionID];
  [v3 appendByte:LOBYTE(self->_dataSessionStatus)];
  if (self->_sessionData) {
    objc_msgSend(v3, "appendData:");
  }
  [MEMORY[0x189603F48] dataWithData:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___B2PDataSessionDataResponse;
  -[B2PResponse description](&v10, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "appendFormat:",  @"\tSession ID: %u (%s)\n",  self->_sessionID,  stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend( v5,  "appendFormat:",  @"\tStatus: %u (%s)\n",  self->_dataSessionStatus,  stringForB2PDataSessionStatus(self->_dataSessionStatus));
  sessionData = self->_sessionData;
  if (sessionData)
  {
    v7 = -[NSData byteString](sessionData, "byteString");
    [v5 appendFormat:@"\tData: %@\n", v7];
  }

  [NSString stringWithString:v5];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (int)dataSessionStatus
{
  return self->_dataSessionStatus;
}

- (NSData)sessionData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end