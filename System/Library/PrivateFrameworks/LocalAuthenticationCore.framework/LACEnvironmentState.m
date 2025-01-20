@interface LACEnvironmentState
+ (BOOL)supportsSecureCoding;
+ (id)companionsForUser:(unsigned int)a3;
+ (id)environmentStateForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanismBiometry)biometry;
- (LACEnvironmentMechanismUserPassword)userPassword;
- (LACEnvironmentState)initWithBiometry:(id)a3 userPassword:(id)a4 companions:(id)a5;
- (LACEnvironmentState)initWithCoder:(id)a3;
- (NSArray)companions;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBiometry:(id)a3;
- (void)setCompanions:(id)a3;
- (void)setUserPassword:(id)a3;
@end

@implementation LACEnvironmentState

- (LACEnvironmentState)initWithBiometry:(id)a3 userPassword:(id)a4 companions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACEnvironmentState;
  v12 = -[LACEnvironmentState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_biometry, a3);
    objc_storeStrong((id *)&v13->_userPassword, a4);
    objc_storeStrong((id *)&v13->_companions, a5);
  }

  return v13;
}

+ (id)environmentStateForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  id v10 = objc_alloc(&OBJC_CLASS___LACEnvironmentState);
  __int128 v11 = *(_OWORD *)&a4->var0[4];
  __int128 v18 = *(_OWORD *)a4->var0;
  __int128 v19 = v11;
  v12 = +[LACEnvironmentMechanismBiometry environmentMechanismForUser:auditToken:dependencies:error:]( &OBJC_CLASS___LACEnvironmentMechanismBiometry,  "environmentMechanismForUser:auditToken:dependencies:error:",  v7,  &v18,  v9,  0LL);
  __int128 v13 = *(_OWORD *)&a4->var0[4];
  __int128 v18 = *(_OWORD *)a4->var0;
  __int128 v19 = v13;
  v14 = +[LACEnvironmentMechanismUserPassword environmentMechanismForUser:auditToken:dependencies:error:]( &OBJC_CLASS___LACEnvironmentMechanismUserPassword,  "environmentMechanismForUser:auditToken:dependencies:error:",  v7,  &v18,  v9,  0LL);
  [a1 companionsForUser:v7];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LACEnvironmentState initWithBiometry:userPassword:companions:]( v10,  "initWithBiometry:userPassword:companions:",  v12,  v14,  v15);

  return v16;
}

+ (id)companionsForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_opt_new();
  v5 = +[LACEnvironmentMechanismCompanion companionForUser:type:error:]( &OBJC_CLASS___LACEnvironmentMechanismCompanion,  "companionForUser:type:error:",  v3,  1LL,  0LL);
  if (v5) {
    [v4 addObject:v5];
  }
  v6 = +[LACEnvironmentMechanismCompanion companionForUser:type:error:]( &OBJC_CLASS___LACEnvironmentMechanismCompanion,  "companionForUser:type:error:",  v3,  2LL,  0LL);
  if (v6) {
    [v4 addObject:v6];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[LACEnvironmentState biometry](self, "biometry");
  NSStringFromSelector(sel_biometry);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:v6];

  -[LACEnvironmentState userPassword](self, "userPassword");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userPassword);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:v8];

  -[LACEnvironmentState companions](self, "companions");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companions);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:v9];
}

- (LACEnvironmentState)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_biometry);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userPassword);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companions);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v11 = -[LACEnvironmentState initWithBiometry:userPassword:companions:]( self,  "initWithBiometry:userPassword:companions:",  v6,  v8,  v10);
  return v11;
}

- (id)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  v5 = -[LACEnvironmentState biometry](self, "biometry");
  [v4 stringWithFormat:@"biometry: %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  uint64_t v7 = (void *)NSString;
  v8 = -[LACEnvironmentState userPassword](self, "userPassword");
  [v7 stringWithFormat:@"userPassword: %@", v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  id v10 = (void *)NSString;
  -[LACEnvironmentState companions](self, "companions");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"companions: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentState *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[LACEnvironmentState biometry](self, "biometry");
      uint64_t v7 = -[LACEnvironmentState biometry](v5, "biometry");
      if (v6 == (void *)v7)
      {
      }

      else
      {
        v8 = (void *)v7;
        -[LACEnvironmentState biometry](self, "biometry");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentState biometry](v5, "biometry");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }

      -[LACEnvironmentState userPassword](self, "userPassword");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = -[LACEnvironmentState userPassword](v5, "userPassword");
      if (v13 == (void *)v14)
      {
      }

      else
      {
        objc_super v15 = (void *)v14;
        v16 = -[LACEnvironmentState userPassword](self, "userPassword");
        v17 = -[LACEnvironmentState userPassword](v5, "userPassword");
        int v18 = [v16 isEqual:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }

      -[LACEnvironmentState companions](self, "companions");
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = -[LACEnvironmentState companions](v5, "companions");
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        v21 = v19;
      }

      else
      {
        v21 = (void *)v20;
        v22 = -[LACEnvironmentState companions](self, "companions");
        v23 = -[LACEnvironmentState companions](v5, "companions");
        char v12 = [v22 isEqualToArray:v23];
      }

      goto LABEL_17;
    }

    char v12 = 0;
  }

- (LACEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (void)setBiometry:(id)a3
{
}

- (LACEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (void)setUserPassword:(id)a3
{
}

- (NSArray)companions
{
  return self->_companions;
}

- (void)setCompanions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end