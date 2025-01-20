@interface RBOriginatorEntitlementDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithEntitlement:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBOriginatorEntitlementDomainRestriction

- (id)_initWithEntitlement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBOriginatorEntitlementDomainRestriction;
  v5 = -[RBDomainRestriction _init](&v10, sel__init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectForKey:@"Entitlement"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = -[RBOriginatorEntitlementDomainRestriction _initWithEntitlement:]( objc_alloc(&OBJC_CLASS___RBOriginatorEntitlementDomainRestriction),  "_initWithEntitlement:",  v6);
  }

  else if (a4)
  {
    v7 = (void *)MEMORY[0x189607870];
    [NSString stringWithFormat:@"RBOriginatorEntitlementDomainRestriction doesn't specify entitlement: %@", v5, *MEMORY[0x1896075F0]];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v9];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

    id v11 = v10;
    *a4 = v11;

    a4 = 0LL;
  }

  return a4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  [a3 originatorEntitlements];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 hasEntitlement:self->_entitlement];

  if (a4 && (v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896124C0];
    [NSString stringWithFormat:@"originator doesn't have entitlement %@", self->_entitlement, *MEMORY[0x1896075F0]];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:v9 code:1 userInfo:v11];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x189604010] setWithObject:self->_entitlement];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBOriginatorEntitlementDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  entitlement = self->_entitlement;
  v8 = v4->_entitlement;
  if (entitlement == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }

  if (entitlement) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSString isEqual:](entitlement, "isEqual:");
    goto LABEL_11;
  }

- (unint64_t)hash
{
  return -[NSString hash](self->_entitlement, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_entitlement];

  return v5;
}

- (void).cxx_destruct
{
}

@end