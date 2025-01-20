@interface MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier
- (MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)appGroupIdentifier;
- (unsigned)expectedPersonaKernelID;
@end

@implementation MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier

- (MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v36, sel_initWithXPCObject_context_error_, v8, v9, a5);
  v11 = v10;
  if (!v10) {
    goto LABEL_21;
  }
  v12 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "Identifier");
  if (v12)
  {
    objc_storeStrong((id *)&v11->_appGroupIdentifier, v12);
    v11->_unsigned int expectedPersonaKernelID = -1;
    v13 = -[MCMXPCMessageBase context](v11, "context");
    [v13 userIdentityCache];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [(id)objc_opt_class() personasAreSupported];

    if (v15)
    {
      id v16 = containermanager_copy_global_configuration();
      [v16 staticConfig];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v18 = xpc_dictionary_get_value(v8, "PersonaKernelID");
      v19 = (void *)v18;
      if (v18 && MEMORY[0x1895CEBDC](v18) == MEMORY[0x1895F92F0])
      {
        v11->_unsigned int expectedPersonaKernelID = xpc_uint64_get_value(v19);
        if ([v9 kernelPersonaID] != v11->_expectedPersonaKernelID)
        {
          container_log_handle_for_category();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            [v9 clientIdentity];
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            [v35 codeSignInfo];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 identifier];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 clientIdentity];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            int v30 = [v31 posixPID];
            unsigned int expectedPersonaKernelID = v11->_expectedPersonaKernelID;
            int v29 = [v9 kernelPersonaID];
            *(_DWORD *)buf = 138413058;
            v38 = v27;
            __int16 v39 = 1024;
            int v40 = v30;
            __int16 v41 = 1024;
            unsigned int v42 = expectedPersonaKernelID;
            __int16 v43 = 1024;
            int v44 = v29;
            _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
              buf,
              0x1Eu);
          }

          if ([v17 errorOnPersonaPropagationFailure])
          {
            unint64_t v21 = 151LL;
            goto LABEL_10;
          }
        }
      }

      else
      {
        container_log_handle_for_category();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          [v9 clientIdentity];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 codeSignInfo];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 identifier];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 clientIdentity];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          int v26 = [v25 posixPID];
          *(_DWORD *)buf = 138412546;
          v38 = v24;
          __int16 v39 = 1024;
          int v40 = v26;
          _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Kernel persona ID is invalid; client[%@(%d)]",
            buf,
            0x12u);
        }

        if ([v17 errorOnPersonaPropagationFailure])
        {
          unint64_t v21 = 38LL;
LABEL_10:

          goto LABEL_12;
        }
      }
    }

    goto LABEL_21;
  }

  unint64_t v21 = 38LL;
LABEL_12:

  v11 = 0LL;
  if (a5) {
    *a5 = v21;
  }
LABEL_21:

  return v11;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (void).cxx_destruct
{
}

@end