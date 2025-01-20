@interface RBThermalResponseManager
+ (id)managerWithDaemonContext:(id)a3 notificationName:(id)a4;
+ (int64_t)_thermalConditionLevelForThermalLevel:(unint64_t)a3;
- (id)_initWithDaemonContext:(id)a3 notificationName:(id)a4;
- (void)_queue_updateAssertion;
- (void)_takeAssertionForConditionLevel:(int64_t)a3 completion:(id)a4;
@end

@implementation RBThermalResponseManager

+ (int64_t)_thermalConditionLevelForThermalLevel:(unint64_t)a3
{
  int64_t v3 = 830LL;
  uint64_t v4 = 840LL;
  uint64_t v5 = 860LL;
  if (a3 == 14) {
    uint64_t v5 = 850LL;
  }
  if (a3 >= 0xE) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0xB) {
    int64_t v3 = v4;
  }
  if (a3 >= 7) {
    return v3;
  }
  else {
    return 0LL;
  }
}

- (void)_takeAssertionForConditionLevel:(int64_t)a3 completion:(id)a4
{
  v27[2] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v7 = (void *)MEMORY[0x189612170];
  v8 = -[RBDaemonContextProviding process](self->_daemonContext, "process");
  objc_msgSend(v7, "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
  v9 = (RBSAssertionIdentifier *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896121B8] attributeWithCondition:@"therm" value:a3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  [MEMORY[0x189612118] attributeWithCompletionPolicy:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v27 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x189612168];
  [MEMORY[0x189612388] systemTarget];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 descriptorWithIdentifier:v9 target:v14 explanation:@"Thermal Condition" attributes:v12];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[RBDaemonContextProviding process](self->_daemonContext, "process");
  v17 = +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  v16,  v15,  self->_daemonContext);
  v18 = self->_currentAssertion;
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = v9;
  v20 = v9;
  v21 = -[RBDaemonContextProviding assertionManager](self->_daemonContext, "assertionManager");
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke;
  v24[3] = &unk_18A256110;
  v25 = v18;
  id v26 = v6;
  v22 = v18;
  id v23 = v6;
  [v21 acquireAssertionWithContext:v17 completion:v24];
}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    rbs_general_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_queue_updateAssertion
{
}

void __50__RBThermalResponseManager__queue_updateAssertion__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
    id v3 = a2;
    [v2 assertionManager];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 invalidateAssertionWithIdentifier:v3];
  }

- (id)_initWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___RBThermalResponseManager;
  v9 = -[RBThermalResponseManager init](&v26, sel_init);
  v10 = (int *)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonContext, a3);
    v11 = (const char *)[v8 UTF8String];
    v12 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke;
    handler[3] = &unk_18A256160;
    v13 = v10;
    v25 = v13;
    uint64_t v14 = notify_register_dispatch(v11, v10 + 4, v12, handler);

    if ((_DWORD)v14)
    {
      rbs_general_log();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[RBThermalResponseManager _initWithDaemonContext:notificationName:].cold.1( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
      }
    }

    v22 = v13;
  }

  return v10;
}

uint64_t __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAssertion");
}

+ (id)managerWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBThermalResponseManager _initWithDaemonContext:notificationName:]( objc_alloc(&OBJC_CLASS___RBThermalResponseManager),  "_initWithDaemonContext:notificationName:",  v6,  v5);

  return v7;
}

- (void).cxx_destruct
{
}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_188634000,  a2,  OS_LOG_TYPE_FAULT,  "In RBThermalResponseManager, acqusition failed with %{public}@",  (uint8_t *)&v2,  0xCu);
}

- (void)_initWithDaemonContext:(uint64_t)a3 notificationName:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end