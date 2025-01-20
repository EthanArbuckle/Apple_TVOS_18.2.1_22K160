@interface ACETaskCommandVOUT
- (ACETaskCommandVOUT)initWithEnabled:(BOOL)a3 forceDFU:(BOOL)a4;
- (BOOL)enabled;
- (BOOL)forceDFU;
- (id)description;
- (id)inputData;
@end

@implementation ACETaskCommandVOUT

- (ACETaskCommandVOUT)initWithEnabled:(BOOL)a3 forceDFU:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACETaskCommandVOUT;
  result = -[ACETaskCommand initWithFourCharacterCode:](&v7, sel_initWithFourCharacterCode_, 1448039764LL);
  if (result)
  {
    *((_BYTE *)&result->super._code + 4) = a3;
    *((_BYTE *)&result->super._code + 5) = a4;
  }

  return result;
}

- (id)inputData
{
  char v2 = *((_BYTE *)&self->super._code + 4);
  char v4 = v2;
  if (*((_BYTE *)&self->super._code + 5)) {
    char v4 = v2 | 0x40;
  }
  [MEMORY[0x189603F48] dataWithBytes:&v4 length:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACETaskCommandVOUT;
  -[ACETaskCommand description](&v8, sel_description);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 appendBool:*((unsigned __int8 *)&self->super._code + 4) descStr:"Enabled"];
  [v5 appendBool:*((unsigned __int8 *)&self->super._code + 5) descStr:"Force DFU"];
  [NSString stringWithDescString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)enabled
{
  return *(_BYTE *)(&self->super._code + 1) & 1;
}

- (BOOL)forceDFU
{
  return *((_BYTE *)&self->super._code + 5) & 1;
}

@end