@interface MCMContainerSchemaActionMove
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionMove)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionMove

- (MCMContainerSchemaActionMove)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionMove;
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
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v5 = -[NSURL path](self->_sourceURL, "path");
  v6 = -[NSURL path](self->_destURL, "path");
  if ([v5 isEqualToString:v6])
  {
    container_log_handle_for_category();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_error_impl(&dword_188846000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to move [%@] to itself", buf, 0xCu);
    }

    id v8 = 0LL;
    goto LABEL_6;
  }

  id v9 = self->_sourceURL;
  destURL = self->_destURL;
  id v21 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke;
  v17[3] = &unk_18A29DB60;
  v17[4] = self;
  uint64_t v18 = v9;
  id v11 = v6;
  id v19 = v11;
  id v12 = v5;
  id v20 = v12;
  v13 = v9;
  LOBYTE(destURL) = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  destURL,  &v21,  v17);
  id v8 = v21;

  if ((destURL & 1) != 0)
  {
LABEL_6:
    BOOL v14 = 1;
    goto LABEL_7;
  }

  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_error_impl(&dword_188846000, v16, OS_LOG_TYPE_ERROR, "failed to move [%@] to [%@]: %@", buf, 0x20u);
  }

  if (a3)
  {
    id v8 = v8;
    BOOL v14 = 0;
    *a3 = v8;
  }

  else
  {
    BOOL v14 = 0;
  }

- (void).cxx_destruct
{
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__7864;
  v42 = __Block_byref_object_dispose__7865;
  id v43 = 0LL;
  [v5 URLByDeletingLastPathComponent];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[4];
  id v37 = 0LL;
  char v8 = [v7 makedirAtURL:v6 followTerminalSymlink:1 error:&v37];
  id v9 = v37;
  if ((v8 & 1) == 0) {
    goto LABEL_19;
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  id v36 = v9;
  uint64_t v12 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1;
  v35[3] = &unk_18A29E660;
  v35[4] = &v38;
  [v10 fixAndRetryIfPermissionsErrorWithURL:v11 error:&v36 duringBlock:v35];
  id v13 = v36;

  BOOL v14 = (void *)v39[5];
  if (!v14)
  {
    [v13 domain];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v18 isEqualToString:*MEMORY[0x189607688]])
    {
      BOOL v19 = [v13 code] == 2;

      if (v19)
      {

        container_log_handle_for_category();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = a1[6];
          uint64_t v21 = a1[7];
          *(_DWORD *)buf = 138412546;
          uint64_t v45 = v21;
          __int16 v46 = 2112;
          uint64_t v47 = v22;
          _os_log_impl( &dword_188846000,  v20,  OS_LOG_TYPE_INFO,  "not moving: [%@] because it does not exist; leaving destination [%@]",
            buf,
            0x16u);
        }

        id v13 = 0LL;
        goto LABEL_12;
      }
    }

    else
    {
    }

    goto LABEL_14;
  }

  if (![v14 isEqualToString:a1[6]])
  {
LABEL_14:
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = [v24 itemExistsAtURL:v5];

    if (!v25) {
      goto LABEL_17;
    }
    __int16 v26 = (void *)a1[4];
    id v34 = v13;
    char v27 = [v26 backupFileURL:v5 error:&v34];
    id v9 = v34;

    if ((v27 & 1) != 0)
    {
      id v13 = v9;
LABEL_17:
      v29 = (void *)a1[4];
      uint64_t v28 = a1[5];
      id v33 = v13;
      v31[0] = v12;
      v31[1] = 3221225472LL;
      v31[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3;
      v31[3] = &unk_18A29E688;
      id v32 = v5;
      uint64_t v23 = [v29 fixAndRetryIfPermissionsErrorWithURL:v28 error:&v33 duringBlock:v31];
      id v9 = v33;

      if (!a3) {
        goto LABEL_22;
      }
LABEL_20:
      if ((v23 & 1) == 0)
      {
        id v13 = v9;
        uint64_t v23 = 0LL;
        *a3 = v13;
        goto LABEL_23;
      }

BOOL __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v7 = [v6 targetOfSymbolicLinkAtURL:v5 error:a3];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) != 0LL;
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v7 = [v6 moveItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"move";
  return @"move";
}

@end