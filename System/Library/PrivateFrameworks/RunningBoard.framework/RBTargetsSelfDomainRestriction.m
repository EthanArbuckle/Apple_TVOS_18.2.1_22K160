@interface RBTargetsSelfDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetsSelfDomainRestriction

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBTargetsSelfDomainRestriction;
  id v2 = -[RBDomainRestriction _init](&v6, sel__init);
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken, &__block_literal_global_22);
  }
  return (id)domainRestrictionForDictionary_withError__singleton;
}

void __75__RBTargetsSelfDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0 = -[RBTargetsSelfDomainRestriction _init](objc_alloc(&OBJC_CLASS___RBTargetsSelfDomainRestriction), "_init");
  v1 = (void *)domainRestrictionForDictionary_withError__singleton;
  domainRestrictionForDictionary_withError__singleton = (uint64_t)v0;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v20[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 targetProcess];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 originatorProcess];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 identity];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v8 isEqual:v10];

  if (a4 && (v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896123E0];
    uint64_t v14 = *MEMORY[0x1896075F0];
    v20[0] = @"Target isn't originator";
    uint64_t v15 = *MEMORY[0x1896123D8];
    v19[0] = v14;
    v19[1] = v15;
    v16 = -[RBTargetsSelfDomainRestriction description](self, "description");
    v20[1] = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 errorWithDomain:v13 code:3 userInfo:v17];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x189604010] set];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_restrictions, "hash");
}

- (id)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"<%@|>", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end