@interface ATCRTCommandSFWf
- (ATCRTCommandSFWf)initWithBlockCount:(unsigned __int8)a3 value:(unsigned __int8)a4;
- (id)description;
- (id)inputData;
- (unsigned)blockCount;
- (unsigned)value;
@end

@implementation ATCRTCommandSFWf

- (ATCRTCommandSFWf)initWithBlockCount:(unsigned __int8)a3 value:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ATCRTCommandSFWf;
  result = -[ATCRTCommand initWithFourCharacterCode:](&v7, sel_initWithFourCharacterCode_, 1397118822LL);
  if (result)
  {
    *((_BYTE *)&result->super._code + 4) = a3;
    *((_BYTE *)&result->super._code + 5) = a4;
  }

  return result;
}

- (id)inputData
{
  v3[0] = *((_BYTE *)&self->super._code + 4);
  v3[1] = *((_BYTE *)&self->super._code + 5);
  [MEMORY[0x189603F48] dataWithBytes:v3 length:2];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ATCRTCommandSFWf;
  v4 = -[ATCRTCommand description](&v8, sel_description);
  [v3 stringWithString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", @"\tBlock Count: %u\n", *((unsigned __int8 *)&self->super._code + 4));
  objc_msgSend(v5, "appendFormat:", @"\tValue: 0x%02x", *((unsigned __int8 *)&self->super._code + 5));
  [NSString stringWithDescString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)blockCount
{
  return *((_BYTE *)&self->super._code + 4);
}

- (unsigned)value
{
  return *((_BYTE *)&self->super._code + 5);
}

@end