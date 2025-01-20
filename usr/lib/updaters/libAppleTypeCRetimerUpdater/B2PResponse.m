@interface B2PResponse
- (B2PResponse)init;
- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5;
- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5 data:(id)a6;
- (BOOL)parseResponse:(id)a3;
- (NSData)data;
- (id)description;
- (int)status;
- (unsigned)opCode;
- (unsigned)opCodeField;
- (unsigned)route;
@end

@implementation B2PResponse

- (B2PResponse)init
{
  return 0LL;
}

- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5 data:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v10 = a6;
  v11 = -[B2PResponse initWithOpCode:route:status:](self, "initWithOpCode:route:status:", v8, v7, v6);
  v12 = v11;
  if (!(_DWORD)v6 && v11 && !-[B2PResponse parseResponse:](v11, "parseResponse:", v10))
  {

    v12 = 0LL;
  }

  return v12;
}

- (B2PResponse)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 status:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___B2PResponse;
  result = -[B2PResponse init](&v9, sel_init);
  if (result)
  {
    result->_opCode = a3;
    result->_route = a4;
    result->_status = a5;
  }

  return result;
}

- (BOOL)parseResponse:(id)a3
{
  return a3 == 0LL;
}

- (unsigned)opCodeField
{
  return ((self->_route & 0xF) << 12) | self->_opCode;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x189603F48] data];
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t opCode = self->_opCode;
  uint64_t v7 = stringForB2PRoute(self->_route);
  [v3 stringWithFormat:@"%@:\n\tOp Code: 0x%04x\n\tRoute: %s\n\tStatus: %s", v5, opCode, v7, stringForB2PResponseStatus(self->_status)];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)opCode
{
  return self->_opCode;
}

- (unsigned)route
{
  return self->_route;
}

- (int)status
{
  return self->_status;
}

@end