@interface MCMContainerPath
+ (Class)_containerClassPathClass;
+ (id)_posixOwnerForContainerSubdirectories:(unint64_t)a3 user:(id)a4;
+ (id)containerPathForContainerClassPath:(id)a3 containerPathIdentifier:(id)a4;
+ (id)containerPathForContainerIdentity:(id)a3 containerPathIdentifier:(id)a4;
+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 containerPathIdentifier:(id)a5;
+ (id)containerPathFromURL:(id)a3 containerClassPath:(id)a4 relativePath:(id *)a5;
+ (id)containerPathIdentifierForCodeSignIdentifier:(id)a3 containerClass:(unint64_t)a4;
- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)createDataURLIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4;
- (BOOL)createIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4;
- (BOOL)exists;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerPath:(id)a3;
- (BOOL)isRandomized;
- (BOOL)transient;
- (MCMContainerClassPath)containerClassPath;
- (MCMContainerPath)initWithContainerClassPath:(id)a3 containerPathIdentifier:(id)a4 containerRootComponent:(id)a5 containerDataComponent:(id)a6;
- (MCMPOSIXUser)dataPOSIXOwner;
- (MCMPOSIXUser)rootPOSIXOwner;
- (MCMPOSIXUser)schemaPOSIXOwner;
- (MCMUserIdentity)userIdentity;
- (NSString)containerDataComponent;
- (NSString)containerPathIdentifier;
- (NSString)containerRootComponent;
- (NSString)description;
- (NSURL)baseURL;
- (NSURL)categoryURL;
- (NSURL)classURL;
- (NSURL)containerDataURL;
- (NSURL)containerRootURL;
- (NSURL)metadataURL;
- (id)containerPathForRealPath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)dataPOSIXMode;
- (unsigned)rootPOSIXMode;
- (unsigned)schemaPOSIXMode;
- (void)setExists:(BOOL)a3;
@end

@implementation MCMContainerPath

- (BOOL)createIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unsigned __int8 v21 = 0;
  v7 = -[MCMContainerPath containerClassPath](self, "containerClassPath");
  id v20 = 0LL;
  int v8 = [v7 createIfNecessaryWithError:&v20];
  id v9 = v20;

  if (v8)
  {
    v10 = -[MCMContainerPath containerRootURL](self, "containerRootURL");
    uint64_t v11 = -[MCMContainerPath rootPOSIXMode](self, "rootPOSIXMode");
    v12 = -[MCMContainerPath rootPOSIXOwner](self, "rootPOSIXOwner");
    id v19 = v9;
    BOOL v13 = -[MCMContainerPath _createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:]( self,  "_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:",  v10,  v11,  v12,  v5,  &v21,  &v19);
    id v14 = v19;

    if (v13)
    {
      id v18 = v14;
      BOOL v15 = -[MCMContainerPath createDataURLIfNecessaryWithDataProtectionClass:error:]( self,  "createDataURLIfNecessaryWithDataProtectionClass:error:",  v5,  &v18);
      id v9 = v18;

      if (v15)
      {
        -[MCMContainerPath setExists:](self, "setExists:", v21);
        BOOL v16 = 1;
        goto LABEL_9;
      }
    }

    else
    {
      id v9 = v14;
    }
  }

  if (a4)
  {
    id v9 = v9;
    BOOL v16 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v16 = 0;
  }

- (BOOL)createDataURLIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v16[1] = *(id *)MEMORY[0x1895F89C0];
  v7 = -[MCMContainerPath containerRootURL](self, "containerRootURL");
  -[MCMContainerPath containerDataURL](self, "containerDataURL");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) != 0)
  {
    id v10 = 0LL;
    BOOL v11 = 1;
  }

  else
  {
    v12 = -[MCMContainerPath containerDataURL](self, "containerDataURL");
    uint64_t v13 = -[MCMContainerPath dataPOSIXMode](self, "dataPOSIXMode");
    -[MCMContainerPath dataPOSIXOwner](self, "dataPOSIXOwner");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 0LL;
    BOOL v11 = -[MCMContainerPath _createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:]( self,  "_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:",  v12,  v13,  v14,  v5,  0LL,  v16);
    id v10 = v16[0];

    if (a4 && !v11)
    {
      id v10 = v10;
      BOOL v11 = 0;
      *a4 = v10;
    }
  }

  return v11;
}

- (id)containerPathForRealPath
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v3 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v4 = -[MCMContainerPath containerRootURL](self, "containerRootURL");
  id v15 = 0LL;
  [v3 realPathForURL:v4 isDirectory:1 error:&v15];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v15;

  if (v5)
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    -[MCMContainerPath containerClassPath](self, "containerClassPath");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v5 lastPathComponent];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 lastPathComponent];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)[v7 initWithContainerClassPath:v8 containerPathIdentifier:v9 containerRootComponent:v10 containerDataComponent:v11];
  }

  else
  {
    container_log_handle_for_category();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [0 containerRootURL];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Could not get realpath for [%@]; error = %@",
        buf,
        0x16u);
    }

    v12 = 0LL;
  }

  return v12;
}

- (BOOL)transient
{
  return objc_opt_isKindOfClass() & 1;
}

- (MCMUserIdentity)userIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 userIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MCMUserIdentity *)v3;
}

- (unint64_t)containerClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (NSURL)baseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 baseURL];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)categoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 categoryURL];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)classURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 classURL];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MCMContainerPath)initWithContainerClassPath:(id)a3 containerPathIdentifier:(id)a4 containerRootComponent:(id)a5 containerDataComponent:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MCMContainerPath;
  id v15 = -[MCMContainerPath init](&v29, sel_init);
  BOOL v16 = v15;
  if (v15)
  {
    v15->_exists = 0;
    uint64_t v17 = [v11 containerClass];
    objc_storeStrong((id *)&v16->_containerClassPath, a3);
    objc_storeStrong((id *)&v16->_containerPathIdentifier, a4);
    objc_storeStrong((id *)&v16->_containerRootComponent, a5);
    objc_storeStrong((id *)&v16->_containerDataComponent, a6);
    if (v16->_containerClassPath && v16->_containerRootComponent)
    {
      v16->_rootPOSIXMode = [v11 posixMode];
      v16->_dataPOSIXMode = [v11 posixMode];
      v16->_schemaPOSIXMode = 493;
      if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        id v18 = containermanager_copy_global_configuration();
        int v19 = [v18 systemContainerMode];

        if (v19 == 1) {
          v16->_schemaPOSIXMode = 0;
        }
      }

      uint64_t v20 = [v11 posixOwner];
      rootPOSIXOwner = v16->_rootPOSIXOwner;
      v16->_rootPOSIXOwner = (MCMPOSIXUser *)v20;

      uint64_t v22 = [v11 posixOwner];
      dataPOSIXOwner = v16->_dataPOSIXOwner;
      v16->_dataPOSIXOwner = (MCMPOSIXUser *)v22;

      v24 = (void *)objc_opt_class();
      [v11 posixOwner];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v24 _posixOwnerForContainerSubdirectories:v17 user:v25];
      schemaPOSIXOwner = v16->_schemaPOSIXOwner;
      v16->_schemaPOSIXOwner = (MCMPOSIXUser *)v26;
    }

    else
    {
      v25 = v16;
      BOOL v16 = 0LL;
    }
  }

  return v16;
}

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  unint64_t v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__MCMContainerPath_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t v3 = -[MCMContainerClassPath hash](self->_containerClassPath, "hash");
  NSUInteger v4 = -[NSString hash](self->_containerRootComponent, "hash");
  return v4 ^ v3 ^ -[NSString hash](self->_containerDataComponent, "hash");
}

- (BOOL)isEqualToContainerPath:(id)a3
{
  NSUInteger v4 = a3;
  BOOL v5 = -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerClassPath, v4[3])
    && -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerRootComponent, v4[7])
    && -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerDataComponent, v4[8]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (MCMContainerPath *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMContainerPath isEqualToContainerPath:](self, "isEqualToContainerPath:", v4);
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
    objc_storeStrong((id *)(v5 + 24), self->_containerClassPath);
    uint64_t v7 = -[NSString copyWithZone:](self->_containerRootComponent, "copyWithZone:", a3);
    int v8 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v7;

    uint64_t v9 = -[NSString copyWithZone:](self->_containerDataComponent, "copyWithZone:", a3);
    id v10 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v9;

    uint64_t v11 = -[NSString copyWithZone:](self->_containerPathIdentifier, "copyWithZone:", a3);
    id v12 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v11;

    *(_WORD *)(v6 + 10) = self->_rootPOSIXMode;
    *(_WORD *)(v6 + 12) = self->_dataPOSIXMode;
    *(_WORD *)(v6 + 14) = self->_schemaPOSIXMode;
    objc_storeStrong((id *)(v6 + 32), self->_rootPOSIXOwner);
    objc_storeStrong((id *)(v6 + 40), self->_dataPOSIXOwner);
    objc_storeStrong((id *)(v6 + 48), self->_schemaPOSIXOwner);
  }

  return (id)v6;
}

- (NSURL)containerRootURL
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 classURL];
  NSUInteger v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerRootComponent](self, "containerRootComponent");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (NSURL)containerDataURL
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
  NSUInteger v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v3 URLByAppendingPathComponent:v5 isDirectory:1];

    unint64_t v3 = (void *)v6;
  }

  return (NSURL *)v3;
}

- (NSURL)metadataURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)isRandomized
{
  id v3 = objc_alloc(MEMORY[0x189607AB8]);
  -[MCMContainerPath containerPathIdentifier](self, "containerPathIdentifier");
  NSUInteger v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithUUIDString:v4];
  LOBYTE(self) = v5 != 0LL;

  return (char)self;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = [a3 isEqual:a4];
  }
  return result;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a5;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 userIdentity];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 libraryRepairForUserIdentity:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke;
  v24[3] = &unk_18A29DF60;
  v24[4] = self;
  unsigned __int16 v28 = a4;
  id v19 = v14;
  int v27 = a6;
  id v25 = v19;
  uint64_t v26 = &v29;
  char v20 = [v18 fixAndRetryIfPermissionsErrorWithURL:v13 containerPath:self containerIdentifier:0 error:a8 duringBlock:v24];
  char v21 = v20 ^ 1;
  if (!a7) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a7 = *((_BYTE *)v30 + 24);
  }

  _Block_object_dispose(&v29, 8);
  return v20;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

- (MCMPOSIXUser)rootPOSIXOwner
{
  return self->_rootPOSIXOwner;
}

- (unsigned)rootPOSIXMode
{
  return self->_rootPOSIXMode;
}

- (MCMPOSIXUser)dataPOSIXOwner
{
  return self->_dataPOSIXOwner;
}

- (unsigned)dataPOSIXMode
{
  return self->_dataPOSIXMode;
}

- (MCMPOSIXUser)schemaPOSIXOwner
{
  return self->_schemaPOSIXOwner;
}

- (unsigned)schemaPOSIXMode
{
  return self->_schemaPOSIXMode;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

- (NSString)containerRootComponent
{
  return self->_containerRootComponent;
}

- (NSString)containerDataComponent
{
  return self->_containerDataComponent;
}

- (void).cxx_destruct
{
}

uint64_t __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 containerClassPath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend( (id)objc_opt_class(),  "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:",  v6,  *(unsigned __int16 *)(a1 + 60),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 56),  *(void *)(*(void *)(a1 + 48) + 8) + 24,  a3);

  return v8;
}

id __31__MCMContainerPath_description__block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = (void *)NSString;
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void **)(a1 + 32);
  [v8 containerClassPath];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (a2)
  {
    uint64_t v11 = [v9 redactedDescription];
    [*(id *)(a1 + 32) containerRootComponent];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 redactedDescription];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 32) containerRootComponent];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (uint64_t)v10;
  }

  [*(id *)(a1 + 32) containerDataComponent];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [*(id *)(a1 + 32) exists];
  id v15 = "";
  if (v14) {
    id v15 = " exists";
  }
  [v5 stringWithFormat:@"<%@: %p; [%@]/[%@]/[%@]%s>", v7, v8, v11, v12, v13, v15];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    id v12 = (void *)v11;
  }

  return v16;
}

+ (id)containerPathForContainerIdentity:(id)a3 containerPathIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 userIdentity];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 containerClass];

  [a1 containerPathForUserIdentity:v8 containerClass:v9 containerPathIdentifier:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 containerPathIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = containermanager_copy_global_configuration();
  [v10 staticConfig];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 configForContainerClass:a4];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = containermanager_copy_global_configuration();
  [v13 classPathCache];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v14,  "containerClassPathForUserIdentity:containerConfig:typeClass:",  v9,  v12,  objc_msgSend(a1, "_containerClassPathClass"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 containerPathForContainerClassPath:v15 containerPathIdentifier:v8];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)containerPathForContainerClassPath:(id)a3 containerPathIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 containerClass];
  int v7 = container_class_supports_data_subdirectory();
  id v8 = (objc_class *)objc_opt_class();
  if ((objc_msgSend( v5,  "isMemberOfClass:",  +[MCMContainerStagingPath _containerClassPathClass]( MCMContainerStagingPath,  "_containerClassPathClass")) & 1) != 0 || objc_msgSend( v5,  "isMemberOfClass:",  +[MCMContainerTransientPath _containerClassPathClass]( MCMContainerTransientPath,  "_containerClassPathClass")))
  {
    id v8 = (objc_class *)objc_opt_class();
  }

  if (v7) {
    id v9 = @"Data";
  }
  else {
    id v9 = 0LL;
  }
  id v10 = (void *)[[v8 alloc] initWithContainerClassPath:v5 containerPathIdentifier:v6 containerRootComponent:v6 containerDataComponent:v9];

  return v10;
}

+ (id)containerPathIdentifierForCodeSignIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  id v5 = a3;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 fsSanitizedStringFromString:v5 allowSpaces:a4 == 7];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containerPathFromURL:(id)a3 containerClassPath:(id)a4 relativePath:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 classURL];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 path];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 pathComponents];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 path];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v13 pathComponents];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v15 = [v12 count];
  if (v15 >= [v14 count])
  {
    char v20 = 0LL;
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v16 = [v12 count];
    uint64_t v17 = [v14 count];
    uint64_t v18 = v17 - v16;
    objc_msgSend(v14, "subarrayWithRange:", v16, v17 - v16);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    [v19 firstObject];
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 containerClass];
    else {
      char v21 = 0LL;
    }
    uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithContainerClassPath:v8 containerPathIdentifier:v20 containerRootComponent:v20 containerDataComponent:v21];
    if (a5)
    {
      objc_msgSend(v19, "subarrayWithRange:", 1, v18 - 1);
      int v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 componentsJoinedByString:@"/"];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v14 = v19;
    }
  }

  id v23 = v22;

  return v23;
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

+ (id)_posixOwnerForContainerSubdirectories:(unint64_t)a3 user:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 > 0xE || ((1LL << a3) & 0x412A) == 0)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      id v11 = containermanager_copy_global_configuration();
      int v12 = [v11 systemContainerMode];

      if (v12 != 1)
      {
        id v7 = containermanager_copy_global_configuration();
        uint64_t v8 = [v7 systemContainerOwner];
        goto LABEL_4;
      }

      +[MCMPOSIXUser nobody](&OBJC_CLASS___MCMPOSIXUser, "nobody");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v13 = v5;
    }

    id v9 = v13;
    goto LABEL_5;
  }

  id v7 = containermanager_copy_global_configuration();
  uint64_t v8 = [v7 bundleContainerOwner];
LABEL_4:
  id v9 = (void *)v8;

LABEL_5:
  return v9;
}

@end