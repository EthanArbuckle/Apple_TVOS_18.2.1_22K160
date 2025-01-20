@interface LACDTOBiometryWatchdogPack
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isBarking;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdog)biometryWatchdogDTO;
- (LACDTOBiometryWatchdog)biometryWatchdogGlobal;
- (LACDTOBiometryWatchdogPack)initWithBiometryWatchdogGlobal:(id)a3 biometryWatchdogDTO:(id)a4;
- (LACDTOBiometryWatchdogPack)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOBiometryWatchdogPack

- (LACDTOBiometryWatchdogPack)initWithBiometryWatchdogGlobal:(id)a3 biometryWatchdogDTO:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOBiometryWatchdogPack;
  v9 = -[LACDTOBiometryWatchdogPack init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometryWatchdogGlobal, a3);
    objc_storeStrong((id *)&v10->_biometryWatchdogDTO, a4);
  }

  return v10;
}

- (BOOL)isBarking
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isBarking])
  {
    char v4 = 1;
  }

  else
  {
    v5 = -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
    char v4 = [v5 isBarking];
  }

  return v4;
}

+ (id)nullInstance
{
  v2 = objc_alloc(&OBJC_CLASS___LACDTOBiometryWatchdogPack);
  v3 = +[LACDTOBiometryWatchdog nullInstance](&OBJC_CLASS___LACDTOBiometryWatchdog, "nullInstance");
  +[LACDTOBiometryWatchdog nullInstance](&OBJC_CLASS___LACDTOBiometryWatchdog, "nullInstance");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACDTOBiometryWatchdogPack initWithBiometryWatchdogGlobal:biometryWatchdogDTO:]( v2,  "initWithBiometryWatchdogGlobal:biometryWatchdogDTO:",  v3,  v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
  NSStringFromSelector(sel_biometryWatchdogGlobal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:v6];

  -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometryWatchdogDTO);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:v7];
}

- (LACDTOBiometryWatchdogPack)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSStringFromSelector(sel_biometryWatchdogGlobal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v5 forKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_opt_class();
  NSStringFromSelector(sel_biometryWatchdogDTO);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v8 forKey:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACDTOBiometryWatchdogPack initWithBiometryWatchdogGlobal:biometryWatchdogDTO:]( self,  "initWithBiometryWatchdogGlobal:biometryWatchdogDTO:",  v7,  v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    v6 = -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
    uint64_t v7 = [v5 biometryWatchdogGlobal];
    if (v6 == (void *)v7)
    {
    }

    else
    {
      uint64_t v8 = (void *)v7;
      v9 = -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
      [v5 biometryWatchdogGlobal];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
    uint64_t v14 = [v5 biometryWatchdogDTO];
    if (v13 == (void *)v14)
    {
      char v12 = 1;
      v15 = v13;
    }

    else
    {
      v15 = (void *)v14;
      v16 = -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
      [v5 biometryWatchdogDTO];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v16 isEqual:v17];
    }

    goto LABEL_11;
  }

  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)description
{
  v15[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)NSString;
  v6 = -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
  [v5 stringWithFormat:@"biometryWatchdogGlobal: %@", v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  uint64_t v8 = (void *)NSString;
  v9 = -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
  [v8 stringWithFormat:@"biometryWatchdogDTO: %@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 componentsJoinedByString:@"; "];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (LACDTOBiometryWatchdog)biometryWatchdogGlobal
{
  return self->_biometryWatchdogGlobal;
}

- (LACDTOBiometryWatchdog)biometryWatchdogDTO
{
  return self->_biometryWatchdogDTO;
}

- (void).cxx_destruct
{
}

@end