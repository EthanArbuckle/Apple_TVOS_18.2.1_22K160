@interface MCMCommandSetInfoValue
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetInfoValue)initWithKey:(id)a3 value:(id)a4 containerIdentity:(id)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandSetInfoValue)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (NSString)key;
- (id)value;
- (void)execute;
@end

@implementation MCMCommandSetInfoValue

- (MCMCommandSetInfoValue)initWithKey:(id)a3 value:(id)a4 containerIdentity:(id)a5 context:(id)a6 resultPromise:(id)a7
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCMCommandSetInfoValue;
  v16 = -[MCMCommand initWithContext:resultPromise:](&v19, sel_initWithContext_resultPromise_, a6, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    objc_storeStrong(&v17->_value, a4);
    objc_storeStrong((id *)&v17->_concreteContainerIdentity, a5);
  }

  return v17;
}

- (MCMCommandSetInfoValue)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMCommandSetInfoValue;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 key];
    key = v9->_key;
    v9->_key = (NSString *)v12;

    uint64_t v14 = [v8 value];
    id value = v9->_value;
    v9->_id value = (id)v14;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = [v3 isAllowedToAccessInfoMetadata];
  return (char)v2;
}

- (void)execute
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v4 = -[MCMCommandSetInfoValue concreteContainerIdentity](self, "concreteContainerIdentity");
  v5 = -[MCMCommandSetInfoValue key](self, "key");
  uint64_t v6 = -[MCMCommandSetInfoValue value](self, "value");
  objc_opt_class();
  id v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  v33 = (void *)v6;
  v34 = (void *)v4;
  if (!v8)
  {
    v32 = v3;
    uint64_t v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 38LL);
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v7;
      _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "Can't set nil or non-NSString key: %@", buf, 0xCu);
    }

    v16 = 0LL;
    id v13 = 0LL;
    v11 = 0LL;
    goto LABEL_21;
  }
  v9 = -[MCMCommand context](self, "context");
  [v9 containerCache];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v38 = 0LL;
  [v10 entryForContainerIdentity:v4 error:&v38];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v38;

  id v37 = v12;
  [v11 metadataWithError:&v37];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (MCMError *)v37;

  if (!v13)
  {
    v32 = v3;
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v4;
      _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }

    v16 = 0LL;
    id v13 = 0LL;
    goto LABEL_21;
  }

  [v13 metadataBySettingInfoValue:v6 forKey:v7];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != v15)
  {
    v16 = v15;
    v32 = v3;
    v36 = v14;
    char v17 = [v15 writeMetadataToDiskWithError:&v36];
    uint64_t v18 = v36;

    if ((v17 & 1) != 0)
    {
      -[MCMCommand context](self, "context");
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 containerCache];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v18;
      [v20 addContainerMetadata:v16 error:&v35];
      v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = v35;

      if (v22)
      {
LABEL_22:
        v3 = v32;
        goto LABEL_23;
      }

      container_log_handle_for_category();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        [v13 containerPath];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 containerRootURL];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 path];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = (uint64_t)v16;
        __int16 v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@", buf, 0x16u);
      }
    }

    else
    {
      container_log_handle_for_category();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        [v13 containerPath];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 containerRootURL];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 path];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = (uint64_t)v16;
        __int16 v41 = 2112;
        v42 = v31;
        __int16 v43 = 2112;
        v44 = v18;
        _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to write updated metadata: %@, url: %@, error = %@",  buf,  0x20u);
      }

      uint64_t v14 = v18;
    }

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 5LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end