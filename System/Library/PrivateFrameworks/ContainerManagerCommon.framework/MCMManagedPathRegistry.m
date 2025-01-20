@interface MCMManagedPathRegistry
- (BOOL)privileged;
- (MCMManagedPath)caches;
- (MCMManagedPath)containermanagerCaches;
- (MCMManagedPath)containermanagerCachesIntermediate;
- (MCMManagedPath)containermanagerDeathrow;
- (MCMManagedPath)containermanagerDeleteOperations;
- (MCMManagedPath)containermanagerLibrary;
- (MCMManagedPath)containermanagerLibraryIntermediate;
- (MCMManagedPath)containermanagerPendingUpdates;
- (MCMManagedPath)containermanagerReplaceOperations;
- (MCMManagedPath)home;
- (MCMManagedPath)library;
- (MCMManagedPathRegistry)initWithDaemonUser:(id)a3 privileged:(BOOL)a4;
- (MCMPOSIXUser)daemonUser;
- (NSSet)paths;
- (id)managedPathForURL:(id)a3;
- (id)orderedPathsFromPaths:(id)a3;
- (void)_addPaths:(id)a3;
- (void)_initPathPropertiesWithDaemonUser:(id)a3;
@end

@implementation MCMManagedPathRegistry

- (MCMManagedPathRegistry)initWithDaemonUser:(id)a3 privileged:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMManagedPathRegistry;
  v8 = -[MCMManagedPathRegistry init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_daemonUser, a3);
    v9->_privileged = a4;
    -[MCMManagedPathRegistry _initPathPropertiesWithDaemonUser:](v9, "_initPathPropertiesWithDaemonUser:", v7);
    objc_msgSend( MEMORY[0x189603FE0],  "setWithObjects:",  v9->_home,  v9->_library,  v9->_containermanagerLibrary,  v9->_containermanagerPendingUpdates,  v9->_containermanagerReplaceOperations,  v9->_containermanagerDeleteOperations,  v9->_caches,  v9->_containermanagerCaches,  v9->_containermanagerDeathrow,  0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9->_containermanagerLibraryIntermediate) {
      objc_msgSend(v10, "addObject:");
    }
    if (v9->_containermanagerCachesIntermediate) {
      objc_msgSend(v11, "addObject:");
    }
    uint64_t v12 = [v11 copy];
    paths = v9->_paths;
    v9->_paths = (NSSet *)v12;
  }

  return v9;
}

- (id)orderedPathsFromPaths:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v22 + 1) + 8 * v9);
        [MEMORY[0x189603FA8] array];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 addObject:v10];
        [v10 parent];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          do
          {
            [v10 parent];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 addObject:v13];

            [v10 parent];
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            [v14 parent];
            objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

            id v10 = v14;
          }

          while (v15);
        }

        else
        {
          v14 = v10;
        }

        uint64_t v16 = [v11 count];
        if (v16)
        {
          uint64_t v17 = v16 - 1;
          do
          {
            v18 = v14;
            [v11 objectAtIndexedSubscript:v17];
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (([v4 containsObject:v14] & 1) == 0) {
              [v4 addObject:v14];
            }
            --v17;
          }

          while (v17 != -1);
        }

        ++v9;
      }

      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }

    while (v7);
  }

  v19 = (void *)[v4 copy];
  return v19;
}

- (id)managedPathForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMManagedPathRegistry paths](self, "paths");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        [v9 url];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_addPaths:(id)a3
{
  id v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  paths = self->_paths;
  self->_paths = v4;
}

- (void)_initPathPropertiesWithDaemonUser:(id)a3
{
  id v27 = a3;
  [v27 homeDirectoryURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]( objc_alloc(&OBJC_CLASS___MCMManagedPath),  "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:",  v4,  0LL,  0LL,  493LL,  0xFFFFFFFFLL,  v27,  0LL);
  home = self->_home;
  self->_home = v5;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_home,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Library",  2LL,  2LL,  493LL,  0xFFFFFFFFLL,  v27);
  uint64_t v7 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  library = self->_library;
  self->_library = v7;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_library,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"MobileContainerManager",  7LL,  1LL,  493LL,  4LL,  v27);
  uint64_t v9 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerLibrary = self->_containermanagerLibrary;
  self->_containermanagerLibrary = v9;

  objc_storeStrong((id *)&self->_containermanagerLibraryIntermediate, self->_containermanagerLibrary);
  if (-[MCMManagedPathRegistry privileged](self, "privileged"))
  {
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerLibraryIntermediate,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"System",  7LL,  1LL,  493LL,  4LL,  v27);
    int v11 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_containermanagerLibrary;
    self->_containermanagerLibrary = v11;
  }

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"PendingUpdates",  7LL,  1LL,  493LL,  4LL,  v27);
  v13 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerPendingUpdates = self->_containermanagerPendingUpdates;
  self->_containermanagerPendingUpdates = v13;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Replace",  7LL,  1LL,  493LL,  4LL,  v27);
  __int128 v15 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerReplaceOperations = self->_containermanagerReplaceOperations;
  self->_containermanagerReplaceOperations = v15;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerLibraryIntermediate,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Delete",  7LL,  1LL,  493LL,  4LL,  v27);
  __int128 v17 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerDeleteOperations = self->_containermanagerDeleteOperations;
  self->_containermanagerDeleteOperations = v17;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_library,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Caches",  2LL,  2LL,  493LL,  0xFFFFFFFFLL,  v27);
  v19 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  caches = self->_caches;
  self->_caches = v19;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_caches,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"com.apple.containermanagerd",  3LL,  1LL,  493LL,  4LL,  v27);
  v21 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerCaches = self->_containermanagerCaches;
  self->_containermanagerCaches = v21;

  if (-[MCMManagedPathRegistry privileged](self, "privileged"))
  {
    objc_storeStrong((id *)&self->_containermanagerCachesIntermediate, self->_containermanagerCaches);
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerCaches,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"System",  3LL,  1LL,  493LL,  4LL,  v27);
    __int128 v23 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    __int128 v24 = self->_containermanagerCaches;
    self->_containermanagerCaches = v23;
  }

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerCaches,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Dead",  7LL,  1LL,  493LL,  4LL,  v27);
  __int128 v25 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerDeathrow = self->_containermanagerDeathrow;
  self->_containermanagerDeathrow = v25;
}

- (NSSet)paths
{
  return self->_paths;
}

- (MCMPOSIXUser)daemonUser
{
  return self->_daemonUser;
}

- (MCMManagedPath)home
{
  return self->_home;
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (MCMManagedPath)containermanagerLibrary
{
  return self->_containermanagerLibrary;
}

- (MCMManagedPath)containermanagerLibraryIntermediate
{
  return self->_containermanagerLibraryIntermediate;
}

- (MCMManagedPath)containermanagerPendingUpdates
{
  return self->_containermanagerPendingUpdates;
}

- (MCMManagedPath)containermanagerReplaceOperations
{
  return self->_containermanagerReplaceOperations;
}

- (MCMManagedPath)containermanagerDeleteOperations
{
  return self->_containermanagerDeleteOperations;
}

- (MCMManagedPath)caches
{
  return self->_caches;
}

- (MCMManagedPath)containermanagerCaches
{
  return self->_containermanagerCaches;
}

- (MCMManagedPath)containermanagerCachesIntermediate
{
  return self->_containermanagerCachesIntermediate;
}

- (MCMManagedPath)containermanagerDeathrow
{
  return self->_containermanagerDeathrow;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void).cxx_destruct
{
}

@end