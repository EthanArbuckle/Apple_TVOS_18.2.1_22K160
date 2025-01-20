@interface MCMContainerSchemaActionMoveContents
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionMoveContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionMoveContents

- (MCMContainerSchemaActionMoveContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionMoveContents;
  v11 = -[MCMContainerSchemaActionBase initWithContext:](&v17, sel_initWithContext_, a6);
  if (v11)
  {
    uint64_t v12 = [v9 fileURL];
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v12;

    uint64_t v14 = [v10 fileURL];
    destURL = v11->_destURL;
    v11->_destURL = (NSURL *)v14;

    if (!v11->_sourceURL || !v11->_destURL)
    {

      v11 = 0LL;
    }
  }

  return v11;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSURL path](self->_sourceURL, "path");
  v5 = -[NSURL path](self->_destURL, "path");
  [v3 stringByAppendingFormat:@" [%@] → [%@]", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v5 = -[NSURL path](self->_sourceURL, "path");
  v6 = -[NSURL path](self->_destURL, "path");
  if ([v5 isEqualToString:v6])
  {
    container_log_handle_for_category();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = 0LL;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "ignoring attempt to move [%@] to itself: %@",  buf,  0x16u);
    }

    id v8 = 0LL;
    BOOL v9 = 1;
  }

  else
  {
    id v10 = self->_sourceURL;
    destURL = self->_destURL;
    id v16 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke;
    v14[3] = &unk_18A29E6B0;
    v14[4] = self;
    v15 = v10;
    uint64_t v12 = v10;
    BOOL v9 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  destURL,  &v16,  v14);
    id v8 = v16;

    if (a3 && !v9)
    {
      id v8 = v8;
      BOOL v9 = 0;
      *a3 = v8;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
}

BOOL __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v35 = a2;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy__6398;
  v49 = __Block_byref_object_dispose__6399;
  id v50 = 0LL;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v43[4] = &v45;
  id v44 = 0LL;
  v43[0] = MEMORY[0x1895F87A8];
  v43[1] = 3221225472LL;
  v43[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_1;
  v43[3] = &unk_18A29E660;
  char v6 = [v4 fixAndRetryIfPermissionsErrorWithURL:v5 error:&v44 duringBlock:v43];
  id v7 = v44;
  id v8 = v7;
  if ((v6 & 1) != 0)
  {
    BOOL v9 = *(void **)(a1 + 32);
    id v42 = v8;
    int v10 = [v9 makedirAtURL:v35 followTerminalSymlink:1 error:&v42];
    id v11 = v42;

    if (v10)
    {
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v12 = (id)v46[5];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v57 count:16];
      if (v13)
      {
        LOBYTE(v14) = 0;
        id obj = v12;
        uint64_t v33 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v59 != v33) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            objc_super v17 = *(void **)(a1 + 40);
            objc_msgSend(v16, "lastPathComponent", obj);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 URLByAppendingPathComponent:v18 isDirectory:0];
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v20 = [v16 lastPathComponent];
            [v35 URLByAppendingPathComponent:v20 isDirectory:0];
            id v21 = (id)objc_claimAutoreleasedReturnValue();

            char v41 = 0;
            v22 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
            id v40 = v11;
            LOBYTE(v20) = [v22 itemAtURL:v21 followSymlinks:1 exists:&v41 isDirectory:0 error:&v40];
            id v23 = v40;

            if ((v20 & 1) == 0)
            {
              id v11 = v23;
LABEL_25:

              id v8 = v11;
              v27 = obj;
              goto LABEL_26;
            }

            if (v41)
            {
              v24 = *(void **)(a1 + 32);
              id v39 = v23;
              int v25 = [v24 backupFileURL:v21 error:&v39];
              id v11 = v39;

              id v23 = v11;
              if (!v25) {
                goto LABEL_25;
              }
            }

            v26 = *(void **)(a1 + 32);
            id v38 = v23;
            v36[0] = MEMORY[0x1895F87A8];
            v36[1] = 3221225472LL;
            v36[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_2;
            v36[3] = &unk_18A29E688;
            id v21 = v21;
            id v37 = v21;
            LOBYTE(v26) = [v26 fixAndRetryIfPermissionsErrorWithURL:v19 error:&v38 duringBlock:v36];
            id v11 = v38;

            if ((v26 & 1) == 0)
            {
              container_log_handle_for_category();
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                [v19 path];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v21 path];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v52 = v30;
                __int16 v53 = 2112;
                v54 = v31;
                __int16 v55 = 2112;
                id v56 = v11;
                _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "failed to move [%@] to [%@]: %@",  buf,  0x20u);
              }

              LOBYTE(v14) = 0;
              goto LABEL_25;
            }

            LOBYTE(v14) = 1;
          }

          id v12 = obj;
          uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v57 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      goto LABEL_18;
    }

    LOBYTE(v14) = 0;
    id v8 = v11;
  }

  else
  {
    [v7 domain];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v27 isEqualToString:*MEMORY[0x189607688]])
    {
      BOOL v14 = [v8 code] == 2;

      if (v14)
      {

        id v11 = 0LL;
LABEL_18:
        LOBYTE(v14) = 1;
        goto LABEL_31;
      }
    }

    else
    {
      LOBYTE(v14) = 0;
LABEL_26:
    }
  }

  if (!a3 || v14)
  {
    id v11 = v8;
  }

  else
  {
    id v11 = v8;
    LOBYTE(v14) = 0;
    *a3 = v11;
  }

BOOL __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_1( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 urlsForItemsInDirectoryAtURL:v5 error:a3];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) != 0LL;
}

uint64_t __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 moveItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"move-contents";
  return @"move-contents";
}

@end