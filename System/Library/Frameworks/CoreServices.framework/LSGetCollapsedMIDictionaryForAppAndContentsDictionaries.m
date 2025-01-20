@interface LSGetCollapsedMIDictionaryForAppAndContentsDictionaries
@end

@implementation LSGetCollapsedMIDictionaryForAppAndContentsDictionaries

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 objectForKeyedSubscript:*MEMORY[0x189604E00]];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"ApplicationType"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:@"PluginKitPlugin"])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKey:v3];
  }

  else if (([v4 isEqualToString:@"CoreServices"] & 1) != 0 {
         || ([v4 isEqualToString:@"Internal"] & 1) != 0
  }
         || ([v4 isEqualToString:@"User"] & 1) != 0
         || ([v4 isEqualToString:@"System"] & 1) != 0
         || ([v4 isEqualToString:@"SystemAppPlaceholder"] & 1) != 0
         || [v4 isEqualToString:@"VPNPlugin"])
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v6 = (void *)[v7 mutableCopy];
    [v5 setObject:v6 forKey:v3];
  }
}

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  [v5 objectForKey:@"PluginOwnerBundleID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    [v7 objectForKeyedSubscript:@"_LSBundlePlugins"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }

    else
    {
      [MEMORY[0x189603FC8] dictionary];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = v11;

    [v12 setObject:v5 forKey:v13];
    [v8 setObject:v12 forKeyedSubscript:@"_LSBundlePlugins"];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKey:v6];
  }
}

@end