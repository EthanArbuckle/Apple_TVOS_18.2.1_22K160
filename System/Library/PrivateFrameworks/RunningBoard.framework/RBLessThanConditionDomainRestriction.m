@interface RBLessThanConditionDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithCondition:(id)a3 value:(int64_t)a4;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBLessThanConditionDomainRestriction

- (id)_initWithCondition:(id)a3 value:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBLessThanConditionDomainRestriction;
  v7 = -[RBDomainRestriction _init](&v12, sel__init);
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)v7[1];
    v7[1] = v8;

    v7[2] = a4;
    v10 = v7;
  }

  return v7;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    [v5 objectForKey:@"Condition"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:@"Value"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          a4 = -[RBLessThanConditionDomainRestriction _initWithCondition:value:]( [RBLessThanConditionDomainRestriction alloc],  "_initWithCondition:value:",  v6,  [v7 integerValue]);
LABEL_15:

          goto LABEL_16;
        }
      }

      if (!a4) {
        goto LABEL_15;
      }
      uint64_t v8 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"RBLessThanConditionDomainRestriction doesn't specify value: %@", v5, *MEMORY[0x1896075F0]];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v10 = (void *)MEMORY[0x189603F68];
      v11 = &v18;
      objc_super v12 = &v17;
    }

    else
    {
      if (!a4) {
        goto LABEL_15;
      }
      uint64_t v8 = (void *)MEMORY[0x189607870];
      uint64_t v19 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"RBLessThanConditionDomainRestriction doesn't specify condition: %@", v5];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v10 = (void *)MEMORY[0x189603F68];
      v11 = (void **)v20;
      objc_super v12 = &v19;
    }

    [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    id v15 = v14;
    *a4 = v15;

    a4 = 0LL;
    goto LABEL_15;
  }

  if (domainRestrictionForDictionary_withError__onceToken_183 != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_183, &__block_literal_global_185);
  }
  a4 = (id *)(id)domainRestrictionForDictionary_withError__singleton_184;
LABEL_16:

  return a4;
}

void __81__RBLessThanConditionDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0 = -[RBLessThanConditionDomainRestriction _initWithCondition:value:]( objc_alloc(&OBJC_CLASS___RBLessThanConditionDomainRestriction),  "_initWithCondition:value:",  @"FFDisabled",  0LL);
  v1 = (void *)domainRestrictionForDictionary_withError__singleton_184;
  domainRestrictionForDictionary_withError__singleton_184 = (uint64_t)v0;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    [v6 systemState];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 conditions];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKey:self->_condition];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && [v9 integerValue] >= self->_value)
    {
      if (a4)
      {
        v10 = (void *)MEMORY[0x189607870];
        uint64_t v11 = *MEMORY[0x1896124C0];
        uint64_t v15 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"System condition %@ has value %lld, which is not less than %lld", self->_condition, objc_msgSend(v9, "integerValue"), self->_value];
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v12;
        [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 errorWithDomain:v11 code:1 userInfo:v13];
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }

    else
    {
      LOBYTE(a4) = 1;
    }
  }

  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x189604010] set];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBLessThanConditionDomainRestriction *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && ((condition = self->_condition, uint64_t v8 = v4->_condition, condition == v8)
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_value ^ -[NSString hash](self->_condition, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@:%lld>", v4, self->_condition, self->_value];

  return v5;
}

- (void).cxx_destruct
{
}

@end