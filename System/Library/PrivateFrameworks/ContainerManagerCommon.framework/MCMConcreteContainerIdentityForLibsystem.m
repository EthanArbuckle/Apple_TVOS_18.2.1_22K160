@interface MCMConcreteContainerIdentityForLibsystem
+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12;
- (BOOL)existed;
- (MCMConcreteContainerIdentityForLibsystem)init;
- (MCMConcreteContainerIdentityForLibsystem)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMConcreteContainerIdentityForLibsystem)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12;
- (NSString)containerPathIdentifier;
- (container_object_s)createLibsystemContainerWithError:(unint64_t *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingContainerPathIdentifier:(id)a3;
- (id)identityByChangingIdentifier:(id)a3;
- (id)identityByChangingTransient:(BOOL)a3;
- (id)identityByChangingUUID:(id)a3;
- (id)nontransientConcreteContainerIdentityForLibsystem;
- (id)nontransientContainerIdentity;
- (id)transientConcreteContainerIdentityForLibsystem;
- (id)transientContainerIdentity;
@end

@implementation MCMConcreteContainerIdentityForLibsystem

- (MCMConcreteContainerIdentityForLibsystem)init
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

- (MCMConcreteContainerIdentityForLibsystem)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  unint64_t v15 = 1LL;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem;
  v8 = -[MCMConcreteContainerIdentity initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( &v14,  sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_,  a3,  a4,  a5,  &v15);
  if (!v8)
  {
LABEL_4:
    if (!a6) {
      return v8;
    }
    goto LABEL_5;
  }

  uint64_t v9 = MEMORY[0x1895CDDF0](a3);
  if (v9)
  {
    uint64_t v10 = [NSString stringWithUTF8String:v9];
    containerPathIdentifier = v8->_containerPathIdentifier;
    v8->_containerPathIdentifier = (NSString *)v10;

    v8->_existed = container_is_new() ^ 1;
    goto LABEL_4;
  }

  container_log_handle_for_category();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "container_object_t had a NULL unique path component when creating a concrete container identity",  buf,  2u);
  }

  unint64_t v15 = 11LL;
  v8 = 0LL;
  if (a6)
  {
LABEL_5:
    if (v15 != 1) {
      *a6 = v15;
    }
  }

  return v8;
}

- (MCMConcreteContainerIdentityForLibsystem)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v18 = a8;
  unint64_t v27 = 1LL;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem;
  v19 = -[MCMConcreteContainerIdentity initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &v26,  sel_initWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_,  a3,  a4,  a5,  a6,  v12,  a10,  a11,  &v27);
  if (!v19)
  {
LABEL_9:
    v20 = 0LL;
    if (a12) {
      *a12 = v27;
    }
    goto LABEL_11;
  }

  v20 = v19;
  v19->_existed = a9;
  objc_opt_class();
  id v21 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v22 = (NSString *)v21;
  }
  else {
    v22 = 0LL;
  }

  containerPathIdentifier = v20->_containerPathIdentifier;
  v20->_containerPathIdentifier = v22;

  if (!v20->_containerPathIdentifier)
  {
    container_log_handle_for_category();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v21;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Invalid object: containerPathIdentifier = [%@]",  buf,  0xCu);
    }

    unint64_t v27 = 11LL;
    goto LABEL_9;
  }

- (container_object_s)createLibsystemContainerWithError:(unint64_t *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v5 = -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem;
  uint64_t v6 = -[MCMConcreteContainerIdentity createLibsystemContainerWithContainerPathIdentifier:existed:error:]( &v8,  sel_createLibsystemContainerWithContainerPathIdentifier_existed_error_,  v5,  -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed"),  a3);

  return v6;
}

- (id)transientContainerIdentity
{
  v2 = self;
  if (!-[MCMContainerIdentity transient](v2, "transient"))
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    v4 = -[MCMConcreteContainerIdentity uuid](v2, "uuid");
    v5 = -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    uint64_t v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](v2, "containerPathIdentifier");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[MCMConcreteContainerIdentityForLibsystem existed](v2, "existed");
    v11 = -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    BYTE1(v14) = 1;
    LOBYTE(v14) = v10;
    uint64_t v12 = objc_msgSend( v3,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:user IdentityCache:error:",  v4,  v5,  v6,  v7,  v8,  v9,  v14,  v11,  0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }

  return v2;
}

- (id)nontransientContainerIdentity
{
  v2 = self;
  if (-[MCMContainerIdentity transient](v2, "transient"))
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    v4 = -[MCMConcreteContainerIdentity uuid](v2, "uuid");
    v5 = -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    uint64_t v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](v2, "containerPathIdentifier");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[MCMConcreteContainerIdentityForLibsystem existed](v2, "existed");
    v11 = -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    LOWORD(v14) = v10;
    uint64_t v12 = objc_msgSend( v3,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:user IdentityCache:error:",  v4,  v5,  v6,  v7,  v8,  v9,  v14,  v11,  0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }

  return v2;
}

- (id)transientConcreteContainerIdentityForLibsystem
{
  return -[MCMConcreteContainerIdentityForLibsystem transientContainerIdentity](self, "transientContainerIdentity");
}

- (id)nontransientConcreteContainerIdentityForLibsystem
{
  return -[MCMConcreteContainerIdentityForLibsystem nontransientContainerIdentity]( self,  "nontransientContainerIdentity");
}

- (id)identityByChangingUUID:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  v5 = -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v8 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  BOOL v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend( v16,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transien t:userIdentityCache:error:",  v4,  v5,  v6,  v7,  v8,  v9,  v15,  v12,  0);

  return v13;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  v13 = -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  BYTE1(v16) = a3;
  LOBYTE(v16) = v12;
  uint64_t v14 = (void *)objc_msgSend( v5,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transien t:userIdentityCache:error:",  v6,  v7,  v8,  v9,  v10,  v11,  v16,  v13,  0);

  return v14;
}

- (id)identityByChangingContainerPathIdentifier:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal identifier](self, "identifier");
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[MCMContainerIdentityMinimal platform](self, "platform");
  BOOL v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  BOOL v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend( v16,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transien t:userIdentityCache:error:",  v5,  v6,  v7,  v8,  v9,  v4,  v15,  v12,  0);

  return v13;
}

- (id)identityByChangingIdentifier:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v8 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  BOOL v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend( v16,  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transien t:userIdentityCache:error:",  v5,  v6,  v4,  v7,  v8,  v9,  v15,  v12,  0);

  return v13;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)debugDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem;
  id v5 = -[MCMConcreteContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = -[NSString copyWithZone:](self->_containerPathIdentifier, "copyWithZone:", a3);
    v7 = (void *)v5[9];
    v5[9] = v6;

    *((_BYTE *)v5 + 64) = self->_existed;
  }

  return v5;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (BOOL)existed
{
  return self->_existed;
}

- (void).cxx_destruct
{
}

id __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v20 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void **)(a1 + 32);
  [v6 userIdentity];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 shortDescription];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (uint64_t)v7;
  int v22 = a2;
  v23 = (void *)v5;
  v19 = v7;
  if (a2)
  {
    uint64_t v8 = [v7 redactedDescription];
    [*(id *)(a1 + 32) identifier];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 redactedDescription];
  }

  else
  {
    [*(id *)(a1 + 32) identifier];
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerConfig];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 debugDescription];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [*(id *)(a1 + 32) platform];
  unsigned int v13 = [*(id *)(a1 + 32) transient];
  [*(id *)(a1 + 32) uuid];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerPathIdentifier];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v20,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@, containerPathIdentifier = %@, existed = %d>",
    v23,
    v6,
    v8,
    v9,
    v11,
    v12,
    v13,
    v14,
    v15,
    [*(id *)(a1 + 32) existed]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {

    objc_super v9 = (void *)v8;
  }

  return v16;
}

id __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke(uint64_t a1, int a2)
{
  int v22 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  if (a2)
  {
    [v4 redactedDescription];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) containerConfig];
  int v8 = [*(id *)(a1 + 32) transient];
  objc_super v9 = "T";
  if (!v8) {
    objc_super v9 = "";
  }
  id v21 = v9;
  [*(id *)(a1 + 32) userIdentity];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 shortDescription];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  unsigned int v13 = v11;
  if (a2)
  {
    [v11 redactedDescription];
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) uuid];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerPathIdentifier];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [*(id *)(a1 + 32) platform];
  int v17 = [*(id *)(a1 + 32) existed];
  id v18 = ";E";
  if (!v17) {
    id v18 = "";
  }
  [v22 stringWithFormat:@"<%@(%@%s);%@;u%@;p%@;pf%d%s>", v6, v7, v21, v13, v14, v15, v16, v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    uint64_t v12 = v10;
    uint64_t v10 = (void *)v7;
  }

  else
  {
    uint64_t v6 = (void *)v7;
  }

  return v19;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  id v18 = a11;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOWORD(v26) = __PAIR16__(a10, a9);
  v24 = (void *)objc_msgSend( objc_alloc((Class)a1),  "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transien t:userIdentityCache:error:",  v23,  v22,  v21,  v20,  a7,  v19,  v26,  v18,  a12);

  return v24;
}

@end