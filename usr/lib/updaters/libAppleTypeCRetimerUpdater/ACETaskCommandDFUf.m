@interface ACETaskCommandDFUf
- (ACETaskCommandDFUf)initWithForceDFUMode:(BOOL)a3 allowOnlyIfConnected:(BOOL)a4;
- (BOOL)allowOnlyIfConnected;
- (BOOL)forceDFUMode;
- (id)description;
- (id)inputData;
@end

@implementation ACETaskCommandDFUf

- (ACETaskCommandDFUf)initWithForceDFUMode:(BOOL)a3 allowOnlyIfConnected:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACETaskCommandDFUf;
  result = -[ACETaskCommand initWithFourCharacterCode:](&v7, sel_initWithFourCharacterCode_, 1145460070LL);
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
    char v4 = v2 | 0x80;
  }
  [MEMORY[0x189603F48] dataWithBytes:&v4 length:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACETaskCommandDFUf;
  -[ACETaskCommand description](&v8, sel_description);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 appendBool:*((unsigned __int8 *)&self->super._code + 4) descStr:"Force DFU Mode"];
  [v5 appendBool:*((unsigned __int8 *)&self->super._code + 5) descStr:"Allow Only if Connected"];
  [NSString stringWithDescString:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)forceDFUMode
{
  return *(_BYTE *)(&self->super._code + 1) & 1;
}

- (BOOL)allowOnlyIfConnected
{
  return *((_BYTE *)&self->super._code + 5) & 1;
}

@end