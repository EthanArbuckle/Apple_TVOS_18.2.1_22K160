@interface MCMContainerClassStagingPath
+ (id)_globalStagingComponent;
+ (id)_stagingComponent;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)stagingGlobalURL;
+ (id)stagingURLWithUserIdentity:(id)a3;
@end

@implementation MCMContainerClassStagingPath

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 posixUser];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 posixOwnerForContainerClass:a4 user:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [a1 _modeForContainerClass:a4];
  id v10 = containermanager_copy_global_configuration();
  int v11 = [v10 isGlobalContainerClass:a4];

  if (v11)
  {
    uint64_t v12 = [a1 stagingGlobalURL];
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_6;
  }

  if (v6)
  {
    uint64_t v12 = [a1 stagingURLWithUserIdentity:v6];
    goto LABEL_5;
  }

  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a4;
    _os_log_fault_impl( &dword_188846000,  v16,  OS_LOG_TYPE_FAULT,  "Container class [%llu] requires a user identity.",  buf,  0xCu);
  }

  v13 = 0LL;
LABEL_6:
  v14 = (void *)[objc_alloc((Class)a1) initWithBaseURL:v13 categoryComponent:0 classComponent:0 containerClass:a4 POSIXOwner:v8 POSIXMode:v9 userIdentity:v6];

  return v14;
}

+ (id)stagingGlobalURL
{
  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerCaches];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 url];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _globalStagingComponent];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v7 isDirectory:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stagingURLWithUserIdentity:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _stagingComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_globalStagingComponent
{
  return @"Staging";
}

+ (id)_stagingComponent
{
  return @"Staging";
}

@end