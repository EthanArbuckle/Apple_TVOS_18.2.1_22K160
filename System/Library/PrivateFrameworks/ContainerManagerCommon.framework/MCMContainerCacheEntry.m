@interface MCMContainerCacheEntry
+ (id)UUIDForFileHandle:(id)a3;
+ (id)UUIDForURL:(id)a3;
+ (id)_fileHandleForURL:(id)a3 writeable:(BOOL)a4;
+ (id)identifierForFileHandle:(id)a3;
+ (id)identifierForURL:(id)a3;
+ (id)schemaVersionForFileHandle:(id)a3;
+ (id)schemaVersionForURL:(id)a3;
+ (timespec)birthtimeForFileHandle:(id)a3;
+ (timespec)birthtimeForURL:(id)a3;
+ (void)clearAttributesForFileHandle:(id)a3;
+ (void)clearAttributesForURL:(id)a3;
+ (void)setBirthtime:(timespec)a3 forFileHandle:(id)a4;
+ (void)setBirthtime:(timespec)a3 forURL:(id)a4;
+ (void)setIdentifier:(id)a3 forFileHandle:(id)a4;
+ (void)setIdentifier:(id)a3 forURL:(id)a4;
+ (void)setSchemaVersion:(id)a3 forFileHandle:(id)a4;
+ (void)setSchemaVersion:(id)a3 forURL:(id)a4;
+ (void)setUUID:(id)a3 forFileHandle:(id)a4;
+ (void)setUUID:(id)a3 forURL:(id)a4;
- (BOOL)corrupt;
- (BOOL)ignore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerCacheEntry:(id)a3;
- (BOOL)verify;
- (MCMContainerCacheEntry)initWithIdentifier:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 uuid:(id)a6 metadata:(id)a7 userIdentityCache:(id)a8;
- (MCMContainerCacheEntry)initWithMetadata:(id)a3 userIdentityCache:(id)a4;
- (MCMContainerCacheEntry_Internal)next;
- (MCMContainerCacheUpdatable)cache;
- (MCMContainerPath)containerPath;
- (MCMFSNode)fsNode;
- (MCMFileManagerResolvesPaths)fmForNode;
- (MCMMetadata)metadata;
- (MCMUserIdentityCache)userIdentityCache;
- (NSNumber)schemaVersion;
- (NSString)description;
- (NSString)identifier;
- (NSUUID)uuid;
- (id)_fabricateMetadataForContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)_findUserManagedAssetsDirectoryAtContainerRootURL:(id)a3;
- (id)_identifierForContainerPath:(id)a3;
- (id)_metadataFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)_readMetadataForIdentifier:(id)a3 containerPath:(id)a4 error:(id *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fsNodeWithError:(id *)a3;
- (id)fullDescription;
- (id)initFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7;
- (id)metadataMinimal;
- (id)metadataWithError:(id *)a3;
- (timespec)birthtimeWithError:(id *)a3;
- (unint64_t)hash;
- (void)setCache:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setCorrupt:(BOOL)a3;
- (void)setFsNode:(id)a3;
- (void)setIgnore:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setNext:(id)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setUuid:(id)a3;
- (void)setXattrs;
- (void)setXattrsWithFileHandle:(id)a3;
@end

@implementation MCMContainerCacheEntry

- (MCMContainerCacheEntry)initWithMetadata:(id)a3 userIdentityCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  else {
    id v8 = 0LL;
  }
  [v6 identifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerPath];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 schemaVersion];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 uuid];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCMContainerCacheEntry initWithIdentifier:containerPath:schemaVersion:uuid:metadata:userIdentityCache:]( self,  "initWithIdentifier:containerPath:schemaVersion:uuid:metadata:userIdentityCache:",  v9,  v10,  v11,  v12,  v8,  v7);

  return v13;
}

- (MCMContainerCacheEntry)initWithIdentifier:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 uuid:(id)a6 metadata:(id)a7 userIdentityCache:(id)a8
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MCMContainerCacheEntry;
  v18 = -[MCMContainerCacheEntry init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_metadataLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_userIdentityCache, a8);
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_containerPath, a4);
    objc_storeStrong((id *)&v19->_schemaVersion, a5);
    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_metadata, a7);
    uint64_t v20 = objc_msgSend(v16, "fsNode", v25, v26, v27);
    fsNode = v19->_fsNode;
    v19->_fsNode = (MCMFSNode *)v20;

    objc_storeWeak((id *)&v19->_cache, 0LL);
    *(_WORD *)&v19->_corrupt = 0;
    uint64_t v22 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    fmForNode = v19->_fmForNode;
    v19->_fmForNode = (MCMFileManagerResolvesPaths *)v22;
  }

  return v19;
}

- (id)initFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12 = a7;
  v13 = -[MCMContainerCacheEntry _metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:]( self,  "_metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:",  a3,  a4,  a5,  a6,  v12);
  if (v13)
  {
    v14 = -[MCMContainerCacheEntry initWithMetadata:userIdentityCache:]( self,  "initWithMetadata:userIdentityCache:",  v13,  v12);
  }

  else
  {

    v14 = 0LL;
  }

  return v14;
}

- (id)metadataWithError:(id *)a3
{
  v23[1] = *(id *)MEMORY[0x1895F89C0];
  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  if (self->_metadata)
  {
    id v6 = 0LL;
  }

  else
  {
    -[MCMContainerCacheEntry identifier](self, "identifier");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerCacheEntry containerPath](self, "containerPath");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0LL;
    -[MCMContainerCacheEntry _readMetadataForIdentifier:containerPath:error:]( self,  "_readMetadataForIdentifier:containerPath:error:",  v7,  v8,  v23);
    v9 = (MCMMetadata *)objc_claimAutoreleasedReturnValue();
    id v6 = v23[0];
    metadata = self->_metadata;
    self->_metadata = v9;

    if (!self->_metadata && [v6 type] == 108)
    {
      v11 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
      -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 identifier];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
      [v14 uuid];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry _metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:]( self,  "_metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:",  v11,  v13,  v15,  0LL,  v16);
      id v17 = (MCMMetadata *)objc_claimAutoreleasedReturnValue();
      v18 = self->_metadata;
      self->_metadata = v17;
    }
  }

  v19 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);
  if (a3 && !v19) {
    *a3 = v6;
  }
  -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MCMMetadataMinimal metadataByChangingContainerIdentity:](v19, "metadataByChangingContainerIdentity:", v20);
  return v21;
}

- (BOOL)verify
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  v3 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v58 = -[MCMContainerCacheEntry identifier](self, "identifier");
  [v3 containerClassPath];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userIdentity];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  [v5 libraryRepairForUserIdentity:v57];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x2020000000LL;
  char v76 = 0;
  uint64_t v67 = 0LL;
  v68 = &v67;
  uint64_t v69 = 0x3032000000LL;
  v70 = __Block_byref_object_copy__13075;
  v71 = __Block_byref_object_dispose__13076;
  id v72 = 0LL;
  uint64_t v7 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  [v3 metadataURL];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v66 = 0LL;
  v62[0] = MEMORY[0x1895F87A8];
  v62[1] = 3221225472LL;
  v62[2] = __32__MCMContainerCacheEntry_verify__block_invoke;
  v62[3] = &unk_18A29E828;
  id v9 = (id)v7;
  id v63 = v9;
  v64 = &v73;
  v65 = &v67;
  LOBYTE(v7) = [v6 fixAndRetryIfPermissionsErrorWithURL:v8 containerPath:v3 containerIdentifier:v58 error:&v66 duringBlock:v62];
  v56 = (os_log_s *)v66;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_29:
      id v26 = 0LL;
      v32 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_30;
    }

    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v56;
    v44 = "Cache entry failed verification, failed to check; cacheEntry = %@, error = %@";
LABEL_22:
    _os_log_error_impl(&dword_188846000, v41, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
    goto LABEL_29;
  }

  if (!*((_BYTE *)v74 + 24))
  {
    container_log_handle_for_category();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      [v3 metadataURL];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 path];
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = self;
      __int16 v79 = 2112;
      v80 = v46;
      _os_log_error_impl( &dword_188846000,  v41,  OS_LOG_TYPE_ERROR,  "Cache entry failed verification, metadata URL doesn't exist; cacheEntry = %@, metadataURL = [%@]",
        buf,
        0x16u);
    }

    goto LABEL_29;
  }
  v10 = -[MCMContainerCacheEntry fsNode](self, "fsNode");
  if (!v10) {
    goto LABEL_7;
  }
  v11 = -[MCMContainerCacheEntry fsNode](self, "fsNode");
  char v12 = [v11 isEqual:v68[5]];

  if ((v12 & 1) == 0)
  {
    container_log_handle_for_category();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v47 = (os_log_s *)v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v47;
    v44 = "Cache entry failed verification, fs node changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }
  v13 = -[MCMContainerCacheEntry fsNode](self, "fsNode");
  uint64_t v14 = [v13 ctime];
  if (v14 != [(id)v68[5] ctime])
  {

    goto LABEL_28;
  }

  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 ctime];
  uint64_t v17 = v16;
  [(id)v68[5] ctime];
  LOBYTE(v17) = v17 == v18;

  if ((v17 & 1) == 0)
  {
LABEL_28:
    container_log_handle_for_category();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v50 = (os_log_s *)v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    __int16 v79 = 2112;
    v80 = v50;
    v44 = "Cache entry failed verification, ctime changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }

- (id)metadataMinimal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(&OBJC_CLASS___MCMMetadataMinimal);
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[MCMMetadataMinimal initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:]( v4,  "initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:",  v3,  v5,  v6,  v7);

  return v8;
}

- (id)containerIdentity
{
  v20[1] = *MEMORY[0x1895F89C0];
  v20[0] = 1LL;
  id v3 = containermanager_copy_global_configuration();
  [v3 staticConfig];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  objc_msgSend(v4, "configForContainerClass:", objc_msgSend(v5, "containerClass"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry uuid](self, "uuid");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  [v19 userIdentity];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerPathIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMContainerCacheEntry cache](self, "cache");
  v11 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  char v12 = [v11 transient];
  v13 = -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  BYTE1(v16) = v12;
  LOBYTE(v16) = v10 != 0LL;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient :userIdentityCache:error:",  v17,  v6,  v7,  v18,  0LL,  v9,  v16,  v13,  v20);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fsNodeWithError:(id *)a3
{
  v11[1] = *(id *)MEMORY[0x1895F89C0];
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  [v5 containerRootURL];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry fmForNode](self, "fmForNode");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0LL;
  [v7 fsNodeOfURL:v6 followSymlinks:0 error:v11];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v11[0];

  if (a3 && !v8) {
    *a3 =  -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v9,  v6,  127LL);
  }

  return v8;
}

- (timespec)birthtimeWithError:(id *)a3
{
  v17[1] = *(id *)MEMORY[0x1895F89C0];
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  [v5 containerRootURL];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = +[MCMContainerCacheEntry birthtimeForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "birthtimeForURL:", v6);
  if (v7 | v8)
  {
    uint64_t v11 = v7;
    uint64_t v13 = v8;
    id v10 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }

  v17[0] = 0LL;
  -[MCMContainerCacheEntry fsNodeWithError:](self, "fsNodeWithError:", v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = [v9 birthtime];
    uint64_t v13 = v12;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v13 = 0LL;
  }

  if (a3)
  {
LABEL_8:
    if (v11) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v13 == 0;
    }
    if (v14) {
      *a3 = v10;
    }
  }

- (MCMMetadata)metadata
{
  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  v4 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);
  return v4;
}

- (void)setMetadata:(id)a3
{
  v4 = (MCMMetadata *)a3;
  os_unfair_lock_lock(&self->_metadataLock);
  metadata = self->_metadata;
  self->_metadata = v4;

  os_unfair_lock_unlock(&self->_metadataLock);
}

- (NSString)description
{
  __darwin_time_t v15 = (void *)NSString;
  -[MCMContainerCacheEntry identifier](self, "identifier");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  -[MCMContainerCacheEntry uuid](self, "uuid");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry metadata](self, "metadata");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    id v9 = "with";
  }
  else {
    id v9 = "without";
  }
  if (-[MCMContainerCacheEntry corrupt](self, "corrupt")) {
    id v10 = "|CORRUPT";
  }
  else {
    id v10 = "";
  }
  BOOL v11 = -[MCMContainerCacheEntry ignore](self, "ignore");
  uint64_t v12 = "|IGNORED";
  if (!v11) {
    uint64_t v12 = "";
  }
  [v15 stringWithFormat:@"(%@|%@|%@|%@|%@|%s metadata%s%s)", v3, v4, v5, v6, v7, v9, v10, v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)fullDescription
{
  uint64_t v17 = (void *)NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MCMContainerCacheEntry identifier](self, "identifier");
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry uuid](self, "uuid");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry metadata](self, "metadata");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 shortDescription];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MCMContainerCacheEntry corrupt](self, "corrupt")) {
    BOOL v11 = ", CORRUPT";
  }
  else {
    BOOL v11 = "";
  }
  BOOL v12 = -[MCMContainerCacheEntry ignore](self, "ignore");
  uint64_t v13 = ", IGNORED";
  if (!v12) {
    uint64_t v13 = "";
  }
  objc_msgSend( v17,  "stringWithFormat:",  @"<%@: %p; identifier = %@, containerPath = %@, schemaVersion = %@, uuid = %@, fsNode = %@, metadata = %@%s%s>",
    v16,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11,
    v13);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
  [v5 containerRootURL];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 hash];

  return v7 ^ v4;
}

- (BOOL)isEqualToContainerCacheEntry:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    -[MCMContainerCacheEntry metadata](self, "metadata");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 metadata];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) != (v7 != 0) && (!v6 || [v6 isEqual:v7]))
    {
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        uint64_t v13 = [v5 fsNode];
        if (v13)
        {
          BOOL v14 = (void *)v13;
          char v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }

      uint64_t v9 = -[MCMContainerCacheEntry fsNode](self, "fsNode");
      if (v9)
      {
        id v10 = (void *)v9;
        [v5 fsNode];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8) {
        if (!v11)
        }
          goto LABEL_22;
      }

      else if (v8)
      {
      }

      uint64_t v15 = -[MCMContainerCacheEntry fsNode](self, "fsNode");
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)v15;
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 fsNode];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = [v17 isEqual:v18];

      if (v19)
      {
LABEL_18:
        -[MCMContainerCacheEntry identifier](self, "identifier");
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 identifier];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v14 isEqualToString:v20])
        {
          v21 = -[MCMContainerCacheEntry containerPath](self, "containerPath");
          [v5 containerPath];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v21 isEqual:v22]
            && (int v23 = -[MCMContainerCacheEntry corrupt](self, "corrupt"),
                v23 == [v5 corrupt]))
          {
            uint64_t v24 = -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
            uint64_t v25 = [v5 schemaVersion];
            v31 = (void *)v24;
            id v26 = (void *)v24;
            id v27 = (void *)v25;
            if ([v26 isEqualToNumber:v25])
            {
              v30 = -[MCMContainerCacheEntry uuid](self, "uuid");
              [v5 uuid];
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
              char v12 = [v30 isEqual:v29];
            }

            else
            {
              char v12 = 0;
            }
          }

          else
          {
            char v12 = 0;
          }
        }

        else
        {
          char v12 = 0;
        }

        goto LABEL_30;
      }
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = (MCMContainerCacheEntry *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMContainerCacheEntry isEqualToContainerCacheEntry:](self, "isEqualToContainerCacheEntry:", v4);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = 0;
    objc_storeStrong((id *)(v4 + 80), self->_userIdentityCache);
    objc_storeStrong((id *)(v5 + 16), self->_identifier);
    objc_storeStrong((id *)(v5 + 24), self->_containerPath);
    objc_storeStrong((id *)(v5 + 40), self->_schemaVersion);
    objc_storeStrong((id *)(v5 + 48), self->_uuid);
    os_unfair_lock_lock(&self->_metadataLock);
    objc_storeStrong((id *)(v5 + 32), self->_metadata);
    os_unfair_lock_unlock(&self->_metadataLock);
    *(_BYTE *)(v5 + 12) = self->_corrupt;
    *(_BYTE *)(v5 + 13) = self->_ignore;
    objc_storeWeak((id *)(v5 + 64), 0LL);
    objc_storeStrong((id *)(v5 + 88), self->_fmForNode);
  }

  return (id)v5;
}

- (id)_readMetadataForIdentifier:(id)a3 containerPath:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  [v7 containerClassPath];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 containerClass];
  [v8 userIdentity];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = objc_alloc(&OBJC_CLASS___MCMMetadata);
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  id v13 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:]( v11,  "initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:",  v7,  v10,  v9,  v12,  &v17);
  id v14 = v17;

  if (!v13)
  {
    container_log_handle_for_category();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "Could not read metadata at [%@]: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v14;
    }
  }

  return v13;
}

- (id)_fabricateMetadataForContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 containerClass];
  [v12 containerRootURL];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 containerPathIdentifier];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 userIdentity];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v19 = containermanager_copy_global_configuration();
  [v19 staticConfig];
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 configForContainerClass:v17];
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v50 = v46;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v13;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v14;
    __int16 v55 = 2112;
    id v56 = v15;
    _os_log_impl( &dword_188846000,  v21,  OS_LOG_TYPE_DEFAULT,  "Attempting to recover from corrupt metadata for [%@]; identifier = %@, uuid = %@, schemaVersion = %@",
      buf,
      0x2Au);
  }

  v42 = v16;
  if (!v13)
  {
    -[MCMContainerCacheEntry _identifierForContainerPath:](self, "_identifierForContainerPath:", v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v41 = v15;
      container_log_handle_for_category();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v46;
        _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Unable to recover from corrupt metadata for [%@], no identifier",  buf,  0xCu);
      }

      id v13 = 0LL;
      goto LABEL_25;
    }
  }

  if (v14)
  {
    if (v15) {
      goto LABEL_7;
    }
  }

  else
  {
    v30 = +[MCMContainerCacheEntry UUIDForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "UUIDForURL:", v46);
    v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }

    else
    {
      [MEMORY[0x189607AB8] UUID];
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v14 = v32;

    if (v15) {
      goto LABEL_7;
    }
  }

  uint64_t v37 = +[MCMContainerCacheEntry schemaVersionForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "schemaVersionForURL:", v46);
  uint64_t v38 = (void *)v37;
  v39 = &unk_18A2BE830;
  if (v37) {
    v39 = (void *)v37;
  }
  id v15 = v39;

LABEL_7:
  uint64_t v48 = 1LL;
  BYTE1(v40) = isKindOfClass & 1;
  LOBYTE(v40) = 1;
  uint64_t v22 = +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient :userIdentityCache:error:",  v14,  v44,  v13,  v43,  0LL,  v45,  v40,  v16,  &v48);
  v41 = v15;
  if (!v22)
  {
    container_log_handle_for_category();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 138412546;
      v50 = v46;
      __int16 v51 = 2080;
      uint64_t v52 = error_description;
      _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Unable to generate identity for [%@]: error = %s",  buf,  0x16u);
    }

- (id)_identifierForContainerPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 containerClass];
  [v3 containerRootURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerCacheEntry identifierForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "identifierForURL:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      [v3 containerPathIdentifier];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v8;
      if (v4 == 13)
      {
        char v10 = [v8 systemGroupContainerIdIsWellknown:v7];

        if ((v10 & 1) == 0)
        {
LABEL_5:
          id v6 = 0LL;
LABEL_9:

          goto LABEL_10;
        }
      }

      else
      {
        int v11 = [v8 systemContainerIdIsWellknown:v7];

        if (!v11) {
          goto LABEL_5;
        }
      }

      id v6 = v7;
      goto LABEL_9;
    }

    id v6 = 0LL;
  }

- (id)_findUserManagedAssetsDirectoryAtContainerRootURL:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = 0LL;
  id v21 = v3;
  [v4 urlsForItemsInDirectoryAtURL:v3 error:&v24];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v24;

  if (!v5)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v3 path];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Couldn't read container contents when reconstructing metadata; path = [%@], error = %@",
        buf,
        0x16u);
    }
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);

        [v13 lastPathComponent];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v14 hasPrefix:@"com.apple.UserManagedAssets."])
        {
          __int16 v23 = 0;
          +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v22 = 0LL;
          char v16 = [v15 itemAtURL:v13 exists:&v23 isDirectory:(char *)&v23 + 1 error:&v22];
          id v6 = v22;

          if ((v16 & 1) != 0)
          {
            if (HIBYTE(v23) && (_BYTE)v23) {
              goto LABEL_22;
            }
          }

          else
          {
            container_log_handle_for_category();
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              [v21 path];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v31 = v18;
              __int16 v32 = 2112;
              id v33 = v6;
              _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Couldn't stat container contents when reconstructing metadata; path = [%@], error = %@",
                buf,
                0x16u);
            }
          }
        }

        else
        {
          id v6 = 0LL;
        }

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }

    while (v10);
  }

  id v14 = 0LL;
LABEL_22:

  return v14;
}

- (id)_metadataFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  [a3 containerPathForRealPath];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry _fabricateMetadataForContainerPath:identifier:uuid:schemaVersion:userIdentityCache:]( self,  "_fabricateMetadataForContainerPath:identifier:uuid:schemaVersion:userIdentityCache:",  v16,  v15,  v14,  v13,  v12);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (void)setIgnore:(BOOL)a3
{
  self->_ignore = a3;
}

- (MCMContainerCacheEntry_Internal)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (MCMContainerCacheUpdatable)cache
{
  return (MCMContainerCacheUpdatable *)objc_loadWeakRetained((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (void)setFsNode:(id)a3
{
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMFileManagerResolvesPaths)fmForNode
{
  return self->_fmForNode;
}

- (void).cxx_destruct
{
}

uint64_t __32__MCMContainerCacheEntry_verify__block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  id v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[5] + 8LL) + 24LL;
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v5 + 40);
  uint64_t v6 = [v3 itemAtURL:a2 followSymlinks:1 exists:v4 isDirectory:0 fsNode:obj error:a3];
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  return v6;
}

- (void)setXattrs
{
  id v3 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containerRootURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _fileHandleForURL:v5 writeable:1];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry setXattrsWithFileHandle:](self, "setXattrsWithFileHandle:", v6);
}

- (void)setXattrsWithFileHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setIdentifier:v6 forFileHandle:v4];

  id v7 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry uuid](self, "uuid");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setUUID:v8 forFileHandle:v4];

  uint64_t v9 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSchemaVersion:forFileHandle:");
}

+ (id)identifierForURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 identifierForFileHandle:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)identifierForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v9 = 0LL;
  id v3 = (void *)[a3 copyValueAsStringFromXattr:@"com.apple.containermanager.identifier" maxLength:1024 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (!v6)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to get xattr identifier; error = %@",
        buf,
        0xCu);
    }
  }

  return v3;
}

+ (id)schemaVersionForURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 schemaVersionForFileHandle:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)schemaVersionForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v9 = 0LL;
  id v3 = (void *)[a3 copyValueAsNumberFromXattr:@"com.apple.containermanager.schema-version" error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (!v6)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to get xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }
  }

  return v3;
}

+ (id)UUIDForURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 UUIDForFileHandle:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)UUIDForFileHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v9 = 0LL;
  id v3 = (void *)[a3 copyValueAsUUIDFromXattr:@"com.apple.containermanager.uuid" error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (!v6)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_error_impl(&dword_188846000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr uuid; error = %@", buf, 0xCu);
    }
  }

  return v3;
}

+ (timespec)birthtimeForURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [a1 birthtimeForFileHandle:v4];
  uint64_t v7 = v6;

  __darwin_time_t v8 = v5;
  uint64_t v9 = v7;
  result.tv_nsec = v9;
  result.tv_sec = v8;
  return result;
}

+ (timespec)birthtimeForFileHandle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v16 = 0LL;
  id v3 = (void *)[a3 copyValueAsStringFromXattr:@"com.apple.containermanager.birthtime" maxLength:1024 error:&v16];
  id v4 = v16;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (v6)
  {
    [v3 componentsSeparatedByString:@"."];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    __darwin_time_t v8 = v7;
    if (!v7 || [v7 count] != 2)
    {
      uint64_t v11 = 0LL;
      uint64_t v10 = 0LL;
      goto LABEL_14;
    }

    id v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = atol((const char *)[v9 UTF8String]);

    id v12 = [v8 objectAtIndexedSubscript:1];
    uint64_t v11 = atol((const char *)[v12 UTF8String]);
  }

  else
  {
    container_log_handle_for_category();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v5;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "Failed to get xattr birthtime; error = %@",
        buf,
        0xCu);
    }

    __darwin_time_t v8 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
  }

LABEL_14:
  __darwin_time_t v14 = v10;
  uint64_t v15 = v11;
  result.tv_nsec = v15;
  result.tv_sec = v14;
  return result;
}

+ (void)setIdentifier:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  [a1 _fileHandleForURL:a4 writeable:1];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIdentifier:forFileHandle:", v6);
}

+ (void)setIdentifier:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v8 = 0LL;
  char v4 = [a4 setXattr:@"com.apple.containermanager.identifier" valueAsString:a3 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to set xattr identifier; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)setSchemaVersion:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  [a1 _fileHandleForURL:a4 writeable:1];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSchemaVersion:forFileHandle:", v6);
}

+ (void)setSchemaVersion:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v8 = 0LL;
  char v4 = [a4 setXattr:@"com.apple.containermanager.schema-version" valueAsNumber:a3 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl( &dword_188846000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to set xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)setUUID:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  [a1 _fileHandleForURL:a4 writeable:1];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUUID:forFileHandle:", v6);
}

+ (void)setUUID:(id)a3 forFileHandle:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v8 = 0LL;
  char v4 = [a4 setXattr:@"com.apple.containermanager.uuid" valueAsUUID:a3 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_188846000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr uuid; error = %@", buf, 0xCu);
    }
  }
}

+ (void)setBirthtime:(timespec)a3 forURL:(id)a4
{
  uint64_t tv_nsec = a3.tv_nsec;
  __darwin_time_t tv_sec = a3.tv_sec;
  [a1 _fileHandleForURL:a4 writeable:1];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setBirthtime:tv_sec forFileHandle:tv_nsec];
}

+ (void)setBirthtime:(timespec)a3 forFileHandle:(id)a4
{
  uint64_t tv_nsec = a3.tv_nsec;
  __darwin_time_t tv_sec = a3.tv_sec;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = (void *)NSString;
  id v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", @"%ld.%09ld", tv_sec, tv_nsec);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  LOBYTE(v6) = [v7 setXattr:@"com.apple.containermanager.birthtime" valueAsString:v8 error:&v12];

  id v9 = v12;
  uint64_t v10 = v9;
  if ((v6 & 1) == 0 && v9)
  {
    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __darwin_time_t v14 = v10;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to set xattr birthtime; error = %@",
        buf,
        0xCu);
    }
  }
}

+ (void)clearAttributesForURL:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clearAttributesForFileHandle:");
}

+ (void)clearAttributesForFileHandle:(id)a3
{
  v27[4] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  v27[0] = @"com.apple.containermanager.identifier";
  v27[1] = @"com.apple.containermanager.schema-version";
  v27[2] = @"com.apple.containermanager.uuid";
  v27[3] = @"com.apple.containermanager.birthtime";
  [MEMORY[0x189603F18] arrayWithObjects:v27 count:4];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&__int128 v6 = 138412802LL;
    __int128 v14 = v6;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        id v15 = 0LL;
        char v11 = objc_msgSend(v3, "removeXattr:error:", v10, &v15, v14);
        id v12 = v15;
        if ((v11 & 1) == 0)
        {
          container_log_handle_for_category();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            uint64_t v17 = v10;
            __int16 v18 = 2112;
            id v19 = v3;
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Could not clear xattr [%@] from [%@]; error = %@",
              buf,
              0x20u);
          }
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }

    while (v7);
  }
}

+ (id)_fileHandleForURL:(id)a3 writeable:(BOOL)a4
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  [v4 path];
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 1;
  uint64_t v7 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v5,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v6,  0LL,  9LL,  0LL,  0LL,  0LL,  v9);

  return v7;
}

@end