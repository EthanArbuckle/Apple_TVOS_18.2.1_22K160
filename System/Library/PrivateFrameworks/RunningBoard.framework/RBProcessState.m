@interface RBProcessState
- (BOOL)carPlayMode;
- (BOOL)effectiveJetsamLenientMode;
- (BOOL)forceRoleManage;
- (BOOL)guaranteedRunning;
- (BOOL)isAppNapEqualToProcessState:(id)a3;
- (BOOL)isBeingDebugged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProcessStateIgnoringIdentity:(id)a3;
- (BOOL)isEqualToProcessStateIgnoringInheritances:(id)a3;
- (BOOL)jetsamLenientMode;
- (BOOL)preventBaseMemoryLimitReduction;
- (BOOL)preventIdleSleep;
- (BOOL)preventSuspend;
- (BOOL)targetedBySuspendableAssertion;
- (BOOL)throttleBestEffortNetworking;
- (NSSet)endowmentInfos;
- (NSSet)legacyAssertions;
- (NSSet)preventIdleSleepIdentifiers;
- (NSSet)preventLaunchReasons;
- (NSSet)primitiveAssertions;
- (NSSet)tags;
- (NSString)memoryLimitCategory;
- (RBInheritanceCollection)inheritances;
- (RBProcessState)init;
- (RBProcessState)initWithIdentity:(id)a3;
- (RBSProcessIdentity)identity;
- (id)_initWithProcessState:(id *)a1;
- (id)clientStateForProcess:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)inheritancesForEnvironment:(id)a3;
- (id)maxCPUUsageLimitsForRole:(unsigned __int8)a3;
- (id)minCPUUsageLimitsForRole:(unsigned __int8)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)memoryLimit;
- (uint64_t)_isEqualToProcessStateIgnoringIdentityAndInheritances:(uint64_t)a1;
- (unint64_t)coalitionLevel;
- (unint64_t)effectiveMaxCPUDuration;
- (unint64_t)effectiveMaxCPUPercentage;
- (unint64_t)effectiveMaxCPUUsageViolationPolicy;
- (unint64_t)effectiveMinCPUDuration;
- (unint64_t)effectiveMinCPUPercentage;
- (unint64_t)explicitJetsamBand;
- (unint64_t)hash;
- (unint64_t)legacyFinishTaskReason;
- (unsigned)gpuRole;
- (unsigned)memoryLimitStrength;
- (unsigned)role;
- (unsigned)terminationResistance;
@end

@implementation RBProcessState

- (RBProcessState)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcessState.m" lineNumber:239 description:@"-init is not allowed on RBProcessState"];

  return 0LL;
}

- (RBProcessState)initWithIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBProcessState.m", 244, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBProcessState;
  v6 = -[RBProcessState init](&v11, sel_init);
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identity = v6->_identity;
    v6->_identity = (RBSProcessIdentity *)v7;

    *(_WORD *)&v6->_role = 257;
    v6->_terminationResistance = 20;
    objc_storeStrong((id *)&v6->_memoryLimitCategory, (id)*MEMORY[0x189612470]);
    v6->_memoryLimitStrength = 0;
    v6->_memoryLimit = 0;
    v6->_coalitionLevel = 0LL;
  }

  return v6;
}

- (id)_initWithProcessState:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)&OBJC_CLASS___RBProcessState;
    v4 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      *((_WORD *)a1 + 60) = *((_WORD *)v3 + 60);
      *((_BYTE *)a1 + 89) = *((_BYTE *)v3 + 89);
      a1[12] = v3[12];
      objc_storeStrong(a1 + 13, v3[13]);
      *((_BYTE *)a1 + 112) = *((_BYTE *)v3 + 112);
      *((_DWORD *)a1 + 29) = *((_DWORD *)v3 + 29);
      *((_BYTE *)a1 + 122) = *((_BYTE *)v3 + 122);
      *((_BYTE *)a1 + 123) = *((_BYTE *)v3 + 123);
      *((_BYTE *)a1 + 88) = *((_BYTE *)v3 + 88);
      a1[10] = v3[10];
      a1[16] = v3[16];
      uint64_t v5 = [v3[7] mutableCopy];
      id v6 = a1[7];
      a1[7] = (id)v5;

      uint64_t v7 = [v3[8] mutableCopy];
      id v8 = a1[8];
      a1[8] = (id)v7;

      uint64_t v9 = [v3[9] mutableCopy];
      id v10 = a1[9];
      a1[9] = (id)v9;

      uint64_t v11 = [v3[6] mutableCopy];
      id v12 = a1[6];
      a1[6] = (id)v11;

      uint64_t v13 = [v3[3] mutableCopy];
      id v14 = a1[3];
      a1[3] = (id)v13;

      uint64_t v15 = [v3[4] mutableCopy];
      id v16 = a1[4];
      a1[4] = (id)v15;

      uint64_t v17 = [v3[2] mutableCopy];
      id v18 = a1[2];
      a1[2] = (id)v17;

      uint64_t v19 = [v3[17] mutableCopy];
      id v20 = a1[17];
      a1[17] = (id)v19;
    }
  }

  return a1;
}

- (BOOL)preventSuspend
{
  return (self->_flags >> 6) & 1;
}

- (BOOL)isBeingDebugged
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)preventIdleSleep
{
  return (self->_flags >> 2) & 1;
}

- (BOOL)preventBaseMemoryLimitReduction
{
  return (self->_flags >> 7) & 1;
}

- (BOOL)jetsamLenientMode
{
  return (self->_flags >> 3) & 1;
}

- (BOOL)throttleBestEffortNetworking
{
  return (self->_flags >> 4) & 1;
}

- (BOOL)forceRoleManage
{
  return (self->_flags >> 5) & 1;
}

- (BOOL)targetedBySuspendableAssertion
{
  return HIBYTE(self->_flags) & 1;
}

- (BOOL)carPlayMode
{
  return (self->_flags >> 9) & 1;
}

- (unint64_t)effectiveMaxCPUUsageViolationPolicy
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_role];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  unint64_t v5 = [v4 violationPolicy];

  return v5;
}

- (unint64_t)effectiveMaxCPUDuration
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_role];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  unint64_t v5 = [v4 duration];

  return v5;
}

- (unint64_t)effectiveMaxCPUPercentage
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_role];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  unint64_t v5 = [v4 percentage];

  return v5;
}

- (unint64_t)effectiveMinCPUDuration
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_role];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v3);
  unint64_t v5 = [v4 duration];

  return v5;
}

- (unint64_t)effectiveMinCPUPercentage
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_role];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v3);
  unint64_t v5 = [v4 percentage];

  return v5;
}

- (BOOL)effectiveJetsamLenientMode
{
  return (self->_flags & 8) != 0 && self->_explicitJetsamBand > 0x28;
}

- (RBInheritanceCollection)inheritances
{
  return (RBInheritanceCollection *)(id)-[RBInheritanceCollection copy]( self->_inheritances,  "copy");
}

- (id)inheritancesForEnvironment:(id)a3
{
  return -[RBInheritanceCollection inheritancesForEnvironment:](self->_inheritances, "inheritancesForEnvironment:", a3);
}

- (id)maxCPUUsageLimitsForRole:(unsigned __int8)a3
{
  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:a3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)minCPUUsageLimitsForRole:(unsigned __int8)a3
{
  minCPULimitsByRole = self->_minCPULimitsByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:a3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAppNapEqualToProcessState:(id)a3
{
  return 1;
}

- (uint64_t)_isEqualToProcessStateIgnoringIdentityAndInheritances:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  uint64_t v5 = 0LL;
  if (a1 && v3)
  {
    if (*(unsigned __int16 *)(a1 + 120) != *((unsigned __int16 *)v3 + 60)
      || *(unsigned __int8 *)(a1 + 89) != *((unsigned __int8 *)v3 + 89)
      || *(void *)(a1 + 96) != v3[12]
      || *(void *)(a1 + 104) != v3[13]
      || *(unsigned __int8 *)(a1 + 112) != *((unsigned __int8 *)v3 + 112)
      || *(unsigned __int8 *)(a1 + 122) != *((unsigned __int8 *)v3 + 122)
      || *(unsigned __int8 *)(a1 + 123) != *((unsigned __int8 *)v3 + 123)
      || *(void *)(a1 + 128) != v3[16]
      || *(unsigned __int8 *)(a1 + 88) != *((unsigned __int8 *)v3 + 88)
      || *(void *)(a1 + 80) != v3[10])
    {
      goto LABEL_43;
    }

    id v6 = *(const __CFDictionary **)(a1 + 24);
    uint64_t v7 = (const __CFDictionary *)v4[3];
    if (v6 != v7)
    {
      uint64_t v5 = 0LL;
      if (!v6 || !v7) {
        goto LABEL_44;
      }
      id v8 = *(void **)(a1 + 24);
      CFIndex Count = CFDictionaryGetCount(v6);
    }

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = (void *)v4[4];
    if (v10 != v11)
    {
      uint64_t v5 = 0LL;
      if (!v10 || !v11) {
        goto LABEL_44;
      }
      id v12 = (const __CFDictionary *)v4[4];
      CFIndex v13 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
    }

    id v14 = *(const __CFSet **)(a1 + 48);
    uint64_t v15 = (const __CFSet *)v4[6];
    if (v14 != v15)
    {
      uint64_t v5 = 0LL;
      if (!v14 || !v15) {
        goto LABEL_44;
      }
      CFIndex v16 = CFSetGetCount(*(CFSetRef *)(a1 + 48));
    }

    uint64_t v17 = *(const __CFSet **)(a1 + 56);
    id v18 = (const __CFSet *)v4[7];
    if (v17 != v18)
    {
      uint64_t v5 = 0LL;
      if (!v17 || !v18) {
        goto LABEL_44;
      }
      CFIndex v19 = CFSetGetCount(*(CFSetRef *)(a1 + 56));
    }

    id v20 = *(const __CFSet **)(a1 + 64);
    v21 = (const __CFSet *)v4[8];
    if (v20 != v21)
    {
      uint64_t v5 = 0LL;
      if (!v20 || !v21) {
        goto LABEL_44;
      }
      CFIndex v22 = CFSetGetCount(*(CFSetRef *)(a1 + 64));
    }

    v23 = *(const __CFSet **)(a1 + 72);
    v24 = (const __CFSet *)v4[9];
    if (v23 == v24)
    {
      uint64_t v5 = 1LL;
      goto LABEL_44;
    }

    uint64_t v5 = 0LL;
    if (v23 && v24)
    {
      CFIndex v25 = CFSetGetCount(v23);
      if (v25 == CFSetGetCount(v24))
      {
        uint64_t v5 = -[__CFSet isEqualToSet:](v23, "isEqualToSet:", v24);
        goto LABEL_44;
      }

- (BOOL)isEqualToProcessStateIgnoringIdentity:(id)a3
{
  v4 = (RBProcessState *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  if (!-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    char v7 = 0;
    goto LABEL_9;
  }

  inheritances = self->_inheritances;
  id v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_7:
    char v7 = 1;
  }

  else
  {
    char v7 = 0;
    if (inheritances && v6) {
      char v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
    }
  }

- (BOOL)isEqualToProcessStateIgnoringInheritances:(id)a3
{
  v4 = (RBProcessState *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }

  else if (-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    char v5 = -[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:", v4->_identity);
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)clientStateForProcess:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1896122D0]) initWithIdentity:self->_identity];
    goto LABEL_8;
  }

  [v4 handle];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 isTerminating])
  {
LABEL_8:
    unsigned __int8 v7 = 1;
    goto LABEL_9;
  }

  if ([v5 isReported])
  {
    if (-[RBProcessState preventSuspend](self, "preventSuspend")) {
      unsigned __int8 v7 = 4;
    }
    else {
      unsigned __int8 v7 = 3;
    }
  }

  else
  {
    unsigned __int8 v7 = 2;
  }

- (id)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = (void *)[v2 initWithFormat:@"<%@| role:%@>", v3, v4];

  return v5;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  -[NSMutableSet allObjects](self->_legacyAssertions, "allObjects");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  -[NSMutableSet allObjects](self->_primitiveAssertions, "allObjects");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  -[NSMutableSet allObjects](self->_endowmentInfos, "allObjects");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  id v46 = objc_alloc(NSString);
  uint64_t v49 = [(id)objc_opt_class() description];
  uint64_t v11 = -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  uint64_t v47 = NSStringFromRBSRole();
  NSStringFromRBSGPURole();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t explicitJetsamBand_low = LODWORD(self->_explicitJetsamBand);
  unint64_t coalitionLevel = self->_coalitionLevel;
  memoryLimitCategory = self->_memoryLimitCategory;
  NSStringFromRBSMemoryLimitStrength();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t flags = self->_flags;
  if (self->_guaranteedRunning) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  unint64_t legacyFinishTaskReason = self->_legacyFinishTaskReason;
  v41 = v12;
  inheritances = self->_inheritances;
  id v14 = @" inheritances:";
  if (!inheritances)
  {
    id v14 = &stru_18A257E48;
    inheritances = (RBInheritanceCollection *)&stru_18A257E48;
  }

  v38 = inheritances;
  v39 = v14;
  uint64_t v15 = @" attributes:[\n\t";
  if (!v4) {
    uint64_t v15 = &stru_18A257E48;
  }
  v37 = v15;
  uint64_t v51 = v4;
  if (v4)
  {
    v35 = -[NSMutableSet allObjects](self->_tags, "allObjects");
    [v35 componentsJoinedByString:@",\n\t"];
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = @"\n\t]";
  }

  else
  {
    v36 = &stru_18A257E48;
    v52 = &stru_18A257E48;
  }

  v48 = (void *)v11;
  if (v6) {
    CFIndex v16 = @" legacyAssertions:[\n\t";
  }
  else {
    CFIndex v16 = &stru_18A257E48;
  }
  uint64_t v50 = v6;
  if (v6)
  {
    v34 = -[NSMutableSet allObjects](self->_legacyAssertions, "allObjects");
    [v34 componentsJoinedByString:@",\n\t"];
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v18 = @"\n\t]";
  }

  else
  {
    id v18 = &stru_18A257E48;
    uint64_t v17 = &stru_18A257E48;
  }

  if (v8) {
    CFIndex v19 = @" primitiveAssertions:[\n\t";
  }
  else {
    CFIndex v19 = &stru_18A257E48;
  }
  if (v8)
  {
    v33 = -[NSMutableSet allObjects](self->_primitiveAssertions, "allObjects");
    [v33 componentsJoinedByString:@",\n\t"];
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = @"\n\t]";
    if (v10)
    {
LABEL_22:
      -[NSMutableSet allObjects](self->_endowmentInfos, "allObjects");
      CFIndex v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 componentsJoinedByString:@",\n\t"];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      v29 = v18;
      v24 = (void *)v47;
      CFIndex v25 = v48;
      v26 = (void *)v49;
      v27 = (void *)[v46 initWithFormat:@"<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36, v16, v17, v29, v31, v20, v21, @" endowments:[\n\t", v23, @"\n\t]"];

      goto LABEL_25;
    }
  }

  else
  {
    v21 = &stru_18A257E48;
    uint64_t v20 = &stru_18A257E48;
    if (v10) {
      goto LABEL_22;
    }
  }

  v32 = v19;
  v30 = v18;
  v24 = (void *)v47;
  CFIndex v25 = v48;
  v26 = (void *)v49;
  v27 = (void *)[v46 initWithFormat:@"<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>", v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36, v16, v17, v30, v32, v20, v21, &stru_18A257E48, &stru_18A257E48, &stru_18A257E48];
LABEL_25:
  if (v8)
  {
  }

  if (v50)
  {
  }

  if (v51)
  {
  }

  return v27;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBProcessState *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4)
    || !-[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:", v4->_identity))
  {
    char v7 = 0;
    goto LABEL_11;
  }

  inheritances = self->_inheritances;
  uint64_t v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_10:
    char v7 = 1;
    goto LABEL_11;
  }

  char v7 = 0;
  if (inheritances && v6) {
    char v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
  }
LABEL_11:

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBProcessState _initWithProcessState:]( (id *)+[RBMutableProcessState allocWithZone:](&OBJC_CLASS___RBMutableProcessState, "allocWithZone:", a3),  self);
}

- (unsigned)terminationResistance
{
  return self->_terminationResistance;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (unint64_t)explicitJetsamBand
{
  return self->_explicitJetsamBand;
}

- (NSString)memoryLimitCategory
{
  return self->_memoryLimitCategory;
}

- (unsigned)memoryLimitStrength
{
  return self->_memoryLimitStrength;
}

- (int)memoryLimit
{
  return self->_memoryLimit;
}

- (unsigned)role
{
  return self->_role;
}

- (unsigned)gpuRole
{
  return self->_gpuRole;
}

- (NSSet)preventIdleSleepIdentifiers
{
  return &self->_preventIdleSleepIdentifiers->super;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

- (NSSet)legacyAssertions
{
  return &self->_legacyAssertions->super;
}

- (NSSet)primitiveAssertions
{
  return &self->_primitiveAssertions->super;
}

- (unint64_t)legacyFinishTaskReason
{
  return self->_legacyFinishTaskReason;
}

- (BOOL)guaranteedRunning
{
  return self->_guaranteedRunning;
}

- (unint64_t)coalitionLevel
{
  return self->_coalitionLevel;
}

- (NSSet)endowmentInfos
{
  return &self->_endowmentInfos->super;
}

- (NSSet)preventLaunchReasons
{
  return self->_preventLaunchReasons;
}

- (void).cxx_destruct
{
}

@end