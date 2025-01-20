@interface LAEnvironmentState
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentState)coreState;
- (LAEnvironmentMechanismBiometry)biometry;
- (LAEnvironmentMechanismUserPassword)userPassword;
- (LAEnvironmentState)initWithCoreState:(id)a3;
- (NSArray)allMechanisms;
- (NSArray)companions;
- (id)_descriptionParts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LAEnvironmentState

- (LAEnvironmentState)initWithCoreState:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___LAEnvironmentState;
  v6 = -[LAEnvironmentState init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreState, a3);
    [v5 biometry];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 biometryType])
    {
      v9 = objc_alloc(&OBJC_CLASS___LAEnvironmentMechanismBiometry);
      [v5 biometry];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = -[LAEnvironmentMechanismBiometry initWithCoreMechanism:](v9, "initWithCoreMechanism:", v10);
      biometry = v7->_biometry;
      v7->_biometry = (LAEnvironmentMechanismBiometry *)v11;
    }

    else
    {
      v10 = v7->_biometry;
      v7->_biometry = 0LL;
    }

    v13 = objc_alloc(&OBJC_CLASS___LAEnvironmentMechanismUserPassword);
    [v5 userPassword];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = -[LAEnvironmentMechanismUserPassword initWithCoreMechanism:](v13, "initWithCoreMechanism:", v14);
    userPassword = v7->_userPassword;
    v7->_userPassword = (LAEnvironmentMechanismUserPassword *)v15;

    uint64_t v17 = objc_opt_new();
    companions = v7->_companions;
    v7->_companions = (NSArray *)v17;

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    objc_msgSend(v5, "companions", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = v7->_companions;
          v25 = -[LAEnvironmentMechanismCompanion initWithCoreMechanism:]( objc_alloc(&OBJC_CLASS___LAEnvironmentMechanismCompanion),  "initWithCoreMechanism:",  *(void *)(*((void *)&v29 + 1) + 8 * v23));
          uint64_t v26 = -[NSArray arrayByAddingObject:](v24, "arrayByAddingObject:", v25);
          v27 = v7->_companions;
          v7->_companions = (NSArray *)v26;

          ++v23;
        }

        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v21);
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___LAEnvironmentState);
  -[LAEnvironmentState coreState](self, "coreState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LAEnvironmentState initWithCoreState:](v4, "initWithCoreState:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LAEnvironmentState *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      v6 = -[LAEnvironmentState biometry](self, "biometry");
      uint64_t v7 = -[LAEnvironmentState biometry](v5, "biometry");
      if (v6 == (void *)v7)
      {
      }

      else
      {
        v8 = (void *)v7;
        v9 = -[LAEnvironmentState biometry](self, "biometry");
        v10 = -[LAEnvironmentState biometry](v5, "biometry");
        int v11 = [v9 isEqual:v10];

        if (!v11)
        {
          char v12 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v13 = -[LAEnvironmentState userPassword](self, "userPassword");
      uint64_t v14 = -[LAEnvironmentState userPassword](v5, "userPassword");
      if (v13 == (void *)v14)
      {
        char v12 = 1;
        uint64_t v15 = v13;
      }

      else
      {
        uint64_t v15 = (void *)v14;
        v16 = -[LAEnvironmentState userPassword](self, "userPassword");
        -[LAEnvironmentState userPassword](v5, "userPassword");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v16 isEqual:v17];
      }

      goto LABEL_13;
    }

    char v12 = 0;
  }

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[LAEnvironmentState _descriptionParts](self, "_descriptionParts");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", @", ");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionParts
{
  v9[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189603FA8];
  -[LAEnvironmentState biometry](self, "biometry");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[LAEnvironmentState userPassword](self, "userPassword");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 arrayWithArray:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)allMechanisms
{
  v3 = (void *)objc_opt_new();
  -[LAEnvironmentState biometry](self, "biometry");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LAEnvironmentState biometry](self, "biometry");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v5];
  }
  v6 = -[LAEnvironmentState userPassword](self, "userPassword");
  if (v6)
  {
    -[LAEnvironmentState userPassword](self, "userPassword");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v7];
  }

  return (NSArray *)v3;
}

- (LAEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (LAEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (NSArray)companions
{
  return self->_companions;
}

- (LACEnvironmentState)coreState
{
  return self->_coreState;
}

- (void).cxx_destruct
{
}

@end