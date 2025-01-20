@interface RBSLaunchContext(RBLaunchChecks)
- (uint64_t)_launchAllowedBySystemState:()RBLaunchChecks error:;
- (uint64_t)_passesRegulatoryChecksWithError:()RBLaunchChecks;
@end

@implementation RBSLaunchContext(RBLaunchChecks)

- (uint64_t)_passesRegulatoryChecksWithError:()RBLaunchChecks
{
  return 1LL;
}

- (uint64_t)_launchAllowedBySystemState:()RBLaunchChecks error:
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = [v6 preventLaunch];
  [v6 preventLaunchPredicates];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 allowLaunchPredicates];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[objc_alloc(MEMORY[0x1896122D0]) initWithLaunchContext:a1];
  rbs_process_log();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v10 executablePath];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v42 = v7;
    *(_WORD *)&v42[4] = 2114;
    *(void *)&v42[6] = v12;
    __int16 v43 = 2114;
    v44 = v8;
    __int16 v45 = 2114;
    v46 = v9;
    _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "Checking PreventLaunch: global:%d exPath:%{public}@ predicates:%{public}@ allow:%{public}@",  buf,  0x26u);
  }

  if ((v7 & 1) != 0)
  {
LABEL_16:
    if ([v9 count])
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      objc_msgSend(v6, "allowLaunchPredicates", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0LL; i != v21; ++i)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if ([v24 matchesProcess:v10])
            {
              rbs_process_log();
              v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)v42 = v24;
                _os_log_impl( &dword_188634000,  v26,  OS_LOG_TYPE_DEFAULT,  "PreventLaunch overriden by Predicate: %{public}@",  buf,  0xCu);
              }

              int v25 = 0;
              goto LABEL_29;
            }
          }

          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      int v25 = 1;
LABEL_29:
    }

    else
    {
      int v25 = 1;
    }

    uint64_t v18 = v25 ^ 1u;
    if (a4 && v25)
    {
      uint64_t v27 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 setObject:@"Launch prevented due to prevent launch assertion" forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v27 code:7 userInfo:v28];
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      *a4 = v29;
    }
  }

  else
  {
    if ([v8 count])
    {
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      [v6 preventLaunchPredicates];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v36;
        while (2)
        {
          for (uint64_t j = 0LL; j != v15; ++j)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v35 + 1) + 8 * j) matchesProcess:v10])
            {

              goto LABEL_16;
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }

    uint64_t v18 = 1LL;
  }

  return v18;
}

@end