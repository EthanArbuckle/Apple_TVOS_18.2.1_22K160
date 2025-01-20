@interface RBAssertion
+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6;
+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6 creationTime:(double)a7;
+ (RBAssertion)assertionWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6 originator:(id)a7 context:(id)a8;
- (BOOL)_lock_resolveStateWithContext:(uint64_t)a1;
- (BOOL)definesRelativeStartTime;
- (BOOL)hasDomainAttribute;
- (BOOL)hasHereditaryGrant;
- (BOOL)invalidatesSynchronously;
- (BOOL)isActive;
- (BOOL)isPersistent;
- (BOOL)isSuspended;
- (BOOL)isValid;
- (BOOL)resolveStateWithContext:(id)a3;
- (BOOL)suspendsOnOriginatorSuspension;
- (BOOL)terminateTargetOnOriginatorExit;
- (NSArray)attributes;
- (NSSet)sourceEnvironments;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)explanation;
- (NSString)stateCaptureTitle;
- (RBAssertionIntransientState)intransientState;
- (RBConcreteTargeting)target;
- (RBInheritanceCollection)inheritances;
- (RBProcess)originator;
- (RBProcessState)processState;
- (RBSAssertionIdentifier)identifier;
- (double)creationTime;
- (double)invalidationDuration;
- (double)warningDuration;
- (id)lock_targetProcessForAbstract;
- (id)plugInHoldToken;
- (id)terminationContextForTargetProcess:(id)a3 originatorProcessIsActive:(BOOL)a4;
- (id)updateProcessStateWithAttributeContext:(id)a3;
- (uint64_t)_exceptionCodeForAssertionTimeout;
- (uint64_t)_initWithTarget:(void *)a3 identifier:(void *)a4 explanation:(void *)a5 attributes:(void *)a6 originator:(void *)a7 context:(double)a8 creationTime:;
- (unint64_t)endPolicy;
- (unint64_t)legacyReason;
- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3;
- (unint64_t)runningReason;
- (unint64_t)startPolicy;
- (unsigned)invalidationReason;
- (void)activate;
- (void)applyToAssertionTransientState:(id)a3 withAttributeContext:(id)a4;
- (void)applyToProcessState:(id)a3 withAttributeContext:(id)a4;
- (void)applyToSystemState:(id)a3 withAttributeContext:(id)a4;
- (void)deactivate;
- (void)inheritances;
- (void)processState;
- (void)resume;
- (void)setInvalidationReason:(unsigned __int8)a3;
- (void)setPlugInHoldToken:(id)a3;
- (void)setTargetProcessForAbstract:(id)a3;
- (void)suspend;
@end

@implementation RBAssertion

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v13 identifier];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 explanation];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 attributes];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 assertionWithIdentifier:v14 target:v12 explanation:v15 attributes:v16 originator:v11 context:v10];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBAssertion *)v17;
}

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6 creationTime:(double)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc(&OBJC_CLASS___RBAssertion);
  [v14 identifier];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 explanation];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 attributes];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]( (uint64_t)v15,  v13,  v16,  v17,  v18,  v12,  v11,  a7);
  return (RBAssertion *)v19;
}

- (uint64_t)_initWithTarget:(void *)a3 identifier:(void *)a4 explanation:(void *)a5 attributes:(void *)a6 originator:(void *)a7 context:(double)a8 creationTime:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v51 = a6;
  id v20 = a7;
  if (a1)
  {
    v56.receiver = (id)a1;
    v56.super_class = (Class)&OBJC_CLASS___RBAssertion;
    id v21 = objc_msgSendSuper2(&v56, sel_init);
    a1 = (uint64_t)v21;
    if (v21)
    {
      id v48 = v19;
      id v49 = v17;
      id v50 = v16;
      *((_DWORD *)v21 + 26) = 0;
      objc_storeStrong((id *)v21 + 1, a2);
      objc_storeStrong((id *)(a1 + 24), a3);
      uint64_t v22 = [objc_alloc(NSString) initWithFormat:@"%@ (target:%@)", *(void *)(a1 + 24), *(void *)(a1 + 8)];
      v23 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v22;

      uint64_t v24 = [v18 copy];
      v25 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v24;

      *(_BYTE *)(a1 + 111) = 0;
      objc_storeStrong((id *)(a1 + 40), a5);
      objc_storeStrong((id *)(a1 + 112), a6);
      *(_BYTE *)(a1 + 109) = 0;
      *(double *)(a1 + 96) = a8;
      v26 = objc_alloc_init(&OBJC_CLASS___RBAssertionIntransientState);
      v27 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v26;

      *(_BYTE *)(a1 + 108) = 0;
      [v20 setAssertion:a1];
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      id v28 = *(id *)(a1 + 40);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        char v31 = 0;
        uint64_t v32 = *(void *)v53;
        do
        {
          for (uint64_t i = 0LL; i != v30; ++i)
          {
            if (*(void *)v53 != v32) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend( *(id *)(*((void *)&v52 + 1) + 8 * i),  "applyToAssertionIntransientState:attributePath:context:",  *(void *)(a1 + 64),  RBSAttributePathIncrement(0, v31 + i),  v20);
          }

          uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v57 count:16];
          v31 += i;
        }

        while (v30);
      }

      if (!v18)
      {
        rbs_assertion_log();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:].cold.1( a1,  v34);
        }
      }

      uint64_t v35 = [*(id *)(a1 + 64) runningReason];
      uint64_t v36 = [*(id *)(a1 + 64) legacyReason];
      if (v36)
      {
        uint64_t v37 = v36;
        unsigned __int8 v38 = 3;
      }

      else
      {
        else {
          unsigned __int8 v38 = 1;
        }
        uint64_t v37 = v35;
      }

      id v19 = v48;
      id v17 = v49;
      uint64_t v39 = [objc_alloc(MEMORY[0x1896122A0]) initWithType:v38];
      v40 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v39;

      v41 = *(void **)(a1 + 88);
      if (v18)
      {
        [*(id *)(a1 + 88) setExplanation:v18];
      }

      else
      {
        [(id)a1 description];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 setExplanation:v42];
      }

      id v16 = v50;
      [*(id *)(a1 + 88) setReason:v37];
      v43 = *(void **)(a1 + 88);
      [*(id *)(a1 + 64) domainAttributes];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 setDomain:v44];

      v45 = *(void **)(a1 + 88);
      NSStringFromRBSLegacyReason();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 setName:v46];
    }
  }

  return a1;
}

+ (RBAssertion)assertionWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6 originator:(id)a7 context:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc(&OBJC_CLASS___RBAssertion);
  RBSMachAbsoluteTime();
  id v21 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]( (uint64_t)v19,  v17,  v18,  v16,  v15,  v14,  v13,  v20);

  return (RBAssertion *)v21;
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)deactivate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)suspend
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (-[RBAssertionIntransientState suspendsOnOriginatorSuspension]( self->_intransientState,  "suspendsOnOriginatorSuspension"))
  {
    rbs_ttl_log();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_188634000, v3, OS_LOG_TYPE_DEFAULT, "Suspending assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 1;
    os_unfair_lock_unlock(&self->_lock);
  }

- (void)resume
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (-[RBAssertionIntransientState suspendsOnOriginatorSuspension]( self->_intransientState,  "suspendsOnOriginatorSuspension"))
  {
    rbs_ttl_log();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_188634000, v3, OS_LOG_TYPE_DEFAULT, "Resuming assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 0;
    os_unfair_lock_unlock(&self->_lock);
  }

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_active && !self->_suspended;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isSuspended
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_suspended;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInvalidationReason:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_invalidationReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unsigned)invalidationReason
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v6 = -[RBAssertionTransientState maxCPUUsageViolationPolicyForRole:]( self->_transientState,  "maxCPUUsageViolationPolicyForRole:",  v3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)startPolicy
{
  return -[RBAssertionIntransientState startPolicy](self->_intransientState, "startPolicy");
}

- (unint64_t)endPolicy
{
  return -[RBAssertionIntransientState endPolicy](self->_intransientState, "endPolicy");
}

- (double)invalidationDuration
{
  return result;
}

- (unint64_t)legacyReason
{
  return -[RBAssertionIntransientState legacyReason](self->_intransientState, "legacyReason");
}

- (unint64_t)runningReason
{
  return -[RBAssertionIntransientState runningReason](self->_intransientState, "runningReason");
}

- (double)warningDuration
{
  return result;
}

- (BOOL)terminateTargetOnOriginatorExit
{
  return -[RBAssertionIntransientState terminateTargetOnOriginatorExit]( self->_intransientState,  "terminateTargetOnOriginatorExit");
}

- (BOOL)invalidatesSynchronously
{
  return -[RBAssertionIntransientState invalidatesSynchronously](self->_intransientState, "invalidatesSynchronously");
}

- (RBInheritanceCollection)inheritances
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0 || !self->_targetState)
  {
    BOOL v4 = 0LL;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion inheritances].cold.1();
    }
    [self->_targetState inheritances];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  os_unfair_lock_unlock(p_lock);
  return (RBInheritanceCollection *)v4;
}

- (RBProcessState)processState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0 || !self->_targetState) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[RBAssertion processState].cold.1();
  }
  BOOL v4 = (RBProcessState *)[self->_targetState copy];
  if (!v4)
  {
LABEL_5:
    if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0)
    {
      BOOL v4 = 0LL;
    }

    else
    {
      v5 = objc_alloc(&OBJC_CLASS___RBProcessState);
      -[RBConcreteTargeting identity](self->_target, "identity");
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v4 = -[RBProcessState initWithIdentity:](v5, "initWithIdentity:", v6);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)definesRelativeStartTime
{
  return -[RBAssertionIntransientState definesRelativeStartTime](self->_intransientState, "definesRelativeStartTime");
}

- (BOOL)hasHereditaryGrant
{
  return -[RBAssertionIntransientState hasHereditaryGrant](self->_intransientState, "hasHereditaryGrant");
}

- (BOOL)hasDomainAttribute
{
  return -[RBAssertionIntransientState hasDomainAttribute](self->_intransientState, "hasDomainAttribute");
}

- (NSSet)sourceEnvironments
{
  return (NSSet *)-[RBAssertionIntransientState sourceEnvironments](self->_intransientState, "sourceEnvironments");
}

- (BOOL)suspendsOnOriginatorSuspension
{
  return -[RBAssertionIntransientState suspendsOnOriginatorSuspension]( self->_intransientState,  "suspendsOnOriginatorSuspension");
}

- (BOOL)isPersistent
{
  return -[RBAssertionIntransientState isPersistent](self->_intransientState, "isPersistent");
}

- (BOOL)resolveStateWithContext:(id)a3
{
  uint64_t v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  LOBYTE(v3) = -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)_lock_resolveStateWithContext:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 104));
    if (*(_BYTE *)(a1 + 111) && !*(_BYTE *)(a1 + 109))
    {
      [v3 availableInheritances];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 allInheritances];
      id v10 = (const __CFSet *)objc_claimAutoreleasedReturnValue();

      [v3 systemState];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 conditions];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(void *)(a1 + 48)
        && ((id v13 = *(const __CFSet **)(a1 + 72), v10 == v13)
         || v10
         && v13
         && (CFIndex Count = CFSetGetCount(v10), Count == CFSetGetCount(v13))
         && -[__CFSet isEqualToSet:](v10, "isEqualToSet:", v13))
        && ((id v15 = *(void **)(a1 + 80), v12 == v15) || v12 && v15 && (objc_msgSend(v12, "isEqual:") & 1) != 0))
      {
        BOOL v5 = 0LL;
      }

      else
      {
        char v16 = [*(id *)(a1 + 8) isSystem];
        id v17 = objc_alloc_init(&OBJC_CLASS___RBAssertionTransientState);
        uint64_t v39 = v12;
        v40 = v10;
        if ((v16 & 1) != 0)
        {
          id v18 = objc_alloc_init(&OBJC_CLASS___RBMutableSystemState);
          id v19 = 0LL;
          unsigned __int8 v38 = v18;
        }

        else
        {
          double v20 = objc_alloc(&OBJC_CLASS___RBMutableProcessState);
          [*(id *)(a1 + 8) identity];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v19 = -[RBProcessState initWithIdentity:](v20, "initWithIdentity:", v21);

          id v18 = 0LL;
          unsigned __int8 v38 = (RBMutableSystemState *)v19;
        }

        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        uint64_t v41 = a1;
        id obj = *(id *)(a1 + 40);
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          char v24 = 0;
          uint64_t v25 = *(void *)v44;
          do
          {
            for (uint64_t i = 0LL; i != v23; ++i)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v28 = RBSAttributePathIncrement(0, v24 + i);
              [v27 applyToAssertionTransientState:v17 attributePath:v28 context:v3];
              if (v19) {
                [v27 applyToProcessState:v19 attributePath:v28 context:v3];
              }
              if (v18) {
                [v27 applyToSystemState:v18 attributePath:v28 context:v3];
              }
            }

            uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
            v24 += i;
          }

          while (v23);
        }

        int v29 = [*(id *)(v41 + 88) type];
        uint64_t v30 = *(void *)(v41 + 88);
        if (v29 == 3) {
          -[RBMutableProcessState addLegacyAssertion:](v19, "addLegacyAssertion:", v30);
        }
        else {
          -[RBMutableProcessState addRBAssertion:](v19, "addRBAssertion:", v30);
        }
        id v12 = v39;
        id v10 = v40;
        uint64_t v31 = -[RBMutableSystemState copy](v38, "copy");
        uint64_t v32 = *(void **)(v41 + 48);
        *(void *)(v41 + 48) = v31;

        v33 = *(void **)(v41 + 56);
        *(void *)(v41 + 56) = v17;
        v34 = v17;

        uint64_t v35 = -[__CFSet copy](v40, "copy");
        uint64_t v36 = *(void **)(v41 + 72);
        *(void *)(v41 + 72) = v35;

        objc_storeStrong((id *)(v41 + 80), v39);
        BOOL v5 = 1LL;
      }
    }

    else
    {
      BOOL v4 = *(void **)(a1 + 48);
      BOOL v5 = v4 != 0LL;
      *(void *)(a1 + 48) = 0LL;

      unint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0LL;

      v7 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0LL;

      v8 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0LL;
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

- (id)updateProcessStateWithAttributeContext:(id)a3
{
  return -[RBAssertion processState](self, "processState");
}

- (void)applyToProcessState:(id)a3 withAttributeContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) == 0 && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion applyToProcessState:withAttributeContext:].cold.1();
    }
    uint64_t v8 = [self->_targetState copy];
    if (v8)
    {
      v9 = (void *)v8;
      [v10 unionState:v8];
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)applyToAssertionTransientState:(id)a3 withAttributeContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);

  if (self->_transientState) {
    objc_msgSend(v7, "unionState:");
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)applyToSystemState:(id)a3 withAttributeContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if (-[RBConcreteTargeting isSystem](self->_target, "isSystem") && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[RBAssertion applyToSystemState:withAttributeContext:].cold.1();
    }
    [v7 unionState:self->_targetState];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (uint64_t)_exceptionCodeForAssertionTimeout
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = 562215635LL;
  [a1 explanation];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 hasPrefix:@"Shared Background Assertion"])
  {
    uint64_t v2 = 562215634LL;
  }

  else if (([v3 hasPrefix:@"com.apple.nsurlsessiond.handlesession"] & 1) == 0 {
         && ([v3 isEqualToString:@"com.apple.das.nsurlsessioncomplete"] & 1) == 0)
  }
  {
    if (([v3 isEqualToString:@"com.apple.das.backgroundFetch"] & 1) != 0
      || [v3 isEqualToString:@"com.apple.das.backgroundTasks"]
      && [a1 runningReason] == 100)
    {
      uint64_t v2 = 562215636LL;
    }

    else
    {
      uint64_t v2 = 562215597LL;
    }
  }

  return v2;
}

- (id)terminationContextForTargetProcess:(id)a3 originatorProcessIsActive:(BOOL)a4
{
  id v6 = a3;
  -[RBAssertion identifier](self, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = -[RBAssertion invalidationReason](self, "invalidationReason");
  v9 = -[RBAssertion originator](self, "originator");
  unint64_t v10 = -[RBAssertion endPolicy](self, "endPolicy");
  if ([v6 isLifecycleManaged] && v8 == 4 && v10 == 2)
  {
    id v11 = (void *)MEMORY[0x189612398];
    id v12 = (void *)NSString;
    id v13 = v9;
    if (!v9)
    {
      -[RBAssertion originator](self, "originator");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[RBAssertion explanation](self, "explanation");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringWithFormat:@"Timed-out waiting for process %@ to invalidate assertion with identifier %@ and explanation '%@'. Direct this report to owners of that process", v13, v7, v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 defaultContextWithExplanation:v15];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
    [v16 setPreventIfBeingDebugged:1];
    }
    [v16 setReportType:0];
    [v16 setExceptionCode:-[RBAssertion _exceptionCodeForAssertionTimeout](self)];
    rbs_assertion_log();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  if ([v6 isLifecycleManaged] && v8 == 8 && v10 == 2)
  {
    id v18 = (void *)MEMORY[0x189612398];
    id v19 = (void *)NSString;
    -[RBAssertion explanation](self, "explanation");
    double v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 stringWithFormat:@"Conditions changed, forcing termination due to outstanding assertion with identifier %@ and explanation '%@'", v7, v20];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 defaultContextWithExplanation:v21];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setReportType:0];
    [v16 setExceptionCode:97132013];
    rbs_assertion_log();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_21;
    }

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v3 = -[RBConcreteTargeting isSystem](self->_target, "isSystem");
  id targetState = self->_targetState;
  if ((v3 & 1) != 0)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    BOOL v5 = (const __CFString *)targetState;
    id targetState = 0LL;
  }

  uint64_t v28 = (__CFString *)v5;
  id v6 = (objc_class *)NSString;
  id v7 = (__CFString *)targetState;
  id v29 = objc_alloc(v6);
  uint64_t v8 = [(id)objc_opt_class() description];
  target = self->_target;
  identifier = self->_identifier;
  v27 = (void *)v8;
  originator = self->_originator;
  explanation = self->_explanation;
  v9 = @" transientState:";
  transientState = self->_transientState;
  intransientState = self->_intransientState;
  if (!transientState) {
    v9 = &stru_18A257E48;
  }
  uint64_t v22 = v9;
  if (transientState) {
    id v12 = self->_transientState;
  }
  else {
    id v12 = (RBAssertionTransientState *)&stru_18A257E48;
  }
  if (self->_active) {
    id v13 = @" active";
  }
  else {
    id v13 = &stru_18A257E48;
  }
  if (v5) {
    id v14 = @" processState:";
  }
  else {
    id v14 = &stru_18A257E48;
  }
  if (v5) {
    id v15 = v5;
  }
  else {
    id v15 = &stru_18A257E48;
  }
  if (v7) {
    char v16 = @" systemState:";
  }
  else {
    char v16 = &stru_18A257E48;
  }
  if (v7) {
    id v17 = v7;
  }
  else {
    id v17 = &stru_18A257E48;
  }
  if (self->_suspended) {
    id v18 = @" suspended";
  }
  else {
    id v18 = &stru_18A257E48;
  }
  -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", @",\n\t");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  double v20 = (void *)[v29 initWithFormat:@"<%@| identifier:%@ target:%@ explanation:%@%@ originator:%@%@%@ intransientState:%@%@%@%@%@ suspended:%@ attributes:[\n\t%@\n\t]>", v27, identifier, target, explanation, v13, originator, v22, v12, intransientState, v14, v15, v16, v17, v18, v19];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v20;
}

- (NSString)stateCaptureTitle
{
  char v3 = (void *)NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSAssertionIdentifier description](self->_identifier, "description");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@-%@", v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setTargetProcessForAbstract:(id)a3
{
  BOOL v4 = (RBProcess *)a3;
  os_unfair_lock_lock_with_options();
  targetProcessForAbstract = self->_targetProcessForAbstract;
  self->_targetProcessForAbstract = v4;
  id v6 = v4;

  id targetState = self->_targetState;
  self->_id targetState = 0LL;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)lock_targetProcessForAbstract
{
  return self->_targetProcessForAbstract;
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBProcess)originator
{
  return self->_originator;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (RBAssertionIntransientState)intransientState
{
  return self->_intransientState;
}

- (id)plugInHoldToken
{
  return self->_plugInHoldToken;
}

- (void)setPlugInHoldToken:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_initWithTarget:(uint64_t)a1 identifier:(os_log_s *)a2 explanation:attributes:originator:context:creationTime:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_188634000,  a2,  OS_LOG_TYPE_FAULT,  "Initializing assertion with null-proof explanation being null %{public}@",  (uint8_t *)&v2,  0xCu);
}

- (void)inheritances
{
}

- (void)processState
{
}

- (void)applyToProcessState:withAttributeContext:.cold.1()
{
}

- (void)applyToSystemState:withAttributeContext:.cold.1()
{
}

- (void)terminationContextForTargetProcess:(void *)a1 originatorProcessIsActive:.cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_188634000, v2, v3, "%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end