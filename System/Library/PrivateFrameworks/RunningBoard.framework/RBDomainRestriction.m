@interface RBDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (id)_init;
- (id)allEntitlements;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation RBDomainRestriction

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v31[11] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v5 objectForKey:@"Class"];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v30[0] = @"OriginatorEntitlement";
      v31[0] = objc_opt_class();
      v30[1] = @"OriginatorExtensionPoint";
      v31[1] = objc_opt_class();
      v30[2] = @"TargetEntitlement";
      v31[2] = objc_opt_class();
      v30[3] = @"TargetExtensionPoint";
      v31[3] = objc_opt_class();
      v30[4] = @"CompoundAny";
      v31[4] = objc_opt_class();
      v30[5] = @"CompoundAll";
      v31[5] = objc_opt_class();
      v30[6] = @"CompoundNone";
      v31[6] = objc_opt_class();
      v30[7] = @"TargetProperty";
      v31[7] = objc_opt_class();
      v30[8] = @"TargetsSelf";
      v31[8] = objc_opt_class();
      v30[9] = @"TargetsHosted";
      v31[9] = objc_opt_class();
      v30[10] = @"LessThanCondition";
      v31[10] = objc_opt_class();
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:11];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)[v7 objectForKey:v6];
      if (v8)
      {
        [v8 domainRestrictionForDictionary:v5 withError:a4];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        if (a4)
        {
          v18 = (void *)MEMORY[0x189607870];
          [NSString stringWithFormat:@"RBDomainRestriction invalid class name: %@", v6, *MEMORY[0x1896075F0]];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v19;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v20];
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          id v22 = v21;
          *a4 = v22;
        }

        v9 = 0LL;
      }
    }

    else
    {
      if (!a4)
      {
        v9 = 0LL;
        goto LABEL_14;
      }

      v14 = (void *)MEMORY[0x189607870];
      uint64_t v26 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"RBDomainRestriction doesn't specify class: %@", v5];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v16];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      id v7 = v17;
      v9 = 0LL;
      *a4 = v7;
    }

LABEL_14:
    goto LABEL_15;
  }

  if (a4)
  {
    v10 = (void *)MEMORY[0x189607870];
    uint64_t v28 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RBDomainRestriction malformed: %@", v5];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = v13;
    v9 = 0LL;
    *a4 = v6;
    goto LABEL_14;
  }

  v9 = 0LL;
LABEL_15:

  return v9;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBDomainRestriction;
  return -[RBDomainRestriction init](&v3, sel_init);
}

- (id)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return v4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  return 0;
}

- (id)allEntitlements
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0LL;
}

@end