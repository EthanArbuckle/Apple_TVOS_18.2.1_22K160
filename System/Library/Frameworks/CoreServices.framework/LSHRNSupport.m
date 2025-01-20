@interface LSHRNSupport
+ (BOOL)deviceConfiguredForHRN;
+ (id)vendorIDFromVendorName:(id)a3 seedData:(id)a4 error:(id *)a5;
+ (void)deviceConfiguredForHRN;
+ (void)invalidateCache;
+ (void)setActivationRecordOverride:(BOOL)a3;
+ (void)setActivationRecordOverrideNil;
+ (void)setFeatureFlagOverride:(BOOL)a3;
@end

@implementation LSHRNSupport

+ (BOOL)deviceConfiguredForHRN
{
  v30[1] = *MEMORY[0x1895F89C0];
  if (MobileActivationLibrary(void)::frameworkLibrary
    || (v2 = dlopen("/System/Library/PrivateFrameworks/MobileActivation.framework/MobileActivation", 2),
        (MobileActivationLibrary(void)::frameworkLibrary = (uint64_t)v2) != 0))
  {
    os_unfair_lock_lock(&hrnLock);
    if (checkedFeatureFlag == 1)
    {
      int v3 = isHRN;
    }

    else
    {
      if (featureFlagOverride) {
        int v3 = featureFlagOverride == 1;
      }
      else {
        int v3 = _os_feature_enabled_impl();
      }
      isHRN = v3;
      checkedFeatureFlag = 1;
    }

    if ((checkedActivationRecord & 1) != 0 || v3) {
      goto LABEL_28;
    }
    switch(activationRecordOverride)
    {
      case -1LL:
        v27 = @"DeviceConfigurationFlags";
        v28 = &unk_189DA8170;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5) {
          goto LABEL_20;
        }
        break;
      case 0LL:
        v26 = 0LL;
        v8 = softLinkMAECopyActivationRecordWithError;
        if (softLinkMAECopyActivationRecordWithError)
        {
          softLinkMAECopyActivationRecordWithError((uint64_t)&v26);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v26;
        }

        else
        {
          v5 = 0LL;
        }

        v17 = v8;
        if (!v5)
        {
          _LSDefaultLog();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[LSHRNSupport deviceConfiguredForHRN].cold.2((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }

LABEL_17:
        if (!v5) {
          break;
        }
LABEL_20:
        checkedActivationRecord = 1;
        objc_msgSend(v5, "objectForKeyedSubscript:", @"DeviceConfigurationFlags", v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          isHRN = (~[v6 integerValue] & 0x21) == 0;
        }

        else
        {
          _LSDefaultLog();
          v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            +[LSHRNSupport deviceConfiguredForHRN].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }

        break;
      case 1LL:
        v29 = @"DeviceConfigurationFlags";
        [MEMORY[0x189607968] numberWithUnsignedInteger:33];
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v4;
        [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
    }

+ (void)invalidateCache
{
  checkedFeatureFlag = 0;
  checkedActivationRecord = 0;
  os_unfair_lock_unlock(&hrnLock);
}

+ (void)setActivationRecordOverrideNil
{
  activationRecordOverride = -2LL;
}

+ (void)setActivationRecordOverride:(BOOL)a3
{
  uint64_t v3 = 1LL;
  if (!a3) {
    uint64_t v3 = -1LL;
  }
  activationRecordOverride = v3;
}

+ (void)setFeatureFlagOverride:(BOOL)a3
{
  uint64_t v3 = 1LL;
  if (!a3) {
    uint64_t v3 = -1LL;
  }
  featureFlagOverride = v3;
}

+ (id)vendorIDFromVendorName:(id)a3 seedData:(id)a4 error:(id *)a5
{
  void v30[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v30[0] = 0LL;
  v30[1] = 0LL;
  id v9 = v7;
  [v9 UTF8String];
  id v10 = v9;
  strlen((const char *)[v10 UTF8String]);
  int Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:@"CCStatusErrorDomain" code:Hkdf userInfo:0];
    _LSDefaultLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  else
  {
    id v20 = v8;
    [v20 bytes];
    [v20 length];
    if (!CCDeriveKey())
    {
      v28 = 0LL;
      v27 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v30];
      goto LABEL_8;
    }

    uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:@"CCStatusErrorDomain" code:0 userInfo:0];
    _LSDefaultLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:].cold.1(v12, v13, v21, v22, v23, v24, v25, v26);
    }
  }

  v27 = 0LL;
  v28 = (void *)v12;
LABEL_8:
  if (a5 && v28) {
    *a5 = v28;
  }

  return v27;
}

+ (void)deviceConfiguredForHRN
{
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end