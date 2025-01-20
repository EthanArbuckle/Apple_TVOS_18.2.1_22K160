@interface MIDataProtectionChangeOperation
+ (id)dataProtectionChangeOperationForURL:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5;
+ (id)dataProtectionChangeOperationForURLs:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5;
- (BOOL)_runChangeOperationWasLocked:(BOOL *)a3 withError:(id *)a4;
- (MIDataProtectionChangeOperation)initWithURLs:(id)a3 newClass:(int)a4 changeType:(unint64_t)a5;
- (NSArray)urls;
- (id)completionBlock;
- (int)newClass;
- (unint64_t)operationType;
- (void)performChangeOperation;
- (void)setCompletionBlock:(id)a3;
@end

@implementation MIDataProtectionChangeOperation

- (MIDataProtectionChangeOperation)initWithURLs:(id)a3 newClass:(int)a4 changeType:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MIDataProtectionChangeOperation;
  v10 = -[MIDataProtectionChangeOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_urls, a3);
    v11->_newClass = a4;
    v11->_operationType = a5;
  }

  return v11;
}

+ (id)dataProtectionChangeOperationForURLs:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURLs:v7 newClass:v6 changeType:a5];

  return v8;
}

+ (id)dataProtectionChangeOperationForURL:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v12[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  v12[0] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)[v8 initWithURLs:v9 newClass:v6 changeType:a5];
  return v10;
}

- (BOOL)_runChangeOperationWasLocked:(BOOL *)a3 withError:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  id v8 = (char **)malloc(8 * v7 + 8);
  if (!v7) {
    goto LABEL_59;
  }
  v72 = a3;
  uint64_t v9 = 0LL;
  int v10 = 0;
  do
  {
    v11 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    v12 = -[MIDataProtectionChangeOperation urls](self, "urls");
    [v12 objectAtIndexedSubscript:v9];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v11 itemExistsAtURL:v13];

    if (v14)
    {
      v15 = -[MIDataProtectionChangeOperation urls](self, "urls");
      id v16 = [v15 objectAtIndexedSubscript:v9];
      v8[v10] = (char *)[v16 fileSystemRepresentation];

      ++v10;
    }

    ++v9;
  }

  while (v7 != v9);
  a3 = v72;
  if (!v10)
  {
LABEL_59:
    id v33 = 0LL;
    *a3 = 0;
    char v23 = 1;
    goto LABEL_71;
  }

  v8[v10] = 0LL;
  v17 = fts_open(v8, 84, 0LL);
  v18 = v17;
  if (!v17)
  {
    v50 = (void *)*MEMORY[0x189607688];
    uint64_t v51 = *__error();
    v52 = -[MIDataProtectionChangeOperation urls](self, "urls");
    v53 = __error();
    v60 = strerror(*v53);
    _CreateError( (uint64_t)"-[MIDataProtectionChangeOperation _runChangeOperationWasLocked:withError:]",  78LL,  v50,  v51,  0LL,  0LL,  @"fts_open failed for %@ : %s",  v54,  (uint64_t)v52);
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_61;
  }

  v19 = fts_read(v17);
  char v23 = 1;
  if (!v19)
  {
    id v25 = 0LL;
LABEL_70:
    fts_close(v18);
    id v33 = v25;
LABEL_71:
    if (v8) {
      free(v8);
    }
    goto LABEL_73;
  }

  v24 = v19;
  id v25 = 0LL;
  v63 = (void *)*MEMORY[0x189607688];
  v70 = v18;
  while (1)
  {
    unsigned int fts_info = v24->fts_info;
    if (fts_info > 0xD)
    {
LABEL_26:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t fts_path = (uint64_t)v24->fts_path;
        v60 = strerror(v24->fts_errno);
        MOLogWrite();
      }

      goto LABEL_12;
    }

    if (((1 << fts_info) & 0x300A) != 0) {
      goto LABEL_12;
    }
    if (fts_info == 6) {
      break;
    }
    if (fts_info != 8) {
      goto LABEL_26;
    }
    v27 = (void *)MEMORY[0x186E26FA4]();
    if ((-[MIDataProtectionChangeOperation operationType](self, "operationType") & 2) == 0) {
      goto LABEL_47;
    }
    v66 = v27;
    unsigned int v28 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
    if (v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 3LL;
    }
    uint64_t v30 = objc_msgSend( MEMORY[0x189604030],  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v24->fts_path,  0,  0,  fts_path,  v60,  st_mode,  v62);
    v74[0] = MEMORY[0x1895F87A8];
    v74[1] = 3221225472LL;
    v74[2] = __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke_2;
    v74[3] = &unk_189D48C40;
    int v75 = v29;
    v74[4] = self;
    v74[5] = v24;
    uint64_t v31 = MEMORY[0x186E27154](v74);
    v32 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    id v73 = v25;
    context = (void *)v30;
    v64 = (void *)v31;
    LOBYTE(v30) = [v32 setDataProtectionClassOfItemAtURL:v30 toClass:v29 ifPredicate:v31 error:&v73];
    id v33 = v73;

    if ((v30 & 1) != 0)
    {
      int v34 = 0;
      int v35 = 1;
LABEL_44:
      v18 = v70;
      goto LABEL_45;
    }

    [v33 domain];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    int v35 = [v45 isEqualToString:v63];
    if (v35)
    {
      uint64_t v46 = [v33 code];

      if (v46 != 9)
      {
        int v35 = 0;
        int v34 = 5;
        goto LABEL_44;
      }

      v18 = v70;
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        int v34 = 0;
        int v35 = 1;
        goto LABEL_45;
      }

      [context path];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t st_mode = v24->fts_statp->st_mode;
      id v62 = v33;
      uint64_t fts_path = v29;
      v60 = (char *)v45;
      MOLogWrite();
      int v34 = 0;
    }

    else
    {
      int v34 = 5;
      v18 = v70;
    }

LABEL_45:
    v27 = v66;

    if (v35)
    {
      id v25 = v33;
LABEL_47:
      objc_autoreleasePoolPop(v27);
      goto LABEL_12;
    }

    objc_autoreleasePoolPop(v66);
    if (v34)
    {
      BOOL v58 = v34 == 5;
      goto LABEL_76;
    }

    id v25 = v33;
LABEL_12:
    v19 = fts_read(v18);
    v24 = v19;
    if (!v19)
    {
      char v23 = 1;
      goto LABEL_69;
    }
  }

  v36 = (void *)MEMORY[0x186E26FA4](v19, v20, v21, v22);
  if ((-[MIDataProtectionChangeOperation operationType](self, "operationType") & 1) == 0)
  {
LABEL_53:
    objc_autoreleasePoolPop(v36);
    v18 = v70;
    goto LABEL_12;
  }

  contexta = v36;
  uint64_t v37 = [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v24->fts_path isDirectory:1 relativeToURL:0];
  v77[0] = MEMORY[0x1895F87A8];
  v77[1] = 3221225472LL;
  v77[2] = __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke;
  v77[3] = &unk_189D48C18;
  v77[4] = self;
  v77[5] = v24;
  uint64_t v38 = MEMORY[0x186E27154](v77);
  v39 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v40 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
  id v76 = v25;
  v41 = (void *)v37;
  v67 = (void *)v38;
  LOBYTE(v37) = [v39 setDataProtectionClassOfItemAtURL:v37 toClass:v40 ifPredicate:v38 error:&v76];
  id v33 = v76;

  if ((v37 & 1) != 0)
  {
    int v42 = 0;
    v43 = v41;
    goto LABEL_25;
  }

  [v33 domain];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  int v65 = [v47 isEqualToString:v63];
  if (v65)
  {
    uint64_t v48 = [v33 code];

    v43 = v41;
    if (v48 == 9)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v49 = -[MIDataProtectionChangeOperation newClass](self, "newClass", fts_path, v60, st_mode, v62);
        [v41 path];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t st_mode = v24->fts_statp->st_mode;
        id v62 = v33;
        uint64_t fts_path = v49;
        v60 = (char *)v47;
        MOLogWrite();
        int v42 = 0;
        goto LABEL_42;
      }

      int v42 = 0;
LABEL_25:
      int v44 = 1;
    }

    else
    {
      int v44 = 0;
      int v42 = 5;
    }
  }

  else
  {
    int v42 = 5;
    v43 = v41;
LABEL_42:

    int v44 = v65;
  }

  if (v44)
  {
    id v25 = v33;
    v36 = contexta;
    goto LABEL_53;
  }

  objc_autoreleasePoolPop(contexta);
  if (!v42)
  {
    id v25 = v33;
    v18 = v70;
    goto LABEL_12;
  }

  BOOL v58 = v42 == 5;
  v18 = v70;
LABEL_76:
  v50 = v63;
  if (v58)
  {
LABEL_61:
    objc_msgSend(v33, "domain", fts_path, v60);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v55 isEqualToString:v50])
    {
      uint64_t v56 = [v33 code];

      if (v56 == 1)
      {
        char v23 = 1;
        BOOL *v72 = 1;

        id v25 = 0LL;
        goto LABEL_69;
      }
    }

    else
    {
    }

    if (a4)
    {
      id v25 = v33;
      char v23 = 0;
      *a4 = v25;
    }

    else
    {
      char v23 = 0;
      id v25 = v33;
    }

BOOL __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke( uint64_t a1,  int a2)
{
  if (a2 != 2 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [*(id *)(a1 + 32) newClass];
    MOLogWrite();
  }

  return a2 != 2;
}

uint64_t __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke_2( uint64_t a1,  int a2)
{
  uint64_t result = 0LL;
  if (a2 != 2 && *(_DWORD *)(a1 + 48) != a2)
  {
    if (([*(id *)(a1 + 32) operationType] & 4) != 0 && *(_DWORD *)(a1 + 48) > a2)
    {
      return 0LL;
    }

    else
    {
      if (gLogHandle)
      {
      }

      return 1LL;
    }
  }

  return result;
}

- (void)performChangeOperation
{
  unsigned __int8 v12 = 0;
  id v11 = 0LL;
  BOOL v3 = -[MIDataProtectionChangeOperation _runChangeOperationWasLocked:withError:]( self,  "_runChangeOperationWasLocked:withError:",  &v12,  &v11);
  id v4 = v11;
  if (!v3 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    v5 = -[MIDataProtectionChangeOperation urls](self, "urls");
    uint64_t v9 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
    id v10 = v4;
    id v8 = v5;
    MOLogWrite();
  }

  -[MIDataProtectionChangeOperation completionBlock](self, "completionBlock", v8, v9, v10);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MIDataProtectionChangeOperation completionBlock](self, "completionBlock");
    uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v7)[2](v7, v12, v4);
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (int)newClass
{
  return self->_newClass;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
}

@end