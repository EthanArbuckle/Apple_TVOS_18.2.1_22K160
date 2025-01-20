@interface MCMLibraryRepairForUser
- (BOOL)_canRepairLocally;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerPath:(id)a4 containerIdentifier:(id)a5 error:(id *)a6 duringBlock:(id)a7;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerRootURL:(id)a4 error:(id *)a5 duringBlock:(id)a6;
- (BOOL)performRepairForContainerPath:(id)a3 containerIdentifier:(id)a4 error:(id *)a5;
- (MCMLibraryRepairForUser)initWithManagedUserPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5;
- (MCMManagedUserPathRegistry)userRegistry;
- (id)_managedPathFromContainerClassPath:(id)a3 registry:(id)a4;
- (id)_managedPathsForGenericRepair;
- (id)_setByAddingContainerClassPathsToSet:(id)a3 registry:(id)a4;
@end

@implementation MCMLibraryRepairForUser

- (MCMLibraryRepairForUser)initWithManagedUserPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMLibraryRepairForUser;
  v10 = -[MCMLibraryRepair initWithManagedPathRegistry:fileManager:classIterator:]( &v13,  sel_initWithManagedPathRegistry_fileManager_classIterator_,  v9,  a4,  a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_userRegistry, a3);
  }

  return v11;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerRootURL:(id)a4 error:(id *)a5 duringBlock:(id)a6
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = v11;
  if (v11)
  {
    v15[0] = 0LL;
    char v13 = (*((uint64_t (**)(id, id, id *))v11 + 2))(v11, v9, v15);
    id v11 = v15[0];
    if (a5 && (v13 & 1) == 0)
    {
      id v11 = v11;
      char v13 = 0;
      *a5 = v11;
    }
  }

  else
  {
    char v13 = 1;
  }

  return v13;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerPath:(id)a4 containerIdentifier:(id)a5 error:(id *)a6 duringBlock:(id)a7
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = v14;
  if (v14)
  {
    v18[0] = 0LL;
    char v16 = (*((uint64_t (**)(id, id, id *))v14 + 2))(v14, v11, v18);
    id v14 = v18[0];
    if (a6 && (v16 & 1) == 0)
    {
      id v14 = v14;
      char v16 = 0;
      *a6 = v14;
    }
  }

  else
  {
    char v16 = 1;
  }

  return v16;
}

- (BOOL)performRepairForContainerPath:(id)a3 containerIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [MEMORY[0x189603FE0] set];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepairForUser userRegistry](self, "userRegistry");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 userIdentity];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 posixUser];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 containerClassPath];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepairForUser _managedPathFromContainerClassPath:registry:]( self,  "_managedPathFromContainerClassPath:registry:",  v12,  v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 containerPathIdentifier];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v13;
  uint64_t v15 = [v13 managedPathByAppendingPathComponent:v14 flags:5 ACLConfig:1 mode:493 dpClass:0xFFFFFFFFLL owner:v11];

  v57 = (void *)v15;
  [v8 addObject:v15];
  [v9 userIdentity];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 homeDirectoryURL];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 path];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    [v9 userIdentity];
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      container_log_handle_for_category();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v41 = v56;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188846000, v45, OS_LOG_TYPE_FAULT, "User path registry has no user identity", buf, 2u);
      }

      goto LABEL_39;
    }

    [v9 userIdentity];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 homeDirectoryURL];
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v56;
    if (v40)
    {
      [v9 userIdentity];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 homeDirectoryURL];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 path];
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44) {
        goto LABEL_40;
      }
      container_log_handle_for_category();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        [v9 userIdentity];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 homeDirectoryURL];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v63 = v47;
        _os_log_fault_impl( &dword_188846000,  v45,  OS_LOG_TYPE_FAULT,  "User identity has no home directory path cannot be computed (%@)",  buf,  0xCu);

LABEL_45:
      }
    }

    else
    {
      container_log_handle_for_category();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        [v9 userIdentity];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v63 = v46;
        _os_log_fault_impl( &dword_188846000,  v45,  OS_LOG_TYPE_FAULT,  "User identity has no home directory URL (%@)",  buf,  0xCu);
        goto LABEL_45;
      }
    }

- (id)_managedPathsForGenericRepair
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 paths];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMLibraryRepairForUser _setByAddingContainerClassPathsToSet:registry:]( self,  "_setByAddingContainerClassPathsToSet:registry:",  v4,  v3);
  return v5;
}

- (id)_setByAddingContainerClassPathsToSet:(id)a3 registry:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  [v6 userIdentity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerClassPath containerPathTypeClasses](&OBJC_CLASS___MCMContainerClassPath, "containerPathTypeClasses");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepair classIterator](self, "classIterator");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  BOOL v19 = __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke;
  id v20 = &unk_18A29E210;
  id v21 = v9;
  id v22 = v8;
  uint64_t v23 = self;
  id v24 = v6;
  id v25 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  id v14 = v9;
  [v10 selectUserWithIterator:&v17];

  uint64_t v15 = (void *)objc_msgSend(v11, "copy", v17, v18, v19, v20);
  return v15;
}

- (id)_managedPathFromContainerClassPath:(id)a3 registry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 userIdentity];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 posixUser];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 baseURL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 managedPathForURL:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = objc_alloc(&OBJC_CLASS___MCMManagedPath);
  [v6 categoryURL];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]( v11,  "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:",  v12,  1,  1,  [v6 posixMode],  0xFFFFFFFFLL,  v8,  v10);

  id v14 = objc_alloc(&OBJC_CLASS___MCMManagedPath);
  [v6 classURL];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v6 posixMode];

  uint64_t v17 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]( v14,  "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:",  v15,  1LL,  1LL,  v16,  0xFFFFFFFFLL,  v8,  v13);
  return v17;
}

- (BOOL)_canRepairLocally
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMLibraryRepairForUser;
  BOOL v3 = -[MCMLibraryRepair _canRepairLocally](&v9, sel__canRepairLocally);
  getpid();
  v4 = -[MCMLibraryRepairForUser userRegistry](self, "userRegistry");
  [v4 userIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 homeDirectoryURL];
  [v6 fileSystemRepresentation];
  int v7 = sandbox_check();

  return v7 && v3;
}

- (MCMManagedUserPathRegistry)userRegistry
{
  return self->_userRegistry;
}

- (void).cxx_destruct
{
}

void __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v34 = a2;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v33 = *(void *)v43;
    *(void *)&__int128 v4 = 138412802LL;
    __int128 v31 = v4;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(objc_class **)(*((void *)&v42 + 1) + 8 * i);
        v8 = -[objc_class containerPathForUserIdentity:containerClass:]( v7,  "containerPathForUserIdentity:containerClass:",  *(void *)(a1 + 40),  objc_msgSend(v34, "containerClass", v31));
        [v8 baseURL];
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 path];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) homeDirectoryURL];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 path];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = [v10 hasPrefix:v12];

        container_log_handle_for_category();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

        if (v13)
        {
          if (v15)
          {
            container_log_handle_for_category();
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromClass(v7);
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 baseURL];
              id v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 path];
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              [*(id *)(a1 + 40) homeDirectoryURL];
              id v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 path];
              id v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v36 = v21;
              __int16 v37 = 2112;
              v38 = v23;
              __int16 v39 = 2112;
              v40 = v25;
              _os_log_debug_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEBUG,  "Including [%@:%@] since it is under [%@]",  buf,  0x20u);
            }
          }

          uint64_t v17 = [*(id *)(a1 + 48) _managedPathFromContainerClassPath:v8 registry:*(void *)(a1 + 56)];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            do
            {
              [*(id *)(a1 + 64) addObject:v18];
              uint64_t v19 = [v18 parent];

              uint64_t v18 = (void *)v19;
            }

            while (v19);
          }
        }

        else if (v15)
        {
          container_log_handle_for_category();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromClass(v7);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 baseURL];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 path];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(a1 + 40) homeDirectoryURL];
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 path];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v31;
            v36 = v26;
            __int16 v37 = 2112;
            v38 = v28;
            __int16 v39 = 2112;
            v40 = v30;
            _os_log_debug_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEBUG,  "Skipping [%@:%@] since it isn't under [%@]",  buf,  0x20u);
          }
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
    }

    while (v5);
  }
}

@end