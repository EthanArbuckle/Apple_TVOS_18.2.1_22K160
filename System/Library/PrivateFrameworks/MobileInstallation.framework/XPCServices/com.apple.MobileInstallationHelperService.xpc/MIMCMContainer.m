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
  BOOL v28 = 0;
  self->_containerClass = container_get_class(a3, a2);
  uint64_t identifier = container_get_identifier(a3);
  if (!identifier)
  {
    id v18 = _CreateAndLogError( (uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]",  121LL,  MIContainerManagerErrorDomain,  18LL,  0LL,  0LL,  @"Failed to get identifier for the container",  v8,  v26);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_8;
  }

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", identifier));
  v10 = self->_identifier;
  self->_uint64_t identifier = v9;

  self->_mcmContainer = (container_object_s *)container_copy_object(a3);
  uint64_t persona_unique_string = container_get_persona_unique_string(a3);
  if (persona_unique_string)
  {
    v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  persona_unique_string));
    personaUniqueString = self->_personaUniqueString;
    self->_personaUniqueString = v12;
  }

  id v27 = 0LL;
  unsigned int v14 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v27);
  id v15 = v27;
  if (!v14)
  {
LABEL_8:
    if (!a4)
    {
LABEL_13:
      BOOL v17 = 0;
      goto LABEL_14;
    }

- (MIMCMContainer)initWithContainer:(container_object_s *)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  v6 = -[MIMCMContainer init](&v10, "init");
  v7 = v6;
  if (v6 && !-[MIMCMContainer _doInitWithContainer:error:](v6, "_doInitWithContainer:error:", a3, a4)) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

- (MIMCMContainer)initWithSerializedContainer:(id)a3 matchingWithOptions:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  uint64_t last_error = 0LL;
  objc_super v10 = -[MIMCMContainer init](&v56, "init");
  if (!v10)
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    unsigned __int8 v16 = 0;
    id v17 = 0LL;
    goto LABEL_24;
  }

  id v11 = v8;
  uint64_t v12 = container_serialize_copy_deserialized_reference( [v11 bytes],  objc_msgSend(v11, "length"),  &last_error);
  if (!v12)
  {
    if (last_error)
    {
      id v18 = MICopyUnlocalizedDescriptionForContainerExtendedError();
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)MIContainerManagerErrorDomain;
      uint64_t type = container_error_get_type(last_error);
      int posix_errno = container_error_get_posix_errno(last_error);
      if (posix_errno)
      {
        uint64_t v23 = posix_errno;
        uint64_t v24 = strerror(posix_errno);
        id Error = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  187LL,  NSPOSIXErrorDomain,  v23,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v25,  (uint64_t)v24);
        id v27 = (void *)objc_claimAutoreleasedReturnValue(Error);
      }

      else
      {
        id v27 = 0LL;
      }

      id v42 = sub_1000040DC();
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      id v45 = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  187LL,  v20,  type,  v27,  v43,  @"%@",  v44,  (uint64_t)v19);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v45);

      container_error_free(last_error);
    }

    else
    {
      uint64_t error_description = container_get_error_description(21LL);
      v40 = "(container_get_error_description returned NULL)";
      if (error_description) {
        v40 = (const char *)error_description;
      }
      id v41 = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  190LL,  MIContainerManagerErrorDomain,  21LL,  0LL,  0LL,  @"%s",  v39,  (uint64_t)v40);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v41);
    }

    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    goto LABEL_23;
  }

  uint64_t v13 = v12;
  uint64_t v14 = container_query_create_from_container();
  container_query_operation_set_flags(v14, a4 | 0x300000002LL);
  uint64_t single_result = container_query_get_single_result(v14);
  if (!single_result)
  {
    uint64_t last_error = container_query_get_last_error(v14);
    if (last_error)
    {
      BOOL v28 = MICopyUnlocalizedDescriptionForContainerExtendedError();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)MIContainerManagerErrorDomain;
      uint64_t v31 = container_error_get_type(last_error);
      int v32 = container_error_get_posix_errno(last_error);
      if (v32)
      {
        uint64_t v33 = v32;
        v34 = strerror(v32);
        id v36 = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  204LL,  NSPOSIXErrorDomain,  v33,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v35,  (uint64_t)v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      }

      else
      {
        v37 = 0LL;
      }

      id v50 = sub_1000040DC();
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      id v53 = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  204LL,  v30,  v31,  v37,  v51,  @"%@",  v52,  (uint64_t)v29);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v53);
    }

    else
    {
      uint64_t v46 = container_get_error_description(21LL);
      v48 = "(container_get_error_description returned NULL)";
      if (v46) {
        v48 = (const char *)v46;
      }
      id v49 = _CreateError( (uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]",  206LL,  MIContainerManagerErrorDomain,  21LL,  0LL,  0LL,  @"%s",  v47,  (uint64_t)v48);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v49);
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIMCMContainer;
  -[MIMCMContainer dealloc](&v3, "dealloc");
}

- (id)serializedContainerRepresentation
{
  uint64_t v4 = 0LL;
  uint64_t v2 = container_serialize_copy_serialized_reference(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v4);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v2,  v4,  1LL));
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  uint64_t v4 = sub_1000042D0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer personaUniqueString](self, "personaUniqueString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer containerURL](self, "containerURL"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ container=%@ persona=%@ path=%@>",  v3,  v5,  v6,  v8));

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
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
      v7 = -[MIMCMContainer mcmContainer](v5, "mcmContainer");

      char is_equal = container_is_equal(v6, v7);
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
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  path,  1LL,  0LL));
    v7 = 0LL;
    id v8 = 0LL;
    if (v6) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v9 = (void *)MIInstallerErrorDomain;
    objc_super v10 = sub_1000042D0();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v13 = _CreateAndLogError( (uint64_t)"_ContainerURL",  87LL,  v9,  4LL,  0LL,  0LL,  @"Failed to fetch container URL from %@",  v12,  (uint64_t)v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  id v8 = v7;

  v6 = 0LL;
LABEL_6:
  id v14 = v8;
  containerURL = self->_containerURL;
  self->_containerURL = v6;

  if (self->_containerURL)
  {
    BOOL v25 = 0;
    uint64_t is_transient = container_is_transient(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v25);
    if (is_transient == 1)
    {
      self->_isTransient = v25;
      BOOL v17 = 1;
      goto LABEL_15;
    }

    uint64_t v18 = is_transient;
    uint64_t error_description = container_get_error_description(is_transient);
    uint64_t v21 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v21 = (const char *)error_description;
    }
    id Error = _CreateError( (uint64_t)"-[MIMCMContainer _refreshContainerMetadataWithError:]",  277LL,  MIContainerManagerErrorDomain,  v18,  0LL,  0LL,  @"%s",  v20,  (uint64_t)v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(Error);

    id v14 = (id)v23;
  }

  if (a3)
  {
    id v14 = v14;
    BOOL v17 = 0;
    *a3 = v14;
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)reclaimDiskSpaceWithError:(id *)a3
{
  uint64_t v4 = container_operation_delete_reclaim_disk_space(self, a2);
  if (v4)
  {
    v5 = MICopyUnlocalizedDescriptionForContainerExtendedError();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)MIContainerManagerErrorDomain;
    uint64_t type = container_error_get_type(v4);
    int posix_errno = container_error_get_posix_errno(v4);
    if (posix_errno)
    {
      uint64_t v10 = posix_errno;
      id v11 = strerror(posix_errno);
      id Error = _CreateError( (uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]",  298LL,  NSPOSIXErrorDomain,  v10,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v12,  (uint64_t)v11);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(Error);
    }

    else
    {
      id v14 = 0LL;
    }

    id v16 = sub_1000040DC();
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v19 = _CreateError( (uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]",  298LL,  v7,  type,  v14,  v17,  @"%@",  v18,  (uint64_t)v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v19);

    container_error_free(v4);
    if (a3)
    {
      id v15 = v15;
      *a3 = v15;
    }
  }

  else
  {
    container_error_free(0LL);
    id v15 = 0LL;
  }

  return v4 == 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v5 = container_regenerate_uuid(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  if (v5 == 1)
  {
    id v14 = 0LL;
    BOOL v6 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v14);
    id v7 = v14;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  uint64_t v8 = v5;
  uint64_t error_description = container_get_error_description(v5);
  id v11 = "(container_get_error_description returned NULL)";
  if (error_description) {
    id v11 = (const char *)error_description;
  }
  id Error = _CreateError( (uint64_t)"-[MIMCMContainer regenerateDirectoryUUIDWithError:]",  321LL,  MIContainerManagerErrorDomain,  v8,  0LL,  0LL,  @"%s",  v10,  (uint64_t)v11);
  id v7 = (id)objc_claimAutoreleasedReturnValue(Error);
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
  uint64_t v12 = 1LL;
  unint64_t v3 = container_disk_usage(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v12);
  if (v12 != 1)
  {
    uint64_t v4 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
      -[MIMCMContainer containerClass](self, "containerClass");
      uint64_t error_description = container_get_error_description(v12);
      uint64_t v8 = "(container_get_error_description returned NULL)";
      if (error_description) {
        uint64_t v8 = (const char *)error_description;
      }
      id Error = _CreateError( (uint64_t)"-[MIMCMContainer diskUsage]",  347LL,  MIContainerManagerErrorDomain,  v12,  0LL,  0LL,  @"%s",  v7,  (uint64_t)v8);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(Error);
      MOLogWrite(v4);
    }
  }

  return v3;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  uint64_t v5 = container_delete_all_container_content(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  if (v5 == 1)
  {
    id v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)MIContainerManagerErrorDomain;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
    id v10 = _CreateAndLogError( (uint64_t)"-[MIMCMContainer purgeContentWithError:]",  361LL,  v7,  v5,  0LL,  0LL,  @"Failed to wipe container for identifier %@",  v9,  (uint64_t)v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v10);

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
  if ((id)-[MIMCMContainer containerClass](self, "containerClass") == (id)1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    if ([v7 testFlagsAreSet:64])
    {
      unsigned int v8 = -[MIMCMContainer isTransient](self, "isTransient");

      if (v8)
      {
        uint64_t v9 = gLogHandle;
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
          MOLogWrite(v9);
        }

        exit(1);
      }
    }

    else
    {
    }
  }

  uint64_t v10 = container_replace([v6 mcmContainer], -[MIMCMContainer mcmContainer](self, "mcmContainer"), 0);
  if (v10 == 1)
  {
    -[MIMCMContainer setIsTransient:](self, "setIsTransient:", 0LL);
    id v20 = 0LL;
    BOOL v11 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v20);
    id v12 = v20;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  uint64_t v13 = v10;
  uint64_t error_description = container_get_error_description(v10);
  id v16 = "(container_get_error_description returned NULL)";
  if (error_description) {
    id v16 = (const char *)error_description;
  }
  id Error = _CreateError( (uint64_t)"-[MIMCMContainer replaceExistingContainer:error:]",  390LL,  MIContainerManagerErrorDomain,  v13,  0LL,  0LL,  @"%s",  v15,  (uint64_t)v16);
  id v12 = (id)objc_claimAutoreleasedReturnValue(Error);
  BOOL v11 = 0;
  if (a4)
  {
LABEL_15:
    if (!v11) {
      *a4 = v12;
    }
  }

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
  id v11 = v8;
  id v12 = [v11 UTF8String];

  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
  uint64_t v14 = container_set_info_value(v10, v12, v13);

  if (v14 == 1)
  {
    id v15 = 0LL;
  }

  else
  {
    uint64_t error_description = container_get_error_description(v14);
    uint64_t v18 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v18 = (const char *)error_description;
    }
    id Error = _CreateError( (uint64_t)"-[MIMCMContainer setInfoValue:forKey:error:]",  420LL,  MIContainerManagerErrorDomain,  v14,  0LL,  0LL,  @"%s",  v17,  (uint64_t)v18);
    id v15 = (id)objc_claimAutoreleasedReturnValue(Error);
    if (a5)
    {
      id v15 = v15;
      *a5 = v15;
    }
  }

  return v14 == 1;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
  id v8 = v6;
  uint64_t info_value_for_key = container_get_info_value_for_key(v7, [v8 UTF8String]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(info_value_for_key);
  id v11 = (void *)v10;
  if (v10)
  {
    uint64_t v12 = _CFXPCCreateCFObjectFromXPCObject(v10);
    if (v12)
    {
      uint64_t v14 = (void *)v12;
      id v15 = 0LL;
      goto LABEL_11;
    }

    id v21 = _CreateAndLogError( (uint64_t)"-[MIMCMContainer infoValueForKey:error:]",  446LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to retrieve value for key %@ from the underlying xpc object",  v13,  (uint64_t)v8);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  else
  {
    uint64_t error_description = container_get_error_description(24LL);
    uint64_t v18 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v18 = (const char *)error_description;
    }
    id Error = _CreateError( (uint64_t)"-[MIMCMContainer infoValueForKey:error:]",  440LL,  MIContainerManagerErrorDomain,  24LL,  0LL,  0LL,  @"%s",  v17,  (uint64_t)v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(Error);
  }

  id v15 = v20;
  if (a4)
  {
    id v15 = v20;
    uint64_t v14 = 0LL;
    *a4 = v15;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4 = container_recreate_structure(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  uint64_t v5 = v4;
  if (v4 == 1)
  {
    id v6 = 0LL;
  }

  else
  {
    uint64_t error_description = container_get_error_description(v4);
    id v9 = "(container_get_error_description returned NULL)";
    if (error_description) {
      id v9 = (const char *)error_description;
    }
    id Error = _CreateError( (uint64_t)"-[MIMCMContainer recreateDefaultStructureWithError:]",  465LL,  MIContainerManagerErrorDomain,  v5,  0LL,  0LL,  @"%s",  v8,  (uint64_t)v9);
    id v6 = (id)objc_claimAutoreleasedReturnValue(Error);
    if (a3)
    {
      id v6 = v6;
      *a3 = v6;
    }
  }

  return v5 == 1;
}

+ (id)_enumeratorWithContainerClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 create:(BOOL)a8 usingBlock:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v56 = a9;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3032000000LL;
  v72 = sub_100005350;
  v73 = sub_100005360;
  id v74 = 0LL;
  uint64_t v17 = container_query_create();
  uint64_t v19 = v17;
  if (!v17)
  {
    id v45 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers: create:usingBlock:]",  487LL,  MIContainerManagerErrorDomain,  110LL,  0LL,  0LL,  @"Failed to create container query for querying containers for identifier: %@ groupIdentifiers: %@ containerType: %llu",  v18,  (uint64_t)v15);
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    uint64_t v47 = (void *)v70[5];
    v70[5] = v46;
LABEL_35:

    goto LABEL_36;
  }

  if (v9) {
    uint64_t v20 = 0x300000001LL;
  }
  else {
    uint64_t v20 = 0x300000000LL;
  }
  container_query_operation_set_flags(v17, v20);
  container_query_set_transient(v19, v12);
  container_query_set_class(v19, a3);
  container_query_set_include_other_owners(v19, 1LL);
  if (v16)
  {
    xpc_object_t v21 = xpc_array_create(0LL, 0LL);
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v66 = 0u;
    __int128 v65 = 0u;
    id v22 = v16;
    id v23 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v66;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(v22);
          }
          xpc_object_t v26 = xpc_string_create((const char *)[*(id *)(*((void *)&v65 + 1) + 8 * (void)i) UTF8String]);
          xpc_array_append_value(v21, v26);
        }

        id v23 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
      }

      while (v23);
    }

    container_query_set_group_identifiers(v19, v21);
  }

  if (v15)
  {
    xpc_object_t v27 = xpc_array_create(0LL, 0LL);
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v28 = v15;
    id v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v62;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v62 != v30) {
            objc_enumerationMutation(v28);
          }
          xpc_object_t v32 = xpc_string_create((const char *)[*(id *)(*((void *)&v61 + 1) + 8 * (void)j) UTF8String]);
          xpc_array_append_value(v27, v32);
        }

        id v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
      }

      while (v29);
    }

    container_query_set_identifiers(v19, v27);
  }

  if (v14) {
    container_query_set_persona_unique_string(v19, [v14 UTF8String]);
  }
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100005368;
  v57[3] = &unk_10001C878;
  id v60 = a1;
  id v58 = v56;
  v59 = &v69;
  char iterate_results_sync = container_query_iterate_results_sync(v19, v57);

  if (v70[5]) {
    char v34 = 1;
  }
  else {
    char v34 = iterate_results_sync;
  }
  if ((v34 & 1) == 0)
  {
    uint64_t last_error = container_query_get_last_error(v19);
    if (last_error)
    {
      id v36 = MICopyUnlocalizedDescriptionForContainerExtendedError();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      uint64_t type = container_error_get_type(last_error);
      int posix_errno = container_error_get_posix_errno(last_error);
      int v40 = posix_errno;
      if (posix_errno)
      {
        id v41 = strerror(posix_errno);
        id Error = _CreateError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdenti fiers:create:usingBlock:]",  549LL,  NSPOSIXErrorDomain,  v40,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v42,  (uint64_t)v41);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(Error);
      }

      else
      {
        uint64_t v44 = 0LL;
      }

      id v48 = sub_1000040DC();
      id v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      id v51 = _CreateError( (uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifier s:create:usingBlock:]",  549LL,  MIContainerManagerErrorDomain,  type,  v44,  v49,  @"%@",  v50,  (uint64_t)v37);
      uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);

      uint64_t v47 = (void *)v70[5];
      v70[5] = v52;
      goto LABEL_35;
    }
  }

+ (id)enumerateContainersWithClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 usingBlock:(id)a8
{
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = [(id)objc_opt_class(a1) _enumeratorWithContainerClass:a3 forPersona:v17 isTransient:v10 identifiers:v16 groupIdentifiers:v15 create:0 usingBlock:v14];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  return v19;
}

+ (id)_allContainersForIdentifiers:(id)a3 groupIdentifiers:(id)a4 contentClass:(unint64_t)a5 forPersona:(id)a6 transient:(BOOL)a7 create:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v24 = 0LL;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  xpc_object_t v27 = sub_100005350;
  id v28 = sub_100005360;
  id v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v23[1] = 3221225472LL;
  v23[2] = sub_1000056A8;
  v23[3] = &unk_10001C8A0;
  v23[4] = &v24;
  v23[0] = _NSConcreteStackBlock;
  id v18 = [(id)objc_opt_class(a1) _enumeratorWithContainerClass:a5 forPersona:v17 isTransient:v10 identifiers:v15 groupIdentifiers:v16 create:v9 usingBlock:v23];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    uint64_t v20 = (void *)v25[5];
    v25[5] = 0LL;

    if (a9) {
      *a9 = v19;
    }
  }

  id v21 = [(id)v25[5] copy];

  _Block_object_dispose(&v24, 8);
  return v21;
}

+ (id)_containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 transient:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a5;
  id v18 = v15;
  if (!v15)
  {
    id v15 = (id)gLogHandle;
    if (gLogHandle)
    {
    }
  }

  uint64_t v19 = container_query_create(v15, v16, v17);
  uint64_t v21 = v19;
  if (!v19)
  {
    id v24 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  594LL,  MIContainerManagerErrorDomain,  110LL,  0LL,  0LL,  @"Failed to create container query for querying containers for identifier %@",  v20,  (uint64_t)v14);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_12;
  }

  if (v9) {
    uint64_t v22 = 0x300000001LL;
  }
  else {
    uint64_t v22 = 0x300000000LL;
  }
  container_query_operation_set_flags(v19, v22);
  container_query_set_class(v21, a4);
  container_query_set_transient(v21, v10);
  container_query_set_include_other_owners(v21, 1LL);
  xpc_object_t v23 = xpc_string_create((const char *)[v14 UTF8String]);
  if (a4 == 7) {
    container_query_set_group_identifiers(v21, v23);
  }
  else {
    container_query_set_identifiers(v21, v23);
  }

  if (v18) {
    container_query_set_persona_unique_string(v21, [v18 UTF8String]);
  }
  uint64_t single_result = container_query_get_single_result(v21);
  if (!single_result)
  {
    uint64_t last_error = container_query_get_last_error(v21);
    if (last_error)
    {
      uint64_t v30 = last_error;
      uint64_t v31 = MICopyUnlocalizedDescriptionForContainerExtendedError();
      xpc_object_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v33 = (void *)MIContainerManagerErrorDomain;
      uint64_t type = container_error_get_type(v30);
      int posix_errno = container_error_get_posix_errno(v30);
      if (posix_errno)
      {
        uint64_t v36 = posix_errno;
        v37 = strerror(posix_errno);
        id Error = _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  621LL,  NSPOSIXErrorDomain,  v36,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v38,  (uint64_t)v37);
        int v40 = (void *)objc_claimAutoreleasedReturnValue(Error);
      }

      else
      {
        int v40 = 0LL;
      }

      id v41 = sub_1000040DC();
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      id v44 = _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  621LL,  v33,  type,  v40,  v42,  @"%@",  v43,  (uint64_t)v32);
      id v26 = (id)objc_claimAutoreleasedReturnValue(v44);

      goto LABEL_25;
    }

    if (v9)
    {
      id v28 = 0LL;
      id v26 = 0LL;
      goto LABEL_26;
    }

    uint64_t error_description = container_get_error_description(21LL);
    id v48 = "(container_get_error_description returned NULL)";
    if (error_description) {
      id v48 = (const char *)error_description;
    }
    id v49 = _CreateError( (uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]",  623LL,  MIContainerManagerErrorDomain,  21LL,  0LL,  0LL,  @"%s",  v47,  (uint64_t)v48);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v49);
LABEL_12:
    id v26 = (id)v25;
LABEL_25:
    id v28 = 0LL;
    goto LABEL_26;
  }

  id v50 = 0LL;
  id v28 = [objc_alloc((Class)objc_opt_class(a1)) initWithContainer:single_result error:&v50];
  id v26 = v50;
LABEL_26:
  if (a8 && !v28) {
    *a8 = v26;
  }
  container_query_free(v21);

  return v28;
}

+ (id)containersForContentClass:(unint64_t)a3 forPersona:(id)a4 fetchTransient:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = [(id)objc_opt_class(a1) _allContainersForIdentifiers:0 groupIdentifiers:0 contentClass:a3 forPersona:v10 transient:v7 create:0 error:a6];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

+ (id)containersForGroupIdentifier:(id)a3 forPersona:(id)a4 create:(BOOL)a5 fetchTransient:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)objc_opt_class(a1);
  id v17 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 _allContainersForIdentifiers:0 groupIdentifiers:v14 contentClass:7 forPersona:v11 transient:0 create:v8 error:a7]);
  return v15;
}

+ (id)containersForBundleIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 fetchTransient:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = (void *)objc_opt_class(a1);
  id v20 = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 _allContainersForIdentifiers:v17 groupIdentifiers:0 contentClass:a4 forPersona:v14 transient:v9 create:v10 error:a8]);
  return v18;
}

+ (id)containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(id)objc_opt_class(a1) _containerForIdentifier:v13 contentClass:a4 forPersona:v12 transient:0 create:v8 error:a7];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

+ (id)transientContainerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(id)objc_opt_class(a1) _containerForIdentifier:v13 contentClass:a4 forPersona:v12 transient:1 create:v8 error:a7];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

+ (BOOL)deleteContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  id v8 = [v7 count];
  BOOL v10 = calloc((size_t)v8, 8uLL);
  if (!v10)
  {
    id v21 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  677LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to allocate memory for deleting containers",  v9,  v38);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        v10[v14 + (void)i] = [*(id *)(*((void *)&v39 + 1) + 8 * (void)i) mcmContainer];
      }

      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
      v14 += (uint64_t)i;
    }

    while (v13);
  }

  uint64_t v17 = container_operation_delete_array(v10, v8, v6, &v44, &v43);
  if (!v17)
  {
    if (v43)
    {
      uint64_t v22 = MICopyUnlocalizedDescriptionForContainerExtendedError();
      xpc_object_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = (void *)MIContainerManagerErrorDomain;
      uint64_t type = container_error_get_type(v43);
      int posix_errno = container_error_get_posix_errno(v43);
      if (posix_errno)
      {
        uint64_t v27 = posix_errno;
        id v28 = strerror(posix_errno);
        id Error = _CreateError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  693LL,  NSPOSIXErrorDomain,  v27,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v29,  (uint64_t)v28);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(Error);
      }

      else
      {
        uint64_t v31 = 0LL;
      }

      id v33 = sub_1000040DC();
      char v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      id v36 = _CreateError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  693LL,  v24,  type,  v31,  v34,  @"%@",  v35,  (uint64_t)v23);
      id v19 = (id)objc_claimAutoreleasedReturnValue(v36);

      container_error_free(v43);
      if (a5) {
        goto LABEL_20;
      }
LABEL_17:
      BOOL v20 = 0;
      goto LABEL_21;
    }

    id v32 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]",  696LL,  MIContainerManagerErrorDomain,  38LL,  0LL,  0LL,  @"container_operation_delete_array returned NULL but did not set an error",  v18,  v38);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (!a5) {
      goto LABEL_17;
    }
LABEL_20:
    id v19 = v19;
    BOOL v20 = 0;
    *a5 = v19;
    goto LABEL_21;
  }

  container_free_array_of_containers(v17, v44);
  id v19 = 0LL;
  BOOL v20 = 1;
LABEL_21:
  free(v10);

  return v20;
}

+ (id)defaultDirectoriesForContainerType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v19 = 1LL;
  uint64_t v6 = container_subdirectories_for_class(a3, &v19);
  id v7 = (void *)v6;
  if (!v6)
  {
    uint64_t error_description = container_get_error_description(v19);
    uint64_t v14 = "(container_get_error_description returned NULL)";
    if (error_description) {
      uint64_t v14 = (const char *)error_description;
    }
    id Error = _CreateError( (uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]",  722LL,  MIContainerManagerErrorDomain,  v19,  0LL,  0LL,  @"%s",  v13,  (uint64_t)v14);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(Error);
    uint64_t v9 = 0LL;
LABEL_9:
    BOOL v10 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  uint64_t v9 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
  if (!v9)
  {
    id v16 = _CreateAndLogError( (uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]",  728LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to retrieve container subdirectories for class %llu",  v8,  a3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_9;
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  id v11 = 0LL;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v10) {
    *a4 = v11;
  }
LABEL_12:
  id v17 = v10;

  return v17;
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