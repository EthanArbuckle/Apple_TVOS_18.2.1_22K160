@interface ATCRTCommandSFWd
- (ATCRTCommandSFWd)initWithWriteData:(id)a3;
- (NSData)writeData;
- (id)description;
- (id)inputData;
@end

@implementation ATCRTCommandSFWd

- (ATCRTCommandSFWd)initWithWriteData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ATCRTCommandSFWd;
  v5 = -[ATCRTCommand initWithFourCharacterCode:](&v9, sel_initWithFourCharacterCode_, 1397118820LL);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    writeData = v5->_writeData;
    v5->_writeData = (NSData *)v6;
  }

  return v5;
}

- (id)inputData
{
  return self->_writeData;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ATCRTCommandSFWd;
  -[ATCRTCommand description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 appendData:self->_writeData descStr:"Write Data"];
  [NSString stringWithDescString:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)writeData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end