@interface RBAssertionStateResolver
- (NSMapTable)savedEndowments;
- (RBAssertionCollection)assertionCollection;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBProcessIndex)processIndex;
- (RBProcessMap)stateMap;
- (RBSystemState)systemState;
- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3;
- (id)resolveForAssertions:(id)a3;
- (void)setAssertionCollection:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setProcessIndex:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setStateMap:(id)a3;
- (void)setSystemState:(id)a3;
@end

@implementation RBAssertionStateResolver

- (id)resolveForAssertions:(id)a3
{
  id v4 = a3;
  v5 = -[RBAssertionResolutionContext initWithAssertions:](objc_alloc(&OBJC_CLASS___RBAssertionResolutionContext), v4);

  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  -[RBAssertionResolutionContext setSystemState:]((uint64_t)v5, self->_systemState);
  -[RBAssertionResolutionContext resolve]((uint64_t)v5);
  return v5;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  v5 = -[RBAssertionResolutionContext initWithAssertions:](objc_alloc(&OBJC_CLASS___RBAssertionResolutionContext), 0LL);
  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  [MEMORY[0x189603FE0] set];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  assertionCollection = self->_assertionCollection;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke;
  v13[3] = &unk_18A257110;
  BOOL v16 = a3;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  v9 = v5;
  -[RBAssertionCollection enumerateAssertionsWithBlock:](assertionCollection, "enumerateAssertionsWithBlock:", v13);
  v10 = v15;
  id v11 = v8;

  return v11;
}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke( uint64_t a1,  void *a2)
{
  id v15 = a2;
  if ([v15 isActive])
  {
    [v15 target];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 attributes];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      [MEMORY[0x189603FA8] array];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RBAssertionResolutionContext _createContextForAssertion:](*(void **)(a1 + 32), v15);
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2;
      v16[3] = &unk_18A256AC8;
      id v7 = v5;
      id v17 = v7;
      id v18 = v6;
      id v8 = v6;
      [v4 enumerateObjectsUsingBlock:v16];
      id v9 = v7;

      id v4 = v9;
    }

    v10 = (void *)MEMORY[0x189612168];
    [v15 identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 createRBSTarget];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 explanation];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 descriptorWithIdentifier:v11 target:v12 explanation:v13 attributes:v4];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) addObject:v14];
  }
}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2( uint64_t a1,  void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 effectiveAttributesWithContext:*(void *)(a1 + 40)];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 allObjects];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

- (RBAssertionCollection)assertionCollection
{
  return self->_assertionCollection;
}

- (void)setAssertionCollection:(id)a3
{
}

- (RBProcessIndex)processIndex
{
  return self->_processIndex;
}

- (void)setProcessIndex:(id)a3
{
}

- (RBProcessMap)stateMap
{
  return self->_stateMap;
}

- (void)setStateMap:(id)a3
{
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setDomainAttributeManager:(id)a3
{
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (void)setBundlePropertiesManager:(id)a3
{
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (void)setEntitlementManager:(id)a3
{
}

- (NSMapTable)savedEndowments
{
  return self->_savedEndowments;
}

- (void)setSavedEndowments:(id)a3
{
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end