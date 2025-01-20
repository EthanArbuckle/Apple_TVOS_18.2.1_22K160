@interface _CSStore
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (void)initialize;
- (BOOL)isReadOnly;
- (_CSStore)init;
- (_CSStore)initWithCoder:(id)a3;
- (_CSStore)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (_CSStore)initWithError:(id *)a3;
- (id).cxx_construct;
- (id)description;
- (id)initByMovingStore:(void *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessContext:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setUnitIdentifierExhaustionHandler:(id)a3;
@end

@implementation _CSStore

- (_CSStore)init
{
}

- (id)initByMovingStore:(void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS____CSStore;
  v4 = -[_CSStore init](&v21, sel_init);
  v5 = (id *)(v4 + 8);
  if (v4) {
    BOOL v6 = v5 == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    objc_storeStrong(v5, *(id *)a3);
    id v7 = *(id *)a3;
    *(void *)a3 = 0LL;

    __int128 v8 = *(_OWORD *)((char *)a3 + 8);
    __int128 v9 = *(_OWORD *)((char *)a3 + 24);
    __int128 v10 = *(_OWORD *)((char *)a3 + 56);
    *((_OWORD *)v4 + 3) = *(_OWORD *)((char *)a3 + 40);
    *((_OWORD *)v4 + 4) = v10;
    *((_OWORD *)v4 + 1) = v8;
    *((_OWORD *)v4 + 2) = v9;
    __int128 v11 = *(_OWORD *)((char *)a3 + 72);
    __int128 v12 = *(_OWORD *)((char *)a3 + 88);
    __int128 v13 = *(_OWORD *)((char *)a3 + 120);
    *((_OWORD *)v4 + 7) = *(_OWORD *)((char *)a3 + 104);
    *((_OWORD *)v4 + 8) = v13;
    *((_OWORD *)v4 + 5) = v11;
    *((_OWORD *)v4 + 6) = v12;
    __int128 v14 = *(_OWORD *)((char *)a3 + 136);
    __int128 v15 = *(_OWORD *)((char *)a3 + 152);
    __int128 v16 = *(_OWORD *)((char *)a3 + 184);
    *((_OWORD *)v4 + 11) = *(_OWORD *)((char *)a3 + 168);
    *((_OWORD *)v4 + 12) = v16;
    *((_OWORD *)v4 + 9) = v14;
    *((_OWORD *)v4 + 10) = v15;
    __int128 v17 = *(_OWORD *)((char *)a3 + 200);
    __int128 v18 = *(_OWORD *)((char *)a3 + 216);
    __int128 v19 = *(_OWORD *)((char *)a3 + 248);
    *((_OWORD *)v4 + 15) = *(_OWORD *)((char *)a3 + 232);
    *((_OWORD *)v4 + 16) = v19;
    *((_OWORD *)v4 + 13) = v17;
    *((_OWORD *)v4 + 14) = v18;
    *((void *)v4 + 34) = *((void *)a3 + 33);
    *(_OWORD *)(v4 + 280) = *((_OWORD *)a3 + 17);
    atomic_store(0LL, (unint64_t *)v4 + 37);
    atomic_store(0LL, (unint64_t *)v4 + 38);
    *(_OWORD *)(v4 + 312) = *((_OWORD *)a3 + 19);
  }

  return v4;
}

- (_CSStore)initWithError:(id *)a3
{
  id v9 = 0LL;
  CSStore2::Store::_Create((CSStore2 *)&v10, 0LL, 0LL, 0, 0LL, &v9);
  id v5 = v9;
  BOOL v6 = v10;
  if (v10)
  {
    id v7 = -[_CSStore initByMovingStore:](self, "initByMovingStore:", v10);
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {

    id v7 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a3 = v5;
  }
LABEL_7:
  if (v6)
  {

    operator delete(v6);
  }

  return v7;
}

- (_CSStore)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = MEMORY[0x1895F8858](self, a2, a3, a4);
  BOOL v6 = v5;
  id v7 = (void *)v4;
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v9 = v8;
  __int128 v10 = v9;
  if (!v9 || ![v9 isFileURL])
  {
    v20 = (void *)MEMORY[0x189607870];
    *(void *)buf = *MEMORY[0x189607490];
    *(void *)&buf[8] = @"Line";
    *(void *)&__int128 __ptr = @"paramErr";
    *((void *)&__ptr + 1) = &unk_189D697D8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&__ptr forKeys:buf count:2];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v19];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0LL;
    goto LABEL_10;
  }

  id v70 = 0LL;
  __int128 v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v10 options:1 error:&v70];
  __int128 v12 = (CSStore2 *)v70;
  __int128 v13 = v12;
  if (!v11)
  {
    __int128 v18 = 0LL;
    id v19 = 0LL;
    goto LABEL_10;
  }

  CSStore2::GetLog(v12);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = [v11 length];
    LODWORD(__ptr) = 134217984;
    *(void *)((char *)&__ptr + 4) = v51;
    _os_log_debug_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_DEBUG,  "Creating CSStore from file with length %llu",  (uint8_t *)&__ptr,  0xCu);
  }

  if ((unint64_t)[v11 length] >> 32)
  {
    __int128 v15 = (void *)MEMORY[0x189607870];
    *(void *)buf = *MEMORY[0x189607490];
    *(void *)&buf[8] = @"Line";
    *(void *)&__int128 __ptr = @"fileBoundsErr";
    *((void *)&__ptr + 1) = &unk_189D697C0;
    [MEMORY[0x189603F68] dictionaryWithObjects:&__ptr forKeys:buf count:2];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x189607670], -1309);

    __int128 v13 = (void *)v17;
    goto LABEL_8;
  }

  id v19 = v11;
  id v69 = v13;
  CSStore2::Store::_Create( (CSStore2 *)&__ptr,  (Bytef *)[v19 bytes],  (void *)objc_msgSend(v19, "length"),  1,  1,  &v69);
  id v68 = v69;

  __int128 v18 = (id *)__ptr;
  if ((void)__ptr) {
    goto LABEL_30;
  }
  [v68 userInfo];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 objectForKey:@"ZeroedRanges"];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v38 = v37 == 0LL;

  if (v38)
  {
    __int128 v18 = 0LL;
LABEL_30:
    __int128 v13 = v68;
    goto LABEL_10;
  }

  [v68 userInfo];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)[v39 mutableCopy];

  id v66 = v19;
  uint64_t v65 = [v66 bytes];
  unsigned int v40 = [v66 length];
  id v64 = v10;
  v41 = fopen((const char *)[v64 fileSystemRepresentation], "rb");
  if (!v41)
  {
    CSStore2::GetLog(0LL);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__ptr) = 138412290;
      *(void *)((char *)&__ptr + 4) = v64;
      _os_log_error_impl( &dword_183DFE000,  v52,  OS_LOG_TYPE_ERROR,  "verifying map with file: URL %@ could not be opened",  (uint8_t *)&__ptr,  0xCu);
    }

    unsigned int v43 = 4;
    goto LABEL_62;
  }

  uint64_t v42 = 0LL;
  unsigned int v43 = 0;
  uint64_t v44 = v40;
  while (!feof(v41) && !ferror(v41))
  {
    v45 = (CSStore2 *)fread(&__ptr, 1uLL, 0x1000uLL, v41);
    v46 = v45;
    if (!v45) {
      goto LABEL_46;
    }
    if ((unint64_t)v45 <= v44 - v42)
    {
      v48 = (CSStore2 *)memcmp(&__ptr, (const void *)(v65 + v42), (size_t)v45);
      if (!(_DWORD)v48) {
        goto LABEL_46;
      }
      CSStore2::GetLog(v48);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = (char *)v46 + v42;
        _os_log_error_impl( &dword_183DFE000,  v47,  OS_LOG_TYPE_ERROR,  "file/map mismatch between offsets %#zx and %#zx",  buf,  0x16u);
      }

      unsigned int v43 = 1;
    }

    else
    {
      CSStore2::GetLog(v45);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v44;
        _os_log_error_impl( &dword_183DFE000,  v47,  OS_LOG_TYPE_ERROR,  "file/map mismatch: file longer than map of length %#zx",  buf,  0xCu);
      }

      unsigned int v43 = 3;
    }

LABEL_46:
    v42 += (uint64_t)v46;
  }

  v49 = (CSStore2 *)ferror(v41);
  if ((_DWORD)v49)
  {
    CSStore2::GetLog(v49);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__ptr) = 0;
      _os_log_error_impl( &dword_183DFE000,  v50,  OS_LOG_TYPE_ERROR,  "file/map comparison read error",  (uint8_t *)&__ptr,  2u);
    }

    unsigned int v43 = 4;
    goto LABEL_51;
  }

  if (v44 != v42)
  {
    v53 = (CSStore2 *)feof(v41);
    if ((_DWORD)v53)
    {
      CSStore2::GetLog(v53);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__ptr) = 134217984;
        *(void *)((char *)&__ptr + 4) = v44;
        _os_log_error_impl( &dword_183DFE000,  v50,  OS_LOG_TYPE_ERROR,  "file/map mismatch: file shorter than map of length %#zx",  (uint8_t *)&__ptr,  0xCu);
      }

      unsigned int v43 = 2;
LABEL_51:
    }
  }

  fclose(v41);
LABEL_62:

  [MEMORY[0x189607968] numberWithUnsignedInteger:v43];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v67 setObject:v54 forKeyedSubscript:@"filecmp"];

  id v55 = v66;
  CSStore2::Store::_Create( (CSStore2 *)buf,  (Bytef *)[v55 bytes],  (void *)objc_msgSend(v55, "length"),  1,  0,  0);
  v56 = *(CSStore2 ***)buf;
  if (*(void *)buf)
  {
    *(void *)&__int128 __ptr = MEMORY[0x1895F87A8];
    *((void *)&__ptr + 1) = 3221225472LL;
    v73 = ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke;
    v74 = &unk_189D65BA8;
    uint64_t v76 = *(void *)buf;
    id v57 = v67;
    id v75 = v57;
    CSStore2::Store::enumerateTables(v56, &__ptr);
    CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)v56, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 setObject:v59 forKeyedSubscript:@"string$"];
  }

  id v60 = objc_alloc(MEMORY[0x189607870]);
  [v68 domain];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [v68 code];
  v63 = (void *)[v67 copy];
  __int128 v13 = (void *)[v60 initWithDomain:v61 code:v62 userInfo:v63];

  if (v56) {
    std::default_delete<CSStore2::Store>::operator()[abi:nn180100]((id *)v56);
  }
  __int128 v16 = v67;
LABEL_8:

  __int128 v18 = 0LL;
  id v19 = v11;
LABEL_10:

  objc_super v21 = (void *)MEMORY[0x186E27B50]();
  BOOL v22 = v10 == 0LL;
  if (v18) {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    if (v13)
    {
      [v13 userInfo];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = *MEMORY[0x189607760];
      [v23 objectForKeyedSubscript:*MEMORY[0x189607760]];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v26 = v25 == 0LL;

      if (v26)
      {
        [v13 userInfo];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)[v27 mutableCopy];

        [v28 setObject:v10 forKeyedSubscript:v24];
        v29 = (void *)MEMORY[0x189607870];
        [v13 domain];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v13, "code"), v28);

        __int128 v13 = (void *)v31;
      }
    }
  }

  objc_autoreleasePoolPop(v21);
  if (v18) {
    id v32 = 0LL;
  }
  else {
    id v32 = v13;
  }

  id v33 = v32;
  if (v18)
  {
    v34 = (_CSStore *)[v7 initByMovingStore:v18];
    if (!v6) {
      goto LABEL_25;
    }
  }

  else
  {

    v34 = 0LL;
    if (!v6) {
      goto LABEL_25;
    }
  }

  if (!v34) {
    *BOOL v6 = v33;
  }
LABEL_25:
  if (v18)
  {

    operator delete(v18);
  }

  return v34;
}

- (void)setAccessContext:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_accessContext, a3);
  accessContext = self->_accessContext;
  if (accessContext
    && (*(unsigned int (**)(CSStoreAccessContextInterface *))(*(void *)accessContext->_impl.__ptr_ + 40LL))(accessContext->_impl.__ptr_)
    && -[_CSStore setAccessContext:]::once != -1)
  {
    dispatch_once(&-[_CSStore setAccessContext:]::once, &__block_literal_global_124);
  }
}

- (void)setUnitIdentifierExhaustionHandler:(id)a3
{
  id v4 = a3;
  if (performMutatingAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (**(void (***)(CSStoreAccessContextInterface *))accessContext->_impl.__ptr_)(accessContext->_impl.__ptr_);
      if (performMutatingAssertions)
      {
        id v6 = self->_accessContext;
        if (v6) {
          (**(void (***)(CSStoreAccessContextInterface *))v6->_impl.__ptr_)(v6->_impl.__ptr_);
        }
      }
    }
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __47___CSStore_setUnitIdentifierExhaustionHandler___block_invoke;
  v11[3] = &unk_189D65D38;
  id v7 = v4;
  id v12 = v7;
  id v8 = v11;
  id v9 = (void *)[v8 copy];
  id unitIdentifierExhaustionHandler = self->_store.unitIdentifierExhaustionHandler;
  self->_store.id unitIdentifierExhaustionHandler = v9;
}

- (BOOL)isReadOnly
{
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8LL))( accessContext->_impl.__ptr_,  a2);
      if (performConstantAssertions)
      {
        id v4 = self->_accessContext;
        if (v4) {
          (*(void (**)(CSStoreAccessContextInterface *))(*(void *)v4->_impl.__ptr_ + 8LL))(v4->_impl.__ptr_);
        }
      }
    }
  }

  return *(_BYTE *)&self->_store.flags & 1;
}

- (void)setReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (performMutatingAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext)
    {
      (**(void (***)(CSStoreAccessContextInterface *, SEL))accessContext->_impl.__ptr_)( accessContext->_impl.__ptr_,  a2);
      if (performMutatingAssertions)
      {
        id v6 = self->_accessContext;
        if (v6) {
          (**(void (***)(CSStoreAccessContextInterface *))v6->_impl.__ptr_)(v6->_impl.__ptr_);
        }
      }
    }
  }

  if (((((*(_BYTE *)&self->_store.flags & 1) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = 3LL;
    }
    dataContainer = self->_store.dataContainer;
    if (dataContainer)
    {
      uint64_t v9 = *((void *)dataContainer + 1);
      uint64_t v10 = *((unsigned int *)dataContainer + 4);
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
    }

    __int128 v11 = (CSStore2 *)MEMORY[0x186E27EBC](*MEMORY[0x1895FBBE0], v9, v10, 0LL, v7);
    if ((_DWORD)v11)
    {
      int v12 = (int)v11;
      CSStore2::GetLog(v11);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134218752;
        uint64_t v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        _os_log_error_impl( &dword_183DFE000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to set protection of region at %p length %zu to %lx: %lx",  (uint8_t *)&v14,  0x2Au);
      }
    }

    *(_BYTE *)&self->_store.flags = *(_BYTE *)&self->_store.flags & 0xFE | v3;
  }

- (id)mutableCopyWithZone:(_NSZone *)a3 error:(id *)a4
{
  v27[3] = *MEMORY[0x1895F89C0];
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8LL))( accessContext->_impl.__ptr_,  a2);
    }
  }

  dataContainer = self->_store.dataContainer;
  if (dataContainer)
  {
    uint64_t v9 = (Bytef *)*((void *)dataContainer + 1);
    uint64_t v10 = (void *)*((unsigned int *)dataContainer + 4);
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  CSStore2::Store::CreateWithBytes(&v18, v9, v10, a4);
  __int128 v11 = v18;
  if (!v18) {
    return 0LL;
  }
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = __Block_byref_object_copy__87;
  uint64_t v24 = __Block_byref_object_dispose__88;
  id v25 = 0LL;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke;
  v19[3] = &unk_189D65B60;
  v19[4] = &v20;
  CSStore2::Store::enumerateTables(v18, v19);
  uint64_t v12 = v21[5];
  if (v12)
  {
    if (a4)
    {
      __int128 v13 = (void *)MEMORY[0x189607870];
      v26[0] = *MEMORY[0x189607490];
      v26[1] = @"Line";
      v27[0] = @"kCSStoreValidationErr";
      v27[1] = &unk_189D69718;
      v26[2] = @"FullTable";
      v27[2] = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:3];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:*MEMORY[0x189607670] code:-9491 userInfo:v14];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    std::default_delete<CSStore2::Store>::operator()[abi:nn180100]((id *)v11);
    __int128 v11 = 0LL;
  }

  _Block_object_dispose(&v20, 8);

  if (!v11) {
    return 0LL;
  }
  int v15 = *(_DWORD *)(*((void *)self->_store.dataContainer + 1) + 8LL);
  v11[38] = (CSStore2 *)self->_store.pedigree.family;
  *((_DWORD *)v11 + 78) = v15;
  *((_BYTE *)v11 + 316) = 1;
  __int16 v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initByMovingStore:", v11);

  operator delete(v11);
  return v16;
}

- (id)description
{
  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *, SEL))(*(void *)accessContext->_impl.__ptr_ + 8LL))( accessContext->_impl.__ptr_,  a2);
    }
  }

  id v4 = (void *)NSString;
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  dataContainer = self->_store.dataContainer;
  [v4 stringWithFormat:@"<%@ %p> { p = %p, gen = %llu, length = %llu/%llu/%llu }", v6, self, *((void *)dataContainer + 1), *(unsigned int *)(*((void *)dataContainer + 1) + 8), *((unsigned int *)dataContainer + 4), *(unsigned int *)(*((void *)dataContainer + 1) + 12), *(unsigned int *)(*((void *)dataContainer + 1) + 16)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"CSStore.mm", 246, @"Invalid parameter not satisfying: %@", @"[aCoder isKindOfClass:[NSXPCCoder class]]" object file lineNumber description];
  }

  if (performConstantAssertions)
  {
    accessContext = self->_accessContext;
    if (accessContext) {
      (*(void (**)(CSStoreAccessContextInterface *))(*(void *)accessContext->_impl.__ptr_ + 8LL))(accessContext->_impl.__ptr_);
    }
  }

  id v13 = v5;
  uint64_t v7 = @"XPCRepresentation";
  if (v13)
  {
    id v14 = 0LL;
    CSStore2::Store::encodeAsXPCObject((uint64_t)self->_store.dataContainer, &v14);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (CSStore2 *)v14;
    uint64_t v10 = v9;
    if (v8)
    {
      [v13 encodeXPCObject:v8 forKey:@"XPCRepresentation"];
    }

    else
    {
      CSStore2::GetLog(v9);
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v16 = v10;
        _os_log_fault_impl( &dword_183DFE000,  v11,  OS_LOG_TYPE_FAULT,  "Unexpectedly could not encode store: %@",  buf,  0xCu);
      }
    }
  }
}

- (_CSStore)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!self) {
      goto LABEL_15;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"CSStore.mm", 253, @"Invalid parameter not satisfying: %@", @"[aDecoder isKindOfClass:[NSXPCCoder class]]" object file lineNumber description];

    if (!self) {
      goto LABEL_15;
    }
  }

  id v18 = 0LL;
  id v6 = v5;
  uint64_t v7 = @"XPCRepresentation";
  if (!v6)
  {
    id v13 = (void *)MEMORY[0x189607870];
    v19[0] = *MEMORY[0x189607490];
    v19[1] = @"Line";
    v20[0] = @"paramErr";
    v20[1] = &unk_189D69730;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v14];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    uint64_t v9 = 0LL;
    BOOL v12 = 1;
LABEL_10:
    id v11 = v10;
    id v18 = v11;
    goto LABEL_11;
  }

  [v6 decodeXPCObjectOfType:MEMORY[0x1895F9240] forKey:@"XPCRepresentation"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:4864 userInfo:0];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = 0LL;
    goto LABEL_9;
  }

  CSStore2::Store::CreateWithXPCObject(v20, v8, &v18);
  uint64_t v9 = (id *)v20[0];

  uint64_t v10 = 0LL;
  id v11 = 0LL;
  BOOL v12 = v9 == 0LL;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_11:

  id v15 = v18;
  if (v12)
  {
    [v6 failWithError:v15];

    self = 0LL;
  }

  else
  {
    self = -[_CSStore initByMovingStore:](self, "initByMovingStore:", v9);

    operator delete(v9);
  }

LABEL_15:
  return self;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 320) = 0;
  *((_BYTE *)self + 324) = 0;
  *((void *)self + 41) = 0LL;
  *((void *)self + 1) = 0LL;
  *(void *)&__int128 v2 = -1LL;
  *((void *)&v2 + 1) = -1LL;
  *((_OWORD *)self + 1) = v2;
  *((_OWORD *)self + 2) = v2;
  *((_OWORD *)self + 3) = v2;
  *((_OWORD *)self + 4) = v2;
  *((_OWORD *)self + 5) = v2;
  *((_OWORD *)self + 6) = v2;
  *((_OWORD *)self + 7) = v2;
  *((_OWORD *)self + 8) = v2;
  *((_OWORD *)self + 9) = v2;
  *((_OWORD *)self + 10) = v2;
  *((_OWORD *)self + 11) = v2;
  *((_OWORD *)self + 12) = v2;
  *((_OWORD *)self + 13) = v2;
  *((_OWORD *)self + 14) = v2;
  *((_OWORD *)self + 15) = v2;
  *((_OWORD *)self + 16) = v2;
  *((void *)self + 34) = 0LL;
  *((void *)self + 35) = 0LL;
  *((void *)self + 36) = 0LL;
  atomic_store(0LL, (unint64_t *)self + 37);
  atomic_store(0LL, (unint64_t *)self + 38);
  do
    unint64_t v3 = __ldaxr(&CSStore2::Store::Store(void)::nextFamily);
  while (__stlxr(v3 + 1, &CSStore2::Store::Store(void)::nextFamily));
  *((void *)self + 39) = v3;
  *((_BYTE *)self + 320) = 0;
  *((_BYTE *)self + 323) = v7;
  *(_WORD *)((char *)self + 321) = v6;
  *((_BYTE *)self + 324) = 0;
  *((_BYTE *)self + 327) = v5;
  *(_WORD *)((char *)self + 325) = v4;
  *((_BYTE *)self + 336) = 0;
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __int128 v2 = getenv("CS_ENABLE_IO_LOGGING");
    if (v2)
    {
      [NSString stringWithUTF8String:v2];
      unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      int v4 = [v3 BOOLValue];

      if (v4) {
        CSStore2::Writer::logIO = 1;
      }
    }
  }

+ (id)new
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end