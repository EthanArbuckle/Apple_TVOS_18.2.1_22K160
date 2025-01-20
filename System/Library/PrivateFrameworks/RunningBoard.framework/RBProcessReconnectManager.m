@interface RBProcessReconnectManager
- (RBProcessReconnectManager)init;
- (RBProcessReconnectManager)initWithDaemonContext:(id)a3 originatorProcess:(id)a4;
- (id)_assertionAttributes;
- (id)_assertionDescriptorForProcess:(id)a1;
- (id)debugDescription;
- (void)_assertionAttributes;
- (void)_lockQueue_resumeNextProcess;
- (void)_reconnectProcess:(uint64_t)a1;
- (void)didInvalidateAssertion:(id)a3;
- (void)reconnectProcesses:(id)a3;
@end

@implementation RBProcessReconnectManager

- (RBProcessReconnectManager)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcessReconnectManager.m" lineNumber:63 description:@"-init is not allowed on RBProcessReconnectManager"];

  return 0LL;
}

- (RBProcessReconnectManager)initWithDaemonContext:(id)a3 originatorProcess:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RBProcessReconnectManager;
  v9 = -[RBProcessReconnectManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x1896123B0] createBackgroundQueue:@"RBProcessReconnectManager"];
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x189603FE0] set];
    currentAssertionIdentifiers = v10->_currentAssertionIdentifiers;
    v10->_currentAssertionIdentifiers = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x189603FE0] set];
    pendingProcesses = v10->_pendingProcesses;
    v10->_pendingProcesses = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v10->_daemonContext, a3);
    objc_storeStrong((id *)&v10->_originatorProcess, a4);
  }

  return v10;
}

- (void)reconnectProcesses:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  rbs_process_log();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v9 = [v4 count];
    _os_log_impl(&dword_188634000, v5, OS_LOG_TYPE_DEFAULT, "Reconnecting to %{public}lu processes", buf, 0xCu);
  }
  v6 = -[RBDaemonContextProviding assertionOriginatorPidStore](self->_daemonContext, "assertionOriginatorPidStore");
  [v6 setValidProcesses:v4];

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__RBProcessReconnectManager_reconnectProcesses___block_invoke;
  v7[3] = &unk_18A256BD0;
  v7[4] = self;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __48__RBProcessReconnectManager_reconnectProcesses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) assertionOriginatorPidStore];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isValid];

  uint64_t v6 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_4;
  }
  [*(id *)(v6 + 8) assertionOriginatorPidStore];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 handle];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend(v7, "containsPid:", objc_msgSend(v8, "pid"));

  if (v9)
  {
    uint64_t v6 = *(void *)(a1 + 32);
LABEL_4:
    -[RBProcessReconnectManager _reconnectProcess:](v6, v3);
    goto LABEL_8;
  }

  rbs_process_log();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v3;
    _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Pid store does not include process: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

LABEL_8:
}

- (void)_reconnectProcess:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 48);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 32) addObject:v4];

    os_unfair_lock_unlock(v3);
    int v5 = *(dispatch_queue_s **)(a1 + 40);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__RBProcessReconnectManager__reconnectProcess___block_invoke;
    block[3] = &unk_18A255C70;
    block[4] = a1;
    dispatch_async(v5, block);
  }

- (void)didInvalidateAssertion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __52__RBProcessReconnectManager_didInvalidateAssertion___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __52__RBProcessReconnectManager_didInvalidateAssertion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  [*(id *)(a1 + 40) identifier];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v2])
  {
    rbs_assertion_log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl( &dword_188634000,  v3,  OS_LOG_TYPE_DEFAULT,  "Invalidated assertion %{public}@ for reconnected process",  (uint8_t *)&v5,  0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v2];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
    -[RBProcessReconnectManager _lockQueue_resumeNextProcess](*(void *)(a1 + 32));
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  }
}

- (void)_lockQueue_resumeNextProcess
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ([*(id *)(a1 + 24) count] == 4)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    }

    else
    {
      [*(id *)(a1 + 32) anyObject];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = v3;
      if (v3)
      {
        [v3 handle];
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        int v6 = [v5 pid];

        rbs_process_log();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [*(id *)(a1 + 32) count];
          uint64_t v9 = [*(id *)(a1 + 24) count];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v20 = v6;
          *(_WORD *)&v20[4] = 2048;
          *(void *)&v20[6] = v8;
          __int16 v21 = 2048;
          uint64_t v22 = v9;
          __int16 v23 = 2048;
          uint64_t v24 = 4LL;
          _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_DEFAULT,  "Preparing to reconnect to process %d; %lu left in the queue; %lu of %lu in flight",
            buf,
            0x26u);
        }

        [*(id *)(a1 + 32) removeObject:v4];
        -[RBProcessReconnectManager _assertionDescriptorForProcess:]((id)a1, v4);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 24) addObject:v11];
        rbs_assertion_log();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)v20 = v11;
          *(_WORD *)&v20[8] = 1024;
          *(_DWORD *)&v20[10] = v6;
          __int16 v21 = 2048;
          uint64_t v22 = 0x4000000000000000LL;
          _os_log_impl( &dword_188634000,  v12,  OS_LOG_TYPE_INFO,  "Acquiring assertion with temporary identifier %{public}@ for reconnected process %d for %fs",  buf,  0x1Cu);
        }

        +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  *(void *)(a1 + 16),  v10,  *(void *)(a1 + 8));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 setAcquisitionPolicy:0];
        [*(id *)(a1 + 8) assertionManager];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 3221225472LL;
        v16[2] = __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke;
        v16[3] = &unk_18A256BF8;
        int v18 = v6;
        v16[4] = a1;
        id v17 = v11;
        id v15 = v11;
        [v14 acquireAssertionWithContext:v13 completion:v16];
      }

      else
      {
        rbs_process_log();
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_188634000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Reconnect queue is empty; reconnect done",
            buf,
            2u);
        }
      }

      os_unfair_lock_unlock(v2);
    }
  }

void __47__RBProcessReconnectManager__reconnectProcess___block_invoke(uint64_t a1)
{
}

- (id)_assertionDescriptorForProcess:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = (void *)MEMORY[0x189612170];
    id v4 = a2;
    [v3 identifierWithClientPid:getpid()];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = (void *)MEMORY[0x189612388];
    [v4 handle];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "targetWithPid:", objc_msgSend(v7, "pid"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RBProcessReconnectManager _assertionAttributes]((uint64_t)v2);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612168] descriptorWithIdentifier:v5 target:v8 explanation:@"Resuming process for assertion reconnection" attributes:v9];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

void __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40LL));
  rbs_assertion_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 40);
      v8[0] = 67109634;
      v8[1] = v6;
      __int16 v9 = 2114;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl( &dword_188634000,  v5,  OS_LOG_TYPE_INFO,  "Acquired assertion for reconnected process %d with identifier %{public}@ replacing temporary identifier %{public}@",  (uint8_t *)v8,  0x1Cu);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  }
}

- (id)_assertionAttributes
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  [*(id *)(a1 + 8) domainAttributeManager];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v2 = [v1 containsAttributeWithDomain:@"com.apple.coreos" andName:@"reconnect"];

  rbs_assertion_log();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_188634000, v4, OS_LOG_TYPE_DEFAULT, "Using domain attribute for reconnect", v10, 2u);
    }

    [MEMORY[0x1896121D8] attributeWithDomain:@"com.apple.coreos" name:@"reconnect"];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[RBProcessReconnectManager _assertionAttributes].cold.1(v4);
    }

    [MEMORY[0x189612190] grantWithUserInteractivity];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    [MEMORY[0x189612238] grantWithBackgroundPriority];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    [MEMORY[0x1896121E8] attributeWithDuration:1 warningDuration:1 startPolicy:2.0 endPolicy:0.0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    [MEMORY[0x189603F18] arrayWithObjects:v11 count:3];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)debugDescription
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  __int16 v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __45__RBProcessReconnectManager_debugDescription__block_invoke;
  v5[3] = &unk_18A255CC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__RBProcessReconnectManager_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend( NSString,  "stringWithFormat:",  @"<ReconnectManager:%d pending>",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void).cxx_destruct
{
}

void __57__RBProcessReconnectManager__lockQueue_resumeNextProcess__block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Error acquiring reconnection assertion with temporary identifier %{public}@ for process %d: <%{public}@>",  (uint8_t *)&v5,  0x1Cu);
}

- (void)_assertionAttributes
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_188634000, log, OS_LOG_TYPE_ERROR, "Missing domain attribute for reconnect", v1, 2u);
}

@end