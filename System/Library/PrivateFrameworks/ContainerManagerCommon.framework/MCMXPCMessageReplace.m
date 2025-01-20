@interface MCMXPCMessageReplace
- (MCMConcreteContainerIdentity)containerIdentityNew;
- (MCMConcreteContainerIdentity)containerIdentityOld;
- (MCMXPCMessageReplace)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageReplace

- (MCMXPCMessageReplace)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MCMXPCMessageReplace;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v39, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (!v10) {
    goto LABEL_21;
  }
  unint64_t v38 = 1LL;
  xpc_dictionary_get_dictionary(v8, "OldContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v12 = container_xpc_decode_container_object();
    if (!v12)
    {
      container_log_handle_for_category();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t error_description = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        unint64_t v41 = v38;
        __int16 v42 = 2080;
        uint64_t v43 = error_description;
        _os_log_error_impl( &dword_188846000,  v29,  OS_LOG_TYPE_ERROR,  "Failed to decode old container; error = (%llu) %s",
          buf,
          0x16u);
      }

      v20 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v13 = 0LL;
      goto LABEL_16;
    }

    uint64_t v13 = v12;
    v14 = objc_alloc(&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem);
    [v9 clientIdentity];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 userIdentity];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 userIdentityCache];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( v14,  "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:",  v13,  v16,  v17,  &v38);
    containerIdentityOld = v10->_containerIdentityOld;
    v10->_containerIdentityOld = (MCMConcreteContainerIdentity *)v18;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  xpc_dictionary_get_dictionary(v8, "NewContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    uint64_t v21 = container_xpc_decode_container_object();
    if (v21)
    {
      uint64_t v22 = v21;
      v36 = objc_alloc(&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem);
      [v9 clientIdentity];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 userIdentity];
      v37 = a5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 userIdentityCache];
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( v36,  "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:",  v22,  v24,  v26,  &v38);
      containerIdentityNew = v10->_containerIdentityNew;
      v10->_containerIdentityNew = (MCMConcreteContainerIdentity *)v27;

      v11 = v25;
      a5 = v37;
    }

    else
    {
      container_log_handle_for_category();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = v11;
        unint64_t v34 = v38;
        uint64_t v35 = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        unint64_t v41 = v34;
        v11 = v33;
        __int16 v42 = 2080;
        uint64_t v43 = v35;
        _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to decode new container; error = (%llu) %s",
          buf,
          0x16u);
      }

      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
    unint64_t v38 = 38LL;
  }

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMXPCMessageReplace;
  unsigned int v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    v4 = -[MCMXPCMessageReplace containerIdentityNew](self, "containerIdentityNew");
    unsigned int v3 = [v4 disposition];
  }

  return v3;
}

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (void).cxx_destruct
{
}

@end