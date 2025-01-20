@interface MCMContainer
+ (id)containerWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 error:(id *)a6;
+ (id)containerWithIdentifier:(id)a3 error:(id *)a4;
+ (id)temporaryContainerWithIdentifier:(id)a3 existed:(BOOL *)a4 error:(id *)a5;
+ (int64_t)typeContainerClass;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (BOOL)isTemporary;
- (BOOL)recreateDefaultStructureWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MCMContainer)init;
- (MCMContainer)initWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 temp:(BOOL)a6 error:(id *)a7;
- (MCMContainer)initWithIdentifier:(id)a3 path:(id)a4 uniquePathComponent:(id)a5 uuid:(id)a6 personaUniqueString:(id)a7 uid:(unsigned int)a8 error:(id *)a9;
- (NSDictionary)info;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)url;
- (NSUUID)uuid;
- (container_object_s)getLowLevelContainerObject;
- (container_object_s)thisContainer;
- (id)description;
- (id)destroyContainerWithCompletion:(id)a3;
- (id)infoValueForKey:(id)a3 error:(id *)a4;
- (int64_t)containerClass;
- (unint64_t)diskUsageWithError:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)markDeleted;
@end

@implementation MCMContainer

- (MCMContainer)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl( &dword_1883D9000,  v2,  OS_LOG_TYPE_FAULT,  "You cannot init this class directly. Instead, use convenience constructor containerWithIdentifier:",  v3,  2u);
  }

  abort();
}

- (MCMContainer)initWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 temp:(BOOL)a6 error:(id *)a7
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() typeContainerClass];
  if (!v10)
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)dst = 0;
      _os_log_fault_impl( &dword_1883D9000,  v25,  OS_LOG_TYPE_FAULT,  "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer",  dst,  2u);
    }

    abort();
  }

  int64_t v11 = v10;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCMContainer;
  persona_unique_string = -[MCMContainer init](&v26, sel_init);
  v13 = persona_unique_string;
  if (persona_unique_string)
  {
    id v14 = v9;
    [v14 UTF8String];
    uint64_t v15 = container_create_or_lookup_for_current_user();
    v13->_thisContainer = (container_object_s *)v15;
    if (v15)
    {
      uuid = (const unsigned __int8 *)container_object_get_uuid();
      uuid_copy(dst, uuid);
    }

    else
    {
      uuid_clear(dst);
    }

    if (uuid_is_null(dst))
    {

      [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:11 userInfo:0];
      persona_unique_string = (MCMContainer *)objc_claimAutoreleasedReturnValue();
      v13 = 0LL;
    }

    else
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:dst];
      v19 = v13->_uuid;
      v13->_uuid = (NSUUID *)v18;

      v13->_containerClass = v11;
      uint64_t v20 = [NSString stringWithString:v14];
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v20;

      personaUniqueString = v13->_personaUniqueString;
      v13->_personaUniqueString = 0LL;

      persona_unique_string = (MCMContainer *)container_get_persona_unique_string();
      if (persona_unique_string)
      {
        uint64_t v23 = [NSString stringWithUTF8String:persona_unique_string];
        v24 = v13->_personaUniqueString;
        v13->_personaUniqueString = (NSString *)v23;

        persona_unique_string = 0LL;
      }
    }

    if (a7 && persona_unique_string)
    {
      persona_unique_string = persona_unique_string;
      *a7 = persona_unique_string;
    }
  }

  return v13;
}

- (id)destroyContainerWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void *))a3;
  if (self->_thisContainer
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(), !uuid_is_null(uuid))
    && container_object_get_identifier()
    && (unint64_t)(container_object_get_class() - 1) < 0xE)
  {
    v8 = +[MCMContainerManager defaultManager](&OBJC_CLASS___MCMContainerManager, "defaultManager");
    v10[0] = self;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 deleteContainers:v9 withCompletion:v4];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:11 userInfo:0];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);
  }

  return v6;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 UTF8String];
  id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  uint64_t v10 = container_set_info_value();
  if (v10 == 1)
  {
    id v11 = 0LL;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:v10 userInfo:0];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a5 && v11)
    {
      id v11 = v11;
      *a5 = v11;
    }
  }

  BOOL v12 = v11 == 0LL;

  return v12;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v4 = (void *)container_copy_info_value_for_key();
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return v5;
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
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  BOOL v6 = v5 == 0LL;

  return v6;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v4 = container_regenerate_uuid();
  if (v4 == 1)
  {
    id v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  BOOL v6 = v5 == 0LL;

  return v6;
}

- (NSURL)url
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = container_copy_path();
  uint64_t v6 = v2;
  if (!v2) {
    return (NSURL *)0LL;
  }
  v3 = (void *)v2;
  objc_msgSend( MEMORY[0x189604030],  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v2,  1,  0,  v6,  v7);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(v3);
  memset_s(&v6, 8uLL, 0, 8uLL);
  return (NSURL *)v4;
}

- (NSDictionary)info
{
  uint64_t v2 = (void *)container_copy_info();
  v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return (NSDictionary *)v3;
}

- (BOOL)isTemporary
{
  return 0;
}

- (NSString)identifier
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1LL, self->_uuid) ? (BOOL v4 = v3 > 0xD) : (BOOL v4 = 1), v4))
  {
    id v5 = 0LL;
  }

  else
  {
    id v5 = self->_identifier;
  }

  return v5;
}

- (NSString)personaUniqueString
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1LL, self->_uuid) ? (BOOL v4 = v3 > 0xD) : (BOOL v4 = 1), v4))
  {
    id v5 = 0LL;
  }

  else
  {
    id v5 = self->_personaUniqueString;
  }

  return v5;
}

- (NSUUID)uuid
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((unint64_t v3 = gMCMContainerClassToContainerClass[containerClass] - 1LL, (uuid = self->_uuid) != 0LL)
      ? (BOOL v5 = v3 > 0xD)
      : (BOOL v5 = 1),
        v5))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = uuid;
  }

  return v6;
}

- (int64_t)containerClass
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14) {
    return 0LL;
  }
  else {
    return self->_containerClass;
  }
}

- (unint64_t)diskUsageWithError:(id *)a3
{
  unint64_t v4 = container_disk_usage();
  if (a3) {
    *a3 = 0LL;
  }

  return v4;
}

- (BOOL)isEqualToContainer:(id)a3
{
  unint64_t v4 = a3;
  if (-[MCMContainer _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_uuid, v4[2])
    && -[MCMContainer _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_personaUniqueString, v4[3]))
  {
    uint64_t v5 = container_class_normalized();
    BOOL v6 = v5 == container_class_normalized();
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MCMContainer *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMContainer isEqualToContainer:](self, "isEqualToContainer:", v4);
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSUUID hash](self->_uuid, "hash");
  uint64_t v4 = container_class_normalized();
  return v4 ^ v3 ^ -[NSString hash](self->_personaUniqueString, "hash");
}

- (id)description
{
  int64_t containerClass = self->_containerClass;
  BOOL v4 = containerClass <= 14 && (unint64_t)(gMCMContainerClassToContainerClass[containerClass] - 1LL) < 0xE;
  uuid = self->_uuid;
  BOOL v6 = (void *)NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = (void *)v8;
  if (uuid && v4)
  {
    int64_t v10 = self->_containerClass;
    identifier = self->_identifier;
    BOOL v12 = self->_uuid;
    v13 = -[MCMContainer url](self, "url");
    BOOL v14 = -[MCMContainer isTemporary](self, "isTemporary");
    -[MCMContainer info](self, "info");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCMContainer personaUniqueString](self, "personaUniqueString");
    [v6 stringWithFormat:@"<%@ (%ld) ID: %@ UUID: %@ URL: %@ isTemp: %d info: %@ persona: %@>", v9, v10, identifier, v12, v13, v14, v15, v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v6 stringWithFormat:@"<%@: deleted container>", v8];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = [a3 isEqual:a4];
  }
  return result;
}

- (void).cxx_destruct
{
}

+ (id)containerWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)[a1 containerWithIdentifier:a3 createIfNecessary:0 existed:0 error:a4];
}

+ (id)containerWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 createIfNecessary:v8 existed:a5 temp:0 error:a6];

  return v11;
}

+ (id)temporaryContainerWithIdentifier:(id)a3 existed:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 createIfNecessary:1 existed:a4 temp:1 error:a5];

  return v9;
}

+ (int64_t)typeContainerClass
{
  return 0LL;
}

- (container_object_s)thisContainer
{
  return self->_thisContainer;
}

  ;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  MEMORY[0x1895C42F0](self->_thisContainer, a2);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMContainer;
  -[MCMContainer dealloc](&v3, sel_dealloc);
}

- (MCMContainer)initWithIdentifier:(id)a3 path:(id)a4 uniquePathComponent:(id)a5 uuid:(id)a6 personaUniqueString:(id)a7 uid:(unsigned int)a8 error:(id *)a9
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = [(id)objc_opt_class() typeContainerClass];
  if (!v20)
  {
    container_log_handle_for_category();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1883D9000,  v28,  OS_LOG_TYPE_FAULT,  "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer",  buf,  2u);
    }

    abort();
  }

  uint64_t v21 = v20;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MCMContainer;
  v22 = -[MCMContainer init](&v30, sel_init);
  uint64_t v23 = v22;
  if (!v22)
  {
    id v25 = 0LL;
    goto LABEL_17;
  }

  if (v21 > 14 || !v15 || !v18 || (unint64_t)(gMCMContainerClassToContainerClass[v21] - 1LL) >= 0xE)
  {
    container_log_handle_for_category();
    objc_super v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v15;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2048;
      uint64_t v36 = v21;
      _os_log_fault_impl( &dword_1883D9000,  v26,  OS_LOG_TYPE_FAULT,  "Bad initializers: id: %@, UUID: %@, Class: %ld",  buf,  0x20u);
    }

    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:31 userInfo:0];
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }

  objc_storeStrong((id *)&v22->_identifier, a3);
  objc_storeStrong((id *)&v23->_uuid, a6);
  v23->_int64_t containerClass = v21;
  objc_storeStrong((id *)&v23->_personaUniqueString, a7);
  [v18 getUUIDBytes:buf];
  -[NSString UTF8String](v23->_identifier, "UTF8String");
  [v16 fileSystemRepresentation];
  [v17 UTF8String];
  -[NSString UTF8String](v23->_personaUniqueString, "UTF8String");
  LOWORD(v29) = 0;
  uint64_t v24 = container_object_create();
  v23->_thisContainer = (container_object_s *)v24;
  if (!v24)
  {

    objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"MCMErrorDomain",  11,  0,  0,  v29,  0,  0,  0);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    uint64_t v23 = 0LL;
    goto LABEL_13;
  }

  id v25 = 0LL;
LABEL_13:
  if (a9 && v25)
  {
    id v25 = v25;
    *a9 = v25;
  }

- (void)markDeleted
{
  identifier = self->_identifier;
  self->_identifier = 0LL;

  uuid = self->_uuid;
  self->_uuid = 0LL;

  self->_int64_t containerClass = 0LL;
  container_object_set_class();
}

- (container_object_s)getLowLevelContainerObject
{
  return self->_thisContainer;
}

@end