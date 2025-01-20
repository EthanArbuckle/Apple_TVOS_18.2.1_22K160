@interface B2PPingResponse
- (BOOL)parseResponse:(id)a3;
- (id)description;
- (int)protocolMode;
- (int)protocolVersion;
@end

@implementation B2PPingResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)[v4 bytes];
    self->_protocolVersion = *v6;
    self->_protocolMode = v6[1];
  }

  return v5 > 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PPingResponse;
  -[B2PResponse description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status"))
  {
    objc_msgSend( v5,  "appendFormat:",  @"\tProtocol Version: %s\n",  stringForB2PProtocolVersion(self->_protocolVersion));
    objc_msgSend(v5, "appendFormat:", @"\tProtocol Mode: %s", stringForB2PProtocolMode(self->_protocolMode));
  }

  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (int)protocolMode
{
  return self->_protocolMode;
}

@end