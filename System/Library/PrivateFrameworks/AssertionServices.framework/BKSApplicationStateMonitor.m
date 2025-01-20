@interface BKSApplicationStateMonitor
- (BKSApplicationStateMonitor)init;
- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4;
- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5;
- (BKSApplicationStateMonitor)initWithEndpoint:(id)a3 bundleIDs:(id)a4 states:(unsigned int)a5 elevatedPriority:(BOOL)a6;
- (BOOL)_clientSubscribedToThisReasonChange:(id)a3;
- (BOOL)_clientSubscribedToThisStateChange:(id)a3 state:(id)a4 prevState:(id)a5;
- (BOOL)elevatedPriority;
- (NSArray)interestedBundleIDs;
- (id)_legacyInfoForProcess:(id)a3;
- (id)_legacyInfoForProcess:(id)a3 state:(id)a4;
- (id)applicationInfoForApplication:(id)a3;
- (id)applicationInfoForPID:(int)a3;
- (id)bundleInfoValueForKey:(id)a3 PID:(int)a4;
- (id)handler;
- (unsigned)_legacyStateForProcess:(id)a3 state:(id)a4;
- (unsigned)applicationStateForApplication:(id)a3;
- (unsigned)interestedStates;
- (unsigned)mostElevatedApplicationStateForPID:(int)a3;
- (void)applicationInfoForApplication:(id)a3 completion:(id)a4;
- (void)applicationInfoForPID:(int)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)lock_updateConfiguration;
- (void)setHandler:(id)a3;
- (void)updateInterestedAssertionReasons:(id)a3;
- (void)updateInterestedBundleIDs:(id)a3;
- (void)updateInterestedBundleIDs:(id)a3 states:(unsigned int)a4;
- (void)updateInterestedStates:(unsigned int)a3;
@end

@implementation BKSApplicationStateMonitor

- (BKSApplicationStateMonitor)init
{
  return -[BKSApplicationStateMonitor initWithBundleIDs:states:elevatedPriority:]( self,  "initWithBundleIDs:states:elevatedPriority:",  0LL,  0xFFFFFFFFLL,  0LL);
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4
{
  return -[BKSApplicationStateMonitor initWithBundleIDs:states:elevatedPriority:]( self,  "initWithBundleIDs:states:elevatedPriority:",  a3,  *(void *)&a4,  0LL);
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5
{
  return -[BKSApplicationStateMonitor initWithEndpoint:bundleIDs:states:elevatedPriority:]( self,  "initWithEndpoint:bundleIDs:states:elevatedPriority:",  0LL,  a3,  *(void *)&a4,  a5);
}

- (BKSApplicationStateMonitor)initWithEndpoint:(id)a3 bundleIDs:(id)a4 states:(unsigned int)a5 elevatedPriority:(BOOL)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BKSApplicationStateMonitor;
  v11 = -[BKSApplicationStateMonitor init](&v18, sel_init);
  if (v11)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 handleFailureInMethod:a2 object:v11 file:@"BKSApplicationStateMonitor.m" lineNumber:94 description:@"bundleIDs must be an array"];
      }
    }

    v11->_lock._os_unfair_lock_opaque = 0;
    v12 = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x189612310]);
    monitor = v11->_monitor;
    v11->_monitor = v12;

    v11->_elevatedPriority = a6;
    uint64_t v14 = [v10 copy];
    interestedBundleIDs = v11->_interestedBundleIDs;
    v11->_interestedBundleIDs = (NSArray *)v14;

    v11->_interestedStates = a5;
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKSApplicationStateMonitor;
  -[BKSApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)setHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)[v5 copy];

  id handler = self->_handler;
  self->_id handler = v6;

  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(p_lock);
}

- (id)handler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x186E36CA4](self->_handler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x186E36CA4](v4);

  return v5;
}

- (NSArray)interestedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_interestedBundleIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unsigned)interestedStates
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_interestedStates;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (BOOL)elevatedPriority
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_elevatedPriority;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateInterestedBundleIDs:(id)a3
{
  id v4 = a3;
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:states:]( self,  "updateInterestedBundleIDs:states:",  v4,  -[BKSApplicationStateMonitor interestedStates](self, "interestedStates"));
}

- (void)updateInterestedStates:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[BKSApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:states:](self, "updateInterestedBundleIDs:states:", v5, v3);
}

- (void)updateInterestedBundleIDs:(id)a3 states:(unsigned int)a4
{
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 handleFailureInMethod:a2 object:self file:@"BKSApplicationStateMonitor.m" lineNumber:159 description:@"bundleIDs must be an array"];
    }
  }

  os_unfair_lock_lock(&self->_lock);
  v7 = (NSArray *)[v10 copy];
  interestedBundleIDs = self->_interestedBundleIDs;
  self->_interestedBundleIDs = v7;

  self->_interestedStates = a4;
  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateInterestedAssertionReasons:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSArray *)[v5 copy];

  interestedAssertionReasons = self->_interestedAssertionReasons;
  self->_interestedAssertionReasons = v6;

  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(p_lock);
}

- (void)applicationInfoForApplication:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"BKSApplicationStateMonitor.m", 179, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  v9 = (void *)MEMORY[0x1896123B0];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke;
  v13[3] = &unk_189E3B5F0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBackgroundWork:v13];
}

void __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)applicationInfoForPID:(int)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"BKSApplicationStateMonitor.m", 188, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  id v8 = (void *)MEMORY[0x1896123B0];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke;
  v11[3] = &unk_189E3B618;
  int v13 = a3;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  [v8 performBackgroundWork:v11];
}

void __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)applicationInfoForApplication:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1896122A8], "legacyPredicateMatchingBundleIdentifier:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896122D0] handleForPredicate:v4 error:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BKSApplicationStateMonitor _legacyInfoForProcess:](self, "_legacyInfoForProcess:", v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)applicationInfoForPID:(int)a3
{
  if (a3 < 1)
  {
    id v8 = 0LL;
  }

  else
  {
    id v4 = (void *)MEMORY[0x1896122A8];
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 legacyPredicateMatchingProcessIdentifier:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896122D0] handleForPredicate:v6 error:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSApplicationStateMonitor _legacyInfoForProcess:](self, "_legacyInfoForProcess:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (unsigned)applicationStateForApplication:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"SBApplicationStateKey"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

- (unsigned)mostElevatedApplicationStateForPID:(int)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"SBMostElevatedStateForProcessID"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

- (id)bundleInfoValueForKey:(id)a3 PID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = (void *)MEMORY[0x1896122D0];
  [MEMORY[0x189607968] numberWithInt:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 handleForIdentifier:v7 error:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = [v5 isEqualToString:*MEMORY[0x189604E00]];
  [v8 bundle];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if ((_DWORD)v7) {
    [v9 identifier];
  }
  else {
    [v9 bundleInfoValueForKey:v5];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id handler = self->_handler;
  self->_id handler = 0LL;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)_legacyStateForProcess:(id)a3 state:(id)a4
{
  id v4 = a4;
  switch([v4 taskState])
  {
    case 1u:
      unsigned int v7 = 1;
      break;
    case 2u:
    case 4u:
      [v4 endowmentNamespaces];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = [v5 containsObject:*MEMORY[0x189612510]];

      if (v6) {
        unsigned int v7 = 8;
      }
      else {
        unsigned int v7 = 4;
      }
      break;
    case 3u:
      unsigned int v7 = 2;
      break;
    default:
      unsigned int v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)_clientSubscribedToThisStateChange:(id)a3 state:(id)a4 prevState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v8, v9);
  unsigned int interestedStates = self->_interestedStates;
  if (v10)
  {
    unsigned int v13 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v8, v10);
    unsigned int v14 = self->_interestedStates & v13;
    if (v11 == v13)
    {
      [v9 process];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 pid];
      [v10 process];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v18 = v16 != [v17 pid];

      goto LABEL_6;
    }
  }

  else
  {
    unsigned int v14 = self->_interestedStates & 1;
  }

  BOOL v18 = 1;
LABEL_6:
  else {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_clientSubscribedToThisReasonChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_interestedAssertionReasons)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * i),  "objectForKey:",  @"SBApplicationStateRunningReasonAssertionReasonKey",  (void)v15);
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v12 = -[NSArray containsObject:](self->_interestedAssertionReasons, "containsObject:", v11);

          if (v12)
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 0;
LABEL_12:
  }

  else
  {
    BOOL v13 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)_legacyInfoForProcess:(id)a3
{
  id v4 = a3;
  RBSProcessLegacyStateDescriptor();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 currentStateMatchingDescriptor:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSApplicationStateMonitor _legacyInfoForProcess:state:](self, "_legacyInfoForProcess:state:", v4, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_legacyInfoForProcess:(id)a3 state:(id)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 identity];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 embeddedApplicationIdentifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    [v8 xpcServiceIdentifier];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12;
    if (v12)
    {
      id v11 = v12;
    }

    else
    {
      [v6 bundle];
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 identifier];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (v6 && v11)
  {
    [MEMORY[0x189603FC8] dictionary];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v46 = [v8 isXPCService];
    if (v46)
    {
      [v8 hostIdentifier];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = objc_msgSend(v16, "rbs_pid");
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    uint64_t v19 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v6, v7);
    [v7 assertions];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v18 count])
    {
      unsigned int v40 = v19;
      unsigned int v41 = v17;
      v42 = v15;
      v43 = v8;
      id v44 = v7;
      id v45 = v6;
      [MEMORY[0x189603FA8] array];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v21 = v18;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v48;
        do
        {
          for (uint64_t i = 0LL; i != v23; ++i)
          {
            if (*(void *)v48 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v26, "reason"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v28 = [v26 explanation];
            v29 = (void *)v28;
            if (v27) {
              BOOL v30 = v28 == 0;
            }
            else {
              BOOL v30 = 1;
            }
            if (!v30)
            {
              v52[0] = @"SBApplicationStateRunningReasonAssertionReasonKey";
              v52[1] = @"SBApplicationStateRunningReasonAssertionIdentifierKey";
              v53[0] = v27;
              v53[1] = v28;
              [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v20 addObject:v31];
            }
          }

          uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v54 count:16];
        }

        while (v23);
      }

      __int128 v15 = v42;
      if ([v20 count]) {
        [v42 setObject:v20 forKey:@"SBApplicationStateRunningReasonsKey"];
      }

      id v7 = v44;
      id v6 = v45;
      uint64_t v8 = v43;
      uint64_t v19 = v40;
      uint64_t v17 = v41;
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:v19];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v32 forKey:@"SBApplicationStateKey"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v19];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v33 forKey:@"SBMostElevatedStateForProcessID"];

    [MEMORY[0x189607968] numberWithBool:(_DWORD)v19 == 8];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v34 forKey:@"BKSApplicationStateAppIsFrontmost"];

    [v15 setObject:v11 forKey:@"SBApplicationStateDisplayIDKey"];
    int v35 = [v6 pid];
    [MEMORY[0x189607968] numberWithInt:v35 & ~(v35 >> 31)];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v36 forKey:@"SBApplicationStateProcessIDKey"];

    [MEMORY[0x189607968] numberWithBool:v46];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v37 forKey:@"BKSApplicationStateExtensionKey"];

    if ((int)v17 >= 1)
    {
      [MEMORY[0x189607968] numberWithInt:v17];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v38 forKey:@"BKSApplicationStateHostPIDKey"];
    }
  }

  else
  {
    rbs_shim_log();
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1862D9000,  (os_log_t)v18,  OS_LOG_TYPE_INFO,  "BKSApplicationStateMonitor resolved state as not running with no bundleID",  buf,  2u);
    }

    __int128 v15 = 0LL;
  }

  return v15;
}

- (void)lock_updateConfiguration
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  [MEMORY[0x189603FA8] array];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  interestedBundleIDs = self->_interestedBundleIDs;
  if (interestedBundleIDs)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v5 = interestedBundleIDs;
    uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          [MEMORY[0x1896122A8] legacyPredicateMatchingBundleIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 addObject:v10];
        }

        uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    [MEMORY[0x1896122A8] legacyPredicate];
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v5];
  }

  if (self->_elevatedPriority) {
    int v11 = 25;
  }
  else {
    int v11 = 17;
  }
  BOOL v12 = (void *)MEMORY[0x186E36CA4](self->_handler);
  monitor = self->_monitor;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke;
  v16[3] = &unk_189E3B668;
  int v20 = v11;
  __int128 v18 = self;
  id v19 = v12;
  id v17 = v3;
  id v14 = v12;
  id v15 = v3;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v16);
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPredicates:*(void *)(a1 + 32)];
  RBSProcessLegacyStateDescriptor();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setStateDescriptor:v4];

  [v3 setServiceClass:*(unsigned int *)(a1 + 56)];
  if (*(void *)(a1 + 48))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2;
    v5[3] = &unk_189E3B640;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 48);
    [v3 setUpdateHandler:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  else
  {
    [v3 setUpdateHandler:0];
  }
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 state];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 previousState];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [WeakRetained _legacyInfoForProcess:v6 state:v9];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v6 lastExitContext];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 status];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 code];

    if (v14 > 3221229822LL)
    {
      if (v14 != 4227595259LL)
      {
        if (v14 == 3735943697LL)
        {
          uint64_t v17 = 1LL;
          goto LABEL_16;
        }

        uint64_t v15 = 3221229823LL;
        goto LABEL_14;
      }
    }

    else if (v14 != 732775916 && v14 != 1307235759)
    {
      uint64_t v15 = 2343432205LL;
LABEL_14:
      if (v14 != v15)
      {
LABEL_17:

LABEL_18:
        [v11 objectForKey:@"SBApplicationStateRunningReasonsKey"];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (([WeakRetained _clientSubscribedToThisStateChange:v6 state:v9 prevState:v10] & 1) != 0
          || [WeakRetained _clientSubscribedToThisReasonChange:v19])
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        }

        goto LABEL_22;
      }
    }

    uint64_t v17 = 5LL;
LABEL_16:
    [MEMORY[0x189607968] numberWithInteger:v17];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v18 forKey:@"BKSApplicationStateExitReasonKey"];

    goto LABEL_17;
  }

  rbs_shim_log();
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v20 = 138543362;
    id v21 = v6;
    _os_log_impl( &dword_1862D9000,  v16,  OS_LOG_TYPE_INFO,  "Ignoring update for process: %{public}@",  (uint8_t *)&v20,  0xCu);
  }

LABEL_22:
}

- (void).cxx_destruct
{
}

@end