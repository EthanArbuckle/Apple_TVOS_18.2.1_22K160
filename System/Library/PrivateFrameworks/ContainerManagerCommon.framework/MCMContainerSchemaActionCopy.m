@interface MCMContainerSchemaActionCopy
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionCopy)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionCopy

- (MCMContainerSchemaActionCopy)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionCopy;
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
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v5 = -[NSURL path](self->_sourceURL, "path");
  v6 = -[NSURL path](self->_destURL, "path");
  if ([v5 isEqualToString:v6])
  {
    container_log_handle_for_category();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      __int16 v20 = 2114;
      v21 = 0LL;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "ignoring attempt to copy [%@] to itself: %{public}@",  buf,  0x16u);
    }

    id v8 = 0LL;
    goto LABEL_6;
  }

  id v9 = self->_sourceURL;
  destURL = self->_destURL;
  id v17 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke;
  v15[3] = &unk_18A29E6B0;
  v15[4] = self;
  v16 = v9;
  v11 = v9;
  LOBYTE(destURL) = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  destURL,  &v17,  v15);
  id v8 = v17;

  if ((destURL & 1) != 0)
  {
LABEL_6:
    BOOL v12 = 1;
    goto LABEL_7;
  }

  container_log_handle_for_category();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "failed to copy [%@] to [%@]: %{public}@", buf, 0x20u);
  }

  if (a3)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a3 = v8;
  }

  else
  {
    BOOL v12 = 0;
  }

- (void).cxx_destruct
{
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a2;
  [v5 URLByDeletingLastPathComponent];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v24[0] = 0LL;
  int v8 = [v7 makedirAtURL:v6 followTerminalSymlink:1 error:v24];
  id v9 = v24[0];
  if (v8)
  {
    char v23 = 0;
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v9;
    int v11 = [v10 itemAtURL:v5 followSymlinks:1 exists:&v23 isDirectory:0 error:&v22];
    id v12 = v22;

    if (!v11)
    {
      uint64_t v14 = 0LL;
      id v9 = v12;
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }

    if (!v23) {
      goto LABEL_6;
    }
    v13 = *(void **)(a1 + 32);
    id v21 = v12;
    uint64_t v14 = [v13 backupFileURL:v5 error:&v21];
    id v9 = v21;

    if ((_DWORD)v14)
    {
      id v12 = v9;
LABEL_6:
      v16 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v20 = v12;
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2;
      v18[3] = &unk_18A29E688;
      id v19 = v5;
      uint64_t v14 = [v16 fixAndRetryIfPermissionsErrorWithURL:v15 error:&v20 duringBlock:v18];
      id v9 = v20;

      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  if (!a3) {
    goto LABEL_14;
  }
LABEL_12:
  if ((v14 & 1) == 0) {
    *a3 = v9;
  }
LABEL_14:

  return v14;
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  v6 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v7 = [v6 copyItemIfExistsAtURL:v5 toURL:*(void *)(a1 + 32) error:a3];

  return v7;
}

+ (id)actionIdentifier
{
  v2 = @"copy";
  return @"copy";
}

@end