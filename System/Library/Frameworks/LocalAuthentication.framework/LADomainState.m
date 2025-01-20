@interface LADomainState
- (LADomainState)initWithResult:(id)a3;
- (LADomainStateBiometry)biometry;
- (LADomainStateCompanion)companion;
- (NSData)stateHash;
- (id)description;
- (void)_resolveCombinedStateHash;
@end

@implementation LADomainState

- (LADomainState)initWithResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LADomainState;
  v5 = -[LADomainState init](&v9, sel_init);
  if (v5)
  {
    v6 = -[LADomainStateBiometry initWithResult:]( objc_alloc(&OBJC_CLASS___LADomainStateBiometry),  "initWithResult:",  v4);
    biometry = v5->_biometry;
    v5->_biometry = v6;

    -[LADomainState _resolveCombinedStateHash](v5, "_resolveCombinedStateHash");
  }

  return v5;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void)_resolveCombinedStateHash
{
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  stateHash = self->_stateHash;
  self->_stateHash = v3;
}

- (id)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  v5 = -[LADomainState biometry](self, "biometry");
  [v4 stringWithFormat:@"biometry: %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)NSString;
  v8 = -[LADomainState companion](self, "companion");
  [v7 stringWithFormat:@"companion: %@", v8];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)NSString;
  v11 = -[LADomainState stateHash](self, "stateHash");
  [v10 stringWithFormat:@"stateHash: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (LADomainStateBiometry)biometry
{
  return self->_biometry;
}

- (LADomainStateCompanion)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
}

@end