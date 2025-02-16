@interface NSArray(LSObserverAdditions)
+ (id)arrayByFilteringLaunchProhibitedAppsFrom:()LSObserverAdditions;
@end

@implementation NSArray(LSObserverAdditions)

+ (id)arrayByFilteringLaunchProhibitedAppsFrom:()LSObserverAdditions
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v10 isLaunchProhibited] & 1) == 0) {
          [v4 addObject:v10];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  uint64_t v11 = [v4 count];
  if (v11 != [v5 count])
  {
    _LSInstallLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Filtering notification for launch-prohibited apps",  v14,  2u);
    }
  }

  return v4;
}

@end