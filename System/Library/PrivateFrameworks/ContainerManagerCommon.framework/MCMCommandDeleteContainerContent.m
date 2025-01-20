@interface MCMCommandDeleteContainerContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteContainerContent)initWithContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandDeleteContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeleteContainerContent

- (MCMCommandDeleteContainerContent)initWithContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandDeleteContainerContent;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_containerIdentity, a3);
  }

  return v11;
}

- (MCMCommandDeleteContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandDeleteContainerContent;
  id v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 containerIdentity];
    containerIdentity = v9->_containerIdentity;
    v9->_containerIdentity = (MCMContainerIdentity *)v10;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToWipeAnyDataContainer];

  return v4;
}

- (void)execute
{
  v2 = self;
  uint64_t v104 = *MEMORY[0x1895F89C0];
  uint64_t v3 = MEMORY[0x1895CE3A8](self, a2);
  char v97 = 0;
  -[MCMCommandDeleteContainerContent containerIdentity](v2, "containerIdentity");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 containerClass];
  uint64_t v6 = [v4 identifier];
  BOOL v7 = v5 > 0xB || ((1LL << v5) & 0xED4) == 0;
  v82 = (void *)v6;
  v84 = v4;
  if (v7)
  {
    uint64_t v42 = v6;
    container_log_handle_for_category();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v99 = v5;
      __int16 v100 = 2112;
      v101 = (MCMError *)v42;
      _os_log_error_impl( &dword_188846000,  v43,  OS_LOG_TYPE_ERROR,  "Can't wipe container non-data container of type: %llu, identifier: %@",  buf,  0x16u);
    }

    v18 = (void *)v3;

    v11 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  11LL,  3LL);
    goto LABEL_26;
  }

  -[MCMCommand context](v2, "context");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerCache];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v96 = 0LL;
  [v9 entryForContainerIdentity:v4 error:&v96];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MCMError *)v96;

  if (!v10)
  {
    container_log_handle_for_category();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v99 = (unint64_t)v4;
      __int16 v100 = 2112;
      v101 = v11;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Failed to lookup existing container during wipe; identity: %@, error: %@",
        buf,
        0x16u);
    }

    v18 = (void *)v3;

LABEL_26:
    uint64_t v10 = 0LL;
    v83 = 0LL;
    v20 = 0LL;
    v80 = 0LL;
    v81 = 0LL;
    goto LABEL_27;
  }

  v95 = v11;
  [v10 metadataWithError:&v95];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v13 = v95;

  if (v12)
  {
    [v12 info];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = v10;
    v81 = v15;
    if (v15) {
      uint64_t v16 = [v15 intValue];
    }
    else {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
    [v12 containerPath];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MCMCommand context](v2, "context");
    uint64_t v26 = [v25 containerFactory];
    v27 = v12;
    v28 = (void *)v26;
    v83 = v27;
    [v27 containerIdentity];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v13;
    id v94 = v24;
    [v28 createStagedContainerForContainerIdentity:v29 finalContainerPath:&v94 dataProtectionClass:v16 error:&v93];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (MCMError *)v94;

    v11 = v93;
    if (v30)
    {
      v85 = v30;
      [v30 containerPath];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v20;
      uint64_t v32 = -[MCMError containerRootURL](v20, "containerRootURL");
      v87 = v31;
      [v31 containerRootURL];
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = +[MCMContainerCacheEntry birthtimeForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "birthtimeForURL:", v32);
      if (v33 | v34)
      {
        uint64_t v38 = v33;
        uint64_t v40 = v34;
      }

      else
      {
        v35 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        id v92 = 0LL;
        [v35 fsNodeOfURL:v32 followSymlinks:0 error:&v92];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (MCMError *)v92;

        if (v36)
        {
          uint64_t v38 = [v36 birthtime];
          uint64_t v40 = v39;
        }

        else
        {
          container_log_handle_for_category();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v99 = v32;
            __int16 v100 = 2112;
            v101 = v37;
            _os_log_error_impl( &dword_188846000,  v48,  OS_LOG_TYPE_ERROR,  "Could not read fs node for old container at [%@] (non-fatal); error = %@",
              buf,
              0x16u);
          }

          uint64_t v38 = 0LL;
          uint64_t v40 = 0LL;
        }
      }

      if (v38 | v40) {
        +[MCMContainerCacheEntry setBirthtime:forURL:]( &OBJC_CLASS___MCMContainerCacheEntry,  "setBirthtime:forURL:",  v38,  v40,  v86);
      }
      v78 = v2;
      v49 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      id v91 = 0LL;
      v80 = (void *)v32;
      char v50 = [v49 replaceItemAtDestinationURL:v32 withSourceURL:v86 swapped:&v97 error:&v91];
      id v51 = v91;

      if ((v50 & 1) == 0)
      {
        container_log_handle_for_category();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v20 = v77;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v99 = (unint64_t)v51;
          _os_log_error_impl( &dword_188846000,  v57,  OS_LOG_TYPE_ERROR,  "Failed to swap containers during wipe; error: %@",
            buf,
            0xCu);
        }

        v58 = objc_alloc(&OBJC_CLASS___MCMError);
        v59 = -[MCMError containerRootURL](v77, "containerRootURL");
        v53 = -[MCMError initWithNSError:url:defaultErrorType:]( v58,  "initWithNSError:url:defaultErrorType:",  v51,  v59,  15LL);

        v22 = 0LL;
        goto LABEL_48;
      }

      v20 = v77;
      [v85 metadataByChangingContainerPath:v77];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v11;
      char v52 = [v22 verifyWithError:&v90];
      v53 = v90;

      if ((v52 & 1) != 0)
      {
        -[MCMCommand context](v2, "context");
        v54 = v53;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 containerCache];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v54;
        [v56 addContainerMetadata:v22 error:&v89];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v89;

        if (v23)
        {
          uint64_t v10 = v79;
          goto LABEL_49;
        }

        v53 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 45LL);

        container_log_handle_for_category();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v79;
        if (!os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
        {
LABEL_48:

          v23 = 0LL;
          v11 = v53;
LABEL_49:
          if (v87)
          {
            v21 = v51;
            if (v97)
            {
              v75 = (void *)v3;
              v61 = -[MCMCommand context](v2, "context");
              [v61 containerFactory];
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              [v87 containerRootURL];
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              [v87 userIdentity];
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              id v88 = 0LL;
              char v65 = [v62 deleteURL:v63 forUserIdentity:v64 error:&v88];
              v76 = (MCMError *)v88;

              uint64_t v10 = v79;
              if ((v65 & 1) == 0)
              {
                container_log_handle_for_category();
                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  [v87 containerRootURL];
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  [v70 path];
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  unint64_t v99 = (unint64_t)v71;
                  __int16 v100 = 2112;
                  v101 = v76;
                  _os_log_error_impl( &dword_188846000,  v66,  OS_LOG_TYPE_ERROR,  "Failed to remove staging container during wipe: %@; error = %@",
                    buf,
                    0x16u);
                }
              }

              v67 = objc_alloc(&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace);
              v2 = v78;
              v68 = -[MCMCommand context](v78, "context");
              v69 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:]( v67,  "initWithAsynchronously:context:resultPromise:",  1LL,  v68,  0LL);

              -[MCMCommandOperationReclaimDiskSpace execute](v69, "execute");
              v18 = v75;
              v20 = v77;
              goto LABEL_28;
            }
          }

          else
          {
            v21 = v51;
          }

          v18 = (void *)v3;
          goto LABEL_28;
        }

        [v22 containerPath];
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        [v60 containerRootURL];
        v72 = v53;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v73 path];
        v74 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        unint64_t v99 = (unint64_t)v22;
        __int16 v100 = 2112;
        v101 = v74;
        __int16 v102 = 2112;
        v103 = v72;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v59,  OS_LOG_TYPE_ERROR,  "Failed to add to cache: %@, url: %@; error = %@",
          buf,
          0x20u);

        v53 = v72;
        uint64_t v10 = v79;
      }

      else
      {
        container_log_handle_for_category();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        [v22 shortDescription];
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        unint64_t v99 = (unint64_t)v60;
        __int16 v100 = 2112;
        v101 = v53;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v59,  OS_LOG_TYPE_ERROR,  "Failed to verify new metadata; metadata = %@, error = %@",
          buf,
          0x16u);
      }

      goto LABEL_48;
    }

    v18 = (void *)v3;
    container_log_handle_for_category();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v99 = (unint64_t)v83;
      __int16 v100 = 2112;
      v101 = v20;
      __int16 v102 = 2112;
      v103 = v11;
      _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Failed to create staging container during wipe; metadata: %@, existingContainerPath: %@, error: %@",
        buf,
        0x20u);
    }

    v80 = 0LL;
LABEL_27:
    v21 = 0LL;
    v85 = 0LL;
    v86 = 0LL;
    v87 = 0LL;
    v22 = 0LL;
    v23 = 0LL;
    goto LABEL_28;
  }

  v18 = (void *)v3;
  container_log_handle_for_category();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v99 = (unint64_t)v84;
    __int16 v100 = 2112;
    v101 = v13;
    _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to read existing container metadata during wipe; identity: %@, error: %@",
      buf,
      0x16u);
  }

  v83 = 0LL;
  v20 = 0LL;
  v80 = 0LL;
  v81 = 0LL;
  v21 = 0LL;
  v85 = 0LL;
  v86 = 0LL;
  v87 = 0LL;
  v22 = 0LL;
  v23 = 0LL;
  v11 = v13;
LABEL_28:
  v44 = v20;
  container_log_handle_for_category();
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v99 = (unint64_t)v11;
    _os_log_impl(&dword_188846000, v45, OS_LOG_TYPE_DEFAULT, "Delete content result; error = %@", buf, 0xCu);
  }

  v46 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v11);
  v47 = -[MCMCommand resultPromise](v2, "resultPromise");
  [v47 completeWithResult:v46];

  objc_autoreleasePoolPop(v18);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 12LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end