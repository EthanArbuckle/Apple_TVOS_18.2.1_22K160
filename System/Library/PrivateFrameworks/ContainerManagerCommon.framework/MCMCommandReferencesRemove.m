@interface MCMCommandReferencesRemove
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesRemove)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesRemove

- (MCMCommandReferencesRemove)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandReferencesRemove;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_containerClass = [v8 containerClass];
    uint64_t v10 = [v8 ownerIdentifiers];
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    uint64_t v12 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_deleteDuringReconciliation = [v8 deleteDuringReconciliation];
    v9->_yesReallyApplyToAll = [v8 yesReallyApplyToAll];
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
  uint64_t v63 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  [MEMORY[0x189603FE0] set];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandReferencesRemove ownerIdentifiers](self, "ownerIdentifiers");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_2;
  }
  if (!-[MCMCommandReferencesRemove yesReallyApplyToAll](self, "yesReallyApplyToAll"))
  {
    container_log_handle_for_category();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v36, OS_LOG_TYPE_ERROR, "Owner identifiers must be specified", buf, 2u);
    }

    v7 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  38LL,  3LL);
    id v4 = 0LL;
    goto LABEL_37;
  }

  id v50 = 0LL;
  [(id)gCodeSigningMapping identifiersWithError:&v50];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v50;
  v27 = v26;
  if (!v4)
  {
    v7 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v26,  0LL,  66LL);

LABEL_37:
    v32 = -[MCMResultBase initWithError:]( objc_alloc(&OBJC_CLASS___MCMResultWithContainersArrayBase),  "initWithError:",  v7);
    goto LABEL_38;
  }

LABEL_2:
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v4 = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v59 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0LL;
    uint64_t v8 = *(void *)v60;
    v44 = v4;
    v45 = v3;
    uint64_t v43 = *(void *)v60;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v42 = v6;
      do
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v59 + 1) + 8 * v9);
        v11 = -[MCMCommandReferencesRemove groupIdentifiers](self, "groupIdentifiers");
        if (v11)
        {
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          -[MCMCommandReferencesRemove groupIdentifiers](self, "groupIdentifiers");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v53 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v41 = v9;
            uint64_t v15 = *(void *)v55;
            while (2)
            {
              uint64_t v16 = 0LL;
              v17 = v7;
              do
              {
                if (*(void *)v55 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * v16);
                v19 = (void *)gCodeSigningMapping;
                unint64_t v20 = -[MCMCommandReferencesRemove containerClass](self, "containerClass");
                v49 = v17;
                v47[0] = MEMORY[0x1895F87A8];
                v47[1] = 3221225472LL;
                v47[2] = __37__MCMCommandReferencesRemove_execute__block_invoke;
                v47[3] = &unk_18A29D060;
                id v48 = v46;
                LODWORD(v20) = [v19 removeGroupIdentifier:v18 forIdentifier:v10 containerClass:v20 error:&v49 reconcileHandler:v47];
                v7 = v49;

                if (!(_DWORD)v20)
                {

                  id v4 = v44;
                  v3 = v45;
                  goto LABEL_37;
                }

                ++v16;
                v17 = v7;
              }

              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v53 count:16];
              if (v14) {
                continue;
              }
              break;
            }

            id v4 = v44;
            v3 = v45;
            uint64_t v6 = v42;
            uint64_t v8 = v43;
            uint64_t v9 = v41;
          }

          else
          {
            uint64_t v6 = v42;
          }
        }

        else
        {
          id v21 = v4;
          v22 = v3;
          uint64_t v23 = v9;
          v24 = (void *)gCodeSigningMapping;
          [MEMORY[0x189604010] setWithObject:v10];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 removeCodeSigningDictionaryForIdentifiers:v25];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12) {
            [v46 unionSet:v12];
          }
          uint64_t v9 = v23;
          v3 = v22;
          id v4 = v21;
          uint64_t v8 = v43;
        }

        ++v9;
      }

      while (v9 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v59 objects:v58 count:16];
    }

    while (v6);
  }

  else
  {
    v7 = 0LL;
  }

  if (!-[MCMCommandReferencesRemove deleteDuringReconciliation](self, "deleteDuringReconciliation")) {
    goto LABEL_32;
  }
  if (![v46 count]) {
    goto LABEL_32;
  }
  v28 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
  [v46 allObjects];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MCMCommand context](self, "context");
  v31 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v29,  0LL,  v30,  v28);
  [v31 execute];
  -[MCMResultPromise result](v28, "result");
  v32 = (MCMResultWithContainersArrayBase *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
LABEL_32:
    v33 = objc_alloc(&OBJC_CLASS___MCMResultWithContainersArrayBase);
    v34 = -[MCMCommand context](self, "context");
    [v34 clientIdentity];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = 1;
    v32 = -[MCMResultWithContainersArrayBase initWithContainers:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:clientIdentity:skipSandboxExtensions:]( v33,  "initWithContainers:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:clientIdentity:ski pSandboxExtensions:",  MEMORY[0x189604A58],  1LL,  0LL,  0LL,  0LL,  v35,  v40);
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

uint64_t __37__MCMCommandReferencesRemove_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unionSet:a2];
}

+ (unint64_t)command
{
  return 49LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end