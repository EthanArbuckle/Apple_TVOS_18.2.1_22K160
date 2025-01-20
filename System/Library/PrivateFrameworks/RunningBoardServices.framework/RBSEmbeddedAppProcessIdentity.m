@interface RBSEmbeddedAppProcessIdentity
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)isAnonymous;
- (BOOL)isApplication;
- (BOOL)isEmbeddedApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (RBSEmbeddedAppProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSEmbeddedAppProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initEmbeddedApp:(id)a3 personaString:(id)a4;
- (id)_initEmbeddedAppWithAppInfo:(id)a3;
- (id)_initEmbeddedAppWithBundleID:(id)a3;
- (id)copyWithPersonaString:(id)a3;
- (id)debugDescription;
- (id)embeddedApplicationIdentifier;
- (id)encodeForJob;
- (id)personaString;
- (unsigned)defaultManageFlags;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEmbeddedAppProcessIdentity

- (id)_initEmbeddedAppWithBundleID:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    rbs_general_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:].cold.1();
    }
  }

  id v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]( self,  "_initEmbeddedApp:personaString:",  v4,  0LL);

  return v6;
}

- (id)_initEmbeddedApp:(id)a3 personaString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RBSEmbeddedAppProcessIdentity;
  v8 = -[RBSProcessIdentity _init](&v18, sel__init);
  v9 = v8;
  if (v8)
  {
    v8[2] = 0;
    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v10;

    uint64_t v12 = [v6 copy];
    v13 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v12;

    uint64_t v14 = [NSString stringWithFormat:@"app<%@(%@)>", *((void *)v9 + 7), *((void *)v9 + 8)];
    v15 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v14;

    *((void *)v9 + 3) = [*((id *)v9 + 7) hash];
    v16 = v9;
  }

  return v9;
}

- (id)_initEmbeddedAppWithAppInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 bundleID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 personaString];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v6 && _os_feature_enabled_impl())
    {
      rbs_general_log();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithAppInfo:].cold.1();
      }
    }

    self = (RBSEmbeddedAppProcessIdentity *) -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]( self,  "_initEmbeddedApp:personaString:",  v5,  v6);
    v8 = self;
  }

  else
  {
    rbs_general_log();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [v4 description];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl( &dword_185F67000,  v6,  OS_LOG_TYPE_DEFAULT,  "_initEmbeddedAppWithAppInfoProvider failed - unable to find bundleID for %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4 = a3;
  if (!v4 && _os_feature_enabled_impl())
  {
    rbs_general_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity copyWithPersonaString:].cold.1();
    }
  }

  id v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]( objc_alloc(&OBJC_CLASS___RBSEmbeddedAppProcessIdentity),  "_initEmbeddedApp:personaString:",  self->_embeddedApplicationIdentifier,  v4);
  v6[2] = self->super._pid;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSEmbeddedAppProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && -[RBSProcessIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4 = a3;
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  uint64_t v6 = [v4 embeddedApplicationIdentifier];
  if (embeddedApplicationIdentifier == (NSString *)v6)
  {

    goto LABEL_10;
  }

  uint64_t v7 = v6;
  if (embeddedApplicationIdentifier) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    LOBYTE(v9) = 0;
LABEL_48:

    goto LABEL_49;
  }

  int v9 = -[NSString isEqual:](embeddedApplicationIdentifier, "isEqual:", v6);

  if (v9)
  {
LABEL_10:
    uint64_t v10 = self->_personaString;
    [v4 personaString];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v10;
    unint64_t v12 = v11;
    if (v7 | v12)
    {
      uint64_t v13 = (void *)_personalPersonaUniqueStringOverride;
      if (!_personalPersonaUniqueStringOverride)
      {
        if (_personalPersonaString_onceToken != -1) {
          dispatch_once(&_personalPersonaString_onceToken, &__block_literal_global_11);
        }
        uint64_t v13 = (void *)_personalPersonaString_personalPersonaString;
      }

      id v14 = v13;
      id v15 = v14;
      if (v7) {
        BOOL v16 = v14 == (id)v7;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16)
      {
        int v17 = 1;
      }

      else
      {
        if (!v14)
        {
          if (!v12) {
            goto LABEL_42;
          }
          char v18 = 0;
          LOBYTE(v17) = 0;
          goto LABEL_34;
        }

        int v17 = [(id)v7 isEqualToString:v14];
      }

      char v18 = 1;
      if (v12 && v15 != (id)v12)
      {
        if (v15)
        {
          char v18 = [(id)v12 isEqualToString:v15];
          goto LABEL_28;
        }

        char v18 = 0;
LABEL_34:
        if ((v17 & 1) == 0 && (v18 & 1) == 0)
        {
          if (v7 == v12)
          {
LABEL_30:

            goto LABEL_46;
          }

          if (v7 && v12 != 0)
          {
            char v20 = [(id)v7 isEqualToString:v12];

            if ((v20 & 1) != 0) {
              goto LABEL_46;
            }
            goto LABEL_43;
          }
        }

- (id)debugDescription
{
  v3 = self->_embeddedApplicationIdentifier;
  uint64_t v4 = -[RBSProcessIdentity auid](self, "auid");
  uint64_t v5 = self->_personaString;
  uint64_t v6 = (void *)NSString;
  if ((_DWORD)v4) {
    uint64_t v7 = @" AUID=";
  }
  else {
    uint64_t v7 = &stru_189DE1D08;
  }
  if ((_DWORD)v4)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v4];
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v8 = &stru_189DE1D08;
  }

  int v9 = @" PERS=";
  if (v5)
  {
    uint64_t v10 = (const __CFString *)v5;
  }

  else
  {
    int v9 = &stru_189DE1D08;
    uint64_t v10 = &stru_189DE1D08;
  }

  [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@%@%@>", @"embeddedApplication", v3, &stru_189DE1D08, &stru_189DE1D08, v7, v8, v9, v10];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4) {

  }
  return v11;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:embeddedApplicationIdentifier forKey:@"_embeddedApplicationIdentifier"];
  [v5 encodeObject:self->_personaString forKey:@"_personaString"];
}

- (RBSEmbeddedAppProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_embeddedApplicationIdentifier"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personaString"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && _os_feature_enabled_impl())
  {
    rbs_general_log();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity initWithRBSXPCCoder:].cold.1();
    }
  }

  BOOL v8 = (RBSEmbeddedAppProcessIdentity *) -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]( self,  "_initEmbeddedApp:personaString:",  v5,  v6);

  return v8;
}

- (id)encodeForJob
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 2LL);
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  if (embeddedApplicationIdentifier) {
    xpc_dictionary_set_string(empty, "EAI", -[NSString UTF8String](embeddedApplicationIdentifier, "UTF8String"));
  }
  personaString = self->_personaString;
  if (personaString) {
    xpc_dictionary_set_string(empty, "PERS", -[NSString UTF8String](personaString, "UTF8String"));
  }
  return empty;
}

- (RBSEmbeddedAppProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    rbs_general_log();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:].cold.2((uint64_t)v7, v8);
    }
  }

  string = xpc_dictionary_get_string(v6, "EAI");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  int v11 = xpc_dictionary_get_string(v6, "PERS");
  if (v11)
  {
    [NSString stringWithUTF8String:v11];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_10:
      self = (RBSEmbeddedAppProcessIdentity *) -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]( self,  "_initEmbeddedApp:personaString:",  v10,  v12);
      uint64_t v13 = self;
      goto LABEL_15;
    }
  }

  else
  {
    unint64_t v12 = 0LL;
    if (v10) {
      goto LABEL_10;
    }
  }

  rbs_general_log();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:].cold.1();
  }

  uint64_t v13 = 0LL;
LABEL_15:

  return v13;
}

- (unsigned)defaultManageFlags
{
  return -1;
}

- (BOOL)isEmbeddedApplication
{
  return 1;
}

- (BOOL)isApplication
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 1;
}

- (id)embeddedApplicationIdentifier
{
  return self->_embeddedApplicationIdentifier;
}

- (id)personaString
{
  return self->_personaString;
}

- (void).cxx_destruct
{
}

- (void)_initEmbeddedAppWithBundleID:.cold.1()
{
}

- (void)_initEmbeddedAppWithAppInfo:.cold.1()
{
}

- (void)copyWithPersonaString:.cold.1()
{
}

- (void)initWithRBSXPCCoder:.cold.1()
{
}

- (void)initWithDecodeFromJob:uuid:.cold.1()
{
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(os_log_s *)a2 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_FAULT,  "There is no reason an app identity should have a UUID: %@",  (uint8_t *)&v2,  0xCu);
}

@end