@interface MCMConcreteContainerIdentity
+ (id)concreteContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10;
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConcreteContainerIdentity:(id)a3;
- (MCMConcreteContainerIdentity)init;
- (MCMConcreteContainerIdentity)initWithContainerIdentity:(id)a3 UUID:(id)a4 error:(unint64_t *)a5;
- (MCMConcreteContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMConcreteContainerIdentity)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMConcreteContainerIdentity)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10;
- (MCMConcreteContainerIdentity)initWithVersion1PlistDictionary:(id)a3 containerIdentity:(id)a4 error:(unint64_t *)a5;
- (NSUUID)uuid;
- (container_object_s)createLibsystemContainerWithContainerPathIdentifier:(id)a3 existed:(BOOL)a4 error:(unint64_t *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)plist;
- (unint64_t)hash;
@end

@implementation MCMConcreteContainerIdentity

- (MCMConcreteContainerIdentity)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_188846000, v3, OS_LOG_TYPE_ERROR, "You cannot init this class directly.", v5, 2u);
  }

  return 0LL;
}

- (MCMConcreteContainerIdentity)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a7;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  unint64_t v25 = 1LL;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  v17 = -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &v24,  sel_initWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_,  a4,  a5,  a6,  v11,  v10,  a9,  &v25);
  if (!v17)
  {
LABEL_9:
    v18 = 0LL;
    if (a10) {
      *a10 = v25;
    }
    goto LABEL_11;
  }

  v18 = v17;
  objc_opt_class();
  id v19 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v20 = (NSUUID *)v19;
  }
  else {
    v20 = 0LL;
  }

  uuid = v18->_uuid;
  v18->_uuid = v20;

  if (!v18->_uuid)
  {
    container_log_handle_for_category();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v19;
      _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, "Invalid object: uuid = [%@]", buf, 0xCu);
    }

    unint64_t v25 = 11LL;
    goto LABEL_9;
  }

- (MCMConcreteContainerIdentity)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v16[0] = 1LL;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  v9 =  -[MCMContainerIdentityMinimal initWithPlist:userIdentityCache:error:]( &v15,  sel_initWithPlist_userIdentityCache_error_,  v8,  a4,  v16);
  if (v9)
  {
    id v10 = v8;
    [v10 objectForKeyedSubscript:@"version"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEqual:@"1"];

    if (v12)
    {
      v13 = -[MCMConcreteContainerIdentity initWithVersion1PlistDictionary:containerIdentity:error:]( v9,  "initWithVersion1PlistDictionary:containerIdentity:error:",  v10,  v9,  a5);
    }

    else
    {

      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (MCMConcreteContainerIdentity)initWithContainerIdentity:(id)a3 UUID:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  [v9 userIdentity];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identifier];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 containerConfig];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v9 platform];
  uint64_t v14 = [v9 transient];
  [v9 userIdentityCache];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();

  id v16 = -[MCMConcreteContainerIdentity initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( self,  "initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v8,  v10,  v11,  v12,  v13,  v14,  v15,  a5);
  return v16;
}

- (MCMConcreteContainerIdentity)initWithVersion1PlistDictionary:(id)a3 containerIdentity:(id)a4 error:(unint64_t *)a5
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  unint64_t v17 = 1LL;
  [v8 objectForKeyedSubscript:@"UUID"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v10];
      if (v11)
      {
        int v12 = (void *)v11;
        uint64_t v13 =  -[MCMConcreteContainerIdentity initWithContainerIdentity:UUID:error:]( self,  "initWithContainerIdentity:UUID:error:",  v9,  v11,  &v17);
        self = v13;
        if (!a5) {
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }

  unint64_t v17 = 116LL;
  container_log_handle_for_category();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = @"UUID";
    __int16 v20 = 2112;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v8;
    id v16 = v21;
    _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Invalid container identity plist data. Expected UUID string for %@, got %@. Data: %@",  buf,  0x20u);
  }

  int v12 = 0LL;
  uint64_t v13 = 0LL;
  if (a5)
  {
LABEL_9:
    if (!v13) {
      *a5 = v17;
    }
  }

- (MCMConcreteContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unint64_t v12 = 1LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  v7 = -[MCMContainerIdentity initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( &v11,  sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:container_object_get_uuid()];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;
  }

  else if (a6)
  {
    *a6 = v12;
  }

  return v7;
}

- (id)plist
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  v3 = -[MCMContainerIdentity plist](&v9, sel_plist);
  v4 = (void *)[v3 mutableCopy];
  v5 = -[MCMConcreteContainerIdentity uuid](self, "uuid");
  [v5 UUIDString];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"UUID"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (container_object_s)createLibsystemContainerWithContainerPathIdentifier:(id)a3 existed:(BOOL)a4 error:(unint64_t *)a5
{
  v17[2] = *MEMORY[0x1895F89C0];
  v17[0] = 0LL;
  v17[1] = 0LL;
  id v6 = a3;
  v7 = -[MCMConcreteContainerIdentity uuid](self, "uuid");
  [v7 getUUIDBytes:v17];

  id v16 = -[MCMContainerIdentityMinimal identifier](self, "identifier");
  [v16 UTF8String];
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerClass];
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 posixUser];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 UID];
  id v11 = v6;
  [v11 UTF8String];

  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 personaUniqueString];
  [v13 UTF8String];
  -[MCMContainerIdentity transient](self, "transient");
  uint64_t v14 = (container_object_s *)container_object_create();

  return v14;
}

- (id)containerIdentity
{
  v3 = objc_alloc(&OBJC_CLASS___MCMContainerIdentity);
  v4 = -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v5 = -[MCMContainerIdentityMinimal identifier](self, "identifier");
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[MCMContainerIdentityMinimal platform](self, "platform");
  BOOL v8 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( v3,  "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v4,  v5,  v6,  v7,  v8,  v9,  0LL);

  return v10;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __43__MCMConcreteContainerIdentity_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)debugDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __48__MCMConcreteContainerIdentity_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  unint64_t v3 = -[MCMContainerIdentity hash](&v5, sel_hash);
  return -[NSUUID hash](self->_uuid, "hash") ^ v3;
}

- (BOOL)isEqualToConcreteContainerIdentity:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v4 = a3;
  if (-[NSUUID isEqual:](self->_uuid, "isEqual:", v4[7]))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
    BOOL v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](&v7, sel_isEqualToContainerIdentity_, v4);
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMConcreteContainerIdentity *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v5 = -[MCMConcreteContainerIdentity isEqualToConcreteContainerIdentity:]( self,  "isEqualToConcreteContainerIdentity:",  v4);
LABEL_5:
    BOOL v6 = v5;
    goto LABEL_6;
  }

  BOOL v6 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);
    goto LABEL_5;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentity;
  BOOL v5 = -[MCMContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
    objc_super v7 = (void *)v5[7];
    v5[7] = v6;
  }

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

id __48__MCMConcreteContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  __int16 v20 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void **)(a1 + 32);
  [v6 userIdentity];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 shortDescription];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v9 = v8;
  int v21 = a2;
  __int16 v22 = (void *)v5;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    [*(id *)(a1 + 32) identifier];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 redactedDescription];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 32) identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (uint64_t)v9;
  }

  [*(id *)(a1 + 32) containerConfig];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 debugDescription];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [*(id *)(a1 + 32) platform];
  unsigned int v15 = [*(id *)(a1 + 32) transient];
  [*(id *)(a1 + 32) uuid];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v20,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@>",
    v22,
    v6,
    v10,
    v11,
    v13,
    v14,
    v15,
    v16);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {

    id v11 = (void *)v10;
  }

  return v17;
}

id __43__MCMConcreteContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  id v16 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  if (a2)
  {
    [v4 redactedDescription];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v7 = [*(id *)(a1 + 32) containerConfig];
  else {
    uint64_t v8 = "";
  }
  [*(id *)(a1 + 32) userIdentity];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 shortDescription];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  unint64_t v12 = v10;
  if (a2)
  {
    [v10 redactedDescription];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) uuid];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v16,  "stringWithFormat:",  @"<%@(%@%s);%@;u%@;pf%d>",
    v6,
    v7,
    v8,
    v12,
    v13,
    [*(id *)(a1 + 32) platform]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    id v11 = v9;
    objc_super v9 = (void *)v7;
  }

  else
  {
    uint64_t v6 = (void *)v7;
  }

  return v14;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a7;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  __int16 v22 = (void *)[objc_alloc((Class)a1) initWithUUID:v21 userIdentity:v20 identifier:v19 containerConfig:v18 platform:v11 transient:v10 userIdentityCache:v17 error:a10];

  return v22;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  uint64_t v9 = *(void *)&a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) initWithUUID:v19 userIdentity:v18 identifier:v17 containerConfig:v16 platform:v9 transient:0 userIdentityCache:v15 error:a9];

  return v20;
}

+ (id)concreteContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

@end