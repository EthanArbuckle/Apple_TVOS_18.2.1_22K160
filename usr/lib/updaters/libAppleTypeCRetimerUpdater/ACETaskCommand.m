@interface ACETaskCommand
- (ACETaskCommand)init;
- (ACETaskCommand)initWithFourCharacterCode:(unsigned int)a3;
- (NSData)inputData;
- (NSString)codeString;
- (id)description;
- (unsigned)code;
@end

@implementation ACETaskCommand

- (ACETaskCommand)init
{
  return 0LL;
}

- (ACETaskCommand)initWithFourCharacterCode:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ACETaskCommand;
  result = -[ACETaskCommand init](&v5, sel_init);
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

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = -[ACETaskCommand codeString](self, "codeString");
  [v3 stringWithFormat:@"ACE Task: %@", v4];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACETaskCommand inputData](self, "inputData");
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