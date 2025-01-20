@interface MCMCommandQuery
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_executeQueryPlan:(id)a3 resultContainers:(id)a4 error:(id *)a5;
- (BOOL)createIfNecessary;
- (BOOL)expectSingleResult;
- (BOOL)extensionsPolicyUsesProxiedClient;
- (BOOL)extensionsUseProxiedClient;
- (BOOL)fuzzyMatchInternalUUID;
- (BOOL)fuzzyMatchTransient;
- (BOOL)includeCreator;
- (BOOL)includeInfoInResult;
- (BOOL)includePathInResult;
- (BOOL)includeUnowned;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)issueSandboxExtensions;
- (BOOL)legacyExtensionPolicy;
- (BOOL)legacyPersonaPolicy;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCommandQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)identifiers;
- (NSUUID)internalUUID;
- (id)_containerIdentifiersIncludingUnownedForContainerClass:(unint64_t)a3 canAccessAllContainers:(BOOL *)a4 error:(id *)a5;
- (id)_executeQueryForContainerIdentity:(id)a3 error:(id *)a4;
- (id)_queryPlanWithIdentifiers:(id)a3 isGroupClass:(BOOL)a4 clientIdentity:(id)a5 error:(id *)a6;
- (id)_setOfUserIdentities;
- (id)_setOfUserIdentitiesForIdentifiers:(id)a3 isGroupClass:(BOOL)a4;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)expectedPersonaKernelID;
- (unsigned)platform;
- (unsigned)uid;
- (void)_finalizeWithContainers:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation MCMCommandQuery

- (MCMCommandQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCMCommandQuery;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v21, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_platform = [v8 platform];
    v9->_explicitFlags = [v8 explicitFlags];
    uint64_t v10 = [v8 identifiers];
    identifiers = v9->_identifiers;
    v9->_identifiers = (NSSet *)v10;

    uint64_t v12 = [v8 containerConfig];
    containerConfig = v9->_containerConfig;
    v9->_containerConfig = (MCMContainerConfiguration *)v12;

    uint64_t v14 = [v8 groupIdentifiers];
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v14;

    uint64_t v16 = [v8 internalUUID];
    internalUUID = v9->_internalUUID;
    v9->_internalUUID = (NSUUID *)v16;

    v9->_extensionsUseProxiedClient = [v8 extensionsUseProxiedClient];
    v9->_extensionsPolicyUsesProxiedClient = [v8 extensionsPolicyUsesProxiedClient];
    v9->_createIfNecessary = [v8 createIfNecessary];
    v9->_includeInfoInResult = [v8 includeInfoInResult];
    v9->_includePathInResult = [v8 includePathInResult];
    v9->_uid = [v8 uid];
    uint64_t v18 = [v8 userIdentity];
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v18;

    v9->_transient = [v8 transient];
    v9->_fuzzyMatchTransient = [v8 fuzzyMatchTransient];
    v9->_fuzzyMatchInternalUUID = [v8 fuzzyMatchInternalUUID];
    v9->_includeUnowned = [v8 includeUnowned];
    v9->_expectSingleResult = [v8 expectSingleResult];
    v9->_legacyPersonaPolicy = [v8 legacyPersonaPolicy];
    v9->_legacyExtensionPolicy = [v8 legacyExtensionPolicy];
    v9->_includeUserManagedAssetsRelPath = [v8 includeUserManagedAssetsRelPath];
    v9->_includeCreator = [v8 includeCreator];
    if (v9->_legacyExtensionPolicy
      && v9->_includeUnowned
      && !-[NSSet count](v9->_identifiers, "count")
      && !-[NSSet count](v9->_groupIdentifiers, "count"))
    {
      v9->_issueSandboxExtensions = 0;
    }

    else
    {
      v9->_issueSandboxExtensions = [v8 issueSandboxExtensions];
    }
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  if (!-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath")) {
    return 1;
  }
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 isAllowedToAccessUserAssets];

  return v5;
}

- (void)execute
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  v3 = -[MCMCommandQuery containerConfig](self, "containerConfig");
  uint64_t v4 = [v3 containerClass];

  -[MCMCommand context](self, "context");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 clientIdentity];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v6 = v4 == 13 || v4 == 7;
  BOOL v48 = v6;
  if (v4 == 7 || v4 == 13)
  {
    uint64_t v7 = -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
  }

  else
  {
    uint64_t v7 = -[MCMCommandQuery identifiers](self, "identifiers");
  }

  id v8 = (void *)v7;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = __Block_byref_object_copy__8749;
  v69 = __Block_byref_object_dispose__8750;
  id v70 = 0LL;
  [MEMORY[0x189603FA8] array];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  char v64 = 0;
  [v50 codeSignInfo];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v52 isSigned] & 1) == 0)
  {
    v13 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  98LL,  3LL);
LABEL_14:
    id v14 = (id)v66[5];
    v66[5] = (uint64_t)v13;
LABEL_15:

    goto LABEL_16;
  }

  if (v8)
  {
LABEL_10:
    v9 = (void *)MEMORY[0x1895CE3A8]();
    uint64_t v10 = (id *)(v66 + 5);
    obuint64_t j = (id)v66[5];
    v11 = -[MCMCommandQuery _queryPlanWithIdentifiers:isGroupClass:clientIdentity:error:]( self,  "_queryPlanWithIdentifiers:isGroupClass:clientIdentity:error:",  v8,  v48,  v50,  &obj);
    objc_storeStrong(v10, obj);
    if (v11)
    {
      uint64_t v12 = (id *)(v66 + 5);
      id v59 = (id)v66[5];
      -[MCMCommandQuery _executeQueryPlan:resultContainers:error:]( self,  "_executeQueryPlan:resultContainers:error:",  v11,  v51,  &v59);
      objc_storeStrong(v12, v59);
    }

    objc_autoreleasePoolPop(v9);
    goto LABEL_16;
  }

  if (v4 == 13 || v4 == 7)
  {
    v15 = -[MCMCommandQuery identifiers](self, "identifiers");
    BOOL v16 = [v15 count] == 0;

    if (!v16)
    {
      v17 = -[MCMCommandQuery identifiers](self, "identifiers");
      char v18 = [v50 isAllowedToLookupGroupContainersOfClass:v4 ownedByIdentifiers:v17];

      if ((v18 & 1) == 0)
      {
        v13 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);
LABEL_40:
        id v8 = 0LL;
        goto LABEL_14;
      }

      id v14 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      v19 = -[MCMCommandQuery identifiers](self, "identifiers");
      uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v78 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v80;
        while (2)
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if (*(void *)v80 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            v24 = +[MCMGroupManager defaultManager](&OBJC_CLASS___MCMGroupManager, "defaultManager");
            v25 = (id *)(v66 + 5);
            id v63 = (id)v66[5];
            [v24 groupContainerIdentifiersForOwnerIdentifier:v23 groupContainerClass:v4 codeSignInfo:v52 withError:&v63];
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v25, v63);

            if (!v26)
            {

              goto LABEL_46;
            }

            [v14 unionSet:v26];
          }

          uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v78 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      uint64_t v27 = [v14 copy];
      goto LABEL_43;
    }
  }

  if (!-[MCMCommandQuery includeUnowned](self, "includeUnowned"))
  {
    if (v4 == 13 || v4 == 7)
    {
      v29 = +[MCMGroupManager defaultManager](&OBJC_CLASS___MCMGroupManager, "defaultManager");
      [v52 identifier];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id *)(v66 + 5);
      id v61 = (id)v66[5];
      [v29 groupContainerIdentifiersForOwnerIdentifier:v30 groupContainerClass:v4 codeSignInfo:v52 withError:&v61];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v31, v61);

      if (v8) {
        goto LABEL_10;
      }
LABEL_16:
      -[MCMCommandQuery _finalizeWithContainers:error:](self, "_finalizeWithContainers:error:", v51, v66[5]);
      goto LABEL_17;
    }

    v32 = (void *)MEMORY[0x189604010];
    [v52 identifier];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v32 setWithObject:v14];
LABEL_43:
    id v8 = (void *)v27;

    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }

  v28 = (id *)(v66 + 5);
  id v62 = (id)v66[5];
  -[MCMCommandQuery _containerIdentifiersIncludingUnownedForContainerClass:canAccessAllContainers:error:]( self,  "_containerIdentifiersIncludingUnownedForContainerClass:canAccessAllContainers:error:",  v4,  &v64,  &v62);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v28, v62);
  if (!v8) {
    goto LABEL_16;
  }
  if ([v8 count]) {
    goto LABEL_10;
  }

LABEL_44:
  uint64_t v33 = -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
  if (v33)
  {
    id v14 = (id)v33;
LABEL_46:
    id v8 = 0LL;
    goto LABEL_15;
  }

  if (!v64)
  {
    id v8 = 0LL;
    goto LABEL_16;
  }

  uint64_t v34 = -[MCMCommandQuery _setOfUserIdentities](self, "_setOfUserIdentities");
  if (!v34)
  {
    v13 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  115LL,  3LL);
    goto LABEL_40;
  }

  id v14 = (id)v34;
  v35 = -[MCMCommand context](self, "context");
  [v35 containerCache];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v37 = -[MCMCommandQuery transient](self, "transient");
  v38 = (id *)(v66 + 5);
  id v58 = (id)v66[5];
  [v36 entriesForUserIdentities:v14 contentClass:v4 transient:v37 error:&v58];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v38, v58);

  if (!-[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult")
    && !-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath")
    && !-[MCMCommandQuery includeCreator](self, "includeCreator"))
  {
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v43 = v39;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v72 objects:v71 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v73;
      do
      {
        for (uint64_t j = 0LL; j != v44; ++j)
        {
          if (*(void *)v73 != v45) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * j) metadataMinimal];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          [v51 addObject:v47];
        }

        uint64_t v44 = [v43 countByEnumeratingWithState:&v72 objects:v71 count:16];
      }

      while (v44);
    }

    goto LABEL_46;
  }

  container_log_handle_for_category();
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v50;
    _os_log_impl( &dword_188846000,  v40,  OS_LOG_TYPE_INFO,  "Query split into per-container ops since info or user managed assets path requested for all containers by client [%@]",  buf,  0xCu);
  }
  v41 = -[MCMCommand reply](self, "reply");
  v53[0] = MEMORY[0x1895F87A8];
  v53[1] = 3221225472LL;
  v53[2] = __26__MCMCommandQuery_execute__block_invoke;
  v53[3] = &unk_18A29DD90;
  id v42 = v39;
  id v54 = v42;
  v55 = self;
  id v56 = v51;
  v57 = &v65;
  [v41 handoffToSlowWorkloopforClientIdentity:v50 withBlock:v53];

  id v8 = 0LL;
LABEL_17:

  _Block_object_dispose(&v65, 8);
  objc_autoreleasePoolPop(context);
}

- (void)_finalizeWithContainers:(id)a3 error:(id)a4
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (MCMError *)a4;
  id v8 = v7;
  if (-[MCMCommandQuery expectSingleResult](self, "expectSingleResult"))
  {
    id v8 = v7;
    if ((unint64_t)[v6 count] >= 2)
    {
      container_log_handle_for_category();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v45 = [v6 count];
        _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Query expects single result but found %lu; returning CONTAINER_ERROR_AMBIGUOUS_RESULT",
          buf,
          0xCu);
      }

      [v6 removeAllObjects];
      id v8 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  114LL,  3LL);
    }
  }

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = v11;
    __int16 v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_188846000, v10, OS_LOG_TYPE_DEFAULT, "Query result: count = %lu, error = %@", buf, 0x16u);
  }

  -[MCMCommand context](self, "context");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 clientIdentity];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 codeSignInfo];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 identifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v15 isEqual:@"com.apple.ContainerManagerTest"]) {
    goto LABEL_17;
  }
  id v16 = v6;
  v17 = -[MCMCommandQuery containerConfig](self, "containerConfig");
  if (([v17 containerClass] & 0xFFFFFFFFFFFFFFFELL) != 0xC)
  {

    id v6 = v16;
LABEL_17:

    goto LABEL_18;
  }

  BOOL v18 = -[MCMCommandQuery createIfNecessary](self, "createIfNecessary");

  id v6 = v16;
  if (v18 && v8)
  {
    if (-[MCMError type](v8, "type") != 55)
    {
      container_log_handle_for_category();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommandQuery containerConfig](self, "containerConfig");
        id v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 name];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
        v32 = (MCMError *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = -[MCMError type](v8, "type");
        -[MCMCommand context](self, "context");
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 clientIdentity];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        uint64_t v45 = (uint64_t)v31;
        __int16 v46 = 2114;
        v47 = v32;
        __int16 v48 = 2048;
        uint64_t v49 = v33;
        id v6 = v16;
        __int16 v50 = 2114;
        v51 = v8;
        __int16 v52 = 2114;
        v53 = v35;
        _os_log_fault_impl( &dword_188846000,  v19,  OS_LOG_TYPE_FAULT,  "System container lookup failed, class = %@, identifier = %{public}@, error = (%llu)%{public}@, client = %{public}@",  buf,  0x34u);
      }
    }

    goto LABEL_19;
  }

- (id)_executeQueryForContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMCommand context](self, "context");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 containerFactory];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  objc_msgSend( v8,  "containerForContainerIdentity:createIfNecessary:error:",  v6,  -[MCMCommandQuery createIfNecessary](self, "createIfNecessary"),  &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = v17;
  if (!v9)
  {
    if (!v10 || [v10 type] == 21)
    {

      id v13 = 0LL;
      uint64_t v12 = 0LL;
      goto LABEL_21;
    }

    uint64_t v12 = 0LL;
    goto LABEL_18;
  }

  container_log_handle_for_category();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_debug_impl(&dword_188846000, v11, OS_LOG_TYPE_DEBUG, "Found %@", buf, 0xCu);
  }

  if (!-[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult")
    && !-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath")
    && !-[MCMCommandQuery includeCreator](self, "includeCreator"))
  {
    [v9 metadataMinimal];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    id v13 = v10;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  id v16 = v10;
  [v9 metadataWithError:&v16];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v16;

  if (!v12)
  {
    container_log_handle_for_category();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to fetch metadata; container = %@, error = %@",
        buf,
        0x16u);
    }

    uint64_t v12 = 0LL;
  }

  if (a4)
  {
LABEL_19:
    if (v13)
    {
      id v13 = v13;
      *a4 = v13;
    }
  }

- (BOOL)_executeQueryPlan:(id)a3 resultContainers:(id)a4 error:(id *)a5
{
  v28[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[MCMCommand context](self, "context");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 clientIdentity];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 codeSignInfo];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 entitlements];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v8 count])
  {
    id v14 = 0LL;
    BOOL v24 = 1;
    goto LABEL_21;
  }

  BOOL v26 = a5;
  id v14 = 0LL;
  while (1)
  {
    objc_msgSend(v8, "firstObject", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 removeObjectAtIndex:0];
    v28[0] = v14;
    -[MCMCommandQuery _executeQueryForContainerIdentity:error:]( self,  "_executeQueryForContainerIdentity:error:",  v15,  v28);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v28[0];

    if (v16) {
      break;
    }
    if (v17) {
      goto LABEL_17;
    }
    if (-[MCMCommandQuery fuzzyMatchTransient](self, "fuzzyMatchTransient"))
    {
      int v22 = [v15 transient];
      if (v22 == -[MCMCommandQuery transient](self, "transient"))
      {
        objc_msgSend(v15, "identityByChangingTransient:", objc_msgSend(v15, "transient") ^ 1);
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v23];
      }
    }

    id v14 = 0LL;
LABEL_13:

    if (![v8 count])
    {
      BOOL v24 = 1;
      goto LABEL_18;
    }
  }

  -[MCMCommandQuery containerConfig](self, "containerConfig");
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 supportsProtectedContainerWithRestrictedEntitlement];

  if (!v19)
  {
LABEL_7:
    [v9 addObject:v16];
    id v14 = v17;
    goto LABEL_13;
  }

  id v27 = v17;
  BOOL v20 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:entitlements:error:]( &OBJC_CLASS___MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier,  "secureRestrictedContainerIfNeededWithMetadata:entitlements:error:",  v16,  v13,  &v27);
  id v21 = v27;

  if (v20)
  {
    id v17 = v21;
    goto LABEL_7;
  }

  id v17 = v21;
LABEL_17:

  BOOL v24 = 0;
  id v14 = v17;
LABEL_18:
  if (v26 && v14)
  {
    id v14 = v14;
    id *v26 = v14;
  }

- (id)_queryPlanWithIdentifiers:(id)a3 isGroupClass:(BOOL)a4 clientIdentity:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandQuery _setOfUserIdentitiesForIdentifiers:isGroupClass:]( self,  "_setOfUserIdentitiesForIdentifiers:isGroupClass:",  v10,  v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v13 count])
  {
    v15 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  115LL,  3LL);
    if (!v15) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v14 = v13;
  uint64_t v43 = [v14 countByEnumeratingWithState:&v66 objects:v65 count:16];
  v15 = 0LL;
  if (v43)
  {
    uint64_t v16 = *(void *)v67;
    v47 = a6;
    id v48 = v10;
    uint64_t v45 = v14;
    __int16 v46 = v13;
    __int16 v50 = v12;
    uint64_t v42 = *(void *)v67;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v67 != v16)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(v14);
          uint64_t v17 = v18;
        }

        v51 = v15;
        uint64_t v44 = v17;
        uint64_t v53 = *(void *)(*((void *)&v66 + 1) + 8 * v17);
        objc_msgSend(v14, "objectForKeyedSubscript:");
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        obuint64_t j = v19;
        uint64_t v54 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
        if (v54)
        {
          uint64_t v52 = *(void *)v62;
          while (2)
          {
            for (uint64_t i = 0LL; i != v54; ++i)
            {
              if (*(void *)v62 != v52) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              uint64_t v55 = 1LL;
              uint64_t v22 = -[MCMCommandQuery internalUUID](self, "internalUUID");
              if (v22
                && (BOOL v23 = (void *)v22,
                    BOOL v24 = -[MCMCommandQuery fuzzyMatchInternalUUID](self, "fuzzyMatchInternalUUID"),
                    v23,
                    !v24))
              {
                -[MCMCommandQuery internalUUID](self, "internalUUID");
                id v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCMCommandQuery containerConfig](self, "containerConfig");
                BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
                id v31 = v11;
                uint64_t v32 = -[MCMCommandQuery platform](self, "platform");
                BOOL v33 = -[MCMCommandQuery transient](self, "transient");
                -[MCMCommand context](self, "context");
                BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
                [v29 userIdentityCache];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v35 = v32;
                id v11 = v31;
                v30 = +[MCMConcreteContainerIdentity containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentity,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v25,  v53,  v21,  v28,  v35,  v33,  v34,  &v55);
              }

              else
              {
                -[MCMCommandQuery containerConfig](self, "containerConfig");
                id v25 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v26 = -[MCMCommandQuery platform](self, "platform");
                BOOL v27 = -[MCMCommandQuery transient](self, "transient");
                -[MCMCommand context](self, "context");
                BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v28 userIdentityCache];
                BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v53,  v21,  v25,  v26,  v27,  v29,  &v55);
              }

              if (v30)
              {
                if (![v11 isAllowedToLookupContainerIdentity:v30])
                {
                  BOOL v39 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);

                  v15 = v39;
                  a6 = v47;
                  id v10 = v48;
                  id v14 = v45;
                  id v13 = v46;
                  uint64_t v12 = v50;
                  goto LABEL_28;
                }

                [v50 addObject:v30];
              }

              else
              {
                uint64_t v36 = objc_alloc(&OBJC_CLASS___MCMError);
                uint64_t v37 = -[MCMError initWithErrorType:](v36, "initWithErrorType:", v55);

                container_log_handle_for_category();
                BOOL v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = self;
                  __int16 v58 = 2048;
                  uint64_t v59 = v55;
                  _os_log_error_impl( &dword_188846000,  v38,  OS_LOG_TYPE_ERROR,  "Could not construct container identity from query; query = %@, error = %llu",
                    buf,
                    0x16u);
                }

                v51 = (MCMError *)v37;
              }
            }

            uint64_t v54 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
            if (v54) {
              continue;
            }
            break;
          }
        }

        uint64_t v17 = v44 + 1;
        a6 = v47;
        id v10 = v48;
        id v14 = v45;
        id v13 = v46;
        uint64_t v12 = v50;
        v15 = v51;
        uint64_t v16 = v42;
      }

      while (v44 + 1 != v43);
      uint64_t v43 = [v45 countByEnumeratingWithState:&v66 objects:v65 count:16];
    }

    while (v43);
  }

- (id)_setOfUserIdentitiesForIdentifiers:(id)a3 isGroupClass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v145 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void *)objc_opt_new();
  -[MCMCommand context](self, "context");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 clientIdentity];

  v113 = (void *)v9;
  id v10 = (void *)v9;
  id v11 = self;
  [v10 userIdentity];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[MCMCommandQuery userIdentity](self, "userIdentity");
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v52 debugDescription];
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    uint32_t multiuser_flags = 138412290;
    v136 = v53;
    _os_log_debug_impl(&dword_188846000, v13, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&multiuser_flags, 0xCu);
  }

  -[MCMCommandQuery containerConfig](v11, "containerConfig");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v14 usesGlobalBundleUserIdentity];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x189604010];
    -[MCMCommand context](v11, "context");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 userIdentityCache];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 globalBundleUserIdentity];
LABEL_7:
    uint64_t v22 = (void *)v19;
    [v16 setWithObject:v19];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }

  -[MCMCommandQuery containerConfig](v11, "containerConfig");
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = [v20 usesGlobalSystemUserIdentity];

  if (v21)
  {
    uint64_t v16 = (void *)MEMORY[0x189604010];
    -[MCMCommand context](v11, "context");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 userIdentityCache];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 globalSystemUserIdentity];
    goto LABEL_7;
  }

  uint64_t v31 = -[MCMCommandQuery userIdentity](v11, "userIdentity");
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    -[MCMCommandQuery userIdentity](v11, "userIdentity");
    BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
    int v34 = [v33 isNoSpecificPersona];

    if (!v34)
    {
      if (([v12 isNoSpecificPersona] & 1) == 0)
      {
        -[MCMCommandQuery userIdentity](v11, "userIdentity");
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        int v46 = [v12 isEqual:v45];

        if (!v46)
        {
          container_log_handle_for_category();
          id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            [v12 shortDescription];
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = -[MCMCommandQuery userIdentity](v11, "userIdentity");
            [v96 shortDescription];
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            uint32_t multiuser_flags = 138412546;
            v136 = v95;
            __int16 v137 = 2112;
            uint64_t v138 = (uint64_t)v97;
            _os_log_error_impl( &dword_188846000,  v56,  OS_LOG_TYPE_ERROR,  "Ambiguous persona, client has adopted %@ but asks for %@",  (uint8_t *)&multiuser_flags,  0x16u);
          }

          goto LABEL_17;
        }
      }

      v47 = (void *)MEMORY[0x189604010];
      -[MCMCommandQuery userIdentity](v11, "userIdentity");
      id v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 setWithObject:v48];
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      -[MCMCommandQuery userIdentity](v11, "userIdentity");
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      [v49 shortDescription];
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t multiuser_flags = 138412290;
      v136 = v50;
      v51 = "Using explicit persona: %@";
LABEL_36:
      _os_log_debug_impl(&dword_188846000, (os_log_t)v17, OS_LOG_TYPE_DEBUG, v51, (uint8_t *)&multiuser_flags, 0xCu);

      goto LABEL_8;
    }
  }

  uint32_t multiuser_flags = 0;
  host_t v35 = MEMORY[0x1895CE2D0]();
  if (!host_get_multiuser_config_flags(v35, &multiuser_flags) && (multiuser_flags & 0x80000000) != 0)
  {
    -[MCMCommand context](v11, "context");
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 clientIdentity];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 userIdentity];
    BOOL v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 posixUser];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCMCommand context](v11, "context");
    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 userIdentityCache];
    id v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 userIdentityForPersonalPersonaWithPOSIXUser:v17];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604010] setWithObject:v41];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      uint32_t multiuser_flags = 138412290;
      v136 = v41;
      _os_log_debug_impl( &dword_188846000,  v42,  OS_LOG_TYPE_DEBUG,  "Using client persona: %@",  (uint8_t *)&multiuser_flags,  0xCu);
    }

    goto LABEL_8;
  }

  if (![v12 isNoSpecificPersona])
  {
    [MEMORY[0x189604010] setWithObject:v12];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    [v113 userIdentity];
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 shortDescription];
    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue();
    uint32_t multiuser_flags = 138412290;
    v136 = v50;
    v51 = "Using client implicit persona: %@";
    goto LABEL_36;
  }

  if (!-[MCMCommandQuery legacyPersonaPolicy](v11, "legacyPersonaPolicy"))
  {
    -[MCMCommand context](v11, "context");
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v54 userIdentityCache];
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 allAccessibleUserIdentities];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
    {
      uint32_t multiuser_flags = 138412290;
      v136 = v23;
      _os_log_debug_impl( &dword_188846000,  (os_log_t)v17,  OS_LOG_TYPE_DEBUG,  "Using all personas: %@",  (uint8_t *)&multiuser_flags,  0xCu);
    }

- (id)_setOfUserIdentities
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 userIdentity];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[MCMCommandQuery userIdentity](self, "userIdentity");
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 debugDescription];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint32_t v41 = 138412290;
    uint64_t v42 = v37;
    _os_log_debug_impl(&dword_188846000, v6, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&v41, 0xCu);
  }

  -[MCMCommandQuery containerConfig](self, "containerConfig");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 usesGlobalBundleUserIdentity];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x189604010];
    -[MCMCommand context](self, "context");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 userIdentityCache];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 globalBundleUserIdentity];
LABEL_7:
    int v15 = (void *)v12;
    [v9 setWithObject:v12];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }

  -[MCMCommandQuery containerConfig](self, "containerConfig");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 usesGlobalSystemUserIdentity];

  if (v14)
  {
    uint64_t v9 = (void *)MEMORY[0x189604010];
    -[MCMCommand context](self, "context");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 userIdentityCache];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 globalSystemUserIdentity];
    goto LABEL_7;
  }

  uint64_t v18 = -[MCMCommandQuery userIdentity](self, "userIdentity");
  if (v18
    && (uint64_t v19 = (void *)v18,
        -[MCMCommandQuery userIdentity](self, "userIdentity"),
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 isNoSpecificPersona],
        v20,
        v19,
        !v21))
  {
    if (([v5 isNoSpecificPersona] & 1) != 0
      || (-[MCMCommandQuery userIdentity](self, "userIdentity"),
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(),
          int v33 = [v5 isEqual:v32],
          v32,
          v33))
    {
      int v34 = (void *)MEMORY[0x189604010];
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      host_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 setWithObject:v35];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 shortDescription];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v41 = 138412290;
      uint64_t v42 = v15;
      BOOL v28 = "Using explicit persona: %@";
      BOOL v29 = (os_log_s *)v10;
      goto LABEL_24;
    }

    container_log_handle_for_category();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      [v5 shortDescription];
      BOOL v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 shortDescription];
      id v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v41 = 138412546;
      uint64_t v42 = v38;
      __int16 v43 = 2112;
      uint64_t v44 = v40;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Ambiguous persona, client has adopted %@ but asks for %@",  (uint8_t *)&v41,  0x16u);
    }

    uint64_t v16 = 0LL;
  }

  else
  {
    uint32_t v41 = 0;
    host_t v22 = MEMORY[0x1895CE2D0]();
    if (!host_get_multiuser_config_flags(v22, &v41) && (v41 & 0x80000000) != 0)
    {
      -[MCMCommand context](self, "context");
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 clientIdentity];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 userIdentity];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 posixUser];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MCMCommand context](self, "context");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 userIdentityCache];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 userIdentityForPersonalPersonaWithPOSIXUser:v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189604010] setWithObject:v11];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      uint32_t v41 = 138412290;
      uint64_t v42 = v11;
      BOOL v28 = "Using client persona: %@";
      BOOL v29 = (os_log_s *)v15;
LABEL_24:
      _os_log_debug_impl(&dword_188846000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v41, 0xCu);
      goto LABEL_8;
    }

    if (![v5 isNoSpecificPersona])
    {
      [MEMORY[0x189604010] setWithObject:v5];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      [v5 shortDescription];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v41 = 138412290;
      uint64_t v42 = v11;
      _os_log_debug_impl( &dword_188846000,  (os_log_t)v10,  OS_LOG_TYPE_DEBUG,  "Using client implicit persona: %@",  (uint8_t *)&v41,  0xCu);
      goto LABEL_9;
    }
    v30 = -[MCMCommand context](self, "context");
    [v30 userIdentityCache];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 allAccessibleUserIdentities];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v41 = 138412290;
      uint64_t v42 = v16;
      _os_log_debug_impl( &dword_188846000,  (os_log_t)v10,  OS_LOG_TYPE_DEBUG,  "Using all personas: %@",  (uint8_t *)&v41,  0xCu);
    }
  }

- (id)_containerIdentifiersIncludingUnownedForContainerClass:(unint64_t)a3 canAccessAllContainers:(BOOL *)a4 error:(id *)a5
{
  v24[1] = *(id *)MEMORY[0x1895F89C0];
  -[MCMCommand context](self, "context");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 clientIdentity];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 codeSignInfo];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 entitlements];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v11 allowed] & 1) == 0 && !objc_msgSend(v11, "otherIDLookup"))
  {
    [v11 lookupForContainerClass:a3];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v15;
    if (v15 && ![v15 count])
    {
      [MEMORY[0x189604010] set];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = 0LL;
      BOOL v14 = 1;
      goto LABEL_25;
    }

    switch(a3)
    {
      case 0xDuLL:
        goto LABEL_9;
      case 0xCuLL:
        if (![v11 hasSystemContainer])
        {
          if (!v16) {
            goto LABEL_24;
          }
          goto LABEL_20;
        }

        break;
      case 7uLL:
LABEL_9:
        +[MCMGroupManager defaultManager](&OBJC_CLASS___MCMGroupManager, "defaultManager");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = 0LL;
        [v17 groupContainerIdentifiersForOwnerIdentifier:v18 groupContainerClass:a3 codeSignInfo:v10 withError:v24];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = (MCMError *)v24[0];

        if (![v12 count])
        {

          uint64_t v12 = 0LL;
        }

        if (v13)
        {
          BOOL v14 = 0;
LABEL_25:

          goto LABEL_26;
        }

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)includeInfoInResult
{
  return self->_includeInfoInResult;
}

- (BOOL)includePathInResult
{
  return self->_includePathInResult;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (unsigned)uid
{
  return self->_uid;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)includeUnowned
{
  return self->_includeUnowned;
}

- (BOOL)expectSingleResult
{
  return self->_expectSingleResult;
}

- (BOOL)fuzzyMatchTransient
{
  return self->_fuzzyMatchTransient;
}

- (BOOL)fuzzyMatchInternalUUID
{
  return self->_fuzzyMatchInternalUUID;
}

- (NSUUID)internalUUID
{
  return self->_internalUUID;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
}

uint64_t __26__MCMCommandQuery_execute__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v2 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  [v2 waitOnLock:14];

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v36;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v36 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * v5);
        uint64_t v24 = 0LL;
        uint64_t v25 = &v24;
        uint64_t v26 = 0x3032000000LL;
        uint64_t v27 = __Block_byref_object_copy__8749;
        BOOL v28 = __Block_byref_object_dispose__8750;
        id v29 = 0LL;
        id v7 = v6;
        uint64_t v18 = 0LL;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x3032000000LL;
        int v21 = __Block_byref_object_copy__8749;
        uint64_t v22 = __Block_byref_object_dispose__8750;
        id v23 = 0LL;
        [*(id *)(a1 + 40) reply];
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = __26__MCMCommandQuery_execute__block_invoke_2;
        v14[3] = &unk_18A29DD68;
        v14[4] = v7;
        uint64_t v16 = &v18;
        id v9 = v7;
        id v15 = v9;
        uint64_t v17 = &v24;
        [v8 dispatchSyncToFastWorkloopWithBlock:v14];

        if (v19[5])
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:");
        }

        else
        {
          container_log_handle_for_category();
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = v25[5];
            *(_DWORD *)buf = 138412546;
            id v31 = v9;
            __int16 v32 = 2112;
            uint64_t v33 = v11;
            _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Could not resolve metadata for %@: error = %@",  buf,  0x16u);
          }
        }

        _Block_object_dispose(&v18, 8);
        _Block_object_dispose(&v24, 8);

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
    }

    while (v3);
  }

  return [*(id *)(a1 + 40) _finalizeWithContainers:*(void *)(a1 + 48) error:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __26__MCMCommandQuery_execute__block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v10;
    _os_log_debug_impl(&dword_188846000, v2, OS_LOG_TYPE_DEBUG, "Fetching metadata for container [%@]", buf, 0xCu);
  }

  uint64_t v3 = (void *)a1[5];
  id v11 = 0LL;
  uint64_t v4 = [v3 metadataWithError:&v11];
  id v5 = v11;
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[7] + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

+ (unint64_t)command
{
  return 39LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end