@interface RBMutableSystemState
- (RBMutableSystemState)init;
- (void)addAllowLaunchPredicate:(id)a3;
- (void)addPreventIdleSleepIdentifier:(id)a3;
- (void)addPreventLaunchPredicate:(id)a3;
- (void)addTag:(id)a3;
- (void)prewarmIdentity:(id)a3 withInterval:(double)a4;
- (void)removeAllPreventIdleSleepIdentifiers;
- (void)removePreventIdleSleepIdentifier:(id)a3;
- (void)setPreventIdleSleep:(BOOL)a3;
- (void)setPreventLaunch:(BOOL)a3;
- (void)unionState:(id)a3;
- (void)upgradeCondition:(id)a3 toValue:(int64_t)a4;
@end

@implementation RBMutableSystemState

- (RBMutableSystemState)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBMutableSystemState;
  return (RBMutableSystemState *)-[RBSystemState _init](&v3, sel__init);
}

- (void)unionState:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v4 = (RBMutableSystemState *)a3;
  v5 = v4;
  if (v4 && v4 != self)
  {
    self->super._preventIdleSleep |= v4->super._preventIdleSleep;
    self->super._preventLaunch |= v4->super._preventLaunch;
    v6 = v4->super._preventIdleSleepIdentifiers;
    if (-[NSMutableSet count](v6, "count"))
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        -[NSMutableSet unionSet:](preventIdleSleepIdentifiers, "unionSet:", v6);
      }

      else
      {
        v8 = (NSMutableSet *)-[NSMutableSet mutableCopy](v6, "mutableCopy");
        v9 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v8;
      }
    }

    v10 = v5->super._tags;
    if (-[NSMutableSet count](v10, "count"))
    {
      tags = self->super._tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v10);
      }

      else
      {
        v12 = (NSMutableSet *)-[NSMutableSet mutableCopy](v10, "mutableCopy");
        v13 = self->super._tags;
        self->super._tags = v12;
      }
    }

    v30 = v6;
    v14 = v5->super._preventLaunchPredicates;
    if (-[NSMutableSet count](v14, "count"))
    {
      preventLaunchPredicates = self->super._preventLaunchPredicates;
      if (preventLaunchPredicates)
      {
        -[NSMutableSet unionSet:](preventLaunchPredicates, "unionSet:", v14, v6);
      }

      else
      {
        v16 = (NSMutableSet *)-[NSMutableSet mutableCopy](v14, "mutableCopy", v6);
        v17 = self->super._preventLaunchPredicates;
        self->super._preventLaunchPredicates = v16;
      }
    }

    v18 = v5->super._allowLaunchPredicates;

    if (-[NSMutableSet count](v18, "count"))
    {
      allowLaunchPredicates = self->super._allowLaunchPredicates;
      if (allowLaunchPredicates)
      {
        -[NSMutableSet unionSet:](allowLaunchPredicates, "unionSet:", v18);
      }

      else
      {
        v20 = (NSMutableSet *)-[NSMutableSet mutableCopy](v18, "mutableCopy");
        v21 = self->super._allowLaunchPredicates;
        self->super._allowLaunchPredicates = v20;
      }
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v22 = -[NSMutableDictionary allKeys](v5->super._conditions, "allKeys", v30);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v28 = -[NSMutableDictionary objectForKey:](v5->super._conditions, "objectForKey:", v27);
          -[RBMutableSystemState upgradeCondition:toValue:]( self,  "upgradeCondition:toValue:",  v27,  [v28 integerValue]);
        }

        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v24);
    }

    prewarmConfiguration = v5->super._prewarmConfiguration;
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __35__RBMutableSystemState_unionState___block_invoke;
    v32[3] = &unk_18A256350;
    v32[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( prewarmConfiguration,  "enumerateKeysAndObjectsUsingBlock:",  v32);
  }
}

void __35__RBMutableSystemState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "prewarmIdentity:withInterval:", v5);
}

- (void)setPreventLaunch:(BOOL)a3
{
  self->super._preventLaunch = a3;
}

- (void)setPreventIdleSleep:(BOOL)a3
{
  self->super._preventIdleSleep = a3;
}

- (void)addPreventIdleSleepIdentifier:(id)a3
{
  id v4 = a3;
  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  id v8 = v4;
  if (!preventIdleSleepIdentifiers)
  {
    [MEMORY[0x189603FE0] set];
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = v6;

    id v4 = v8;
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  }

  -[NSMutableSet addObject:](preventIdleSleepIdentifiers, "addObject:", v4);
}

- (void)removePreventIdleSleepIdentifier:(id)a3
{
}

- (void)removeAllPreventIdleSleepIdentifiers
{
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  tags = self->super._tags;
  id v8 = v4;
  if (!tags)
  {
    [MEMORY[0x189603FE0] set];
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._tags;
    self->super._tags = v6;

    id v4 = v8;
    tags = self->super._tags;
  }

  -[NSMutableSet addObject:](tags, "addObject:", v4);
}

- (void)addPreventLaunchPredicate:(id)a3
{
  id v4 = a3;
  preventLaunchPredicates = self->super._preventLaunchPredicates;
  id v8 = v4;
  if (!preventLaunchPredicates)
  {
    [MEMORY[0x189603FE0] set];
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._preventLaunchPredicates;
    self->super._preventLaunchPredicates = v6;

    id v4 = v8;
    preventLaunchPredicates = self->super._preventLaunchPredicates;
  }

  -[NSMutableSet addObject:](preventLaunchPredicates, "addObject:", v4);
}

- (void)addAllowLaunchPredicate:(id)a3
{
  id v4 = a3;
  allowLaunchPredicates = self->super._allowLaunchPredicates;
  id v8 = v4;
  if (!allowLaunchPredicates)
  {
    [MEMORY[0x189603FE0] set];
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._allowLaunchPredicates;
    self->super._allowLaunchPredicates = v6;

    id v4 = v8;
    allowLaunchPredicates = self->super._allowLaunchPredicates;
  }

  -[NSMutableSet addObject:](allowLaunchPredicates, "addObject:", v4);
}

- (void)upgradeCondition:(id)a3 toValue:(int64_t)a4
{
  id v6 = a3;
  conditions = self->super._conditions;
  id v14 = v6;
  if (!conditions)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->super._conditions;
    self->super._conditions = v8;

    id v6 = v14;
    conditions = self->super._conditions;
  }
  v10 = -[NSMutableDictionary objectForKey:](conditions, "objectForKey:", v6);
  v11 = v10;
  if (!v10 || [v10 integerValue] < a4)
  {
    v12 = self->super._conditions;
    [MEMORY[0x189607968] numberWithInteger:a4];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v13, v14);
  }
}

- (void)prewarmIdentity:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  if (!v6) {
    -[RBMutableSystemState prewarmIdentity:withInterval:].cold.1();
  }
  id v7 = v6;
  prewarmConfiguration = self->super._prewarmConfiguration;
  id v16 = v7;
  if (!prewarmConfiguration)
  {
    [MEMORY[0x189603FC8] dictionary];
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->super._prewarmConfiguration;
    self->super._prewarmConfiguration = v9;

    id v7 = v16;
    prewarmConfiguration = self->super._prewarmConfiguration;
  }
  v11 = -[NSMutableDictionary objectForKey:](prewarmConfiguration, "objectForKey:", v7);
  v12 = v11;
  if (!v11 || ([v11 doubleValue], v13 > a4))
  {
    id v14 = self->super._prewarmConfiguration;
    [MEMORY[0x189607968] numberWithDouble:a4];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);
  }
}

- (void)prewarmIdentity:withInterval:.cold.1()
{
}

@end