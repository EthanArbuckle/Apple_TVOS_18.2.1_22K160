@interface PS190Command
- (BOOL)causesReset;
- (NSData)commandPacket;
- (NSData)data;
- (NSData)snifferPacket;
- (NSString)rawDescription;
- (PS190Command)initWithType:(unsigned __int8)a3 param0:(unsigned __int8)a4 param1:(unsigned __int8)a5 param2:(unsigned __int8)a6 count:(unsigned __int8)a7 data:(id)a8;
- (id)description;
- (unsigned)count;
- (unsigned)param0;
- (unsigned)param1;
- (unsigned)param2;
- (unsigned)responseSize;
- (unsigned)type;
- (void)createCommandPacket;
@end

@implementation PS190Command

- (PS190Command)initWithType:(unsigned __int8)a3 param0:(unsigned __int8)a4 param1:(unsigned __int8)a5 param2:(unsigned __int8)a6 count:(unsigned __int8)a7 data:(id)a8
{
  id v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PS190Command;
  v15 = -[PS190Command init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_param0 = a4;
    v15->_param1 = a5;
    v15->_param2 = a6;
    v15->_count = a7;
    uint64_t v17 = [v14 copy];
    data = v16->_data;
    v16->_data = (NSData *)v17;

    -[PS190Command createCommandPacket](v16, "createCommandPacket");
  }

  return v16;
}

- (unsigned)responseSize
{
  return 0;
}

- (void)createCommandPacket
{
  id v3 = (id)[MEMORY[0x189603FB8] data];
  [v3 appendByte:self->_param2];
  [v3 appendByte:self->_param1];
  [v3 appendByte:self->_param0];
  [v3 appendByte:self->_type];
  [v3 appendByte:self->_count];
  v4 = (NSData *)(id)[MEMORY[0x189603F48] dataWithData:v3];
  commandPacket = self->_commandPacket;
  self->_commandPacket = v4;
}

- (NSData)snifferPacket
{
  id v3 = (id)[MEMORY[0x189603FB8] data];
  [v3 appendByte:self->_type];
  [v3 appendByte:self->_param0];
  [v3 appendByte:self->_param1];
  [v3 appendByte:self->_param2];
  [v3 appendByte:self->_count];
  if (self->_data) {
    objc_msgSend(v3, "appendData:");
  }
  id v4 = (id)[MEMORY[0x189603F48] dataWithData:v3];

  return (NSData *)v4;
}

- (BOOL)causesReset
{
  return 0;
}

- (NSString)rawDescription
{
  id v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"%@ [Response Size: %u]", v5, -[PS190Command responseSize](self, "responseSize")];

  return (NSString *)v6;
}

- (id)description
{
  v2 = (void *)NSString;
  id v3 = -[PS190Command rawDescription](self, "rawDescription");
  id v4 = (id)[v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)param0
{
  return self->_param0;
}

- (unsigned)param1
{
  return self->_param1;
}

- (unsigned)param2
{
  return self->_param2;
}

- (unsigned)count
{
  return self->_count;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)commandPacket
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end