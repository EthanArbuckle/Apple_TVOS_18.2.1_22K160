@interface MCMResultWithContainersArrayBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)includeCreator;
- (BOOL)includeInfo;
- (BOOL)includePath;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)skipSandboxExtensions;
- (MCMClientIdentity)clientIdentity;
- (MCMResultWithContainersArrayBase)initWithContainerPaths:(id)a3 containerIdentities:(id)a4 includePath:(BOOL)a5 clientIdentity:(id)a6 skipSandboxExtensions:(BOOL)a7;
- (MCMResultWithContainersArrayBase)initWithContainers:(id)a3 includePath:(BOOL)a4 includeInfo:(BOOL)a5 includeUserManagedAssetsRelPath:(BOOL)a6 includeCreator:(BOOL)a7 clientIdentity:(id)a8 skipSandboxExtensions:(BOOL)a9;
- (NSArray)containerIdentities;
- (NSArray)containerPaths;
- (NSArray)containers;
- (void)_encodeContainerIdentitiesAndPathsOnXPCContainers:(id)a3;
- (void)_encodeContainersOnXPCContainers:(id)a3;
@end

@implementation MCMResultWithContainersArrayBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultWithContainersArrayBase;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v9, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      xpc_object_t v7 = xpc_array_create(0LL, 0LL);
      -[MCMResultWithContainersArrayBase _encodeContainersOnXPCContainers:]( self,  "_encodeContainersOnXPCContainers:",  v7);
      -[MCMResultWithContainersArrayBase _encodeContainerIdentitiesAndPathsOnXPCContainers:]( self,  "_encodeContainerIdentitiesAndPathsOnXPCContainers:",  v7);
      xpc_dictionary_set_value(v4, "ReplyContainersArray", v7);
    }
  }

  return v5;
}

- (MCMResultWithContainersArrayBase)initWithContainerPaths:(id)a3 containerIdentities:(id)a4 includePath:(BOOL)a5 clientIdentity:(id)a6 skipSandboxExtensions:(BOOL)a7
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCMResultWithContainersArrayBase;
  v16 = -[MCMResultBase init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_containerPaths, a3);
    objc_storeStrong((id *)&v17->_containerIdentities, a4);
    containers = v17->_containers;
    v17->_containers = 0LL;

    v17->_includePath = a5;
    v17->_includeInfo = 0;
    v17->_includeUserManagedAssetsRelPath = 0;
    v17->_includeCreator = 0;
    objc_storeStrong((id *)&v17->_clientIdentity, a6);
    v17->_skipSandboxExtensions = a7;
  }

  return v17;
}

- (MCMResultWithContainersArrayBase)initWithContainers:(id)a3 includePath:(BOOL)a4 includeInfo:(BOOL)a5 includeUserManagedAssetsRelPath:(BOOL)a6 includeCreator:(BOOL)a7 clientIdentity:(id)a8 skipSandboxExtensions:(BOOL)a9
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMResultWithContainersArrayBase;
  v18 = -[MCMResultBase init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    containerPaths = v18->_containerPaths;
    v18->_containerPaths = 0LL;

    containerIdentities = v19->_containerIdentities;
    v19->_containerIdentities = 0LL;

    objc_storeStrong((id *)&v19->_containers, a3);
    v19->_includePath = a4;
    v19->_includeInfo = a5;
    v19->_includeUserManagedAssetsRelPath = a6;
    v19->_includeCreator = a7;
    objc_storeStrong((id *)&v19->_clientIdentity, a8);
    v19->_skipSandboxExtensions = a9;
  }

  return v19;
}

- (void)_encodeContainersOnXPCContainers:(id)a3
{
  v19[1] = *(void **)MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMResultWithContainersArrayBase containers](self, "containers");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[MCMResultWithContainersArrayBase containers](self, "containers");
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0LL;
      do
      {
        -[MCMResultWithContainersArrayBase containers](self, "containers");
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 objectAtIndexedSubscript:v8];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
        v19[0] = 0LL;
        if (!-[MCMResultWithContainersArrayBase skipSandboxExtensions](self, "skipSandboxExtensions"))
        {
          v12 = -[MCMResultWithContainersArrayBase clientIdentity](self, "clientIdentity");
          [v10 containerIdentity];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 containerPath];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = (void *)[v12 issueSandboxExtensionWithIdentity:v13 containerPath:v14 legacyExtensionPolicy:1 extensionsUseProxiedC lient:1 extensionsPolicyUsesProxiedClient:1 error:0];
        }

        id v15 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
        id v16 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:]( v15,  "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:",  v10,  v19[0],  -[MCMResultWithContainersArrayBase includePath](self, "includePath"),  -[MCMResultWithContainersArrayBase includeInfo](self, "includeInfo"),  -[MCMResultWithContainersArrayBase includeUserManagedAssetsRelPath]( self,  "includeUserManagedAssetsRelPath"),  -[MCMResultWithContainersArrayBase includeCreator](self, "includeCreator"));
        -[MCMResultWithContainerBase encodeResultOntoReply:](v16, "encodeResultOntoReply:", v11);
        xpc_array_append_value(v4, v11);
        if (v19[0])
        {
          free(v19[0]);
          memset_s(v19, 8uLL, 0, 8uLL);
        }

        ++v8;
        -[MCMResultWithContainersArrayBase containers](self, "containers");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v18 = [v17 count];
      }

      while (v8 < v18);
    }
  }
}

- (void)_encodeContainerIdentitiesAndPathsOnXPCContainers:(id)a3
{
  v20[1] = *(void **)MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0LL;
      do
      {
        -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 objectAtIndexedSubscript:v8];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMResultWithContainersArrayBase containerPaths](self, "containerPaths");
        xpc_object_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectAtIndexedSubscript:v8];
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
        v20[0] = 0LL;
        if (!-[MCMResultWithContainersArrayBase skipSandboxExtensions](self, "skipSandboxExtensions"))
        {
          -[MCMResultWithContainersArrayBase clientIdentity](self, "clientIdentity");
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = (void *)[v14 issueSandboxExtensionWithIdentity:v10 containerPath:v12 legacyExtensionPolicy:1 extensionsUseProxiedC lient:1 extensionsPolicyUsesProxiedClient:1 error:0];
        }

        id v15 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
        [v10 uuid];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = -[MCMResultWithContainerBase initWithContainerPath:containerIdentity:uuid:sandboxToken:includePath:]( v15,  "initWithContainerPath:containerIdentity:uuid:sandboxToken:includePath:",  v12,  v10,  v16,  v20[0],  -[MCMResultWithContainersArrayBase includePath](self, "includePath"));

        -[MCMResultWithContainerBase encodeResultOntoReply:](v17, "encodeResultOntoReply:", v13);
        xpc_array_append_value(v4, v13);
        if (v20[0])
        {
          free(v20[0]);
          memset_s(v20, 8uLL, 0, 8uLL);
        }

        ++v8;
        -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v19 = [v18 count];
      }

      while (v8 < v19);
    }
  }
}

- (NSArray)containerPaths
{
  return self->_containerPaths;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (NSArray)containers
{
  return self->_containers;
}

- (BOOL)includePath
{
  return self->_includePath;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)skipSandboxExtensions
{
  return self->_skipSandboxExtensions;
}

- (void).cxx_destruct
{
}

@end