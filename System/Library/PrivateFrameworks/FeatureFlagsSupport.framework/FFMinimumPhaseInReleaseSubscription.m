@interface FFMinimumPhaseInReleaseSubscription
+ (id)decodeFromDictionary:(id)a3;
+ (id)mergeSubscriptions:(id)a3;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5;
- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5;
- (BOOL)matchesFeatureWithState:(id)a3 inConfigurationOfUnknownLockState:(id)a4;
- (FFMinimumPhaseInReleaseSubscription)initWithPhase:(id)a3 targetRelease:(id)a4;
- (NSString)minimumPhase;
- (NSString)targetRelease;
- (id)encodeToDictionary;
- (id)nameOfClass;
@end

@implementation FFMinimumPhaseInReleaseSubscription

- (FFMinimumPhaseInReleaseSubscription)initWithPhase:(id)a3 targetRelease:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FFMinimumPhaseInReleaseSubscription;
  v9 = -[FFSubscription initPrivate](&v12, sel_initPrivate);
  v10 = (FFMinimumPhaseInReleaseSubscription *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_targetRelease, a4);
  }

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inConfiguration:(id)a5
{
  id v8 = a5;
  [v8 stateForFeature:a3 domain:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    BOOL v10 = -[FFMinimumPhaseInReleaseSubscription matchesFeatureWithState:inConfigurationOfUnknownLockState:]( self,  "matchesFeatureWithState:inConfigurationOfUnknownLockState:",  v9,  v8);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)matchesFeature:(id)a3 inDomain:(id)a4 inAlreadyLockedConfiguration:(id)a5
{
  id v8 = a5;
  [v8 resolvedStateForFeature:a3 domain:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    BOOL v10 = -[FFMinimumPhaseInReleaseSubscription matchesFeatureWithState:inConfigurationOfUnknownLockState:]( self,  "matchesFeatureWithState:inConfigurationOfUnknownLockState:",  v9,  v8);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)matchesFeatureWithState:(id)a3 inConfigurationOfUnknownLockState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 attributes];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"TargetRelease"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 value];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[FFMinimumPhaseInReleaseSubscription targetRelease](self, "targetRelease"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 isEqualToString:v11],
        v11,
        v12))
  {
    [v6 phase];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      unsigned int v14 = [v7 sortValueForPhase:v13];
      v15 = -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
      unsigned int v16 = [v7 sortValueForPhase:v15];

      if (v14 && v16)
      {
        char v17 = v14 >= v16;
      }

      else
      {
        v18 = -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
        char v17 = [v13 isEqualToString:v18];
      }
    }

    else
    {
      char v17 = 0;
    }
  }

  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)mergeSubscriptions:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)encodeToDictionary
{
  v8[2] = *MEMORY[0x1895F89C0];
  v7[0] = @"MinimumPhase";
  -[FFMinimumPhaseInReleaseSubscription minimumPhase](self, "minimumPhase");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = @"TargetRelease";
  v8[0] = v3;
  v4 = -[FFMinimumPhaseInReleaseSubscription targetRelease](self, "targetRelease");
  v8[1] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeFromDictionary:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"MinimumPhase"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 objectForKeyedSubscript:@"TargetRelease"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = -[FFMinimumPhaseInReleaseSubscription initWithPhase:targetRelease:]( objc_alloc(&OBJC_CLASS___FFMinimumPhaseInReleaseSubscription),  "initWithPhase:targetRelease:",  v4,  v5);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)nameOfClass
{
  return @"FFMinimumPhaseInReleaseSubscription";
}

- (NSString)targetRelease
{
  return self->_targetRelease;
}

- (NSString)minimumPhase
{
  return self->_minimumPhase;
}

- (void).cxx_destruct
{
}

@end