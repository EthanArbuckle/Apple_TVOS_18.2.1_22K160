@interface MCMXPCMessageReferencesQuery
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)yesReallyApplyToAll;
- (MCMUserIdentity)userIdentity;
- (MCMXPCMessageReferencesQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
@end

@implementation MCMXPCMessageReferencesQuery

- (MCMXPCMessageReferencesQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MCMXPCMessageReferencesQuery;
  v10 = -[MCMXPCMessageWithOwnersAndGroupsBase initWithXPCObject:context:error:]( &v29,  sel_initWithXPCObject_context_error_,  v8,  v9,  a5);
  if (v10)
  {
    unint64_t v28 = 1LL;
    v10->_privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
    v10->_unint64_t explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
    [v9 clientIdentity];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 userIdentity];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 posixUser];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_uid = [v13 UID];

    if ((v10->_explicitFlags & 8) != 0) {
      v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    }
    char uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v10->_createDuringReconciliation = uint64 & 1;
    v10->_deleteDuringReconciliation = (uint64 & 2) != 0;
    v10->_yesReallyApplyToAll = (uint64 & 4) != 0;
    v15 = -[MCMXPCMessageBase context](v10, "context");
    [v15 userIdentityCache];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (![(id)objc_opt_class() personasAreSupported])
    {

LABEL_14:
      goto LABEL_15;
    }

    unint64_t explicitFlags = v10->_explicitFlags;

    if ((explicitFlags & 4) != 0)
    {
      [v9 clientIdentity];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 userIdentity];
      userIdentity = v10->_userIdentity;
      v10->_userIdentity = (MCMUserIdentity *)v19;

      if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( &OBJC_CLASS___MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  -[MCMXPCMessageWithOwnersAndGroupsBase containerClass](v10, "containerClass")))
      {
        string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
        if (string)
        {
          uint64_t v22 = [NSString stringWithUTF8String:string];
          if (v22)
          {
            v23 = (void *)v22;
            [v9 clientIdentity];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v25 = -[MCMXPCMessageBase userIdentityFromClientPersonaUniqueString:clientIdentity:error:]( v10,  "userIdentityFromClientPersonaUniqueString:clientIdentity:error:",  v23,  v24,  &v28);
            v26 = v10->_userIdentity;
            v10->_userIdentity = (MCMUserIdentity *)v25;

            if (v28 != 1)
            {
              if (a5) {
                *a5 = v28;
              }
              v15 = v10;
              v10 = 0LL;
              goto LABEL_14;
            }
          }
        }
      }
    }
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

@end