@interface MCMResultQuery
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)extensionsPolicyUsesProxiedClient;
- (BOOL)extensionsUseProxiedClient;
- (BOOL)includeCreator;
- (BOOL)includeInfo;
- (BOOL)includePath;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)issueSandboxExtensions;
- (BOOL)issuedAnyExtensions;
- (BOOL)legacyExtensionPolicy;
- (BOOL)legacyPersonaPolicy;
- (MCMClientIdentity)clientIdentity;
- (MCMResultQuery)initWithContainers:(id)a3 clientIdentity:(id)a4 issueSandboxExtensions:(BOOL)a5 includePath:(BOOL)a6 includeInfo:(BOOL)a7 legacyPersonaPolicy:(BOOL)a8 legacyExtensionPolicy:(BOOL)a9 includeUserManagedAssetsRelPath:(BOOL)a10 includeCreator:(BOOL)a11 extensionsUseProxiedClient:(BOOL)a12 extensionsPolicyUsesProxiedClient:(BOOL)a13;
- (NSArray)containers;
- (void)_compileContainerDataForIndex:(unint64_t)a3 container:(container_object_s *)a4 infos:(id)a5 tokens:(id)a6;
- (void)setIssuedAnyExtensions:(BOOL)a3;
@end

@implementation MCMResultQuery

- (void)_compileContainerDataForIndex:(unint64_t)a3 container:(container_object_s *)a4 infos:(id)a5 tokens:(id)a6
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  v12 = -[MCMResultQuery containers](self, "containers");
  [v12 objectAtIndexedSubscript:a3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  id v34 = 0LL;
  v14 = (container_object_s *)[v13 createLibsystemContainerWithError:&v34];
  id v15 = v34;
  *a4 = v14;
  if (!v14)
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MCMResultQuery _compileContainerDataForIndex:container:infos:tokens:]";
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_fault_impl(&dword_188846000, v25, OS_LOG_TYPE_FAULT, "%s: failed to create container: %@", buf, 0x16u);
    }

    goto LABEL_26;
  }

  v16 = &selRef_schemaVersionForFileHandle_;
  if (v10)
  {
    if (![v13 conformsToProtocol:&unk_18C735DA0]
      || ([v13 info],
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(),
          v17,
          !v18))
    {
      v18 = xpc_null_create();
    }

    xpc_array_append_value(v10, v18);
  }

  if (v11)
  {
    *(void *)buf = 0LL;
    v19 = 0LL;
    if (-[MCMResultQuery issueSandboxExtensions](self, "issueSandboxExtensions"))
    {
      id v33 = v15;
      v20 = -[MCMResultQuery clientIdentity](self, "clientIdentity");
      [v13 containerIdentity];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 containerPath];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (char *)objc_msgSend( v20,  "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:e xtensionsPolicyUsesProxiedClient:error:",  v21,  v22,  -[MCMResultQuery legacyExtensionPolicy](self, "legacyExtensionPolicy"),  -[MCMResultQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient"),  -[MCMResultQuery extensionsPolicyUsesProxiedClient](self, "extensionsPolicyUsesProxiedClient"),  0);
      *(void *)buf = v19;

      if (v19)
      {
        -[MCMResultQuery setIssuedAnyExtensions:](self, "setIssuedAnyExtensions:", 1LL);
        xpc_object_t v23 = xpc_string_create(v19);
        if (v23)
        {
          v24 = v23;
          xpc_array_append_value(v11, v23);

          id v15 = v33;
          v16 = &selRef_schemaVersionForFileHandle_;
LABEL_16:
          free(v19);
          memset_s(buf, 8uLL, 0, 8uLL);
          goto LABEL_17;
        }
      }

      id v15 = v33;
      v16 = &selRef_schemaVersionForFileHandle_;
    }

    xpc_object_t v26 = xpc_null_create();
    xpc_array_append_value(v11, v26);

    if (!v19) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MCMResultQuery;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v33, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    BOOL v7 = v6 == 0LL;

    if (v7)
    {
      v8 = -[MCMResultQuery containers](self, "containers");
      unint64_t v9 = [v8 count];

      if (v9 <= 1) {
        size_t v10 = 1LL;
      }
      else {
        size_t v10 = v9;
      }
      id v11 = (char *)calloc(v10, 8uLL);
      if (-[MCMResultQuery includeInfo](self, "includeInfo")) {
        xpc_object_t v12 = xpc_array_create(0LL, 0LL);
      }
      else {
        xpc_object_t v12 = 0LL;
      }
      xpc_object_t v13 = xpc_array_create(0LL, 0LL);
      if (v9)
      {
        uint64_t v14 = 0LL;
        id v15 = v11;
        do
        {
          -[MCMResultQuery _compileContainerDataForIndex:container:infos:tokens:]( self,  "_compileContainerDataForIndex:container:infos:tokens:",  v14++,  v15,  v12,  v13);
          v15 += 8;
        }

        while (v9 != v14);
      }

      if (v12) {
        xpc_dictionary_set_value(v4, "ReplyContainerInfos", v12);
      }
      if (v13) {
        xpc_dictionary_set_value(v4, "ReplyContainerTokens", v13);
      }
      uint64_t v29 = 0LL;
      id v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      uint64_t v32 = 0LL;
      -[MCMResultQuery includePath](self, "includePath");
      -[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
      -[MCMResultQuery includeCreator](self, "includeCreator");
      uint64_t v28 = MEMORY[0x1895F87A8];
      v16 = (const void *)container_frozenset_create();
      size_t v17 = v30[3];
      if (v17)
      {
        v18 = dispatch_data_create(v16, v17, 0LL, (dispatch_block_t)*MEMORY[0x1895F8AA0]);
        xpc_object_t v19 = xpc_data_create_with_dispatch_data(v18);
        xpc_dictionary_set_value(v4, "ReplyContainerSet", v19);
      }

      container_frozenset_destroy();
      container_free_array_of_containers();
      BOOL v20 = -[MCMResultQuery includeInfo]( self,  "includeInfo",  v28,  3221225472LL,  __40__MCMResultQuery_encodeResultOntoReply___block_invoke,  &unk_18A29D2A0,  &v29);
      BOOL v21 = -[MCMResultQuery includePath](self, "includePath");
      BOOL v22 = -[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
      BOOL v23 = -[MCMResultQuery includeCreator](self, "includeCreator");
      uint64_t v24 = 2LL;
      if (!v20) {
        uint64_t v24 = 0LL;
      }
      uint64_t v25 = v24 | v21;
      if (v22) {
        v25 |= 4uLL;
      }
      if (v23) {
        uint64_t v26 = v25 | 0x20;
      }
      else {
        uint64_t v26 = v25;
      }
      if (-[MCMResultQuery issuedAnyExtensions](self, "issuedAnyExtensions"))
      {
        if (-[MCMResultQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient")) {
          v26 |= 0x10uLL;
        }
        else {
          v26 |= 8uLL;
        }
      }

      xpc_dictionary_set_uint64(v4, "ReplyFlags", v26);
      _Block_object_dispose(&v29, 8);
    }
  }

  return v5;
}

- (MCMResultQuery)initWithContainers:(id)a3 clientIdentity:(id)a4 issueSandboxExtensions:(BOOL)a5 includePath:(BOOL)a6 includeInfo:(BOOL)a7 legacyPersonaPolicy:(BOOL)a8 legacyExtensionPolicy:(BOOL)a9 includeUserManagedAssetsRelPath:(BOOL)a10 includeCreator:(BOOL)a11 extensionsUseProxiedClient:(BOOL)a12 extensionsPolicyUsesProxiedClient:(BOOL)a13
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v20 = a3;
  id v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MCMResultQuery;
  BOOL v22 = -[MCMResultBase init](&v25, sel_init);
  BOOL v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_containers, a3);
    objc_storeStrong((id *)&v23->_clientIdentity, a4);
    v23->_issueSandboxExtensions = a5;
    v23->_includePath = a6;
    v23->_includeInfo = a7;
    v23->_legacyPersonaPolicy = a8;
    v23->_legacyExtensionPolicy = a9;
    v23->_includeUserManagedAssetsRelPath = a10;
    v23->_includeCreator = a11;
    v23->_extensionsUseProxiedClient = a12;
    *(_WORD *)&v23->_extensionsPolicyUsesProxiedClient = a13;
  }

  return v23;
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

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (BOOL)issuedAnyExtensions
{
  return self->_issuedAnyExtensions;
}

- (void)setIssuedAnyExtensions:(BOOL)a3
{
  self->_issuedAnyExtensions = a3;
}

- (void).cxx_destruct
{
}

mach_vm_address_t __40__MCMResultQuery_encodeResultOntoReply___block_invoke(uint64_t a1, uint64_t a2)
{
  kern_return_t v4;
  kern_return_t v5;
  os_log_s *v6;
  mach_vm_address_t address;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  mach_vm_size_t v12;
  __int16 v13;
  kern_return_t v14;
  uint64_t v15;
  id v15 = *MEMORY[0x1895F89C0];
  address = 0LL;
  mach_vm_size_t v3 = (a2 + *MEMORY[0x1895FD590] - 1) & -*MEMORY[0x1895FD590];
  id v4 = mach_vm_allocate(*MEMORY[0x1895FBBE0], &address, v3, 1);
  if (v4)
  {
    BOOL v5 = v4;
    container_log_handle_for_category();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      size_t v10 = "-[MCMResultQuery encodeResultOntoReply:]_block_invoke";
      id v11 = 2048;
      xpc_object_t v12 = v3 >> 10;
      xpc_object_t v13 = 1024;
      uint64_t v14 = v5;
      _os_log_fault_impl( &dword_188846000,  v6,  OS_LOG_TYPE_FAULT,  "%s: mach_vm_allocate() failed to allocate %llu KB: %d",  buf,  0x1Cu);
    }

    return 0LL;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
    return address;
  }

@end