@interface LACDTOSensorRepairStateProviderDefaultsDecorator
- (LACDTOSensorRepairStateProviderDefaultsDecorator)initWithStateProvider:(id)a3 flags:(id)a4 replyQueue:(id)a5;
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderDefaultsDecorator

- (LACDTOSensorRepairStateProviderDefaultsDecorator)initWithStateProvider:(id)a3 flags:(id)a4 replyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACDTOSensorRepairStateProviderDefaultsDecorator;
  v12 = -[LACDTOSensorRepairStateProviderDefaultsDecorator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stateProvider, a3);
    objc_storeStrong((id *)&v13->_flags, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_variant_allows_internal_security_policies()
    && (-[LACFlagsProvider valueForFlagDTOSecureRepairMockRepairType]( self->_flags,  "valueForFlagDTOSecureRepairMockRepairType"),  v5 = (void *)objc_claimAutoreleasedReturnValue(),  v5,  v5))
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke;
    v20[3] = &unk_18A369600;
    v20[4] = self;
    __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke((uint64_t)v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[LACFlagsProvider valueForFlagDTOSecureRepairMockRepairTypeQueryLatency]( self->_flags,  "valueForFlagDTOSecureRepairMockRepairTypeQueryLatency");
    id v9 = (void *)v8;
    id v10 = &unk_18A39F2E8;
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    [v11 doubleValue];
    double v13 = v12;

    dispatch_time_t v14 = dispatch_time(0LL, (uint64_t)(v13 * 1000000000.0));
    replyQueue = (dispatch_queue_s *)self->_replyQueue;
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2;
    block[3] = &unk_18A368E98;
    id v18 = v7;
    id v19 = v4;
    id v16 = v7;
    dispatch_after(v14, replyQueue, block);
  }

  else
  {
    -[LACDTOSensorRepairStateProvider fetchRepairStateWithCompletion:]( self->_stateProvider,  "fetchRepairStateWithCompletion:",  v4);
  }
}

LACDTOMutableSensorRepairState *__83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke( uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 integerValue];

  v3 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v3, "setRepairFlag:", v2);
  return v3;
}

uint64_t __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

- (void).cxx_destruct
{
}

@end