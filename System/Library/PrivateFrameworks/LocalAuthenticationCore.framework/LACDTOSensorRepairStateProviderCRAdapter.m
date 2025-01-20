@interface LACDTOSensorRepairStateProviderCRAdapter
- (LACDTOSensorRepairStateProviderCRAdapter)initWithReplyQueue:(id)a3;
- (void)dealloc;
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderCRAdapter

- (LACDTOSensorRepairStateProviderCRAdapter)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LACDTOSensorRepairStateProviderCRAdapter;
  v6 = -[LACDTOSensorRepairStateProviderCRAdapter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createUserInitiatedSerialQueueWithIdentifier:",  v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_189219000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ will dealloc", (uint8_t *)&v2, 0xCu);
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1020LL,  @"Core Repair not supported on this platform");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTOMutableSensorRepairState initWithFlag:]( objc_alloc(&OBJC_CLASS___LACDTOMutableSensorRepairState),  "initWithFlag:",  0LL);
  LACLogDTOSensor();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543874;
    v9 = self;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2114;
    objc_super v13 = v5;
    _os_log_error_impl( &dword_189219000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@ falling back to: %{public}@ due to %{public}@",  (uint8_t *)&v8,  0x20u);
  }

  v4[2](v4, 0LL, v5);
}

- (void).cxx_destruct
{
}

@end