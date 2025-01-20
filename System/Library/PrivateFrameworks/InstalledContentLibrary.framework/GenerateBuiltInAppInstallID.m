@interface GenerateBuiltInAppInstallID
@end

@implementation GenerateBuiltInAppInstallID

void ___GenerateBuiltInAppInstallID_block_invoke()
{
  id v4 = (id)_CFCopySystemVersionDictionary();
  [v4 objectForKeyedSubscript:*MEMORY[0x189604B60]];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"ReleaseType"];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [NSString stringWithFormat:@"%@/%@", v0, v1];
  v3 = (void *)_GenerateBuiltInAppInstallID_osVersion;
  _GenerateBuiltInAppInstallID_osVersion = v2;
}

@end