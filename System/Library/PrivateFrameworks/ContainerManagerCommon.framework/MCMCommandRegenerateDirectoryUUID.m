@interface MCMCommandRegenerateDirectoryUUID
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandRegenerateDirectoryUUID)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandRegenerateDirectoryUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (id)regenerateDirectoryUUIDNoCacheUpdateWithMetadata:(id)a3 error:(id *)a4;
- (void)execute;
@end

@implementation MCMCommandRegenerateDirectoryUUID

- (MCMCommandRegenerateDirectoryUUID)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandRegenerateDirectoryUUID;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);
  }

  return v11;
}

- (MCMCommandRegenerateDirectoryUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandRegenerateDirectoryUUID;
  id v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = [v3 isAllowedToRegenerateDirectoryUUIDs];
  return (char)v2;
}

- (void)execute
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = -[MCMCommand context](self, "context");
  [v4 containerCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommandRegenerateDirectoryUUID concreteContainerIdentity](self, "concreteContainerIdentity");
  id v24 = 0LL;
  [v5 entryForContainerIdentity:v6 error:&v24];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v24;

  [v7 metadataMinimal];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v23 = v8;
    -[MCMCommandRegenerateDirectoryUUID regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:]( self,  "regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:",  v9,  &v23);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v23;

    if (v10)
    {
      v12 = -[MCMCommand context](self, "context");
      [v12 containerCache];
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = 0LL;
      [v13 addContainerMetadata:v10 error:&v22];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = v22;

      if (!v14)
      {
        container_log_handle_for_category();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v15;
          _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to update container cache for regenerate: %@",  buf,  0xCu);
        }

        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      id v15 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v10 = 0LL;
    id v15 = 0LL;
    id v11 = v8;
  }

  container_log_handle_for_category();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_188846000, v17, OS_LOG_TYPE_DEFAULT, "Roll UUID result: %@, error = %@", buf, 0x16u);
  }

  v18 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
  if (v10) {
    uint64_t v19 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:]( v18,  "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:",  v10,  0LL,  1LL,  0LL,  0LL,  0LL);
  }
  else {
    uint64_t v19 = -[MCMResultBase initWithError:](v18, "initWithError:", v11);
  }
  v20 = (void *)v19;
  v21 = -[MCMCommand resultPromise](self, "resultPromise");
  [v21 completeWithResult:v20];

  objc_autoreleasePoolPop(v3);
}

- (id)regenerateDirectoryUUIDNoCacheUpdateWithMetadata:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = -[MCMCommand context](self, "context");
  [v7 clientIdentity];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 platform];
  [v6 containerClass];
  [v6 transient];
  char v9 = container_class_supports_randomized_path();

  if ((v9 & 1) == 0)
  {
    uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 72LL);
    container_log_handle_for_category();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v18 = 0LL;
      objc_super v13 = 0LL;
      id v20 = 0LL;
      goto LABEL_13;
    }
    v31 = -[MCMCommand context](self, "context");
    [v31 clientIdentity];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = [v32 platform];
    *(_WORD *)&v47[4] = 2112;
    *(void *)&v47[6] = v6;
    v33 = "UUID container paths are unsupported on (%d) for: %@";
    v34 = v30;
    uint32_t v35 = 18;
LABEL_26:
    _os_log_error_impl(&dword_188846000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_12;
  }

  id v10 = objc_alloc(MEMORY[0x189607AB8]);
  [v6 containerPath];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 containerPathIdentifier];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v13 = (void *)[v10 initWithUUIDString:v12];

  if (!v13)
  {
    uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 11LL);
    container_log_handle_for_category();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    [v6 containerPath];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 containerPathIdentifier];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)v47 = v32;
    *(_WORD *)&v47[8] = 2112;
    *(void *)&v47[10] = v6;
    v33 = "Non-UUID last path component: %@ for %@";
    v34 = v30;
    uint32_t v35 = 22;
    goto LABEL_26;
  }

  uint64_t v14 = (void *)objc_opt_class();
  [v6 containerIdentity];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [MEMORY[0x189607AB8] UUID];
  [(id)v16 UUIDString];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 containerPathForContainerIdentity:v15 containerPathIdentifier:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 containerClassPath];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v45 = 0LL;
  LOBYTE(v16) = [v19 createIfNecessaryWithError:&v45];
  id v20 = v45;

  if ((v16 & 1) != 0)
  {
    v43 = a4;
    v21 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    [v6 containerPath];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 containerRootURL];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 containerRootURL];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v44 = v20;
    char v25 = [v21 moveItemAtURL:v23 toURL:v24 error:&v44];
    id v26 = v44;

    if ((v25 & 1) != 0)
    {
      uint64_t v27 = [v6 metadataByChangingContainerPath:v18];
      a4 = v43;
      if (v27)
      {
        id v28 = (void *)v27;
        uint64_t v29 = 0LL;
        goto LABEL_17;
      }

      uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 73LL);
      container_log_handle_for_category();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v47 = v29;
        _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to update metadata for regenerate: %@",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 48LL);
      container_log_handle_for_category();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      a4 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        [v6 containerPath];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 containerRootURL];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 path];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 containerRootURL];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 path];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)v47 = v39;
        *(_WORD *)&v47[8] = 2112;
        *(void *)&v47[10] = v41;
        __int16 v48 = 2112;
        id v49 = v26;
        _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to move dir: %@ to new UUID dir: %@; error = %@",
          buf,
          0x20u);

        a4 = v43;
      }
    }

    id v20 = v26;
  }

  else
  {
    uint64_t v29 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 48LL);
    container_log_handle_for_category();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      [v18 containerClassPath];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)v47 = v37;
      *(_WORD *)&v47[8] = 2112;
      *(void *)&v47[10] = v20;
      _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to create class path at: %@; error = %@",
        buf,
        0x16u);
    }
  }

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 9LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end