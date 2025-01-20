@interface LSApplicationIdentity(RBSWrappedLSInfoProvider)
- (id)fetchWrappedInfoWithError:()RBSWrappedLSInfoProvider;
@end

@implementation LSApplicationIdentity(RBSWrappedLSInfoProvider)

- (id)fetchWrappedInfoWithError:()RBSWrappedLSInfoProvider
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_msgSend(a1, "findApplicationRecordWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    [v5 bundleIdentifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 personaUniqueString];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 jobLabel];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[RBSWrappedLSInfo infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:]( RBSWrappedLSInfo,  "infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:",  v7,  v8,  v9,  [v6 platform],  0,  0);
  }

  else
  {
    rbs_general_log();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (a3)
      {
        [*a3 description];
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v12 = @"<>";
      }

      int v14 = 138543362;
      v15 = v12;
      _os_log_impl( &dword_185F67000,  v11,  OS_LOG_TYPE_INFO,  "fetchWrappedInfoWithError failed due to %{public}@",  (uint8_t *)&v14,  0xCu);
      if (a3) {
    }
      }

    v10 = 0LL;
  }

  return v10;
}

@end