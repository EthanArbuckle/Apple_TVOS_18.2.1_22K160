@interface MCMCommandRecreateContainerStructure
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandRecreateContainerStructure)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandRecreateContainerStructure)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandRecreateContainerStructure

- (MCMCommandRecreateContainerStructure)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandRecreateContainerStructure;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);
  }

  return v11;
}

- (MCMCommandRecreateContainerStructure)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandRecreateContainerStructure;
  id v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToRecreateContainerStructure];

  return v4;
}

- (void)execute
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  -[MCMCommandRecreateContainerStructure concreteContainerIdentity](self, "concreteContainerIdentity");
  char v4 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMCommand context](self, "context");
  [v5 containerCache];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v80 = 0LL;
  [v6 entryForContainerIdentity:v4 error:&v80];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (MCMError *)v80;

  v72 = v4;
  if (v7)
  {
    [v7 uuid];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMError uuid](v4, "uuid");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0)
    {

      v12 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);
      v7 = 0LL;
      id v8 = v12;
    }
  }

  v79 = v8;
  [v7 metadataWithError:&v79];
  objc_super v13 = (MCMError *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v79;

  v71 = self;
  if (!v13)
  {
    v21 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);

    container_log_handle_for_category();
    uint64_t v14 = (MCMError *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v4;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "No Container with identity: %@",  buf,  0xCu);
    }

    v22 = 0LL;
    v70 = 0LL;
    v23 = 0LL;
    objc_super v13 = 0LL;
    id v20 = 0LL;
    goto LABEL_32;
  }

  -[MCMError containerClass](v13, "containerClass");
  v69 = v3;
  if (container_class_supports_data_subdirectory())
  {
    v15 = +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
    uint64_t v16 = -[MCMCommand context](self, "context");
    [(id)v16 clientIdentity];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v15 desiredDataProtectionClassForMetadata:v13 clientIdentity:v17];
    v19 = -[MCMError containerPath](v13, "containerPath");
    id v78 = 0LL;
    LOBYTE(v16) = [v19 createDataURLIfNecessaryWithDataProtectionClass:v18 error:&v78];
    id v20 = v78;

    if ((v16 & 1) == 0)
    {
      v50 = objc_alloc(&OBJC_CLASS___MCMError);
      v51 = -[MCMError containerPath](v13, "containerPath");
      [v51 containerDataURL];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[MCMError initWithNSError:url:defaultErrorType:]( v50,  "initWithNSError:url:defaultErrorType:",  v20,  v52,  106LL);

      container_log_handle_for_category();
      uint64_t v14 = (MCMError *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v82 = v4;
        __int16 v83 = 2112;
        v84 = v21;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "Could not create container data subdir for %@; error = %@",
          buf,
          0x16u);
      }

      v22 = 0LL;
      v70 = 0LL;
      v23 = 0LL;
      v3 = v69;
      goto LABEL_32;
    }

    v68 = v7;
  }

  else
  {
    v68 = v7;
    id v20 = 0LL;
  }

  v24 = v20;
  v25 = -[MCMCommand context](self, "context");
  [v25 userIdentityCache];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MCMError userIdentity](v13, "userIdentity");
  uint64_t v28 = [v26 libraryRepairForUserIdentity:v27];
  v29 = -[MCMError identifier](v13, "identifier");
  uint64_t v30 = -[MCMError containerClass](v13, "containerClass");
  -[MCMError schemaVersion](v13, "schemaVersion");
  v31 = self;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  id v77 = 0LL;
  BOOL v67 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:]( &OBJC_CLASS___MCMContainerSchema,  "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:",  v29,  v30,  v32,  &v77);
  id v33 = v77;

  uint64_t v34 = +[MCMDataProtectionManager defaultManager](&OBJC_CLASS___MCMDataProtectionManager, "defaultManager");
  v35 = -[MCMCommand context](v31, "context");
  [v35 clientIdentity];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [(id)v34 desiredDataProtectionClassForMetadata:v13 clientIdentity:v36];
  v38 = -[MCMError containerPath](v13, "containerPath");
  uint64_t v39 = v37;
  v22 = (void *)v28;
  v23 = +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:]( &OBJC_CLASS___MCMContainerSchema,  "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:",  v13,  v38,  v39,  v28);
  id v76 = v24;
  LOBYTE(v34) = [v23 writeSchemaFromVersion:&unk_18A2BE800 toTargetVersion:v33 error:&v76];
  id v20 = v76;

  v70 = v33;
  if ((v34 & 1) != 0)
  {
    -[MCMError metadataByChangingSchemaVersion:](v13, "metadataByChangingSchemaVersion:", v33);
    v40 = (MCMError *)objc_claimAutoreleasedReturnValue();

    v3 = v69;
    v41 = v72;
    v7 = v68;
    v66 = v22;
    if (!v67)
    {
      id v75 = 0LL;
      int v42 = -[MCMError writeMetadataToDiskWithError:](v40, "writeMetadataToDiskWithError:", &v75);
      v43 = (MCMError *)v75;
      if (v42)
      {
        v44 = -[MCMCommand context](v71, "context");
        [v44 containerCache];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v43;
        [v45 addContainerMetadata:v40 error:&v74];
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v47 = v74;
        v48 = v43;
        v43 = v47;

        if (!v46)
        {
          container_log_handle_for_category();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v82 = v40;
            __int16 v83 = 2112;
            v84 = v43;
            _os_log_error_impl( &dword_188846000,  v49,  OS_LOG_TYPE_ERROR,  "Could not update cache for container schema version in metadata for %@: %@",  buf,  0x16u);
          }

          v46 = 0LL;
        }

        v41 = v72;
        v7 = v68;
      }

      else
      {
        container_log_handle_for_category();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v40;
          __int16 v83 = 2112;
          v84 = v43;
          _os_log_error_impl( &dword_188846000,  v46,  OS_LOG_TYPE_ERROR,  "Could not update container schema version in metadata for %@: %@",  buf,  0x16u);
        }
      }
    }

    id v53 = containermanager_copy_global_configuration();
    int v54 = objc_msgSend( v53,  "isGlobalSystemContainerWithContainerClass:",  -[MCMError containerClass](v41, "containerClass"));

    if (!v54) {
      goto LABEL_30;
    }
    v55 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    v56 = -[MCMError containerPath](v40, "containerPath");
    [v56 containerRootURL];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    id v73 = v20;
    char v58 = [v55 standardizeACLsForSystemContainerAtURL:v57 error:&v73];
    id v59 = v73;

    if ((v58 & 1) != 0)
    {
      id v20 = v59;
      v3 = v69;
      v41 = v72;
LABEL_30:
      v22 = v66;
      goto LABEL_33;
    }

    v60 = objc_alloc(&OBJC_CLASS___MCMError);
    -[MCMError containerPath](v40, "containerPath");
    v61 = (MCMError *)objc_claimAutoreleasedReturnValue();
    v62 = -[MCMError containerRootURL](v61, "containerRootURL");
    v21 = -[MCMError initWithNSError:url:defaultErrorType:]( v60,  "initWithNSError:url:defaultErrorType:",  v59,  v62,  63LL);

    uint64_t v14 = v61;
    objc_super v13 = v40;
    id v20 = v59;
    v3 = v69;
    v22 = v66;
  }

  else
  {
    v21 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v20,  0LL,  109LL);
    v3 = v69;
    v7 = v68;
  }

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 8LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end