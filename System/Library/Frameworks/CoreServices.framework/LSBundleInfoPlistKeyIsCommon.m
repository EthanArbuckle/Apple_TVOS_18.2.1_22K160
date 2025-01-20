@interface LSBundleInfoPlistKeyIsCommon
@end

@implementation LSBundleInfoPlistKeyIsCommon

void ___LSBundleInfoPlistKeyIsCommon_block_invoke()
{
  v12[2] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x189604010];
  uint64_t v1 = *MEMORY[0x189604AA8];
  v12[0] = *MEMORY[0x189604B10];
  v12[1] = v1;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys = v3;

  uint64_t v5 = [MEMORY[0x189604010] setWithArray:&unk_189DA84D8];
  v6 = (void *)_LSBundleInfoPlistKeyIsCommon::prefixes;
  _LSBundleInfoPlistKeyIsCommon::prefixes = v5;

  v7 = (void *)MEMORY[0x189604010];
  v11[0] = @"Capabilities";
  v11[1] = @"DeviceFamily";
  v11[2] = @"ProductType";
  v11[3] = @"disabled";
  v11[4] = @"MallocBehavior";
  v11[5] = @"PPBundleMetadata";
  v11[6] = @"AVInitialRouteSharingPolicy";
  v11[7] = @"LSEligibilityInstallPredicate";
  v11[8] = @"LSEligibilityUninstallPredicate";
  v11[9] = @"LSRequiredFeatureFlags";
  [MEMORY[0x189603F18] arrayWithObjects:v11 count:10];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 setWithArray:v8];
  v10 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys = v9;
}

@end