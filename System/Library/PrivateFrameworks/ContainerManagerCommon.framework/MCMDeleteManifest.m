@interface MCMDeleteManifest
+ (id)_deleteManifestsForManagedPath:(id)a3 userIdentityCache:(id)a4;
+ (id)_deleteManifestsFromFileURLs:(id)a3 userIdentityCache:(id)a4;
+ (id)_deleteManifestsFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)_materializeContainerIdentityFromManifestPlist:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)_materializeContainerIdentityFromManifestPlistV1:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)deleteManifestsForGlobalContainersWithUserIdentityCache:(id)a3;
+ (id)deleteManifestsForUserContainersForPOSIXUser:(id)a3 userIdentityCache:(id)a4;
+ (id)deleteManifestsForUserContainersWithUserIdentityCache:(id)a3;
+ (id)managedPathForGlobalContainers;
+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3;
+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3 forPOSIXUser:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeleteManifest:(id)a3;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (MCMDeleteManifest)initWithConcreteContainerIdentity:(id)a3 userIdentityCache:(id)a4;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)description;
- (NSURL)readURL;
- (NSURL)writeURL;
- (id)_stableFileNameForDeleteOperationPlistWithContainerIdentity:(id)a3;
- (id)_urlForDeleteManifestWithContainerIdentity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deleteManifestAfterRemovingUsingLibraryRepairForUser:(id)a3 error:(id *)a4;
- (id)deleteManifestAfterWritingUsingLibraryRepairForUser:(id)a3 error:(id *)a4;
- (id)fullDescription;
- (id)initFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)setReadURL:(id)a3;
@end

@implementation MCMDeleteManifest

- (MCMDeleteManifest)initWithConcreteContainerIdentity:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMDeleteManifest;
  v9 = -[MCMDeleteManifest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concreteContainerIdentity, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    readURL = v10->_readURL;
    v10->_readURL = 0LL;

    writeURL = v10->_writeURL;
    v10->_writeURL = 0LL;

    uint64_t v13 = -[MCMDeleteManifest _urlForDeleteManifestWithContainerIdentity:]( v10,  "_urlForDeleteManifestWithContainerIdentity:",  v7);
    v14 = v10->_writeURL;
    v10->_writeURL = (NSURL *)v13;
  }

  return v10;
}

- (id)initFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v21 = 0LL;
  objc_msgSend(MEMORY[0x189603F68], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v21;
  if (v11)
  {
    id v20 = 0LL;
    +[MCMDeleteManifest _materializeContainerIdentityFromManifestPlist:userIdentityCache:error:]( &OBJC_CLASS___MCMDeleteManifest,  "_materializeContainerIdentityFromManifestPlist:userIdentityCache:error:",  v11,  v10,  &v20);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (MCMError *)v20;
    if (v13)
    {
      v15 = -[MCMDeleteManifest initWithConcreteContainerIdentity:userIdentityCache:]( self,  "initWithConcreteContainerIdentity:userIdentityCache:",  v13,  v10);
      objc_storeStrong((id *)&v15->_readURL, a3);
      goto LABEL_10;
    }
  }

  else
  {
    container_log_handle_for_category();
    objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [v9 path];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v23 = v12;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to parse delete manifest; error = %@, path = [%@]",
        buf,
        0x16u);
    }

    v14 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v12,  v9,  123LL);
  }

  if (a5)
  {
    v14 = v14;
    v15 = 0LL;
    uint64_t v13 = 0LL;
    *a5 = v14;
  }

  else
  {
    v15 = 0LL;
    uint64_t v13 = 0LL;
  }

- (id)deleteManifestAfterWritingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  v34[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 plist];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = @"version";
  v33[1] = @"identity";
  v34[0] = &unk_18A2BE0C8;
  v34[1] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[MCMDeleteManifest writeURL](self, "writeURL");
  uint64_t v12 = [v10 dataWritingOptionsForFileAtURL:v11];

  -[MCMDeleteManifest writeURL](self, "writeURL");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = 0LL;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke;
  v23[3] = &unk_18A29DA30;
  id v14 = v9;
  id v24 = v14;
  uint64_t v25 = v12;
  LOBYTE(v11) = [v6 fixAndRetryIfPermissionsErrorWithURL:v13 error:&v26 duringBlock:v23];

  id v15 = v26;
  if ((v11 & 1) != 0)
  {
    objc_super v16 = (void *)-[MCMDeleteManifest copy](self, "copy");
    -[MCMDeleteManifest writeURL](self, "writeURL");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setReadURL:v17];
    v18 = 0LL;
  }

  else
  {
    container_log_handle_for_category();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = -[MCMDeleteManifest writeURL](self, "writeURL");
      *(_DWORD *)buf = 138412802;
      id v28 = v15;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to write delete manifest; error = %@, url = [%@], manifest = %@",
        buf,
        0x20u);
    }

    id v20 = objc_alloc(&OBJC_CLASS___MCMError);
    -[MCMDeleteManifest writeURL](self, "writeURL");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MCMError initWithNSError:url:defaultErrorType:]( v20,  "initWithNSError:url:defaultErrorType:",  v15,  v17,  125LL);
    objc_super v16 = 0LL;
  }

  if (a4 && !v16) {
    *a4 = v18;
  }

  return v16;
}

- (id)deleteManifestAfterRemovingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMDeleteManifest readURL](self, "readURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18[0] = 0LL;
    char v8 = [v6 fixAndRetryIfPermissionsErrorWithURL:v7 error:v18 duringBlock:&__block_literal_global_6747];
    id v9 = v18[0];
    id v10 = v9;
    uint64_t v11 = 0LL;
    if ((v8 & 1) != 0) {
      goto LABEL_10;
    }
    [v9 domain];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v13 = [v10 code];

      if (v13 == 2)
      {
        uint64_t v11 = 0LL;
        goto LABEL_10;
      }
    }

    else
    {
    }

    id v15 = objc_alloc(&OBJC_CLASS___MCMError);
    [v7 path];
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v15,  "initWithErrorType:category:path:POSIXerrno:",  122,  1,  v16,  [v10 code]);

LABEL_10:
    id v14 = (MCMDeleteManifest *)-[MCMDeleteManifest copy](self, "copy");
    -[MCMDeleteManifest setReadURL:](v14, "setReadURL:", 0LL);
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  id v14 = self;
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v14) {
    *a4 = v11;
  }
LABEL_13:

  return v14;
}

- (NSString)description
{
  v3 = (void *)NSString;
  v4 = -[MCMDeleteManifest readURL](self, "readURL");
  v5 = -[MCMDeleteManifest writeURL](self, "writeURL");
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"(from:[%@], to:[%@], %@)", v4, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)fullDescription
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest readURL](self, "readURL");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest writeURL](self, "writeURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v3,  "stringWithFormat:",  @"<%@: %p; readURL = [%@], writeURL = [%@], concreteContainerIdentity = %@>",
    v5,
    self,
    v6,
    v7,
    v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MCMDeleteManifest readURL](self, "readURL");
  uint64_t v6 = [v5 hash];
  -[MCMDeleteManifest writeURL](self, "writeURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 hash];

  return v6 ^ v4 ^ v8;
}

- (BOOL)isEqualToDeleteManifest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MCMDeleteManifest readURL](self, "readURL");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      [v5 readURL];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        char v7 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }

    -[MCMDeleteManifest readURL](self, "readURL");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

      if (v6)
      {
      }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMDeleteManifest *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMDeleteManifest isEqualToDeleteManifest:](self, "isEqualToDeleteManifest:", v4);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_userIdentityCache);
    objc_storeStrong(v5 + 2, self->_readURL);
    objc_storeStrong(v5 + 1, self->_writeURL);
    objc_storeStrong(v5 + 3, self->_concreteContainerIdentity);
  }

  return v5;
}

- (id)_urlForDeleteManifestWithContainerIdentity:(id)a3
{
  id v4 = a3;
  -[MCMDeleteManifest _stableFileNameForDeleteOperationPlistWithContainerIdentity:]( self,  "_stableFileNameForDeleteOperationPlistWithContainerIdentity:",  v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = containermanager_copy_global_configuration();
  [v6 managedPathRegistry];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 containermanagerDeleteOperations];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = containermanager_copy_global_configuration();
  [v4 containerConfig];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_msgSend(v9, "isGlobalContainerClass:", objc_msgSend(v10, "containerClass"));

  if ((v11 & 1) == 0)
  {
    -[MCMDeleteManifest userIdentityCache](self, "userIdentityCache");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 userIdentity];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 posixUser];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 userIdentityForPersonalPersonaWithPOSIXUser:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCMDeleteManifest userIdentityCache](self, "userIdentityCache");
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 managedUserPathRegistryForUserIdentity:v15];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [v17 containermanagerUserDeleteOperations];

    uint64_t v8 = (void *)v18;
  }

  [v8 url];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 URLByAppendingPathComponent:v5 isDirectory:0];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_stableFileNameForDeleteOperationPlistWithContainerIdentity:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = (void *)NSString;
  [v3 containerConfig];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 containerClass];
  [v3 identifier];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v3 transient];
  [v3 userIdentity];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 uuid];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"%llu-%@-%d-%@-%@", v6, v7, v8, v10, v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)md = 0u;
  __int128 v25 = 0u;
  id v13 = v12;
  id v14 = (const char *)[v13 UTF8String];
  CC_LONG v15 = strlen(v14);
  CC_SHA256(v14, v15, md);
  uint64_t v16 = 0LL;
  char v23 = 0;
  uint64_t v17 = (char *)v22 + 1;
  memset(v22, 0, sizeof(v22));
  do
  {
    unint64_t v18 = md[v16];
    *(v17 - 1) = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v18 >> 4];
    *uint64_t v17 = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v18 & 0xF];
    v17 += 2;
    ++v16;
  }

  while (v16 != 32);
  v19 = (void *)[objc_alloc(NSString) initWithUTF8String:v22];
  [v19 stringByAppendingPathExtension:@"plist"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (NSURL)readURL
{
  return self->_readURL;
}

- (void)setReadURL:(id)a3
{
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

uint64_t __80__MCMDeleteManifest_deleteManifestAfterRemovingUsingLibraryRepairForUser_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v4 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 removeItemAtURL:v4 error:a3];

  return v6;
}

uint64_t __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "MCM_writeToURL:withOptions:error:", a2, *(void *)(a1 + 40), a3);
}

+ (id)managedPathForGlobalContainers
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = containermanager_copy_global_configuration();
  int v3 = [v2 handlesGlobalContainers];

  if (!v3)
  {
LABEL_6:
    uint64_t v6 = 0LL;
    return v6;
  }

  id v4 = containermanager_copy_global_configuration();
  [v4 managedPathRegistry];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containermanagerDeleteOperations];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    container_log_handle_for_category();
    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_fault_impl( &dword_188846000,  v7,  OS_LOG_TYPE_FAULT,  "Failed to get global path for storing pending delete operations.",  v9,  2u);
    }

    goto LABEL_6;
  }

  return v6;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  id v5 = containermanager_copy_global_configuration();
  [v5 defaultUser];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 managedPathForUserContainersWithUserIdentityCache:v4 forPOSIXUser:v6];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3 forPOSIXUser:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = containermanager_copy_global_configuration();
  int v8 = [v7 handlesUserContainers];

  if (v8)
  {
    [v5 userIdentityForPersonalPersonaWithPOSIXUser:v6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 managedUserPathRegistryForUserIdentity:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 containermanagerUserDeleteOperations];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      container_log_handle_for_category();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_fault_impl( &dword_188846000,  v12,  OS_LOG_TYPE_FAULT,  "Failed to get user path for storing pending delete operations; posixUser = %@.",
          (uint8_t *)&v14,
          0xCu);
      }
    }
  }

  else
  {
    char v11 = 0LL;
  }

  return v11;
}

+ (id)deleteManifestsForGlobalContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  [a1 managedPathForGlobalContainers];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _deleteManifestsForManagedPath:v5 userIdentityCache:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deleteManifestsForUserContainersWithUserIdentityCache:(id)a3
{
  id v4 = a3;
  [a1 managedPathForUserContainersWithUserIdentityCache:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _deleteManifestsForManagedPath:v5 userIdentityCache:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deleteManifestsForUserContainersForPOSIXUser:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a4;
  [a1 managedPathForUserContainersWithUserIdentityCache:v6 forPOSIXUser:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _deleteManifestsForManagedPath:v7 userIdentityCache:v6];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_materializeContainerIdentityFromManifestPlist:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  v16[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = 0LL;
    id v13 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  id v10 = v8;
  [v10 objectForKeyedSubscript:@"version"];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 isEqual:&unk_18A2BE0C8];

  if (v12)
  {
    v16[0] = 0LL;
    [a1 _materializeContainerIdentityFromManifestPlistV1:v10 userIdentityCache:v9 error:v16];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v16[0];
  }

  else
  {
    id v14 = 0LL;
    id v13 = 0LL;
  }

  if (a5)
  {
LABEL_8:
    if (!v13) {
      *a5 = v14;
    }
  }

+ (id)_materializeContainerIdentityFromManifestPlistV1:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v25 = 1LL;
  id v7 = a4;
  [a3 objectForKeyedSubscript:@"identity"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMConcreteContainerIdentity concreteContainerIdentityFromPlist:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentity,  "concreteContainerIdentityFromPlist:userIdentityCache:error:",  v8,  v7,  &v25);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v9 containerConfig];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v11 = [v10 containerClass];
    if (v11 > 0xE || ((1LL << v11) & 0x4ED4) == 0)
    {
    }

    else
    {
      [v9 userIdentity];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 posixUser];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = containermanager_copy_global_configuration();
      [v15 defaultUser];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      char v17 = [v14 isEqual:v16];

      if ((v17 & 1) == 0)
      {
        container_log_handle_for_category();
        unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = containermanager_copy_global_configuration();
          [v19 defaultUser];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          __int16 v28 = 2112;
          __int16 v29 = v9;
          _os_log_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEFAULT,  "Ignoring delete manifest because it references a different uid; current user = %@, identity = %@",
            buf,
            0x16u);
        }

        id v21 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 74LL);
        goto LABEL_14;
      }
    }

    id v21 = 0LL;
    goto LABEL_14;
  }

  v22 = objc_alloc(&OBJC_CLASS___MCMError);
  char v23 = -[MCMError initWithErrorType:](v22, "initWithErrorType:", v25);
  id v21 = v23;
  if (a5)
  {
    id v21 = v23;
    *a5 = v21;
  }

+ (id)_deleteManifestsFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = 0LL;
  [v10 urlsForItemsInDirectoryAtURL:v8 error:&v20];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v20;

  if (v11)
  {
    [a1 _deleteManifestsFromFileURLs:v11 userIdentityCache:v9];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }

  [v12 domain];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v15 isEqualToString:*MEMORY[0x189607688]])
  {
    uint64_t v16 = [v12 code];

    if (v16 == 2)
    {
      id v13 = 0LL;
LABEL_3:
      id v14 = 0LL;
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }

  else
  {
  }

  container_log_handle_for_category();
  char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    [v8 path];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v19;
    _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Failed to get items at delete operations URL; error = %@, path = [%@]",
      buf,
      0x16u);
  }

  id v14 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v12,  v8,  146LL);
  id v13 = 0LL;
  if (a5)
  {
LABEL_12:
    if (!v13) {
      *a5 = v14;
    }
  }

+ (id)_deleteManifestsFromFileURLs:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v24 = a4;
  id v21 = (void *)objc_opt_new();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        id v8 = objc_alloc(&OBJC_CLASS___MCMDeleteManifest);
        id v26 = 0LL;
        id v9 = -[MCMDeleteManifest initFromURL:userIdentityCache:error:]( v8,  "initFromURL:userIdentityCache:error:",  v7,  v24,  &v26);
        id v10 = v26;
        unint64_t v11 = v10;
        if (v9)
        {
          [v9 concreteContainerIdentity];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = containermanager_copy_global_configuration();
          [v12 containerConfig];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 containerClass];
          [v12 userIdentity];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 posixUser];
          char v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = [v13 dispositionForContainerClass:v15 forUser:v17];

          if ((_DWORD)v15 == 1)
          {
            container_log_handle_for_category();
            unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v28 = v7;
              __int16 v29 = 2112;
              id v30 = v9;
              _os_log_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEFAULT,  "Recovering from failed delete using [%@]; queuing deletion of %@",
                buf,
                0x16u);
            }

            [v21 addObject:v9];
          }
        }

        else
        {
          if ([v10 type] == 74) {
            goto LABEL_15;
          }
          container_log_handle_for_category();
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v28 = v11;
            __int16 v29 = 2112;
            id v30 = v7;
            _os_log_error_impl( &dword_188846000,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "Failed to materialize delete manifest; error = %@, url = [%@]",
              buf,
              0x16u);
          }
        }

LABEL_15:
        ++v6;
      }

      while (v25 != v6);
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
    }

    while (v25);
  }

  id v19 = (void *)[v21 copy];
  return v19;
}

+ (id)_deleteManifestsForManagedPath:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || ([v6 url],
        id v8 = (void *)objc_claimAutoreleasedReturnValue(),
        [a1 _deleteManifestsFromURL:v8 userIdentityCache:v7 error:0],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    [MEMORY[0x189604010] set];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end