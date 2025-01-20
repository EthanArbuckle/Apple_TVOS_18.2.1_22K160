@interface MCMLibraryRepair
- (BOOL)_canRepairLocally;
- (BOOL)createPathsIfNecessaryWithError:(id *)a3;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5;
- (BOOL)fixPermissionsWithManagedPath:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6;
- (BOOL)managedPathsHaveChanged;
- (BOOL)pathsCreated;
- (BOOL)performGenericRepairWithError:(id *)a3;
- (MCMContainerClassIterator)classIterator;
- (MCMFileManager)fileManager;
- (MCMLibraryRepair)initWithManagedPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5;
- (MCMManagedPathRegistry)registry;
- (id)_managedPathsForGenericRepair;
- (void)setPathsCreated:(BOOL)a3;
@end

@implementation MCMLibraryRepair

- (MCMLibraryRepair)initWithManagedPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMLibraryRepair;
  v12 = -[MCMLibraryRepair init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a3);
    v13->_pathsCreated = 0;
    objc_storeStrong((id *)&v13->_fileManager, a4);
    objc_storeStrong((id *)&v13->_classIterator, a5);
  }

  return v13;
}

- (BOOL)fixPermissionsWithManagedPath:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v19[1] = *(id *)MEMORY[0x1895F89C0];
  id v10 = a3;
  char v11 = [v10 ACLConfig];
  uint64_t v12 = [v10 ACLConfig] & 2 | v11 & 1;
  unint64_t v13 = v12 & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)[v10 flags] >> 2) & 1) << 8);
  v14 = -[MCMLibraryRepair fileManager](self, "fileManager");
  [v10 url];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = 0LL;
  char v16 = [v14 repairPermissionsAtURL:v15 uid:v8 gid:v7 options:v13 error:v19];
  id v17 = v19[0];

  if (a6) {
    *a6 = v17;
  }

  return v16;
}

- (BOOL)performGenericRepairWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  v5 = -[MCMLibraryRepair registry](self, "registry");
  uint64_t v29 = -[MCMLibraryRepair _managedPathsForGenericRepair](self, "_managedPathsForGenericRepair");
  v30 = v5;
  objc_msgSend(v5, "orderedPathsFromPaths:");
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v28 = a3;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v40;
    uint64_t v31 = *MEMORY[0x189607688];
    while (2)
    {
      uint64_t v10 = 0LL;
      char v11 = v8;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        container_log_handle_for_category();
        unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_188846000, v13, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        [v12 owner];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 UID];
        [v12 owner];
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v16 primaryGID];
        id v33 = v11;
        BOOL v18 = -[MCMLibraryRepair fixPermissionsWithManagedPath:uid:gid:error:]( self,  "fixPermissionsWithManagedPath:uid:gid:error:",  v12,  v15,  v17,  &v33);
        id v8 = v33;

        if (!v18)
        {
          [v8 domain];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (![v19 isEqualToString:v31])
          {

LABEL_20:
            container_log_handle_for_category();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v12;
              __int16 v36 = 2112;
              id v37 = v8;
              _os_log_error_impl(&dword_188846000, v26, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            v22 = obj;
            v25 = (void *)v29;
            v24 = v30;
            if (v28)
            {
              id v8 = v8;
              BOOL v23 = 0;
              id *v28 = v8;
            }

            else
            {
              BOOL v23 = 0;
            }

            goto LABEL_25;
          }

          uint64_t v20 = [v8 code];

          if (v20 != 2) {
            goto LABEL_20;
          }
          container_log_handle_for_category();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v12;
            _os_log_impl( &dword_188846000,  v21,  OS_LOG_TYPE_DEFAULT,  "Expected path [%@] does not exist, moving on",  buf,  0xCu);
          }
        }

        ++v10;
        char v11 = v8;
      }

      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v38 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  v22 = obj;

  BOOL v23 = 1;
  v25 = (void *)v29;
  v24 = v30;
LABEL_25:

  return v23;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  v12[1] = *(id *)MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    v12[0] = 0LL;
    char v10 = (*((uint64_t (**)(id, id, id *))v8 + 2))(v8, v7, v12);
    id v8 = v12[0];
    if (a4 && (v10 & 1) == 0)
    {
      id v8 = v8;
      char v10 = 0;
      *a4 = v8;
    }
  }

  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)createPathsIfNecessaryWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v4 = self;
  objc_sync_enter(v4);
  if (-[MCMLibraryRepair pathsCreated](v4, "pathsCreated"))
  {
    v5 = 0LL;
  }

  else
  {
    uint64_t v6 = -[MCMLibraryRepair _managedPathsForGenericRepair](v4, "_managedPathsForGenericRepair");
    -[MCMLibraryRepair registry](v4, "registry");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 orderedPathsFromPaths:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
    uint64_t v20 = (void *)v6;
    if (v10)
    {
      v19 = a3;
      v5 = 0LL;
      uint64_t v11 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v9);
          }
          unint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v13, "flags", v19) & 2) != 0)
          {
            [v13 url];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            id v22 = v5;
            v21[0] = MEMORY[0x1895F87A8];
            v21[1] = 3221225472LL;
            v21[2] = __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke;
            v21[3] = &unk_18A29E688;
            v21[4] = v13;
            BOOL v15 = -[MCMLibraryRepair fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( v4,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  v14,  &v22,  v21);
            id v16 = v22;

            if (!v15)
            {

              objc_sync_exit(v4);
              if (v19)
              {
                id v16 = v16;
                BOOL v17 = 0;
                id *v19 = v16;
              }

              else
              {
                BOOL v17 = 0;
              }

              goto LABEL_19;
            }

            v5 = v16;
          }
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    else
    {
      v5 = 0LL;
    }

    -[MCMLibraryRepair setPathsCreated:](v4, "setPathsCreated:", 1LL);
  }

  objc_sync_exit(v4);

  BOOL v17 = 1;
  id v16 = v5;
LABEL_19:

  return v17;
}

- (BOOL)managedPathsHaveChanged
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  v3 = -[MCMLibraryRepair _managedPathsForGenericRepair](self, "_managedPathsForGenericRepair");
  v4 = -[MCMLibraryRepair registry](self, "registry");
  [v4 orderedPathsFromPaths:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (!v7)
  {
    BOOL v19 = 0;
    goto LABEL_20;
  }

  uint64_t v8 = v7;
  __int128 v27 = v3;
  uint64_t v9 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_msgSend(v11, "fsNode", v27);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 url];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v28 = 0LL;
        [v13 fsNodeOfURL:v14 followSymlinks:1 error:&v28];
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v16 = v28;

        if (v15)
        {
          [v11 fsNode];
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
          char v18 = [v17 isEqual:v15];

          if ((v18 & 1) != 0)
          {

            continue;
          }

          container_log_handle_for_category();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            [v11 url];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 path];
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 fsNode];
            BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v30 = v22;
            __int16 v31 = 2114;
            id v32 = v23;
            __int16 v33 = 2114;
            v34 = v15;
            _os_log_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEFAULT,  "Path [%{public}@] changed: old = %{public}@, new = %{public}@",  buf,  0x20u);
          }
        }

        else
        {
          container_log_handle_for_category();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            [v11 url];
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 path];
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = v26;
            __int16 v31 = 2114;
            id v32 = v16;
            _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Failed to get fsNode for [%{public}@] when checking for file system changes: %{public}@",  buf,  0x16u);
          }

          BOOL v15 = 0LL;
        }

        v3 = v27;

        BOOL v19 = 1;
        goto LABEL_20;
      }
    }

    uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  BOOL v19 = 0;
  v3 = v27;
LABEL_20:

  return v19;
}

- (id)_managedPathsForGenericRepair
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 paths];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canRepairLocally
{
  if (_canRepairLocally_onceToken != -1) {
    dispatch_once(&_canRepairLocally_onceToken, &__block_literal_global_11602);
  }
  return _canRepairLocally_canRepairLocally;
}

- (MCMManagedPathRegistry)registry
{
  return self->_registry;
}

- (BOOL)pathsCreated
{
  return self->_pathsCreated;
}

- (void)setPathsCreated:(BOOL)a3
{
  self->_pathsCreated = a3;
}

- (MCMFileManager)fileManager
{
  return self->_fileManager;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (void).cxx_destruct
{
}

void __37__MCMLibraryRepair__canRepairLocally__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _canRepairLocally_canRepairLocally = [v0 isRoot];
}

uint64_t __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [*(id *)(a1 + 32) mode];
  [*(id *)(a1 + 32) owner];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend( v6,  "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:",  v5,  0,  v7,  v8,  objc_msgSend(*(id *)(a1 + 32), "dpClass"),  a3);

  return v9;
}

@end