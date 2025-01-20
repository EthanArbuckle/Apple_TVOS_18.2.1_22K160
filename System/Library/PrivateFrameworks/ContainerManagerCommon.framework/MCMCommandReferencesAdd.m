@interface MCMCommandReferencesAdd
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesAdd)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (id)_resolveUserIdentity;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesAdd

- (MCMCommandReferencesAdd)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMCommandReferencesAdd;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_containerClass = [v8 containerClass];
    uint64_t v10 = [v8 ownerIdentifiers];
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    uint64_t v12 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_createDuringReconciliation = [v8 createDuringReconciliation];
    uint64_t v14 = [v8 userIdentity];
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v14;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToChangeReferences];

  return v4;
}

- (void)execute
{
  v2 = self;
  uint64_t v94 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  [MEMORY[0x189603FE0] set];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[MCMCommandReferencesAdd _resolveUserIdentity](v2, "_resolveUserIdentity");
  BOOL v64 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  -[MCMCommandReferencesAdd containerClass](v2, "containerClass"));
  uint64_t v5 = -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
  p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
  if (!v5) {
    goto LABEL_37;
  }
  v7 = (void *)v5;
  uint64_t v8 = -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
  if (!v8) {
    goto LABEL_36;
  }
  v9 = (void *)v8;
  -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v10 count])
  {

LABEL_36:
    p_info = &OBJC_METACLASS___MCMXPCMessageSetDataProtection.info;
    goto LABEL_37;
  }

  -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
  v68 = v2;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 count];

  v2 = v68;
  p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
  if (!v12)
  {
LABEL_37:
    container_log_handle_for_category();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v51 = -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
      uint64_t v52 = [v51 count];
      -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
      v53 = p_info;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v55 = [v54 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v91 = v52;
      __int16 v92 = 2048;
      uint64_t v93 = v55;
      _os_log_error_impl( &dword_188846000,  v45,  OS_LOG_TYPE_ERROR,  "Owner and group identifiers must be specified; owner cnt = %lu, group cnt = %lu",
        buf,
        0x16u);

      p_info = v53;
    }

    v15 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  38LL,  3LL);
    v44 = 0LL;
LABEL_40:
    uint64_t v46 = [objc_alloc((Class)p_info + 31) initWithError:v15];

    v44 = (void *)v46;
    goto LABEL_41;
  }

  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  v13 = -[MCMCommandReferencesAdd ownerIdentifiers](v68, "ownerIdentifiers");
  uint64_t v59 = [v13 countByEnumeratingWithState:&v86 objects:v85 count:16];
  char v14 = 0;
  v15 = 0LL;
  if (v59)
  {
    uint64_t v16 = *(void *)v87;
    v62 = v3;
    uint64_t v57 = *(void *)v87;
    v58 = v13;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v87 != v16)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(v13);
          uint64_t v17 = v18;
        }

        uint64_t v60 = v17;
        uint64_t v19 = *(void *)(*((void *)&v86 + 1) + 8 * v17);
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        v20 = -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
        uint64_t v21 = [v20 countByEnumeratingWithState:&v81 objects:v80 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          v23 = v4;
          uint64_t v24 = *(void *)v82;
          while (2)
          {
            uint64_t v25 = 0LL;
            v26 = v15;
            do
            {
              if (*(void *)v82 != v24) {
                objc_enumerationMutation(v20);
              }
              uint64_t v27 = *(void *)(*((void *)&v81 + 1) + 8 * v25);
              v28 = (void *)gCodeSigningMapping;
              uint64_t v29 = -[MCMCommandReferencesAdd containerClass](v68, "containerClass");
              v74 = v26;
              v70[0] = MEMORY[0x1895F87A8];
              v70[1] = 3221225472LL;
              v70[2] = __34__MCMCommandReferencesAdd_execute__block_invoke;
              v70[3] = &unk_18A29C9B0;
              id v71 = v66;
              BOOL v73 = v64;
              id v72 = v23;
              LODWORD(v27) = [v28 addGroupIdentifier:v27 forIdentifier:v19 containerClass:v29 error:&v74 reconcileHandler:v70];
              v15 = v74;

              if (!(_DWORD)v27)
              {

                v44 = 0LL;
                v3 = v62;
                char v4 = v23;
                v2 = v68;
                p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
                goto LABEL_40;
              }

              ++v25;
              v26 = v15;
            }

            while (v22 != v25);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v81 objects:v80 count:16];
            if (v22) {
              continue;
            }
            break;
          }

          char v14 = 1;
          v3 = v62;
          char v4 = v23;
          v2 = v68;
          v13 = v58;
        }

        uint64_t v17 = v60 + 1;
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
        uint64_t v16 = v57;
      }

      while (v60 + 1 != v59);
      uint64_t v59 = [v13 countByEnumeratingWithState:&v86 objects:v85 count:16];
    }

    while (v59);
  }

  if (-[MCMCommandReferencesAdd createDuringReconciliation](v2, "createDuringReconciliation")
    && [v4 count])
  {
    char v61 = v14;
    v63 = v3;
    v65 = v4;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v30 = v4;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v76 objects:v75 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v77;
      do
      {
        uint64_t v34 = 0LL;
        v35 = v15;
        do
        {
          if (*(void *)v77 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v36 = *(void *)(*((void *)&v76 + 1) + 8 * v34);
          v37 = -[MCMCommand context](v2, "context");
          [v37 containerFactory];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v35;
          [v38 containerForContainerIdentity:v36 createIfNecessary:1 error:&v69];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v69;

          [v39 metadataMinimal];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (([v40 existed] & 1) == 0) {
            [v67 addObject:v40];
          }

          ++v34;
          v35 = v15;
          v2 = v68;
        }

        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v76 objects:v75 count:16];
      }

      while (v32);
    }

    v3 = v63;
    char v4 = v65;
    p_info = &OBJC_METACLASS___MCMXPCMessageSetDataProtection.info;
    char v14 = v61;
  }

  id v41 = objc_alloc((Class)p_info + 31);
  v42 = -[MCMCommand context](v2, "context");
  [v42 clientIdentity];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v56) = 1;
  v44 = (void *)[v41 initWithContainers:v67 includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0 clientIdenti ty:v43 skipSandboxExtensions:v56];

  p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MCMXPCMessageSetDataProtection + 32);
  if ((v14 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_41:
  container_log_handle_for_category();
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v48 = [v67 count];
    [v44 error];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    uint64_t v91 = v48;
    __int16 v92 = 2112;
    uint64_t v93 = (uint64_t)v49;
    _os_log_impl( &dword_188846000,  v47,  OS_LOG_TYPE_DEFAULT,  "References add; created containers count = %lu, error = %@",
      buf,
      0x16u);
  }
  v50 = -[MCMCommand resultPromise](v2, "resultPromise");
  [v50 completeWithResult:v44];

  objc_autoreleasePoolPop(v3);
}

- (id)_resolveUserIdentity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 clientIdentity];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userIdentity];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommandReferencesAdd userIdentity](self, "userIdentity");
  if (v6)
  {
    -[MCMCommandReferencesAdd userIdentity](self, "userIdentity");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    uint64_t v8 = v7;
    goto LABEL_7;
  }

  if (([v5 isNoSpecificPersona] & 1) == 0)
  {
    id v7 = v5;
    goto LABEL_6;
  }

  uint64_t v8 = 0LL;
LABEL_7:

  return v8;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)createDuringReconciliation
{
  return self->_createDuringReconciliation;
}

- (BOOL)deleteDuringReconciliation
{
  return self->_deleteDuringReconciliation;
}

- (BOOL)yesReallyApplyToAll
{
  return self->_yesReallyApplyToAll;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
}

void __34__MCMCommandReferencesAdd_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(void *)(a1 + 32) && *(_BYTE *)(a1 + 48))
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v10 userIdentity];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v12 = [v11 isEqual:*(void *)(a1 + 32)];

          if (v12) {
            [*(id *)(a1 + 40) addObject:v10];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }

      while (v7);
    }
  }

  else
  {
    [*(id *)(a1 + 40) unionSet:v4];
  }
}

+ (unint64_t)command
{
  return 48LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end