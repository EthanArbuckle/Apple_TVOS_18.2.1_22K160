@interface MCMContainerClassPath
+ (BOOL)_inLibraryRepairBlock_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8;
+ (id)_baseURLForUserIdentity:(id)a3;
+ (id)_baseURLForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)_categoryComponentForContainerClass:(unint64_t)a3;
+ (id)_classComponentForContainerClass:(unint64_t)a3;
+ (id)containerPathForContainerIdentity:(id)a3;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4;
+ (id)containerPathTypeClasses;
+ (id)posixOwnerForContainerClass:(unint64_t)a3 user:(id)a4;
+ (unsigned)_modeForContainerClass:(unint64_t)a3;
- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 error:(id *)a7;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)createIfNecessaryWithError:(id *)a3;
- (BOOL)exists;
- (BOOL)isCaseSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerClassPath:(id)a3;
- (BOOL)supportsDataProtection;
- (MCMContainerClassPath)initWithBaseURL:(id)a3 categoryComponent:(id)a4 classComponent:(id)a5 containerClass:(unint64_t)a6 POSIXOwner:(id)a7 POSIXMode:(unsigned __int16)a8 userIdentity:(id)a9;
- (MCMPOSIXUser)posixOwner;
- (MCMUserIdentity)userIdentity;
- (NSString)categoryComponent;
- (NSString)classComponent;
- (NSString)description;
- (NSURL)baseURL;
- (NSURL)categoryURL;
- (NSURL)classURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)posixMode;
- (void)setExists:(BOOL)a3;
@end

@implementation MCMContainerClassPath

- (BOOL)createIfNecessaryWithError:(id *)a3
{
  if (self->_classURLCreated) {
    return 1;
  }
  v6 = -[MCMContainerClassPath classURL](self, "classURL");
  uint64_t v7 = -[MCMContainerClassPath posixMode](self, "posixMode");
  v8 = -[MCMContainerClassPath posixOwner](self, "posixOwner");
  self->_classURLCreated = -[MCMContainerClassPath _createURLIfNecessary:mode:owner:dataProtectionClass:error:]( self,  "_createURLIfNecessary:mode:owner:dataProtectionClass:error:",  v6,  v7,  v8,  0xFFFFFFFFLL,  a3);

  return self->_classURLCreated;
}

- (BOOL)isCaseSensitive
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!self->_classURLCreated)
  {
    container_log_handle_for_category();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[MCMContainerClassPath isCaseSensitive]";
      _os_log_fault_impl( &dword_188846000,  v3,  OS_LOG_TYPE_FAULT,  "%{public}s called before createIfNecessaryWithError:, result may not be valid",  buf,  0xCu);
    }
  }

  if (!self->_caseSensitiveDetermined)
  {
    v4 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    v5 = -[MCMContainerClassPath classURL](self, "classURL");
    id v10 = 0LL;
    int v6 = [v4 checkFileSystemAtURL:v5 isCaseSensitive:&self->_caseSensitive canAtomicSwap:0 error:&v10];
    uint64_t v7 = (char *)v10;

    if (v6)
    {
      self->_caseSensitiveDetermined = 1;
    }

    else
    {
      container_log_handle_for_category();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Could not determine case sensitivity: %@",  buf,  0xCu);
      }
    }
  }

  return self->_caseSensitive;
}

- (BOOL)supportsDataProtection
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!self->_classURLCreated)
  {
    container_log_handle_for_category();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[MCMContainerClassPath supportsDataProtection]";
      _os_log_fault_impl( &dword_188846000,  v3,  OS_LOG_TYPE_FAULT,  "%{public}s called before createIfNecessaryWithError:, result may not be valid",  buf,  0xCu);
    }
  }

  if (!self->_supportsDataProtectionDetermined)
  {
    v4 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    v5 = -[MCMContainerClassPath classURL](self, "classURL");
    id v10 = 0LL;
    int v6 = [v4 checkFileSystemAtURL:v5 supportsPerFileKeys:&self->_supportsDataProtection error:&v10];
    uint64_t v7 = (char *)v10;

    if (v6)
    {
      self->_supportsDataProtectionDetermined = 1;
    }

    else
    {
      container_log_handle_for_category();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_188846000, v8, OS_LOG_TYPE_ERROR, "Could not determine dp support: %@", buf, 0xCu);
      }
    }
  }

  return self->_supportsDataProtection;
}

- (BOOL)exists
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classURLCreated)
  {
    v3 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    v4 = -[MCMContainerClassPath classURL](v2, "classURL");
    v2->_BOOL exists = [v3 itemExistsAtURL:v4];
  }

  BOOL exists = v2->_exists;
  objc_sync_exit(v2);

  return exists;
}

- (void)setExists:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (a3)
  {
    char v4 = 1;
    v5 = obj;
  }

  else
  {
    char v4 = 0;
    v5 = obj;
    obj->_caseSensitiveDetermined = 0;
    obj->_supportsDataProtectionDetermined = 0;
  }

  v5->_BOOL exists = v4;
  v5->_classURLCreated = v4;
  objc_sync_exit(v5);
}

- (MCMContainerClassPath)initWithBaseURL:(id)a3 categoryComponent:(id)a4 classComponent:(id)a5 containerClass:(unint64_t)a6 POSIXOwner:(id)a7 POSIXMode:(unsigned __int16)a8 userIdentity:(id)a9
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a7;
  id v16 = a9;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___MCMContainerClassPath;
  v17 = -[MCMContainerClassPath init](&v42, sel_init);
  v18 = v17;
  if (v17)
  {
    p_userIdentity = &v17->_userIdentity;
    *(_WORD *)&v17->_classURLCreated = 0;
    *(_DWORD *)&v17->_caseSensitive = 0;
    objc_storeStrong((id *)&v17->_userIdentity, a9);
    objc_storeStrong((id *)&v18->_baseURL, a3);
    objc_storeStrong((id *)&v18->_categoryComponent, a4);
    objc_storeStrong((id *)&v18->_classComponent, a5);
    v18->_containerClass = a6;
    objc_storeStrong((id *)&v18->_posixOwner, a7);
    v18->_posixMode = a8;
    if (v18->_baseURL)
    {
      if (*p_userIdentity)
      {
        id v20 = containermanager_copy_global_configuration();
        int v21 = objc_msgSend(v20, "isUnsupportedBundleContainerWithContainerClass:", a6, v38, v39, v40, v41);

        if (v21)
        {
          container_log_handle_for_category();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            unint64_t v44 = a6;
            v23 = "Attempted to create a class path with an unsupported bundle class: %{public}llu";
LABEL_23:
            _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
          }
        }

        else
        {
          id v25 = containermanager_copy_global_configuration();
          int v26 = [v25 isUnsupportedSystemContainerWithContainerClass:a6];

          if (!v26)
          {
            p_categoryURL = (id *)&v18->_categoryURL;
            objc_storeStrong((id *)&v18->_categoryURL, v18->_baseURL);
            categoryComponent = v18->_categoryComponent;
            if (categoryComponent)
            {
              uint64_t v31 = [*p_categoryURL URLByAppendingPathComponent:categoryComponent isDirectory:1];
              id v32 = *p_categoryURL;
              id *p_categoryURL = (id)v31;
            }

            p_classURL = (id *)&v18->_classURL;
            objc_storeStrong((id *)&v18->_classURL, v18->_categoryURL);
            classComponent = v18->_classComponent;
            if (classComponent)
            {
              uint64_t v35 = [*p_classURL URLByAppendingPathComponent:classComponent isDirectory:1];
              id v36 = *p_classURL;
              id *p_classURL = (id)v35;
            }

            uint64_t v37 = [v16 homeDirectoryURL];
            homeDirectoryURL = v18->_homeDirectoryURL;
            v18->_homeDirectoryURL = (NSURL *)v37;
            goto LABEL_15;
          }

          container_log_handle_for_category();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            unint64_t v44 = a6;
            v23 = "Attempted to create a class path with an unsupported system class: %{public}llu";
            goto LABEL_23;
          }
        }

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __36__MCMContainerClassPath_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MCMContainerClassPath categoryComponent](self, "categoryComponent");
  uint64_t v6 = [v5 hash];
  -[MCMContainerClassPath classComponent](self, "classComponent");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 hash];
  v9 = -[MCMContainerClassPath userIdentity](self, "userIdentity");
  [v9 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];

  return v6 ^ v4 ^ v8 ^ v11;
}

- (BOOL)isEqualToContainerClassPath:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_baseURL, v4[4])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_categoryComponent, v4[10])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_classComponent, v4[11])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_categoryURL, v4[5])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_classURL, v4[6])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_userIdentity, v4[8]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMContainerClassPath *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MCMContainerClassPath isEqualToContainerClassPath:](self, "isEqualToContainerClassPath:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_baseURL);
    objc_storeStrong((id *)(v5 + 80), self->_categoryComponent);
    objc_storeStrong((id *)(v5 + 88), self->_classComponent);
    objc_storeStrong((id *)(v5 + 40), self->_categoryURL);
    objc_storeStrong((id *)(v5 + 48), self->_classURL);
    *(void *)(v5 + 72) = self->_containerClass;
    *(_BYTE *)(v5 + 8) = self->_caseSensitive;
    *(_BYTE *)(v5 + 10) = self->_supportsDataProtection;
    *(_BYTE *)(v5 + 24) = self->_exists;
    objc_storeStrong((id *)(v5 + 56), self->_posixOwner);
    *(_WORD *)(v5 + 26) = self->_posixMode;
    objc_storeStrong((id *)(v5 + 64), self->_userIdentity);
  }

  return (id)v5;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = [a3 isEqual:a4];
  }
  return result;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 error:(id *)a7
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v12 = a5;
  id v13 = a3;
  v14 = +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  [v14 libraryRepairForUserIdentity:self->_userIdentity];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke;
  v18[3] = &unk_18A29E538;
  unsigned __int16 v21 = a4;
  v18[4] = self;
  id v19 = v12;
  int v20 = a6;
  id v16 = v12;
  LOBYTE(a7) = [v15 fixAndRetryIfPermissionsErrorWithURL:v13 containerPath:0 containerIdentifier:0 error:a7 duringBlock:v18];

  return (char)a7;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)categoryURL
{
  return self->_categoryURL;
}

- (NSURL)classURL
{
  return self->_classURL;
}

- (MCMPOSIXUser)posixOwner
{
  return self->_posixOwner;
}

- (unsigned)posixMode
{
  return self->_posixMode;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)categoryComponent
{
  return self->_categoryComponent;
}

- (NSString)classComponent
{
  return self->_classComponent;
}

- (void).cxx_destruct
{
}

uint64_t __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_msgSend( (id)objc_opt_class(),  "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:",  v5,  *(unsigned __int16 *)(a1 + 52),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48),  0,  a3);

  return v6;
}

id __36__MCMContainerClassPath_description__block_invoke(uint64_t a1, int a2)
{
  unsigned __int16 v21 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  [v5 userIdentity];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 personaUniqueString];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) baseURL];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 path];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  uint64_t v11 = v9;
  if (a2)
  {
    [v9 redactedDescription];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) categoryComponent];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [*(id *)(a1 + 32) classComponent];
  v14 = (void *)v13;
  v15 = *(_BYTE **)(a1 + 32);
  id v16 = " created";
  v17 = "";
  if (!v15[12]) {
    id v16 = "";
  }
  if (v15[9])
  {
    if (v15[8]) {
      v17 = " case-sensitive";
    }
    else {
      v17 = " case-insensitive";
    }
  }

  if (v15[11])
  {
    if (v15[10]) {
      v18 = " dp-enabled";
    }
    else {
      v18 = " dp-disabled";
    }
  }

  else
  {
    v18 = "";
  }

  objc_msgSend( v21,  "stringWithFormat:",  @"<%@: %p; persona [%@]; [%@]/[%@]/[%@]%s%s%s>",
    v22,
    v5,
    v7,
    v11,
    v12,
    v13,
    v16,
    v17,
    v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2) {
  return v19;
  }
}

+ (id)containerPathTypeClasses
{
  if (containerPathTypeClasses_onceToken != -1) {
    dispatch_once(&containerPathTypeClasses_onceToken, &__block_literal_global_12212);
  }
  return (id)containerPathTypeClasses_typeClasses;
}

+ (id)containerPathForContainerIdentity:(id)a3
{
  id v4 = a3;
  [v4 userIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 containerClass];

  [a1 containerPathForUserIdentity:v5 containerClass:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6 = a3;
  [a1 _baseURLForUserIdentity:v6 containerClass:a4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _categoryComponentForContainerClass:a4];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _classComponentForContainerClass:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 posixUser];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 posixOwnerForContainerClass:a4 user:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v12 = (void *)objc_msgSend( objc_alloc((Class)a1),  "initWithBaseURL:categoryComponent:classComponent:containerClass:POSIXOwner:POSIXMode:userIdentity:",  v7,  v8,  v9,  a4,  v11,  objc_msgSend(a1, "_modeForContainerClass:", a4),  v6);
  return v12;
}

+ (id)posixOwnerForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  if (a3 <= 0xE && ((1LL << a3) & 0x412A) != 0)
  {
    id v6 = containermanager_copy_global_configuration();
    char v7 = [v6 isUnsupportedBundleContainerWithContainerClass:a3];

    if ((v7 & 1) == 0)
    {
      id v11 = containermanager_copy_global_configuration();
      uint64_t v12 = [v11 bundleContainerOwner];
LABEL_9:
      id v10 = (id)v12;

      goto LABEL_10;
    }
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    id v8 = containermanager_copy_global_configuration();
    char v9 = [v8 isUnsupportedSystemContainerWithContainerClass:a3];

    if ((v9 & 1) == 0)
    {
      id v11 = containermanager_copy_global_configuration();
      uint64_t v12 = [v11 systemContainerOwner];
      goto LABEL_9;
    }
  }

  id v10 = v5;
LABEL_10:

  return v10;
}

+ (BOOL)_inLibraryRepairBlock_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = a4;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a5;
  BOOL v27 = 0;
  v15 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v26 = 0LL;
  char v16 = [v15 itemAtURL:v13 exists:&v27 error:&v26];
  id v17 = v26;

  if ((v16 & 1) == 0)
  {
    container_log_handle_for_category();
    unsigned __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    [v13 path];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v23;
    __int16 v30 = 2112;
    id v31 = v17;
    v24 = "Failed to determine if dir at [%@] exists: %@";
    goto LABEL_15;
  }

  if (!v27)
  {
    v18 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v25 = 0LL;
    char v19 = [v18 createDirectoryAtURL:v13 withIntermediateDirectories:1 mode:v12 owner:v14 dataProtectionClass:v10 error:&v25];
    id v17 = v25;

    if ((v19 & 1) == 0)
    {
      container_log_handle_for_category();
      unsigned __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      [v13 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v17;
      v24 = "Failed to create dir at [%@]: %@";
LABEL_15:
      _os_log_error_impl(&dword_188846000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

LABEL_8:
      if (a8)
      {
        id v17 = v17;
        BOOL v20 = 0;
        *a8 = v17;
      }

      else
      {
        BOOL v20 = 0;
      }

      goto LABEL_11;
    }
  }

  if (a7) {
    *a7 = v27;
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

+ (unsigned)_modeForContainerClass:(unint64_t)a3
{
  return 493;
}

+ (id)_categoryComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD) {
    return 0LL;
  }
  else {
    return off_18A29E578[a3 - 1];
  }
}

+ (id)_classComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_18A29E5E8[a3 - 1];
  }
}

+ (id)_baseURLForUserIdentity:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 homeDirectoryURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    container_log_handle_for_category();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315394;
      char v9 = "+[MCMContainerClassPath _baseURLForUserIdentity:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_fault_impl( &dword_188846000,  v5,  OS_LOG_TYPE_FAULT,  "%s: User identity has a nil home directory; userIdentity = %@",
        (uint8_t *)&v8,
        0x16u);
    }
  }

  [v4 URLByAppendingPathComponent:@"Containers" isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_baseURLForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = containermanager_copy_global_configuration();
  int v8 = [v7 isGlobalContainerClass:a4];

  if (v8)
  {
    id v9 = containermanager_copy_global_configuration();
    [v9 sharedContainersDirectory];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (v6)
  {
    [a1 _baseURLForUserIdentity:v6];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = a4;
      _os_log_fault_impl( &dword_188846000,  v11,  OS_LOG_TYPE_FAULT,  "Container class [%llu] requires a user identity.",  (uint8_t *)&v13,  0xCu);
    }

    __int16 v10 = 0LL;
  }

  return v10;
}

void __49__MCMContainerClassPath_containerPathTypeClasses__block_invoke()
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x189603F18] arrayWithObjects:v2 count:5];
  v1 = (void *)containerPathTypeClasses_typeClasses;
  containerPathTypeClasses_typeClasses = v0;
}

@end