@interface RBEntitlementManager
+ (id)_hardCodedEntitlements;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBEntitlementManager)initWithDomainAttributeEntitlements:(id)a3;
- (id)allEntitlements;
- (id)captureState;
- (id)entitlementsForProcess:(id)a3;
- (uint64_t)_secTask:(CFStringRef)entitlement hasEntitlement:;
- (void)_entitlementsForProcess:(void *)a1;
- (void)_removeRestrictedEntitlements:(void *)a3 forProcess:;
- (void)purgeEntitlementsForProcess:(id)a3;
@end

@implementation RBEntitlementManager

- (RBEntitlementManager)initWithDomainAttributeEntitlements:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"RBEntitlementManager.m", 141, @"Invalid parameter not satisfying: %@", @"entitlements" object file lineNumber description];
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RBEntitlementManager;
  v6 = -[RBEntitlementManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
    entitlementsByIdentifier = v7->_entitlementsByIdentifier;
    v7->_entitlementsByIdentifier = (NSMapTable *)v8;
    v10 = +[RBEntitlementManager _hardCodedEntitlements]();
    uint64_t v11 = [v5 setByAddingObjectsFromSet:v10];
    availableEntitlements = v7->_availableEntitlements;
    v7->_availableEntitlements = (NSSet *)v11;

    uint64_t v13 = restrictedEntitlementsFromPlist();
    restrictedEntitlements = v7->_restrictedEntitlements;
    v7->_restrictedEntitlements = (NSDictionary *)v13;
  }

  return v7;
}

+ (id)_hardCodedEntitlements
{
  if (_hardCodedEntitlements_onceToken != -1) {
    dispatch_once(&_hardCodedEntitlements_onceToken, &__block_literal_global_5);
  }
  return (id)_hardCodedEntitlements_hardCodedEntitlements;
}

- (NSString)debugDescription
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = self->_entitlementsByIdentifier;
  uint64_t v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = -[NSMapTable objectForKey:](self->_entitlementsByIdentifier, "objectForKey:", v9);
        [v9 description];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 appendFormat:@"%@=%@\n\t", v11, v10];
      }

      uint64_t v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v6);
  }

  id v12 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSSet allObjects](self->_availableEntitlements, "allObjects");
  [v14 componentsJoinedByString:@",\n\t\t"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)[v12 initWithFormat:@"<%@|  availableEntitlements:[\n\t\t%@\n\t] entitlementsByIdentifier:[\n\t%@\n\t\t]>", v13, v15, v3];

  return (NSString *)v16;
}

- (id)allEntitlements
{
  return (id)-[NSSet copy](self->_availableEntitlements, "copy");
}

- (id)entitlementsForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ![v4 isTerminating])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    entitlementsByIdentifier = self->_entitlementsByIdentifier;
    [v5 identifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](entitlementsByIdentifier, "objectForKey:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      id v12 = objc_alloc(&OBJC_CLASS___RBEntitlements);
      -[RBEntitlementManager _entitlementsForProcess:](self, v5);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = -[RBEntitlements _initWithEntitlements:](v12, "_initWithEntitlements:", v13);

      v14 = self->_entitlementsByIdentifier;
      [v5 identifier];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v8, v15);
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___RBEntitlements);
    [MEMORY[0x189604010] set];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = -[RBEntitlements _initWithEntitlements:](v6, "_initWithEntitlements:", v7);
  }

  return v8;
}

- (void)_entitlementsForProcess:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x189603FE0] set];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 auditToken];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 realToken];
      audit_token_t token = v19;
      SecTaskRef v7 = SecTaskCreateWithAuditToken(0LL, &token);
      if (v7)
      {
        id v8 = v7;
        v9 = (void *)a1[3];
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = __48__RBEntitlementManager__entitlementsForProcess___block_invoke;
        v15[3] = &unk_18A256058;
        v15[4] = a1;
        SecTaskRef v17 = v7;
        id v10 = v4;
        id v16 = v10;
        [v9 enumerateObjectsUsingBlock:v15];
        if (([v10 containsObject:@"com.apple.assertiond.app-state-monitor"] & 1) == 0
          && ([v10 containsObject:@"com.apple.runningboard.testbinary"] & 1) == 0
          && (SecTaskGetCodeSignStatus(v8) & 0xC000001) == 0x4000001
          && ([v3 isTestApp] & 1) == 0)
        {
          [v10 addObject:@"com.apple.assertiond.app-state-monitor"];
        }

        CFRelease(v8);
      }

      else
      {
        rbs_general_log();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[RBEntitlementManager _entitlementsForProcess:].cold.2();
        }
      }

      -[RBEntitlementManager _removeRestrictedEntitlements:forProcess:]((uint64_t)a1, v4, v3);
      id v12 = v4;
    }

    else
    {
      rbs_process_log();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBEntitlementManager _entitlementsForProcess:].cold.1();
      }

      [MEMORY[0x189604010] set];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    a1 = v12;
  }

  return a1;
}

- (void)purgeEntitlementsForProcess:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  entitlementsByIdentifier = self->_entitlementsByIdentifier;
  [v5 identifier];
  SecTaskRef v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable removeObjectForKey:](entitlementsByIdentifier, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBEntitlementManager debugDescription](self, "debugDescription");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_removeRestrictedEntitlements:(void *)a3 forProcess:
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  SecTaskRef v7 = v6;
  if (!a1) {
    goto LABEL_28;
  }
  [v6 identity];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v7 isTestApp];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v10)
  {

    __int128 v20 = 0LL;
    goto LABEL_27;
  }

  uint64_t v11 = v10;
  __int128 v21 = v7;
  id v22 = v5;
  v24 = 0LL;
  uint64_t v12 = *(void *)v26;
  do
  {
    uint64_t v13 = 0LL;
    do
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v15;
      if (v15 && ([v15 containsObject:v8] & 1) == 0)
      {
        if (!os_variant_has_internal_content()
          || ([v8 hasConsistentLaunchdJob] & 1) != 0
          || ([v8 isEmbeddedApplication] & 1) != 0)
        {
          if ((v23 & 1) != 0) {
            goto LABEL_18;
          }
        }

        else if (([v8 isXPCService] ^ 1 | v23))
        {
          goto LABEL_18;
        }

        rbs_process_log();
        SecTaskRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v8;
          __int16 v31 = 2114;
          uint64_t v32 = v14;
          _os_log_fault_impl( &dword_188634000,  v17,  OS_LOG_TYPE_FAULT,  "RunningBoard: Process %{public}@ does not have permission to have entitlement %{public}@",  buf,  0x16u);
        }

        __int128 v18 = v24;
        if (!v24)
        {
          [MEMORY[0x189603FE0] set];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v24 = v18;
        [v18 addObject:v14];
      }

void __48__RBEntitlementManager__entitlementsForProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[RBEntitlementManager _secTask:hasEntitlement:]( *(void *)(a1 + 32),  *(SecTaskRef *)(a1 + 48),  v3)) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (uint64_t)_secTask:(CFStringRef)entitlement hasEntitlement:
{
  if (!a1) {
    return 0LL;
  }
  CFErrorRef error = 0LL;
  id v3 = (void *)SecTaskCopyValueForEntitlement(task, entitlement, &error);
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0LL;
  }
  CFErrorRef v5 = error;
  if (error)
  {
    uint64_t v6 = -[__CFError code](error, "code");
    rbs_general_log();
    SecTaskRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v6 == 3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_INFO,  "sectask entitlement check made for not-running process",  v10,  2u);
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[RBEntitlementManager _secTask:hasEntitlement:].cold.1();
    }
  }

  return v4;
}

void __46__RBEntitlementManager__hardCodedEntitlements__block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"com.apple.runningboard.primitiveattribute",  @"com.apple.runningboard.endowment-originator",  @"com.apple.runningboard.invalidateanyassertion",  @"com.apple.runningboard.launchprocess",  @"com.apple.runningboard.listallassertions",  @"com.apple.runningboard.process-state",  @"com.apple.runningboard.statecapture",  @"com.apple.runningboard.targetidentities",  @"com.apple.runningboard.terminateprocess",  @"com.apple.runningboard.terminatemanagedprocesses",  @"com.apple.runningboard.performancetest",  @"com.apple.runningboard.launch_extensions",  @"com.apple.runningboard.launch_dexts",  @"com.apple.runningboard.trustedtarget",  @"com.apple.runningboard.testbinary",  @"com.apple.developer.kernel.increased-memory-limit",  @"com.apple.private.security.container-required",  @"com.apple.backboard.client",  @"com.apple.assertiond.background-view-services",  @"com.apple.multitasking.newsstandassertions",  @"com.apple.assertiond.system-shell",  @"com.apple.multitasking.systemappassertions",  @"com.apple.multitasking.termination",  @"com.apple.multitasking.unlimitedassertions",  @"com.apple.UIKit.vends-view-services",  @"com.apple.multitasking.voipassertions",  @"com.apple.assertiond.app-state-monitor",  @"com.apple.private.xpc.launchd.app-server",  @"com.apple.backboardd.debugapplications",  @"com.apple.springboard.debugapplications",  0);
  v1 = (void *)_hardCodedEntitlements_hardCodedEntitlements;
  _hardCodedEntitlements_hardCodedEntitlements = v0;
}

- (void).cxx_destruct
{
}

- (void)_entitlementsForProcess:.cold.1()
{
}

- (void)_entitlementsForProcess:.cold.2()
{
}

- (void)_secTask:hasEntitlement:.cold.1()
{
}

@end