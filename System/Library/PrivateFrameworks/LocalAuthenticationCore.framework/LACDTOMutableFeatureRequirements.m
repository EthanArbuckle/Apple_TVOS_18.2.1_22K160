@interface LACDTOMutableFeatureRequirements
+ (id)nullInstance;
- (BOOL)hasAPRequirements;
- (BOOL)hasBiometricEnrollments;
- (BOOL)hasHSA2Account;
- (BOOL)hasLocationServicesEnabled;
- (BOOL)hasPasscodeSet;
- (BOOL)hasSEPRequirements;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableFeatureRequirements)initWithRequirements:(id)a3;
- (NSString)description;
- (void)setHasBiometricEnrollments:(BOOL)a3;
- (void)setHasHSA2Account:(BOOL)a3;
- (void)setHasLocationServicesEnabled:(BOOL)a3;
- (void)setHasPasscodeSet:(BOOL)a3;
@end

@implementation LACDTOMutableFeatureRequirements

- (LACDTOMutableFeatureRequirements)initWithRequirements:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LACDTOMutableFeatureRequirements;
  v5 = -[LACDTOMutableFeatureRequirements init](&v7, sel_init);
  if (v5)
  {
    v5->_hasPasscodeSet = [v4 hasPasscodeSet];
    v5->_hasBiometricEnrollments = [v4 hasBiometricEnrollments];
    v5->_hasHSA2Account = [v4 hasHSA2Account];
    v5->_hasLocationServicesEnabled = [v4 hasLocationServicesEnabled];
  }

  return v5;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableFeatureRequirements);
  -[LACDTOMutableFeatureRequirements setHasPasscodeSet:](v2, "setHasPasscodeSet:", 0LL);
  -[LACDTOMutableFeatureRequirements setHasBiometricEnrollments:](v2, "setHasBiometricEnrollments:", 0LL);
  -[LACDTOMutableFeatureRequirements setHasHSA2Account:](v2, "setHasHSA2Account:", 0LL);
  -[LACDTOMutableFeatureRequirements setHasLocationServicesEnabled:](v2, "setHasLocationServicesEnabled:", 0LL);
  return v2;
}

- (BOOL)hasAPRequirements
{
  BOOL v3 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
  char v4 = v3 & -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments");
  BOOL v5 = -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account");
  return v4 & v5 & -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled");
}

- (BOOL)hasSEPRequirements
{
  BOOL v3 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
  return v3 & -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments");
}

- (NSString)description
{
  v27[6] = *MEMORY[0x1895F89C0];
  v23 = (void *)NSString;
  uint64_t v21 = objc_opt_class();
  BOOL v3 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"hasPasscodeSet: %@", v26];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  char v4 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"hasBiometricEnrollments: %@", v24];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v22;
  BOOL v5 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"hasLocationServicesEnabled: %@", v20];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  objc_super v7 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"hasHSA2Account: %@", v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v9;
  v10 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasSEPRequirements](self, "hasSEPRequirements"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"hasSEPRequirements: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v12;
  v13 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableFeatureRequirements hasAPRequirements](self, "hasAPRequirements"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringWithFormat:@"hasAPRequirements: %@", v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v27 count:6];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 componentsJoinedByString:@"; "];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 stringWithFormat:@"<%@ %p; %@>", v21, self, v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C793698])
  {
    id v5 = v4;
    int v6 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
    if (v6 == [v5 hasPasscodeSet]
      && (int v7 = -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments"),
          v7 == [v5 hasBiometricEnrollments])
      && (int v8 = -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled"),
          v8 == [v5 hasLocationServicesEnabled])
      && (int v9 = -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account"),
          v9 == [v5 hasHSA2Account])
      && (int v10 = -[LACDTOMutableFeatureRequirements hasSEPRequirements](self, "hasSEPRequirements"),
          v10 == [v5 hasSEPRequirements]))
    {
      BOOL v13 = -[LACDTOMutableFeatureRequirements hasAPRequirements](self, "hasAPRequirements");
      int v11 = v13 ^ [v5 hasAPRequirements] ^ 1;
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (BOOL)hasBiometricEnrollments
{
  return self->_hasBiometricEnrollments;
}

- (void)setHasBiometricEnrollments:(BOOL)a3
{
  self->_hasBiometricEnrollments = a3;
}

- (BOOL)hasLocationServicesEnabled
{
  return self->_hasLocationServicesEnabled;
}

- (void)setHasLocationServicesEnabled:(BOOL)a3
{
  self->_hasLocationServicesEnabled = a3;
}

- (BOOL)hasHSA2Account
{
  return self->_hasHSA2Account;
}

- (void)setHasHSA2Account:(BOOL)a3
{
  self->_hasHSA2Account = a3;
}

@end