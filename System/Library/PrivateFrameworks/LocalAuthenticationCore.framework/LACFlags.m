@interface LACFlags
+ (LACFlags)sharedInstance;
- (BOOL)featureFlagApproveByMacEnabled;
- (BOOL)featureFlagApproveByMacFailureUIEnabled;
- (BOOL)featureFlagDimpleKeyGracePeriodEnabled;
- (BOOL)featureFlagDimpleKeySecureRepairEnabled;
- (BOOL)featureFlagEssoniteClickEnabled;
- (BOOL)featureFlagPreboardDeveloperModeEnabled;
- (BOOL)featureFlagPreboardEnabled;
- (BOOL)featureFlagPreboardProtectedVariablesEnabled;
- (BOOL)featureFlagPreboardUPPEnabled;
- (NSData)valueForFlagOnenessSessionAuthentication;
- (NSNumber)valueForFlagCompanionMockDevices;
- (NSNumber)valueForFlagDTOSecureRepairMockRepairType;
- (NSNumber)valueForFlagDTOSecureRepairMockRepairTypeQueryLatency;
- (NSNumber)valueForFlagDTOStrictModeEnabled;
- (NSNumber)valueForFlagOnenessSessionActive;
- (NSNumber)valueForFlagPreboardMode;
- (NSNumber)valueForFlagRunningInBATS;
- (NSNumber)valueForFlagSharedModeActive;
- (NSNumber)valueForFlagSharedModeLatency;
- (NSString)flagCompanionMockDevicesKey;
- (NSString)flagDTOSecureRepairMockRepairTypeKey;
- (NSString)flagDTOSecureRepairMockRepairTypeQueryLatencyKey;
- (NSString)flagDTOStrictModeEnabledKey;
- (NSString)flagOnenessSessionActiveKey;
- (NSString)flagOnenessSessionAuthenticationKey;
- (NSString)flagPreboardModeKey;
- (NSString)flagRunningInBATSKey;
- (NSString)flagSharedModeActiveKey;
- (NSString)flagSharedModeLatencyKey;
@end

@implementation LACFlags

+ (LACFlags)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  return (LACFlags *)(id)sharedInstance_sharedInstance;
}

void __26__LACFlags_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LACFlags);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (NSString)flagCompanionMockDevicesKey
{
  return (NSString *)@"LA.companion.device-mock";
}

- (NSNumber)valueForFlagCompanionMockDevices
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.companion.device-mock",  0LL);
}

id __44__LACFlags_valueForFlagCompanionMockDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    [MEMORY[0x1896079D8] processInfo];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 environment];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      goto LABEL_4;
    }
    id v9 = objc_alloc_init(MEMORY[0x189607978]);
    [MEMORY[0x1896079D8] processInfo];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 environment];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:v4];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 numberFromString:v12];
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_4:
      [MEMORY[0x189604038] standardUserDefaults];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 persistentDomainForName:*MEMORY[0x189607560]];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v16 = [v15 objectForKeyedSubscript:v4];
      if (v16
        && (v17 = (void *)v16,
            [v15 objectForKeyedSubscript:v4],
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            v17,
            (isKindOfClass & 1) != 0))
      {
        [v15 objectForKeyedSubscript:v4];
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v20 = v5;
      }

      id v13 = v20;
    }
  }

  else
  {
    id v13 = v5;
  }

  return v13;
}

- (NSString)flagDTOStrictModeEnabledKey
{
  return (NSString *)@"LA.dto.strictModeEnabled";
}

- (NSNumber)valueForFlagDTOStrictModeEnabled
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.dto.strictModeEnabled",  0LL);
}

- (NSString)flagDTOSecureRepairMockRepairTypeKey
{
  return (NSString *)@"LA.dto.sr.mock.repairType";
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairType
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.dto.sr.mock.repairType",  0LL);
}

- (NSString)flagDTOSecureRepairMockRepairTypeQueryLatencyKey
{
  return (NSString *)@"LA.dto.sr.mock.repairTypeQueryLatency";
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairTypeQueryLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.dto.sr.mock.repairTypeQueryLatency",  0LL);
}

- (NSString)flagOnenessSessionActiveKey
{
  return (NSString *)@"LA.companion.sessionActive";
}

- (NSNumber)valueForFlagOnenessSessionActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.companion.sessionActive",  0LL);
}

- (NSString)flagOnenessSessionAuthenticationKey
{
  return (NSString *)@"LA.companion.sessionAuthentication";
}

- (NSData)valueForFlagOnenessSessionAuthentication
{
  return (NSData *)__52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke( (uint64_t)self,  @"LA.companion.sessionAuthentication",  0LL);
}

id __52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    [MEMORY[0x1896079D8] processInfo];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 environment];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [MEMORY[0x1896079D8] processInfo];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 environment];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKeyedSubscript:v4];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 dataUsingEncoding:4];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189604038] standardUserDefaults];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 persistentDomainForName:*MEMORY[0x189607560]];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = [v9 objectForKeyedSubscript:v4];
      if (v14
        && (v15 = (void *)v14,
            [v9 objectForKeyedSubscript:v4],
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v16,
            v15,
            (isKindOfClass & 1) != 0))
      {
        [v9 objectForKeyedSubscript:v4];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v18 = v5;
      }

      id v12 = v18;
    }
  }

  else
  {
    id v12 = v5;
  }

  return v12;
}

- (NSString)flagPreboardModeKey
{
  return (NSString *)@"LA.Preboard.Mode";
}

- (NSNumber)valueForFlagPreboardMode
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.Preboard.Mode",  0LL);
}

- (NSString)flagRunningInBATSKey
{
  return (NSString *)@"LA.RunningInBATS";
}

- (NSNumber)valueForFlagRunningInBATS
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.RunningInBATS",  0LL);
}

- (NSString)flagSharedModeActiveKey
{
  return (NSString *)@"LA.sharedMode.isActive";
}

- (NSNumber)valueForFlagSharedModeActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.sharedMode.isActive",  0LL);
}

- (NSString)flagSharedModeLatencyKey
{
  return (NSString *)@"LA.sharedMode.latency";
}

- (NSNumber)valueForFlagSharedModeLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke( (uint64_t)self,  @"LA.sharedMode.latency",  0LL);
}

- (BOOL)featureFlagApproveByMacEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagApproveByMacFailureUIEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeyGracePeriodEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeySecureRepairEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagEssoniteClickEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardDeveloperModeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardProtectedVariablesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardUPPEnabled
{
  return _os_feature_enabled_impl();
}

@end