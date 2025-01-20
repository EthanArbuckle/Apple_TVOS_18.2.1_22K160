@interface B2PDataSessionConnectResponse
- (BOOL)parseResponse:(id)a3;
- (id)description;
- (int)sessionID;
- (int)state;
@end

@implementation B2PDataSessionConnectResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)[v4 bytes];
    self->_sessionID = *v6;
    self->_state = v6[1];
  }

  return v5 > 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PDataSessionConnectResponse;
  -[B2PResponse description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "appendFormat:",  @"\tSession ID: %u (%s)\n",  self->_sessionID,  stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend( v5,  "appendFormat:",  @"\tState: %u (%s)",  self->_state,  stringForB2PDataSessionState(self->_state));
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)sessionID
{
  return self->_sessionID;
}

- (int)state
{
  return self->_state;
}

@end