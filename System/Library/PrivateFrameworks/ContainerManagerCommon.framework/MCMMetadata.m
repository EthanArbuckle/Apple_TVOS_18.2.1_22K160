@interface MCMMetadata
- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10;
- (BOOL)_persisted;
- (BOOL)_writeFileURL:(id)a3 dictionary:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)verifyWithError:(id *)a3;
- (BOOL)writeMetadataToDiskWithError:(id *)a3;
- (BOOL)writeMetadataToFileURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MCMFSNode)fsNode;
- (MCMMetadata)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6;
- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 creator:(id)a9 userIdentityCache:(id)a10;
- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 fsNode:(id)a9 creator:(id)a10 userIdentityCache:(id)a11;
- (NSDictionary)info;
- (NSString)creator;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)userManagedAssetsDirName;
- (NSURL)fileURL;
- (container_object_s)createLibsystemContainerWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8;
- (id)metadataByChangingDataProtectionClass:(int)a3;
- (id)metadataBySettingCreator:(id)a3;
- (id)metadataBySettingInfoValue:(id)a3 forKey:(id)a4;
- (id)metadataBySettingUserManagedAssetsDirName:(id)a3;
- (int)dataProtectionClass;
- (void)_clearPersistedStatus;
@end

@implementation MCMMetadata

- (MCMMetadata)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:]( self,  "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNod e:creator:userIdentityCache:",  a3,  MEMORY[0x189604A60],  a4,  0LL,  a5,  0xFFFFFFFFLL,  0LL,  0LL,  a6,  *MEMORY[0x1895F89C0]);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 creator:(id)a9 userIdentityCache:(id)a10
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:]( self,  "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNod e:creator:userIdentityCache:",  a3,  a4,  a5,  a6,  a7,  *(void *)&a8,  0LL,  a9,  a10,  *MEMORY[0x1895F89C0]);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 fsNode:(id)a9 creator:(id)a10 userIdentityCache:(id)a11
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v27 = a4;
  id v17 = a5;
  id v26 = a6;
  id v25 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MCMMetadata;
  v19 = -[MCMMetadataMinimal initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:]( &v28,  sel_initWithContainerIdentity_containerPath_schemaVersion_userIdentityCache_,  a3,  v17,  a7,  a11);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_info, a4);
    objc_storeStrong((id *)&v20->_userManagedAssetsDirName, a6);
    v20->_dataProtectionClass = a8;
    objc_storeStrong((id *)&v20->_fsNode, a9);
    objc_storeStrong((id *)&v20->_creator, a10);
    uint64_t v21 = [v17 metadataURL];
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v21;
  }

  return v20;
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  v21[1] = *(id *)MEMORY[0x1895F89C0];
  id v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCMMetadata;
  v21[0] = 0LL;
  v16 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:]( &v20,  sel_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error_,  v15,  a4,  a5,  a6,  a7,  v21);
  id v17 = v21[0];
  id v18 = v17;
  if (v16)
  {
    objc_storeStrong(v16 + 9, a3);
  }

  else if (a8)
  {
    *a8 = v17;
  }

  return v16;
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___MCMMetadata;
  id v56 = 0LL;
  LODWORD(a5) = -[MCMMetadataMinimal _initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:]( &v55,  sel__initFromMetadataInDictionary_containerPath_userIdentity_containerClass_fsNode_fileURL_userIdentityCache_error_,  v16,  v17,  a5,  a6,  v18,  v19,  a9,  &v56);
  id v20 = v56;
  if (!(_DWORD)a5) {
    goto LABEL_33;
  }
  objc_storeStrong((id *)&self->_fsNode, a7);
  [v16 objectForKeyedSubscript:@"MCMMetadataUserManagedAssetsDirName"];
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  userManagedAssetsDirName = self->_userManagedAssetsDirName;
  self->_userManagedAssetsDirName = v21;

  v23 = self->_userManagedAssetsDirName;
  if (v23)
  {
    objc_opt_class();
    v24 = v23;
    id v25 = (objc_opt_isKindOfClass() & 1) != 0 ? v24 : 0LL;

    if (!v25)
    {
      v36 = objc_alloc(&OBJC_CLASS___MCMError);
      [v19 path];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v36,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v37,  0LL);

      container_log_handle_for_category();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      v40 = self->_userManagedAssetsDirName;
      *(_DWORD *)buf = 138412290;
      v58 = v40;
      v41 = "Invalid metadata User Managed Dir Name String: %@";
LABEL_31:
      _os_log_error_impl(&dword_188846000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
      goto LABEL_32;
    }
  }

  [v16 objectForKeyedSubscript:@"MCMMetadataCreator"];
  id v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  creator = self->_creator;
  self->_creator = v26;

  objc_super v28 = self->_creator;
  if (v28)
  {
    objc_opt_class();
    uint64_t v29 = v28;
    v30 = (objc_opt_isKindOfClass() & 1) != 0 ? v29 : 0LL;

    if (!v30)
    {
      v45 = objc_alloc(&OBJC_CLASS___MCMError);
      [v19 path];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v45,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v46,  0LL);

      container_log_handle_for_category();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      v47 = self->_creator;
      *(_DWORD *)buf = 138412290;
      v58 = v47;
      v41 = "Invalid metadata Creator String: %@";
      goto LABEL_31;
    }
  }

  [v16 objectForKeyedSubscript:@"MCMMetadataInfo"];
  v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  self->_info = v31;

  v33 = self->_info;
  if (v33)
  {
    objc_opt_class();
    v34 = v33;
    v35 = (objc_opt_isKindOfClass() & 1) != 0 ? v34 : 0LL;

    if (!v35)
    {
      v51 = objc_alloc(&OBJC_CLASS___MCMError);
      [v19 path];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v51,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v52,  0LL);

      container_log_handle_for_category();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v53 = self->_info;
        *(_DWORD *)buf = 138412290;
        v58 = v53;
        v41 = "Invalid metadata Info: %@";
        goto LABEL_31;
      }

- (BOOL)writeMetadataToDiskWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMMetadata fileURL](self, "fileURL");
  uint64_t v7 = [v5 dataWritingOptionsForFileAtURL:v6];
  v8 = -[MCMMetadata fileURL](self, "fileURL");
  LOBYTE(a3) = -[MCMMetadata writeMetadataToFileURL:options:error:]( self,  "writeMetadataToFileURL:options:error:",  v8,  v7,  a3);

  return (char)a3;
}

- (BOOL)writeMetadataToFileURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LOBYTE(self) = -[MCMMetadata _persisted](v9, "_persisted");
  objc_sync_exit(v9);

  if ((self & 1) != 0)
  {
    v10 = 0LL;
LABEL_24:
    id v40 = 0LL;
    BOOL v42 = 1;
    goto LABEL_25;
  }

  v11 = (void *)MEMORY[0x1895CE3A8]();
  v12 = (void *)objc_opt_new();
  v13 = -[MCMMetadata info](v9, "info");
  if (v13)
  {
    v14 = -[MCMMetadata info](v9, "info");
    [v12 setValue:v14 forKey:@"MCMMetadataInfo"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[MCMMetadataMinimal containerClass](v9, "containerClass"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setValue:v15 forKey:@"MCMMetadataContentClass"];

  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  -[MCMMetadataMinimal containerClass](v9, "containerClass")))
  {
    -[MCMMetadataMinimal userIdentity](v9, "userIdentity");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 plist];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setValue:v17 forKey:@"MCMMetadataUserIdentity"];
  }

  -[MCMMetadataMinimal identifier](v9, "identifier");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setValue:v18 forKey:@"MCMMetadataIdentifier"];

  -[MCMMetadataMinimal uuid](v9, "uuid");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 UUIDString];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setValue:v20 forKey:@"MCMMetadataUUID"];

  [v12 setValue:&unk_18A2BDE58 forKey:@"MCMMetadataVersion"];
  -[MCMMetadataMinimal schemaVersion](v9, "schemaVersion");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setValue:v21 forKey:@"MCMMetadataSchemaVersion"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[MCMMetadata dataProtectionClass](v9, "dataProtectionClass"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setValue:v22 forKey:@"MCMMetadataActiveDPClass"];
  v23 = -[MCMMetadata userManagedAssetsDirName](v9, "userManagedAssetsDirName");
  if (v23)
  {
    v24 = -[MCMMetadata userManagedAssetsDirName](v9, "userManagedAssetsDirName");
    [v12 setValue:v24 forKey:@"MCMMetadataUserManagedAssetsDirName"];
  }

  -[MCMMetadata creator](v9, "creator");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[MCMMetadata creator](v9, "creator");
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setValue:v26 forKey:@"MCMMetadataCreator"];
  }

  id v27 = v9;
  objc_sync_enter(v27);
  id v65 = 0LL;
  BOOL v28 = -[MCMMetadata _writeFileURL:dictionary:options:error:]( v27,  "_writeFileURL:dictionary:options:error:",  v8,  v12,  a4,  &v65);
  id v29 = v65;
  v10 = v29;
  if (v28)
  {
    v30 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    id v64 = 0LL;
    [v30 fsNodeOfURL:v8 followSymlinks:0 error:&v64];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = v64;

    if (v31)
    {
      v33 = v31;
      fsNode = (os_log_s *)v27->_fsNode;
      v27->_fsNode = v33;
    }

    else
    {
      container_log_handle_for_category();
      fsNode = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(fsNode, OS_LOG_TYPE_ERROR))
      {
        v61 = -[MCMMetadataMinimal uuid](v27, "uuid");
        v63 = -[MCMMetadataMinimal containerPath](v27, "containerPath");
        [v63 containerPathIdentifier];
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[MCMMetadataMinimal identifier](v27, "identifier");
        uint64_t v53 = -[MCMMetadataMinimal containerClass](v27, "containerClass");
        int v55 = -[MCMMetadata conformsToProtocol:](v27, "conformsToProtocol:", &unk_18C735DA0);
        if (v55)
        {
          v51 = -[MCMMetadata fsNode](v27, "fsNode");
          uint64_t v49 = [v51 inode];
        }

        else
        {
          uint64_t v49 = 0LL;
        }

        [v8 path];
        BOOL v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v67 = v61;
        __int16 v68 = 2114;
        v69 = v59;
        __int16 v70 = 2112;
        v71 = v57;
        __int16 v72 = 2050;
        uint64_t v73 = v53;
        __int16 v74 = 2048;
        uint64_t v75 = v49;
        __int16 v76 = 2112;
        v77 = v50;
        __int16 v78 = 2114;
        id v79 = v32;
        _os_log_error_impl( &dword_188846000,  fsNode,  OS_LOG_TYPE_ERROR,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not fetch fsNode for [%@]: %{public}@",  buf,  0x48u);

        if (v55) {
      }
        }
    }

    objc_sync_exit(v27);
    container_log_handle_for_category();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v60 = -[MCMMetadataMinimal uuid](v27, "uuid");
      v62 = -[MCMMetadataMinimal containerPath](v27, "containerPath");
      [v62 containerPathIdentifier];
      id v56 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[MCMMetadataMinimal identifier](v27, "identifier");
      uint64_t v52 = -[MCMMetadataMinimal containerClass](v27, "containerClass");
      int v58 = -[MCMMetadata conformsToProtocol:](v27, "conformsToProtocol:", &unk_18C735DA0);
      if (v58)
      {
        v51 = -[MCMMetadata fsNode](v27, "fsNode");
        uint64_t v46 = [v51 inode];
      }

      else
      {
        uint64_t v46 = 0LL;
      }

      [v8 path];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[MCMMetadata shortDescription](v27, "shortDescription");
      *(_DWORD *)buf = 138544898;
      v67 = v60;
      __int16 v68 = 2114;
      v69 = v56;
      __int16 v70 = 2112;
      v71 = v54;
      __int16 v72 = 2050;
      uint64_t v73 = v52;
      __int16 v74 = 2048;
      uint64_t v75 = v46;
      __int16 v76 = 2112;
      v77 = v47;
      __int16 v78 = 2112;
      id v79 = v48;
      _os_log_debug_impl( &dword_188846000,  v43,  OS_LOG_TYPE_DEBUG,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Wrote metadata to [%@]: %@",  buf,  0x48u);

      if (v58) {
    }
      }

    objc_autoreleasePoolPop(v11);
    goto LABEL_24;
  }

  [v29 domain];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  int v36 = [v35 isEqualToString:*MEMORY[0x189607688]];

  v37 = objc_alloc(&OBJC_CLASS___MCMError);
  [v8 path];
  if (v36)
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v37,  "initWithErrorType:category:path:POSIXerrno:",  127,  1,  v38,  [v10 code]);
  }

  else
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v37,  "initWithErrorType:category:path:POSIXerrno:",  34LL,  5LL,  v38,  0LL);
  }

  id v40 = (id)v39;

  container_log_handle_for_category();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    [v8 path];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v45;
    __int16 v68 = 2112;
    v69 = v10;
    _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Failed to write metadata dictionary to URL %@: %@",  buf,  0x16u);
  }

  objc_sync_exit(v27);
  objc_autoreleasePoolPop(v11);
  if (a5)
  {
    id v40 = v40;
    BOOL v42 = 0;
    *a5 = v40;
  }

  else
  {
    BOOL v42 = 0;
  }

- (BOOL)verifyWithError:(id *)a3
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  v5 = -[MCMMetadataMinimal userIdentityCache](self, "userIdentityCache");
  v6 = -[MCMMetadataMinimal userIdentity](self, "userIdentity");
  [v5 libraryRepairForUserIdentity:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x2020000000LL;
  char v65 = 0;
  uint64_t v58 = 0LL;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000LL;
  char v61 = 0;
  uint64_t v52 = 0LL;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  int v55 = __Block_byref_object_copy__2872;
  id v56 = __Block_byref_object_dispose__2873;
  id v57 = 0LL;
  -[MCMMetadata fileURL](self, "fileURL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCMMetadataMinimal containerPath](self, "containerPath");
  v10 = -[MCMMetadataMinimal identifier](self, "identifier");
  id v51 = 0LL;
  v50[0] = MEMORY[0x1895F87A8];
  v50[1] = 3221225472LL;
  v50[2] = __31__MCMMetadata_verifyWithError___block_invoke;
  v50[3] = &unk_18A29D228;
  v50[4] = &v62;
  v50[5] = &v58;
  v50[6] = &v52;
  char v11 = [v7 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v9 containerIdentifier:v10 error:&v51 duringBlock:v50];
  id v12 = v51;

  if ((v11 & 1) == 0)
  {
    [v12 domain];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = [v18 isEqualToString:*MEMORY[0x189607688]];

    if (v19)
    {
      id v20 = objc_alloc(&OBJC_CLASS___MCMError);
      -[MCMMetadata fileURL](self, "fileURL");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 path];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v20,  "initWithErrorType:category:path:POSIXerrno:",  127,  1,  v22,  [v12 code]);
    }

    else
    {
      [v12 domain];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = [v23 isEqualToString:@"MCMErrorDomain"];

      id v25 = objc_alloc(&OBJC_CLASS___MCMError);
      if (v24) {
        uint64_t v26 = [v12 code];
      }
      else {
        uint64_t v26 = 12LL;
      }
      id v17 = -[MCMError initWithErrorType:](v25, "initWithErrorType:", v26);
    }

    container_log_handle_for_category();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata shortDescription](self, "shortDescription");
      id v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = v43;
      __int16 v68 = 2112;
      id v69 = v12;
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Could not check existance of metadata for [%@]; error = %@",
        buf,
        0x16u);
    }

    goto LABEL_18;
  }

  if (!*((_BYTE *)v63 + 24))
  {
    container_log_handle_for_category();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata fileURL](self, "fileURL");
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 path];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v47;
      _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Metadata failed verification, URL doesn't exist; URL = [%@]",
        buf,
        0xCu);
    }

    BOOL v28 = objc_alloc(&OBJC_CLASS___MCMError);
    -[MCMMetadata fileURL](self, "fileURL");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s path](v15, "path");
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v28,  "initWithErrorType:category:path:POSIXerrno:",  127LL,  1LL,  v29,  2LL);

    goto LABEL_18;
  }

  if (*((_BYTE *)v59 + 24))
  {
    container_log_handle_for_category();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata fileURL](self, "fileURL");
      id v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v44 path];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v45;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Metadata failed verification, URL is a directory; URL = [%@]",
        buf,
        0xCu);
    }

    v14 = objc_alloc(&OBJC_CLASS___MCMError);
    -[MCMMetadata fileURL](self, "fileURL");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s path](v15, "path");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v14,  "initWithErrorType:category:path:POSIXerrno:",  127LL,  1LL,  v16,  21LL);

    goto LABEL_18;
  }

  -[MCMMetadata fsNode](self, "fsNode");
  id v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
LABEL_26:
    objc_storeStrong((id *)&self->_fsNode, (id)v53[5]);
    id v17 = 0LL;
    BOOL v30 = 1;
    goto LABEL_21;
  }
  v33 = -[MCMMetadata fsNode](self, "fsNode");
  char v34 = [v33 isEqual:v53[5]];

  if ((v34 & 1) != 0)
  {
    v35 = -[MCMMetadata fsNode](self, "fsNode");
    uint64_t v36 = [v35 ctime];
    if (v36 == [(id)v53[5] ctime])
    {
      v37 = -[MCMMetadata fsNode](self, "fsNode");
      [v37 ctime];
      uint64_t v39 = v38;
      [(id)v53[5] ctime];
      LOBYTE(v39) = v39 == v40;

      if ((v39 & 1) != 0) {
        goto LABEL_26;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v48 = -[MCMMetadata shortDescription](self, "shortDescription");
      uint64_t v49 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v48;
      __int16 v68 = 2112;
      id v69 = v49;
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Metadata failed verification, ctime changed; cacheEntry = %@, current fsNode = %@",
        buf,
        0x16u);
    }
  }

  else
  {
    container_log_handle_for_category();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v41 = -[MCMMetadata shortDescription](self, "shortDescription");
      BOOL v42 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v41;
      __int16 v68 = 2112;
      id v69 = v42;
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Metadata failed verification, fs node changed; metadata = %@, current fsNode = %@",
        buf,
        0x16u);
    }
  }

  id v17 = 0LL;
LABEL_18:

  if (a3)
  {
    id v17 = v17;
    BOOL v30 = 0;
    *a3 = v17;
  }

  else
  {
    BOOL v30 = 0;
  }

- (id)metadataBySettingInfoValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  v9 = -[MCMMetadata info](v8, "info");
  v10 = v9;
  if (v6)
  {
    if (v9)
    {
      [v9 objectForKeyedSubscript:v7];
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v11;
      if (v11 && ([v11 isEqual:v6] & 1) != 0) {
        goto LABEL_12;
      }
      v13 = (void *)[v10 mutableCopy];
    }

    else
    {
      [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v13 setValue:v6 forKey:v7];
LABEL_11:
    id v16 = (MCMMetadata *)-[MCMMetadata copy](v8, "copy");

    uint64_t v17 = [v13 copy];
    info = v16->_info;
    v16->_info = (NSDictionary *)v17;

    -[MCMMetadata _clearPersistedStatus](v16, "_clearPersistedStatus");
    id v12 = v13;
    id v8 = v16;
LABEL_12:

    goto LABEL_13;
  }

  if (v9)
  {
    uint64_t v14 = [v9 objectForKeyedSubscript:v7];
    if (v14)
    {
      id v15 = (void *)v14;
      v13 = (void *)[v10 mutableCopy];
      [v13 removeObjectForKey:v7];

      goto LABEL_11;
    }
  }

- (container_object_s)createLibsystemContainerWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = 1LL;
  v5 = -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  -[MCMMetadataMinimal containerPath](self, "containerPath");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerPathIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (container_object_s *)objc_msgSend( v5,  "createLibsystemContainerWithContainerPathIdentifier:existed:error:",  v7,  -[MCMMetadataMinimal existed](self, "existed"),  v11);

  if (a3 && v11[0] != 1LL && !v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___MCMError);
    *a3 = -[MCMError initWithErrorType:](v9, "initWithErrorType:", v11[0]);
  }

  return v8;
}

- (id)metadataByChangingDataProtectionClass:(int)a3
{
  v4 = (_DWORD *)-[MCMMetadata copy](self, "copy");
  v4[10] = a3;
  [v4 _clearPersistedStatus];
  return v4;
}

- (id)metadataBySettingUserManagedAssetsDirName:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadata copy](self, "copy");
  id v6 = (void *)v5[7];
  v5[7] = v4;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)metadataBySettingCreator:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadata copy](self, "copy");
  id v6 = (void *)v5[10];
  v5[10] = v4;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMMetadata;
  id v4 = -[MCMMetadataMinimal copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_userManagedAssetsDirName);
    objc_storeStrong(v5 + 6, self->_info);
    *((_DWORD *)v5 + 10) = self->_dataProtectionClass;
    objc_storeStrong(v5 + 8, self->_fsNode);
    objc_storeStrong(v5 + 10, self->_creator);
  }

  return v5;
}

- (NSString)debugDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__MCMMetadata_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSString)shortDescription
{
  return -[MCMMetadata description](self, "description");
}

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __26__MCMMetadata_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (void)_clearPersistedStatus
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMMetadata;
  -[MCMMetadataMinimal _clearPersistedStatus](&v7, sel__clearPersistedStatus);
  fsNode = self->_fsNode;
  self->_fsNode = 0LL;

  -[MCMMetadataMinimal containerPath](self, "containerPath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 metadataURL];
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  self->_fileURL = v5;
}

- (BOOL)_persisted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)_writeFileURL:(id)a3 dictionary:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v24[1] = *(id *)MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a3;
  -[MCMMetadataMinimal userIdentityCache](self, "userIdentityCache");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCMMetadataMinimal userIdentity](self, "userIdentity");
  [v12 libraryRepairForUserIdentity:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMMetadataMinimal containerPath](self, "containerPath");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal identifier](self, "identifier");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0LL;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  id v21[2] = __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke;
  v21[3] = &unk_18A29DA30;
  id v17 = v10;
  id v22 = v17;
  unint64_t v23 = a5;
  char v18 = [v14 fixAndRetryIfPermissionsErrorWithURL:v11 containerPath:v15 containerIdentifier:v16 error:v24 duringBlock:v21];

  id v19 = v24[0];
  if (a6 && (v18 & 1) == 0) {
    *a6 = v19;
  }

  return v18;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSString)userManagedAssetsDirName
{
  return self->_userManagedAssetsDirName;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)creator
{
  return self->_creator;
}

- (void).cxx_destruct
{
}

uint64_t __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "MCM_writeToURL:withOptions:error:", a2, *(void *)(a1 + 40), a3);
}

id __26__MCMMetadata_description__block_invoke(uint64_t a1, int a2)
{
  int v24 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  id v6 = v4;
  if (a2)
  {
    [v4 redactedDescription];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v23 = [*(id *)(a1 + 32) containerClass];
  int v7 = [*(id *)(a1 + 32) transient];
  uint64_t v8 = "";
  if (v7) {
    uint64_t v8 = "T";
  }
  id v22 = v8;
  [*(id *)(a1 + 32) userIdentity];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 shortDescription];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  uint64_t v11 = (uint64_t)v9;
  if (a2)
  {
    uint64_t v11 = [v9 redactedDescription];
  }

  [*(id *)(a1 + 32) uuid];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerPath];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 containerPathIdentifier];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [*(id *)(a1 + 32) dataProtectionClass];
  [*(id *)(a1 + 32) userManagedAssetsDirName];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v16;
  if ((a2 & 1) != 0)
  {
    [v16 redactedDescription];
    char v18 = v5;
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v24,  "stringWithFormat:",  @"<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>",
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
      v19);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v18;
    id v17 = v13;
    uint64_t v14 = v12;
    v13 = (void *)v11;
    id v12 = v10;
    id v10 = v25;
  }

  else
  {
    objc_msgSend( v24,  "stringWithFormat:",  @"<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>",
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
      v16);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v25;
  }

  return v20;
}

id __31__MCMMetadata_debugDescription__block_invoke(uint64_t a1, int a2)
{
  BOOL v28 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = *(void **)(a1 + 32);
  [v27 userIdentity];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  uint64_t v8 = (uint64_t)v6;
  if (a2)
  {
    uint64_t v8 = [v6 redactedDescription];
  }

  [*(id *)(a1 + 32) uuid];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [*(id *)(a1 + 32) containerClass];
  uint64_t v10 = [*(id *)(a1 + 32) transient];
  [*(id *)(a1 + 32) identifier];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if ((a2 & 1) != 0)
  {
    [v11 redactedDescription];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) containerPath];
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 redactedDescription];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v5;
    uint64_t v16 = [*(id *)(a1 + 32) dataProtectionClass];
    [*(id *)(a1 + 32) userManagedAssetsDirName];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 redactedDescription];
    id v25 = v7;
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v16;
    v5 = v15;
    objc_msgSend( v28,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>",
      v15,
      v27,
      v8,
      v9,
      v26,
      v10,
      v13,
      v14,
      v23,
      v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    int v7 = v25;
    id v20 = v12;
    id v12 = v9;
    v9 = (void *)v8;
  }

  else
  {
    [*(id *)(a1 + 32) containerPath];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [*(id *)(a1 + 32) dataProtectionClass];
    [*(id *)(a1 + 32) userManagedAssetsDirName];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v28,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>",
      v5,
      v27,
      v8,
      v9,
      v26,
      v10,
      v12,
      v20,
      v21,
      v13);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

uint64_t __31__MCMMetadata_verifyWithError___block_invoke(void *a1, void *a2, uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1[4] + 8LL) + 24LL;
  uint64_t v8 = *(void *)(a1[5] + 8LL) + 24LL;
  uint64_t v9 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v9 + 40);
  uint64_t v10 = [v6 itemAtURL:v5 followSymlinks:1 exists:v7 isDirectory:v8 fsNode:obj error:a3];

  objc_storeStrong((id *)(v9 + 40), obj[0]);
  return v10;
}

@end