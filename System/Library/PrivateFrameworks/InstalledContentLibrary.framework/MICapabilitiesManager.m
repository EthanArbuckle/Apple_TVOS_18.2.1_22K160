@interface MICapabilitiesManager
+ (id)defaultManager;
- (id)checkCapabilities:(id)a3 withOptions:(id)a4 error:(id *)a5;
@end

@implementation MICapabilitiesManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__MICapabilitiesManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, block);
  }
  return (id)defaultManager_defaultManager_0;
}

void __39__MICapabilitiesManager_defaultManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager_0;
  defaultManager_defaultManager_0 = (uint64_t)v0;
}

- (id)checkCapabilities:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v46[3] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v40 = v7;
    v10 = 0LL;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _CreateAndLogError( (uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]",  65LL,  @"MIInstallerErrorDomain",  66LL,  0LL,  0LL,  @"UIRequiredDeviceCapabilties in Info.plist does not have an array or dictionary value.",  v11,  v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      id v24 = 0LL;
      v10 = 0LL;
      id v40 = 0LL;
      if (!a5) {
        goto LABEL_47;
      }
      goto LABEL_45;
    }

    [v7 allKeys];
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    [v7 allValues];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v37 = v7;
  v38 = a5;
  v39 = v9;
  if (v8)
  {
    [v8 objectForKeyedSubscript:*MEMORY[0x189604E00]];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          [v13 installationBlacklist],
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 containsObject:v12],
          v14,
          v13,
          v15))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        uint64_t v35 = (uint64_t)v12;
        MOLogWrite();
      }

      int v16 = 1;
    }

    else
    {
      int v16 = 0;
    }
  }

  else
  {
    int v16 = 0;
  }

  uint64_t v17 = objc_msgSend(v40, "count", v35);
  if (!v17)
  {
LABEL_34:
    if (v16)
    {
      v45[0] = @"CapabilitiesMatch";
      v45[1] = @"MismatchedCapabilities";
      v9 = v39;
      v46[0] = MEMORY[0x189604A80];
      v46[1] = v39;
      v45[2] = @"AppBlacklisted";
      v46[2] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:3];
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0LL;
      id v7 = v37;
      a5 = v38;
      if (!v38) {
        goto LABEL_47;
      }
    }

    else
    {
      v9 = v39;
      a5 = v38;
      if ([v39 count])
      {
        v43[0] = @"CapabilitiesMatch";
        v43[1] = @"MismatchedCapabilities";
        v44[0] = MEMORY[0x189604A80];
        v44[1] = v39;
        v30 = (void *)MEMORY[0x189603F68];
        v31 = v44;
        v32 = (const __CFString **)v43;
        uint64_t v33 = 2LL;
      }

      else
      {
        v41 = @"CapabilitiesMatch";
        uint64_t v42 = MEMORY[0x189604A88];
        v30 = (void *)MEMORY[0x189603F68];
        v31 = &v42;
        v32 = &v41;
        uint64_t v33 = 1LL;
      }

      [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0LL;
      id v7 = v37;
      if (!v38) {
        goto LABEL_47;
      }
    }

@end