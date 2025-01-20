@interface MCMMetadataMinimal
- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10;
- (BOOL)_persisted;
- (BOOL)existed;
- (BOOL)transient;
- (MCMConcreteContainerIdentityForLibsystem)containerIdentity;
- (MCMContainerPath)containerPath;
- (MCMMetadataMinimal)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6;
- (MCMUserIdentity)userIdentity;
- (MCMUserIdentityCache)userIdentityCache;
- (NSNumber)schemaVersion;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (container_object_s)createLibsystemContainerWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByReadingAndValidatingMetadataAtContainerPath:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 userIdentityCache:(id)a6 error:(id *)a7;
- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8;
- (id)metadataByChangingContainerIdentity:(id)a3;
- (id)metadataByChangingContainerPath:(id)a3;
- (id)metadataByChangingSchemaVersion:(id)a3;
- (id)metadataByChangingUUID:(id)a3;
- (id)metadataBySettingTransient:(BOOL)a3;
- (unint64_t)containerClass;
- (unsigned)platform;
@end

@implementation MCMMetadataMinimal

- (MCMMetadataMinimal)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCMMetadataMinimal;
  v15 = -[MCMMetadataMinimal init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerPath, a4);
    objc_storeStrong((id *)&v16->_containerIdentity, a3);
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = &unk_18A2BE800;
    }
    objc_storeStrong((id *)&v16->_schemaVersion, v17);
    objc_storeStrong((id *)&v16->_userIdentityCache, a6);
  }

  return v16;
}

- (id)initByReadingAndValidatingMetadataAtContainerPath:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 userIdentityCache:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  [v14 metadataURL];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:]( self,  "initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:",  v15,  v14,  v13,  a5,  v12,  a7);

  return v16;
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v60 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x3032000000LL;
  v71 = __Block_byref_object_copy__2872;
  v72 = __Block_byref_object_dispose__2873;
  id v73 = 0LL;
  [v12 URLByDeletingLastPathComponent];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = 0LL;
  v66[1] = v66;
  v66[2] = 0x3032000000LL;
  v66[3] = __Block_byref_object_copy__2872;
  v66[4] = __Block_byref_object_dispose__2873;
  id v67 = 0LL;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___MCMMetadataMinimal;
  v15 = -[MCMMetadataMinimal init](&v65, sel_init);
  if (!v15)
  {
    objc_super v19 = 0LL;
    v17 = 0LL;
    goto LABEL_36;
  }

  [v14 libraryRepairForUserIdentity:v13];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  id v64 = 0LL;
  v63[0] = MEMORY[0x1895F87A8];
  v63[1] = 3221225472LL;
  v63[2] = __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke;
  v63[3] = &unk_18A29E1C8;
  v63[4] = &v68;
  v63[5] = v66;
  [v57 fixAndRetryIfPermissionsErrorWithURL:v12 containerRootURL:v61 error:&v64 duringBlock:v63];
  id v16 = (MCMError *)v64;
  v17 = v16;
  if (v69[5])
  {
    v18 = 0LL;
    goto LABEL_26;
  }

  if (v16)
  {
    -[MCMError domain](v16, "domain");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqual:*MEMORY[0x189607460]])
    {
      BOOL v21 = -[MCMError code](v17, "code") == 2048;

      if (v21)
      {
        v22 = objc_alloc(&OBJC_CLASS___MCMError);
        [v12 path];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v22,  "initWithErrorType:category:path:POSIXerrno:",  108LL,  5LL,  v23,  0LL);

        container_log_handle_for_category();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          [v12 path];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v75 = v25;
          _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Metadata file at [%{public}@] is corrupt.",  buf,  0xCu);
        }

        goto LABEL_23;
      }
    }

    else
    {
    }
  }
  v26 = -[MCMError domain](v17, "domain");
  uint64_t v27 = *MEMORY[0x189607688];
  int v28 = [v26 isEqual:*MEMORY[0x189607688]];

  if (v28)
  {
    v29 = -[MCMError domain](v17, "domain");
    if ([v29 isEqualToString:v27])
    {
      BOOL v30 = -[MCMError code](v17, "code") == 2;

      if (v30)
      {
LABEL_22:
        v33 = objc_alloc(&OBJC_CLASS___MCMError);
        [v12 path];
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        objc_super v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v33,  "initWithErrorType:category:path:POSIXerrno:",  127LL,  1LL,  v24,  -[MCMError code](v17, "code"));
LABEL_23:

        goto LABEL_24;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      [v12 path];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v48;
      __int16 v76 = 2112;
      v77 = v17;
      _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Could not read metadata file at [%{public}@]; error = %@",
        buf,
        0x16u);
    }

    goto LABEL_22;
  }

  container_log_handle_for_category();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    [v12 path];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v47;
    __int16 v76 = 2112;
    v77 = v17;
    _os_log_error_impl( &dword_188846000,  v31,  OS_LOG_TYPE_ERROR,  "Could not read metadata file at [%{public}@]; error = %@",
      buf,
      0x16u);
  }

  objc_super v19 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 12LL);
LABEL_24:
  if (v69[5])
  {
    v18 = v19;
LABEL_26:
    v62 = v18;
    BOOL v34 = -[MCMMetadataMinimal _initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:]( v15,  "_initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:",  v14,  &v62);
    objc_super v19 = v62;

    if (v34)
    {
      container_log_handle_for_category();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);

      if (v36)
      {
        container_log_handle_for_category();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v46 = -[MCMMetadataMinimal uuid](v15, "uuid");
          v59 = -[MCMMetadataMinimal containerPath](v15, "containerPath");
          [v59 containerPathIdentifier];
          v55 = (MCMError *)objc_claimAutoreleasedReturnValue();
          v54 = -[MCMMetadataMinimal identifier](v15, "identifier");
          uint64_t v53 = -[MCMMetadataMinimal containerClass](v15, "containerClass");
          int v56 = -[MCMMetadataMinimal conformsToProtocol:](v15, "conformsToProtocol:", &unk_18C735DA0);
          if (v56)
          {
            v51 = -[MCMMetadataMinimal fsNode](v15, "fsNode");
            uint64_t v52 = [v51 inode];
          }

          else
          {
            uint64_t v52 = 0LL;
          }

          [v12 path];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[MCMMetadataMinimal shortDescription](v15, "shortDescription");
          *(_DWORD *)buf = 138544898;
          v75 = v46;
          __int16 v76 = 2114;
          v77 = v55;
          __int16 v78 = 2112;
          v79 = v54;
          __int16 v80 = 2050;
          uint64_t v81 = v53;
          __int16 v82 = 2048;
          uint64_t v83 = v52;
          __int16 v84 = 2112;
          v85 = v49;
          __int16 v86 = 2112;
          v87 = v50;
          _os_log_debug_impl( &dword_188846000,  v37,  OS_LOG_TYPE_DEBUG,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Read metadata from [%@]: %@",  buf,  0x48u);

          if (v56) {
        }
          }
      }

      goto LABEL_44;
    }

    goto LABEL_35;
  }

  if (!v19)
  {
    v38 = -[MCMError domain](v17, "domain");
    int v39 = [v38 isEqualToString:*MEMORY[0x189607688]];

    if (v39)
    {
      v40 = objc_alloc(&OBJC_CLASS___MCMError);
      [v12 path];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v40,  "initWithErrorType:category:path:POSIXerrno:",  127LL,  1LL,  v41,  -[MCMError code](v17, "code"));
    }

    else
    {
      objc_super v19 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 108LL);
    }
  }

- (container_object_s)createLibsystemContainerWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = 1LL;
  v5 = -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  v6 = -[MCMMetadataMinimal containerPath](self, "containerPath");
  [v6 containerPathIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (container_object_s *)objc_msgSend( v5,  "createLibsystemContainerWithContainerPathIdentifier:existed:error:",  v7,  -[MCMMetadataMinimal existed](self, "existed"),  v11);

  if (a3 && !v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___MCMError);
    *a3 = -[MCMError initWithErrorType:](v9, "initWithErrorType:", v11[0]);
  }

  return v8;
}

- (NSString)identifier
{
  return -[MCMContainerIdentityMinimal identifier](self->_containerIdentity, "identifier");
}

- (NSUUID)uuid
{
  return -[MCMConcreteContainerIdentity uuid](self->_containerIdentity, "uuid");
}

- (unint64_t)containerClass
{
  return -[MCMContainerIdentityMinimal containerClass](self->_containerIdentity, "containerClass");
}

- (BOOL)transient
{
  return -[MCMContainerIdentity transient](self->_containerIdentity, "transient");
}

- (MCMUserIdentity)userIdentity
{
  return -[MCMContainerIdentityMinimal userIdentity](self->_containerIdentity, "userIdentity");
}

- (unsigned)platform
{
  return -[MCMContainerIdentityMinimal platform](self->_containerIdentity, "platform");
}

- (BOOL)existed
{
  return -[MCMConcreteContainerIdentityForLibsystem existed](self->_containerIdentity, "existed");
}

- (id)metadataBySettingTransient:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  uint64_t v7 = [v6 identityByChangingTransient:v3];

  v8 = (void *)v5[3];
  v5[3] = v7;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)metadataByChangingContainerPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[1];
  v5[1] = v4;
  id v7 = v4;

  v8 = (void *)v5[3];
  [v7 containerPathIdentifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v8 identityByChangingContainerPathIdentifier:v9];
  id v11 = (void *)v5[3];
  v5[3] = v10;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)metadataByChangingUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  uint64_t v7 = [v6 identityByChangingUUID:v4];

  v8 = (void *)v5[3];
  v5[3] = v7;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)metadataByChangingSchemaVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[2];
  v5[2] = v4;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)metadataByChangingContainerIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[3];
  v5[3] = v4;

  [v5 _clearPersistedStatus];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_containerPath);
    objc_storeStrong(v5 + 2, self->_schemaVersion);
    objc_storeStrong(v5 + 3, self->_containerIdentity);
    objc_storeStrong(v5 + 4, self->_userIdentityCache);
  }

  return v5;
}

- (NSString)debugDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  BOOL v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __38__MCMMetadataMinimal_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSString)shortDescription
{
  return -[MCMMetadataMinimal description](self, "description");
}

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  BOOL v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__MCMMetadataMinimal_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  uint64_t v133 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v122 = a5;
  id v16 = a8;
  id v123 = a9;
  [v14 objectForKeyedSubscript:@"MCMMetadataIdentifier"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"MCMMetadataVersion"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_userIdentityCache, a9);
  objc_storeStrong((id *)&self->_containerPath, a4);
  v124 = v17;
  v121 = v16;
  if (v18)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v20 = (void *)MEMORY[0x189607968];
    if ((isKindOfClass & 1) != 0)
    {
      id v21 = v18;
      objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v18 integerValue] > 5)
      {
        v22 = objc_alloc(&OBJC_CLASS___MCMError);
        [v16 path];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v22,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v23,  0LL);

        container_log_handle_for_category();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          id v77 = v15;
          __int16 v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          unint64_t v128 = (unint64_t)v78;
          __int16 v129 = 2112;
          *(void *)v130 = v18;
          _os_log_error_impl(&dword_188846000, v25, OS_LOG_TYPE_ERROR, "Invalid metadata version: (%@) %@", buf, 0x16u);

          id v15 = v77;
        }

        goto LABEL_6;
      }

      v17 = v124;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = objc_alloc(&OBJC_CLASS___MCMError);
        [v16 path];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v26,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v27,  0LL);

        container_log_handle_for_category();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        int v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        unint64_t v128 = (unint64_t)v25;
        __int16 v129 = 2112;
        *(void *)v130 = v18;
        v29 = "Invalid metadata version: (%@) %@";
        BOOL v30 = (os_log_s *)v21;
        uint32_t v31 = 22;
        goto LABEL_63;
      }
    }
  }

  else
  {
    v18 = &unk_18A2BDE70;
  }

  objc_opt_class();
  id v32 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v33 = v32;
  }
  else {
    id v33 = 0LL;
  }

  if (!v33)
  {
    id v37 = v15;
    v38 = objc_alloc(&OBJC_CLASS___MCMError);
    [v16 path];
    int v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v38,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v39,  0LL);

    container_log_handle_for_category();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v128 = (unint64_t)v32;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Invalid metadata Identifier: %@",  buf,  0xCu);
    }

    v40 = 0LL;
    id v41 = 0LL;
    id v42 = 0LL;
    id v15 = v37;
    goto LABEL_52;
  }

  [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v35 = v34;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v36 = v35;
  }
  else {
    id v36 = 0LL;
  }

  if (!v36)
  {
    v47 = objc_alloc(&OBJC_CLASS___MCMError);
    [v16 path];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v47,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v48,  0LL);

    container_log_handle_for_category();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    unint64_t v128 = (unint64_t)v25;
    v29 = "Invalid metadata UUID String: %@";
    BOOL v30 = (os_log_s *)v21;
    uint32_t v31 = 12;
LABEL_63:
    _os_log_error_impl(&dword_188846000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
LABEL_6:

LABEL_26:
    v40 = 0LL;
    id v41 = 0LL;
    id v42 = 0LL;
LABEL_52:

    if (a10)
    {
      v24 = v24;
      BOOL v71 = 0;
      *a10 = v24;
    }

    else
    {
      BOOL v71 = 0;
    }

    v72 = v123;
    id v73 = v124;
    goto LABEL_56;
  }

  id v43 = objc_alloc(MEMORY[0x189607AB8]);
  [v14 objectForKeyedSubscript:@"MCMMetadataUUID"];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)[v43 initWithUUIDString:v44];

  objc_opt_class();
  id v42 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v46 = v42;
  }
  else {
    id v46 = 0LL;
  }

  if (!v46)
  {
    uint64_t v52 = objc_alloc(&OBJC_CLASS___MCMError);
    [v16 path];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v52,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v53,  0LL);

    container_log_handle_for_category();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
LABEL_51:
      v40 = 0LL;
      id v41 = 0LL;
      goto LABEL_52;
    }

    *(_DWORD *)buf = 138412290;
    unint64_t v128 = (unint64_t)v42;
    v54 = "Invalid metadata UUID: %@";
LABEL_95:
    _os_log_error_impl(&dword_188846000, (os_log_t)v21, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
    goto LABEL_51;
  }

  [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v50 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v51 = v50;
  }
  else {
    id v51 = 0LL;
  }

  if (!v51)
  {
    v66 = objc_alloc(&OBJC_CLASS___MCMError);
    [v16 path];
    id v67 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v66,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v67,  0LL);

    container_log_handle_for_category();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      unint64_t v128 = (unint64_t)v68;
      _os_log_error_impl(&dword_188846000, (os_log_t)v21, OS_LOG_TYPE_ERROR, "Invalid metadata Class: %@", buf, 0xCu);
    }

    goto LABEL_51;
  }

  [v14 objectForKeyedSubscript:@"MCMMetadataContentClass"];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = [v55 unsignedLongLongValue];

  if ((unint64_t)(v56 - 1) >= 0xE)
  {
    v69 = objc_alloc(&OBJC_CLASS___MCMError);
    [v16 path];
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v69,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v70,  0LL);

    container_log_handle_for_category();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 134217984;
    unint64_t v128 = a6;
    v54 = "Invalid metadata Content Class: %ld";
    goto LABEL_95;
  }

  if (container_class_normalized() != a6)
  {
    container_log_handle_for_category();
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v128 = (unint64_t)v32;
      __int16 v129 = 2050;
      *(void *)v130 = v56;
      *(_WORD *)&v130[8] = 2050;
      *(void *)&v130[10] = a6;
      _os_log_error_impl( &dword_188846000,  v57,  OS_LOG_TYPE_ERROR,  "Container [%@] declares its class to be [%{public}llu] while scanning for class [%{public}llu]",  buf,  0x20u);
    }
  }

  id v58 = containermanager_copy_global_configuration();
  [v58 staticConfig];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v59 configForContainerClass:a6];
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = v15;
  if ([v40 personaAndUserSpecific])
  {
    [v14 objectForKeyedSubscript:@"MCMMetadataPersona"];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    [v122 posixUser];
    id v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = +[MCMContainerClassPath posixOwnerForContainerClass:user:]( &OBJC_CLASS___MCMContainerClassPath,  "posixOwnerForContainerClass:user:",  a6,  v60);
    v118 = v61;
    if (a6 <= 0xB && ((1LL << a6) & 0xED4) != 0)
    {
      if (v21)
      {
        int v62 = [v61 UID];
        if (v62 != [v21 unsignedIntValue])
        {
          v63 = objc_alloc(&OBJC_CLASS___MCMError);
          [v121 path];
          id v64 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v63,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v64,  0LL);

          container_log_handle_for_category();
          objc_super v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            int v108 = [v61 UID];
            *(_DWORD *)buf = 138412802;
            unint64_t v128 = (unint64_t)v21;
            __int16 v129 = 1024;
            *(_DWORD *)v130 = v108;
            *(_WORD *)&v130[4] = 2112;
            *(void *)&v130[6] = v32;
            _os_log_error_impl( &dword_188846000,  v65,  OS_LOG_TYPE_ERROR,  "Incorrect UserId: %@, expecting: %u for %@",  buf,  0x1Cu);
          }

          id v41 = 0LL;
          goto LABEL_104;
        }
      }

      else
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v61, "UID"));
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v79)
    {
      unsigned int v86 = [v21 unsignedIntValue];
      if (v86 == 499) {
        uint64_t v87 = 0LL;
      }
      else {
        uint64_t v87 = v86;
      }
      +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", v87);
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
      [v123 userIdentityForPersonalPersonaWithPOSIXUser:v88];
      id v41 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_77;
    }

    uint64_t v126 = 1LL;
    [v14 objectForKeyedSubscript:@"MCMMetadataUserIdentity"];
    __int16 v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMUserIdentity userIdentityWithPlist:cache:error:]( &OBJC_CLASS___MCMUserIdentity,  "userIdentityWithPlist:cache:error:",  v80,  v123,  &v126);
    id v41 = (id)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
LABEL_67:
      if (([v41 isEqual:v122] & 1) == 0)
      {
        id v81 = containermanager_copy_global_configuration();
        if ([v81 runmode] == 2)
        {
          id v116 = containermanager_copy_global_configuration();
          [v116 currentUser];
          __int16 v82 = (void *)objc_claimAutoreleasedReturnValue();
          id v111 = containermanager_copy_global_configuration();
          [v111 defaultUser];
          v114 = v81;
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
          int v112 = [v82 isEqual:v83];

          if (v112)
          {
            container_log_handle_for_category();
            __int16 v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v128 = (unint64_t)v32;
              __int16 v129 = 2048;
              *(void *)v130 = a6;
              _os_log_impl( &dword_188846000,  v84,  OS_LOG_TYPE_DEFAULT,  "User identity reconstructed from metadata for [%@(%llu)] doesn't match expected, assuming the current user identity.",  buf,  0x16u);
            }

            id v85 = v122;
            id v41 = v85;
            goto LABEL_77;
          }
        }

        else
        {
        }

        v106 = objc_alloc(&OBJC_CLASS___MCMError);
        [v121 path];
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v106,  "initWithErrorType:category:path:POSIXerrno:",  29LL,  5LL,  v107,  0LL);

        container_log_handle_for_category();
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          unint64_t v128 = (unint64_t)v41;
          __int16 v129 = 2112;
          *(void *)v130 = v122;
          *(_WORD *)&v130[8] = 2112;
          *(void *)&v130[10] = v32;
          __int16 v131 = 2048;
          uint64_t v132 = v126;
          _os_log_error_impl( &dword_188846000,  v105,  OS_LOG_TYPE_ERROR,  "Incorrect User Identity: %@, expecting: %@ for %@: %llu",  buf,  0x2Au);
        }

- (BOOL)_persisted
{
  return 0;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (MCMConcreteContainerIdentityForLibsystem)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

id __33__MCMMetadataMinimal_description__block_invoke(uint64_t a1, int a2)
{
  v18 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    [v4 redactedDescription];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_super v19 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) containerClass];
  else {
    v8 = "";
  }
  [*(id *)(a1 + 32) userIdentity];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 shortDescription];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  id v12 = v10;
  if (a2)
  {
    [v10 redactedDescription];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) uuid];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerPath];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 containerPathIdentifier];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 stringWithFormat:@"<%@(%llu%s);%@;u%@;p%@>", v6, v7, v8, v12, v13, v15];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    id v11 = v9;
  }

  else
  {
    v6 = v9;
  }

  return v16;
}

id __38__MCMMetadataMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v23 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  [v6 userIdentity];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  uint64_t v9 = (uint64_t)v7;
  if (a2)
  {
    uint64_t v9 = [v7 redactedDescription];
  }

  [*(id *)(a1 + 32) uuid];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [*(id *)(a1 + 32) containerClass];
  uint64_t v12 = [*(id *)(a1 + 32) transient];
  [*(id *)(a1 + 32) identifier];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  if ((a2 & 1) != 0)
  {
    [v13 redactedDescription];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) containerPath];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 redactedDescription];
    v22 = v8;
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v23,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>",
      v17,
      v6,
      v9,
      v10,
      v11,
      v12,
      v15,
      v18);
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v17;
    v8 = v22;

    uint64_t v20 = v14;
    id v14 = v10;
    uint64_t v10 = (void *)v9;
  }

  else
  {
    [*(id *)(a1 + 32) containerPath];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v23,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>",
      v5,
      v6,
      v9,
      v10,
      v11,
      v12,
      v14,
      v20);
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

BOOL __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(MEMORY[0x189603F68], "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a2, 0, obj, a3);
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) != 0LL;
}

@end