@interface MCMCommandReplaceContainer
+ (BOOL)recoverFromReplaceOperationsWithContext:(id)a3 error:(id *)a4;
+ (Class)incomingMessageClass;
+ (id)_readAndValidateReplaceFileAtUrl:(id)a3 error:(id *)a4;
+ (unint64_t)command;
- (BOOL)_writeToDiskReplaceAt:(id)a3 old:(id)a4 withNew:(id)a5 usingStaging:(id)a6 toDestination:(id)a7 error:(id *)a8;
- (BOOL)asyncReclaim;
- (BOOL)preflightClientAllowed;
- (BOOL)preserveOldInternalUUID;
- (BOOL)preserveOldPathIdentifier;
- (MCMCommandReplaceContainer)initWithConcreteContainerIdentityOld:(id)a3 concreteContainerIdentityNew:(id)a4 preserveOldPathIdentifier:(BOOL)a5 preserveOldInternalUUID:(BOOL)a6 asyncReclaim:(BOOL)a7 context:(id)a8 resultPromise:(id)a9;
- (MCMCommandReplaceContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)containerIdentityNew;
- (MCMConcreteContainerIdentity)containerIdentityOld;
- (void)execute;
@end

@implementation MCMCommandReplaceContainer

- (MCMCommandReplaceContainer)initWithConcreteContainerIdentityOld:(id)a3 concreteContainerIdentityNew:(id)a4 preserveOldPathIdentifier:(BOOL)a5 preserveOldInternalUUID:(BOOL)a6 asyncReclaim:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCMCommandReplaceContainer;
  v18 = -[MCMCommand initWithContext:resultPromise:](&v21, sel_initWithContext_resultPromise_, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_containerIdentityOld, a3);
    objc_storeStrong((id *)&v19->_containerIdentityNew, a4);
    v19->_preserveOldPathIdentifier = a5;
    v19->_preserveOldInternalUUID = a6;
    v19->_asyncReclaim = a7;
  }

  return v19;
}

- (MCMCommandReplaceContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandReplaceContainer;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 containerIdentityOld];
    containerIdentityOld = v9->_containerIdentityOld;
    v9->_containerIdentityOld = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 containerIdentityNew];
    containerIdentityNew = v9->_containerIdentityNew;
    v9->_containerIdentityNew = (MCMConcreteContainerIdentity *)v12;

    v9->_preserveOldPathIdentifier = 0;
    v9->_preserveOldInternalUUID = 0;
    v9->_asyncReclaim = 1;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToReplaceContainers];

  return v4;
}

- (void)execute
{
  v2 = self;
  uint64_t v260 = *MEMORY[0x1895F89C0];
  uint64_t v3 = MEMORY[0x1895CE3A8](self, a2);
  -[MCMCommandReplaceContainer containerIdentityNew](v2, "containerIdentityNew");
  char v4 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandReplaceContainer containerIdentityOld](v2, "containerIdentityOld");
  v5 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMError uuid](v5, "uuid");
  uint64_t v211 = -[MCMError containerClass](v4, "containerClass");
  uint64_t v7 = -[MCMError containerClass](v5, "containerClass");
  -[MCMError identifier](v4, "identifier");
  v218 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError identifier](v5, "identifier");
  v217 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError userIdentity](v4, "userIdentity");
  v226 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError userIdentity](v5, "userIdentity");
  v227 = (MCMError *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    BOOL v8 = -[MCMCommandReplaceContainer preserveOldPathIdentifier](v2, "preserveOldPathIdentifier");
    BOOL v209 = -[MCMCommandReplaceContainer preserveOldInternalUUID](v2, "preserveOldInternalUUID");
  }

  else
  {
    BOOL v8 = 0;
    BOOL v209 = 0;
  }

  id v9 = containermanager_copy_global_configuration();
  [v9 managedPathRegistry];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 containermanagerReplaceOperations];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v216 = v11;
  [v11 url];
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)v3;
  if (!v219)
  {
    uint64_t v204 = v7;
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 84LL);
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing replace operations.",  buf,  2u);
    }

    v24 = 0LL;
    v221 = 0LL;
    v225 = 0LL;
    v220 = 0LL;
    v228 = 0LL;
    v229 = 0LL;
    v25 = 0LL;
    v26 = 0LL;
LABEL_37:

    if (!v6) {
      goto LABEL_75;
    }
    goto LABEL_38;
  }

  if (v6)
  {
    if (v7 == v211)
    {
      if (-[MCMError isEqual:](v227, "isEqual:", v226))
      {
        v205 = v6;
        -[MCMCommand context](v2, "context");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 containerCache];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v247 = 0LL;
        [v13 entryForContainerIdentity:v5 error:&v247];
        v14 = (MCMError *)objc_claimAutoreleasedReturnValue();
        objc_super v15 = (MCMError *)v247;

        if (v14)
        {
          uint64_t v204 = v7;
          uint64_t v16 = v2;
          -[MCMError uuid](v14, "uuid");
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[MCMError uuid](v5, "uuid");
          char v19 = [v17 isEqual:v18];

          if ((v19 & 1) != 0)
          {
            v246 = v15;
            uint64_t v20 = -[MCMError metadataWithError:](v14, "metadataWithError:", &v246);
            objc_super v21 = v246;

            v6 = v205;
            v207 = (void *)v20;
            if (v20)
            {

              v2 = v16;
              uint64_t v22 = v4;
              goto LABEL_22;
            }

            objc_super v15 = v21;
          }

          else
          {
            v55 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  21LL,  3LL);

            v14 = 0LL;
            objc_super v15 = v55;
            v6 = v205;
          }

          v2 = v16;
        }

        else
        {
          v6 = v205;
        }

        container_log_handle_for_category();
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v5;
          __int16 v250 = 2112;
          v251 = v15;
          _os_log_error_impl( &dword_188846000,  v65,  OS_LOG_TYPE_ERROR,  "No Container with identity: %@; error = %@",
            buf,
            0x16u);
        }

        v220 = 0LL;
        v221 = 0LL;
        v26 = 0LL;
        v213 = 0LL;
        v228 = 0LL;
        v229 = 0LL;
        v225 = 0LL;
        v24 = 0LL;
        goto LABEL_70;
      }

      objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 76LL);
      container_log_handle_for_category();
      v14 = (MCMError *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v220 = 0LL;
        v221 = 0LL;
        v26 = 0LL;
        v213 = 0LL;
        v228 = 0LL;
        v229 = 0LL;
        v225 = 0LL;
        v24 = 0LL;
LABEL_70:

        goto LABEL_71;
      }

      *(_DWORD *)buf = 138412546;
      v249 = v227;
      __int16 v250 = 2112;
      v251 = v226;
      v28 = "Can't replace containers of different personas: %@ and %@";
    }

    else
    {
      objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 23LL);
      container_log_handle_for_category();
      v14 = (MCMError *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 134218240;
      v249 = (MCMError *)v7;
      __int16 v250 = 2048;
      v251 = (MCMError *)v211;
      v28 = "Can't replace containers of different class types: %ld and %ld";
    }

    _os_log_error_impl(&dword_188846000, (os_log_t)v14, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_31;
  }

  if (v8)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 11LL);
    container_log_handle_for_category();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Can't have a nil oldContainerUUID when preserving the UUID",  buf,  2u);
    }

    v220 = 0LL;
    v221 = 0LL;
    v26 = 0LL;
    v25 = 0LL;
    v228 = 0LL;
    v229 = 0LL;
    v225 = 0LL;
    v24 = 0LL;
    goto LABEL_73;
  }

  uint64_t v204 = v7;
  v205 = 0LL;
  uint64_t v22 = v4;
  v207 = 0LL;
  objc_super v21 = 0LL;
LABEL_22:
  v29 = -[MCMCommand context](v2, "context");
  [v29 containerCache];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = v21;
  [v30 entryForContainerIdentity:v22 error:&v245];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v15 = v245;

  if (!v24)
  {
LABEL_34:
    v6 = v205;
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v26 = v207;
    char v4 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v22;
      __int16 v250 = 2112;
      v251 = v15;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "No Container with identity: %@; error = %@",
        buf,
        0x16u);
    }

    v221 = 0LL;
    v225 = 0LL;
    v220 = 0LL;
    v228 = 0LL;
    v229 = 0LL;
    v25 = 0LL;
    goto LABEL_37;
  }

  [v24 uuid];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[MCMError uuid](v22, "uuid");
  char v33 = [v31 isEqual:v32];

  if ((v33 & 1) == 0)
  {
    v35 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  21LL,  3LL);

    v24 = 0LL;
    goto LABEL_33;
  }

  v244 = v15;
  [v24 metadataWithError:&v244];
  v34 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v35 = v244;

  if (!v34)
  {
LABEL_33:
    objc_super v15 = v35;
    goto LABEL_34;
  }

  v190 = v35;
  v202 = v5;
  v203 = v24;
  v198 = v22;
  unsigned int v36 = -[MCMError transient](v34, "transient");
  v6 = v205;
  if (v207)
  {
    v37 = -[MCMError containerPath](v34, "containerPath");
    [v207 containerPath];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    int v39 = [v37 isEqual:v38];

    if (v39)
    {
      v25 = v34;
      objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 22LL);

      container_log_handle_for_category();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      char v4 = v198;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v147 = v25;
        -[MCMError containerPath](v25, "containerPath");
        v148 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v249 = v148;
        _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Can't replace the same container at %@",  buf,  0xCu);

        v25 = v147;
      }

      v221 = 0LL;
      v225 = 0LL;
      v220 = 0LL;
      v228 = 0LL;
      v229 = 0LL;
      v26 = v207;
      v24 = v203;
      goto LABEL_37;
    }
  }

  v196 = v2;
  v56 = -[MCMCommand context](v2, "context");
  [v56 clientIdentity];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v57 platform];
  -[MCMError containerClass](v34, "containerClass");
  -[MCMError transient](v34, "transient");
  char v58 = container_class_supports_randomized_path();

  char v59 = v58 ^ 1;
  if (v205) {
    char v60 = v58 ^ 1 | v8;
  }
  else {
    char v60 = v8;
  }
  v214 = v34;
  v61 = -[MCMError containerPath](v34, "containerPath");
  [v61 containerRootURL];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v62 lastPathComponent];
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v207;
  char v4 = v198;
  if ((v59 & 1) == 0)
  {
    v63 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v220];
    if (!v63)
    {
      objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

      container_log_handle_for_category();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v166 = -[MCMError containerPath](v214, "containerPath");
        [v166 containerRootURL];
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        [v167 path];
        v168 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v249 = v168;
        _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Invalid URL (last path component not UUID): %@",  buf,  0xCu);

        v26 = v207;
        v25 = v214;
        v221 = 0LL;
        v225 = 0LL;
        v228 = 0LL;
        v229 = 0LL;
        v2 = v196;
        goto LABEL_37;
      }

      v221 = 0LL;
      v225 = 0LL;
      v228 = 0LL;
      v229 = 0LL;
      v2 = v196;
      goto LABEL_97;
    }
  }

  uint64_t v64 = [v207 containerPath];
  if ((v60 & 1) != 0)
  {
    v221 = 0LL;
    v2 = v196;
    goto LABEL_100;
  }

  v225 = (MCMError *)v64;
  v74 = (void *)objc_opt_class();
  v2 = v196;
  unsigned int v75 = v36;
  [v74 containerPathForUserIdentity:v226 containerClass:v211 containerPathIdentifier:v220];
  v76 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v77 = -[MCMError containerClassPath](v76, "containerClassPath");
  id v243 = 0LL;
  char v78 = [v77 createIfNecessaryWithError:&v243];
  v79 = (MCMError *)v243;

  v221 = v79;
  if ((v78 & 1) == 0)
  {
    v86 = objc_alloc(&OBJC_CLASS___MCMError);
    -[MCMError containerClassPath](v76, "containerClassPath");
    v87 = (os_log_s *)v76;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v88 classURL];
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v15 = -[MCMError initWithNSError:url:defaultErrorType:](v86, "initWithNSError:url:defaultErrorType:", v79, v89, 3LL);

    container_log_handle_for_category();
    v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = (MCMError *)v87;
      __int16 v250 = 2112;
      v251 = v79;
      _os_log_error_impl( &dword_188846000,  v90,  OS_LOG_TYPE_ERROR,  "Failed to create class path dir for %@: %@",  buf,  0x16u);
    }

    v228 = 0LL;
    v229 = 0LL;
    v23 = v87;
    v26 = v207;
    goto LABEL_97;
  }
  v80 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v81 = -[MCMError containerRootURL](v76, "containerRootURL");
  v82 = v76;
  int v83 = [v80 itemExistsAtURL:v81];

  if (v83)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 27LL);

    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v171 = -[MCMError containerRootURL](v82, "containerRootURL");
      [v171 path];
      v172 = (MCMError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v249 = v172;
      _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "Container already exists at %@", buf, 0xCu);

      v26 = v207;
    }

    v228 = 0LL;
    v229 = 0LL;
    v225 = v82;
LABEL_97:
    v24 = v203;
    goto LABEL_98;
  }

  uint64_t v64 = (uint64_t)v82;
  unsigned int v36 = v75;
LABEL_100:
  v225 = (MCMError *)v64;
  if (!v205)
  {
    v109 = -[MCMError identityByChangingTransient:](v198, "identityByChangingTransient:", 0LL);
    [v109 containerIdentity];
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v110 = -[MCMCommand context](v2, "context");
    [v110 containerCache];
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = v190;
    [v111 entryForContainerIdentity:v27 error:&v242];
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v15 = v242;

    if (v112)
    {
      v113 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 27LL);

      container_log_handle_for_category();
      v114 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v24 = v203;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        -[MCMError identifier](v214, "identifier");
        v169 = (MCMError *)objc_claimAutoreleasedReturnValue();
        int v170 = [v207 transient];
        *(_DWORD *)buf = 138412802;
        v249 = v169;
        __int16 v250 = 2048;
        v251 = (MCMError *)v211;
        __int16 v252 = 1024;
        LODWORD(v253) = v170;
        _os_log_error_impl( &dword_188846000,  v114,  OS_LOG_TYPE_ERROR,  "Container with identifier: %@, class: %ld, transient: %d already exists",  buf,  0x1Cu);
      }

      objc_super v15 = v113;
    }

    else
    {
      v24 = v203;
      if (-[MCMError type](v15, "type") == 21)
      {

        container_log_handle_for_category();
        v120 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v2 = v196;
        v25 = v214;
        if (os_signpost_enabled(v120))
        {
          v121 = -[MCMError containerPath](v214, "containerPath");
          [v121 containerPathIdentifier];
          v122 = (MCMError *)objc_claimAutoreleasedReturnValue();
          -[MCMError identifier](v214, "identifier");
          v123 = (MCMError *)objc_claimAutoreleasedReturnValue();
          uint64_t v124 = -[MCMError containerClass](v214, "containerClass");
          *(_DWORD *)buf = 138478339;
          v249 = v122;
          __int16 v250 = 2113;
          v251 = v123;
          __int16 v252 = 2050;
          uint64_t v253 = v124;
          _os_signpost_emit_with_name_impl( &dword_188846000,  v120,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "PromotingTransientContainer",  " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  c lass=%{public, signpost.description:attribute}llu ",  buf,  0x20u);

          v25 = v214;
        }

        v228 = 0LL;
        v229 = 0LL;
        objc_super v15 = 0LL;
        v26 = v207;
        goto LABEL_141;
      }
    }

    v2 = v196;
    v25 = v214;

    v228 = 0LL;
    v229 = 0LL;
    v26 = v207;
    goto LABEL_73;
  }

  unsigned int v186 = v36;
  [MEMORY[0x189607AB8] UUID];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = [v91 UUIDString];

  [v207 containerPath];
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  [v93 containerRootURL];
  v185 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v94 = -[MCMError containerPath](v214, "containerPath");
  [v94 containerRootURL];
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = (void *)MEMORY[0x189604030];
  [NSString stringWithFormat:@"%@.plist", v92];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  [v95 URLWithString:v96 relativeToURL:v219];
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:]( &OBJC_CLASS___MCMContainerStagingPath,  "stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:",  v225,  v92);
  v97 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v98 = -[MCMError containerClassPath](v97, "containerClassPath");
  v241 = v221;
  char v99 = [v98 createIfNecessaryWithError:&v241];
  v100 = v241;

  v182 = v97;
  v183 = (void *)v92;
  if ((v99 & 1) != 0)
  {
    v222 = v100;
    v229 = -[MCMError containerRootURL](v97, "containerRootURL");
    uint64_t v101 = +[MCMContainerCacheEntry birthtimeForURL:](&OBJC_CLASS___MCMContainerCacheEntry, "birthtimeForURL:", v185);
    if (v101 | v102)
    {
      uint64_t v106 = v101;
      uint64_t v108 = v102;
    }

    else
    {
      v103 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      id v240 = 0LL;
      [v103 fsNodeOfURL:v185 followSymlinks:0 error:&v240];
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (MCMError *)v240;

      if (v104)
      {
        uint64_t v106 = [v104 birthtime];
        uint64_t v108 = v107;
      }

      else
      {
        container_log_handle_for_category();
        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v185;
          __int16 v250 = 2112;
          v251 = v105;
          _os_log_error_impl( &dword_188846000,  v125,  OS_LOG_TYPE_ERROR,  "Could not read fs node for old container at [%@] (non-fatal); error = %@",
            buf,
            0x16u);
        }

        uint64_t v106 = 0LL;
        uint64_t v108 = 0LL;
      }
    }

    if (v106 | v108) {
      +[MCMContainerCacheEntry setBirthtime:forURL:]( &OBJC_CLASS___MCMContainerCacheEntry,  "setBirthtime:forURL:",  v106,  v108,  v187);
    }
    v126 = -[MCMError containerRootURL](v225, "containerRootURL");
    v239 = v190;
    BOOL v127 = -[MCMCommandReplaceContainer _writeToDiskReplaceAt:old:withNew:usingStaging:toDestination:error:]( v2,  "_writeToDiskReplaceAt:old:withNew:usingStaging:toDestination:error:",  v228,  v185,  v187,  v229,  v126,  &v239);
    v128 = v239;

    v184 = v128;
    if (v127)
    {
      container_log_handle_for_category();
      v129 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v129))
      {
        [v207 containerPath];
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        [v130 containerPathIdentifier];
        v131 = (MCMError *)objc_claimAutoreleasedReturnValue();
        [v207 identifier];
        v132 = (MCMError *)objc_claimAutoreleasedReturnValue();
        uint64_t v191 = [v207 containerClass];
        v133 = -[MCMError containerPath](v214, "containerPath");
        [v133 containerPathIdentifier];
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = -[MCMError identifier](v214, "identifier");
        uint64_t v136 = -[MCMError containerClass](v214, "containerClass");
        *(_DWORD *)buf = 138479107;
        v249 = v131;
        __int16 v250 = 2113;
        v251 = v132;
        __int16 v252 = 2050;
        uint64_t v253 = v191;
        __int16 v254 = 2113;
        v255 = v134;
        __int16 v256 = 2113;
        v257 = v135;
        __int16 v258 = 2050;
        uint64_t v259 = v136;
        _os_signpost_emit_with_name_impl( &dword_188846000,  v129,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ReplacingContainer",  " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  cla ss=%{public, signpost.description:attribute}llu  -->  uuid=%{private, signpost.description:attribute}@  identi fier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu ",  buf,  0x3Eu);
      }
      v137 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      [v207 containerPath];
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      [v138 containerRootURL];
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v222;
      char v140 = [v137 moveItemAtURL:v139 toURL:v229 error:&v238];
      v141 = v238;

      unsigned int v36 = v186;
      if ((v140 & 1) != 0)
      {
        v221 = v141;
        v142 = -[MCMCommand context](v2, "context");
        [v142 containerCache];
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = v184;
        char v144 = objc_msgSend( v143,  "removeContainerForUserIdentity:contentClass:identifier:transient:error:",  v227,  v204,  v217,  objc_msgSend(v207, "transient"),  &v237);
        objc_super v15 = v237;

        v26 = v207;
        if ((v144 & 1) != 0)
        {
          char v145 = 1;
          char v4 = v198;
          v5 = v202;
          v24 = v203;
          goto LABEL_140;
        }

        v184 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 46LL);

        container_log_handle_for_category();
        v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        char v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          int v180 = [v207 transient];
          *(_DWORD *)buf = 138412802;
          v249 = v217;
          __int16 v250 = 2048;
          v251 = (MCMError *)v204;
          __int16 v252 = 1024;
          LODWORD(v253) = v180;
          _os_log_error_impl( &dword_188846000,  v118,  OS_LOG_TYPE_ERROR,  "Failed to remove from cache id: %@, class: %ld, transient: %d",  buf,  0x1Cu);
        }

        v119 = v221;
      }

      else
      {
        v146 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 14LL);

        container_log_handle_for_category();
        v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        char v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v224 = v141;
          v26 = v207;
          [v207 containerPath];
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          [v194 containerRootURL];
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          [v176 path];
          v177 = (MCMError *)objc_claimAutoreleasedReturnValue();
          [v229 path];
          v178 = (MCMError *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v249 = v177;
          __int16 v250 = 2112;
          v251 = v178;
          _os_log_error_impl( &dword_188846000,  v118,  OS_LOG_TYPE_ERROR,  "Failed to move old %@ to staging %@",  buf,  0x16u);

          v119 = v224;
          v184 = v146;
        }

        else
        {
          v119 = v141;
          v184 = v146;
          v26 = v207;
        }
      }

      v5 = v202;
      v24 = v203;
    }

    else
    {
      container_log_handle_for_category();
      v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unsigned int v36 = v186;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v249 = v128;
        _os_log_error_impl(&dword_188846000, v118, OS_LOG_TYPE_ERROR, "Failed to write replace file: %@", buf, 0xCu);
      }

      v26 = v207;
      v24 = v203;
      v119 = v100;
    }
  }

  else
  {
    v115 = objc_alloc(&OBJC_CLASS___MCMError);
    v116 = -[MCMError containerClassPath](v97, "containerClassPath");
    [v116 classURL];
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = -[MCMError initWithNSError:url:defaultErrorType:]( v115,  "initWithNSError:url:defaultErrorType:",  v100,  v117,  7LL);

    container_log_handle_for_category();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v119 = v100;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v97;
      __int16 v250 = 2112;
      v251 = v100;
      _os_log_error_impl( &dword_188846000,  v118,  OS_LOG_TYPE_ERROR,  "Failed to create class path dir for %@: %@",  buf,  0x16u);
    }

    v229 = 0LL;
    v26 = v207;
    v24 = v203;
    unsigned int v36 = v186;
  }

  char v145 = 0;
  v221 = v119;
  objc_super v15 = v184;
LABEL_140:

  v25 = v214;
  if ((v145 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_141:
  if (v36)
  {
    uint64_t v149 = -[MCMError metadataBySettingTransient:](v25, "metadataBySettingTransient:", 0LL);

    v25 = (MCMError *)v149;
  }

  if (v209)
  {
    uint64_t v150 = -[MCMError metadataByChangingUUID:](v25, "metadataByChangingUUID:", v205);

    v25 = (MCMError *)v150;
  }

  else if (((v26 == 0LL) & ~v36) != 0)
  {
    goto LABEL_148;
  }

  id v236 = 0LL;
  int v151 = -[MCMError writeMetadataToDiskWithError:](v25, "writeMetadataToDiskWithError:", &v236);
  id v152 = v236;
  if (!v151)
  {
    v234[0] = MEMORY[0x1895F87A8];
    v234[1] = 3221225472LL;
    v234[2] = __37__MCMCommandReplaceContainer_execute__block_invoke;
    v234[3] = &unk_18A29E6D8;
    id v235 = v152;
    v23 = (os_log_s *)v152;
    id v163 = __37__MCMCommandReplaceContainer_execute__block_invoke((uint64_t)v234);

    goto LABEL_37;
  }

LABEL_148:
  v188 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v214 = v25;
  v200 = -[MCMError containerPath](v25, "containerPath");
  [v200 containerRootURL];
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMError containerRootURL](v225, "containerRootURL");
  v233[1] = v221;
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  char v192 = objc_msgSend(v188, "moveItemAtURL:toURL:error:", v153);
  v210 = v221;

  if ((v192 & 1) == 0)
  {
    v164 = objc_alloc(&OBJC_CLASS___MCMError);
    v165 = -[MCMError containerRootURL](v225, "containerRootURL");
    uint64_t v212 = -[MCMError initWithNSError:url:defaultErrorType:]( v164,  "initWithNSError:url:defaultErrorType:",  v210,  v165,  15LL);

    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [v26 containerPath];
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      [v223 containerRootURL];
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      [v201 path];
      v189 = (MCMError *)objc_claimAutoreleasedReturnValue();
      v197 = -[MCMError containerPath](v214, "containerPath");
      [v197 containerRootURL];
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      [v193 path];
      v173 = (MCMError *)objc_claimAutoreleasedReturnValue();
      v174 = -[MCMError containerRootURL](v225, "containerRootURL");
      [v174 path];
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v249 = v189;
      __int16 v250 = 2112;
      v251 = v173;
      __int16 v252 = 2112;
      uint64_t v253 = (uint64_t)v175;
      _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "Failed to replace: %@ with: %@ at: %@", buf, 0x20u);

      v24 = v203;
      v26 = v207;

      v25 = v214;
      v221 = v210;
      objc_super v15 = (MCMError *)v212;
    }

    else
    {
      v221 = v210;
      objc_super v15 = (MCMError *)v212;
      v25 = v214;
    }

    goto LABEL_37;
  }
  v155 = -[MCMCommand context](v2, "context");
  [v155 containerCache];
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v233[0] = v15;
  char v157 = [v156 removeContainerForUserIdentity:v226 contentClass:v211 identifier:v218 transient:v36 error:v233];
  id v158 = v233[0];

  if ((v157 & 1) == 0)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 46LL);

    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v24 = v203;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = v214;
      int v179 = -[MCMError transient](v214, "transient");
      *(_DWORD *)buf = 138412802;
      v249 = v218;
      __int16 v250 = 2048;
      v251 = (MCMError *)v211;
      __int16 v252 = 1024;
      LODWORD(v253) = v179;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to remove from cache id: %@, class: %ld, transient: %d",  buf,  0x1Cu);
      v221 = v210;
      v26 = v207;
      goto LABEL_37;
    }

    v221 = v210;
    v26 = v207;
LABEL_98:
    v25 = v214;
    goto LABEL_37;
  }

  -[MCMError metadataByChangingContainerPath:](v214, "metadataByChangingContainerPath:", v225);
  v25 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v159 = -[MCMCommand context](v2, "context");
  [v159 containerCache];
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  id v232 = v158;
  [v160 addContainerMetadata:v25 error:&v232];
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (MCMError *)v232;

  v24 = v203;
  if (!v161)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 45LL);

    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v26 = v207;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v181 = [v207 transient];
      *(_DWORD *)buf = 138412802;
      v249 = v25;
      __int16 v250 = 2112;
      v251 = v225;
      __int16 v252 = 1024;
      LODWORD(v253) = v181;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to add to cache: %@, url: %@, transient: %d",  buf,  0x1Cu);
    }

    v221 = v210;
    v6 = v205;
    v2 = v196;
    goto LABEL_37;
  }

  objc_super v15 = v162;
  v221 = v210;
  v6 = v205;
  v26 = v207;
  v2 = v196;
  if (!v205) {
    goto LABEL_75;
  }
LABEL_38:
  v213 = v25;
  v40 = v6;
  v41 = v5;
  v208 = v26;
  if (v229)
  {
    v199 = v4;
    v206 = v40;
    id v42 = containermanager_copy_global_configuration();
    char v43 = [v42 isGlobalContainerClass:v204];

    if ((v43 & 1) != 0) {
      v44 = 0LL;
    }
    else {
      v44 = v227;
    }
    v45 = v2;
    v46 = -[MCMCommand context](v2, "context");
    [v46 containerFactory];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = v15;
    char v48 = [v47 deleteURL:v229 forUserIdentity:v44 error:&v231];
    v49 = v231;

    if ((v48 & 1) == 0)
    {
      container_log_handle_for_category();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        [v229 path];
        v84 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v249 = v84;
        __int16 v250 = 2112;
        v251 = v49;
        _os_log_error_impl( &dword_188846000,  v50,  OS_LOG_TYPE_ERROR,  "Failed to remove staging dir: %@; error = %@",
          buf,
          0x16u);
      }

      v49 = 0LL;
    }

    v2 = v45;

    objc_super v15 = v49;
    v40 = v206;
    char v4 = v199;
    v41 = v5;
  }

  if (!v228)
  {
    v228 = 0LL;
    goto LABEL_51;
  }

  v195 = v2;
  v51 = -[MCMCommand context](v2, "context");
  [v51 containerFactory];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = v15;
  char v53 = [v52 deleteURL:v228 forUserIdentity:0 error:&v230];
  v14 = v230;

  if ((v53 & 1) == 0)
  {
    container_log_handle_for_category();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v26 = v208;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      [v228 path];
      v85 = (MCMError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v249 = v85;
      __int16 v250 = 2112;
      v251 = v14;
      _os_log_error_impl( &dword_188846000,  v54,  OS_LOG_TYPE_ERROR,  "Failed to remove replace file: %@; error = %@",
        buf,
        0x16u);
    }

    objc_super v15 = 0LL;
    v2 = v195;
    v5 = v41;
    v6 = v40;
    goto LABEL_70;
  }

  objc_super v15 = v14;
  v2 = v195;
LABEL_51:
  v26 = v208;
  v5 = v41;
  v6 = v40;
LABEL_71:
  if (-[MCMCommandReplaceContainer asyncReclaim](v2, "asyncReclaim"))
  {
    v66 = objc_alloc(&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace);
    v67 = -[MCMCommand context](v2, "context");
    v27 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:]( v66,  "initWithAsynchronously:context:resultPromise:",  1LL,  v67,  0LL);

    -[os_log_s execute](v27, "execute");
    v25 = v213;
LABEL_73:

    goto LABEL_75;
  }

  v25 = v213;
LABEL_75:
  if (v15)
  {

    v25 = 0LL;
  }

  container_log_handle_for_category();
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v249 = v15;
    _os_log_impl(&dword_188846000, v68, OS_LOG_TYPE_DEFAULT, "Replace; error = %@", buf, 0xCu);
  }

  v69 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
  if (v15) {
    uint64_t v70 = -[MCMResultBase initWithError:](v69, "initWithError:", v15);
  }
  else {
    uint64_t v70 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:]( v69,  "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:",  v25,  0LL,  1LL,  0LL,  0LL,  0LL);
  }
  v71 = (void *)v70;
  v72 = v25;
  v73 = -[MCMCommand resultPromise](v2, "resultPromise");
  [v73 completeWithResult:v71];

  objc_autoreleasePoolPop(context);
}

- (BOOL)_writeToDiskReplaceAt:(id)a3 old:(id)a4 withNew:(id)a5 usingStaging:(id)a6 toDestination:(id)a7 error:(id *)a8
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v19 = [v18 dataWritingOptionsForFileAtURL:v13];

  if (v14 && v15 && v16 && v17)
  {
    char v33 = a8;
    id v35 = v14;
    v38[0] = @"MCMReplaceOperationOldURL";
    [v14 path];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    v38[1] = @"MCMReplaceOperationNewURL";
    [v15 path];
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v21;
    v38[2] = @"MCMReplaceOperationStagingURL";
    [v16 path];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v22;
    v38[3] = @"MCMReplaceOperationDestURL";
    uint64_t v23 = [v17 path];
    v39[3] = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:4];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    id v37 = 0LL;
    LOBYTE(v23) = objc_msgSend(v24, "MCM_writeToURL:withOptions:error:", v13, v19, &v37);
    id v25 = v37;
    if ((v23 & 1) != 0)
    {
      v26 = 0LL;
      BOOL v27 = 1;
      id v14 = v35;
      goto LABEL_16;
    }

    v26 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v25,  v13,  86LL);
    container_log_handle_for_category();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      [v13 path];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v32;
      __int16 v42 = 2112;
      id v43 = v25;
      _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to write replace dictionary to URL %@; error = %@",
        buf,
        0x16u);
    }

    a8 = v33;
    id v14 = v35;
  }

  else
  {
    v26 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  33LL,  4LL);
    container_log_handle_for_category();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      [v14 path];
      unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 path];
      *(_DWORD *)buf = 138413058;
      v41 = v36;
      __int16 v42 = 2112;
      id v43 = v34;
      __int16 v44 = 2112;
      v45 = v30;
      v47 = __int16 v46 = 2112;
      v31 = (void *)v47;
      _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Invalid Replace File Info: old: %@, new: %@, staging: %@, dest: %@",  buf,  0x2Au);
    }

    v24 = 0LL;
    id v25 = 0LL;
  }

  if (a8)
  {
    v26 = v26;
    BOOL v27 = 0;
    *a8 = v26;
  }

  else
  {
    BOOL v27 = 0;
  }

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (BOOL)preserveOldPathIdentifier
{
  return self->_preserveOldPathIdentifier;
}

- (BOOL)preserveOldInternalUUID
{
  return self->_preserveOldInternalUUID;
}

- (BOOL)asyncReclaim
{
  return self->_asyncReclaim;
}

- (void).cxx_destruct
{
}

id __37__MCMCommandReplaceContainer_execute__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1895F89C0];
  v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to write metadata during replace: %@", *(void *)(a1 + 32)];
  v11[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMCommandReplaceContainer execute]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = &unk_18A2BE818;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v11[1] = @"SourceFileLine";
  v11[2] = v4;
  v12[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v2;
    _os_log_error_impl(&dword_188846000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"MCMErrorDomain",  objc_msgSend(*(id *)(a1 + 32), "type"),  v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)command
{
  return 2LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)recoverFromReplaceOperationsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = containermanager_copy_global_configuration();
  [v6 managedPathRegistry];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 containermanagerReplaceOperations];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 url];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v14 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  84LL,  1LL);
    container_log_handle_for_category();
    int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing replace operations.",  buf,  2u);
    }

    uint64_t v12 = 0LL;
    BOOL v40 = 0;
    id v13 = 0LL;
    goto LABEL_47;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v66 = 0LL;
  [v10 urlsForItemsInDirectoryAtURL:v9 error:&v66];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (MCMError *)v66;

  if (!v11)
  {
    v41 = -[MCMError domain](v12, "domain");
    if ([v41 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v42 = -[MCMError code](v12, "code");

      if (v42 == 2)
      {
        id v14 = 0LL;
        if (!a4) {
          goto LABEL_46;
        }
LABEL_45:
        id v14 = v14;
        *a4 = v14;
        goto LABEL_46;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v8 url];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 path];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v68 = v51;
      __int16 v69 = 2112;
      uint64_t v70 = v12;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to get items at replace URL %@ : %@",  buf,  0x16u);
    }

    goto LABEL_43;
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v13 = v11;
  uint64_t v62 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v74,  v73,  16LL);
  if (!v62)
  {
LABEL_43:
    id v14 = 0LL;
    goto LABEL_44;
  }

  v52 = v11;
  char v53 = a4;
  char v60 = v12;
  v54 = v9;
  v55 = v8;
  v56 = v5;
  char v57 = 0;
  id v14 = 0LL;
  uint64_t v61 = *(void *)v75;
  id v15 = a1;
  char v59 = v13;
  do
  {
    uint64_t v16 = 0LL;
    do
    {
      if (*(void *)v75 != v61) {
        objc_enumerationMutation(v13);
      }
      id v17 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
      v65 = v14;
      [v15 _readAndValidateReplaceFileAtUrl:v17 error:&v65];
      v18 = (MCMError *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = v65;

      container_log_handle_for_category();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      objc_super v21 = v20;
      if (!v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          [v17 path];
          id v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v37;
          __int16 v69 = 2112;
          uint64_t v70 = v19;
          _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Pending replace operation found, but not valid at [%@], ignoring: %@",  buf,  0x16u);
        }

        goto LABEL_15;
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        [v17 path];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = v18;
        _os_log_impl(&dword_188846000, v21, OS_LOG_TYPE_INFO, "Doing a replace of %@ with info: %@", buf, 0x16u);
      }

      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      objc_super v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationOldURL");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[os_log_s itemExistsAtURL:](v21, "itemExistsAtURL:", v23))
      {

LABEL_15:
        goto LABEL_16;
      }

      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationDestURL");
      char v29 = [v27 itemExistsAtURL:v28];

      if ((v29 & 1) != 0)
      {
        id v13 = v59;
      }

      else
      {
        container_log_handle_for_category();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationStagingURL");
          -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationOldURL");
          v32 = (MCMError *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v31;
          __int16 v69 = 2112;
          uint64_t v70 = v32;
          _os_log_impl( &dword_188846000,  v30,  OS_LOG_TYPE_INFO,  "Recovering from failed replace by moving: %@ to %@",  buf,  0x16u);
        }

        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        char v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationStagingURL");
        -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationOldURL");
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v64 = v60;
        char v36 = [v33 moveItemAtURL:v34 toURL:v35 error:&v64];
        uint64_t v12 = v64;

        if ((v36 & 1) == 0)
        {
          v45 = objc_alloc(&OBJC_CLASS___MCMError);
          -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationOldURL");
          __int16 v46 = (void *)objc_claimAutoreleasedReturnValue();
          id v14 = -[MCMError initWithNSError:url:defaultErrorType:]( v45,  "initWithNSError:url:defaultErrorType:",  v12,  v46,  35LL);

          container_log_handle_for_category();
          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          id v13 = v59;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            -[MCMError objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  @"MCMReplaceOperationStagingURL");
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"MCMReplaceOperationOldURL");
            uint64_t v48 = (MCMError *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v68 = v47;
            __int16 v69 = 2112;
            uint64_t v70 = v48;
            __int16 v71 = 2112;
            v72 = v12;
            _os_log_error_impl( &dword_188846000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to recover replace move: %@ to %@; error = %@",
              buf,
              0x20u);
          }

          goto LABEL_39;
        }

        char v57 = 1;
        char v60 = v12;
        id v15 = a1;
        id v13 = v59;
      }

+ (id)_readAndValidateReplaceFileAtUrl:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v52 = 0LL;
  objc_msgSend(MEMORY[0x189603FC8], "MCM_dictionaryWithContentsOfURL:options:error:", v5, 1, &v52);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v52;
  v50 = v7;
  v51 = v5;
  if (v6)
  {
    objc_opt_class();
    id v8 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }

    if (!v9)
    {
      uint64_t v10 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  35LL,  5LL);
      container_log_handle_for_category();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v8;
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, "Bad Data in replace file: %@", buf, 0xCu);
      }

      goto LABEL_23;
    }

    [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    if (!v14)
    {
LABEL_21:

LABEL_22:
      uint64_t v10 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  35LL,  5LL);
      container_log_handle_for_category();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
      char v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      id v54 = v12;
      __int16 v55 = 2112;
      v56 = v31;
      __int16 v57 = 2112;
      char v58 = v32;
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)v33;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@",  buf,  0x2Au);

LABEL_30:
      goto LABEL_23;
    }

    [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v16 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v16)
      {
LABEL_20:

        goto LABEL_21;
      }

      [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v18 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v18)
        {
          [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          id v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            id v21 = v20;
          }
          else {
            id v21 = 0LL;
          }

          if (v21)
          {
            v49 = a4;
            v34 = (void *)MEMORY[0x189604030];
            [v8 objectForKeyedSubscript:@"MCMReplaceOperationOldURL"];
            id v35 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 fileURLWithPath:v35 isDirectory:1];
            char v36 = (void *)objc_claimAutoreleasedReturnValue();

            id v37 = (void *)MEMORY[0x189604030];
            [v8 objectForKeyedSubscript:@"MCMReplaceOperationNewURL"];
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 fileURLWithPath:v38 isDirectory:1];
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            int v39 = (void *)MEMORY[0x189604030];
            [v8 objectForKeyedSubscript:@"MCMReplaceOperationStagingURL"];
            BOOL v40 = (void *)objc_claimAutoreleasedReturnValue();
            [v39 fileURLWithPath:v40 isDirectory:1];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = (void *)MEMORY[0x189604030];
            [v8 objectForKeyedSubscript:@"MCMReplaceOperationDestURL"];
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
            [v41 fileURLWithPath:v42 isDirectory:1];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            id v25 = v36;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!v25)
              {
LABEL_44:
                uint64_t v10 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  35LL,  5LL);
                container_log_handle_for_category();
                v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  [v25 path];
                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
                  [v24 path];
                  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue();
                  [v23 path];
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v46 = [v22 path];
                  *(_DWORD *)buf = 138413058;
                  id v54 = v48;
                  __int16 v55 = 2112;
                  v56 = v44;
                  __int16 v57 = 2112;
                  char v58 = v45;
                  __int16 v59 = 2112;
                  uint64_t v60 = v46;
                  uint64_t v47 = (void *)v46;
                  _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@",  buf,  0x2Au);
                }

                a4 = v49;
                goto LABEL_24;
              }

              objc_opt_class();
              id v28 = v24;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_42;
              }
              if (v28)
              {
                objc_opt_class();
                id v27 = v23;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (v27)
                  {
                    objc_opt_class();
                    id v26 = v22;
                    if ((objc_opt_isKindOfClass() & 1) != 0) {
                      id v43 = v26;
                    }
                    else {
                      id v43 = 0LL;
                    }

                    if (v43)
                    {
                      [v8 setObject:v25 forKeyedSubscript:@"MCMReplaceOperationOldURL"];
                      [v8 setObject:v28 forKeyedSubscript:@"MCMReplaceOperationNewURL"];
                      [v8 setObject:v27 forKeyedSubscript:@"MCMReplaceOperationStagingURL"];
                      [v8 setObject:v26 forKeyedSubscript:@"MCMReplaceOperationDestURL"];
                      uint64_t v10 = 0LL;
                      goto LABEL_28;
                    }

                    goto LABEL_44;
                  }
                }

                else
                {
                }

@end