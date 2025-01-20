@interface MIMCMContainer
+ (BOOL)deleteContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5;
+ (id)_allContainersForIdentifiers:(id)a3 groupIdentifiers:(id)a4 contentClass:(unint64_t)a5 forPersona:(id)a6 transient:(BOOL)a7 create:(BOOL)a8 error:(id *)a9;
+ (id)_containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 transient:(BOOL)a6 create:(BOOL)a7 error:(id *)a8;
+ (id)_enumeratorWithContainerClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 create:(BOOL)a8 usingBlock:(id)a9;
+ (id)containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7;
+ (id)containersForBundleIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 fetchTransient:(BOOL)a7 error:(id *)a8;
+ (id)containersForContentClass:(unint64_t)a3 forPersona:(id)a4 fetchTransient:(BOOL)a5 error:(id *)a6;
+ (id)containersForGroupIdentifier:(id)a3 forPersona:(id)a4 create:(BOOL)a5 fetchTransient:(BOOL)a6 error:(id *)a7;
+ (id)defaultDirectoriesForContainerType:(unint64_t)a3 error:(id *)a4;
+ (id)enumerateContainersWithClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 usingBlock:(id)a8;
+ (id)transientContainerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7;
- (BOOL)_doInitWithContainer:(container_object_s *)a3 error:(id *)a4;
- (BOOL)_refreshContainerMetadataWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNew;
- (BOOL)isTransient;
- (BOOL)purgeContentWithError:(id *)a3;
- (BOOL)reclaimDiskSpaceWithError:(id *)a3;
- (BOOL)recreateDefaultStructureWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)replaceExistingContainer:(id)a3 error:(id *)a4;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MIMCMContainer)initWithContainer:(container_object_s *)a3 error:(id *)a4;
- (MIMCMContainer)initWithSerializedContainer:(id)a3 matchingWithOptions:(unint64_t)a4 error:(id *)a5;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)containerURL;
- (container_object_s)mcmContainer;
- (id)description;
- (id)infoValueForKey:(id)a3 error:(id *)a4;
- (id)serializedContainerRepresentation;
- (unint64_t)containerClass;
- (unint64_t)diskUsage;
- (void)dealloc;
- (void)setIsTransient:(BOOL)a3;
@end

@implementation MIMCMContainer

- (BOOL)_doInitWithContainer:(container_object_s *)a3 error:(id *)a4
{
  BOOL v25 = 0;
  self->_containerClass = container_get_class();
  uint64_t identifier = container_get_identifier();
  if (!identifier)
  {
    _CreateAndLogError( (uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]",  121LL,  @"MIContainerManagerErrorDomain",  18LL,  0LL,  0LL,  @"Failed to get identifier for the container",  v7,  v23);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  [NSString stringWithUTF8String:identifier];
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = self->_identifier;
  self->_uint64_t identifier = v8;

  self->_mcmContainer = (container_object_s *)container_copy_object();
  uint64_t persona_unique_string = container_get_persona_unique_string();
  if (persona_unique_string)
  {
    [NSString stringWithUTF8String:persona_unique_string];
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    personaUniqueString = self->_personaUniqueString;
    self->_personaUniqueString = v11;
  }

  id v24 = 0LL;
  BOOL v13 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v24);
  id v14 = v24;
  if (!v13)
  {
LABEL_8:
    if (!a4)
    {
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }

- (MIMCMContainer)initWithContainer:(container_object_s *)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  v6 = -[MIMCMContainer init](&v10, sel_init);
  uint64_t v7 = v6;
  if (v6 && !-[MIMCMContainer _doInitWithContainer:error:](v6, "_doInitWithContainer:error:", a3, a4)) {
    v8 = 0LL;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (MIMCMContainer)initWithSerializedContainer:(id)a3 matchingWithOptions:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  uint64_t last_error = 0LL;
  v8 = -[MIMCMContainer init](&v43, sel_init);
  if (!v8)
  {
    uint64_t v11 = 0LL;
    BOOL v13 = 0;
    id v14 = 0LL;
    goto LABEL_24;
  }

  id v9 = v7;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = container_serialize_copy_deserialized_reference();
  if (!v10)
  {
    if (last_error)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t type = container_error_get_type();
      int posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        v18 = (void *)*MEMORY[0x189607688];
        uint64_t v19 = posix_errno;
        v20 = strerror(posix_errno);
        _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  187LL,  v18,  v19,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v21,  (uint64_t)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v22 = 0LL;
      }

      _ErrorDict();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  187LL,  @"MIContainerManagerErrorDomain",  type,  v22,  v34,  @"%@",  v35,  (uint64_t)v15);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      container_error_free();
    }

    else
    {
      uint64_t error_description = container_get_error_description();
      v33 = "(container_get_error_description returned NULL)";
      if (error_description) {
        v33 = (const char *)error_description;
      }
      _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  190LL,  @"MIContainerManagerErrorDomain",  21LL,  0LL,  0LL,  @"%s",  v32,  (uint64_t)v33);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v11 = 0LL;
    goto LABEL_23;
  }

  uint64_t v11 = v10;
  container_query_create_from_container();
  container_query_operation_set_flags();
  uint64_t single_result = container_query_get_single_result();
  if (!single_result)
  {
    uint64_t last_error = container_query_get_last_error();
    if (last_error)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = container_error_get_type();
      int v25 = container_error_get_posix_errno();
      if (v25)
      {
        v26 = (void *)*MEMORY[0x189607688];
        uint64_t v27 = v25;
        v28 = strerror(v25);
        _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  204LL,  v26,  v27,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v29,  (uint64_t)v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v30 = 0LL;
      }

      _ErrorDict();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  204LL,  @"MIContainerManagerErrorDomain",  v24,  v30,  v39,  @"%@",  v40,  (uint64_t)v23);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v36 = container_get_error_description();
      v38 = "(container_get_error_description returned NULL)";
      if (v36) {
        v38 = (const char *)v36;
      }
      _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  206LL,  @"MIContainerManagerErrorDomain",  21LL,  0LL,  0LL,  @"%s",  v37,  (uint64_t)v38);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  -[MIMCMContainer dealloc](&v3, sel_dealloc);
}

- (id)serializedContainerRepresentation
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  _RawContainerDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MIMCMContainer personaUniqueString](self, "personaUniqueString");
  -[MIMCMContainer containerURL](self, "containerURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 path];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ container=%@ persona=%@ path=%@>", v4, v5, v6, v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MIMCMContainer *)a3;
  if (v4 == self)
  {
    char is_equal = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIMCMContainer mcmContainer](self, "mcmContainer");
      -[MIMCMContainer mcmContainer](v5, "mcmContainer");

      char is_equal = container_is_equal();
    }

    else
    {
      char is_equal = 0;
    }
  }

  return is_equal;
}

- (BOOL)_refreshContainerMetadataWithError:(id *)a3
{
  uint64_t path = container_get_path();
  if (path)
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    id v7 = 0LL;
    id v8 = 0LL;
    if (v6) {
      goto LABEL_6;
    }
  }

  else
  {
    _RawContainerDescription();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"_ContainerURL",  87LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to fetch container URL from %@",  v10,  (uint64_t)v9);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v8 = v7;

  v6 = 0LL;
LABEL_6:
  id v11 = v8;
  containerURL = self->_containerURL;
  self->_containerURL = v6;

  if (self->_containerURL)
  {
    -[MIMCMContainer mcmContainer](self, "mcmContainer");
    uint64_t is_transient = container_is_transient();
    if (is_transient == 1)
    {
      self->_isTransient = 0;
      BOOL v14 = 1;
      goto LABEL_15;
    }

    uint64_t v15 = is_transient;
    uint64_t error_description = container_get_error_description();
    v18 = "(container_get_error_description returned NULL)";
    if (error_description) {
      v18 = (const char *)error_description;
    }
    uint64_t v19 = _CreateError( (uint64_t)"-[MIMCMContainer _refreshContainerMetadataWithError:]",  277LL,  @"MIContainerManagerErrorDomain",  v15,  0LL,  0LL,  @"%s",  v17,  (uint64_t)v18);

    id v11 = (id)v19;
  }

  if (a3)
  {
    id v11 = v11;
    BOOL v14 = 0;
    *a3 = v11;
  }

  else
  {
    BOOL v14 = 0;
  }

- (BOOL)reclaimDiskSpaceWithError:(id *)a3
{
  uint64_t v4 = container_operation_delete_reclaim_disk_space();
  if (v4)
  {
    MICopyUnlocalizedDescriptionForContainerExtendedError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t type = container_error_get_type();
    int posix_errno = container_error_get_posix_errno();
    if (posix_errno)
    {
      id v8 = (void *)*MEMORY[0x189607688];
      uint64_t v9 = posix_errno;
      uint64_t v10 = strerror(posix_errno);
      _CreateError( (uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]",  298LL,  v8,  v9,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v11,  (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }

    _ErrorDict();
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]",  298LL,  @"MIContainerManagerErrorDomain",  type,  v12,  v14,  @"%@",  v15,  (uint64_t)v5);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    container_error_free();
    if (a3)
    {
      id v13 = v13;
      *a3 = v13;
    }
  }

  else
  {
    container_error_free();
    id v13 = 0LL;
  }

  return v4 == 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v5 = container_regenerate_uuid();
  if (v5 == 1)
  {
    id v13 = 0LL;
    BOOL v6 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v13);
    id v7 = v13;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  uint64_t v8 = v5;
  uint64_t error_description = container_get_error_description();
  uint64_t v11 = "(container_get_error_description returned NULL)";
  if (error_description) {
    uint64_t v11 = (const char *)error_description;
  }
  _CreateError( (uint64_t)"-[MIMCMContainer regenerateDirectoryUUIDWithError:]",  321LL,  @"MIContainerManagerErrorDomain",  v8,  0LL,  0LL,  @"%s",  v10,  (uint64_t)v11);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v6 = 0;
  if (a3)
  {
LABEL_7:
    if (!v6) {
      *a3 = v7;
    }
  }

- (unint64_t)diskUsage
{
  return container_disk_usage();
}

- (BOOL)purgeContentWithError:(id *)a3
{
  uint64_t v5 = container_delete_all_container_content();
  if (v5 == 1)
  {
    id v6 = 0LL;
  }

  else
  {
    -[MIMCMContainer identifier](self, "identifier");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIMCMContainer purgeContentWithError:]",  361LL,  @"MIContainerManagerErrorDomain",  v5,  0LL,  0LL,  @"Failed to wipe container for identifier %@",  v8,  (uint64_t)v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v6 = v6;
      *a3 = v6;
    }
  }

  return v5 == 1;
}

- (BOOL)replaceExistingContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[MIMCMContainer containerClass](self, "containerClass") == 1)
  {
    +[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 testFlagsAreSet:64])
    {
      BOOL v8 = -[MIMCMContainer isTransient](self, "isTransient");

      if (v8)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          -[MIMCMContainer identifier](self, "identifier");
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
        }

        exit(1);
      }
    }

    else
    {
    }
  }

  [v6 mcmContainer];
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  uint64_t v9 = container_replace();
  if (v9 == 1)
  {
    -[MIMCMContainer setIsTransient:](self, "setIsTransient:", 0LL);
    id v18 = 0LL;
    BOOL v10 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v18);
    id v11 = v18;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  uint64_t v12 = v9;
  uint64_t error_description = container_get_error_description();
  uint64_t v15 = "(container_get_error_description returned NULL)";
  if (error_description) {
    uint64_t v15 = (const char *)error_description;
  }
  _CreateError( (uint64_t)"-[MIMCMContainer replaceExistingContainer:error:]",  390LL,  @"MIContainerManagerErrorDomain",  v12,  0LL,  0LL,  @"%s",  v14,  (uint64_t)v15);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v10 = 0;
  if (a4)
  {
LABEL_15:
    if (!v10) {
      *a4 = v11;
    }
  }

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  id v10 = v8;
  [v10 UTF8String];

  id v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v12 = container_set_info_value();

  if (v12 == 1)
  {
    id v13 = 0LL;
  }

  else
  {
    uint64_t error_description = container_get_error_description();
    BOOL v16 = "(container_get_error_description returned NULL)";
    if (error_description) {
      BOOL v16 = (const char *)error_description;
    }
    _CreateError( (uint64_t)"-[MIMCMContainer setInfoValue:forKey:error:]",  420LL,  @"MIContainerManagerErrorDomain",  v12,  0LL,  0LL,  @"%s",  v15,  (uint64_t)v16);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }

  return v12 == 1;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  id v7 = v6;
  [v7 UTF8String];
  container_get_info_value_for_key();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject();
    if (v9)
    {
      id v11 = (void *)v9;
      id v12 = 0LL;
      goto LABEL_11;
    }

    _CreateAndLogError( (uint64_t)"-[MIMCMContainer infoValueForKey:error:]",  446LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to retrieve value for key %@ from the underlying xpc object",  v10,  (uint64_t)v7);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t error_description = container_get_error_description();
    uint64_t v15 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v15 = (const char *)error_description;
    }
    _CreateError( (uint64_t)"-[MIMCMContainer infoValueForKey:error:]",  440LL,  @"MIContainerManagerErrorDomain",  24LL,  0LL,  0LL,  @"%s",  v14,  (uint64_t)v15);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v12 = v16;
  if (a4)
  {
    id v12 = v16;
    id v11 = 0LL;
    *a4 = v12;
  }

  else
  {
    id v11 = 0LL;
  }

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4 = container_recreate_structure();
  if (v4 == 1)
  {
    id v5 = 0LL;
  }

  else
  {
    uint64_t error_description = container_get_error_description();
    id v8 = "(container_get_error_description returned NULL)";
    if (error_description) {
      id v8 = (const char *)error_description;
    }
    _CreateError( (uint64_t)"-[MIMCMContainer recreateDefaultStructureWithError:]",  465LL,  @"MIContainerManagerErrorDomain",  v4,  0LL,  0LL,  @"%s",  v7,  (uint64_t)v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  return v4 == 1;
}

+ (id)_enumeratorWithContainerClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 create:(BOOL)a8 usingBlock:(id)a9
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v43 = a9;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = __Block_byref_object_copy__4;
  v57 = __Block_byref_object_dispose__4;
  id v58 = 0LL;
  if (!container_query_create())
  {
    uint64_t v36 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]",  487LL,  @"MIContainerManagerErrorDomain",  110LL,  0LL,  0LL,  @"Failed to create container query for querying containers for identifier: %@ groupIdentifiers: %@ containerType: %llu",  v14,  (uint64_t)v12);
    uint64_t v37 = (void *)v54[5];
    v54[5] = v36;
LABEL_32:

    goto LABEL_33;
  }

  container_query_operation_set_flags();
  container_query_set_transient();
  container_query_set_class();
  container_query_set_include_other_owners();
  if (v13)
  {
    xpc_object_t v15 = xpc_array_create(0LL, 0LL);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v50 = 0u;
    __int128 v49 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v50;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v16);
          }
          xpc_object_t v20 = xpc_string_create((const char *)[*(id *)(*((void *)&v49 + 1) + 8 * i) UTF8String]);
          xpc_array_append_value(v15, v20);
        }

        uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }

      while (v17);
    }

    container_query_set_group_identifiers();
  }

  if (v12)
  {
    xpc_object_t v21 = xpc_array_create(0LL, 0LL);
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v22 = v12;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t j = 0LL; j != v23; ++j)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v22);
          }
          xpc_object_t v26 = xpc_string_create((const char *)[*(id *)(*((void *)&v45 + 1) + 8 * j) UTF8String]);
          xpc_array_append_value(v21, v26);
        }

        uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v59 count:16];
      }

      while (v23);
    }

    container_query_set_identifiers();
  }

  if (v11)
  {
    [v11 UTF8String];
    container_query_set_persona_unique_string();
  }

  id v44 = v43;
  char iterate_results_sync = container_query_iterate_results_sync();

  if (v54[5]) {
    char v28 = 1;
  }
  else {
    char v28 = iterate_results_sync;
  }
  if ((v28 & 1) == 0 && container_query_get_last_error())
  {
    MICopyUnlocalizedDescriptionForContainerExtendedError();
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t type = container_error_get_type();
    int posix_errno = container_error_get_posix_errno();
    int v32 = posix_errno;
    if (posix_errno)
    {
      v33 = strerror(posix_errno);
      _CreateError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]",  549LL,  (void *)*MEMORY[0x189607688],  v32,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v34,  (uint64_t)v33);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v35 = 0LL;
    }

    _ErrorDict();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = _CreateError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]",  549LL,  @"MIContainerManagerErrorDomain",  type,  v35,  v38,  @"%@",  v39,  (uint64_t)v29);

    uint64_t v37 = (void *)v54[5];
    v54[5] = v40;
    goto LABEL_32;
  }

uint64_t __118__MIMCMContainer__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E26FA4]();
  id v11 = 0LL;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:a2 error:&v11];
  id v6 = v11;
  id v7 = v11;
  if (v5)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      _RawContainerDescription();
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v6);
    uint64_t v8 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)enumerateContainersWithClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 usingBlock:(id)a8
{
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  [(id)objc_opt_class() _enumeratorWithContainerClass:a3 forPersona:v16 isTransient:v10 identifiers:v15 groupIdentifiers:v14 create:0 usingBlock:v13];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_allContainersForIdentifiers:(id)a3 groupIdentifiers:(id)a4 contentClass:(unint64_t)a5 forPersona:(id)a6 transient:(BOOL)a7 create:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  xpc_object_t v26 = __Block_byref_object_copy__4;
  uint64_t v27 = __Block_byref_object_dispose__4;
  id v28 = (id)objc_opt_new();
  uint64_t v17 = (void *)objc_opt_class();
  v22[1] = 3221225472LL;
  v22[2] = __111__MIMCMContainer__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error___block_invoke;
  v22[3] = &unk_189D48B10;
  v22[4] = &v23;
  v22[0] = MEMORY[0x1895F87A8];
  [v17 _enumeratorWithContainerClass:a5 forPersona:v16 isTransient:v10 identifiers:v14 groupIdentifiers:v15 create:v9 usingBlock:v22];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    uint64_t v19 = (void *)v24[5];
    v24[5] = 0LL;

    if (a9) {
      *a9 = v18;
    }
  }

  xpc_object_t v20 = (void *)[(id)v24[5] copy];

  _Block_object_dispose(&v23, 8);
  return v20;
}

uint64_t __111__MIMCMContainer__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  return 1LL;
}

+ (id)_containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 transient:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a5;
  if (!container_query_create())
  {
    uint64_t v16 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  594LL,  @"MIContainerManagerErrorDomain",  110LL,  0LL,  0LL,  @"Failed to create container query for querying containers for identifier %@",  v14,  (uint64_t)v12);
    goto LABEL_9;
  }

  container_query_operation_set_flags();
  container_query_set_class();
  container_query_set_transient();
  container_query_set_include_other_owners();
  xpc_object_t v15 = xpc_string_create((const char *)[v12 UTF8String]);
  if (a4 == 7) {
    container_query_set_group_identifiers();
  }
  else {
    container_query_set_identifiers();
  }

  if (v13)
  {
    [v13 UTF8String];
    container_query_set_persona_unique_string();
  }

  uint64_t single_result = container_query_get_single_result();
  if (!single_result)
  {
    if (container_query_get_last_error())
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      xpc_object_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t type = container_error_get_type();
      int posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        uint64_t v23 = (void *)*MEMORY[0x189607688];
        uint64_t v24 = posix_errno;
        uint64_t v25 = strerror(posix_errno);
        _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  621LL,  v23,  v24,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v26,  (uint64_t)v25);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      _ErrorDict();
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  621LL,  @"MIContainerManagerErrorDomain",  type,  v27,  v28,  @"%@",  v29,  (uint64_t)v20);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }

    if (a7)
    {
      uint64_t v19 = 0LL;
      id v17 = 0LL;
      goto LABEL_23;
    }

    uint64_t error_description = container_get_error_description();
    v33 = "(container_get_error_description returned NULL)";
    if (error_description) {
      v33 = (const char *)error_description;
    }
    uint64_t v16 = _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  623LL,  @"MIContainerManagerErrorDomain",  21LL,  0LL,  0LL,  @"%s",  v32,  (uint64_t)v33);
LABEL_9:
    id v17 = (id)v16;
LABEL_22:
    uint64_t v19 = 0LL;
    goto LABEL_23;
  }

  id v34 = 0LL;
  uint64_t v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:single_result error:&v34];
  id v17 = v34;
LABEL_23:
  if (a8 && !v19) {
    *a8 = v17;
  }
  container_query_free();

  return v19;
}

+ (id)containersForContentClass:(unint64_t)a3 forPersona:(id)a4 fetchTransient:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  [(id)objc_opt_class() _allContainersForIdentifiers:0 groupIdentifiers:0 contentClass:a3 forPersona:v9 transient:v7 create:0 error:a6];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)containersForGroupIdentifier:(id)a3 forPersona:(id)a4 create:(BOOL)a5 fetchTransient:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a5;
  v16[1] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_opt_class();
  v16[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 _allContainersForIdentifiers:0 groupIdentifiers:v13 contentClass:7 forPersona:v10 transient:0 create:v8 error:a7];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)containersForBundleIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 fetchTransient:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v19[1] = *MEMORY[0x1895F89C0];
  id v13 = a5;
  id v14 = a3;
  xpc_object_t v15 = (void *)objc_opt_class();
  v19[0] = v14;
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  [v15 _allContainersForIdentifiers:v16 groupIdentifiers:0 contentClass:a4 forPersona:v13 transient:v9 create:v10 error:a8];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a3;
  [(id)objc_opt_class() _containerForIdentifier:v12 contentClass:a4 forPersona:v11 transient:0 create:v8 error:a7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)transientContainerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a3;
  [(id)objc_opt_class() _containerForIdentifier:v12 contentClass:a4 forPersona:v11 transient:1 create:v8 error:a7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)deleteContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  BOOL v8 = calloc([v6 count], 8uLL);
  if (!v8)
  {
    _CreateAndLogError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  677LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to allocate memory for deleting containers",  v7,  v29);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v9);
        }
        v8[v12 + i] = [*(id *)(*((void *)&v30 + 1) + 8 * i) mcmContainer];
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      v12 += i;
    }

    while (v11);
  }

  if (!container_operation_delete_array())
  {
    if (v34)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t type = container_error_get_type();
      int posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        xpc_object_t v21 = (void *)*MEMORY[0x189607688];
        uint64_t v22 = posix_errno;
        uint64_t v23 = strerror(posix_errno);
        _CreateError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  693LL,  v21,  v22,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v24,  (uint64_t)v23);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      _ErrorDict();
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  693LL,  @"MIContainerManagerErrorDomain",  type,  v25,  v26,  @"%@",  v27,  (uint64_t)v18);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      container_error_free();
      if (a5) {
        goto LABEL_20;
      }
LABEL_17:
      BOOL v17 = 0;
      goto LABEL_21;
    }

    _CreateAndLogError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  696LL,  @"MIContainerManagerErrorDomain",  38LL,  0LL,  0LL,  @"container_operation_delete_array returned NULL but did not set an error",  v15,  v29);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5) {
      goto LABEL_17;
    }
LABEL_20:
    id v16 = v16;
    BOOL v17 = 0;
    *a5 = v16;
    goto LABEL_21;
  }

  container_free_array_of_containers();
  id v16 = 0LL;
  BOOL v17 = 1;
LABEL_21:
  free(v8);

  return v17;
}

+ (id)defaultDirectoriesForContainerType:(unint64_t)a3 error:(id *)a4
{
  id v6 = (void *)container_subdirectories_for_class();
  if (!v6)
  {
    uint64_t error_description = container_get_error_description();
    uint64_t v13 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v13 = (const char *)error_description;
    }
    _CreateError( (uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]",  722LL,  @"MIContainerManagerErrorDomain",  1LL,  0LL,  0LL,  @"%s",  v12,  (uint64_t)v13);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = 0LL;
LABEL_9:
    id v9 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  BOOL v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v8)
  {
    _CreateAndLogError( (uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]",  728LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to retrieve container subdirectories for class %llu",  v7,  a3);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  [MEMORY[0x189604010] setWithArray:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = 0LL;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v9) {
    *a4 = v10;
  }
LABEL_12:
  id v14 = v9;

  return v14;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (container_object_s)mcmContainer
{
  return self->_mcmContainer;
}

- (void).cxx_destruct
{
}

@end