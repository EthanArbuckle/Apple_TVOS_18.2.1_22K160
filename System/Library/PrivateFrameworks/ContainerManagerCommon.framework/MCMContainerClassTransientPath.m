@interface MCMContainerClassTransientPath
+ (id)_globalTemporaryComponent;
+ (id)_temporaryComponent;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)transientGlobalBundleURL;
+ (id)transientGlobalURL;
+ (id)transientURLWithUserIdentity:(id)a3 withContainerClass:(unint64_t)a4;
@end

@implementation MCMContainerClassTransientPath

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [a1 _categoryComponentForContainerClass:a4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _classComponentForContainerClass:a4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 posixUser];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 posixOwnerForContainerClass:a4 user:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [a1 _modeForContainerClass:a4];
  id v12 = containermanager_copy_global_configuration();
  int v13 = [v12 isGlobalContainerClass:a4];

  if (v13)
  {
    id v14 = containermanager_copy_global_configuration();
    int v15 = [v14 isGlobalBundleContainerWithContainerClass:a4];

    if (v15) {
      [a1 transientGlobalBundleURL];
    }
    else {
    uint64_t v16 = [a1 transientGlobalURL];
    }
  }

  else
  {
    if (!v6)
    {
      container_log_handle_for_category();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v21 = a4;
        _os_log_fault_impl( &dword_188846000,  v17,  OS_LOG_TYPE_FAULT,  "Container class [%llu] requires a user identity.",  buf,  0xCu);
      }

      v18 = 0LL;
      goto LABEL_14;
    }

    uint64_t v16 = [a1 transientURLWithUserIdentity:v6 withContainerClass:a4];
  }

  v17 = (os_log_s *)v16;
  if (v16)
  {
    v18 = (void *)[objc_alloc((Class)a1) initWithBaseURL:v16 categoryComponent:v7 classComponent:v8 containerClass:a4 POSIXOwner:v10 POSIXMode:v11 userIdentity:v6];
LABEL_14:

    goto LABEL_15;
  }

  v18 = 0LL;
LABEL_15:

  return v18;
}

+ (id)transientGlobalBundleURL
{
  id v3 = containermanager_copy_global_configuration();
  [v3 sharedContainersDirectory];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _globalTemporaryComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)transientGlobalURL
{
  id v3 = containermanager_copy_global_configuration();
  [v3 managedPathRegistry];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containermanagerCaches];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 url];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _globalTemporaryComponent];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v7 isDirectory:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)transientURLWithUserIdentity:(id)a3 withContainerClass:(unint64_t)a4
{
  id v5 = a3;
  [a1 _temporaryComponent];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _baseURLForUserIdentity:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 URLByAppendingPathComponent:v6 isDirectory:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_globalTemporaryComponent
{
  return @"Temp";
}

+ (id)_temporaryComponent
{
  return @"Temp";
}

@end