@interface MCMXPCMessageQuery
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
- (BOOL)transient;
- (MCMUserIdentity)userIdentity;
- (MCMXPCMessageQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSSet)groupIdentifiers;
- (NSSet)identifiers;
- (NSUUID)internalUUID;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)disposition;
- (unsigned)expectedPersonaKernelID;
- (unsigned)uid;
@end

@implementation MCMXPCMessageQuery

- (MCMXPCMessageQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___MCMXPCMessageQuery;
  v10 = -[MCMXPCMessageWithContainerClassBase initWithXPCObject:context:error:]( &v80,  sel_initWithXPCObject_context_error_,  v8,  v9,  a5);
  if (!v10) {
    goto LABEL_50;
  }
  v75 = a5;
  uint64_t v79 = 1LL;
  v10->_unint64_t privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
  v10->_unint64_t explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
  identifiers = v10->_identifiers;
  v10->_identifiers = 0LL;

  groupIdentifiers = v10->_groupIdentifiers;
  v10->_groupIdentifiers = 0LL;

  v10->_createIfNecessary = 0;
  v10->_includeInfoInResult = 0;
  v10->_includePathInResult = 0;
  v10->_issueSandboxExtensions = 0;
  [v9 clientIdentity];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 userIdentity];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 posixUser];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_uid = [v15 UID];

  userIdentity = v10->_userIdentity;
  v10->_userIdentity = 0LL;

  v10->_transient = 0;
  v10->_includeUnowned = 0;
  v10->_fuzzyMatchTransient = 0;
  v10->_fuzzyMatchInternalUUID = 0;
  v10->_expectSingleResult = 0;
  v10->_legacyPersonaPolicy = 0;
  v10->_legacyExtensionPolicy = 0;
  v10->_extensionsUseProxiedClient = 0;
  v10->_extensionsPolicyUsesProxiedClient = 0;
  unint64_t privateFlags = v10->_privateFlags;
  if ((privateFlags & 1) != 0)
  {
    v10->_legacyPersonaPolicy = 1;
    unint64_t privateFlags = v10->_privateFlags;
  }

  if ((privateFlags & 2) != 0) {
    v10->_legacyExtensionPolicy = 1;
  }
  unint64_t explicitFlags = v10->_explicitFlags;
  if ((explicitFlags & 1) == 0)
  {
    if ((explicitFlags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }

  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v10,  "nsObjectFromXPCObject:key:error:",  v8,  "IdentifiersArray",  &v79);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v79 != 1)
  {
LABEL_44:
    v20 = a5;
    goto LABEL_45;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v79 = 110LL;
    goto LABEL_44;
  }

  id v71 = v9;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v21 = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v95 objects:v94 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v96;
LABEL_14:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v96 != v24) {
        objc_enumerationMutation(v21);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_43;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v95 objects:v94 count:16];
        if (v23) {
          goto LABEL_14;
        }
        break;
      }
    }
  }

  uint64_t v26 = [MEMORY[0x189604010] setWithArray:v21];
  v27 = v10->_identifiers;
  v10->_identifiers = (NSSet *)v26;

  unint64_t explicitFlags = v10->_explicitFlags;
  id v9 = v71;
  if ((explicitFlags & 2) == 0)
  {
LABEL_8:
    uint64_t v19 = 72LL;
    uint64_t v79 = 72LL;
    v20 = a5;
    if (!a5) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMXPCMessageQuery;
  unsigned int v3 = -[MCMXPCMessageWithContainerClassBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    v4 = -[MCMXPCMessageWithContainerClassBase containerConfig](self, "containerConfig");
    unsigned int v3 = [v4 disposition];
  }

  return v3;
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

- (void).cxx_destruct
{
}

@end