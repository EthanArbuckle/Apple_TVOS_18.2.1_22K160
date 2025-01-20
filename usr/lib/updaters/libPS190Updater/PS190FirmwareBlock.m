@interface PS190FirmwareBlock
- (NSString)dumpString;
- (PS190FirmwareBlock)initWithNumber:(unsigned __int8)a3 bytes:(const char *)a4;
- (const)bytes;
- (id)description;
- (unsigned)crc8;
- (unsigned)number;
@end

@implementation PS190FirmwareBlock

- (PS190FirmwareBlock)initWithNumber:(unsigned __int8)a3 bytes:(const char *)a4
{
  unsigned int v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PS190FirmwareBlock;
  v6 = -[PS190FirmwareBlock init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_number = v5;
    memcpy(v6->_buffer, a4, sizeof(v6->_buffer));
    v7->_crc8 = computeCRC8WithInitialValue((char *)a4, 4096, 255LL);
  }

  return v7;
}

- (const)bytes
{
  return (const char *)self->_buffer;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  unsigned int v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"<%@: Number=%u, crc8=0x%02x>", v5, self->_number, self->_crc8];

  return v6;
}

- (NSString)dumpString
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  unsigned int v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"%@\n", v5];

  objc_msgSend(v6, "appendFormat:", @"Number: %u\n", self->_number);
  objc_msgSend(v6, "appendFormat:", @"CRC: 0x%02x\n", self->_crc8);
  id v7 = FormatHex((uint64_t)self->_buffer, 0x1000uLL, 0);
  [v6 appendFormat:@"%@", v7];
  id v8 = (id)[NSString stringWithString:v6];

  return (NSString *)v8;
}

- (unsigned)number
{
  return self->_number;
}

- (unsigned)crc8
{
  return self->_crc8;
}

@end