@interface RBCoalitionManager
- (NSString)stateCaptureTitle;
- (RBCoalitionManager)initWithAdapter:(id)a3;
- (id)captureState;
- (void)addProcess:(id)a3 withState:(id)a4;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeProcess:(id)a3;
@end

@implementation RBCoalitionManager

- (RBCoalitionManager)initWithAdapter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBCoalitionManager;
  v6 = -[RBCoalitionManager init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    lock_coalitions = v6->_lock_coalitions;
    v6->_lock_coalitions = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    lock_processes = v6->_lock_processes;
    v6->_lock_processes = v9;

    objc_storeStrong((id *)&v6->_adapter, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)didUpdateProcessStates:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 hasChanges])
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v24 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v43;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v43 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_msgSend(v9, "identity", lock);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[RBProcessMap valueForIdentity:](self->_lock_processes, "valueForIdentity:", v10);
          if (v11)
          {
            [v9 updatedState];
            objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v11, "jetsamCoalitionID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v13);
            [v14 setProcess:v11 withState:v12];
          }
        }

        uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }

      while (v6);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    __int128 v38 = 0u;
    obuint64_t j = self->_lock_coalitions;
    uint64_t v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = -[NSMutableDictionary objectForKey:]( self->_lock_coalitions,  "objectForKey:",  *(void *)(*((void *)&v38 + 1) + 8 * j),  lock);
          uint64_t v34 = 0LL;
          v35 = &v34;
          uint64_t v36 = 0x2020000000LL;
          char v37 = 0;
          uint64_t v30 = 0LL;
          v31 = &v30;
          uint64_t v32 = 0x2020000000LL;
          uint64_t v33 = 0LL;
          v26[0] = MEMORY[0x1895F87A8];
          v26[1] = 3221225472LL;
          v26[2] = __45__RBCoalitionManager_didUpdateProcessStates___block_invoke;
          v26[3] = &unk_18A256B18;
          id v19 = v18;
          id v27 = v19;
          v28 = &v30;
          v29 = &v34;
          [v19 enumerateProcessesUsingBlock:v26];
          if (*((_BYTE *)v35 + 24))
          {
            uint64_t v20 = v31[3];
            if (v20 != [v19 coalitionLevel])
            {
              adapter = self->_adapter;
              uint64_t v22 = [v19 coalitionID];
              if (!-[RBCoalitionKernelAdapting applyCoalitionWithID:coalitionLevel:]( adapter,  "applyCoalitionWithID:coalitionLevel:",  v22,  v31[3])) {
                [v19 setCoalitionLevel:v31[3]];
              }
            }
          }

          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v34, 8);
        }

        uint64_t v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
      }

      while (v15);
    }

    os_unfair_lock_unlock(lock);
    id v4 = v24;
  }
}

void __45__RBCoalitionManager_didUpdateProcessStates___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v6 coalitionLevel];
  rbs_process_log();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)a1[4];
    int v12 = 138413058;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = [v11 coalitionID];
    _os_log_debug_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEBUG,  "Process: %@ with state: %@ for coalition: %@ with coalitionID: %llu",  (uint8_t *)&v12,  0x2Au);
  }

  if (v7)
  {
    uint64_t v9 = *(void *)(a1[5] + 8LL);
    unint64_t v10 = *(void *)(v9 + 24);
    if (v7 > v10) {
      unint64_t v10 = v7;
    }
    *(void *)(v9 + 24) = v10;
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
}

- (void)addProcess:(id)a3 withState:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 identity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  BOOL v9 = -[RBProcessMap containsIdentity:](self->_lock_processes, "containsIdentity:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    [v6 identifier];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 pid];

    if (-[RBCoalitionKernelAdapting coalitionInfoForPID:outCoalitionInfo:]( self->_adapter,  "coalitionInfoForPID:outCoalitionInfo:",  v11,  &v19) < 0)
    {
      rbs_process_log();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[RBCoalitionManager addProcess:withState:].cold.1(v11, v13);
      }
    }

    else
    {
      [v6 setResourceCoalitionID:v19];
      [v6 setJetsamCoalitionID:v20];
      [v6 setJetsamCoalitionLeader:v21];
      int v12 = v20;
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v20];
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v13);
      __int16 v14 = (RBCoalition *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        rbs_process_log();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          id v23 = v12;
          __int16 v24 = 1024;
          LODWORD(v25) = v11;
          _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating new RBCoalition with coalition ID: %llu for PID %d",  buf,  0x12u);
        }

        __int16 v14 = -[RBCoalition initWithCoalitionID:](objc_alloc(&OBJC_CLASS___RBCoalition), "initWithCoalitionID:", v12);
        -[NSMutableDictionary setObject:forKey:](self->_lock_coalitions, "setObject:forKey:", v14, v13);
      }

      rbs_process_log();
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = -[RBCoalition coalitionID](v14, "coalitionID");
        *(_DWORD *)buf = 138413058;
        id v23 = v6;
        __int16 v24 = 2112;
        v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = v17;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_DEFAULT,  "Adding process: %@ to coalition: %@ with coalitionID: %llu with state: %@",  buf,  0x2Au);
      }

      -[RBCoalition setProcess:withState:](v14, "setProcess:withState:", v6, v7);
      id v18 = -[RBProcessMap setValue:forIdentity:](self->_lock_processes, "setValue:forIdentity:", v6, v8);
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)removeProcess:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 identity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "jetsamCoalitionID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    rbs_process_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v7;
      __int16 v16 = 2048;
      uint64_t v17 = [v7 coalitionID];
      _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing process: %@ from coalition: %@ with coalitionID: %llu",  (uint8_t *)&v12,  0x20u);
    }

    [v7 removeProcess:v4];
    if ([v7 isEmpty])
    {
      rbs_process_log();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v7 coalitionID];
        int v12 = 138412546;
        id v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = v10;
        _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_DEFAULT,  "Removing the coalition: %@ with coalitionID: %llu as all the processes in this coalition have been removed",  (uint8_t *)&v12,  0x16u);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_lock_coalitions, "removeObjectForKey:", v6);
    }
  }

  id v11 = -[RBProcessMap removeValueForIdentity:](self->_lock_processes, "removeValueForIdentity:", v5);
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  v3 = (void *)objc_opt_new();
  -[RBCoalitionManager stateCaptureTitle](self, "stateCaptureTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"<%@:\n", v4];

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_opt_new();
  lock_processes = self->_lock_processes;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __34__RBCoalitionManager_captureState__block_invoke;
  v11[3] = &unk_18A256B40;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  -[RBProcessMap enumerateWithBlock:](lock_processes, "enumerateWithBlock:", v11);
  [v8 sortUsingComparator:&__block_literal_global_14];
  [v8 componentsJoinedByString:@"\n"];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"%@\n>\n", v9];

  os_unfair_lock_unlock(p_lock);
  return v3;
}

void __34__RBCoalitionManager_captureState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x189607968];
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v6, "jetsamCoalitionID"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v22];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = (void *)NSString;
  [v6 identifier];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [v10 pid];
  [v7 shortDescription];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [v8 coalitionID];
  __int16 v14 = (void *)MEMORY[0x189603F50];
  [v8 creationTime];
  objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v8 coalitionLevel];
  uint64_t v17 = [v8 previousCoalitionLevel];
  uint64_t v18 = (void *)MEMORY[0x189603F50];
  [v8 lastModificationTime];
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringWithFormat:@"\t%d : %@ : coalitionID:%llu, creationTime: %@, coalitionLevel:%llu, previous:%llu, lastModTime: %@", v11, v12, v13, v15, v16, v17, v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v20];
}

uint64_t __34__RBCoalitionManager_captureState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (void).cxx_destruct
{
}

- (void)addProcess:(int)a1 withState:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Kernel failed to return coalition info for PID %d",  (uint8_t *)v2,  8u);
}

@end