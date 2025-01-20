@interface LACDTOSensorRepairStateProviderFactory
+ (id)repairStateProviderWithReplyQueue:(id)a3 flags:(id)a4;
@end

@implementation LACDTOSensorRepairStateProviderFactory

+ (id)repairStateProviderWithReplyQueue:(id)a3 flags:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc(&OBJC_CLASS___LACDTOSensorRepairStateProviderTaskDecorator);
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  v15 = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke;
  v16 = &unk_18A3695C0;
  id v17 = v6;
  id v18 = v5;
  id v8 = v5;
  id v9 = v6;
  __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke((uint64_t)&v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LACDTOSensorRepairStateProviderTaskDecorator initWithProvider:replyQueue:]( v7,  "initWithProvider:replyQueue:",  v10,  v8,  v13,  v14,  v15,  v16);

  return v11;
}

LACDTOSensorRepairStateProviderDefaultsDecorator *__82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke( uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___LACDTOSensorRepairStateProviderDefaultsDecorator);
  v3 = objc_alloc_init(&OBJC_CLASS___LACDTOSensorRepairStateProviderNullAdapter);
  v4 = -[LACDTOSensorRepairStateProviderDefaultsDecorator initWithStateProvider:flags:replyQueue:]( v2,  "initWithStateProvider:flags:replyQueue:",  v3,  *(void *)(a1 + 32),  *(void *)(a1 + 40));

  return v4;
}

@end