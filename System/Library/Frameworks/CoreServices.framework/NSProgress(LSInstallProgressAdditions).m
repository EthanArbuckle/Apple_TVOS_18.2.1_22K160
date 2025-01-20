@interface NSProgress(LSInstallProgressAdditions)
+ (id)childProgressForBundleID:()LSInstallProgressAdditions andPhase:;
+ (id)publishingKeyForApp:()LSInstallProgressAdditions withPhase:;
+ (uint64_t)keyPathsForValuesAffectingInstallPhase;
+ (uint64_t)keyPathsForValuesAffectingInstallState;
- (id)_LSDescription;
- (uint64_t)installPhase;
- (uint64_t)installPhaseString;
- (uint64_t)installState;
- (uint64_t)ls_expectedFinalInstallPhase;
- (void)initWithParent:()LSInstallProgressAdditions bundleID:andPhase:;
- (void)ls_setExpectedFinalInstallPhase:()LSInstallProgressAdditions;
- (void)setInstallPhase:()LSInstallProgressAdditions;
- (void)setInstallState:()LSInstallProgressAdditions;
@end

@implementation NSProgress(LSInstallProgressAdditions)

- (void)initWithParent:()LSInstallProgressAdditions bundleID:andPhase:
{
  v18[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = *MEMORY[0x189607698];
  v18[0] = a4;
  v17[0] = v7;
  v17[1] = @"installPhase";
  v8 = (void *)MEMORY[0x189607968];
  id v9 = a4;
  [v8 numberWithUnsignedInteger:a5];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = @"installState";
  [MEMORY[0x189607968] numberWithUnsignedInteger:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v18[3] = v9;
  v17[3] = @"bundleID";
  v17[4] = @"expectedFinalInstallPhase";
  v18[4] = &unk_189DA8188;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)[a1 initWithParent:0 userInfo:v12];
  v14 = v13;
  if (v13)
  {
    [v13 setTotalUnitCount:100];
    [v14 setCompletedUnitCount:0];
    if (a5 <= 4 && ((1LL << a5) & 0x19) != 0)
    {
      BOOL v15 = 1LL;
      [v14 setPausable:1];
      [v14 setCancellable:1];
    }

    else
    {
      [v14 setPausable:0];
      [v14 setCancellable:0];
      BOOL v15 = a5 == 1;
    }

    [v14 setPrioritizable:v15];
  }

  return v14;
}

+ (id)childProgressForBundleID:()LSInstallProgressAdditions andPhase:
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[[a1 alloc] initWithParent:0 bundleID:v6 andPhase:a4];

  return v7;
}

+ (id)publishingKeyForApp:()LSInstallProgressAdditions withPhase:
{
  v5 = (void *)NSString;
  id v6 = a3;
  [v5 NSStringFromLSInstallPhase:a4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"%@.%@", v6, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)keyPathsForValuesAffectingInstallState
{
  return [MEMORY[0x189604010] setWithObject:@"userInfo.installState"];
}

+ (uint64_t)keyPathsForValuesAffectingInstallPhase
{
  return objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"userInfo.installPhase",  @"userInfo.expectedFinalInstallPhase",  0);
}

- (void)setInstallState:()LSInstallProgressAdditions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"installState"];
}

- (uint64_t)installState
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"installState"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (void)setInstallPhase:()LSInstallProgressAdditions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"installPhase"];
}

- (uint64_t)installPhase
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"installPhase"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [v2 unsignedIntegerValue];
  return v3;
}

- (uint64_t)installPhaseString
{
  return objc_msgSend(NSString, "NSStringFromLSInstallPhase:", objc_msgSend(a1, "installPhase"));
}

- (uint64_t)ls_expectedFinalInstallPhase
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"expectedFinalInstallPhase"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 1LL;
  }

  return v3;
}

- (void)ls_setExpectedFinalInstallPhase:()LSInstallProgressAdditions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoObject:v2 forKey:@"expectedFinalInstallPhase"];
}

- (id)_LSDescription
{
  id v2 = (void *)NSString;
  [a1 userInfo];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"bundleID"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSString, "NSStringFromLSInstallPhase:", objc_msgSend(a1, "installPhase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSString, "NSStringFromLSInstallState:", objc_msgSend(a1, "installState"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSString, "NSStringFromLSInstallPhase:", objc_msgSend(a1, "ls_expectedFinalInstallPhase"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 fractionCompleted];
  objc_msgSend( v2,  "stringWithFormat:",  @"<NSProgress: %@ phase=%@; state=%@; finalPhase=%@; fractionCompleted=%f>",
    v4,
    v5,
    v6,
    v7,
    v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end