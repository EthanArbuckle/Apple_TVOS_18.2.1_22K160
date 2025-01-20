@interface MCMContainerIdentityMinimal
+ (id)minimalContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerIdentity:(id)a3;
- (MCMContainerConfiguration)containerConfig;
- (MCMContainerIdentityMinimal)init;
- (MCMContainerIdentityMinimal)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6;
- (MCMContainerIdentityMinimal)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMContainerIdentityMinimal)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8;
- (MCMContainerIdentityMinimal)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)userIdentity;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)identityByChangingUserIdentity:(id)a3;
- (id)identityBySettingPlatform:(unsigned int)a3;
- (id)minimalIdentity;
- (id)plist;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)disposition;
- (unsigned)platform;
@end

@implementation MCMContainerIdentityMinimal

- (MCMContainerIdentityMinimal)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    v6 = "-[MCMContainerIdentityMinimal init]";
    _os_log_fault_impl( &dword_188846000,  v3,  OS_LOG_TYPE_FAULT,  "%s You cannot init this class directly.",  (uint8_t *)&v5,  0xCu);
  }

  return 0LL;
}

- (MCMContainerIdentityMinimal)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MCMContainerIdentityMinimal;
  v18 = -[MCMContainerIdentityMinimal init](&v32, sel_init);
  if (!v18)
  {
    unint64_t v24 = 1LL;
    goto LABEL_24;
  }

  v19 = v18;
  objc_storeStrong((id *)&v18->_userIdentityCache, a7);
  uint64_t v20 = [v17 userIdentityForContainerConfig:v16 originatorUserIdentity:v14];
  userIdentity = v19->_userIdentity;
  v19->_userIdentity = (MCMUserIdentity *)v20;

  if (v19->_userIdentity)
  {
    if (!v15)
    {
      container_log_handle_for_category();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_188846000, v25, OS_LOG_TYPE_ERROR, "Invalid object: missing identifier", buf, 2u);
      }

      unint64_t v24 = 18LL;
      goto LABEL_23;
    }

    objc_opt_class();
    id v22 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v23 = (NSString *)v22;
    }
    else {
      v23 = 0LL;
    }

    identifier = v19->_identifier;
    v19->_identifier = v23;

    if (v19->_identifier)
    {
      objc_storeStrong((id *)&v19->_containerConfig, a5);
      if (v19->_containerConfig)
      {
        unsigned int v30 = [v16 disposition];
        v19->_platform = a6;
        v19->_disposition = v30;
        goto LABEL_26;
      }

      container_log_handle_for_category();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      id v34 = v16;
      v26 = "Invalid object: container class = %@";
      goto LABEL_20;
    }

    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v22;
      v26 = "Invalid object: identifier = [%@]";
LABEL_20:
      v27 = v25;
      uint32_t v28 = 12;
      goto LABEL_21;
    }
  }

  else
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid object: no user identity";
      v27 = v25;
      uint32_t v28 = 2;
LABEL_21:
      _os_log_error_impl(&dword_188846000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }

- (MCMContainerIdentityMinimal)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  unint64_t v37 = 1LL;
  uint64_t identifier = container_get_identifier();
  if (!identifier)
  {
    container_log_handle_for_category();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v19, OS_LOG_TYPE_ERROR, "Identifier in container_object_t is NULL", buf, 2u);
    }

    id v16 = 0LL;
    uint64_t v20 = 0LL;
    v21 = 0LL;
    v18 = 0LL;
    id v22 = 0LL;
    v23 = 0LL;
    uint64_t v24 = 11LL;
LABEL_9:
    unint64_t v37 = v24;
    if (!a6) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }

  v36 = a6;
  uint64_t v12 = [NSString stringWithUTF8String:identifier];
  uint64_t v13 = container_get_class();
  id v14 = containermanager_copy_global_configuration();
  [v14 staticConfig];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 configForContainerClass:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if ([v16 supportedOnPlatform])
    {
      container_is_transient();
      uint64_t persona_unique_string = container_get_persona_unique_string();
      if (persona_unique_string)
      {
        [NSString stringWithUTF8String:persona_unique_string];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v18 = 0LL;
      }
      v21 = +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", container_get_uid());
      if ([v16 personaAndUserSpecific])
      {
        if (v18)
        {
          [v10 userIdentityForPersonaUniqueString:v18 POSIXUser:v21];
          id v28 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v28 = v9;
        }

        uint64_t v20 = v28;
        id v22 = (void *)v12;
        a6 = v36;
        if (!v28)
        {
          container_log_handle_for_category();
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = (uint64_t)v18;
            _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Cannot reconstitute a user identity from provided persona unique string; personaUniqueString = [%@]",
              buf,
              0xCu);
          }

          uint64_t v20 = 0LL;
          goto LABEL_38;
        }

        char v32 = [v9 isNoSpecificPersona];
        char v33 = [v9 isEqual:v20];
        if ((v32 & 1) == 0 && (v33 & 1) == 0)
        {
          container_log_handle_for_category();
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v39 = (uint64_t)v18;
            __int16 v40 = 1024;
            int v41 = 0;
            __int16 v42 = 1024;
            int v43 = 0;
            _os_log_error_impl( &dword_188846000,  v34,  OS_LOG_TYPE_ERROR,  "Persona unique string is not valid for this client; personaUniqueString = [%@], nonspecific = %d, sameAsClient = %d",
              buf,
              0x18u);
          }

LABEL_38:
          v23 = 0LL;
          uint64_t v24 = 76LL;
          goto LABEL_9;
        }
      }

      else
      {
        uint64_t v20 = 0LL;
        id v22 = (void *)v12;
        a6 = v36;
      }

      uint64_t v29 = [v10 userIdentityForContainerConfig:v16 originatorUserIdentity:v20];

      v23 =  -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( self,  "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v29,  v22,  v16,  0LL,  v10,  &v37);
      uint64_t v20 = (void *)v29;
      self = v23;
      if (!a6) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }

    container_log_handle_for_category();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v13;
      _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Container class in container_object_t (%llu) is unsupported",  buf,  0xCu);
    }

    uint64_t v20 = 0LL;
    v21 = 0LL;
    v18 = 0LL;
    v23 = 0LL;
    uint64_t v26 = 72LL;
  }

  else
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v13;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Container class in container_object_t (%llu) is invalid",  buf,  0xCu);
    }

    id v16 = 0LL;
    uint64_t v20 = 0LL;
    v21 = 0LL;
    v18 = 0LL;
    v23 = 0LL;
    uint64_t v26 = 20LL;
  }

  unint64_t v37 = v26;
  id v22 = (void *)v12;
  a6 = v36;
  if (!v36) {
    goto LABEL_27;
  }
LABEL_25:
  if (!v23) {
    *a6 = v37;
  }
LABEL_27:
  unsigned int v30 = v23;

  return v30;
}

- (id)plist
{
  v12[4] = *MEMORY[0x1895F89C0];
  v12[0] = @"1";
  v11[0] = @"version";
  v11[1] = @"identifier";
  v3 = -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v12[1] = v3;
  v11[2] = @"containerClass";
  v4 = (void *)MEMORY[0x189607968];
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "containerClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = @"userIdentity";
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 plist];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MCMContainerIdentityMinimal)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v10 = v8;
      [v10 objectForKeyedSubscript:@"version"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 isEqual:@"1"];

      if (v12) {
        self = -[MCMContainerIdentityMinimal initWithVersion1PlistDictionary:userIdentityCache:error:]( self,  "initWithVersion1PlistDictionary:userIdentityCache:error:",  v10,  v9,  a5);
      }
    }
  }

  return self;
}

- (MCMContainerIdentityMinimal)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  unint64_t v33 = 1LL;
  [v8 objectForKeyedSubscript:@"identifier"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"containerClass"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"userIdentity"];
  char v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v33 = 116LL;
    container_log_handle_for_category();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = @"identifier";
      __int16 v36 = 2112;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v8;
      id v24 = v37;
      _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Invalid container identity plist data. Expected string for %@, got %@. Data: %@",  buf,  0x20u);
    }

    id v16 = 0LL;
    v18 = 0LL;
    id v12 = 0LL;
LABEL_17:
    v19 = 0LL;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  id v12 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v33 = 116LL;
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = @"containerClass";
      __int16 v36 = 2112;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v8;
      id v28 = v37;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Invalid container identity plist data. Expected number for %@, got %@. Data: %@",  buf,  0x20u);
    }

    id v16 = 0LL;
LABEL_16:
    v18 = 0LL;
    goto LABEL_17;
  }

  v31 = self;
  uint64_t v13 = [v11 unsignedIntegerValue];
  id v14 = containermanager_copy_global_configuration();
  [v14 staticConfig];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v30 = (const __CFString *)v13;
  [v15 configForContainerClass:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    self = v31;
    if ([v16 supportedOnPlatform])
    {
      uint64_t v17 = +[MCMUserIdentity userIdentityWithPlist:cache:error:]( &OBJC_CLASS___MCMUserIdentity,  "userIdentityWithPlist:cache:error:",  v32,  v9,  &v33);
      if (v17)
      {
        v18 = (void *)v17;
        v19 =  -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( v31,  "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v17,  v12,  v16,  0LL,  v9,  &v33);
        self = v19;
        if (!a5) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }

      unint64_t v33 = 116LL;
      container_log_handle_for_category();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v35 = @"userIdentity";
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Invalid container identity plist data. Could not reconstitute user identity from %@. Data: %@",  buf,  0x16u);
      }

      goto LABEL_16;
    }

    container_log_handle_for_category();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v30;
      _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Container class in container_object_t (%llu) is unsupported",  buf,  0xCu);
    }

    v18 = 0LL;
    v19 = 0LL;
    uint64_t v26 = 72LL;
  }

  else
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    self = v31;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v30;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Container class in plist data (%llu) is invalid",  buf,  0xCu);
    }

    id v16 = 0LL;
    v18 = 0LL;
    v19 = 0LL;
    uint64_t v26 = 20LL;
  }

  unint64_t v33 = v26;
  if (!a5) {
    goto LABEL_20;
  }
LABEL_18:
  if (!v19) {
    *a5 = v33;
  }
LABEL_20:
  id v22 = v19;

  return v22;
}

- (id)minimalIdentity
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v14 = 1LL;
  v2 = self;
  v3 = v2;
  if ((-[MCMContainerIdentityMinimal isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v4 = objc_alloc(&OBJC_CLASS___MCMContainerIdentityMinimal);
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( v4,  "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v5,  v6,  v7,  v8,  v9,  &v14);
  }

  if (!v3)
  {
    container_log_handle_for_category();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = v14;
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = error_description;
      __int16 v19 = 2112;
      uint64_t v20 = v2;
      _os_log_fault_impl( &dword_188846000,  v10,  OS_LOG_TYPE_FAULT,  "Failed to create minimal identity; error = (%llu) %s, self = %@",
        buf,
        0x20u);
    }
  }

  return v3;
}

- (id)identityBySettingPlatform:(unsigned int)a3
{
  v4 = (_DWORD *)-[MCMContainerIdentityMinimal copy](self, "copy");
  v4[2] = a3;
  return v4;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4 = a3;
  int v5 = (void *)-[MCMContainerIdentityMinimal copy](self, "copy");
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __42__MCMContainerIdentityMinimal_description__block_invoke;
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
  v5[2] = __47__MCMContainerIdentityMinimal_debugDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_identifier, "hash");
  unint64_t v4 = -[MCMUserIdentity hash](self->_userIdentity, "hash");
  return v4 ^ v3 ^ -[MCMContainerConfiguration hash](self->_containerConfig, "hash");
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  unint64_t v4 = a3;
  BOOL v5 = -[NSString isEqual:](self->_identifier, "isEqual:", v4[2])
    && -[MCMUserIdentity isEqual:](self->_userIdentity, "isEqual:", v4[4])
    && -[MCMContainerConfiguration isEqual:](self->_containerConfig, "isEqual:", v4[3]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MCMContainerIdentityMinimal *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v5 = -[MCMContainerIdentityMinimal isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_alloc(&OBJC_CLASS___MCMContainerIdentityMinimal);
  userIdentity = self->_userIdentity;
  uint64_t v7 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  uint64_t v8 = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( v5,  "initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  userIdentity,  v7,  self->_containerConfig,  self->_platform,  self->_userIdentityCache,  0LL);

  return v8;
}

- (unint64_t)containerClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unsigned)platform
{
  return self->_platform;
}

- (unsigned)disposition
{
  return self->_disposition;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

id __47__MCMContainerIdentityMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  __int16 v19 = (void *)NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = *(void **)(a1 + 32);
  [v6 userIdentity];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 shortDescription];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    [*(id *)(a1 + 32) identifier];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 redactedDescription];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 32) identifier];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (uint64_t)v9;
  }

  [*(id *)(a1 + 32) containerConfig];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 debugDescription];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [*(id *)(a1 + 32) platform];
  id v15 = (void *)v5;
  objc_msgSend( v19,  "stringWithFormat:",  @"<%@: %p; userIdentity = %@, uint64_t identifier = %@, class = %@, platform = %d>",
    v5,
    v6,
    v10,
    v11,
    v13,
    v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v11 = (void *)v10;
  }

  return v16;
}

id __42__MCMContainerIdentityMinimal_description__block_invoke(uint64_t a1, int a2)
{
  unint64_t v4 = (void *)NSString;
  [*(id *)(a1 + 32) identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  uint64_t v7 = v5;
  if (a2)
  {
    [v5 redactedDescription];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v8 = [*(id *)(a1 + 32) containerConfig];
  [*(id *)(a1 + 32) userIdentity];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 shortDescription];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  uint64_t v12 = v10;
  if (a2)
  {
    [v10 redactedDescription];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend( v4,  "stringWithFormat:",  @"<%@(%@-);%@;pf%d>",
    v7,
    v8,
    v12,
    [*(id *)(a1 + 32) platform]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {

    v11 = v9;
    id v9 = (void *)v8;
  }

  else
  {
    uint64_t v7 = (void *)v8;
  }

  return v13;
}

+ (id)minimalContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 userIdentityCache:v8 error:a5];

  return v10;
}

@end