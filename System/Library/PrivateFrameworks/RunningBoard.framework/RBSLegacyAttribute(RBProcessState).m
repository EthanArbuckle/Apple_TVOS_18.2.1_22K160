@interface RBSLegacyAttribute(RBProcessState)
- (BOOL)preventsSuspension;
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAcquisitionContext:()RBProcessState;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSLegacyAttribute(RBProcessState)

- (void)applyToAcquisitionContext:()RBProcessState
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (![v4 acquisitionPolicy])
  {
    uint64_t v5 = [a1 requestedReason];
    [v4 descriptor];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1
      || v5 == 9
      && ([v6 explanation],
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"com.apple.extension.session"],
          v8,
          v9))
    {
      rbs_assertion_log();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        [v7 identifier];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_INFO,  "forcing acquisition after state application for assertion %@",  (uint8_t *)&v12,  0xCu);
      }

      [v4 setAcquisitionPolicy:1];
    }
  }
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  -[RBSLegacyAttribute _mutateReasonWithContext:](a1, v8);
  if ([v8 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);
    }
LABEL_34:

    goto LABEL_35;
  }

  if (applyToAssertionIntransientState_attributePath_context__onceToken != -1) {
    dispatch_once(&applyToAssertionIntransientState_attributePath_context__onceToken, &__block_literal_global);
  }
  double v10 = -[RBSLegacyAttribute _invalidationDurationExpiringTaskCompletionsQuickly:]( a1,  applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly);
  [v7 invalidationDuration];
  if (v10 > v11) {
    [v7 setInvalidationDuration:v10];
  }
  if (v10 == 0.0) {
    double v12 = 0.0;
  }
  else {
    double v12 = 5.0;
  }
  [v7 warningDuration];
  if (v12 > v13) {
    [v7 setWarningDuration:v12];
  }
  unint64_t started = -[RBSLegacyAttribute _startPolicy]((uint64_t)a1);
  if (started > [v7 startPolicy]) {
    [v7 setStartPolicy:started];
  }
  unint64_t v15 = 2LL * (a1 != 0LL);
  if (v15 > [v7 endPolicy]) {
    [v7 setEndPolicy:v15];
  }
  if (a1 && ([a1 reason] == 9 || objc_msgSend(a1, "reason") == 13)) {
    [v7 setSuspendsOnOriginatorSuspension:1];
  }
  if ([a1 reason]) {
    objc_msgSend(v7, "setLegacyReason:", objc_msgSend(a1, "reason"));
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = -[RBSLegacyAttribute _invalidateOnThermalLevel]((uint64_t)a1);
    [v7 invalidatesOnConditions];
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      [MEMORY[0x189603FC8] dictionary];
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [v7 setInvalidatesOnConditions:v9];
    }
    v17 = -[os_log_s objectForKey:](v9, "objectForKey:", @"therm");
    v18 = v17;
    if (!v17 || v16 < [v17 integerValue])
    {
      [MEMORY[0x189607968] numberWithInteger:v16];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setValue:forKey:](v9, "setValue:forKey:", v19, @"therm");
    }

    goto LABEL_34;
  }

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);
    }
  }

  else
  {
    if ([(id)a1 reason])
    {
      NSStringFromRBSLegacyReason();
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addTag:v10];
    }

    if (a1)
    {
      unint64_t v11 = [(id)a1 reason];
      if (v11 <= 0x17 && ((1LL << v11) & 0xA80010) != 0) {
        a1 = 1LL;
      }
      else {
        a1 = 2LL;
      }
    }

    unsigned __int8 v12 = 2;
    do
    {
      unsigned int v13 = v12;
      if (a1 > [v7 maxCPUUsageViolationPolicyForRole:v12]) {
        [v7 setMaxCPUUsageViolationPolicy:a1 forRole:v12];
      }
      ++v12;
    }

    while (v13 < 4);
  }
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 isActiveDueToInheritedEndowment])
  {
    rbs_assertion_log();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);
    }
    goto LABEL_62;
  }

  unint64_t v10 = -[RBSLegacyAttribute _explicitJetsamBand:](a1, v8);
  if (v10 > [v7 explicitJetsamBand]) {
    [v7 setExplicitJetsamBand:v10];
  }
  int v11 = [v7 memoryLimit];
  [v8 target];
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 process];
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[os_log_s memoryLimits](v9, "memoryLimits");
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == 100
      || [a1 reason] == 9
      && ([v8 assertion],
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(),
          [v15 explanation],
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:@"com.apple.viewservice.session"],
          v16,
          v15,
          v17)
      && v10 == 80)
    {
      id v14 = (id)*MEMORY[0x189612468];
    }

    else
    {
      id v14 = (id)*MEMORY[0x189612470];
      if (v10) {
        [v7 setPreventBaseMemoryLimitReduction:1];
      }
    }

    unsigned __int8 v51 = 2;
    uint64_t v18 = [v13 memoryLimitForCategory:v14 strength:&v51];
    if (v11 == (_DWORD)v18)
    {
      unsigned int v19 = v51;
      unsigned int v20 = [v7 memoryLimitStrength];
      if (v19 <= v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v19;
      }
      [v7 setMemoryLimitStrength:v21];
    }

    else if (v11 < (int)v18)
    {
      uint64_t v22 = v18;
      [v7 setMemoryLimitCategory:v14];
      [v7 setMemoryLimitStrength:v51];
      [v7 setMemoryLimit:v22];
    }
  }

  else
  {
    rbs_assertion_log();
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188634000,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "applying Legacy Assertion to process state without concrete target",  buf,  2u);
    }
  }

  uint64_t v23 = -[RBSLegacyAttribute _role](a1);
  if (v23 > [v7 role])
  {
    [v7 setRole:v23];
  }

  uint64_t v24 = -[RBSLegacyAttribute _terminationResistance]((uint64_t)a1);
  if (a1)
  {
    if (([a1 flags] & 4) == 0)
    {
      [v7 setPreventIdleSleep:1];
      v25 = (void *)NSString;
      [v8 assertionID];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 assertion];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 explanation];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 reason];
      NSStringFromRBSLegacyReason();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 stringWithFormat:@"%@:%@(%@)", v26, v28, v29];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addPreventIdleSleepIdentifier:v30];
    }

    if (([a1 flags] & 0x20) != 0) {
      goto LABEL_35;
    }
  }

  if ((unint64_t)[v7 explicitJetsamBand] >= 0x50)
  {
LABEL_35:
  }

  if (a1 && ([a1 reason] == 9 || objc_msgSend(a1, "reason") == 13)) {
    [v7 setTargetedBySuspendableAssertion:1];
  }
  [v8 targetIdentity];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 embeddedApplicationIdentifier];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = [v32 isEqualToString:@"com.apple.mobilesafari"];

  if (v33)
  {
    if (([v7 jetsamLenientMode] & 1) == 0)
    {
      [v8 availableInheritances];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 allNamespaces];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      int v36 = [v35 containsObject:*MEMORY[0x189612510]];

      if (v36) {
        [v7 setJetsamLenientMode:1];
      }
    }
  }

  unint64_t v37 = [a1 reason];
  if (v37 == 10008) {
    [v7 setThrottleBestEffortNetworking:1];
  }
  if (a1)
  {
    unint64_t v38 = [a1 reason] - 19;
    if (v38 > 4) {
      uint64_t v39 = 80LL;
    }
    else {
      uint64_t v39 = qword_1886AF0F0[v38];
    }
    uint64_t v40 = -[RBSLegacyAttribute _maxCPUDuration]((uint64_t)a1);
LABEL_52:
    [v8 targetProcess];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    char v42 = [v41 isPlatformBinary];

    if ((v42 & 1) == 0)
    {
      if (a1)
      {
        unint64_t v43 = [a1 reason];
        if (v43 <= 0x17 && ((1LL << v43) & 0xA80010) != 0) {
          uint64_t v44 = 1LL;
        }
        else {
          uint64_t v44 = 2LL;
        }
      }

      else
      {
        uint64_t v44 = 0LL;
      }

      v45 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]( objc_alloc(&OBJC_CLASS___RBProcessCPUMaximumLimits),  "initWithPercentage:duration:violationPolicy:",  v39,  v40,  v44);
      v46 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]( objc_alloc(&OBJC_CLASS___RBProcessCPUMaximumLimits),  "initWithPercentage:duration:violationPolicy:",  80LL,  180LL,  0LL);
      v47 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]( objc_alloc(&OBJC_CLASS___RBProcessCPUMaximumLimits),  "initWithPercentage:duration:violationPolicy:",  80LL,  180LL,  0LL);
      [v7 setMaxCPUUsageLimits:v45 forRole:2];
      [v7 setMaxCPUUsageLimits:v45 forRole:4];
      [v7 setMaxCPUUsageLimits:v46 forRole:5];
      [v7 setMaxCPUUsageLimits:v47 forRole:7];
    }

    goto LABEL_58;
  }

  uint64_t v49 = -[RBSLegacyAttribute _maxCPUDuration](0LL);
  if (v49)
  {
    uint64_t v40 = v49;
    uint64_t v39 = 0LL;
    goto LABEL_52;
  }

- (BOOL)preventsSuspension
{
  return -[RBSLegacyAttribute _role](a1) > 1;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 handleFailureInMethod:a2 object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:346 description:@"must provide error outparam"];
  }

  if ([a1 requestedReason] == 9)
  {
    [v7 targetIdentity];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 isXPCService];

    if (v9)
    {
      rbs_assertion_log();
      unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v7 assertionDescriptor];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 identifier];
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v12;
        _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Mutating assertion %{public}@ reason from ViewService to Extension because it targets an xpc service.",  buf,  0xCu);
      }

      [a1 setReason:13];
    }
  }

  v30 = 0LL;
  int v13 = -[RBSLegacyAttribute _isOriginatorValidForContext:errorReason:](a1, v7, (const __CFString **)&v30);
  id v14 = v30;
  unint64_t v15 = (__CFString *)v14;
  if (v13)
  {
    v29 = 0LL;
    char v16 = -[RBSLegacyAttribute _isTargetValidForContext:errorReason:]((uint64_t)a1, v7, (const __CFString **)&v29);
    int v17 = v29;

    if ((v16 & 1) != 0)
    {
      uint64_t v18 = 1LL;
      goto LABEL_17;
    }
  }

  else
  {
    int v17 = (__CFString *)v14;
  }

  if (!v17)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 handleFailureInMethod:a2 object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:356 description:@"no failure reason provided"];
  }

  rbs_assertion_log();
  unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[RBSLegacyAttribute(RBProcessState) isValidForContext:withError:].cold.1(v17);
  }

  unsigned int v20 = (void *)MEMORY[0x189607870];
  uint64_t v21 = *MEMORY[0x1896123E0];
  uint64_t v22 = *MEMORY[0x1896075F0];
  v32[0] = v17;
  uint64_t v23 = *MEMORY[0x1896123D8];
  v31[0] = v22;
  v31[1] = v23;
  [a1 description];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v24;
  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 errorWithDomain:v21 code:2 userInfo:v25];
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v18 = 0LL;
LABEL_17:

  return v18;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6 != a1 && (uint64_t v7 = objc_opt_class(), v7 == objc_opt_class()))
  {
    if (a4)
    {
      [NSString stringWithFormat:@"Attribute conflict: attribute %@ conflicts with attribute %@", a1, v6];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = (void *)MEMORY[0x189607870];
      uint64_t v11 = *MEMORY[0x1896123E0];
      uint64_t v13 = *MEMORY[0x1896075F0];
      v14[0] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 errorWithDomain:v11 code:2 userInfo:v12];
      *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0LL;
    }
  }

  else
  {
    a4 = 1LL;
  }

  return a4;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1( void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0( &dword_188634000,  v2,  v3,  "Not applying RBSLegacyAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1)
{
}

@end