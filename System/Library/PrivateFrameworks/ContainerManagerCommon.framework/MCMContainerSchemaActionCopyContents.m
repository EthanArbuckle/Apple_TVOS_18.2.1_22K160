@interface MCMContainerSchemaActionCopyContents
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionCopyContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionCopyContents

- (MCMContainerSchemaActionCopyContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionCopyContents;
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
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "ignoring attempt to copy [%@] to itself: %@",  buf,  0x16u);
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
    v14[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke;
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

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v40 = a2;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = __Block_byref_object_copy__12530;
  v54 = __Block_byref_object_dispose__12531;
  id v55 = 0LL;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v48[4] = &v50;
  id v49 = 0LL;
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1;
  v48[3] = &unk_18A29E660;
  char v6 = [v4 fixAndRetryIfPermissionsErrorWithURL:v5 error:&v49 duringBlock:v48];
  id v7 = v49;
  id v8 = v7;
  if ((v6 & 1) != 0)
  {
    BOOL v9 = *(void **)(a1 + 32);
    id v47 = v8;
    int v10 = [v9 makedirAtURL:v40 followTerminalSymlink:1 error:&v47];
    id v11 = v47;

    if (v10)
    {
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      id v12 = (id)v51[5];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v62 count:16];
      if (v13)
      {
        uint64_t v39 = *(void *)v64;
        *(void *)&__int128 v14 = 138412802LL;
        __int128 v36 = v14;
        id obj = v12;
        while (2)
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            objc_super v17 = *(void **)(a1 + 40);
            objc_msgSend(v16, "lastPathComponent", v36);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 URLByAppendingPathComponent:v18 isDirectory:0];
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();

            [v16 lastPathComponent];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v40 URLByAppendingPathComponent:v20 isDirectory:0];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

            char v46 = 0;
            v22 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
            id v45 = v11;
            LOBYTE(v17) = [v22 itemAtURL:v21 followSymlinks:1 exists:&v46 isDirectory:0 error:&v45];
            id v23 = v45;

            if ((v17 & 1) == 0)
            {
              id v11 = v23;
LABEL_27:

              v32 = obj;
              goto LABEL_28;
            }

            if (v46)
            {
              v24 = *(void **)(a1 + 32);
              id v44 = v23;
              int v25 = [v24 backupFileURL:v21 error:&v44];
              id v11 = v44;

              if (!v25) {
                goto LABEL_27;
              }
            }

            else
            {
              id v11 = v23;
            }

            v26 = *(void **)(a1 + 32);
            id v43 = 0LL;
            v41[0] = MEMORY[0x1895F87A8];
            v41[1] = 3221225472LL;
            v41[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2;
            v41[3] = &unk_18A29E688;
            id v27 = v21;
            id v42 = v27;
            LOBYTE(v26) = [v26 fixAndRetryIfPermissionsErrorWithURL:v19 error:&v43 duringBlock:v41];
            id v28 = v43;
            if ((v26 & 1) == 0)
            {
              container_log_handle_for_category();
              v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                [v19 path];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v27 path];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v36;
                v57 = v30;
                __int16 v58 = 2112;
                v59 = v31;
                __int16 v60 = 2112;
                id v61 = v28;
                _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "failed to copy [%@] to [%@]: %@",  buf,  0x20u);
              }
            }
          }

          id v12 = obj;
          uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v62 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      goto LABEL_23;
    }
  }

  else
  {
    [v7 domain];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v32 isEqualToString:*MEMORY[0x189607688]])
    {
      BOOL v33 = [v8 code] == 2;

      if (v33)
      {

        id v11 = 0LL;
LABEL_23:
        uint64_t v34 = 1LL;
        goto LABEL_32;
      }

      id v11 = v8;
    }

    else
    {
      id v11 = v8;
LABEL_28:
    }
  }

  if (a3)
  {
    id v11 = v11;
    uint64_t v34 = 0LL;
    *a3 = v11;
  }

  else
  {
    uint64_t v34 = 0LL;
  }

BOOL __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1( uint64_t a1,  void *a2,  uint64_t a3)
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

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 copyItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"copy-contents";
  return @"copy-contents";
}

@end