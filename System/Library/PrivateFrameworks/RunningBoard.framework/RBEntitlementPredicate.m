@interface RBEntitlementPredicate
+ (id)predicateForObject:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6;
- (BOOL)matchesEntitlements:(id)a3;
- (id)allEntitlements;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
@end

@implementation RBEntitlementPredicate

+ (id)predicateForObject:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RBAnyEntitlementPredicate initWithArray:forDomain:attribute:errors:]( objc_alloc(&OBJC_CLASS___RBAnyEntitlementPredicate),  "initWithArray:forDomain:attribute:errors:",  v9,  v10,  v11,  v12);
      goto LABEL_6;
    }

    if (v12)
    {
      v15 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle properties of wrong type: %@", v10, v11, v9, *MEMORY[0x1896075F0]];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v17];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [v12 addObject:v18];
    }

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)matchesEntitlements:(id)a3
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