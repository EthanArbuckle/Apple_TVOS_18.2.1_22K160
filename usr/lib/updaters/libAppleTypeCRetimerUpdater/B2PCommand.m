@interface B2PCommand
- (B2PCommand)init;
- (B2PCommand)initWithOpCode:(unsigned __int16)a3;
- (B2PCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
- (BOOL)parseCommand:(id)a3;
- (NSData)data;
- (id)description;
- (unsigned)opCode;
- (unsigned)route;
- (void)setRoute:(unsigned __int8)a3;
@end

@implementation B2PCommand

- (B2PCommand)init
{
  return 0LL;
}

- (B2PCommand)initWithOpCode:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___B2PCommand;
  result = -[B2PCommand init](&v5, sel_init);
  if (result) {
    result->_opCode = a3;
  }
  return result;
}

- (B2PCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  v9 = -[B2PCommand initWithOpCode:](self, "initWithOpCode:", v6);
  v10 = v9;
  if (v9)
  {
    v9->_route = a4;
    if (!-[B2PCommand parseCommand:](v9, "parseCommand:", v8))
    {

      v10 = 0LL;
    }
  }

  return v10;
}

- (BOOL)parseCommand:(id)a3
{
  return a3 == 0LL;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x189603F48] data];
}

- (unsigned)opCode
{
  return ((self->_route & 0xF) << 12) | self->_opCode;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@:\n\tOp Code: 0x%04x\n\tRoute: %s", v5, self->_opCode, stringForB2PRoute(self->_route)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)route
{
  return self->_route;
}

- (void)setRoute:(unsigned __int8)a3
{
  self->_route = a3;
}

@end