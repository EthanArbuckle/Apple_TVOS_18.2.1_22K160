@interface RBMutableProcessState
- (id)copyWithZone:(_NSZone *)a3;
- (void)addEndowmentInfo:(id)a3;
- (void)addInheritance:(id)a3;
- (void)addLegacyAssertion:(id)a3;
- (void)addPreventIdleSleepIdentifier:(id)a3;
- (void)addRBAssertion:(id)a3;
- (void)addTag:(id)a3;
- (void)removeAllEndowmentInfos;
- (void)removeAllInheritances;
- (void)removeAllPreventIdleSleepIdentifiers;
- (void)removeEndowmentInfo:(id)a3;
- (void)removeInheritance:(id)a3;
- (void)removePreventIdleSleepIdentifier:(id)a3;
- (void)setCarPlayMode:(BOOL)a3;
- (void)setCoalitionLevel:(unint64_t)a3;
- (void)setExplicitJetsamBand:(unint64_t)a3;
- (void)setForceRoleManage:(BOOL)a3;
- (void)setGPURole:(unsigned __int8)a3;
- (void)setGuaranteedRunning:(BOOL)a3;
- (void)setIsBeingDebugged:(BOOL)a3;
- (void)setJetsamLenientMode:(BOOL)a3;
- (void)setLegacyFinishTaskReason:(unint64_t)a3;
- (void)setMaxCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4;
- (void)setMemoryLimit:(int)a3;
- (void)setMemoryLimitCategory:(id)a3;
- (void)setMemoryLimitStrength:(unsigned __int8)a3;
- (void)setMinCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4;
- (void)setPreventBaseMemoryLimitReduction:(BOOL)a3;
- (void)setPreventIdleSleep:(BOOL)a3;
- (void)setPreventSuspend:(BOOL)a3;
- (void)setRole:(unsigned __int8)a3;
- (void)setTargetedBySuspendableAssertion:(BOOL)a3;
- (void)setTerminationResistance:(unsigned __int8)a3;
- (void)setThrottleBestEffortNetworking:(BOOL)a3;
- (void)unionState:(id)a3;
@end

@implementation RBMutableProcessState

- (void)unionState:(id)a3
{
  v4 = (RBMutableProcessState *)a3;
  if (v4 && v4 != self)
  {
    self->super._flags |= v4->super._flags;
    unsigned int terminationResistance = self->super._terminationResistance;
    if (terminationResistance <= v4->super._terminationResistance) {
      LOBYTE(terminationResistance) = v4->super._terminationResistance;
    }
    self->super._unsigned int terminationResistance = terminationResistance;
    unint64_t explicitJetsamBand = self->super._explicitJetsamBand;
    if (explicitJetsamBand <= v4->super._explicitJetsamBand) {
      unint64_t explicitJetsamBand = v4->super._explicitJetsamBand;
    }
    self->super._unint64_t explicitJetsamBand = explicitJetsamBand;
    int memoryLimit = self->super._memoryLimit;
    int v8 = v4->super._memoryLimit;
    v45 = v4;
    if (memoryLimit == v8)
    {
      unsigned int memoryLimitStrength = self->super._memoryLimitStrength;
      if (memoryLimitStrength <= v4->super._memoryLimitStrength) {
        LOBYTE(memoryLimitStrength) = v4->super._memoryLimitStrength;
      }
      self->super._unsigned int memoryLimitStrength = memoryLimitStrength;
    }

    else if (memoryLimit < v8)
    {
      objc_storeStrong((id *)&self->super._memoryLimitCategory, v4->super._memoryLimitCategory);
      v4 = v45;
      self->super._unsigned int memoryLimitStrength = v45->super._memoryLimitStrength;
      self->super._int memoryLimit = v45->super._memoryLimit;
    }

    unsigned int role = self->super._role;
    if (role <= v4->super._role) {
      LOBYTE(role) = v4->super._role;
    }
    self->super._unsigned int role = role;
    unsigned int gpuRole = self->super._gpuRole;
    if (gpuRole <= v4->super._gpuRole) {
      LOBYTE(gpuRole) = v4->super._gpuRole;
    }
    self->super._unsigned int gpuRole = gpuRole;
    BOOL v12 = self->super._guaranteedRunning || v4->super._guaranteedRunning;
    self->super._guaranteedRunning = v12;
    unint64_t coalitionLevel = self->super._coalitionLevel;
    if (coalitionLevel <= v4->super._coalitionLevel) {
      unint64_t coalitionLevel = v4->super._coalitionLevel;
    }
    self->super._unint64_t coalitionLevel = coalitionLevel;
    unint64_t legacyFinishTaskReason = v4->super._legacyFinishTaskReason;
    if (legacyFinishTaskReason && self->super._legacyFinishTaskReason - 1 >= legacyFinishTaskReason) {
      self->super._unint64_t legacyFinishTaskReason = legacyFinishTaskReason;
    }
    v15 = v4->super._preventIdleSleepIdentifiers;
    if (-[NSMutableSet count](v15, "count"))
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        -[NSMutableSet unionSet:](preventIdleSleepIdentifiers, "unionSet:", v15);
      }

      else
      {
        v17 = (NSMutableSet *)-[NSMutableSet mutableCopy](v15, "mutableCopy");
        v18 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v17;
      }
    }

    v19 = v45->super._minCPULimitsByRole;
    if (-[NSMutableDictionary count](v19, "count"))
    {
      if (self->super._minCPULimitsByRole)
      {
        v47[0] = MEMORY[0x1895F87A8];
        v47[1] = 3221225472LL;
        v47[2] = __36__RBMutableProcessState_unionState___block_invoke;
        v47[3] = &unk_18A256188;
        v47[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19, "enumerateKeysAndObjectsUsingBlock:", v47);
      }

      else
      {
        v20 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v19, "mutableCopy");
        minCPULimitsByRole = self->super._minCPULimitsByRole;
        self->super._minCPULimitsByRole = v20;
      }
    }

    v22 = v45->super._maxCPULimitsByRole;
    if (-[NSMutableDictionary count](v22, "count"))
    {
      if (self->super._maxCPULimitsByRole)
      {
        v46[0] = MEMORY[0x1895F87A8];
        v46[1] = 3221225472LL;
        v46[2] = __36__RBMutableProcessState_unionState___block_invoke_2;
        v46[3] = &unk_18A2561B0;
        v46[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v46);
      }

      else
      {
        v23 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v22, "mutableCopy");
        maxCPULimitsByRole = self->super._maxCPULimitsByRole;
        self->super._maxCPULimitsByRole = v23;
      }
    }

    v25 = v45->super._inheritances;
    if (-[RBInheritanceCollection count](v25, "count"))
    {
      inheritances = self->super._inheritances;
      if (inheritances)
      {
        -[RBInheritanceCollection unionCollection:](inheritances, "unionCollection:", v25);
      }

      else
      {
        v27 = (RBInheritanceCollection *)-[RBInheritanceCollection mutableCopy](v25, "mutableCopy");
        v28 = self->super._inheritances;
        self->super._inheritances = v27;
      }
    }

    v29 = v45->super._tags;
    if (-[NSMutableSet count](v29, "count"))
    {
      tags = self->super._tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v29);
      }

      else
      {
        v31 = (NSMutableSet *)-[NSMutableSet mutableCopy](v29, "mutableCopy");
        v32 = self->super._tags;
        self->super._tags = v31;
      }
    }

    v33 = v45->super._legacyAssertions;
    if (-[NSMutableSet count](v33, "count"))
    {
      legacyAssertions = self->super._legacyAssertions;
      if (legacyAssertions)
      {
        -[NSMutableSet unionSet:](legacyAssertions, "unionSet:", v33);
      }

      else
      {
        v35 = (NSMutableSet *)-[NSMutableSet mutableCopy](v33, "mutableCopy");
        v36 = self->super._legacyAssertions;
        self->super._legacyAssertions = v35;
      }
    }

    v37 = v45->super._primitiveAssertions;
    if (-[NSMutableSet count](v37, "count"))
    {
      primitiveAssertions = self->super._primitiveAssertions;
      if (primitiveAssertions)
      {
        -[NSMutableSet unionSet:](primitiveAssertions, "unionSet:", v37);
      }

      else
      {
        v39 = (NSMutableSet *)-[NSMutableSet mutableCopy](v37, "mutableCopy");
        v40 = self->super._primitiveAssertions;
        self->super._primitiveAssertions = v39;
      }
    }

    v41 = v45->super._endowmentInfos;
    if (-[NSMutableSet count](v41, "count"))
    {
      endowmentInfos = self->super._endowmentInfos;
      if (endowmentInfos)
      {
        -[NSMutableSet unionSet:](endowmentInfos, "unionSet:", v41);
      }

      else
      {
        v43 = (NSMutableSet *)-[NSMutableSet mutableCopy](v41, "mutableCopy");
        v44 = self->super._endowmentInfos;
        self->super._endowmentInfos = v43;
      }
    }

    v4 = v45;
  }
}

void __36__RBMutableProcessState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v6 = a3;
  id v7 = a2;
  [v5 objectForKey:v7];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 unionLimit:v9];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v8 forKey:v7];
}

void __36__RBMutableProcessState_unionState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v6 = a3;
  id v7 = a2;
  [v5 objectForKey:v7];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 unionLimit:v9];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:v7];
}

- (void)setPreventSuspend:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFBF | v3;
}

- (void)setTerminationResistance:(unsigned __int8)a3
{
  self->super._unsigned int terminationResistance = a3;
}

- (void)setIsBeingDebugged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFD | v3;
}

- (void)setExplicitJetsamBand:(unint64_t)a3
{
  self->super._unint64_t explicitJetsamBand = a3;
}

- (void)setJetsamLenientMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFF7 | v3;
}

- (void)setTargetedBySuspendableAssertion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFEFF | v3;
}

- (void)setCoalitionLevel:(unint64_t)a3
{
  self->super._unint64_t coalitionLevel = a3;
}

- (void)setMemoryLimitCategory:(id)a3
{
}

- (void)setMemoryLimitStrength:(unsigned __int8)a3
{
  self->super._unsigned int memoryLimitStrength = a3;
}

- (void)setMemoryLimit:(int)a3
{
  self->super._int memoryLimit = a3;
}

- (void)setLegacyFinishTaskReason:(unint64_t)a3
{
  self->super._unint64_t legacyFinishTaskReason = a3;
}

- (void)addPreventIdleSleepIdentifier:(id)a3
{
  id v4 = a3;
  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  id v8 = v4;
  if (!preventIdleSleepIdentifiers)
  {
    [MEMORY[0x189603FE0] set];
    id v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = v6;

    id v4 = v8;
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  }

  -[NSMutableSet addObject:](preventIdleSleepIdentifiers, "addObject:", v4);
}

- (void)removePreventIdleSleepIdentifier:(id)a3
{
  if (!-[NSMutableSet count](self->super._preventIdleSleepIdentifiers, "count"))
  {
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = 0LL;
  }

- (void)removeAllPreventIdleSleepIdentifiers
{
  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  self->super._preventIdleSleepIdentifiers = 0LL;
}

- (void)setMinCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v15 = v6;
    minCPULimitsByRole = self->super._minCPULimitsByRole;
    if (!minCPULimitsByRole)
    {
      [MEMORY[0x189603FC8] dictionary];
      id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      id v9 = self->super._minCPULimitsByRole;
      self->super._minCPULimitsByRole = v8;

      minCPULimitsByRole = self->super._minCPULimitsByRole;
    }

    [MEMORY[0x189607968] numberWithUnsignedChar:v4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v10);
    [v15 unionLimit:v11];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->super._minCPULimitsByRole;
    [MEMORY[0x189607968] numberWithUnsignedChar:v4];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    id v6 = v15;
  }
}

- (void)setPreventIdleSleep:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFB | v3;
}

- (void)setPreventBaseMemoryLimitReduction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFF7F | v3;
}

- (void)setRole:(unsigned __int8)a3
{
  self->super._unsigned int role = a3;
}

- (void)setGPURole:(unsigned __int8)a3
{
  self->super._unsigned int gpuRole = a3;
}

- (void)setThrottleBestEffortNetworking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFEF | v3;
}

- (void)setForceRoleManage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFDF | v3;
}

- (void)setGuaranteedRunning:(BOOL)a3
{
  self->super._guaranteedRunning = a3;
}

- (void)setCarPlayMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFDFF | v3;
}

- (void)addEndowmentInfo:(id)a3
{
  id v4 = a3;
  endowmentInfos = self->super._endowmentInfos;
  id v8 = v4;
  if (!endowmentInfos)
  {
    [MEMORY[0x189603FE0] set];
    id v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->super._endowmentInfos;
    self->super._endowmentInfos = v6;

    id v4 = v8;
    endowmentInfos = self->super._endowmentInfos;
  }

  -[NSMutableSet addObject:](endowmentInfos, "addObject:", v4);
}

- (void)removeEndowmentInfo:(id)a3
{
  endowmentInfos = self->super._endowmentInfos;
  [MEMORY[0x189604010] setWithObject:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](endowmentInfos, "minusSet:", v5);

  if (!-[NSMutableSet count](self->super._endowmentInfos, "count"))
  {
    id v6 = self->super._endowmentInfos;
    self->super._endowmentInfos = 0LL;
  }

- (void)removeAllEndowmentInfos
{
  endowmentInfos = self->super._endowmentInfos;
  self->super._endowmentInfos = 0LL;
}

- (void)addInheritance:(id)a3
{
  id v4 = a3;
  inheritances = self->super._inheritances;
  id v13 = v4;
  if (!inheritances)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___RBMutableInheritanceCollection);
    id v7 = self->super._inheritances;
    self->super._inheritances = &v6->super;

    id v4 = v13;
    inheritances = self->super._inheritances;
  }

  -[RBInheritanceCollection addInheritance:](inheritances, "addInheritance:", v4);
  id v8 = objc_alloc(MEMORY[0x1896122B0]);
  [v13 endowmentNamespace];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 environment];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodedEndowment];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = (void *)[v8 _initWithNamespace:v9 environment:v10 encodedEndowment:v11];

  -[RBMutableProcessState addEndowmentInfo:](self, "addEndowmentInfo:", v12);
}

- (void)removeInheritance:(id)a3
{
  inheritances = self->super._inheritances;
  id v5 = a3;
  -[RBInheritanceCollection removeInheritance:](inheritances, "removeInheritance:", v5);
  if (!-[RBInheritanceCollection count](self->super._inheritances, "count"))
  {
    id v6 = self->super._inheritances;
    self->super._inheritances = 0LL;
  }

  id v7 = objc_alloc(MEMORY[0x1896122B0]);
  [v5 endowmentNamespace];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 environment];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodedEndowment];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = (id)[v7 _initWithNamespace:v8 environment:v9 encodedEndowment:v10];
  -[RBMutableProcessState removeEndowmentInfo:](self, "removeEndowmentInfo:", v11);
}

- (void)removeAllInheritances
{
  inheritances = self->super._inheritances;
  self->super._inheritances = 0LL;

  -[RBMutableProcessState removeAllEndowmentInfos](self, "removeAllEndowmentInfos");
}

- (void)setMaxCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v15 = v6;
    maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    if (!maxCPULimitsByRole)
    {
      [MEMORY[0x189603FC8] dictionary];
      id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      id v9 = self->super._maxCPULimitsByRole;
      self->super._maxCPULimitsByRole = v8;

      maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    }

    [MEMORY[0x189607968] numberWithUnsignedChar:v4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v15 unionLimit:v11];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = self->super._maxCPULimitsByRole;
    [MEMORY[0x189607968] numberWithUnsignedChar:v4];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    id v6 = v15;
  }
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  tags = self->super._tags;
  id v8 = v4;
  if (!tags)
  {
    [MEMORY[0x189603FE0] set];
    id v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->super._tags;
    self->super._tags = v6;

    id v4 = v8;
    tags = self->super._tags;
  }

  -[NSMutableSet addObject:](tags, "addObject:", v4);
}

- (void)addLegacyAssertion:(id)a3
{
  id v4 = a3;
  legacyAssertions = self->super._legacyAssertions;
  id v8 = v4;
  if (!legacyAssertions)
  {
    [MEMORY[0x189603FE0] set];
    id v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->super._legacyAssertions;
    self->super._legacyAssertions = v6;

    id v4 = v8;
    legacyAssertions = self->super._legacyAssertions;
  }

  -[NSMutableSet addObject:](legacyAssertions, "addObject:", v4);
}

- (void)addRBAssertion:(id)a3
{
  id v4 = a3;
  primitiveAssertions = self->super._primitiveAssertions;
  id v8 = v4;
  if (!primitiveAssertions)
  {
    [MEMORY[0x189603FE0] set];
    id v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->super._primitiveAssertions;
    self->super._primitiveAssertions = v6;

    id v4 = v8;
    primitiveAssertions = self->super._primitiveAssertions;
  }

  -[NSMutableSet addObject:](primitiveAssertions, "addObject:", v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBProcessState _initWithProcessState:]( (id *)+[RBProcessState allocWithZone:](&OBJC_CLASS___RBProcessState, "allocWithZone:", a3),  self);
}

@end