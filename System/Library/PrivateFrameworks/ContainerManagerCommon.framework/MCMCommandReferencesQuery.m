@interface MCMCommandReferencesQuery
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)preflightClientAllowed;
- (BOOL)yesReallyApplyToAll;
- (MCMCommandReferencesQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMUserIdentity)userIdentity;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
- (void)execute;
@end

@implementation MCMCommandReferencesQuery

- (MCMCommandReferencesQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandReferencesQuery;
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

    v9->_uid = [v8 uid];
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToReadReferences];

  return v4;
}

- (void)execute
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  char v4 = objc_alloc_init(&OBJC_CLASS___MCMResultWithOwnersAndGroupsBase);
  v5 = -[MCMCommandReferencesQuery ownerIdentifiers](self, "ownerIdentifiers");
  if (v5)
  {
    BOOL v6 = 0;
  }

  else
  {
    v7 = -[MCMCommandReferencesQuery groupIdentifiers](self, "groupIdentifiers");
    BOOL v6 = v7 == 0LL;
  }

  id v8 = (void *)gCodeSigningMapping;
  unint64_t v9 = -[MCMCommandReferencesQuery containerClass](self, "containerClass");
  id v27 = 0LL;
  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  v22 = __36__MCMCommandReferencesQuery_execute__block_invoke;
  v23 = &unk_18A29D830;
  BOOL v26 = v6;
  v24 = self;
  uint64_t v10 = v4;
  v25 = v10;
  LOBYTE(v9) = [v8 enumerateOwnersAndGroupsWithGroupClass:v9 error:&v27 block:&v20];
  id v11 = v27;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___MCMResultWithOwnersAndGroupsBase);
    uint64_t v13 = -[MCMResultBase initWithError:](v12, "initWithError:", v11, v20, v21, v22, v23, v24);

    uint64_t v10 = (MCMResultWithOwnersAndGroupsBase *)v13;
  }

  container_log_handle_for_category();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMResultWithOwnersAndGroupsBase ownerIdentifiers](v10, "ownerIdentifiers");
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 count];
    v17 = -[MCMResultWithOwnersAndGroupsBase groupIdentifiers](v10, "groupIdentifiers");
    uint64_t v18 = [v17 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v18;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl( &dword_188846000,  v14,  OS_LOG_TYPE_DEFAULT,  "References query; owners count = %lu, groups count = %lu, error = %@",
      buf,
      0x20u);
  }
  v19 = -[MCMCommand resultPromise](self, "resultPromise");
  [v19 completeWithResult:v10];

  objc_autoreleasePoolPop(v3);
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

uint64_t __36__MCMCommandReferencesQuery_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(_BYTE *)(a1 + 48)) {
    goto LABEL_2;
  }
  [*(id *)(a1 + 32) ownerIdentifiers];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    [*(id *)(a1 + 32) ownerIdentifiers];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v3 containsObject:v6])
    {

LABEL_2:
      [*(id *)(a1 + 40) addOwner:v6 group:v7];
      goto LABEL_3;
    }
  }

  uint64_t v10 = [*(id *)(a1 + 32) groupIdentifiers];
  if (v10)
  {
    id v11 = (void *)v10;
    [*(id *)(a1 + 32) groupIdentifiers];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 containsObject:v7];

    if (v9)
    {

      if ((v13 & 1) == 0) {
        goto LABEL_3;
      }
    }

    else if (!v13)
    {
      goto LABEL_3;
    }

    goto LABEL_2;
  }

  if (v9)
  {
  }

+ (unint64_t)command
{
  return 47LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end