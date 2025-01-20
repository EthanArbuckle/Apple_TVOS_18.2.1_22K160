@interface MCMCommandOperationDelete
+ (BOOL)deleteContainerRootURL:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 containerPathIdentifier:(id)a6 preferDirectDelete:(BOOL)a7 error:(id *)a8;
+ (Class)incomingMessageClass;
+ (id)commandForOperationDeleteWithContainerIdentities:(id)a3 removeAllCodeSignInfo:(BOOL)a4 context:(id)a5 resultPromise:(id)a6;
+ (unint64_t)command;
- (BOOL)_writeDeleteManifestsForItems:(id)a3 error:(id *)a4;
- (BOOL)preflightClientAllowed;
- (BOOL)removeAllCodeSignInfo;
- (BOOL)waitForDiskSpaceReclaim;
- (MCMCommandOperationDelete)initWithContainerIdentities:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandOperationDelete)initWithManifests:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7;
- (MCMCommandOperationDelete)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMXPCMessageOperationDelete)message;
- (NSArray)concreteContainerIdentities;
- (NSArray)containerIdentities;
- (NSMutableSet)manifests;
- (id)_codeSignIdentifiersToRemoveFor:(id)a3 amendingCumulativeIdentifiers:(id)a4;
- (id)_containerIdentities;
- (id)_containersToDeleteRecursivelyStartingWithContainerIdentities:(id)a3 error:(id *)a4;
- (id)_deleteItems:(id)a3 directDelete:(BOOL)a4 error:(id *)a5;
- (id)_deleteManifest:(id)a3;
- (id)_getManifestWithContainerIdentity:(id)a3;
- (id)_getOrCreateManifestWithContainerIdentity:(id)a3;
- (id)_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:(id)a3;
- (id)_initWithContainerIdentities:(id)a3 manifests:(id)a4 waitForDiskSpaceReclaim:(BOOL)a5 removeAllCodeSignInfo:(BOOL)a6 context:(id)a7 resultPromise:(id)a8;
- (id)_replyFromRelayToDaemonWithContainerIdentities:(id)a3;
- (void)_deleteManifestForContainerIdentity:(id)a3;
- (void)_relayContainerIdentities:(id)a3 andAmendResult:(id)a4;
- (void)_routeContainersToHandle:(id *)a3 toRelay:(id *)a4;
- (void)execute;
@end

@implementation MCMCommandOperationDelete

- (MCMCommandOperationDelete)initWithContainerIdentities:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)-[MCMCommandOperationDelete _initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:]( self,  "_initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSign Info:context:resultPromise:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (MCMCommandOperationDelete)initWithManifests:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)-[MCMCommandOperationDelete _initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:]( self,  "_initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSign Info:context:resultPromise:",  0LL,  a3,  a4,  a5,  a6,  a7);
}

- (id)_initWithContainerIdentities:(id)a3 manifests:(id)a4 waitForDiskSpaceReclaim:(BOOL)a5 removeAllCodeSignInfo:(BOOL)a6 context:(id)a7 resultPromise:(id)a8
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMCommandOperationDelete;
  v16 = -[MCMCommand initWithContext:resultPromise:](&v23, sel_initWithContext_resultPromise_, a7, a8);
  v17 = v16;
  if (v16)
  {
    if (v14) {
      v18 = v14;
    }
    else {
      v18 = (void *)MEMORY[0x189604A58];
    }
    objc_storeStrong((id *)&v16->_containerIdentities, v18);
    v19 = (void *)[v15 mutableCopy];
    v20 = v19;
    if (!v19)
    {
      [MEMORY[0x189603FE0] set];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_storeStrong((id *)&v17->_manifests, v20);
    if (!v19) {

    }
    v17->_removeAllCodeSignInfo = a6;
    v17->_waitForDiskSpaceReclaim = a5;
    message = v17->_message;
    v17->_message = 0LL;
  }

  return v17;
}

- (MCMCommandOperationDelete)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMCommandOperationDelete;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v16, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    uint64_t v11 = [v9 concreteContainerIdentities];
    containerIdentities = v10->_containerIdentities;
    v10->_containerIdentities = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x189603FE0] set];
    manifests = v10->_manifests;
    v10->_manifests = (NSMutableSet *)v13;

    v10->_removeAllCodeSignInfo = 0;
    v10->_waitForDiskSpaceReclaim = [v9 waitForDiskSpaceReclaim];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 codeSignInfo];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 entitlements];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v6 allowed])
  {
    BOOL v7 = 1;
  }

  else if ([v6 canDelete])
  {
    [v4 codeSignInfo];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 identifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v10 = -[MCMCommandOperationDelete containerIdentities](self, "containerIdentities");
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v22 = v4;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v15 identifier];
          objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
          char v17 = [v9 isEqualToString:v16];

          uint64_t v18 = [v15 containerClass];
          [v15 identifier];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          int v20 = [v6 isEntitledForLookupWithClass:v18 identifier:v19];

          if ((v17 & 1) == 0 && !v20)
          {
            BOOL v7 = 0;
            goto LABEL_16;
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }

      BOOL v7 = 1;
LABEL_16:
      v4 = v22;
    }

    else
    {
      BOOL v7 = 1;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)execute
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  id v54 = 0LL;
  id v55 = 0LL;
  -[MCMCommandOperationDelete _routeContainersToHandle:toRelay:](self, "_routeContainersToHandle:toRelay:", &v55, &v54);
  v3 = (MCMCommandOperationReclaimDiskSpace *)v55;
  id v47 = v54;
  v48 = v3;
  if (!-[MCMCommandOperationReclaimDiskSpace count](v3, "count"))
  {
    container_log_handle_for_category();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188846000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to delete locally", buf, 2u);
    }

    v5 = 0LL;
    id v9 = 0LL;
    goto LABEL_45;
  }

  container_log_handle_for_category();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v3;
    _os_log_impl(&dword_188846000, v4, OS_LOG_TYPE_DEFAULT, "Queueing containers for deletion: %@", buf, 0xCu);
  }

  id v53 = 0LL;
  -[MCMCommandOperationDelete _containersToDeleteRecursivelyStartingWithContainerIdentities:error:]( self,  "_containersToDeleteRecursivelyStartingWithContainerIdentities:error:",  v3,  &v53);
  v5 = (MCMCommandOperationReclaimDiskSpace *)objc_claimAutoreleasedReturnValue();
  v6 = (MCMCommandOperationReclaimDiskSpace *)v53;
  if (!v5)
  {
    container_log_handle_for_category();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v6;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v3;
      _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to collect identities for deletion; error = %@, staring set = %@",
        buf,
        0x16u);
    }

    id v9 = 0LL;
    v5 = 0LL;
    if (v6) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }

  if (!-[MCMCommandOperationReclaimDiskSpace count](v5, "count"))
  {
    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v3;
      _os_log_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEFAULT,  "Collected zero identities for deletion; starting set = %@",
        buf,
        0xCu);
    }

    id v9 = 0LL;
    if (v6) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }

  -[MCMCommandOperationDelete manifests](self, "manifests");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 count])
  {

LABEL_22:
    BOOL v15 = 0LL;
    goto LABEL_23;
  }

  BOOL v12 = (unint64_t)-[MCMCommandOperationReclaimDiskSpace count](v5, "count") > 1;

  if (!v12) {
    goto LABEL_22;
  }
  v52 = v6;
  BOOL v13 = -[MCMCommandOperationDelete _writeDeleteManifestsForItems:error:]( self,  "_writeDeleteManifestsForItems:error:",  v5,  &v52);
  id v14 = v52;

  if (!v13)
  {
    if (-[MCMCommandOperationReclaimDiskSpace category](v14, "category") != 1
      || -[MCMCommandOperationReclaimDiskSpace POSIXerrno](v14, "POSIXerrno") != 28)
    {
      container_log_handle_for_category();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v14;
        __int16 v63 = 2112;
        uint64_t v64 = (uint64_t)v5;
        _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Failed to write manifest for deletion; error = %@, containers = %@",
          buf,
          0x16u);
      }

      goto LABEL_34;
    }

    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v5;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to write manifest for deletion because ENOSPC, ignoring and enabling direct delete; containers = %@",
        buf,
        0xCu);
    }

    id v14 = 0LL;
  }

  BOOL v15 = !v13;
  v6 = v14;
LABEL_23:
  container_log_handle_for_category();
  objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v5;
    _os_log_impl(&dword_188846000, v16, OS_LOG_TYPE_DEFAULT, "Deleting containers: %@", buf, 0xCu);
  }

  v51 = v6;
  -[MCMCommandOperationDelete _deleteItems:directDelete:error:](self, "_deleteItems:directDelete:error:", v5, v15, &v51);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v51;

  if (!v9)
  {
    container_log_handle_for_category();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v5;
      _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to delete containers; error = %@, containers = %@",
        buf,
        0x16u);
    }

LABEL_34:
    id v9 = 0LL;
    goto LABEL_35;
  }

  if (![v9 count])
  {
    container_log_handle_for_category();
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v5;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Deleted zero containers; error = %@, containers = %@",
        buf,
        0x16u);
    }
  }

- (void)_relayContainerIdentities:(id)a3 andAmendResult:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    -[MCMCommandOperationDelete _replyFromRelayToDaemonWithContainerIdentities:]( self,  "_replyFromRelayToDaemonWithContainerIdentities:",  v8);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      [v6 mergeWithXPCResult:v7];
    }
  }
}

- (void)_routeContainersToHandle:(id *)a3 toRelay:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v4 = -[MCMCommandOperationDelete _containerIdentities](self, "_containerIdentities");
  v5 = (void *)objc_opt_new();
  id v6 = (void *)objc_opt_new();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v13 = [v12 disposition];
        if (v13)
        {
          if (v13 == 2)
          {
            id v14 = v6;
          }

          else
          {
            if (v13 != 1) {
              continue;
            }
            id v14 = v5;
          }

          [v14 addObject:v12];
        }

        else
        {
          container_log_handle_for_category();
          BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            -[MCMCommand context](self, "context");
            objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 clientIdentity];
            char v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v12;
            __int16 v23 = 2112;
            __int128 v24 = v17;
            _os_log_fault_impl( &dword_188846000,  v15,  OS_LOG_TYPE_FAULT,  "Attempt to delete container for different user or container class not supported, ignored: %@; client: %@",
              buf,
              0x16u);
          }
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }

    while (v9);
  }

  if (a3) {
    *a3 = (id)[v5 copy];
  }
  if (a4) {
    *a4 = (id)[v6 copy];
  }
}

- (id)_replyFromRelayToDaemonWithContainerIdentities:(id)a3
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __s[1] = 0LL;
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v77 objects:v76 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v78;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v78 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v11 = v10;
          *(void *)v48 = 1LL;
          uint64_t v12 = [v11 createLibsystemContainerWithError:v48];
          if (v12)
          {
            uint64_t v13 = v12;
            id v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
            container_xpc_encode_container_object();
            xpc_array_append_value(v4, v14);
            MEMORY[0x1895CDD90](v13);
          }

          else
          {
            container_log_handle_for_category();
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = *(void *)v48;
              uint64_t error_description = container_get_error_description();
              *(_DWORD *)buf = 138412802;
              *(void *)&v68[0] = v11;
              WORD4(v68[0]) = 2048;
              *(void *)((char *)v68 + 10) = v15;
              WORD1(v68[1]) = 2080;
              *(void *)((char *)&v68[1] + 4) = error_description;
              _os_log_error_impl( &dword_188846000,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "Could not allocate container object for delete relay using %@: (%llu) %s",  buf,  0x20u);
            }
          }
        }

        else
        {
          container_log_handle_for_category();
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&v68[0] = v10;
            _os_log_fault_impl( &dword_188846000,  (os_log_t)v11,  OS_LOG_TYPE_FAULT,  "Non-libsystem identity encountered when constructing delete relay: %@",  buf,  0xCu);
          }
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v77 objects:v76 count:16];
    }

    while (v7);
  }

  char v17 = self;
  uint64_t v18 = -[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim");
  xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v19, "Command", 3uLL);
  xpc_dictionary_set_uint64(v19, "Flags", v18);
  xpc_dictionary_set_value(v19, "ContainersArray", v4);
  container_log_handle_for_category();
  int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    v22 = (void *)MEMORY[0x1895CEAE0](v19);
    __s[0] = v22;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v73 = 0u;
    int current_persona_originator_info = voucher_get_current_persona_originator_info();
    int v45 = DWORD2(v73);
    int v43 = DWORD1(v74);
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v70 = 0u;
    int current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    int v40 = DWORD1(v71);
    int v41 = DWORD2(v70);
    uint64_t v69 = 0LL;
    memset(v68, 0, sizeof(v68));
    *(_DWORD *)buf = 2;
    int current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      v39 = "<unknown>";
      __int128 v26 = "NOPERSONA";
    }

    else
    {
      else {
        __int128 v26 = off_18A29C8F8[DWORD1(v68[0]) - 2];
      }
      v39 = (char *)&v68[5] + 4;
    }

    container_log_handle_for_category();
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = v43 & ~(current_persona_originator_info >> 31);
      int v28 = v45 & ~(current_persona_originator_info >> 31);
      int v46 = v40 & ~(current_persona_proximate_info >> 31);
      int v29 = v41 & ~(current_persona_proximate_info >> 31);
      uid_t v30 = geteuid();
      uid_t v31 = getuid();
      *(_DWORD *)v48 = 67111427;
      *(_DWORD *)&v48[4] = current_persona;
      __int16 v49 = 2082;
      v50 = v26;
      __int16 v51 = 2082;
      v52 = v39;
      __int16 v53 = 1024;
      int v54 = v28;
      __int16 v55 = 1024;
      int v56 = v44;
      char v17 = self;
      __int16 v57 = 1024;
      int v58 = v29;
      __int16 v59 = 1024;
      int v60 = v46;
      __int16 v61 = 1024;
      uid_t v62 = v30;
      __int16 v63 = 1024;
      uid_t v64 = v31;
      __int16 v65 = 2081;
      v66 = v22;
      _os_log_impl( &dword_188846000,  v27,  OS_LOG_TYPE_DEFAULT,  "Container delete; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proxi"
        "mate [pid = %d, personaid = %d], euid = %d, uid = %d, message = %{private}s",
        v48,
        0x4Au);
    }

    if (v22)
    {
      free(v22);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }

  *(void *)v48 = 1LL;
  container_xpc_set_use_shared_connection();
  v32 = -[MCMCommand context](v17, "context");
  [v32 clientIdentity];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 createLibsystemClient];

  v34 = (void *)container_client_copy_encoded_xpc_object();
  if (v34)
  {
    v35 = 0LL;
    if (*(void *)v48 == 1LL)
    {
      xpc_dictionary_set_value(v19, "ProxyForClient", v34);
      v35 = (void *)container_xpc_send_sync_message();
    }
  }

  else
  {
    v35 = 0LL;
  }

  v36 = (void *)container_error_copy_unlocalized_description();
  *(void *)&__int128 v73 = v36;
  container_log_handle_for_category();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&v68[0] = v36;
    _os_log_impl(&dword_188846000, v37, OS_LOG_TYPE_DEFAULT, "Delete relay response: %s", buf, 0xCu);
  }

  if (v36)
  {
    free(v36);
    memset_s(&v73, 8uLL, 0, 8uLL);
  }

  container_free_client();
  container_error_free();

  return v35;
}

- (id)_containerIdentities
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[MCMCommandOperationDelete containerIdentities](self, "containerIdentities");
  xpc_object_t v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x189604A58];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  [MEMORY[0x189603FE0] setWithArray:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v12) concreteContainerIdentity];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addObject:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }

    while (v10);
  }

  id v14 = (void *)[v7 copy];
  return v14;
}

- (id)_codeSignIdentifiersToRemoveFor:(id)a3 amendingCumulativeIdentifiers:(id)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 containerClass];
  if (v8 > 0xB || ((1LL << v8) & 0xED4) == 0)
  {
    id v11 = 0LL;
LABEL_19:
    uint64_t v12 = 0LL;
    goto LABEL_29;
  }

  uint64_t v10 = [v6 containerClass];
  id v11 = 0LL;
  uint64_t v12 = 0LL;
  if (v10 != 7 && v10 != 13)
  {
    -[MCMCommand context](self, "context");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 containerCache];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 containerIdentity];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v14 countContainersForOtherUserIdentitiesWithIdentity:v15 error:0];

    id v11 = 0LL;
    uint64_t v12 = 0LL;
    if (!v16)
    {
      __int128 v17 = (void *)MEMORY[0x189603FE0];
      [v6 identifier];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setWithObject:v18];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      [(id)gCodeSigningMapping childParentMapCache];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 identifier];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 childBundleIdentifiersForParentIdentifier:v20];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21) {
        [v12 unionSet:v21];
      }

      if (!v12)
      {
        id v11 = 0LL;
        goto LABEL_29;
      }

      if ([v6 transient])
      {
        uint64_t v43 = 1LL;
        [v6 userIdentity];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 identifier];
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 containerIdentity];
        int v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 containerConfig];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = [v6 platform];
        -[MCMCommand context](self, "context");
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 userIdentityCache];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v22,  v23,  v24,  v25,  0LL,  v27,  &v43);
        int v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[MCMCommand context](self, "context");
          int v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 containerCache];
          uid_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          id v42 = 0LL;
          [v30 entryForContainerIdentity:v28 error:&v42];
          uid_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          id v32 = v42;

          if (v31)
          {
            id v41 = v32;
            [v31 metadataWithError:&v41];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            id v11 = v41;

            if (v33)
            {
              container_log_handle_for_category();
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                [v6 identifier];
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                int v45 = v35;
                __int16 v46 = 2112;
                uint64_t v47 = 0LL;
                _os_log_impl( &dword_188846000,  v34,  OS_LOG_TYPE_DEFAULT,  "Skipping removal of code sign mapping since container to be deleted [%@] is transient and there's a pe rmanent one; error = %@",
                  buf,
                  0x16u);
              }

              goto LABEL_19;
            }
          }

          else
          {
            id v11 = v32;
          }

          goto LABEL_27;
        }

        container_log_handle_for_category();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          [v6 shortDescription];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          int v45 = v39;
          __int16 v46 = 2048;
          uint64_t v47 = v43;
          _os_log_error_impl( &dword_188846000,  v36,  OS_LOG_TYPE_ERROR,  "Could not construct container identity from %@ to check for permanent copy: %llu",  buf,  0x16u);
        }
      }

      id v11 = 0LL;
LABEL_27:
      if ([v12 count]) {
        [v7 unionSet:v12];
      }
    }
  }

- (id)_containersToDeleteRecursivelyStartingWithContainerIdentities:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 allObjects];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = (void *)[v7 mutableCopy];

  v34 = v5;
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  v37 = v9;
  v35 = self;
  while (1)
  {
    [v8 lastObject];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 removeLastObject];
    if (v10)
    {
      do
      {
        [v10 containerIdentity];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v9 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          [v10 containerIdentity];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 addObject:v13];

          -[MCMCommand context](self, "context");
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 containerCache];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v40 = 0LL;
          [v15 entryForContainerIdentity:v10 error:&v40];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          id v39 = v40;

          if (v16 && ([v16 metadataMinimal], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            __int128 v18 = (void *)v17;
            -[MCMCommandOperationDelete _codeSignIdentifiersToRemoveFor:amendingCumulativeIdentifiers:]( self,  "_codeSignIdentifiersToRemoveFor:amendingCumulativeIdentifiers:",  v17,  v38);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 containerIdentity];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMCommandOperationDelete _getOrCreateManifestWithContainerIdentity:]( self,  "_getOrCreateManifestWithContainerIdentity:",  v20);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

            do
            {
              v22 = -[MCMCommandOperationDeleteItem initWithCacheEntry:codeSignIdentifiersToRemove:manifest:]( objc_alloc(&OBJC_CLASS___MCMCommandOperationDeleteItem),  "initWithCacheEntry:codeSignIdentifiersToRemove:manifest:",  v16,  v19,  v21);
              if (v22)
              {
                [v6 addObject:v22];
              }

              else
              {
                container_log_handle_for_category();
                __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  [v18 shortDescription];
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  id v42 = v25;
                  _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Could not create delete item; metadata = %@",
                    buf,
                    0xCu);
                }
              }

              uint64_t v24 = [v16 next];

              uint64_t v16 = (void *)v24;
            }

            while (v24);

            self = v35;
            unint64_t v8 = v36;
            uint64_t v9 = v37;
            __int128 v27 = v39;
          }

          else
          {
            container_log_handle_for_category();
            __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            __int128 v27 = v39;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v39;
              __int16 v43 = 2112;
              int v44 = v10;
              _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Could not find container from container identity queued for delete; error = %@, identity = %@",
                buf,
                0x16u);
            }

            if ([v39 type] == 21) {
              -[MCMCommandOperationDelete _deleteManifestForContainerIdentity:]( self,  "_deleteManifestForContainerIdentity:",  v10);
            }
          }
        }

        uint64_t v28 = [v8 lastObject];

        [v8 removeLastObject];
        uint64_t v10 = (void *)v28;
      }

      while (v28);
    }

    if (!v38)
    {
      uid_t v30 = 0LL;
      goto LABEL_28;
    }

    if (![v38 count]) {
      break;
    }
    -[MCMCommandOperationDelete _groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:]( self,  "_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:",  v38);
    int v29 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    uid_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29 || ![v29 count])
    {

      goto LABEL_28;
    }

    [v29 allObjects];
    uid_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObjectsFromArray:v31];

    uint64_t v9 = v37;
    BOOL v38 = v30;
  }

  uid_t v30 = v38;
LABEL_28:
  id v32 = (void *)[v6 copy];

  return v32;
}

- (id)_deleteItems:(id)a3 directDelete:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = a4;
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  -[MCMCommand context](self, "context");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 clientIdentity];
  __int16 v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1895CE3A8]();
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id obj = v7;
  uint64_t v56 = [obj countByEnumeratingWithState:&v72 objects:v71 count:16];
  if (v56)
  {
    v50 = self;
    id v9 = 0LL;
    uint64_t v55 = *(void *)v73;
    unsigned int v51 = v5;
    while (1)
    {
      for (uint64_t i = 0LL; i != v56; ++i)
      {
        if (*(void *)v73 != v55) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        objc_msgSend(v11, "cacheEntry", context);
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 containerPath];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 identifier];
        int v60 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 userIdentity];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v13 containerPathIdentifier];
        uint64_t v16 = [v13 containerClass];
        uint64_t v17 = [v13 containerRootURL];
        [v12 containerIdentity];
        int v58 = (void *)v15;
        __int16 v59 = (void *)objc_claimAutoreleasedReturnValue();
        id v62 = v9;
        __int16 v57 = (void *)v17;
        LODWORD(v15) = +[MCMCommandOperationDelete deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:]( &OBJC_CLASS___MCMCommandOperationDelete,  "deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:",  v17,  v14,  v16,  v15,  v5,  &v62);
        uint64_t v18 = v5;
        id v19 = v62;

        if (!(_DWORD)v15)
        {
          id v9 = v19;
LABEL_24:
          uint64_t v5 = v18;
          goto LABEL_28;
        }

        int v54 = v19;
        container_log_handle_for_category();
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          [v57 path];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          uid_t v64 = v21;
          __int16 v65 = 2112;
          id v66 = v59;
          _os_log_impl(&dword_188846000, v20, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] %@", buf, 0x16u);
        }

        container_log_handle_for_category();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          [v49 codeSignInfo];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [v23 identifier];
          uint64_t v25 = (void *)v24;
          *(_DWORD *)buf = 138478595;
          __int128 v26 = @"<unknown>";
          if (v24) {
            __int128 v26 = (const __CFString *)v24;
          }
          uid_t v64 = v58;
          __int16 v65 = 2113;
          id v66 = v60;
          __int16 v67 = 2050;
          uint64_t v68 = v16;
          __int16 v69 = 2113;
          __int128 v70 = v26;
          _os_signpost_emit_with_name_impl( &dword_188846000,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "DeletedContainer",  " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  c lass=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ",  buf,  0x2Au);
        }

        [v52 addObject:v12];
        uint64_t v27 = [v11 codeSignIdentifiersToRemove];
        if (v27)
        {
          uint64_t v28 = (void *)v27;
          [v11 codeSignIdentifiersToRemove];
          int v29 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v29 count];

          if (v30)
          {
            container_log_handle_for_category();
            uid_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              [v11 codeSignIdentifiersToRemove];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              uid_t v64 = v32;
              _os_log_impl(&dword_188846000, v31, OS_LOG_TYPE_DEFAULT, "Removing codesign info for [%@]", buf, 0xCu);
            }

            v33 = (void *)gCodeSigningMapping;
            [v11 codeSignIdentifiersToRemove];
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            id v35 = (id)[v33 removeCodeSigningDictionaryForIdentifiers:v34];
          }
        }

        [v11 manifest];
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          [v11 manifest];
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v38 = v50;
          id v39 = -[MCMCommandOperationDelete _deleteManifest:](v50, "_deleteManifest:", v37);
        }

        else
        {
          container_log_handle_for_category();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v38 = v50;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            [v12 containerIdentity];
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            uid_t v64 = v45;
            _os_log_debug_impl( &dword_188846000,  v37,  OS_LOG_TYPE_DEBUG,  "No delete manifest URL; identity = %@",
              buf,
              0xCu);
          }
        }

        uint64_t v18 = v51;

        -[MCMCommand context](v38, "context");
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 containerCache];
        id v41 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = [v13 transient];
        id v61 = 0LL;
        char v43 = [v41 removeContainerForUserIdentity:v14 contentClass:v16 identifier:v60 transient:v42 error:&v61];
        id v9 = v61;

        if ((v43 & 1) != 0) {
          goto LABEL_24;
        }
        container_log_handle_for_category();
        int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v5 = v51;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uid_t v64 = v59;
          __int16 v65 = 2112;
          id v66 = v9;
          _os_log_error_impl( &dword_188846000,  v44,  OS_LOG_TYPE_ERROR,  "Failed to remove from cache %@; error = %@",
            buf,
            0x16u);
        }

        id v9 = 0LL;
LABEL_28:
      }

      uint64_t v56 = [obj countByEnumeratingWithState:&v72 objects:v71 count:16];
      if (!v56) {
        goto LABEL_32;
      }
    }
  }

  id v9 = 0LL;
LABEL_32:

  objc_autoreleasePoolPop(context);
  if (a5 && v9) {
    *a5 = v9;
  }

  return v52;
}

- (id)_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v25 = (void *)objc_opt_new();
  uint64_t v5 = (void *)[(id)gCodeSigningMapping copyReferenceCountSetForContainerClass:7];
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v42;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * v6);
        [(id)gCodeSigningMapping groupContainerIdentifiersAssociatedWithIdentifier:v7 containerClass:7];
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              [v5 removeObject:v13];
              uint64_t v14 = [v5 countForObject:v13];
              if (v14)
              {
                uint64_t v15 = v14;
                container_log_handle_for_category();
                uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v30 = v13;
                  __int16 v31 = 2048;
                  uint64_t v32 = v15;
                  __int16 v33 = 2112;
                  uint64_t v34 = v7;
                  _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_INFO,  "Ref count for [%@] will reach %lu after removing [%@]",  buf,  0x20u);
                }
              }

              else
              {
                -[MCMCommand context](self, "context");
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                [v17 userIdentityCache];
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                v26[0] = MEMORY[0x1895F87A8];
                v26[1] = 3221225472LL;
                v26[2] = __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke;
                v26[3] = &unk_18A29C8D8;
                v26[4] = self;
                v26[5] = v13;
                uint64_t v28 = 7LL;
                v26[6] = v7;
                id v27 = v25;
                [v18 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v26];
              }
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v35 count:16];
          }

          while (v10);
        }

        uint64_t v6 = v24 + 1;
      }

      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
    }

    while (v23);
  }

  id v19 = (void *)[v25 copy];
  return v19;
}

- (id)_getManifestWithContainerIdentity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        [v9 concreteContainerIdentity];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqualToContainerIdentity:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_getOrCreateManifestWithContainerIdentity:(id)a3
{
  id v4 = a3;
  -[MCMCommandOperationDelete _getManifestWithContainerIdentity:](self, "_getManifestWithContainerIdentity:", v4);
  uint64_t v5 = (MCMDeleteManifest *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___MCMDeleteManifest);
    -[MCMCommand context](self, "context");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 userIdentityCache];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = -[MCMDeleteManifest initWithConcreteContainerIdentity:userIdentityCache:]( v6,  "initWithConcreteContainerIdentity:userIdentityCache:",  v4,  v8);
  }

  return v5;
}

- (id)_deleteManifest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMCommand context](self, "context");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 userIdentityCache];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 concreteContainerIdentity];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 userIdentity];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 libraryRepairForUserIdentity:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = 0LL;
  [v4 deleteManifestAfterRemovingUsingLibraryRepairForUser:v9 error:&v15];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v15;
  if (!v10)
  {
    container_log_handle_for_category();
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v4 concreteContainerIdentity];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_error_impl( &dword_188846000,  v12,  OS_LOG_TYPE_ERROR,  "Could not remove delete manifest; error = %@, identity = %@",
        buf,
        0x16u);
    }
  }

  return v10;
}

- (void)_deleteManifestForContainerIdentity:(id)a3
{
  id v9 = a3;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCMCommandOperationDelete _getManifestWithContainerIdentity:](self, "_getManifestWithContainerIdentity:", v9);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[MCMCommandOperationDelete _deleteManifest:](self, "_deleteManifest:", v6);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[MCMCommandOperationDelete manifests](self, "manifests");
          unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 removeObject:v6];
        }
      }
    }
  }
}

- (BOOL)_writeDeleteManifestsForItems:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    __int128 v26 = a4;
    id obj = v5;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v36;
    while (2)
    {
      uint64_t v10 = 0LL;
      id v11 = v8;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        objc_msgSend(v12, "cacheEntry", v26);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 containerPath];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 userIdentity];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMCommand context](self, "context");
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 userIdentityCache];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 libraryRepairForUserIdentity:v15];
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();

        [v12 manifest];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = v11;
        [v19 deleteManifestAfterWritingUsingLibraryRepairForUser:v18 error:&v29];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v8 = v29;

        BOOL v21 = v20 != 0LL;
        if (!v20)
        {
          container_log_handle_for_category();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            [v12 cacheEntry];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 containerIdentity];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            id v31 = v8;
            __int16 v32 = 2112;
            __int16 v33 = v25;
            _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "Failed to write delete manifest; error = %@, identity = %@",
              buf,
              0x16u);
          }

          id v5 = obj;
          goto LABEL_13;
        }

        [v12 setManifest:v20];

        ++v10;
        id v11 = v8;
      }

      while (v7 != v10);
      id v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (BOOL)waitForDiskSpaceReclaim
{
  return self->_waitForDiskSpaceReclaim;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (BOOL)removeAllCodeSignInfo
{
  return self->_removeAllCodeSignInfo;
}

- (MCMXPCMessageOperationDelete)message
{
  return self->_message;
}

- (NSMutableSet)manifests
{
  return self->_manifests;
}

- (void).cxx_destruct
{
}

void __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [*(id *)(a1 + 32) context];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 globalConfiguration];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 staticConfig];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 configForContainerClass:*(void *)(a1 + 64)];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = 1LL;
  uint64_t v8 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) context];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 userIdentityCache];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v3,  v8,  v7,  0LL,  0LL,  v10,  &v20);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      [v3 shortDescription];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v16;
      _os_log_impl( &dword_188846000,  v13,  OS_LOG_TYPE_DEFAULT,  "Ref count for [%@] will reach zero after removing [%@]; queueing ui=%@ for delete.",
        buf,
        0x20u);
    }

    [*(id *)(a1 + 56) addObject:v11];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = v20;
      uint64_t error_description = container_get_error_description();
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      uint64_t v26 = error_description;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Could not generate identity for [%@] during group reconciliation; error = (%llu) %s",
        buf,
        0x20u);
    }
  }
}

id __36__MCMCommandOperationDelete_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) waitForDiskSpaceReclaim])
  {
    [*(id *)(a1 + 32) resultPromise];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 completeWithResult:*(void *)(a1 + 40)];
  }

  return v3;
}

+ (id)commandForOperationDeleteWithContainerIdentities:(id)a3 removeAllCodeSignInfo:(BOOL)a4 context:(id)a5 resultPromise:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithContainerIdentities:v12 waitForDiskSpaceReclaim:0 removeAllCodeSignInfo:v7 context:v11 resultPromise:v10];

  return v13;
}

+ (BOOL)deleteContainerRootURL:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 containerPathIdentifier:(id)a6 preferDirectDelete:(BOOL)a7 error:(id *)a8
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    __int128 v16 = 0LL;
LABEL_17:
    id v26 = 0LL;
    goto LABEL_18;
  }

  id v41 = v14;
  id v17 = v13;
  uint64_t v18 = a8;
  id v19 = v17;
  +[MCMContainerClassDeletedPath containerPathForUserIdentity:containerClass:]( &OBJC_CLASS___MCMContainerClassDeletedPath,  "containerPathForUserIdentity:containerClass:");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v45 = 0LL;
  char v21 = [v20 createIfNecessaryWithError:&v45];
  id v22 = v45;
  if ((v21 & 1) == 0)
  {
    container_log_handle_for_category();
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v22;
      __int16 v48 = 2112;
      id v49 = v20;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to create deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    id v22 = 0LL;
  }

  [v20 classURL];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v44 = v22;
  [v15 createTemporaryDirectoryInDirectoryURL:v24 withNamePrefix:@"deleting." error:&v44];
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = v44;

  if (v25)
  {
    char v27 = v21 ^ 1;
    a8 = v18;
  }

  else
  {
    container_log_handle_for_category();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    a8 = v18;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v26;
      __int16 v48 = 2112;
      id v49 = v20;
      _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to create unique deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    id v26 = 0LL;
    char v27 = 1;
  }

  id v13 = v19;
  id v14 = v41;
  [v25 URLByAppendingPathComponent:v41 isDirectory:1];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v27 & 1) == 0)
  {
    id v43 = v26;
    char v29 = [v15 moveItemAtURL:v12 toURL:v16 error:&v43];
    id v30 = v43;

    if ((v29 & 1) != 0)
    {
LABEL_19:
      __int16 v33 = 0LL;
      BOOL v34 = 1;
      goto LABEL_25;
    }

    container_log_handle_for_category();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      [v12 path];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      id v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v47 = v39;
      __int16 v48 = 2112;
      id v49 = v40;
      __int16 v50 = 2112;
      id v51 = v30;
      _os_log_error_impl( &dword_188846000,  v31,  OS_LOG_TYPE_ERROR,  "Couldn't stage for deletion from [%@] to [%@]; trying a direct delete instead: %@",
        buf,
        0x20u);
    }

    goto LABEL_17;
  }

+ (unint64_t)command
{
  return 3LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end