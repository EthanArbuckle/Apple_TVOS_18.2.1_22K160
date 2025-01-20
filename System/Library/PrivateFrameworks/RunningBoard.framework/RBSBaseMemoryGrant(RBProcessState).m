@interface RBSBaseMemoryGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSBaseMemoryGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  int v9 = [v7 memoryLimit];
  [v8 target];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 process];
  if (v11)
  {
    v12 = (void *)v11;

LABEL_4:
    [v12 memoryLimits];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v28 = [a1 strength];
    [a1 category];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v14 memoryLimitForCategory:v15 strength:&v28];

    if (v9 == (_DWORD)v16)
    {
      unsigned int v17 = v28;
      unsigned int v18 = [v7 memoryLimitStrength];
      if (v17 <= v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v17;
      }
      [v7 setMemoryLimitStrength:v19];
    }

    else if (v9 < (int)v16)
    {
      [a1 category];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setMemoryLimitCategory:v20];

      [v7 setMemoryLimitStrength:v28];
      [v7 setMemoryLimit:v16];
    }

    rbs_assertion_log();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [a1 category];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = [v7 memoryLimit];
      [v8 assertion];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 identifier];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v30 = v12;
      __int16 v31 = 1024;
      int v32 = v9;
      __int16 v33 = 1024;
      int v34 = v16;
      __int16 v35 = 2112;
      v36 = v27;
      __int16 v37 = 1024;
      int v38 = v24;
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_debug_impl( &dword_188634000,  v21,  OS_LOG_TYPE_DEBUG,  "%@: StateLimit %d, attributeLimit %d(%@) -> %d (%@)",  buf,  0x32u);
    }

    goto LABEL_14;
  }

  [v8 assertion];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lock_targetProcessForAbstract");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    goto LABEL_4;
  }
  rbs_assertion_log();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    [v8 assertion];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 identifier];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v23;
    _os_log_impl( &dword_188634000,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "applying Base Memory Grant to process state without concrete target (%@)",  buf,  0xCu);
  }

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x189612178], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end