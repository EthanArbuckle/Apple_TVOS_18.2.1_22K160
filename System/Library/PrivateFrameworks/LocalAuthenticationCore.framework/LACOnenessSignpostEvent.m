@interface LACOnenessSignpostEvent
+ (LACSignpostEvent)authenticationRequestDidFinish;
+ (LACSignpostEvent)authenticationRequestWillStart;
+ (LACSignpostEvent)eligibleDevicesRequestDidFinish;
+ (LACSignpostEvent)eligibleDevicesRequestWillStart;
@end

@implementation LACOnenessSignpostEvent

+ (LACSignpostEvent)authenticationRequestWillStart
{
  return  -[LACSignpostEvent initWithSendBlock:]( objc_alloc(&OBJC_CLASS___LACSignpostEvent),  "initWithSendBlock:",  &__block_literal_global_2);
}

void __57__LACOnenessSignpostEvent_authenticationRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  LACLogABM();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl( &dword_189219000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "MacAuthenticationRequest",  "%{public}@",  (uint8_t *)&v4,  0xCu);
  }
}

+ (LACSignpostEvent)authenticationRequestDidFinish
{
  return  -[LACSignpostEvent initWithSendBlock:]( objc_alloc(&OBJC_CLASS___LACSignpostEvent),  "initWithSendBlock:",  &__block_literal_global_4_2);
}

void __57__LACOnenessSignpostEvent_authenticationRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  LACLogABM();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl( &dword_189219000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "MacAuthenticationRequest",  "%{public}@",  (uint8_t *)&v4,  0xCu);
  }
}

+ (LACSignpostEvent)eligibleDevicesRequestWillStart
{
  return  -[LACSignpostEvent initWithSendBlock:]( objc_alloc(&OBJC_CLASS___LACSignpostEvent),  "initWithSendBlock:",  &__block_literal_global_6_1);
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  LACLogABM();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl( &dword_189219000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "MacEligibleDevicesRequest",  "%{public}@",  (uint8_t *)&v4,  0xCu);
  }
}

+ (LACSignpostEvent)eligibleDevicesRequestDidFinish
{
  return  -[LACSignpostEvent initWithSendBlock:]( objc_alloc(&OBJC_CLASS___LACSignpostEvent),  "initWithSendBlock:",  &__block_literal_global_8_0);
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  LACLogABM();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_signpost_emit_with_name_impl( &dword_189219000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "MacEligibleDevicesRequest",  "%{public}@",  (uint8_t *)&v4,  0xCu);
  }
}

@end