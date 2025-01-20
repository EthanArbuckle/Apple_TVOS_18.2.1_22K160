@interface NSError
@end

@implementation NSError

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v8;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2;
    v23[3] = &unk_189FE9850;
    uint64_t v10 = *(void *)(a1 + 32);
    id v24 = v9;
    uint64_t v25 = v10;
    [v9 enumerateObjectsUsingBlock:v23];

    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4;
    v22[3] = &unk_189FE9878;
    v22[4] = *(void *)(a1 + 32);
    [v8 enumerateObjectsUsingBlock:v22];
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ([v7 isEqualToString:*MEMORY[0x189607798]]) {
      goto LABEL_9;
    }
LABEL_8:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6;
    v21[3] = &unk_189FE98A0;
    v21[4] = *(void *)(a1 + 32);
    [v8 enumerateKeysAndObjectsUsingBlock:v21];
  }

  else
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v11 = +[SUCoreErrorInformation safeUserInfoValueClasses](&OBJC_CLASS___SUCoreErrorInformation, "safeUserInfoValueClasses");
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8;
    v13[3] = &unk_189FE9828;
    id v14 = v8;
    id v12 = v11;
    id v15 = v12;
    v16 = &v17;
    [v12 enumerateObjectsUsingBlock:v13];
    if (!*((_BYTE *)v18 + 24))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v17, 8);
  }

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  +[SUCoreErrorInformation safeUserInfoValueClasses](&OBJC_CLASS___SUCoreErrorInformation, "safeUserInfoValueClasses");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3;
  v12[3] = &unk_189FE9828;
  id v10 = v8;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  id v15 = &v16;
  [v11 enumerateObjectsUsingBlock:v12];
  if (!*((_BYTE *)v17 + 24))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  _Block_object_dispose(&v16, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v6 = +[SUCoreErrorInformation safeUserInfoValueClasses](&OBJC_CLASS___SUCoreErrorInformation, "safeUserInfoValueClasses");
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5;
  v9[3] = &unk_189FE9828;
  id v7 = v5;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  id v12 = &v13;
  [v8 enumerateObjectsUsingBlock:v9];
  if (!*((_BYTE *)v14 + 24))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

  _Block_object_dispose(&v13, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v15 = 0LL;
    char v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    +[SUCoreErrorInformation safeUserInfoValueClasses](&OBJC_CLASS___SUCoreErrorInformation, "safeUserInfoValueClasses");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7;
    v11[3] = &unk_189FE9828;
    id v12 = v8;
    id v10 = v9;
    id v13 = v10;
    id v14 = &v15;
    [v10 enumerateObjectsUsingBlock:v11];
    if (!*((_BYTE *)v16 + 24))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

@end