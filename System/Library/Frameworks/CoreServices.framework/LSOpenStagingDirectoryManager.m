@interface LSOpenStagingDirectoryManager
+ (id)sharedServerInstance;
- (LSOpenStagingDirectoryManager)initWithIOPersonality:(id)a3;
- (id).cxx_construct;
- (id)_locked_stagingDirectoryForKey:(unint64_t)a3;
- (id)_stagingDirectoryForKeyRefreshingIfNecessary:(unint64_t)a3;
- (id)mainDataVolumeStagingURLWithError:(id *)a3;
- (id)stagingDirectoryForCloningFileHandle:(id)a3 error:(id *)a4;
- (id)stagingDirectoryForCloningURL:(id)a3 error:(id *)a4;
- (optional<unsigned)bootstrapBaseStagingDirectoryNode:(id)a3 error:(id *)a4;
- (void)_locked_updatePersonaStagingDirectories;
@end

@implementation LSOpenStagingDirectoryManager

- (optional<unsigned)bootstrapBaseStagingDirectoryNode:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  LOBYTE(v19) = 0;
  LOBYTE(v20) = 0;
  uint64_t v19 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForNode:error:]( self->_ioPersonality,  "stagingDirectoryKeyForNode:error:",  v6,  a4);
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = v6;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = v8;
    *(_DWORD *)&buf[16] = -1;
    v9 = std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,LaunchServices::OpenStaging::StagingDirectoryInfo>( (uint64_t)&self->_stagingDirectoryInfoMap,  (unint64_t *)&v19,  &v19,  (LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    char v11 = v10;
    LaunchServices::OpenStaging::StagingDirectoryInfo::~StagingDirectoryInfo((LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    if ((v11 & 1) != 0)
    {
      _LSDefaultLog();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (id)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%llu", v19);
        [v8 URL];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Configured open staging directory for key %@ at %@",  buf,  0x16u);
      }
    }

    else
    {
      _LSDefaultLog();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (id)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%llu", v19);
        [(id)v9[4] URL];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Already have a staging directory for key %@ at %@",  buf,  0x16u);
      }
    }
  }

  v17.__val_ = v19;
  BOOL v18 = v20;
  result.__engaged_ = v18;
  result.var0 = v17;
  return result;
}

- (LSOpenStagingDirectoryManager)initWithIOPersonality:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___LSOpenStagingDirectoryManager;
  id v6 = -[LSOpenStagingDirectoryManager init](&v34, sel_init);
  char v7 = v6;
  if (v6)
  {
    p_ioPersonality = (void **)&v6->_ioPersonality;
    objc_storeStrong((id *)&v6->_ioPersonality, a3);
    v7->_personaGeneration = 0LL;
    if (v7->_mainStagingDirectoryKey.__engaged_) {
      v7->_mainStagingDirectoryKey.__engaged_ = 0;
    }
    v9 = *p_ioPersonality;
    id v33 = 0LL;
    id v10 = v9;
    [v10 mainUserContainerURL];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 makeStagingDirectoryNodeInContainer:v11 error:&v33];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    id v13 = v33;
    v14 = v13;
    if (v12)
    {
      id v32 = v13;
      uint64_t v15 = -[LSOpenStagingDirectoryManager bootstrapBaseStagingDirectoryNode:error:]( v7,  "bootstrapBaseStagingDirectoryNode:error:",  v12,  &v32);
      BOOL v17 = v16;
      id v18 = v32;

      v7->_mainStagingDirectoryKey.var0.__val_ = v15;
      v7->_mainStagingDirectoryKey.__engaged_ = v17;
      if (v17) {
        goto LABEL_12;
      }
      _LSDefaultLog();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.4();
      }
    }

    else
    {
      _LSDefaultLog();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.3();
      }
      id v18 = v14;
    }

LABEL_12:
    BOOL v20 = *p_ioPersonality;
    id v31 = v18;
    id v21 = v20;
    [v21 mainSystemContainerURL];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 makeStagingDirectoryNodeInContainer:v22 error:&v31];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    id v24 = v31;
    if (v23)
    {
      id v30 = v24;
      -[LSOpenStagingDirectoryManager bootstrapBaseStagingDirectoryNode:error:]( v7,  "bootstrapBaseStagingDirectoryNode:error:",  v23,  &v30);
      char v26 = v25;
      id v27 = v30;

      if (v26)
      {
LABEL_20:

        -[LSOpenStagingDirectoryManager _locked_updatePersonaStagingDirectories]( v7,  "_locked_updatePersonaStagingDirectories");
        goto LABEL_21;
      }

      _LSDefaultLog();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.2();
      }
    }

    else
    {
      _LSDefaultLog();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.1();
      }
      id v27 = v24;
    }

    goto LABEL_20;
  }

+ (id)sharedServerInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken != -1) {
    dispatch_once(&+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken, block);
  }
  return (id)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;
}

void __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = objc_alloc_init(&OBJC_CLASS___LSServerOpenStagingIOPersonality);
  uint64_t v2 = objc_msgSend(v1, "initWithIOPersonality:");
  v3 = (void *)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;
  +[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance = v2;
}

- (void)_locked_updatePersonaStagingDirectories
{
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_debug_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_DEBUG,  "Persona generation %llu of staging directory manager is current.",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

- (id)_locked_stagingDirectoryForKey:(unint64_t)a3
{
  unint64_t v5 = a3;
  uint64_t v3 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::find<unsigned long long>( &self->_stagingDirectoryInfoMap.__table_.__bucket_list_.__ptr_.__value_,  &v5);
  if (v3)
  {
    [v3[4] URL];
    uint64_t v3 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_stagingDirectoryForKeyRefreshingIfNecessary:(unint64_t)a3
{
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  -[LSOpenStagingDirectoryManager _locked_updatePersonaStagingDirectories]( self,  "_locked_updatePersonaStagingDirectories");
  -[LSOpenStagingDirectoryManager _locked_stagingDirectoryForKey:](self, "_locked_stagingDirectoryForKey:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_mutex);
  return v6;
}

- (id)stagingDirectoryForCloningURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  char v7 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", v6, 0LL, a4);
  uint64_t v8 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForNode:error:]( self->_ioPersonality,  "stagingDirectoryKeyForNode:error:",  v7,  a4);
  if (!v9)
  {
LABEL_6:
    id v10 = 0LL;
    goto LABEL_7;
  }

  -[LSOpenStagingDirectoryManager _stagingDirectoryForKeyRefreshingIfNecessary:]( self,  "_stagingDirectoryForKeyRefreshingIfNecessary:",  v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Could not find open staging directory for URL %@", v6];
    v12 = (void *)v11;
    if (a4)
    {
      uint64_t v15 = *MEMORY[0x189607490];
      v16[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  2LL,  (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningURL:error:]",  398LL,  v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_6;
  }

- (id)stagingDirectoryForCloningFileHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForFileHandle:error:]( self->_ioPersonality,  "stagingDirectoryKeyForFileHandle:error:",  v6,  a4);
  if (v8)
  {
    uint64_t v9 = -[LSOpenStagingDirectoryManager _stagingDirectoryForKeyRefreshingIfNecessary:]( self,  "_stagingDirectoryForKeyRefreshingIfNecessary:",  v7);
    id v10 = (void *)v9;
    if (a4 && !v9)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  2LL,  (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningFileHandle:error:]",  410LL,  0LL);
      id v10 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)mainDataVolumeStagingURLWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (!self->_mainStagingDirectoryKey.__engaged_)
  {
    os_unfair_lock_unlock(p_mutex);
    if (!a3)
    {
LABEL_7:
      id v6 = 0LL;
      return v6;
    }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 80) = 0;
  return self;
}

- (void)initWithIOPersonality:.cold.1()
{
}

- (void)initWithIOPersonality:.cold.2()
{
}

- (void)initWithIOPersonality:.cold.3()
{
}

- (void)initWithIOPersonality:.cold.4()
{
}

@end