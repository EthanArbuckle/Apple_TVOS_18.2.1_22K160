@interface LADomainStateBiometry
- (LADomainStateBiometry)initWithResult:(id)a3;
- (NSData)stateHash;
- (id)description;
- (int64_t)biometryType;
@end

@implementation LADomainStateBiometry

- (LADomainStateBiometry)initWithResult:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___LADomainStateBiometry;
  v5 = -[LADomainStateBiometry init](&v28, sel_init);
  if (v5)
  {
    [MEMORY[0x1896077F8] mainBundle];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 bundleIdentifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 objectForKeyedSubscript:*MEMORY[0x189610648]];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v4;
    [v4 objectForKeyedSubscript:*MEMORY[0x189610658]];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v10 objectForKeyedSubscript:v15];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          int v17 = [v16 BOOLValue];

          if (v17)
          {
            v5->_biometryType = [v15 integerValue];
            v18 = (void *)MEMORY[0x189610798];
            [v9 objectForKeyedSubscript:v15];
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v18 saltHash:v19 withBundleID:v7];

            stateHash = v5->_stateHash;
            v5->_stateHash = (NSData *)v20;
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v12);
    }

    id v4 = v23;
  }

  return v5;
}

- (id)description
{
  v15[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LADomainStateBiometry biometryType](self, "biometryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"biometryType: %@", v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)NSString;
  v9 = -[LADomainStateBiometry stateHash](self, "stateHash");
  [v8 stringWithFormat:@"stateHash: %@", v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 componentsJoinedByString:@"; "];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
}

@end