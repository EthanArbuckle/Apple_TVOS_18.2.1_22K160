@interface RBAttributeFactory
+ (id)_GPUAccessGrantWithProperties:(void *)a3 errors:;
+ (id)_RBSBaseMemoryGrant:(void *)a3 errors:;
+ (id)_acquisitionCompletionAttributeWithProperties:(void *)a3 errors:;
+ (id)_appNapTimerThrottleAttributeWithProperties:(void *)a3 errors:;
+ (id)_attributeClassesByName;
+ (id)_conditionAttributeWithProperties:(void *)a3 errors:;
+ (id)_cpuAccessGrantWithProperties:(void *)a3 errors:;
+ (id)_cpuMaximumUsageLimitationWithProperties:(void *)a3 errors:;
+ (id)_cpuMinimumUsageGrantWithProperties:(void *)a3 errors:;
+ (id)_domainAttributeWithProperties:(void *)a3 errors:;
+ (id)_durationAttributeWithProperties:(void *)a3 errors:;
+ (id)_endowmentGrantWithProperties:(void *)a3 errors:;
+ (id)_invalidateUnderConditionAttributeWithProperties:(void *)a3 errors:;
+ (id)_jetsamPriorityGrantWithProperties:(void *)a3 errors:;
+ (id)_legalPropertyNamesAndValuesByClassName;
+ (id)_resistTerminationGrantWithProperties:(void *)a3 errors:;
+ (id)_runningReasonAttributeWithProperties:(void *)a3 errors:;
+ (id)_savedEndowmentGrantWithProperties:(void *)a3 errors:;
+ (id)_suspendableCPUGrantWithProperties:(void *)a3 errors:;
+ (id)_tagAttributeWithProperties:(void *)a3 errors:;
+ (id)attributeForClass:(id)a3 andProperties:(id)a4 errors:(id)a5;
@end

@implementation RBAttributeFactory

+ (id)attributeForClass:(id)a3 andProperties:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[RBAttributeFactory _attributeClassesByName]();
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    rbs_assertion_log();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory attributeForClass:andProperties:errors:].cold.1();
    }

    goto LABEL_41;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
LABEL_56:
    v15 = (void *)v16;
    goto LABEL_57;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x1896121A8];
LABEL_44:
    uint64_t v16 = [v17 grant];
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuAccessGrantWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _suspendableCPUGrantWithProperties:errors:]((uint64_t)a1, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    objc_opt_self();
    goto LABEL_41;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x1896121D0];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _domainAttributeWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _durationAttributeWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x1896121C8];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612248];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612280];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612288];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _resistTerminationGrantWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _tagAttributeWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612120];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612128];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612130];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612138];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612140];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x189612148];
    goto LABEL_44;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x189612270];
    goto LABEL_74;
  }

  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x1896121F8];
    goto LABEL_74;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _endowmentGrantWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x189612370];
    goto LABEL_74;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _conditionAttributeWithProperties:errors:]((uint64_t)&OBJC_CLASS___RBAttributeFactory, v9, v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    uint64_t v16 = +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:]( (uint64_t)&OBJC_CLASS___RBAttributeFactory,  v9,  v10);
    goto LABEL_56;
  }

  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x189612278];
LABEL_74:
    uint64_t v16 = [v13 attribute];
    goto LABEL_56;
  }

+ (id)_attributeClassesByName
{
  if (_attributeClassesByName_onceToken != -1) {
    dispatch_once(&_attributeClassesByName_onceToken, &__block_literal_global_238);
  }
  return (id)_attributeClassesByName_availableClasses;
}

+ (id)_acquisitionCompletionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"CompletionPolicy", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    rbs_assertion_log();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:].cold.1();
    }
    goto LABEL_9;
  }

  [v9 objectForKeyedSubscript:v11];
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    rbs_assertion_log();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:].cold.2();
    }

LABEL_9:
    v15 = 0LL;
    goto LABEL_10;
  }

  uint64_t v14 = -[os_log_s unsignedIntegerValue](v12, "unsignedIntegerValue");
  [MEMORY[0x189612118] attributeWithCompletionPolicy:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)_cpuAccessGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Role", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v9 objectForKeyedSubscript:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      unsigned __int8 v14 = [v12 unsignedIntegerValue];
      [MEMORY[0x189612190] grantWithRole:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (id)_suspendableCPUGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Role", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v9 objectForKeyedSubscript:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      unsigned __int8 v14 = [v12 unsignedIntegerValue];
      [MEMORY[0x189612378] grantWithRole:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

+ (id)_cpuMaximumUsageLimitationWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v4, @"ViolationPolicy", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v9 objectForKeyedSubscript:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      rbs_assertion_log();
      unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.2();
      }
      v25 = 0LL;
      goto LABEL_35;
    }

    uint64_t v13 = objc_opt_class();
    safeGetProperty(v4, @"Role", v13, v5);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      rbs_assertion_log();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.3();
      }
      v25 = 0LL;
      goto LABEL_34;
    }

    [v9 objectForKeyedSubscript:v14];
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      rbs_assertion_log();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.4();
      }
      v25 = 0LL;
      goto LABEL_33;
    }

    uint64_t v16 = objc_opt_class();
    safeGetProperty(v4, @"Percentage", v16, v5);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      uint64_t v29 = -[os_log_s unsignedIntegerValue](v17, "unsignedIntegerValue");
      if ((unint64_t)(v29 - 1) > 0x63)
      {
        rbs_assertion_log();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.8();
        }
      }

      else
      {
        uint64_t v19 = objc_opt_class();
        safeGetProperty(v4, @"Duration", v19, v5);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          -[os_log_s doubleValue](v20, "doubleValue");
          if (v22 > 0.0)
          {
            double v23 = v22;
            uint64_t v28 = [v12 unsignedIntegerValue];
            unsigned __int8 v24 = -[os_log_s unsignedIntegerValue](v15, "unsignedIntegerValue");
            [MEMORY[0x189612198] limitationForRole:v24 withPercentage:v29 duration:v28 violationPolicy:v23];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }

          rbs_assertion_log();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.7();
          }
        }

        else
        {
          rbs_assertion_log();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.6();
          }
        }
      }
    }

    else
    {
      rbs_assertion_log();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.5();
      }
    }

    v25 = 0LL;
    goto LABEL_32;
  }

  rbs_assertion_log();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.1();
  }
  v25 = 0LL;
LABEL_36:

  return v25;
}

+ (id)_cpuMinimumUsageGrantWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  v6 = +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v4, @"Role", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v9 objectForKeyedSubscript:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      rbs_assertion_log();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.2();
      }
      double v23 = 0LL;
      goto LABEL_25;
    }

    uint64_t v13 = objc_opt_class();
    safeGetProperty(v4, @"Percentage", v13, v5);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = -[os_log_s unsignedIntegerValue](v14, "unsignedIntegerValue");
      if ((unint64_t)(v16 - 1) > 0x63)
      {
        rbs_assertion_log();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.6();
        }
      }

      else
      {
        uint64_t v17 = objc_opt_class();
        safeGetProperty(v4, @"Duration", v17, v5);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = v18;
        if (v18)
        {
          -[os_log_s doubleValue](v18, "doubleValue");
          if (v20 > 0.0)
          {
            double v21 = v20;
            unsigned __int8 v22 = [v12 unsignedIntegerValue];
            [MEMORY[0x1896121A0] grantForRole:v22 withPercentage:v16 duration:v21];
            double v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }

          rbs_assertion_log();
          unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.5();
          }
        }

        else
        {
          rbs_assertion_log();
          unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.4();
          }
        }
      }
    }

    else
    {
      rbs_assertion_log();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.3();
      }
    }

    double v23 = 0LL;
    goto LABEL_24;
  }

  rbs_assertion_log();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.1();
  }
  double v23 = 0LL;
LABEL_26:

  return v23;
}

+ (id)_domainAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"Domain", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  safeGetProperty(v5, @"Name", v8, v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    rbs_assertion_log();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _domainAttributeWithProperties:errors:].cold.1();
    }

    uint64_t v12 = 0LL;
  }

  else
  {
    [MEMORY[0x1896121D8] attributeWithDomain:v7 name:v9];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_durationAttributeWithProperties:(void *)a3 errors:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"InvalidationDuration", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_opt_class();
  safeGetProperty(v5, @"WarningDuration", v12, v4);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_opt_class();
  safeGetProperty(v5, @"StartPolicy", v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_opt_class();
  safeGetProperty(v5, @"EndPolicy", v16, v4);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v15 && v17)
  {
    [v9 objectForKeyedSubscript:v15];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v9 objectForKeyedSubscript:v17];
    double v20 = (void *)v19;
    if (v18 && v19)
    {
      uint64_t v21 = [v18 unsignedIntegerValue];
      uint64_t v22 = [v20 unsignedIntegerValue];
      [v11 doubleValue];
      double v24 = v23;
      [v13 doubleValue];
      [MEMORY[0x1896121E8] attributeWithDuration:v21 warningDuration:v22 startPolicy:v24 endPolicy:v25];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }

    if (v18)
    {
      if (v19)
      {
LABEL_19:
        v26 = 0LL;
        goto LABEL_20;
      }
    }

    else
    {
      rbs_assertion_log();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _durationAttributeWithProperties:errors:].cold.2();
      }

      if (v20) {
        goto LABEL_19;
      }
    }

    rbs_assertion_log();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _durationAttributeWithProperties:errors:].cold.1();
    }

    goto LABEL_19;
  }

  rbs_assertion_log();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
  {
    int v30 = 138544130;
    v31 = v11;
    __int16 v32 = 2114;
    v33 = v13;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    v37 = v17;
    _os_log_error_impl( &dword_188634000,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "Detected misconfigured duration attribute: invalidationDuration %{public}@; warningDuration %{public}@; startPolic"
      "y %{public}@; endPolicy %{public}@",
      (uint8_t *)&v30,
      0x2Au);
  }

  v26 = 0LL;
LABEL_21:

  return v26;
}

+ (id)_GPUAccessGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Role", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x189612200] grant];
    goto LABEL_5;
  }

  [v9 objectForKeyedSubscript:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v13 = [v12 unsignedIntValue];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x189612200] grantWithRole:v13];
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_9;
  }

  rbs_assertion_log();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:].cold.1();
  }

  v15 = 0LL;
LABEL_9:

  return v15;
}

+ (id)_jetsamPriorityGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"Band", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x189612238], "grantWithBand:", objc_msgSend(v7, "unsignedIntValue"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    rbs_assertion_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:].cold.1();
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)_RBSBaseMemoryGrant:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v4, @"Category", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    safeGetProperty(v4, @"Strength", v12, v5);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      [v9 objectForKeyedSubscript:v13];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend( MEMORY[0x189612188],  "grantWithCategory:strength:",  v11,  objc_msgSend(v14, "charValue"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }

      rbs_assertion_log();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.3();
      }
    }

    else
    {
      rbs_assertion_log();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.2();
      }
    }

    uint64_t v16 = 0LL;
    goto LABEL_14;
  }

  rbs_assertion_log();
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.1();
  }
  uint64_t v16 = 0LL;
LABEL_15:

  return v16;
}

+ (id)_resistTerminationGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Resistance", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v9 objectForKeyedSubscript:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x189612350], "grantWithResistance:", objc_msgSend(v12, "integerValue"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

+ (id)_runningReasonAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"RunningReason", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    rbs_assertion_log();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:].cold.1();
    }
    goto LABEL_8;
  }

  uint64_t v8 = [v7 longValue];
  if (v8 < 1)
  {
    rbs_assertion_log();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:].cold.2();
    }
LABEL_8:

    id v9 = 0LL;
    goto LABEL_9;
  }

  [MEMORY[0x189612358] withReason:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

+ (id)_tagAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"Tag", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [MEMORY[0x189612380] attributeWithTag:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    rbs_assertion_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _tagAttributeWithProperties:errors:].cold.1();
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)_appNapTimerThrottleAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Tier", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || ([v9 objectForKeyedSubscript:v11], (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (unsigned __int8 v13 = v12,
        objc_msgSend(MEMORY[0x189612150], "grantWithTier:", objc_msgSend(v12, "unsignedCharValue")),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    rbs_assertion_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:].cold.1();
    }

    uint64_t v14 = 0LL;
  }

  return v14;
}

+ (id)_endowmentGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_opt_class();
  safeGetProperty(v5, @"Namespace", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || ([v9 objectForKeyedSubscript:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)
    || (unsigned __int8 v13 = (void *)v12,
        [MEMORY[0x1896121F0] grantWithNamespace:v12 endowment:0],
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    rbs_assertion_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _endowmentGrantWithProperties:errors:].cold.1();
    }

    uint64_t v14 = 0LL;
  }

  return v14;
}

+ (id)_savedEndowmentGrantWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"Namespace", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  safeGetProperty(v5, @"Key", v8, v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10
    || ([MEMORY[0x189612368] grantWithNamespace:v7 key:v9],
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    rbs_assertion_log();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:].cold.1();
    }

    v11 = 0LL;
  }

  return v11;
}

+ (id)_conditionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  uint64_t v6 = objc_opt_class();
  safeGetProperty(v5, @"Condition", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  safeGetProperty(v5, @"Value", v8, v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10
    || (objc_msgSend(MEMORY[0x1896121B8], "attributeWithCondition:value:", v7, objc_msgSend(v9, "integerValue")),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    rbs_assertion_log();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[RBAttributeFactory _conditionAttributeWithProperties:errors:].cold.1();
    }

    v11 = 0LL;
  }

  return v11;
}

+ (id)_invalidateUnderConditionAttributeWithProperties:(void *)a3 errors:
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = objc_opt_class();
    safeGetProperty(v4, @"Condition", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7 && ([v7 isEqualToString:@"therm"] & 1) != 0)
    {
      id v9 = 0LL;
    }

    else
    {
      uint64_t v10 = objc_opt_class();
      safeGetProperty(v4, @"MinValue", v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v11;
      if (!v8
        || !v11
        || (objc_msgSend(MEMORY[0x189612230], "attributeWithCondition:minValue:", v8, objc_msgSend(v11, "integerValue")),
            (unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
      {
        rbs_assertion_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:].cold.1();
        }

        unsigned __int8 v13 = 0LL;
      }

      id v9 = v13;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)_legalPropertyNamesAndValuesByClassName
{
  if (_legalPropertyNamesAndValuesByClassName_onceToken != -1) {
    dispatch_once(&_legalPropertyNamesAndValuesByClassName_onceToken, &__block_literal_global_16);
  }
  return (id)_legalPropertyNamesAndValuesByClassName_legalValues;
}

void __61__RBAttributeFactory__legalPropertyNamesAndValuesByClassName__block_invoke()
{
  v7[12] = *MEMORY[0x1895F89C0];
  v6[0] = @"RBSAcquisitionCompletionAttribute";
  v6[1] = @"RBSCPUAccessGrant";
  v7[0] = &unk_18A26F448;
  v7[1] = &unk_18A26F470;
  v6[2] = @"RBSSuspendableCPUGrant";
  v6[3] = @"RBSCoalitionLevelGrant";
  v7[2] = &unk_18A26F498;
  v7[3] = &unk_18A26F4C0;
  v6[4] = @"RBSCPUMaximumUsageLimitation";
  v6[5] = @"RBSBaseMemoryGrant";
  v7[4] = &unk_18A26F4E8;
  v7[5] = &unk_18A26F510;
  v6[6] = @"RBSCPUMinimumUsageGrant";
  v6[7] = @"RBSResistTerminationGrant";
  v7[6] = &unk_18A26F538;
  v7[7] = &unk_18A26F560;
  v6[8] = @"RBSDurationAttribute";
  v6[9] = @"RBSAppNapPreventTimerThrottleGrant";
  v7[8] = &unk_18A26F588;
  v7[9] = &unk_18A26F5B0;
  v6[10] = @"RBSEndowmentGrant";
  v4[0] = @"RBSVisibilityNamespace";
  v4[1] = @"RBSUserfacingNamespace";
  uint64_t v0 = *MEMORY[0x189612508];
  v5[0] = *MEMORY[0x189612510];
  v5[1] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[11] = @"RBSGPUAccessGrant";
  v7[10] = v1;
  v7[11] = &unk_18A26F5D8;
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:12];
  v3 = (void *)_legalPropertyNamesAndValuesByClassName_legalValues;
  _legalPropertyNamesAndValuesByClassName_legalValues = v2;
}

void __45__RBAttributeFactory__attributeClassesByName__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FC8] dictionary];
  v1 = (void *)_attributeClassesByName_availableClasses;
  _attributeClassesByName_availableClasses = v0;

  uint64_t v2 = objc_opt_class();
  v3 = (void *)_attributeClassesByName_availableClasses;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:v5];

  uint64_t v6 = objc_opt_class();
  v7 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:v9];

  uint64_t v10 = objc_opt_class();
  v11 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v10 forKeyedSubscript:v13];

  uint64_t v14 = objc_opt_class();
  v15 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setObject:v14 forKeyedSubscript:v17];

  uint64_t v18 = objc_opt_class();
  uint64_t v19 = (void *)_attributeClassesByName_availableClasses;
  double v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 setObject:v18 forKeyedSubscript:v21];

  uint64_t v22 = objc_opt_class();
  double v23 = (void *)_attributeClassesByName_availableClasses;
  double v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  double v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setObject:v22 forKeyedSubscript:v25];

  uint64_t v26 = objc_opt_class();
  v27 = (void *)_attributeClassesByName_availableClasses;
  uint64_t v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 setObject:v26 forKeyedSubscript:v29];

  uint64_t v30 = objc_opt_class();
  v31 = (void *)_attributeClassesByName_availableClasses;
  __int16 v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 setObject:v30 forKeyedSubscript:v33];

  uint64_t v34 = objc_opt_class();
  v35 = (void *)_attributeClassesByName_availableClasses;
  __int16 v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 setObject:v34 forKeyedSubscript:v37];

  uint64_t v38 = objc_opt_class();
  v39 = (void *)_attributeClassesByName_availableClasses;
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 setObject:v38 forKeyedSubscript:v41];

  uint64_t v42 = objc_opt_class();
  v43 = (void *)_attributeClassesByName_availableClasses;
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 setObject:v42 forKeyedSubscript:v45];

  uint64_t v46 = objc_opt_class();
  v47 = (void *)_attributeClassesByName_availableClasses;
  v48 = (objc_class *)objc_opt_class();
  NSStringFromClass(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 setObject:v46 forKeyedSubscript:v49];

  uint64_t v50 = objc_opt_class();
  v51 = (void *)_attributeClassesByName_availableClasses;
  v52 = (objc_class *)objc_opt_class();
  NSStringFromClass(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v51 setObject:v50 forKeyedSubscript:v53];

  uint64_t v54 = objc_opt_class();
  v55 = (void *)_attributeClassesByName_availableClasses;
  v56 = (objc_class *)objc_opt_class();
  NSStringFromClass(v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 setObject:v54 forKeyedSubscript:v57];

  uint64_t v58 = objc_opt_class();
  v59 = (void *)_attributeClassesByName_availableClasses;
  v60 = (objc_class *)objc_opt_class();
  NSStringFromClass(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v59 setObject:v58 forKeyedSubscript:v61];

  uint64_t v62 = objc_opt_class();
  v63 = (void *)_attributeClassesByName_availableClasses;
  v64 = (objc_class *)objc_opt_class();
  NSStringFromClass(v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 setObject:v62 forKeyedSubscript:v65];

  uint64_t v66 = objc_opt_class();
  v67 = (void *)_attributeClassesByName_availableClasses;
  v68 = (objc_class *)objc_opt_class();
  NSStringFromClass(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v67 setObject:v66 forKeyedSubscript:v69];

  uint64_t v70 = objc_opt_class();
  v71 = (void *)_attributeClassesByName_availableClasses;
  v72 = (objc_class *)objc_opt_class();
  NSStringFromClass(v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v71 setObject:v70 forKeyedSubscript:v73];

  uint64_t v74 = objc_opt_class();
  v75 = (void *)_attributeClassesByName_availableClasses;
  v76 = (objc_class *)objc_opt_class();
  NSStringFromClass(v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v75 setObject:v74 forKeyedSubscript:v77];

  uint64_t v78 = objc_opt_class();
  v79 = (void *)_attributeClassesByName_availableClasses;
  v80 = (objc_class *)objc_opt_class();
  NSStringFromClass(v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [v79 setObject:v78 forKeyedSubscript:v81];

  uint64_t v82 = objc_opt_class();
  v83 = (void *)_attributeClassesByName_availableClasses;
  v84 = (objc_class *)objc_opt_class();
  NSStringFromClass(v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [v83 setObject:v82 forKeyedSubscript:v85];

  uint64_t v86 = objc_opt_class();
  v87 = (void *)_attributeClassesByName_availableClasses;
  v88 = (objc_class *)objc_opt_class();
  NSStringFromClass(v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  [v87 setObject:v86 forKeyedSubscript:v89];

  uint64_t v90 = objc_opt_class();
  v91 = (void *)_attributeClassesByName_availableClasses;
  v92 = (objc_class *)objc_opt_class();
  NSStringFromClass(v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  [v91 setObject:v90 forKeyedSubscript:v93];

  uint64_t v94 = objc_opt_class();
  v95 = (void *)_attributeClassesByName_availableClasses;
  v96 = (objc_class *)objc_opt_class();
  NSStringFromClass(v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  [v95 setObject:v94 forKeyedSubscript:v97];

  uint64_t v98 = objc_opt_class();
  v99 = (void *)_attributeClassesByName_availableClasses;
  v100 = (objc_class *)objc_opt_class();
  NSStringFromClass(v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  [v99 setObject:v98 forKeyedSubscript:v101];

  uint64_t v102 = objc_opt_class();
  v103 = (void *)_attributeClassesByName_availableClasses;
  v104 = (objc_class *)objc_opt_class();
  NSStringFromClass(v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  [v103 setObject:v102 forKeyedSubscript:v105];

  uint64_t v106 = objc_opt_class();
  v107 = (void *)_attributeClassesByName_availableClasses;
  v108 = (objc_class *)objc_opt_class();
  NSStringFromClass(v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  [v107 setObject:v106 forKeyedSubscript:v109];

  uint64_t v110 = objc_opt_class();
  v111 = (void *)_attributeClassesByName_availableClasses;
  v112 = (objc_class *)objc_opt_class();
  NSStringFromClass(v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  [v111 setObject:v110 forKeyedSubscript:v113];

  uint64_t v114 = objc_opt_class();
  v115 = (void *)_attributeClassesByName_availableClasses;
  v116 = (objc_class *)objc_opt_class();
  NSStringFromClass(v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  [v115 setObject:v114 forKeyedSubscript:v117];

  uint64_t v118 = objc_opt_class();
  v119 = (void *)_attributeClassesByName_availableClasses;
  v120 = (objc_class *)objc_opt_class();
  NSStringFromClass(v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  [v119 setObject:v118 forKeyedSubscript:v121];

  uint64_t v122 = objc_opt_class();
  v123 = (void *)_attributeClassesByName_availableClasses;
  v124 = (objc_class *)objc_opt_class();
  NSStringFromClass(v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  [v123 setObject:v122 forKeyedSubscript:v125];

  uint64_t v126 = objc_opt_class();
  v127 = (void *)_attributeClassesByName_availableClasses;
  v128 = (objc_class *)objc_opt_class();
  NSStringFromClass(v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  [v127 setObject:v126 forKeyedSubscript:v129];

  uint64_t v130 = objc_opt_class();
  v131 = (void *)_attributeClassesByName_availableClasses;
  v132 = (objc_class *)objc_opt_class();
  NSStringFromClass(v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  [v131 setObject:v130 forKeyedSubscript:v133];

  uint64_t v134 = objc_opt_class();
  v135 = (void *)_attributeClassesByName_availableClasses;
  v136 = (objc_class *)objc_opt_class();
  NSStringFromClass(v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  [v135 setObject:v134 forKeyedSubscript:v137];

  uint64_t v138 = objc_opt_class();
  v139 = (void *)_attributeClassesByName_availableClasses;
  v140 = (objc_class *)objc_opt_class();
  NSStringFromClass(v140);
  id v141 = (id)objc_claimAutoreleasedReturnValue();
  [v139 setObject:v138 forKeyedSubscript:v141];
}

+ (void)attributeForClass:andProperties:errors:.cold.1()
{
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.2()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.1()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.2()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.3()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.4()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.5()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.6()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.7()
{
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.8()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.1()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.2()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.3()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.4()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.5()
{
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.6()
{
}

+ (void)_domainAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_durationAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_durationAttributeWithProperties:errors:.cold.2()
{
}

+ (void)_GPUAccessGrantWithProperties:errors:.cold.1()
{
}

+ (void)_jetsamPriorityGrantWithProperties:errors:.cold.1()
{
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.1()
{
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.2()
{
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.3()
{
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.2()
{
}

+ (void)_tagAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_appNapTimerThrottleAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_endowmentGrantWithProperties:errors:.cold.1()
{
}

+ (void)_savedEndowmentGrantWithProperties:errors:.cold.1()
{
}

+ (void)_conditionAttributeWithProperties:errors:.cold.1()
{
}

+ (void)_invalidateUnderConditionAttributeWithProperties:errors:.cold.1()
{
}

@end