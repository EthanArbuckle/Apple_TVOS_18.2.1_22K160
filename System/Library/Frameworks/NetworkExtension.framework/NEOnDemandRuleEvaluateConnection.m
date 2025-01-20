@interface NEOnDemandRuleEvaluateConnection
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEOnDemandRuleEvaluateConnection)init;
- (NEOnDemandRuleEvaluateConnection)initWithCoder:(id)a3;
- (NSArray)connectionRules;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionRules:(NSArray *)connectionRules;
@end

@implementation NEOnDemandRuleEvaluateConnection

- (NEOnDemandRuleEvaluateConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  return -[NEOnDemandRule initWithAction:](&v3, sel_initWithAction_, 3LL);
}

- (NEOnDemandRuleEvaluateConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  v5 = -[NEOnDemandRule initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Rules"];
    connectionRules = v5->_connectionRules;
    v5->_connectionRules = (NSArray *)v9;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  if (-[NEOnDemandRule isEqual:](&v10, sel_isEqual_, v4))
  {
    id v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
      [v5 connectionRules];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = [v6 isEqualToArray:v7];
    }

    else
    {
      char v8 = 0;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  id v4 = a3;
  -[NEOnDemandRule encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", v6.receiver, v6.super_class);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"Rules"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  id v4 = -[NEOnDemandRule copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setConnectionRules:v8];
  }

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  unsigned __int8 v5 = -[NEOnDemandRule checkValidityAndCollectErrors:](&v18, sel_checkValidityAndCollectErrors_, v4);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", 0LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            unsigned __int8 v5 = [v12 checkValidityAndCollectErrors:v4];
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid connection rules",  v4);
            unsigned __int8 v5 = 0;
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v9);
    }
  }

  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing connection rules", v4);
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  -[NEOnDemandRule descriptionWithIndent:options:](&v12, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v7 initWithString:v8];

  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"connectionRules" andIndent:v5 options:a4];

  return v9;
}

- (id)copyLegacyDictionary
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  id v3 = -[NEOnDemandRule copyLegacyDictionary](&v17, sel_copyLegacyDictionary);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyLegacyDictionary];
          [v5 addObject:v11];

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960CA48]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEOnDemandRuleEvaluateConnection;
  id v5 = -[NEOnDemandRule initFromLegacyDictionary:](&v23, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    [v4 objectForKeyedSubscript:*MEMORY[0x18960CA48]];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v6))
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        objc_super v18 = v6;
        id v10 = 0LL;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v7);
            }
            __int128 v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (isa_nsdictionary(v13))
            {
              id v14 = -[NEEvaluateConnectionRule initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEEvaluateConnectionRule),  "initFromLegacyDictionary:",  v13);
              if (!v10) {
                id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
              }
              [v10 addObject:v14];
            }
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }

        while (v9);

        id v6 = v18;
        if (!v10) {
          goto LABEL_17;
        }
        __int128 v15 = (void *)v5[7];
        v5[7] = v10;
        id v7 = v10;
      }
    }

- (NSArray)connectionRules
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setConnectionRules:(NSArray *)connectionRules
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end