@interface RBAssertionResolutionContext
- (NSSet)gainedStartTimeDefining;
- (NSSet)lostStartTimeDefining;
- (NSSet)touchedAssertions;
- (RBAttributeContext)_createContextForAssertion:(void *)a1;
- (RBProcessStateChangeSet)changeSet;
- (RBSystemState)systemState;
- (id)_assertionGraphFromAssertion:(id)a3;
- (id)_inheritancesForOriginator:(id)a3;
- (id)_latestStateForIdentity:(id)a3;
- (id)_originatorInheritancesForAssertion:(id)a3;
- (void)_assertionGraphFromAssertion:(id)a3 graph:(id)a4;
- (void)_checkForSuspendableAssertionCycle:(id)a3 newState:(id)a4;
- (void)_finalizeStateChangeSet;
- (void)_resolveProcessStateForTarget:(id)a3 ofType:(unint64_t)a4 viaAssertion:(id)a5;
- (void)_resolveSystemState;
- (void)_suspendAssertionsForTarget:(id)a3;
- (void)_suspendOrResumeAssertionsForTarget:(id)a3 oldState:(id)a4 newState:(id)a5;
- (void)_updateStatesForAssertion:(id)a3;
- (void)initWithAssertions:(void *)a1;
- (void)resolve;
- (void)setAssertionCollection:(uint64_t)a1;
- (void)setBundlePropertiesManager:(uint64_t)a1;
- (void)setDomainAttributeManager:(uint64_t)a1;
- (void)setEntitlementManager:(uint64_t)a1;
- (void)setProcessIndex:(uint64_t)a1;
- (void)setSavedEndowments:(uint64_t)a1;
- (void)setStateMap:(uint64_t)a1;
- (void)setSystemState:(uint64_t)a1;
@end

@implementation RBAssertionResolutionContext

- (void)initWithAssertions:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_CLASS___RBAssertionResolutionContext;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 mutableCopy];
      v5 = (void *)a1[1];
      a1[1] = v4;

      id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
      v9 = (void *)a1[3];
      a1[3] = v8;

      id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
      v11 = (void *)a1[4];
      a1[4] = v10;

      v12 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
      v13 = (void *)a1[6];
      a1[6] = v12;

      v14 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
      v15 = (void *)a1[7];
      a1[7] = v14;

      v16 = objc_alloc_init(&OBJC_CLASS___RBAttributeContext);
      v17 = (void *)a1[8];
      a1[8] = v16;
    }
  }

  return a1;
}

- (void)setAssertionCollection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setProcessIndex:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setStateMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)setDomainAttributeManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setBundlePropertiesManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setEntitlementManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (void)setSavedEndowments:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)setSystemState:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)resolve
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1895C9F58]();
    [*(id *)(a1 + 64) setDomainAttributeManager:*(void *)(a1 + 104)];
    [*(id *)(a1 + 64) setBundlePropertiesManager:*(void *)(a1 + 112)];
    [*(id *)(a1 + 64) setEntitlementManager:*(void *)(a1 + 120)];
    [*(id *)(a1 + 64) setSystemState:*(void *)(a1 + 136)];
    while ([*(id *)(a1 + 8) count])
    {
      while ([*(id *)(a1 + 8) count])
      {
        [*(id *)(a1 + 8) anyObject];
        id v3 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 8) removeObject:v3];
        [(id)a1 _updateStatesForAssertion:v3];
      }

      [*(id *)(a1 + 40) allObjects];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) removeAllObjects];
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0LL;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [(id)a1 _resolveProcessStateForTarget:*(void *)(*((void *)&v10 + 1) + 8 * v9++) ofType:0 viaAssertion:0];
          }

          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v7);
      }
    }

    [(id)a1 _finalizeStateChangeSet];
    [(id)a1 _resolveSystemState];
    objc_autoreleasePoolPop(v2);
  }

- (RBAttributeContext)_createContextForAssertion:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___RBAttributeContext);
    -[RBAttributeContext setDomainAttributeManager:](v4, "setDomainAttributeManager:", a1[13]);
    -[RBAttributeContext setBundlePropertiesManager:](v4, "setBundlePropertiesManager:", a1[14]);
    -[RBAttributeContext setEntitlementManager:](v4, "setEntitlementManager:", a1[15]);
    -[RBAttributeContext setAssertion:](v4, "setAssertion:", v3);
    [a1 _originatorInheritancesForAssertion:v3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[RBAttributeContext setAvailableInheritances:](v4, "setAvailableInheritances:", v5);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)_assertionGraphFromAssertion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x189603FC8];
  id v5 = a3;
  [v4 dictionary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionResolutionContext _assertionGraphFromAssertion:graph:]( self,  "_assertionGraphFromAssertion:graph:",  v5,  v6);

  return v6;
}

- (void)_assertionGraphFromAssertion:(id)a3 graph:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    [MEMORY[0x189603FE0] set];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:");
    if ([v6 hasHereditaryGrant])
    {
      [v6 target];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 process];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (processIndex = self->_processIndex,
            [v10 identity],
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RBProcessIndex processForIdentity:](processIndex, "processForIdentity:", v13),
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v11))
      {
        v30 = v8;
        id v31 = v6;
        v29 = v10;
        [v10 environment];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = self;
        assertionCollection = self->_assertionCollection;
        v28 = v11;
        [v11 identifier];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v17);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v34;
          do
          {
            for (uint64_t i = 0LL; i != v21; ++i)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              [v24 sourceEnvironments];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              int v26 = [v25 containsObject:v14];

              if (v26)
              {
                [v24 identifier];
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v32 addObject:v27];

                -[RBAssertionResolutionContext _assertionGraphFromAssertion:graph:]( v15,  "_assertionGraphFromAssertion:graph:",  v24,  v7);
              }
            }

            uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }

          while (v21);
        }

        uint64_t v8 = v30;
        id v6 = v31;
        __int128 v10 = v29;
      }
    }
  }
}

- (void)_updateStatesForAssertion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[RBAssertionResolutionContext _assertionGraphFromAssertion:](self, "_assertionGraphFromAssertion:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)MEMORY[0x189603FD0];
  v28 = v4;
  [v4 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 orderedSetWithObject:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FE0] set];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 count])
  {
    v29 = v5;
    do
    {
      __int128 v10 = (void *)MEMORY[0x1895C9F58]();
      [v8 firstObject];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 removeObjectAtIndex:0];
      [v9 addObject:v11];
      -[RBAssertionCollection assertionWithIdentifier:](self->_assertionCollection, "assertionWithIdentifier:", v11);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 originator];
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[NSMutableSet addObject:](self->_touchedAssertions, "addObject:", v12);
        -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v12);
        attributeContext = self->_attributeContext;
        id v31 = v13;
        -[RBAssertionResolutionContext _inheritancesForOriginator:](self, "_inheritancesForOriginator:", v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v15);

        v16 = self->_attributeContext;
        savedEndowments = self->_savedEndowments;
        [v12 originator];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v18);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAttributeContext setSavedEndowments:](v16, "setSavedEndowments:", v19);

        -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
        if ([v12 resolveStateWithContext:self->_attributeContext])
        {
          if (-[RBAssertionCollection hasResolvedAssertion:](self->_assertionCollection, "hasResolvedAssertion:", v12))
          {
            else {
              uint64_t v20 = 2LL;
            }
          }

          else
          {
            uint64_t v20 = 1LL;
          }

          [v12 target];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionResolutionContext _resolveProcessStateForTarget:ofType:viaAssertion:]( self,  "_resolveProcessStateForTarget:ofType:viaAssertion:",  v27,  v20,  v12);

          [v5 objectForKeyedSubscript:v11];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 unionSet:v21];
        }

        else
        {
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          [v5 objectForKeyedSubscript:v11];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            v30 = v10;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t i = 0LL; i != v23; ++i)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                if (([v9 containsObject:v26] & 1) == 0) {
                  [v8 addObject:v26];
                }
              }

              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
            }

            while (v23);
            id v5 = v29;
            __int128 v10 = v30;
          }
        }

        -[RBAssertionCollection noteResolvedAssertion:](self->_assertionCollection, "noteResolvedAssertion:", v12);
        __int128 v13 = v31;
      }

      objc_autoreleasePoolPop(v10);
    }

    while ([v8 count]);
  }
}

- (id)_inheritancesForOriginator:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 identity];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RBProcessMap containsIdentity:](self->_originatorInheritances, "containsIdentity:", v6))
    {
      -[RBProcessMap valueForIdentity:](self->_originatorInheritances, "valueForIdentity:", v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }

    if (-[RBProcessMap containsIdentity:](self->_resolvedState, "containsIdentity:", v6))
    {
      -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 inheritances];
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = -[RBProcessMap setValue:forIdentity:](self->_originatorInheritances, "setValue:forIdentity:", v7, v6);
      goto LABEL_26;
    }

    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v6);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 inheritances];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v7 = v11;
      uint64_t v12 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v23 = v10;
        uint64_t v24 = v6;
        v14 = 0LL;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v7);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            objc_msgSend(v17, "originatingIdentifier", v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBAssertionCollection assertionWithIdentifier:]( self->_assertionCollection,  "assertionWithIdentifier:",  v18);
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (([v19 isActive] & 1) == 0)
            {
              if (!v14) {
                v14 = (void *)[v7 mutableCopy];
              }
              [v14 removeInheritance:v17];
            }
          }

          uint64_t v13 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v13);

        __int128 v10 = v23;
        if (!v14)
        {
          id v6 = v24;
          goto LABEL_25;
        }

        uint64_t v20 = [v14 copy];

        id v7 = (id)v20;
        id v6 = v24;
      }

      else
      {
        v14 = v7;
      }
    }

    else
    {
      id v7 = 0LL;
    }

- (id)_originatorInheritancesForAssertion:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBAssertionResolutionContext _inheritancesForOriginator:](self, "_inheritancesForOriginator:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_latestStateForIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }

    else
    {
      -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)_suspendAssertionsForTarget:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  assertionCollection = self->_assertionCollection;
  objc_msgSend(a3, "identifier", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 suspendsOnOriginatorSuspension])
        {
          if (([v11 isSuspended] & 1) == 0)
          {
            [v11 suspend];
            -[NSMutableSet addObject:](self->_assertions, "addObject:", v11);
            if ([v11 definesRelativeStartTime])
            {
              [v11 target];
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
              [v12 identity];
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13) {
                -[NSMutableSet addObject:](self->_lostStartTimeDefining, "addObject:", v13);
              }
            }
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)_checkForSuspendableAssertionCycle:(id)a3 newState:(id)a4
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v6 isLifecycleManaged] & 1) == 0)
  {
    rbs_assertion_log();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    id v72 = v5;
    v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not managed";
LABEL_50:
    _os_log_impl(&dword_188634000, v16, OS_LOG_TYPE_INFO, v44, buf, 0xCu);
    goto LABEL_57;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  assertionCollection = self->_assertionCollection;
  [v6 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (!v10)
  {

LABEL_48:
    rbs_assertion_log();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    id v72 = v5;
    v44 = "_checkForSuspendableAssertionCycle for %{public}@ bailing out since it's not holding a suspendable assertion";
    goto LABEL_50;
  }

  uint64_t v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v67;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(v9);
      }
      v12 |= [*(id *)(*((void *)&v66 + 1) + 8 * i) suspendsOnOriginatorSuspension];
    }

    uint64_t v11 = [v9 countByEnumeratingWithState:&v66 objects:v77 count:16];
  }

  while (v11);

  if ((v12 & 1) == 0) {
    goto LABEL_48;
  }
  id v52 = v5;
  unint64_t v15 = 0x189603000uLL;
  [MEMORY[0x189603FA8] array];
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  -[os_log_s addObject:](v16, "addObject:", v6);
  [MEMORY[0x189603FE0] set];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[os_log_s count](v16, "count"))
  {
    __int128 v17 = v16;
    v18 = (void *)-[os_log_s copy](v16, "copy");
    [v53 addObjectsFromArray:v16];
    [*(id *)(v15 + 4008) array];
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v19 = v18;
    uint64_t v49 = [v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (!v49) {
      goto LABEL_34;
    }
    uint64_t v20 = *(void *)v63;
    v51 = v6;
    uint64_t v47 = *(void *)v63;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v63 != v20) {
          objc_enumerationMutation(v19);
        }
        uint64_t v50 = v21;
        uint64_t v22 = *(void **)(*((void *)&v62 + 1) + 8 * v21);
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        uint64_t v23 = self->_assertionCollection;
        v48 = v22;
        objc_msgSend(v22, "identity", v47);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBAssertionCollection assertionsForTargetIdentity:](v23, "assertionsForTargetIdentity:", v24);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v75 count:16];
        if (!v26) {
          goto LABEL_32;
        }
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v59;
        while (2)
        {
          for (uint64_t j = 0LL; j != v27; ++j)
          {
            if (*(void *)v59 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            [v30 intransientState];
            id v31 = (void *)objc_claimAutoreleasedReturnValue();
            int v32 = [v30 isActive];

            if (v32)
            {
              [v30 originator];
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
              char v34 = [v33 isLifecycleManaged];

              if ((v34 & 1) == 0)
              {
                rbs_assertion_log();
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  [v30 originator];
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  id v72 = v46;
                  __int16 v73 = 2114;
                  v74 = v48;
                  _os_log_impl( &dword_188634000,  v45,  OS_LOG_TYPE_INFO,  "_checkForSuspendableAssertionCycle bailing out for not-manged-process (originator: %{public}@ target: %{public}@)",  buf,  0x16u);
                }

                goto LABEL_55;
              }

              if (([v30 suspendsOnOriginatorSuspension] & 1) == 0)
              {
                rbs_assertion_log();
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  id v72 = v30;
                  _os_log_impl( &dword_188634000,  v45,  OS_LOG_TYPE_INFO,  "_checkForSuspendableAssertionCycle bailing out for not-suspendable assertion %{public}@",  buf,  0xCu);
                }

- (void)_suspendOrResumeAssertionsForTarget:(id)a3 oldState:(id)a4 newState:(id)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  int v10 = [a4 preventSuspend];
  int v11 = [v9 preventSuspend];
  if (v10 != v11)
  {
    char v12 = v11;
    -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v8);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 isLifecycleManaged])
    {
      if ((v12 & 1) != 0)
      {
        if ((v10 & 1) == 0)
        {
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          assertionCollection = self->_assertionCollection;
          objc_msgSend(v13, "identifier", 0);
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionCollection assertionsForOriginator:](assertionCollection, "assertionsForOriginator:", v15);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t i = 0LL; i != v18; ++i)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if ([v21 suspendsOnOriginatorSuspension])
                {
                  if ([v21 isSuspended])
                  {
                    if ([v21 isValid])
                    {
                      [v21 resume];
                      -[NSMutableSet addObject:](self->_assertions, "addObject:", v21);
                      if ([v21 definesRelativeStartTime])
                      {
                        [v21 target];
                        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                        [v22 identity];
                        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v23) {
                          -[NSMutableSet addObject:](self->_gainedStartTimeDefining, "addObject:", v23);
                        }
                      }
                    }
                  }
                }
              }

              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
            }

            while (v18);
          }
        }
      }

      else
      {
        -[RBAssertionResolutionContext _suspendAssertionsForTarget:](self, "_suspendAssertionsForTarget:", v13);
      }
    }
  }
}

- (void)_resolveProcessStateForTarget:(id)a3 ofType:(unint64_t)a4 viaAssertion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  if ([v9 isSystem]) {
    goto LABEL_27;
  }
  targetsPendingResolution = self->_targetsPendingResolution;
  if (a4 == 3)
  {
    if (!targetsPendingResolution)
    {
      char v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v13 = self->_targetsPendingResolution;
      self->_targetsPendingResolution = v12;

      targetsPendingResolution = self->_targetsPendingResolution;
    }

    -[NSMutableSet addObject:](targetsPendingResolution, "addObject:", v9);
    goto LABEL_27;
  }

  -[NSMutableSet removeObject:](targetsPendingResolution, "removeObject:", v9);
  [v9 identity];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionResolutionContext _latestStateForIdentity:](self, "_latestStateForIdentity:", v14);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = v15;
  if (a4 == 1)
  {
    uint64_t v17 = [v15 mutableCopy];
    if (v17)
    {
      uint64_t v18 = (RBMutableProcessState *)v17;
      [v10 processState];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBMutableProcessState unionState:](v18, "unionState:", v19);

      if (!v16) {
        goto LABEL_22;
      }
LABEL_21:
      if (-[RBProcessState isEqualToProcessStateIgnoringIdentity:](v18, "isEqualToProcessStateIgnoringIdentity:", v16)) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }

  SEL v38 = a2;
  v39 = v16;
  id v41 = v10;
  id v42 = v9;
  uint64_t v18 = -[RBProcessState initWithIdentity:](objc_alloc(&OBJC_CLASS___RBMutableProcessState), "initWithIdentity:", v14);
  uint64_t v40 = v14;
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertionCollection, "assertionsForTargetIdentity:", v14);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v22; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        __int128 v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v25 isActive])
        {
          -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v25);
          attributeContext = self->_attributeContext;
          -[RBAssertionResolutionContext _originatorInheritancesForAssertion:]( self,  "_originatorInheritancesForAssertion:",  v25);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v27);

          uint64_t v28 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          [v25 originator];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v30);
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setSavedEndowments:](v28, "setSavedEndowments:", v31);

          -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
          [v25 applyToProcessState:v18 withAttributeContext:self->_attributeContext];
        }
      }

      uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v22);
  }

  id v10 = v41;
  id v9 = v42;
  __int128 v16 = v39;
  __int128 v14 = v40;
  if (!v18)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 handleFailureInMethod:v38 object:self file:@"RBAssertionStateResolver.m" lineNumber:537 description:@"cannot get this far without state"];

    if (!v39) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  if (v39) {
    goto LABEL_21;
  }
LABEL_22:
  int v32 = (RBMutableProcessState *)-[RBMutableProcessState copy](v18, "copy");

  id v33 = -[RBProcessMap setValue:forIdentity:](self->_resolvedState, "setValue:forIdentity:", v32, v14);
  originatorInheritances = self->_originatorInheritances;
  -[RBProcessState inheritances](v32, "inheritances");
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  id v36 = -[RBProcessMap setValue:forIdentity:](originatorInheritances, "setValue:forIdentity:", v35, v14);

  -[RBAssertionResolutionContext _suspendOrResumeAssertionsForTarget:oldState:newState:]( self,  "_suspendOrResumeAssertionsForTarget:oldState:newState:",  v14,  v16,  v32);
  uint64_t v18 = v32;
LABEL_23:
  if (-[RBProcessState preventSuspend](v18, "preventSuspend")
    && -[RBProcessState targetedBySuspendableAssertion](v18, "targetedBySuspendableAssertion"))
  {
    -[RBAssertionResolutionContext _checkForSuspendableAssertionCycle:newState:]( self,  "_checkForSuspendableAssertionCycle:newState:",  v14,  v18);
  }

LABEL_27:
}

- (void)_finalizeStateChangeSet
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  -[RBProcessMap allIdentities](self->_resolvedState, "allIdentities");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = objc_alloc(&OBJC_CLASS___RBProcessStateChange);
        -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessMap valueForIdentity:](self->_resolvedState, "valueForIdentity:", v8);
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]( v9,  "initWithIdentity:originalState:updatedState:",  v8,  v10,  v11);

        [v3 addObject:v12];
        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v5);
  }

  uint64_t v13 = -[RBProcessStateChangeSet initWithChanges:]( objc_alloc(&OBJC_CLASS___RBProcessStateChangeSet),  "initWithChanges:",  v3);
  changeSet = self->_changeSet;
  self->_changeSet = v13;
}

- (void)_resolveSystemState
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(&OBJC_CLASS___RBMutableSystemState);
  assertionCollection = self->_assertionCollection;
  +[RBConcreteTarget systemTarget](&OBJC_CLASS___RBConcreteTarget, "systemTarget");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionCollection assertionsForTarget:](assertionCollection, "assertionsForTarget:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "isActive", (void)v21))
        {
          -[RBAttributeContext setAssertion:](self->_attributeContext, "setAssertion:", v12);
          attributeContext = self->_attributeContext;
          -[RBAssertionResolutionContext _originatorInheritancesForAssertion:]( self,  "_originatorInheritancesForAssertion:",  v12);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setAvailableInheritances:](attributeContext, "setAvailableInheritances:", v14);

          unint64_t v15 = self->_attributeContext;
          savedEndowments = self->_savedEndowments;
          [v12 originator];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v17);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAttributeContext setSavedEndowments:](v15, "setSavedEndowments:", v18);

          -[RBAttributeContext setSystemState:](self->_attributeContext, "setSystemState:", self->_systemState);
          [v12 applyToSystemState:v3 withAttributeContext:self->_attributeContext];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  __int128 v19 = (RBSystemState *)-[RBMutableSystemState copy](v3, "copy");
  systemState = self->_systemState;
  self->_systemState = v19;
}

- (NSSet)lostStartTimeDefining
{
  return &self->_lostStartTimeDefining->super;
}

- (NSSet)gainedStartTimeDefining
{
  return &self->_gainedStartTimeDefining->super;
}

- (RBProcessStateChangeSet)changeSet
{
  return self->_changeSet;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (NSSet)touchedAssertions
{
  return &self->_touchedAssertions->super;
}

- (void).cxx_destruct
{
}

@end