@interface ATCRTCommand
- (ATCRTCommand)init;
- (ATCRTCommand)initWithFourCharacterCode:(unsigned int)a3;
- (BOOL)hasResponse;
- (NSData)inputData;
- (NSString)codeString;
- (id)description;
- (unsigned)code;
@end

@implementation ATCRTCommand

- (ATCRTCommand)init
{
  return 0LL;
}

- (ATCRTCommand)initWithFourCharacterCode:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ATCRTCommand;
  result = -[ATCRTCommand init](&v5, sel_init);
  if (result) {
    result->_code = a3;
  }
  return result;
}

- (NSData)inputData
{
  return 0LL;
}

- (NSString)codeString
{
  return (NSString *)stringForFourCharCode(self->_code);
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  stringForFourCharCode(self->_code);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"ATCRT Command: %@", v4];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATCRTCommand inputData](self, "inputData");
  uint64_t v7 = [v6 length];

  if (v7) {
    [v5 appendString:@"\n"];
  }
  [NSString stringWithString:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)code
{
  return self->_code;
}

@end