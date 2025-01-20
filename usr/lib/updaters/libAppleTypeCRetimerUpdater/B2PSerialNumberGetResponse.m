@interface B2PSerialNumberGetResponse
- (BOOL)parseResponse:(id)a3;
- (NSString)serialNumber;
- (id)description;
@end

@implementation B2PSerialNumberGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (NSString *)[objc_alloc(NSString) initWithData:v4 encoding:4];
    serialNumber = self->_serialNumber;
    self->_serialNumber = v5;
  }

  else
  {
    serialNumber = self->_serialNumber;
    self->_serialNumber = (NSString *)&stru_18A3C7A18;
  }

  BOOL v7 = self->_serialNumber != 0LL;
  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PSerialNumberGetResponse;
  -[B2PResponse description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 appendFormat:@"\tSerial Number: %@\n", self->_serialNumber];
  [NSString stringWithString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end