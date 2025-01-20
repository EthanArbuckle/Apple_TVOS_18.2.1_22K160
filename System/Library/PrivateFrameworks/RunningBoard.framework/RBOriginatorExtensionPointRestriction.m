@interface RBOriginatorExtensionPointRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithExtensionPoint:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBOriginatorExtensionPointRestriction

- (id)_initWithExtensionPoint:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBOriginatorExtensionPointRestriction;
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
  [v5 objectForKey:@"ExtensionPoint"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = -[RBOriginatorExtensionPointRestriction _initWithExtensionPoint:]( objc_alloc(&OBJC_CLASS___RBOriginatorExtensionPointRestriction),  "_initWithExtensionPoint:",  v6);
  }

  else if (a4)
  {
    v7 = (void *)MEMORY[0x189607870];
    [NSString stringWithFormat:@"RBOriginatorExtensionPointRestriction doesn't specify extensionPoint: %@", v5, *MEMORY[0x1896075F0]];
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
  v23[1] = *MEMORY[0x1895F89C0];
  [a3 originatorProcess];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identity];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isExtension];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896124C0];
    uint64_t v22 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"originator isn't extension"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v15 = (void *)MEMORY[0x189603F68];
    v16 = (void **)v23;
    v17 = &v22;
LABEL_8:
    [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 errorWithDomain:v13 code:1 userInfo:v18];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
    goto LABEL_9;
  }

  extensionPoint = self->_extensionPoint;
  [v6 bundleProperties];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 extensionPointIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(extensionPoint) = -[NSString isEqualToString:](extensionPoint, "isEqualToString:", v11);

  if ((extensionPoint & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896124C0];
    [NSString stringWithFormat:@"originator doesn't have extensionPoint %@", self->_extensionPoint, *MEMORY[0x1896075F0]];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v15 = (void *)MEMORY[0x189603F68];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_8;
  }

  LOBYTE(a4) = 1;
LABEL_9:

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x189604010] set];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBOriginatorExtensionPointRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  extensionPoint = self->_extensionPoint;
  char v8 = v4->_extensionPoint;
  if (extensionPoint == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }

  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSString isEqual:](extensionPoint, "isEqual:");
    goto LABEL_11;
  }

- (unint64_t)hash
{
  return -[NSString hash](self->_extensionPoint, "hash");
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_extensionPoint];

  return v5;
}

- (void).cxx_destruct
{
}

@end