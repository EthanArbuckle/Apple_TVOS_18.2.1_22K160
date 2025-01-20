@interface MCMPOSIXUser
+ (BOOL)_isRoleUserWithUID:(unsigned int)a3 homeDirectoryURL:(id)a4;
+ (MCMPOSIXUser)posixUserWithName:(id)a3;
+ (MCMPOSIXUser)posixUserWithUID:(unsigned int)a3;
+ (id)_getCachedUID:(unsigned int)a3 flush:(BOOL)a4 onCacheMiss:(id)a5;
+ (id)_posixUserWithPasswdPtr:(passwd *)a3;
+ (id)_posixUserWithUID:(unsigned int)a3 name:(id)a4 useUID:(BOOL)a5;
+ (id)currentPOSIXUser;
+ (id)nobody;
+ (id)root;
+ (void)flush;
- (BOOL)hasUseableHomeDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPOSIXUser:(id)a3;
- (BOOL)isRoleUser;
- (BOOL)isRoot;
- (MCMPOSIXUser)initWithUID:(unsigned int)a3 primaryGID:(unsigned int)a4 homeDirectoryURL:(id)a5 unvalidatedHomeDirectoryURL:(id)a6 name:(id)a7 roleUser:(BOOL)a8;
- (NSString)name;
- (NSURL)homeDirectoryURL;
- (NSURL)unvalidatedHomeDirectoryURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (unint64_t)hash;
- (unsigned)UID;
- (unsigned)primaryGID;
@end

@implementation MCMPOSIXUser

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __27__MCMPOSIXUser_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)fullDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__MCMPOSIXUser_fullDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  return self->_UID;
}

- (BOOL)isEqualToPOSIXUser:(id)a3
{
  return self->_UID == *((_DWORD *)a3 + 3);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMPOSIXUser *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMPOSIXUser isEqualToPOSIXUser:](self, "isEqualToPOSIXUser:", v4);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(_DWORD *)(v5 + 12) = self->_UID;
    *(_DWORD *)(v5 + 16) = self->_primaryGID;
    uint64_t v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;

    uint64_t v9 = -[NSURL copyWithZone:](self->_homeDirectoryURL, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v9;

    *(_BYTE *)(v6 + 8) = self->_root;
    *(_BYTE *)(v6 + 9) = self->_roleUser;
    *(_BYTE *)(v6 + 10) = self->_useableHomeDirectory;
  }

  return (id)v6;
}

- (MCMPOSIXUser)initWithUID:(unsigned int)a3 primaryGID:(unsigned int)a4 homeDirectoryURL:(id)a5 unvalidatedHomeDirectoryURL:(id)a6 name:(id)a7 roleUser:(BOOL)a8
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MCMPOSIXUser;
  v18 = -[MCMPOSIXUser init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_UID = a3;
    v18->_primaryGID = a4;
    objc_storeStrong((id *)&v18->_homeDirectoryURL, a5);
    objc_storeStrong((id *)&v19->_unvalidatedHomeDirectoryURL, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    v19->_root = a3 == 0;
    v19->_roleUser = a8;
    if (v16)
    {
      [v16 path];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v20 hasPrefix:@"/var/empty"])
      {
        v19->_useableHomeDirectory = 0;
      }

      else
      {
        [v16 path];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v21 hasPrefix:@"/private/var/empty"])
        {
          v19->_useableHomeDirectory = 0;
        }

        else
        {
          [v16 path];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v19->_useableHomeDirectory = [v22 hasPrefix:@"/System/Volumes/Data/private/var/empty"] ^ 1;
        }
      }
    }

    else
    {
      v19->_useableHomeDirectory = 0;
    }
  }

  return v19;
}

- (unsigned)UID
{
  return self->_UID;
}

- (unsigned)primaryGID
{
  return self->_primaryGID;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (NSURL)unvalidatedHomeDirectoryURL
{
  return self->_unvalidatedHomeDirectoryURL;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRoot
{
  return self->_root;
}

- (BOOL)isRoleUser
{
  return self->_roleUser;
}

- (BOOL)hasUseableHomeDirectory
{
  return self->_useableHomeDirectory;
}

- (void).cxx_destruct
{
}

id __31__MCMPOSIXUser_fullDescription__block_invoke(uint64_t a1, char a2)
{
  v4 = (void *)NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 UID];
  uint64_t v9 = [*(id *)(a1 + 32) primaryGID];
  v10 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    [v10 homeDirectoryURL];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 path];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) name];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringByRedactingHomeContent:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>",
      v6,
      v7,
      v8,
      v9,
      @"~~",
      v14);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v10 name];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) homeDirectoryURL];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 path];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v11,
      v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

id __27__MCMPOSIXUser_description__block_invoke(uint64_t a1, char a2)
{
  v4 = (void *)NSString;
  uint64_t v5 = [*(id *)(a1 + 32) UID];
  uint64_t v6 = [*(id *)(a1 + 32) primaryGID];
  uint64_t v7 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    [v7 homeDirectoryURL];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 path];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) name];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringByRedactingHomeContent:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"(%u|%u|%@|%@)", v5, v6, @"~~", v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v7 name];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) homeDirectoryURL];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"(%u|%u|%@|%@)", v5, v6, v8, v10];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)currentPOSIXUser
{
  return (id)[a1 posixUserWithUID:geteuid()];
}

+ (MCMPOSIXUser)posixUserWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [a1 _posixUserWithUID:0 name:v4 useUID:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    container_log_handle_for_category();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_error_impl( &dword_188846000,  v6,  OS_LOG_TYPE_ERROR,  "Could not generate posix user details for user=%{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

  return (MCMPOSIXUser *)v5;
}

+ (MCMPOSIXUser)posixUserWithUID:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__MCMPOSIXUser_posixUserWithUID___block_invoke;
  v7[3] = &__block_descriptor_40_e22___MCMPOSIXUser_12__0I8l;
  v7[4] = a1;
  [a1 _getCachedUID:*(void *)&a3 flush:0 onCacheMiss:v7];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    container_log_handle_for_category();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      unsigned int v9 = a3;
      _os_log_error_impl( &dword_188846000,  v5,  OS_LOG_TYPE_ERROR,  "Could not generate posix user details for uid=%{public}u",  buf,  8u);
    }
  }

  return (MCMPOSIXUser *)v4;
}

+ (id)nobody
{
  return (id)[a1 posixUserWithUID:4294967294];
}

+ (id)root
{
  return (id)[a1 posixUserWithUID:0];
}

+ (void)flush
{
  id v2 = (id)[a1 _getCachedUID:0 flush:1 onCacheMiss:0];
}

+ (id)_posixUserWithUID:(unsigned int)a3 name:(id)a4 useUID:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  size_t v9 = sysconf(71);
  if (v9)
  {
    size_t v10 = v9;
    v11 = (char *)calloc(1uLL, v9);
    memset(&v17, 0, sizeof(v17));
    id v16 = 0LL;
    if (v5) {
      int v12 = getpwuid_r(a3, &v17, v11, v10, &v16);
    }
    else {
      int v12 = getpwnam_r((const char *)[v8 UTF8String], &v17, v11, v10, &v16);
    }
    v14 = 0LL;
    if (!v12 && v16)
    {
      [a1 _posixUserWithPasswdPtr:&v17];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    free(v11);
  }

  else
  {
    container_log_handle_for_category();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17.pw_name) = 0;
      _os_log_fault_impl( &dword_188846000,  v13,  OS_LOG_TYPE_FAULT,  "Could not get _SC_GETPW_R_SIZE_MAX sysconf.",  (uint8_t *)&v17,  2u);
    }

    v14 = 0LL;
  }

  return v14;
}

+ (id)_posixUserWithPasswdPtr:(passwd *)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  bzero(v27, 0x401uLL);
  if (!a3)
  {
    container_log_handle_for_category();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v23) = 0;
      _os_log_fault_impl(&dword_188846000, v14, OS_LOG_TYPE_FAULT, "NULL passwd", (uint8_t *)&v23, 2u);
    }

    BOOL v5 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_20;
  }

  [NSString stringWithUTF8String:a3->pw_name];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  pw_dir = a3->pw_dir;
  if (pw_dir)
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFileSystemRepresentation:a3->pw_dir];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringByRedactingHomeContent:v5];
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!container_realpath())
    {
      container_log_handle_for_category();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [NSString stringWithUTF8String:v27];
        passwd v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 stringByRedactingHomeContent:v5];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543618;
        objc_super v24 = v9;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEFAULT,  "container_realpath([%{public}@]) → [%{public}@]",  (uint8_t *)&v23,  0x16u);
      }

      [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v27 isDirectory:1 relativeToURL:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

    int v10 = *__error();
    container_log_handle_for_category();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 2)
    {
      if (v12)
      {
        int v23 = 138543362;
        objc_super v24 = v9;
        _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "User home directory at [%{public}@] does not exist",  (uint8_t *)&v23,  0xCu);
      }

      v13 = 0LL;
LABEL_15:
      uint64_t v15 = [a1 _isRoleUserWithUID:a3->pw_uid homeDirectoryURL:v7];

      goto LABEL_16;
    }

    if (v12)
    {
      int v22 = *__error();
      int v23 = 138543618;
      objc_super v24 = v9;
      __int16 v25 = 1026;
      LODWORD(v26) = v22;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "container_realpath([%{public}@]) failed: %{public, darwin.errno}d",  (uint8_t *)&v23,  0x12u);
    }

LABEL_20:
    v13 = 0LL;
    v19 = 0LL;
    goto LABEL_21;
  }

  uint64_t v7 = 0LL;
  v13 = 0LL;
  uint64_t v15 = 1LL;
LABEL_16:
  v19 = (void *)[objc_alloc((Class)a1) initWithUID:a3->pw_uid primaryGID:a3->pw_gid homeDirectoryURL:v13 unvalidatedHomeDirectoryURL:v7 name:v5 roleUser:v15];
LABEL_21:
  id v20 = v19;

  return v20;
}

+ (id)_getCachedUID:(unsigned int)a3 flush:(BOOL)a4 onCacheMiss:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v7 = (void (**)(id, void))a5;
  if (_getCachedUID_flush_onCacheMiss__onceToken != -1) {
    dispatch_once(&_getCachedUID_flush_onCacheMiss__onceToken, &__block_literal_global_12829);
  }
  id v8 = (id)_getCachedUID_flush_onCacheMiss__cache;
  objc_sync_enter(v8);
  if (v5) {
    [(id)_getCachedUID_flush_onCacheMiss__cache removeAllObjects];
  }
  size_t v9 = (void *)_getCachedUID_flush_onCacheMiss__cache;
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!v11)
    {
      v7[2](v7, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        BOOL v12 = (void *)_getCachedUID_flush_onCacheMiss__cache;
        [MEMORY[0x189607968] numberWithUnsignedInt:v6];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
    }
  }

  objc_sync_exit(v8);

  return v11;
}

+ (BOOL)_isRoleUserWithUID:(unsigned int)a3 homeDirectoryURL:(id)a4
{
  return a3 < 0x1F5;
}

void __48__MCMPOSIXUser__getCachedUID_flush_onCacheMiss___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FC8] dictionaryWithCapacity:3];
  v1 = (void *)_getCachedUID_flush_onCacheMiss__cache;
  _getCachedUID_flush_onCacheMiss__cache = v0;
}

id __33__MCMPOSIXUser_posixUserWithUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) _posixUserWithUID:a2 name:&stru_18A29E970 useUID:1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    container_log_handle_for_category();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [v2 fullDescription];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl( &dword_188846000,  v3,  OS_LOG_TYPE_DEFAULT,  "Created new POSIX user: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }

  return v2;
}

@end