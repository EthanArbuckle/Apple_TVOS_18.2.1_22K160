@interface RBAllEntitlementPredicate
- (BOOL)matchesEntitlements:(id)a3;
- (RBAllEntitlementPredicate)initWithDictionary:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6;
- (id)allEntitlements;
- (id)description;
- (unint64_t)count;
@end

@implementation RBAllEntitlementPredicate

- (RBAllEntitlementPredicate)initWithDictionary:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x189603FC8];
  id v14 = a3;
  [v13 dictionary];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = MEMORY[0x1895F87A8];
  uint64_t v24 = 3221225472LL;
  v25 = __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke;
  v26 = &unk_18A256A00;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  id v30 = v15;
  id v16 = v15;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v14 enumerateKeysAndObjectsUsingBlock:&v23];

  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithDictionary:", v16, v23, v24, v25, v26);
  v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v20;

  return self;
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = &OBJC_CLASS___RBAllEntitlementPredicate;
LABEL_11:
      id v16 = *(void **)(a1 + 56);
      -[__objc2_class predicateForObject:forDomain:attribute:errors:]( v7,  "predicateForObject:forDomain:attribute:errors:",  v5,  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48));
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setObject:v6 forKey:v17];

      goto LABEL_12;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = &OBJC_CLASS___RBAnyEntitlementPredicate;
      goto LABEL_11;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [*(id *)(a1 + 56) setObject:v6 forKey:v5];
      goto LABEL_12;
    }

    rbs_general_log();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, *MEMORY[0x1896075F0]];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      id v11 = (void *)MEMORY[0x189603F68];
      id v12 = &v20;
      v13 = &v19;
      goto LABEL_8;
    }
  }

  else
  {
    rbs_general_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement value of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v6];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      id v11 = (void *)MEMORY[0x189603F68];
      id v12 = (void **)v22;
      v13 = &v21;
LABEL_8:
      [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 48) addObject:v15];
    }
  }

- (BOOL)matchesEntitlements:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 1;
  predicate = self->_predicate;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke;
  v8[3] = &unk_18A256A28;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(predicate) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)predicate;
}

void __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ([v6 matchesEntitlements:*(void *)(a1 + 32)]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (([*(id *)(a1 + 32) hasEntitlement:v6] & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

- (unint64_t)count
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  predicate = self->_predicate;
  uint64_t v9 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__RBAllEntitlementPredicate_count__block_invoke;
  v5[3] = &unk_18A256A50;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__RBAllEntitlementPredicate_count__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v3 = [v4 count];
  }
  else {
    uint64_t v3 = 1LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += v3;
}

- (id)allEntitlements
{
  uint64_t v3 = (void *)objc_opt_new();
  predicate = self->_predicate;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __44__RBAllEntitlementPredicate_allEntitlements__block_invoke;
  v8[3] = &unk_18A256A78;
  id v9 = v3;
  id v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v8);
  [MEMORY[0x189604010] setWithSet:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __44__RBAllEntitlementPredicate_allEntitlements__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    [v6 allEntitlements];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 unionSet:v5];
  }

  else
  {
    [v4 addObject:v6];
  }
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[NSDictionary allKeys](self->_predicate, "allKeys");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 componentsJoinedByString:@" && "];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v3 initWithFormat:@"(%@)", v5];

  return v6;
}

- (void).cxx_destruct
{
}

  ;
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1()
{
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2()
{
}

@end