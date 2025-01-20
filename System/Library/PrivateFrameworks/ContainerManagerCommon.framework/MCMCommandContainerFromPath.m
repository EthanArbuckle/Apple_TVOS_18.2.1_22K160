@interface MCMCommandContainerFromPath
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandContainerFromPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSURL)url;
- (container_object_s)_containerFromRelayToDaemonWithURL:(id)a3 relativePath:(char *)a4 error:(container_error_extended_s *)a5;
- (void)execute;
@end

@implementation MCMCommandContainerFromPath

- (MCMCommandContainerFromPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandContainerFromPath;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 url];
    url = v9->_url;
    v9->_url = (NSURL *)v10;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 codeSignInfo];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 entitlements];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 allowed]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 otherIDLookup];
  }

  return v6;
}

- (void)execute
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v71 = 0LL;
  id v3 = containermanager_copy_global_configuration();
  [v3 classPathCache];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMCommand context](self, "context");
  [v5 clientIdentity];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 posixUser];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v7 isRoleUser])
  {
    id v8 = containermanager_copy_global_configuration();
    uint64_t v9 = [v8 defaultUser];

    v7 = (void *)v9;
  }

  uint64_t v10 = [v4 referenceForPOSIXUser:v7];
  v11 = -[MCMCommandContainerFromPath url](self, "url");
  v65 = (void *)v10;
  uint64_t v12 = [v4 containerClassPathWithURL:v11 reference:v10];

  v70 = 0LL;
  v64 = (void *)v12;
  v66 = v7;
  v67 = v4;
  if (v12)
  {
    id v13 = -[MCMCommandContainerFromPath url](self, "url");
    [v13 fileSystemRepresentation];
    uint64_t v14 = (container_object_s *)container_paths_copy_container_from_path();
  }

  else
  {
    id v15 = containermanager_copy_global_configuration();
    int v16 = [v15 dispositionForContainerClass:12];

    if (v16 != 2)
    {
      container_log_handle_for_category();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v53 = -[MCMCommandContainerFromPath url](self, "url");
        [v53 path];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v73 = v54;
        _os_log_error_impl( &dword_188846000,  v33,  OS_LOG_TYPE_ERROR,  "[%@] is not a path that container manager recognizes among its prefixes.",  buf,  0xCu);
      }

      v27 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);
      goto LABEL_23;
    }

    -[MCMCommandContainerFromPath url](self, "url");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[MCMCommandContainerFromPath _containerFromRelayToDaemonWithURL:relativePath:error:]( self,  "_containerFromRelayToDaemonWithURL:relativePath:error:",  v13,  &v70,  &v71);
  }

  v17 = v14;

  if (!v17)
  {
    v27 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);
    v28 = (void *)container_error_copy_unlocalized_description();
    __s = v28;
    container_log_handle_for_category();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v49 = -[MCMCommandContainerFromPath url](self, "url");
      [v49 path];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v50;
      __int16 v74 = 2080;
      uint64_t v75 = (uint64_t)v28;
      _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Error obtaining container during reverse lookup of [%@]: %s",  buf,  0x16u);
    }

    if (v28)
    {
      free(v28);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }

- (container_object_s)_containerFromRelayToDaemonWithURL:(id)a3 relativePath:(char *)a4 error:(container_error_extended_s *)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__6837;
  v21 = __Block_byref_object_dispose__6838;
  id v22 = 0LL;
  -[MCMCommand context](self, "context");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 clientIdentity];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 createLibsystemClient];

  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v11, "Command", 0x2CuLL);
  id v12 = v8;
  xpc_dictionary_set_string(v11, "Path", (const char *)[v12 fileSystemRepresentation]);
  id v13 = v11;
  container_perform_with_client_context();
  if (v18[5])
  {
    uint64_t v14 = (container_object_s *)container_xpc_decode_container_object();
    if (v14)
    {
      string = xpc_dictionary_get_string((xpc_object_t)v18[5], "ReplyRelativePath");
      if (a4)
      {
        if (string) {
          *a4 = strndup(string, 0x400uLL);
        }
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  container_free_client();
  if (!a5 || v14)
  {
    if (!a5) {
      container_error_free();
    }
  }

  else
  {
    *a5 = (container_error_extended_s *)v24[3];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

void __85__MCMCommandContainerFromPath__containerFromRelayToDaemonWithURL_relativePath_error___block_invoke( uint64_t a1)
{
  uint64_t v2 = container_xpc_send_sync_message();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (unint64_t)command
{
  return 44LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end