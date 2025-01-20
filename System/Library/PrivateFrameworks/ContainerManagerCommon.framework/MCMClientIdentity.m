@interface MCMClientIdentity
+ (id)anonymousPrivilegedClientIdentityWithUserIdentity:(id)a3;
+ (id)privilegedClientIdentityWithUserIdentity:(id)a3 kernel:(BOOL)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_checkIsAllowedToHaveSandboxExtensionForIdentity:(id)a3 containerPath:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7;
- (BOOL)_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:(id)a3 identifier:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7;
- (BOOL)_checkShouldIssueExtensionForIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsPolicyUsesProxiedClient:(BOOL)a6 issueExtension:(BOOL *)a7 error:(id *)a8;
- (BOOL)_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:(id)a3 clientIdentifier:(id)a4 containerConfig:(id)a5;
- (BOOL)_isClientAffordedSandboxForContainerIdentifier:(id)a3 containerConfig:(id)a4;
- (BOOL)_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:(id)a3 identifier:(id)a4;
- (BOOL)cached;
- (BOOL)isAllowedToAccessCodesignMapping;
- (BOOL)isAllowedToAccessContainerIdentity:(id)a3 error:(unint64_t *)a4;
- (BOOL)isAllowedToAccessInfoMetadata;
- (BOOL)isAllowedToAccessUserAssets;
- (BOOL)isAllowedToChangeReferences;
- (BOOL)isAllowedToControlCaches;
- (BOOL)isAllowedToDelete;
- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3;
- (BOOL)isAllowedToLookupContainerIdentity:(id)a3;
- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4;
- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isAllowedToReadReferences;
- (BOOL)isAllowedToRecreateContainerStructure;
- (BOOL)isAllowedToRegenerateDirectoryUUIDs;
- (BOOL)isAllowedToReplaceContainers;
- (BOOL)isAllowedToRestoreContainer;
- (BOOL)isAllowedToSetDataProtection;
- (BOOL)isAllowedToStageSharedContent;
- (BOOL)isAllowedToStartDataMigration;
- (BOOL)isAllowedToStartUserDataMigration;
- (BOOL)isAllowedToTest;
- (BOOL)isAllowedToWipeAnyDataContainer;
- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3;
- (BOOL)isKernel;
- (BOOL)isSandboxed;
- (BOOL)isTestClient;
- (Class)amfiClass;
- (MCMAMFI)amfi;
- (MCMClientCodeSignInfo)codeSignInfo;
- (MCMClientIdentity)init;
- (MCMClientIdentity)initWithPOSIXUser:(id)a3 POSIXPID:(int)a4 platform:(unsigned int)a5 userIdentity:(id)a6 proximateClient:(id)a7 auditToken:(id *)a8 codeSignInfo:(id)a9 sandboxed:(BOOL)a10 sandboxContainerURL:(id)a11 testClient:(BOOL)a12 kernel:(BOOL)a13;
- (MCMClientIdentity)proximateClient;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentity)userIdentity;
- (NSString)description;
- (NSURL)sandboxContainerURL;
- (char)issueSandboxExtensionWithIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsUseProxiedClient:(BOOL)a6 extensionsPolicyUsesProxiedClient:(BOOL)a7 error:(id *)a8;
- (container_client)createLibsystemClient;
- (id)clientIdentityByChangingCached:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)shortDescription;
- (int)posixPID;
- (unsigned)platform;
- (void)setAMFIClass:(Class)a3;
@end

@implementation MCMClientIdentity

- (MCMClientIdentity)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_188846000, v3, OS_LOG_TYPE_FAULT, "You cannot init this class directly.", v5, 2u);
  }

  return 0LL;
}

- (id)initInternal
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMClientIdentity;
  return -[MCMClientIdentity init](&v3, sel_init);
}

- (MCMClientIdentity)initWithPOSIXUser:(id)a3 POSIXPID:(int)a4 platform:(unsigned int)a5 userIdentity:(id)a6 proximateClient:(id)a7 auditToken:(id *)a8 codeSignInfo:(id)a9 sandboxed:(BOOL)a10 sandboxContainerURL:(id)a11 testClient:(BOOL)a12 kernel:(BOOL)a13
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v18 = a3;
  id v19 = a6;
  id v28 = a7;
  id v27 = a9;
  id v20 = a11;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MCMClientIdentity;
  v21 = -[MCMClientIdentity init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_posixUser, a3);
    v22->_posixPID = a4;
    v22->_platform = a5;
    objc_storeStrong((id *)&v22->_userIdentity, a6);
    objc_storeStrong((id *)&v22->_proximateClient, a7);
    __int128 v23 = *(_OWORD *)&a8->var0[4];
    *(_OWORD *)v22->_auditToken.val = *(_OWORD *)a8->var0;
    *(_OWORD *)&v22->_auditToken.val[4] = v23;
    objc_storeStrong((id *)&v22->_codeSignInfo, a9);
    v22->_sandboxed = a10;
    objc_storeStrong((id *)&v22->_sandboxContainerURL, a11);
    v22->_testClient = a12;
    v22->_kernel = a13;
    v22->_amfiClass = (Class)objc_opt_class();
  }

  return v22;
}

- (container_client)createLibsystemClient
{
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = [v15 identifier];
  [v14 UTF8String];
  v13 = -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  id v12 = [v13 teamIdentifier];
  [v12 UTF8String];
  -[MCMClientIdentity platform](self, "platform");
  v11 = -[MCMClientIdentity userIdentity](self, "userIdentity");
  id v3 = [v11 personaUniqueString];
  [v3 UTF8String];
  -[MCMClientIdentity posixUser](self, "posixUser");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 UID];
  v5 = -[MCMClientIdentity posixUser](self, "posixUser");
  [v5 primaryGID];
  -[MCMClientIdentity auditToken](self, "auditToken");
  -[MCMClientIdentity posixPID](self, "posixPID");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 isSigned];
  v7 = -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  [v7 isSignatureValid];
  v8 = -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  [v8 isPlatformBinary];
  v9 = (container_client *)container_client_initializer();

  return v9;
}

- (MCMAMFI)amfi
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  amfi = v2->_amfi;
  if (!amfi)
  {
    uint64_t v4 = -[objc_class alloc](-[MCMClientIdentity amfiClass](v2, "amfiClass"), "alloc");
    -[MCMClientIdentity auditToken](v2, "auditToken");
    uint64_t v5 = -[objc_class initWithAuditToken:](v4, "initWithAuditToken:", v9);
    uint64_t v6 = v2->_amfi;
    v2->_amfi = (MCMAMFI *)v5;

    amfi = v2->_amfi;
  }

  v7 = amfi;
  objc_sync_exit(v2);

  return v7;
}

- (MCMClientIdentity)proximateClient
{
  if (self->_proximateClient) {
    self = self->_proximateClient;
  }
  return self;
}

- (id)clientIdentityByChangingCached:(BOOL)a3
{
  uint64_t v4 = (_BYTE *)-[MCMClientIdentity copy](self, "copy");
  v4[27] = a3;
  return v4;
}

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 entitlements];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 isAllowedToLookupAllContainersOfClass:a3];

  return a3;
}

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 entitlements];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isAllowedToLookupContainerIdentity:v4];

  if (v7)
  {
    uint64_t v11 = 1LL;
    BOOL v8 = -[MCMClientIdentity isAllowedToAccessContainerIdentity:error:]( self,  "isAllowedToAccessContainerIdentity:error:",  v4,  &v11);
    if (!v8)
    {
      container_log_handle_for_category();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v13 = self;
        __int16 v14 = 2114;
        id v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Client %{public}@ is not allowed to access container identity %{public}@: error %llu",  buf,  0x20u);
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isAllowedToAccessContainerIdentity:(id)a3 error:(unint64_t *)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (!MCMRequirePersona_result)
  {
LABEL_20:
    BOOL v8 = 1;
    goto LABEL_21;
  }

  unint64_t v7 = [v6 containerClass];
  BOOL v8 = 1;
  if (v7 <= 0xE && ((1LL << v7) & 0x4ED4) != 0)
  {
    [v6 userIdentity];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v10 = [v9 personaType];

    if (v10 < 2)
    {
      v13 = -[MCMClientIdentity userIdentity](self, "userIdentity");
      [v6 userIdentity];
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        container_log_handle_for_category();
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v24 = -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
          [v24 identifier];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[MCMClientIdentity userIdentity](self, "userIdentity");
          [v6 userIdentity];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v28 = 138543874;
          objc_super v29 = v25;
          __int16 v30 = 2114;
          uint64_t v31 = (uint64_t)v26;
          __int16 v32 = 2114;
          v33 = v27;
          _os_log_fault_impl( &dword_188846000,  v16,  OS_LOG_TYPE_FAULT,  "Client %{public}@ user identity does not match container user identity (client: %{public}@; container: %{public}@)",
            (uint8_t *)&v28,
            0x20u);
        }

        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
        }
        if (!MCMRequirePersonaTelemetryOnly_result)
        {
          if (a4)
          {
            unint64_t v12 = 76LL;
            goto LABEL_24;
          }

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  id v6 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 entitlements];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v8 isAllowedToLookupGroupContainersOfClass:a3 ownedByIdentifiers:v6];

  return a3;
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 entitlements];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v8 isAllowedToLookupViaPrivateEntitlementWithClass:a3 identifier:v6];

  return a3;
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 entitlements];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = [v6 isAllowedToWipePlugInDataContainerWithIdentifier:v4];

  return (char)self;
}

- (BOOL)isAllowedToControlCaches
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToControlCaches];

  return v4;
}

- (BOOL)isAllowedToReplaceContainers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToReplaceContainers];

  return v4;
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToAccessInfoMetadata];

  return v4;
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToRecreateContainerStructure];

  return v4;
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToRegenerateDirectoryUUIDs];

  return v4;
}

- (BOOL)isAllowedToDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToDelete];

  return v4;
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToWipeAnyDataContainer];

  return v4;
}

- (BOOL)isAllowedToTest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToTest];

  return v4;
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

- (BOOL)isAllowedToSetDataProtection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToSetDataProtection];

  return v4;
}

- (BOOL)isAllowedToRestoreContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToRestoreContainer];

  return v4;
}

- (BOOL)isAllowedToStartDataMigration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToStartDataMigration];

  return v4;
}

- (BOOL)isAllowedToStartUserDataMigration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToStartUserDataMigration];

  return v4;
}

- (BOOL)isAllowedToStageSharedContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToStageSharedContent];

  return v4;
}

- (BOOL)isAllowedToAccessUserAssets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToAccessUserAssets];

  return v4;
}

- (BOOL)isAllowedToReadReferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToReadReferences];

  return v4;
}

- (BOOL)isAllowedToChangeReferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 entitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToChangeReferences];

  return v4;
}

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForIdentity:(id)a3 containerPath:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a5;
  BOOL v26 = 0;
  id v14 = a3;
  uint64_t v15 = [v14 containerClass];
  [v14 identifier];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[MCMClientIdentity isAllowedToLookupViaPrivateEntitlementWithClass:identifier:]( self,  "isAllowedToLookupViaPrivateEntitlementWithClass:identifier:",  v15,  v16))
  {
    if ([v12 transient])
    {
      uint64_t v17 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 72LL);
      if (a7) {
        goto LABEL_8;
      }
    }

    else
    {
      if (![v13 supportsProtectedContainerWithRestrictedEntitlement])
      {
        if (![v13 ownerIssuedSandboxExtension]
          || (-[MCMClientIdentity codeSignInfo](self, "codeSignInfo"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              [v22 entitlements],
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(),
              int v24 = [v23 isOwnerOfContainerWithClass:v15 identifier:v16],
              v23,
              v22,
              !v24))
        {
          uint64_t v17 = 0LL;
          goto LABEL_3;
        }

        goto LABEL_2;
      }

      id v25 = 0LL;
      BOOL v19 = -[MCMClientIdentity _checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:identifier:containerConfig:allowed:error:]( self,  "_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:identifier:containerConfig:allowed:error:",  v12,  v16,  v13,  &v26,  &v25);
      uint64_t v17 = (MCMError *)v25;
      if (v19) {
        goto LABEL_3;
      }
      container_log_handle_for_category();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int v28 = v16;
        __int16 v29 = 2112;
        __int16 v30 = v17;
        _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Failed to check whether to issue sandbox extension for [%@]; error = %@",
          buf,
          0x16u);
      }

      if (a7)
      {
LABEL_8:
        uint64_t v17 = v17;
        BOOL v18 = 0;
        *a7 = v17;
        goto LABEL_15;
      }
    }

    BOOL v18 = 0;
    goto LABEL_15;
  }

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:(id)a3 identifier:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v11 = a4;
  id v12 = a5;
  char v45 = 0;
  id v13 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 entitlements];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 containerRootURL];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  [v16 path];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = 0;
  BOOL v19 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v17,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v18,  0LL,  10LL,  2LL,  0LL,  0LL,  v38);

  id v44 = 0LL;
  LOBYTE(v17) = -[MCMFileHandle openWithError:](v19, "openWithError:", &v44);
  uint64_t v20 = (__CFString *)v44;
  v21 = v20;
  if ((v17 & 1) == 0)
  {
    container_log_handle_for_category();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [v14 identifier];
      v42 = v15;
      id v28 = v12;
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      __int16 v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v47 = v29;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2112;
      v51 = v30;
      __int16 v52 = 2112;
      v53 = v21;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "[%@] requesting [%@]: Failed to open [%@] during app group non-TCC policy protection check: %@",  buf,  0x2Au);

      id v12 = v28;
      uint64_t v15 = v42;
    }

    goto LABEL_15;
  }

  v40 = v12;
  v43 = v20;
  BOOL v22 = -[MCMFileHandle checkAppContainerProtection:error:](v19, "checkAppContainerProtection:error:", &v45, &v43);
  v39 = v43;

  container_log_handle_for_category();
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [v14 identifier];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v37;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2112;
      v21 = (__CFString *)v39;
      v51 = v39;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "[%@] requesting [%@]: Failed to check app group container non-TCC policy protection; error = %@",
        buf,
        0x20u);
    }

    else
    {
      v21 = (__CFString *)v39;
    }

    id v12 = v40;
LABEL_15:

    uint64_t v31 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v21,  v16,  144LL);
    -[MCMFileHandle close](v19, "close");
    if (a7)
    {
      uint64_t v31 = v31;
      BOOL v32 = 0;
      *a7 = v31;
    }

    else
    {
      BOOL v32 = 0;
    }

    goto LABEL_32;
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    [v14 identifier];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v25;
    if (v45) {
      BOOL v26 = &stru_18A29E970;
    }
    else {
      BOOL v26 = @"not ";
    }
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2112;
    v51 = v26;
    _os_log_impl( &dword_188846000,  v24,  OS_LOG_TYPE_DEFAULT,  "[%@] requesting [%@]: App group container is %@protected with a non-TCC policy",  buf,  0x20u);
  }

  if (([v15 isOwnerOfProtectedAppGroupContainerWithIdentifier:v11] & 1) == 0)
  {
    id v12 = v40;
    if (v45)
    {
      BOOL v33 = 0;
    }

    else
    {
      if (objc_msgSend( v15,  "isOwnerOfContainerWithClass:identifier:",  objc_msgSend(v40, "containerClass"),  v11))
      {
        [v14 identifier];
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v33 = -[MCMClientIdentity _isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:clientIdentifier:containerConfig:]( self,  "_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:clientIdentifier:containerConfig:",  v11,  v34,  v40);

        id v12 = v40;
      }

      else
      {
        BOOL v33 = 0;
      }

      if (!v45) {
        goto LABEL_25;
      }
    }

    if (([v15 isOwnerOfProtectedAppGroupContainerWithIdentifier:v11] & 1) == 0)
    {
      BOOL v27 = v33;
      goto LABEL_29;
    }

- (BOOL)_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:(id)a3 clientIdentifier:(id)a4 containerConfig:(id)a5
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[MCMClientIdentity _isClientAffordedSandboxForContainerIdentifier:containerConfig:]( self,  "_isClientAffordedSandboxForContainerIdentifier:containerConfig:",  v8,  v10))
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      BOOL v17 = 1;
      goto LABEL_15;
    }

    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    id v12 = "[%@] requesting [%@]: DEVELOPER ACTION REQUIRED. Requestor's signature is given temporary compatibility afford"
          "ance to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's"
          " team ID on this platform.";
LABEL_4:
    _os_log_impl(&dword_188846000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x16u);
    goto LABEL_11;
  }

  [v8 stringByExtractingTeamIDPrefix];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v11 && ![v10 alwaysRequireSignatureScrutiny])
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    id v12 = "[%@] requesting [%@]: The container IS NOT PROTECTED since it isn't prefixed by team ID. Group containers iden"
          "tifiers must be prefixed by requestor's team ID on this platform for container security to be enforced.";
    goto LABEL_4;
  }

  -[MCMClientIdentity amfi](self, "amfi");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:v10 teamID:v11];

  container_log_handle_for_category();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] requesting [%@]: APPROVED. Requestor's signature allows it to access a TCC-protected group container",  (uint8_t *)&v19,  0x16u);
    }

    goto LABEL_11;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "[%@] requesting [%@]: REJECTED. Requestor's signature does not allow it to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's team ID to allow access on this platform.",  (uint8_t *)&v19,  0x16u);
  }

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)_isClientAffordedSandboxForContainerIdentifier:(id)a3 containerConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 teamIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v7 sandboxAffordances];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:v9];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      [v6 lowercaseString];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v13 = [v11 containsObject:v12];
    }

    else
    {
      char v13 = 0;
    }
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 entitlements];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = [v7 containerClass];
  LOBYTE(v7) = [v9 isOwnerOfContainerWithClass:v10 identifier:v6];

  if ((v7 & 1) != 0)
  {
    char v11 = 1;
  }

  else
  {
    -[MCMClientIdentity userIdentity](self, "userIdentity");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v12 isDataSeparated];
  }

  return v11;
}

- (BOOL)_checkShouldIssueExtensionForIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsPolicyUsesProxiedClient:(BOOL)a6 issueExtension:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a5;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  BOOL v26 = 0;
  uint64_t v15 = [v13 containerClass];
  [v13 identifier];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = containermanager_copy_global_configuration();
  [v17 staticConfig];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 configForContainerClass:v15];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (BOOL v20 = -[MCMClientIdentity _shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:identifier:]( self,  "_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:identifier:",  v19,  v16),  v26 = v20,  !v20))
  {
    id v23 = 0LL;
    BOOL v21 = 1;
  }

  else
  {
    id v25 = 0LL;
    BOOL v21 = -[MCMClientIdentity _checkIsAllowedToHaveSandboxExtensionForIdentity:containerPath:containerConfig:allowed:error:]( self,  "_checkIsAllowedToHaveSandboxExtensionForIdentity:containerPath:containerConfig:allowed:error:",  v13,  v14,  v19,  &v26,  &v25);
    id v22 = v25;
    id v23 = v22;
    if (a8 && !v21)
    {
      id v23 = v22;
      LOBYTE(v21) = 0;
      *a8 = v23;
      goto LABEL_10;
    }
  }

  if (a7 && v21)
  {
    *a7 = v26;
    LOBYTE(v21) = 1;
  }

- (char)issueSandboxExtensionWithIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsUseProxiedClient:(BOOL)a6 extensionsPolicyUsesProxiedClient:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = [v14 containerClass];
  char v39 = 0;
  id v38 = 0LL;
  LODWORD(v11) = -[MCMClientIdentity _checkShouldIssueExtensionForIdentity:containerPath:legacyExtensionPolicy:extensionsPolicyUsesProxiedClient:issueExtension:error:]( self,  "_checkShouldIssueExtensionForIdentity:containerPath:legacyExtensionPolicy:extensionsPolicyUsesProxied Client:issueExtension:error:",  v14,  v15,  v11,  v9,  &v39,  &v38);
  id v17 = (MCMError *)v38;
  if (v11 && v39)
  {
    uint64_t v18 = v16 - 2;
    if ((unint64_t)(v16 - 2) <= 0xB && ((0xD35u >> v18) & 1) != 0)
    {
      id v23 = off_18A29C948[v18];
      [v15 containerDataURL];
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = [v24 path];
      uint64_t v26 = [v25 fileSystemRepresentation];

      -[MCMClientIdentity auditToken](self, "auditToken");
      if (!a6)
      {
        -[MCMClientIdentity proximateClient](self, "proximateClient");
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        id v28 = v27;
        if (v27) {
          [v27 auditToken];
        }
        else {
          memset(buf, 0, 32);
        }
        __int128 v43 = *(_OWORD *)buf;
        __int128 v44 = *(_OWORD *)&buf[16];
      }

      container_log_handle_for_category();
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_OWORD *)buf = v43;
        *(_OWORD *)&buf[16] = v44;
        int pid = container_audit_token_get_pid();
        [v14 identifier];
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [v14 containerClass];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v31;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v32;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v26;
        __int16 v41 = 2080;
        v42 = v23;
        _os_log_impl( &dword_188846000,  v29,  OS_LOG_TYPE_DEFAULT,  "Issuing token to pid %d for identifier = [%@](%llu), path = [%s] (extension class: %s)",  buf,  0x30u);
      }

      uint64_t v33 = container_sandbox_issue_custom_extension();
      if (v33)
      {
        BOOL v21 = (char *)v33;
        goto LABEL_10;
      }

      container_log_handle_for_category();
      __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
        char v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 identifier];
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
        int v37 = *__error();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v37;
        _os_log_error_impl( &dword_188846000,  v34,  OS_LOG_TYPE_ERROR,  "sandbox_extension_issue_file failed for %@ at path [%s]: %d",  buf,  0x1Cu);
      }

      uint64_t v19 = 90LL;
    }

    else
    {
      uint64_t v19 = 72LL;
    }

    BOOL v20 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", v19);

    id v17 = v20;
  }

  if (a8)
  {
    id v17 = v17;
    BOOL v21 = 0LL;
    *a8 = v17;
  }

  else
  {
    BOOL v21 = 0LL;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initInternal");
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 28) = self->_posixPID;
    objc_storeStrong((id *)(v4 + 40), self->_posixUser);
    *(_BYTE *)(v5 + 25) = self->_sandboxed;
    __int128 v6 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)(v5 + 80) = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)(v5 + 96) = v6;
    objc_storeStrong((id *)(v5 + 48), self->_proximateClient);
    objc_storeStrong((id *)(v5 + 56), self->_userIdentity);
    *(_BYTE *)(v5 + 26) = self->_kernel;
    *(_DWORD *)(v5 + 32) = self->_platform;
    objc_storeStrong((id *)(v5 + 64), self->_sandboxContainerURL);
    objc_storeStrong((id *)(v5 + 72), self->_codeSignInfo);
    *(_BYTE *)(v5 + 27) = self->_cached;
    *(void *)(v5 + 8) = self->_amfiClass;
    objc_storeStrong((id *)(v5 + 16), self->_amfi);
    *(_BYTE *)(v5 + 24) = self->_testClient;
  }

  return (id)v5;
}

- (NSString)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __32__MCMClientIdentity_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)shortDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __37__MCMClientIdentity_shortDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (Class)amfiClass
{
  return self->_amfiClass;
}

- (void)setAMFIClass:(Class)a3
{
  self->_amfiClass = a3;
}

- (BOOL)isTestClient
{
  return self->_testClient;
}

- (int)posixPID
{
  return self->_posixPID;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isKernel
{
  return self->_kernel;
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSURL)sandboxContainerURL
{
  return self->_sandboxContainerURL;
}

- (MCMClientCodeSignInfo)codeSignInfo
{
  return self->_codeSignInfo;
}

- (BOOL)cached
{
  return self->_cached;
}

- (void).cxx_destruct
{
}

id __37__MCMClientIdentity_shortDescription__block_invoke(uint64_t a1, int a2)
{
  __int128 v44 = (void *)NSString;
  [*(id *)(a1 + 32) codeSignInfo];
  id v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t)v4;
  if (a2)
  {
    uint64_t v6 = [v4 redactedDescription];
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)v7[6];
  v46 = v8;
  if (v8)
  {
    BOOL v9 = (void *)NSString;
    [v8 codeSignInfo];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 identifier];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringWithFormat:@"(%@)", v31];
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v7 = *(void **)(a1 + 32);
  }

  else
  {
    v51 = &stru_18A29E970;
  }

  [v7 codeSignInfo];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 teamIdentifier];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (uint64_t)v10;
  v47 = (void *)v6;
  __int128 v43 = v10;
  if (a2)
  {
    uint64_t v12 = [v10 redactedDescription];
    [*(id *)(a1 + 32) userIdentity];
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 shortDescription];
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v30 redactedDescription];
    uint64_t v40 = v12;
    v42 = (void *)v12;
  }

  else
  {
    [*(id *)(a1 + 32) userIdentity];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 shortDescription];
    uint64_t v50 = v40 = v11;
    __int16 v41 = (void *)v50;
  }

  __int16 v48 = v5;
  [*(id *)(a1 + 32) posixUser];
  char v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v39 UID];
  uint64_t v36 = [*(id *)(a1 + 32) posixPID];
  uint64_t v35 = [*(id *)(a1 + 32) isSandboxed];
  uint64_t v34 = [*(id *)(a1 + 32) platform];
  [*(id *)(a1 + 32) codeSignInfo];
  id v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [v38 isSigned];
  [*(id *)(a1 + 32) codeSignInfo];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 isSignatureValid];
  [*(id *)(a1 + 32) codeSignInfo];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 isPlatformBinary];
  [*(id *)(a1 + 32) sandboxContainerURL];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 path];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v18;
  BOOL v20 = v18;
  if (a2)
  {
    [v18 redactedDescription];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else {
    BOOL v21 = "";
  }
  [*(id *)(a1 + 32) codeSignInfo];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 cached];
  int v24 = ", cs cached";
  if (!v23) {
    int v24 = "";
  }
  [v44 stringWithFormat:@"<%@%@/%@, u=%@, uid=%u, pid=%u, sandboxed=%d, platform=%d (%d/%d/%d) [%@]%s%s>", v47, v51, v40, v50, v37, v36, v35, v34, v33, v14, v16, v20, v21, v24];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    uint64_t v19 = v15;
    id v17 = v13;
    id v15 = v38;
    id v13 = v39;
    uint64_t v26 = v48;
    uint64_t v27 = v30;
    id v28 = (void *)v50;
  }

  else
  {
    id v28 = v38;
    uint64_t v27 = v39;
    uint64_t v26 = v48;
  }

  if (v46)
  {
  }

  if (a2) {

  }
  return v25;
}

id __32__MCMClientIdentity_description__block_invoke(uint64_t a1, int a2)
{
  id v49 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48LL);
  v53 = v5;
  uint64_t v47 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = (void *)NSString;
    [v5 codeSignInfo];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 identifier];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"(via [%@]) ", v33];
    id v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = &stru_18A29E970;
  }

  [*(id *)(a1 + 32) codeSignInfo];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v51 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (uint64_t)v8;
  __int16 v52 = (__CFString *)v7;
  uint64_t v50 = v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    [*(id *)(a1 + 32) codeSignInfo];
    __int16 v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 teamIdentifier];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v46 redactedDescription];
    [*(id *)(a1 + 32) userIdentity];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = [v32 redactedDescription];
    [*(id *)(a1 + 32) posixUser];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = [v31 redactedDescription];
    uint64_t v42 = v10;
    __int128 v44 = (void *)v11;
    uint64_t v45 = (void *)v10;
    uint64_t v41 = v11;
  }

  else
  {
    [*(id *)(a1 + 32) codeSignInfo];
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v45 teamIdentifier];
    uint64_t v13 = [*(id *)(a1 + 32) userIdentity];
    [*(id *)(a1 + 32) posixUser];
    uint64_t v42 = v9;
    uint64_t v43 = v13;
    v46 = (void *)v13;
    __int16 v48 = (void *)v12;
    v55 = uint64_t v41 = v12;
    __int128 v44 = (void *)v55;
  }

  uint64_t v38 = [*(id *)(a1 + 32) posixPID];
  uint64_t v37 = [*(id *)(a1 + 32) isSandboxed];
  uint64_t v36 = [*(id *)(a1 + 32) platform];
  [*(id *)(a1 + 32) codeSignInfo];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v14 = @"NO";
  }
  uint64_t v35 = v14;
  [*(id *)(a1 + 32) codeSignInfo];
  char v39 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v15 = @"NO";
  }
  [*(id *)(a1 + 32) codeSignInfo];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v17 = @"NO";
  }
  [*(id *)(a1 + 32) sandboxContainerURL];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 path];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v20 = v19;
  BOOL v21 = v19;
  int v22 = a2;
  if (a2)
  {
    [v19 redactedDescription];
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else {
    int v23 = "";
  }
  [*(id *)(a1 + 32) codeSignInfo];
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v25 = [v24 cached];
  uint64_t v26 = ", cs cached";
  if (!v25) {
    uint64_t v26 = "";
  }
  uint64_t v27 = (void *)v43;
  objc_msgSend( v49,  "stringWithFormat:",  @"<%@: %p; %@identifier = %@, teamIdentifier = %@, userIdentity = %@, posixUser = %@, posixPID = %u, isSandboxed = %d, platform = %d, isSigned = %@, isSignatureValid = %@, isPlatformBinary = %@, sandboxContainerURL = [%@]%s%s>",
    v54,
    v47,
    v52,
    v42,
    v41,
    v43,
    v55,
    v38,
    v37,
    v36,
    v35,
    v15,
    v17,
    v21,
    v23,
    v26);
  id v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {

    BOOL v20 = v40;
    uint64_t v16 = v31;
    __int16 v29 = v32;
    uint64_t v18 = (void *)v55;
  }

  else
  {
    uint64_t v27 = v39;
    __int16 v29 = v40;
  }

  if (v53)
  {
  }

  return v28;
}

+ (id)anonymousPrivilegedClientIdentityWithUserIdentity:(id)a3
{
  return (id)[a1 privilegedClientIdentityWithUserIdentity:a3 kernel:0];
}

+ (id)privilegedClientIdentityWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = a3;
  container_codesign_get_self_audit_token();
  id v7 = objc_alloc(&OBJC_CLASS___MCMEntitlements);
  id v8 = containermanager_copy_global_configuration();
  [v8 classIterator];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( v7,  "initWithEntitlements:clientIdentifier:classIterator:",  &unk_18A2BD338,  @"com.apple.containermanagerd",  v9);

  uint64_t v11 = objc_alloc(&OBJC_CLASS___MCMClientCodeSignInfo);
  uint64_t v12 = (void *)objc_opt_new();
  uint64_t v13 = -[MCMClientCodeSignInfo initWithCDHash:entitlements:identifier:teamIdentifier:status:]( v11,  "initWithCDHash:entitlements:identifier:teamIdentifier:status:",  v12,  v10,  @"com.apple.containermanagerd",  0LL,  7LL);

  id v14 = objc_alloc((Class)a1);
  id v15 = containermanager_copy_global_configuration();
  [v15 currentUser];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = getpid();
  *(_OWORD *)buf = 0u;
  __int128 v24 = 0u;
  BYTE1(v22) = a4;
  LOBYTE(v22) = 0;
  LOBYTE(v21) = 0;
  uint64_t v18 = (void *)objc_msgSend( v14,  "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:san dboxContainerURL:testClient:kernel:",  v16,  v17,  dyld_get_active_platform(),  v6,  0,  buf,  v13,  v21,  0,  v22);

  if (!v18)
  {
    container_log_handle_for_category();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188846000, v19, OS_LOG_TYPE_FAULT, "Could not generate privileged client", buf, 2u);
    }
  }

  return v18;
}

@end