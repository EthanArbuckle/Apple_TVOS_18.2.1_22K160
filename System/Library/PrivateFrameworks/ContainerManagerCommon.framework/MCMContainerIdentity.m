@interface MCMContainerIdentity
+ (id)containerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
+ (id)containerIdentityWithIdentifier:(id)a3 containerConfig:(id)a4 platform:(unsigned int)a5 userIdentityCache:(id)a6 error:(unint64_t *)a7;
+ (id)containerIdentityWithMinimalContainerIdentity:(id)a3 transient:(BOOL)a4;
+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerIdentity:(id)a3;
- (BOOL)transient;
- (MCMContainerIdentity)init;
- (MCMContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMContainerIdentity)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9;
- (MCMContainerIdentity)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (id)containerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingTransient:(BOOL)a3;
- (id)identityByChangingUserIdentity:(id)a3;
- (id)nontransientContainerIdentity;
- (id)plist;
- (id)transientContainerIdentity;
- (unint64_t)hash;
@end

@implementation MCMContainerIdentity

- (MCMContainerIdentity)init
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

- (MCMContainerIdentity)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  v12[1] = *MEMORY[0x1895F89C0];
  v12[0] = 1LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  result = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &v11,  sel_initWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_,  a3,  a4,  a5,  *(void *)&a6,  a8,  v12);
  if (result)
  {
    result->_transient = a7;
  }

  else if (a9)
  {
    *a9 = v12[0];
  }

  return result;
}

- (MCMContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v11 = 1LL;
  BOOL v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  v7 = -[MCMContainerIdentityMinimal initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( &v9,  sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    container_is_transient();
    v7->_transient = v10;
  }

  else if (a6)
  {
    *a6 = v11;
  }

  return v7;
}

- (id)plist
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  v3 = -[MCMContainerIdentityMinimal plist](&v8, sel_plist);
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MCMContainerIdentity transient](self, "transient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"transient"];

  uint64_t v6 = (void *)[v4 copy];
  return v6;
}

- (MCMContainerIdentity)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v19[0] = 1LL;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  BOOL v10 =  -[MCMContainerIdentityMinimal initWithVersion1PlistDictionary:userIdentityCache:error:]( &v18,  sel_initWithVersion1PlistDictionary_userIdentityCache_error_,  v8,  v9,  v19);
  if (!v10)
  {
    v16 = 0LL;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  [v8 objectForKeyedSubscript:@"transient"];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v12 = [v11 BOOLValue];
  }
  else {
    uint64_t v12 = 0LL;
  }
  v13 = -[MCMContainerIdentityMinimal userIdentity](v10, "userIdentity");
  v14 = -[MCMContainerIdentityMinimal identifier](v10, "identifier");
  v15 = -[MCMContainerIdentityMinimal containerConfig](v10, "containerConfig");
  v16 =  -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( v10,  "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v13,  v14,  v15,  -[MCMContainerIdentityMinimal platform](v10, "platform"),  v12,  v9,  v19);

  if (a5)
  {
LABEL_9:
    if (!v16) {
      *a5 = v19[0];
    }
  }

- (id)transientContainerIdentity
{
  v2 = self;
  if (!-[MCMContainerIdentity transient](v2, "transient"))
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    v4 = -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v5 = -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v3 initWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:1 userIdentityCache:v8 error:0];

    v2 = (MCMContainerIdentity *)v9;
  }

  return v2;
}

- (id)nontransientContainerIdentity
{
  v2 = self;
  if (-[MCMContainerIdentity transient](v2, "transient"))
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    v4 = -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v5 = -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v3 initWithUserIdentity:v4 identifier:v5 containerConfig:v6 platform:v7 transient:0 userIdentityCache:v8 error:0];

    v2 = (MCMContainerIdentity *)v9;
  }

  return v2;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  v4 = (_BYTE *)-[MCMContainerIdentity copy](self, "copy");
  v4[48] = a3;
  return v4;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4 = a3;
  v5 = -[MCMContainerIdentityMinimal identifier](self, "identifier");
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[MCMContainerIdentityMinimal platform](self, "platform");
  BOOL v8 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v4,  v5,  v6,  v7,  v8,  v9,  0LL);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)containerIdentity
{
  return self;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__MCMContainerIdentity_description__block_invoke;
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
  v5[2] = __40__MCMContainerIdentity_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  unint64_t v3 = -[MCMContainerIdentityMinimal hash](&v6, sel_hash);
  uint64_t v4 = 15LL;
  if (!self->_transient) {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMContainerIdentity;
  if (-[MCMContainerIdentityMinimal isEqualToContainerIdentity:](&v7, sel_isEqualToContainerIdentity_, v4)) {
    BOOL v5 = self->_transient == v4[48];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMContainerIdentity *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 copyWithZone:a3];
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[MCMContainerIdentityMinimal platform](self, "platform");
  BOOL transient = self->_transient;
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v5 initWithUserIdentity:v6 identifier:v8 containerConfig:v9 platform:v10 transient:transient userIdentityCache:v12 error:0];

  return v13;
}

- (BOOL)transient
{
  return self->_transient;
}

id __40__MCMContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  v16 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = *(void **)(a1 + 32);
  [v5 userIdentity];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 shortDescription];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (a2)
  {
    uint64_t v9 = [v7 redactedDescription];
    [*(id *)(a1 + 32) identifier];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 redactedDescription];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 32) identifier];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (uint64_t)v8;
  }

  [*(id *)(a1 + 32) containerConfig];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 debugDescription];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v16,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, BOOL transient = %d>",
    v17,
    v5,
    v9,
    v10,
    v12,
    [*(id *)(a1 + 32) platform],
    [*(id *)(a1 + 32) transient]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    uint64_t v10 = (void *)v9;
  }

  return v13;
}

id __35__MCMContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  objc_super v7 = v5;
  if (a2)
  {
    [v5 redactedDescription];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v8 = [*(id *)(a1 + 32) containerConfig];
  else {
    uint64_t v9 = "";
  }
  [*(id *)(a1 + 32) userIdentity];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 shortDescription];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  v13 = v11;
  if (a2)
  {
    [v11 redactedDescription];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend( v4,  "stringWithFormat:",  @"<%@(%@%s);%@;pf%d>",
    v7,
    v8,
    v9,
    v13,
    [*(id *)(a1 + 32) platform]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {

    uint64_t v12 = v10;
    uint64_t v10 = (void *)v8;
  }

  else
  {
    objc_super v7 = (void *)v8;
  }

  return v14;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithUserIdentity:v18 identifier:v17 containerConfig:v16 platform:v10 transient:v9 userIdentityCache:v15 error:a9];

  return v19;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = (void *)[objc_alloc((Class)a1) initWithUserIdentity:v17 identifier:v16 containerConfig:v15 platform:v9 transient:0 userIdentityCache:v14 error:a8];

  return v18;
}

+ (id)containerIdentityWithIdentifier:(id)a3 containerConfig:(id)a4 platform:(unsigned int)a5 userIdentityCache:(id)a6 error:(unint64_t *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  unint64_t v20 = 1LL;
  if (![v13 personaAndUserSpecific])
  {
    id v17 = objc_alloc((Class)a1);
    [v14 defaultUserIdentity];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = (void *)[v17 initWithUserIdentity:v18 identifier:v12 containerConfig:v13 platform:v9 transient:0 userIdentityCache:v14 error:&v20];

    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  container_log_handle_for_category();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 2114;
    id v24 = v13;
    _os_log_fault_impl( &dword_188846000,  v15,  OS_LOG_TYPE_FAULT,  "Attempt to create a container identity without a user identity when one is required; identifier = [%{public}@], cl"
      "ass = %{public}@",
      buf,
      0x16u);
  }

  id v16 = 0LL;
  unint64_t v20 = 11LL;
  if (a7)
  {
LABEL_7:
    if (!v16) {
      *a7 = v20;
    }
  }

+ (id)containerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

+ (id)containerIdentityWithMinimalContainerIdentity:(id)a3 transient:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  [v6 userIdentity];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerConfig];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v6 platform];
  [v6 userIdentityCache];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = (void *)[v7 initWithUserIdentity:v8 identifier:v9 containerConfig:v10 platform:v11 transient:v4 userIdentityCache:v12 error:0];
  return v13;
}

@end