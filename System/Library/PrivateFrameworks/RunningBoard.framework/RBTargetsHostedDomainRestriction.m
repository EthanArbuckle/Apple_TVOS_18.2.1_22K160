@interface RBTargetsHostedDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetsHostedDomainRestriction

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBTargetsHostedDomainRestriction;
  id v2 = -[RBDomainRestriction _init](&v6, sel__init);
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken_173 != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_173, &__block_literal_global_174);
  }
  return (id)domainRestrictionForDictionary_withError__singleton_172;
}

void __77__RBTargetsHostedDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0 = -[RBTargetsHostedDomainRestriction _init](objc_alloc(&OBJC_CLASS___RBTargetsHostedDomainRestriction), "_init");
  v1 = (void *)domainRestrictionForDictionary_withError__singleton_172;
  domainRestrictionForDictionary_withError__singleton_172 = (uint64_t)v0;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 targetProcess];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 hostIdentifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 pid];
  [v6 originatorProcess];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  int v12 = objc_msgSend(v11, "rbs_pid");
  if (a4 && v10 != v12)
  {
    v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x1896123E0];
    uint64_t v15 = *MEMORY[0x1896075F0];
    v21[0] = @"Target not hosted by originator";
    uint64_t v16 = *MEMORY[0x1896123D8];
    v20[0] = v15;
    v20[1] = v16;
    v17 = -[RBTargetsHostedDomainRestriction description](self, "description");
    v21[1] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 errorWithDomain:v14 code:3 userInfo:v18];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10 == v12;
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