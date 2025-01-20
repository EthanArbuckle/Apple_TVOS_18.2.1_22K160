@interface LACDTOLocationProviderCRAdapter
- (LACDTOLocationProviderCRAdapter)initWithWorkQueue:(id)a3;
- (NSString)description;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderCRAdapter

- (LACDTOLocationProviderCRAdapter)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LACDTOLocationProviderCRAdapter;
  v6 = -[LACDTOLocationProviderCRAdapter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createUserInitiatedSerialQueueWithIdentifier:",  v9);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v10;
  }

  return v7;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, LACDTOLocationState *))a3;
  if (self->_manager)
  {
    locationState = self->_locationState;
    if (locationState)
    {
      [MEMORY[0x189603F50] now];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = -[LACDTOLocationState isValid:](locationState, "isValid:", v6);

      if (v7)
      {
        LACLogDTOLocation();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_locationState;
          int v13 = 138543618;
          v14 = self;
          __int16 v15 = 2112;
          v16 = v9;
          _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will use cached value %@",  (uint8_t *)&v13,  0x16u);
        }

        v4[2](v4, self->_locationState);
        goto LABEL_13;
      }

      v12 = self->_locationState;
    }

    else
    {
      v12 = 0LL;
    }

    self->_locationState = 0LL;

    goto LABEL_13;
  }

  LACLogDTOLocation();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[LACDTOLocationProviderCRAdapter checkIsInFamiliarLocationWithCompletion:].cold.1((uint64_t)self, v10);
  }

  +[LACDTOLocationState nullInstance](&OBJC_CLASS___LACDTOLocationState, "nullInstance");
  v11 = (LACDTOLocationState *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11);

LABEL_13:
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

- (void)checkIsInFamiliarLocationWithCompletion:(uint64_t)a1 .cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ Missing required RTRoutineManager dependency",  (uint8_t *)&v2,  0xCu);
}

@end