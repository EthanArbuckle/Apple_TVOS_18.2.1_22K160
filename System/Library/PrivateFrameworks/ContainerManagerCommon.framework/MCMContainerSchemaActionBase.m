@interface MCMContainerSchemaActionBase
+ (id)actionIdentifier;
+ (id)actionWithName:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6;
+ (void)_resolveArguments:(id)a3 toPathArgument:(id *)a4 context:(id)a5;
+ (void)_resolveArguments:(id)a3 toSourcePathArgument:(id *)a4 destPathArgument:(id *)a5 destFinalPathArgument:(id *)a6 context:(id)a7;
- (BOOL)backupFileURL:(id)a3 error:(id *)a4;
- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5;
- (BOOL)makedirAtURL:(id)a3 followTerminalSymlink:(BOOL)a4 error:(id *)a5;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionBase)initWithContext:(id)a3;
- (MCMContainerSchemaContext)context;
- (NSString)description;
@end

@implementation MCMContainerSchemaActionBase

- (MCMContainerSchemaActionBase)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionBase;
  v6 = -[MCMContainerSchemaActionBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<undefined action>"];
}

- (BOOL)backupFileURL:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = -[MCMContainerSchemaActionBase context](self, "context");
  [v7 containerPath];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerDataURL];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 path];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 path];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMContainerSchemaActionBase context](self, "context");
  [v12 homeDirectoryURL];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 path];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v11 hasPrefix:v14];

  if ((v15 & 1) == 0)
  {
    v43[0] = MEMORY[0x1895F87A8];
    v43[1] = 3221225472LL;
    v43[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke;
    v43[3] = &unk_18A29E118;
    id v44 = v6;
    v45 = self;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke((uint64_t)v43);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v21 = 0;
    v22 = v44;
    goto LABEL_5;
  }

  memset(&v49, 0, sizeof(v49));
  id v16 = v6;
  if (lstat((const char *)[v16 fileSystemRepresentation], &v49))
  {
    uint64_t v17 = MEMORY[0x1895F87A8];
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88;
    v41[3] = &unk_18A29E6D8;
    id v18 = v16;
    id v42 = v18;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88((uint64_t)v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v17;
    v38[1] = 3221225472LL;
    v38[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92;
    v38[3] = &unk_18A29E118;
    id v39 = v18;
    id v40 = v19;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92((uint64_t)v38);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v21 = 0;
    v22 = v42;
    goto LABEL_5;
  }

  int v23 = v49.st_mode & 0xF000;
  if (v23 != 0x4000 && v23 != 0x8000)
  {
    id v29 = v16;
    if (unlink((const char *)[v29 fileSystemRepresentation]) && *__error() != 2)
    {
      uint64_t v31 = MEMORY[0x1895F87A8];
      v46[0] = MEMORY[0x1895F87A8];
      v46[1] = 3221225472LL;
      v46[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96;
      v46[3] = &unk_18A29D8B8;
      id v32 = v29;
      stat v48 = v49;
      id v47 = v32;
      __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96((uint64_t)v46);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v31;
      v35[1] = 3221225472LL;
      v35[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100;
      v35[3] = &unk_18A29E118;
      id v36 = v32;
      id v37 = v33;
      __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100((uint64_t)v35);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v21 = 0;
      v22 = v47;
      goto LABEL_5;
    }

    goto LABEL_16;
  }

  [v16 path];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v25 = [v24 hasPrefix:v10];

  if (!v25)
  {
LABEL_16:
    id v20 = 0LL;
    goto LABEL_17;
  }
  v26 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  [v26 stripACLFromURL:v16 error:0];
  v27 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v34 = 0LL;
  char v28 = [v27 removeItemAtURL:v16 error:&v34];
  id v20 = v34;

  if ((v28 & 1) != 0)
  {
LABEL_17:
    BOOL v21 = 1;
    goto LABEL_18;
  }

  [v20 domain];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    BOOL v21 = 0;
  }
LABEL_5:

  if (a4 && !v21)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a4 = v20;
  }

- (BOOL)makedirAtURL:(id)a3 followTerminalSymlink:(BOOL)a4 error:(id *)a5
{
  BOOL v42 = a4;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = -[MCMContainerSchemaActionBase context](self, "context");
  [v7 containerPath];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerDataURL];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 path];
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = v6;
  memset(&v54, 0, sizeof(v54));
  uint64_t v11 = sysconf(120);
  id v40 = v10;
  if (v11 < 1)
  {
    id v22 = 0LL;
LABEL_17:
    v43[0] = MEMORY[0x1895F87A8];
    v43[1] = 3221225472LL;
    v43[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112;
    v43[3] = &unk_18A29E6D8;
    id v44 = v40;
    uint64_t v34 = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112((uint64_t)v43);

    v38 = v44;
    id v22 = (id)v34;
    goto LABEL_18;
  }

  id v12 = 0LL;
  unint64_t v13 = v11 + 1;
  while (1)
  {
    id v10 = v10;
    if (lstat((const char *)[v10 fileSystemRepresentation], &v54))
    {
      if (*__error() != 2)
      {
        v47[0] = MEMORY[0x1895F87A8];
        v47[1] = 3221225472LL;
        v47[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106;
        v47[3] = &unk_18A29E6D8;
        id v10 = v10;
        id v48 = v10;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106((uint64_t)v47);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v48;
        goto LABEL_18;
      }
      v14 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      -[MCMContainerSchemaActionBase context](self, "context");
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 posixMode];
      -[MCMContainerSchemaActionBase context](self, "context");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 posixOwner];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MCMContainerSchemaActionBase context](self, "context");
      uint64_t v20 = [v19 dataProtectionClass];
      id v53 = 0LL;
      char v21 = [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 mode:v16 owner:v18 dataProtectionClass:v20 error:&v53];
      id v22 = v53;

      if ((v21 & 1) == 0)
      {
        v49[0] = MEMORY[0x1895F87A8];
        v49[1] = 3221225472LL;
        v49[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke;
        v49[3] = &unk_18A29D970;
        id v10 = v10;
        id v50 = v10;
        v51 = self;
        id v52 = v22;
        id v37 = v22;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke((uint64_t)v49);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v50;
        goto LABEL_18;
      }

      goto LABEL_14;
    }

    int v23 = v54.st_mode & 0xF000;
    if (v42 && v23 == 40960) {
      break;
    }
    if (v23 == 0x4000
      || ([v10 path],
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(),
          int v32 = [v31 hasPrefix:v41],
          v31,
          !v32))
    {
      BOOL v35 = 1;
      goto LABEL_22;
    }

    id v45 = v12;
    BOOL v33 = -[MCMContainerSchemaActionBase backupFileURL:error:](self, "backupFileURL:error:", v10, &v45);
    id v22 = v45;

    if (!v33) {
      goto LABEL_19;
    }
LABEL_14:
    --v13;
    id v12 = v22;
    if (v13 <= 1) {
      goto LABEL_17;
    }
  }
  v24 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v46 = v12;
  [v24 targetOfSymbolicLinkAtURL:v10 error:&v46];
  int v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v46;

  if (v25)
  {
    [MEMORY[0x189607810] URLPathAllowedCharacterSet];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 stringByAddingPercentEncodingWithAllowedCharacters:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    char v28 = (void *)MEMORY[0x189604030];
    [v10 URLByDeletingLastPathComponent];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v28 URLWithString:v27 relativeToURL:v29];

    id v10 = (id)v30;
    goto LABEL_14;
  }

  v38 = 0LL;
LABEL_18:

LABEL_19:
  if (a5)
  {
    id v12 = v22;
    BOOL v35 = 0;
    *a5 = v12;
  }

  else
  {
    BOOL v35 = 0;
    id v12 = v22;
  }

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  id v8 = a3;
  objc_super v9 = (uint64_t (**)(id, id, id *))a5;
  -[MCMContainerSchemaActionBase context](self, "context");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 containerPath];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerSchemaActionBase context](self, "context");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 identifier];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MCMContainerSchemaActionBase context](self, "context");
  [v14 libraryRepair];
  char v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v8 path];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 containerRootURL];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 path];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = [v16 hasPrefix:v18];

    -[MCMContainerSchemaActionBase context](self, "context");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 libraryRepair];
    char v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v21;
    if (v19) {
      char v23 = [v21 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v11 containerIdentifier:v13 error:a4 duringBlock:v9];
    }
    else {
      char v23 = [v21 fixAndRetryIfPermissionsErrorWithURL:v8 error:a4 duringBlock:v9];
    }
    char v24 = v23;
  }

  else
  {
    char v24 = v9[2](v9, v8, a4);
  }

  return v24;
}

- (BOOL)performWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x189603F70];
  uint64_t v4 = *MEMORY[0x189603A58];
  NSStringFromSelector(a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"%@ was called on the base class %@", v5, v7 format];

  __break(1u);
  return result;
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke(uint64_t a1)
{
  v23[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) context];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v2 initWithFormat:@"Failed to create sub-dir at %@ (protClass: %d)", v3, objc_msgSend(v4, "dataProtectionClass")];

  v22[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = &unk_18A2BDFA8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v22[1] = @"SourceFileLine";
  v22[2] = v7;
  v23[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 48))
  {
    objc_super v9 = (void *)[v8 mutableCopy];
    [v9 setObject:*(void *)(a1 + 48) forKeyedSubscript:*MEMORY[0x189607798]];
    id v10 = (void *)[v9 copy];

    if (*(void *)(a1 + 48))
    {
      container_log_handle_for_category();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        int v19 = v5;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        unint64_t v13 = "%{public}@ (%{public}@)";
        v14 = v11;
        uint32_t v15 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    id v10 = v8;
  }

  container_log_handle_for_category();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v19 = v5;
    unint64_t v13 = "%{public}@";
    v14 = v11;
    uint32_t v15 = 12;
    goto LABEL_9;
  }

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106( uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"Failed to stat [%@] when creating directories", v3];

  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_18A2BDFC0;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112( uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"failed to resolve [%@] after %ld tries", v3, sysconf(120)];

  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_18A2BDFD8;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:62 userInfo:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) context];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 homeDirectoryURL];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v2 initWithFormat:@"Request to backup file [%@] not in user's home directory: [%@]", v3, v6];

  v13[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = &unk_18A2BDF30;
  uint64_t v9 = *MEMORY[0x1896075E0];
  v13[1] = @"SourceFileLine";
  v13[2] = v9;
  v14[2] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88(uint64_t a1)
{
  v12[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = __error();
  id v5 = (void *)[v2 initWithFormat:@"Could not read file to back up: [%@]: %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_18A2BDF48;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not backup file: [%@]", v3];

  v12[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = &unk_18A2BDF60;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v12[1] = @"SourceFileLine";
  v12[2] = v6;
  v13[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 40))
  {
    id v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v9 = [v8 copy];

    uint64_t v7 = (void *)v9;
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(unsigned __int16 *)(a1 + 44);
  id v5 = __error();
  uint64_t v6 = (void *)[v2 initWithFormat:@"Could not unlink path to back up [%@], mode = 0x%x: %s", v3, v4, strerror(*v5)];

  v12[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_18A2BDF78;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not backup file: [%@]", v3];

  v12[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = &unk_18A2BDF90;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v12[1] = @"SourceFileLine";
  v12[2] = v6;
  v13[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v9 = [v8 copy];

    uint64_t v7 = (void *)v9;
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:82 userInfo:v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)actionWithName:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6
{
  v32[1] = *(id *)MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = (void *)[a4 mutableCopy];
  if (actionWithName_arguments_context_error__onceToken != -1) {
    dispatch_once(&actionWithName_arguments_context_error__onceToken, &__block_literal_global_5782);
  }
  [v11 lowercaseString];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (objc_class *)[(id)actionWithName_arguments_context_error__classLookup objectForKeyedSubscript:v13];
  if (v14)
  {
    id v15 = objc_alloc(v14);
    if (v15)
    {
      uint64_t v16 = v15;
      if ([v15 conformsToProtocol:&unk_18C737AA8])
      {
        id v31 = 0LL;
        v32[0] = 0LL;
        id v30 = 0LL;
        [a1 _resolveArguments:v12 toSourcePathArgument:v32 destPathArgument:&v31 destFinalPathArgument:&v30 context:v10];
        id v17 = v32[0];
        id v18 = v31;
        id v19 = v30;
        __int16 v20 = (void *)[v16 initWithSourcePathArgument:v17 destinationPathArgument:v18 destFinalPathArgument:v19 context:v10];
      }

      else
      {
        if (![v16 conformsToProtocol:&unk_18C730FB0])
        {

          v27[0] = MEMORY[0x1895F87A8];
          v27[1] = 3221225472LL;
          v27[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2;
          v27[3] = &unk_18A29E6D8;
          id v28 = v13;
          __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2((uint64_t)v27);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          __int16 v20 = 0LL;
          id v17 = v28;
          goto LABEL_13;
        }

        id v29 = 0LL;
        [a1 _resolveArguments:v12 toPathArgument:&v29 context:v10];
        id v17 = v29;
        __int16 v20 = (void *)[v16 initWithPathArgument:v17 context:v10];
      }

      uint64_t v21 = 0LL;
    }

    else
    {
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79;
      v23[3] = &unk_18A29E6D8;
      id v24 = v13;
      __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79((uint64_t)v23);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v20 = 0LL;
      id v17 = v24;
    }
  }

  else
  {
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75;
    v25[3] = &unk_18A29E6D8;
    id v26 = v13;
    __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75((uint64_t)v25);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v20 = 0LL;
    id v17 = v26;
  }

+ (id)actionIdentifier
{
  return @"<unknown action>";
}

+ (void)_resolveArguments:(id)a3 toSourcePathArgument:(id *)a4 destPathArgument:(id *)a5 destFinalPathArgument:(id *)a6 context:(id)a7
{
  id v43 = a3;
  id v11 = a7;
  [v43 firstObject];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    [v43 removeObjectAtIndex:0];
  }
  uint64_t v13 = [v43 firstObject];
  v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;

  id v17 = v16;
  if (v12)
  {
    [v12 string];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 hasPrefix:@"/"];

    if ((v19 & 1) == 0)
    {
      [v11 homeDirectoryURL];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 path];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 string];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 stringByAppendingPathComponent:v22];
      char v23 = (void *)objc_claimAutoreleasedReturnValue();

      id v24 = objc_alloc((Class)objc_opt_class());
      uint64_t v12 = (void *)[v24 initWithString:v23];
    }
  }

  if (!v17)
  {
    id v27 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  [v17 string];
  int v25 = (void *)objc_claimAutoreleasedReturnValue();
  char v26 = [v25 hasPrefix:@"/"];

  if ((v26 & 1) != 0)
  {
    id v27 = v17;
    if (!a4) {
      goto LABEL_15;
    }
LABEL_14:
    *a4 = v12;
    goto LABEL_15;
  }

  BOOL v42 = a6;
  [v17 string];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 containerPath];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 containerDataURL];
  [(id)v30 path];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 stringByAppendingPathComponent:v28];
  int v32 = (void *)objc_claimAutoreleasedReturnValue();

  id v33 = objc_alloc((Class)objc_opt_class());
  id v27 = (id)[v33 initWithString:v32];

  [v11 containerPath];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 finalContainerPath];
  BOOL v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = [v34 isEqual:v35];

  id v17 = v27;
  if ((v30 & 1) == 0)
  {
    [v11 finalContainerPath];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 containerDataURL];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 path];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 stringByAppendingPathComponent:v28];
    v41 = v28;
    id v39 = (void *)objc_claimAutoreleasedReturnValue();

    id v40 = objc_alloc((Class)objc_opt_class());
    id v17 = (id)[v40 initWithString:v39];

    id v28 = v41;
  }

  a6 = v42;
  if (a4) {
    goto LABEL_14;
  }
LABEL_15:
  if (a5) {
    *a5 = v27;
  }
  if (a6) {
    *a6 = v17;
  }
}

+ (void)_resolveArguments:(id)a3 toPathArgument:(id *)a4 context:(id)a5
{
  id v16 = a5;
  [a3 firstObject];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 string];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 hasPrefix:@"/"];

  if ((v9 & 1) == 0)
  {
    [v16 containerPath];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 containerDataURL];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 string];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringByAppendingPathComponent:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    id v15 = objc_alloc((Class)objc_opt_class());
    uint64_t v7 = (void *)[v15 initWithString:v14];
  }

  if (a4) {
    *a4 = v7;
  }
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"unknown initializer for action [%@]", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke_2"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BDEE8;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"unknown action [%@]", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BDF00;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"action [%@] missing argument", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BDF18;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:81 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke()
{
  v11[8] = *MEMORY[0x1895F89C0];
  v0 = +[MCMContainerSchemaActionMove actionIdentifier](&OBJC_CLASS___MCMContainerSchemaActionMove, "actionIdentifier");
  v10[0] = v0;
  v11[0] = objc_opt_class();
  v1 = +[MCMContainerSchemaActionMoveContents actionIdentifier]( &OBJC_CLASS___MCMContainerSchemaActionMoveContents,  "actionIdentifier");
  v10[1] = v1;
  v11[1] = objc_opt_class();
  +[MCMContainerSchemaActionCopy actionIdentifier](&OBJC_CLASS___MCMContainerSchemaActionCopy, "actionIdentifier");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v11[2] = objc_opt_class();
  +[MCMContainerSchemaActionCopyContents actionIdentifier]( &OBJC_CLASS___MCMContainerSchemaActionCopyContents,  "actionIdentifier");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  void v10[3] = v3;
  void v11[3] = objc_opt_class();
  +[MCMContainerSchemaActionSymlink actionIdentifier](&OBJC_CLASS___MCMContainerSchemaActionSymlink, "actionIdentifier");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  void v11[4] = objc_opt_class();
  +[MCMContainerSchemaActionUnlink actionIdentifier](&OBJC_CLASS___MCMContainerSchemaActionUnlink, "actionIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v11[5] = objc_opt_class();
  +[MCMContainerSchemaActionMkdir actionIdentifier](&OBJC_CLASS___MCMContainerSchemaActionMkdir, "actionIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  v11[6] = objc_opt_class();
  +[MCMContainerSchemaActionStopBackupExclude actionIdentifier]( &OBJC_CLASS___MCMContainerSchemaActionStopBackupExclude,  "actionIdentifier");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  v11[7] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:8];
  char v9 = (void *)actionWithName_arguments_context_error__classLookup;
  actionWithName_arguments_context_error__classLookup = v8;
}

@end