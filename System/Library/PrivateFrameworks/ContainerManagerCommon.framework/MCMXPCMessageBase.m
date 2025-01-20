@interface MCMXPCMessageBase
+ (id)userIdentityForContainerIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 error:(unint64_t *)a6;
+ (id)xpcMessageFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (MCMCommandContext)context;
- (MCMXPCMessageBase)initWithContext:(id)a3;
- (MCMXPCMessageBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (OS_xpc_object)xpcObject;
- (container_client)proxy;
- (id)identifierFromXPCObject:(id)a3 elseClientIdentifier:(id)a4;
- (id)nsObjectFromXPCObject:(id)a3 key:(const char *)a4 error:(unint64_t *)a5;
- (id)nsStringValueFromXPCObject:(id)a3 key:(const char *)a4;
- (id)nsUUIDValueFromXPCObject:(id)a3 key:(const char *)a4;
- (id)userIdentityFromClientPersonaUniqueString:(id)a3 clientIdentity:(id)a4 error:(unint64_t *)a5;
- (unint64_t)command;
- (unsigned)disposition;
- (unsigned)platform;
- (void)dealloc;
@end

@implementation MCMXPCMessageBase

- (MCMXPCMessageBase)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMXPCMessageBase;
  v6 = -[MCMXPCMessageBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (MCMXPCMessageBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  objc_super v9 = -[MCMXPCMessageBase initWithContext:](self, "initWithContext:", a4);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcObject, a3);
    unsigned int uint64 = xpc_dictionary_get_uint64(v8, "Platform");
    uint64_t v12 = xpc_dictionary_get_dictionary(v8, "ProxyForClient");
    v13 = (void *)v12;
    if (v12) {
      uint64_t v12 = container_client_copy_decoded_from_xpc_object();
    }
    v10->_proxy = (container_client *)v12;
    v10->_platform = uint64;
    v10->_command = xpc_dictionary_get_uint64(v8, "Command");
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  container_free_client();
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMXPCMessageBase;
  -[MCMXPCMessageBase dealloc](&v3, sel_dealloc);
}

- (unsigned)disposition
{
  return 1;
}

- (container_client)proxy
{
  return self->_proxy;
}

- (unsigned)platform
{
  return self->_platform;
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (MCMCommandContext)context
{
  return self->_context;
}

- (unint64_t)command
{
  return self->_command;
}

- (void).cxx_destruct
{
}

+ (id)xpcMessageFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithXPCObject:v9 context:v8 error:a5];

  return v10;
}

- (id)nsStringValueFromXPCObject:(id)a3 key:(const char *)a4
{
  string = (void *)xpc_dictionary_get_string(a3, a4);
  if (string)
  {
    [NSString stringWithUTF8String:string];
    string = (void *)objc_claimAutoreleasedReturnValue();
  }

  return string;
}

- (id)identifierFromXPCObject:(id)a3 elseClientIdentifier:(id)a4
{
  id v6 = a4;
  -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](self, "nsStringValueFromXPCObject:key:", a3, "Identifier");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    id v7 = v6;
  }

  return v7;
}

- (id)nsUUIDValueFromXPCObject:(id)a3 key:(const char *)a4
{
  uuid = (uint8_t *)xpc_dictionary_get_uuid(a3, a4);
  if (uuid) {
    uuid = (uint8_t *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
  }
  return uuid;
}

- (id)nsObjectFromXPCObject:(id)a3 key:(const char *)a4 error:(unint64_t *)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = _CFXPCCreateCFObjectFromXPCObject();
    id v8 = (void *)v7;
    if (a5 && !v7) {
      *a5 = 38LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)userIdentityFromClientPersonaUniqueString:(id)a3 clientIdentity:(id)a4 error:(unint64_t *)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint32_t v28 = 0;
  host_t v10 = MEMORY[0x1895CE2D0]();
  if (!host_get_multiuser_config_flags(v10, &v28) && (v28 & 0x80000000) != 0)
  {
    [v9 userIdentity];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  -[MCMXPCMessageBase context](self, "context");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 userIdentityCache];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [(id)objc_opt_class() personasAreSupported];
  v15 = -[MCMXPCMessageBase context](self, "context");
  [v15 userIdentityCache];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    [v16 userIdentityForCurrentUserWithPersonaUniqueString:v8];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [v9 userIdentity];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      char v20 = [v19 isNoSpecificPersona];
      int v21 = [v19 isEqual:v18];
      if ((v20 & 1) != 0 || v21)
      {
        id v11 = v18;
        unint64_t v24 = 1LL;
LABEL_16:

        if (!a5) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }

      container_log_handle_for_category();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      [v9 codeSignInfo];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 identifier];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v28 = 138413058;
      v29 = v27;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 1024;
      int v33 = 0;
      __int16 v34 = 1024;
      int v35 = 0;
      _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Persona unique string is not valid for this client; client = [%@], personaUniqueString = [%@], nonspecific = %d,"
        " sameAsClient = %d",
        (uint8_t *)&v28,
        0x22u);
    }

    else
    {
      container_log_handle_for_category();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      [v9 codeSignInfo];
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v26 = -[os_log_s identifier](v22, "identifier");
      uint32_t v28 = 138412546;
      v29 = v26;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "Cannot reconstitute a user identity from provided persona unique string; client = [%@], personaUniqueString = [%@]",
        (uint8_t *)&v28,
        0x16u);
    }

LABEL_9:
LABEL_14:
    id v11 = 0LL;
    unint64_t v24 = 76LL;
    goto LABEL_16;
  }

  [v9 posixUser];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 userIdentityForPersonalPersonaWithPOSIXUser:v23];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  unint64_t v24 = 1LL;
  if (!a5) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v11) {
    *a5 = v24;
  }
LABEL_19:

  return v11;
}

+ (id)userIdentityForContainerIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 error:(unint64_t *)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  [v10 userIdentity];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  v13 = 0LL;
  unint64_t v14 = 1LL;
  if (a5 > 0xE || ((1LL << a5) & 0x4ED4) == 0)
  {
LABEL_9:
    if (!a6) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }

  if (![v11 isNoSpecificPersona])
  {
    v13 = 0LL;
    unint64_t v14 = 1LL;
    goto LABEL_9;
  }

  id v15 = v9;
  v16 = v15;
  v17 = v15;
  if (a5 - 3 <= 3)
  {
    v17 = v15;
    if ((a5 | 2) == 6)
    {
      [(id)gCodeSigningMapping childParentMapCache];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        [(id)gCodeSigningMapping childParentMapCache];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 parentIdentifierForChildIdentifier:v16];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        container_log_handle_for_category();
        char v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v16;
          _os_log_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEFAULT,  "Warning: not remapping plugin identifier '%{public}@ to parent identifier [3]",  buf,  0xCu);
        }

        v17 = v16;
      }
    }
  }

  [(id)gContainerCache userIdentityCache];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 userIdentitiesForBundleIdentifier:v17];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 != v16)
  {
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v36 = v17;
      __int16 v37 = 2112;
      unint64_t v38 = (unint64_t)v22;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2048;
      unint64_t v42 = a5;
      _os_log_debug_impl( &dword_188846000,  v23,  OS_LOG_TYPE_DEBUG,  "Chose bundleIdentifier: %@, userIdentities: %@ for identifier: %@, class: %llu",  buf,  0x2Au);
    }
  }

  if ([v22 count] == 1)
  {
    [v22 anyObject];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    unint64_t v14 = 1LL;
    goto LABEL_32;
  }

  if (unint64_t)[v22 count] < 2 || (objc_msgSend(v22, "containsObject:", v12))
  {
    if ([v22 count])
    {
      v13 = 0LL;
      goto LABEL_24;
    }

    container_log_handle_for_category();
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [v10 codeSignInfo];
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 identifier];
      int v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v36 = v33;
      __int16 v37 = 2048;
      unint64_t v38 = a5;
      __int16 v39 = 2112;
      v40 = v16;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "Client %{public}@ failed trying to look up persona for %llu:%@",  buf,  0x20u);
    }
  }

  else
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v10;
      __int16 v37 = 2112;
      unint64_t v38 = (unint64_t)v22;
      __int16 v39 = 2112;
      v40 = v12;
      _os_log_fault_impl( &dword_188846000,  v25,  OS_LOG_TYPE_FAULT,  "Ambiguous user identity from [%@]. Expected one of [%@], got %@",  buf,  0x20u);
    }
  }

  v13 = 0LL;
  unint64_t v14 = 76LL;
LABEL_32:

  if (!a6) {
    goto LABEL_35;
  }
LABEL_33:
  if (!v12) {
    *a6 = v14;
  }
LABEL_35:
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (!MCMRequirePersona_result)
  {
    BOOL v26 = 1;
    if (!v13) {
      goto LABEL_48;
    }
    goto LABEL_43;
  }

  if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
  }
  BOOL v26 = MCMRequirePersonaTelemetryOnly_result != 0;
  if (v13)
  {
LABEL_43:
    if (([v12 isStrictlyEqualToUserIdentity:v13] & 1) == 0)
    {
      container_log_handle_for_category();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        [v10 codeSignInfo];
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 identifier];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        __int16 v32 = " NOT";
        __int16 v37 = 2080;
        id v36 = v31;
        if (v26) {
          __int16 v32 = "";
        }
        unint64_t v38 = (unint64_t)v32;
        __int16 v39 = 2114;
        v40 = v13;
        __int16 v41 = 2114;
        unint64_t v42 = (unint64_t)v12;
        __int16 v43 = 2048;
        unint64_t v44 = a5;
        __int16 v45 = 2112;
        id v46 = v9;
        _os_log_debug_impl( &dword_188846000,  v27,  OS_LOG_TYPE_DEBUG,  "For %{public}@ ,%s substituting user identity %{public}@ for client identity %{public}@ for container %llu:%@",  buf,  0x3Eu);
      }
    }

    if (v26)
    {
      id v28 = v13;

      uint64_t v12 = v28;
    }
  }

@end