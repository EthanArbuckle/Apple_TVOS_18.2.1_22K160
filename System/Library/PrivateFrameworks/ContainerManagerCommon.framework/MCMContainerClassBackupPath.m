@interface MCMContainerClassBackupPath
+ (id)systemContainerBackupBaseDirectoryWithUserIdentity:(id)a3;
+ (id)systemContainerBackupDirectoryWithUserIdentity:(id)a3;
+ (id)systemGroupContainerBackupDirectoryWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassBackupPath

+ (id)systemContainerBackupBaseDirectoryWithUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  int v5 = [v4 systemContainerMode];

  if (v5 == 1)
  {
    id v6 = containermanager_copy_global_configuration();
    [v6 defaultUser];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 homeDirectoryURL];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      id v9 = containermanager_copy_global_configuration();
      [v9 currentUser];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 homeDirectoryURL];

      v8 = (void *)v11;
    }
  }

  else
  {
    [v3 homeDirectoryURL];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v8 URLByAppendingPathComponent:@"Library/Backup/SystemContainers" isDirectory:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)systemContainerBackupDirectoryWithUserIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"Data" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)systemGroupContainerBackupDirectoryWithUserIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"Shared" isDirectory:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end