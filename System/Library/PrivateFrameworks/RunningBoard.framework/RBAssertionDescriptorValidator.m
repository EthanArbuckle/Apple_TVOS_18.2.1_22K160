@interface RBAssertionDescriptorValidator
+ (BOOL)checkConflictingAttributes:(id)a3 error:(id *)a4;
- (BOOL)isAssertionValidForContext:(id)a3 error:(id *)a4;
- (id)_errorWithDescription:(uint64_t)a1;
- (id)_flattenedAttributesFromAttribute:(void *)a3 context:;
- (id)_flattenedAttributesFromContext:(void *)a1;
@end

@implementation RBAssertionDescriptorValidator

+ (BOOL)checkConflictingAttributes:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v11 = v5;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0LL; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (v10 != *(void **)(*((void *)&v18 + 1) + 8 * j)
                && (!objc_msgSend(v10, "allowedWithAttribute:error:")
                 || ![v10 hasMandatoryAttributes:v11 error:a4]))
              {

                BOOL v16 = 0;
                goto LABEL_21;
              }
            }

            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }

      uint64_t v7 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 1;
    }

    while (v7);
  }

  else
  {
    BOOL v16 = 1;
  }

- (BOOL)isAssertionValidForContext:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 52, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }

  [v7 assertionDescriptor];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 originatorEntitlements];
  v10 = (void *)v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_5;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 57, @"Invalid parameter not satisfying: %@", @"assertionDescriptor" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 58, @"Invalid parameter not satisfying: %@", @"originatorEntitlements" object file lineNumber description];

LABEL_5:
  [v7 bundlePropertiesManager];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 59, @"Invalid parameter not satisfying: %@", @"[context bundlePropertiesManager]" object file lineNumber description];
  }

  [v7 domainAttributeManager];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 60, @"Invalid parameter not satisfying: %@", @"[context domainAttributeManager]" object file lineNumber description];
  }

  [v7 entitlementManager];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 61, @"Invalid parameter not satisfying: %@", @"[context entitlementManager]" object file lineNumber description];
  }

  [v7 setAssertionDescriptionValidator:self];
  [v8 attributes];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v14 count])
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v52 = v14;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      obuint64_t j = v15;
      SEL v48 = a2;
      v49 = self;
      v50 = a4;
      v51 = v8;
      char v18 = 0;
      uint64_t v19 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(obj);
          }
          __int128 v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v54 = 0LL;
          id v23 = v7;
          char v24 = [v21 isValidForContext:v7 withError:&v54];
          id v25 = v54;
          v26 = v25;
          if ((v24 & 1) == 0)
          {
            if (!v25)
            {
              [MEMORY[0x1896077D8] currentHandler];
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              [v47 handleFailureInMethod:v48, v49, @"RBAssertionDescriptorValidator.m", 86, @"attribute failed to return error for validation: %@", v21 object file lineNumber description];
            }

            uint64_t v8 = v51;
            if (v50) {
              id *v50 = v26;
            }

            BOOL v27 = 0;
            id v7 = v23;
            goto LABEL_39;
          }

          v18 |= isKindOfClass;

          id v7 = v23;
        }

        uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v17) {
          continue;
        }
        break;
      }

      uint64_t v8 = v51;
      self = v49;
      a4 = v50;
      if ((v18 & 1) != 0) {
        goto LABEL_38;
      }
    }

    else
    {
    }

    [v8 target];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 processIdentity];
    if (v29)
    {
      v30 = (void *)v29;
      [v7 acquisitionContext];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v31 allowAbstractTarget] & 1) == 0)
      {
        v32 = a4;
        id v33 = v7;
        [v8 target];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 processIdentity];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35
          && ([v10 hasEntitlementDomain:2] & 1) == 0
          && ([v10 hasEntitlementDomain:4] & 1) == 0)
        {
          char v38 = [v10 hasEntitlement:@"com.apple.runningboard.targetidentities"];
          v39 = v34;
          char v40 = v38;

          id v7 = v33;
          a4 = v32;
          if ((v40 & 1) == 0)
          {
            if (v32)
            {
              -[RBAssertionDescriptorValidator _errorWithDescription:]( (uint64_t)self,  @"Client is not entitled to use identities as assertion targets");
              BOOL v27 = 0;
              id *v32 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              BOOL v27 = 0;
            }

            goto LABEL_39;
          }

- (id)_errorWithDescription:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v2 = (void *)MEMORY[0x189607870];
  uint64_t v3 = *MEMORY[0x1896123E0];
  uint64_t v9 = *MEMORY[0x1896075F0];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x189603F68];
  id v5 = a2;
  [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:v3 code:2 userInfo:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_flattenedAttributesFromContext:(void *)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    [v3 assertionDescriptor];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_msgSend(v5, "attributes", 0);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[RBAssertionDescriptorValidator _flattenedAttributesFromAttribute:context:]( a1,  *(void **)(*((void *)&v14 + 1) + 8 * v11),  v4);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 unionSet:v12];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)_flattenedAttributesFromAttribute:(void *)a3 context:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  __int128 v17 = v5;
  if (a1)
  {
    [v6 domainAttributeManager];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v5];
    while ([v9 count])
    {
      [v9 anyObject];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v11 = v10;
        [v11 domain];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 name];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        [v8 attributesForDomain:v12 andName:v13 context:v7 withError:0];
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        [v9 addObjectsFromArray:v14];
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [a1 addObject:v10];
          goto LABEL_9;
        }

        id v14 = v10;
        [v14 attributes];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 addObjectsFromArray:v15];

        [a1 addObject:v14];
      }

LABEL_9:
      [v9 removeObject:v10];
    }
  }

  return a1;
}

@end