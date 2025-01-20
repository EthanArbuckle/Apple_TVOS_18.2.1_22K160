@interface MCMEntitlements
+ (id)appGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)copyGroupEntitlementForIdentifier:(id)a3 entitlements:(id)a4 groupKey:(id)a5;
+ (id)noReferenceAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)protectedAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)publicAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
+ (id)publicEntitlementForGroupContainerClass:(unint64_t)a3;
+ (id)systemGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4;
- (BOOL)allowed;
- (BOOL)canControlCaches;
- (BOOL)canDelete;
- (BOOL)canDeleteContainerContent;
- (BOOL)canManageUserManagedAssets;
- (BOOL)canPerformDataMigration;
- (BOOL)canReadReferences;
- (BOOL)canReadWriteReferences;
- (BOOL)canRepair;
- (BOOL)canStageSharedContent;
- (BOOL)hasDaemonContainer;
- (BOOL)hasSystemContainer;
- (BOOL)isAllowedToAccessCodesignMapping;
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
- (BOOL)isEntitledForLookupWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isOwnerOfContainerWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isOwnerOfProtectedAppGroupContainerWithIdentifier:(id)a3;
- (BOOL)negatesReferenceToAppGroupIdentifier:(id)a3;
- (BOOL)otherIDLookup;
- (BOOL)privileged;
- (BOOL)proxyAllowed;
- (BOOL)requestsNoContainer;
- (BOOL)testabilityAllowed;
- (MCMContainerClassIterator)classIterator;
- (MCMEntitlements)initWithEntitlements:(id)a3 clientIdentifier:(id)a4 classIterator:(id)a5;
- (NSDictionary)lookup;
- (NSDictionary)rawEntitlements;
- (NSString)identifier;
- (id)_arrayOfStringsFromArray:(id)a3;
- (id)_setOfStringsFromArray:(id)a3;
- (id)appGroupIdentifiers;
- (id)containerRequiredIdentifier;
- (id)copyEntitlementsDictionaryByAddingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4;
- (id)copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:(id)a3;
- (id)copyEntitlementsDictionaryByRemovingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4;
- (id)copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:(id)a3;
- (id)initForPrivilegedAnonymous;
- (id)lookupForContainerClass:(unint64_t)a3;
- (id)noReferenceAppGroupIdentifiers;
- (id)protectedAppGroupIdentifiers;
- (id)publicAppGroupIdentifiers;
- (id)systemGroupIdentifiers;
- (int)_dataProtectionClassFromString:(id)a3;
- (int)dataProtectionClassIfAvailable;
- (int)intendedDataProtectionClass;
- (void)prune;
- (void)setRawEntitlements:(id)a3;
@end

@implementation MCMEntitlements

- (MCMEntitlements)initWithEntitlements:(id)a3 clientIdentifier:(id)a4 classIterator:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMEntitlements;
  v11 = -[MCMEntitlements init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isSimulatorTestClient = 0;
    if (v8) {
      v13 = v8;
    }
    else {
      v13 = (void *)MEMORY[0x189604A60];
    }
    objc_storeStrong((id *)&v11->_rawEntitlements, v13);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_privileged = 0;
    lookup = v12->_lookup;
    v12->_lookup = 0LL;

    objc_storeStrong((id *)&v12->_classIterator, a5);
  }

  return v12;
}

- (id)initForPrivilegedAnonymous
{
  v2 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:]( self,  "initWithEntitlements:clientIdentifier:classIterator:",  0LL,  @"com.apple.containermanagerd",  0LL);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isSimulatorTestClient = 256;
    lookup = v2->_lookup;
    v2->_lookup = 0LL;
  }

  return v3;
}

- (BOOL)proxyAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.proxy"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)testabilityAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.testability"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)hasSystemContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.security.system-container"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)allowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.allowed"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)otherIDLookup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.otherIdLookup"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.delete"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canManageUserManagedAssets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.userManagedAssets"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canControlCaches
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.cacheControl"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canRepair
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.repair"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canStageSharedContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.stageSharedContent"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canPerformDataMigration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.dataMigration"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canDeleteContainerContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.deleteContainerContent"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)requestsNoContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.security.no-container"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canReadReferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.references.read-only"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)canReadWriteReferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.references.read-write"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)hasDaemonContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.private.security.daemon-container"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (NSDictionary)lookup
{
  lookup = self->_lookup;
  if (!lookup)
  {
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.lookup"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSDictionary *)v6;
    }
    else {
      v7 = 0LL;
    }

    id v8 = self->_lookup;
    self->_lookup = v7;

    lookup = self->_lookup;
  }

  return lookup;
}

- (BOOL)isEntitledForLookupWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  v7 = -[MCMEntitlements identifier](self, "identifier");
  if (a3 == 13)
  {
    v11 = (void *)objc_opt_class();
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v11 systemGroupIdentifiersForIdentifier:v7 entitlements:v9];
  }

  else
  {
    if (a3 != 7) {
      goto LABEL_7;
    }
    id v8 = (void *)objc_opt_class();
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v8 appGroupIdentifiersForIdentifier:v7 entitlements:v9];
  }

  v12 = (void *)v10;

  char v13 = [v12 containsObject:v6];
  if ((v13 & 1) != 0)
  {
    v14 = 0LL;
LABEL_10:
    char v16 = 1;
    goto LABEL_12;
  }

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  if (self->_isSimulatorTestClient
    || -[MCMEntitlements allowed](self, "allowed")
    || -[MCMEntitlements otherIDLookup](self, "otherIDLookup"))
  {
    return 1;
  }
  v7 = -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
  id v8 = v7;
  BOOL v5 = v7 && ![v7 count];

  return v5;
}

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || -[MCMEntitlements privileged](self, "privileged")
      || -[MCMEntitlements allowed](self, "allowed"))
    {
      char v5 = 1;
      goto LABEL_9;
    }

    [v4 identifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 containerClass];
    -[MCMEntitlements identifier](self, "identifier");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MCMEntitlements otherIDLookup](self, "otherIDLookup")) {
      goto LABEL_11;
    }
    if (v9 == 13)
    {
      v14 = +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
      char v15 = [v14 systemGroupContainerIdIsWellknown:v8];

      if ((v15 & 1) == 0 && ([v8 isEqualToString:v10] & 1) == 0) {
        goto LABEL_25;
      }
    }

    else if (v9 == 12)
    {
      v11 = +[MCMEntitlementBypassList sharedBypassList](&OBJC_CLASS___MCMEntitlementBypassList, "sharedBypassList");
      char v12 = [v11 systemContainerIdIsWellknown:v8];

      if ((v12 & 1) == 0)
      {
        if ([v8 isEqualToString:v10])
        {
          BOOL v13 = -[MCMEntitlements hasSystemContainer](self, "hasSystemContainer");
LABEL_24:
          char v5 = v13;
          goto LABEL_12;
        }

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (v6)
  {
    if (-[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements otherIDLookup](self, "otherIDLookup")
      || [v6 count] == 1
      && ([v6 anyObject],
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(),
          -[MCMEntitlements identifier](self, "identifier"),
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(),
          char v11 = [v9 isEqualToString:v10],
          v10,
          v9,
          (v11 & 1) != 0))
    {
      BOOL v7 = 1;
    }

    else
    {
      -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
      char v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12;
      BOOL v7 = v12 && ![v12 count];
    }
  }

  else
  {
    container_log_handle_for_category();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136446466;
      char v16 = "-[MCMEntitlements isAllowedToLookupGroupContainersOfClass:ownedByIdentifiers:]";
      __int16 v17 = 1024;
      int v18 = 301;
      _os_log_fault_impl( &dword_188846000,  v8,  OS_LOG_TYPE_FAULT,  "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v15,
        0x12u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)lookupForContainerClass:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v3 = self;
  objc_sync_enter(v3);
  if (!v3->_sanitizedLookup)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMEntitlements lookup](v3, "lookup");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1895CE3A8]();
      -[MCMEntitlements classIterator](v3, "classIterator");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __43__MCMEntitlements_lookupForContainerClass___block_invoke;
      v14[3] = &unk_18A29E3C8;
      v14[4] = v3;
      id v15 = v4;
      [v7 selectWithFlags:393216 iterator:v14];

      objc_autoreleasePoolPop(v6);
    }

    uint64_t v8 = [v4 copy];
    sanitizedLookup = v3->_sanitizedLookup;
    v3->_sanitizedLookup = (NSDictionary *)v8;
  }

  objc_sync_exit(v3);

  uint64_t v10 = v3->_sanitizedLookup;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:container_class_normalized()];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
  char v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (-[MCMEntitlements allowed](self, "allowed") || -[MCMEntitlements otherIDLookup](self, "otherIDLookup"))
  {
    BOOL v7 = 0LL;
  }

  else
  {
    -[MCMEntitlements lookupForContainerClass:](self, "lookupForContainerClass:", a3);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v10;
    if (!v10)
    {
      char v8 = 0;
      goto LABEL_5;
    }

    if ([v10 count])
    {
      char v8 = [v7 containsObject:v6];
      goto LABEL_5;
    }
  }

  char v8 = 1;
LABEL_5:

  return v8;
}

- (BOOL)isOwnerOfContainerWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (a3 != 7)
    {
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        if (!-[MCMEntitlements hasSystemContainer](self, "hasSystemContainer")) {
          goto LABEL_13;
        }
      }

      else if (a3 == 10 && !-[MCMEntitlements hasDaemonContainer](self, "hasDaemonContainer"))
      {
        goto LABEL_13;
      }

      -[MCMEntitlements identifier](self, "identifier");
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v6 isEqualToString:v11];

      goto LABEL_14;
    }

    -[MCMEntitlements appGroupIdentifiers](self, "appGroupIdentifiers");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  char v8 = v7;
  char v9 = [v7 containsObject:v6];

  if ((v9 & 1) == 0)
  {
LABEL_13:
    char v10 = 0;
    goto LABEL_14;
  }

  char v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)isOwnerOfProtectedAppGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMEntitlements protectedAppGroupIdentifiers](self, "protectedAppGroupIdentifiers");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = [v5 containsObject:v4];

  return (char)self;
}

- (int)intendedDataProtectionClass
{
  int result = -[MCMEntitlements dataProtectionClassIfAvailable](self, "dataProtectionClassIfAvailable");
  if (!result)
  {
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }

    if (v7) {
      goto LABEL_14;
    }
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"data-protection-class"];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v10 = v9;
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0LL;

    if (v7) {
      goto LABEL_14;
    }
    -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"DataProtectionClass"];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v13 = v12;
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0LL;

    if (v7)
    {
LABEL_14:
      int v14 = -[MCMEntitlements _dataProtectionClassFromString:](self, "_dataProtectionClassFromString:", v7);

      return v14;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (int)dataProtectionClassIfAvailable
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v3 = -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  [v3 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = v5;

      int v7 = -[MCMEntitlements _dataProtectionClassFromString:](self, "_dataProtectionClassFromString:", v6);
LABEL_18:

      goto LABEL_19;
    }

    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCMEntitlements _arrayOfStringsFromArray:](self, "_arrayOfStringsFromArray:", v6);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            int v13 = -[MCMEntitlements _dataProtectionClassFromString:]( self,  "_dataProtectionClassFromString:",  *(void *)(*((void *)&v16 + 1) + 8 * i));
            if (v13)
            {
              int v7 = v13;
              goto LABEL_17;
            }
          }

          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      int v7 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }

  int v7 = 0;
LABEL_19:

  return v7;
}

- (id)publicAppGroupIdentifiers
{
  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 publicAppGroupIdentifiersForIdentifier:v4 entitlements:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)protectedAppGroupIdentifiers
{
  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 protectedAppGroupIdentifiersForIdentifier:v4 entitlements:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appGroupIdentifiers
{
  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appGroupIdentifiersForIdentifier:v4 entitlements:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)noReferenceAppGroupIdentifiers
{
  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 noReferenceAppGroupIdentifiersForIdentifier:v4 entitlements:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)systemGroupIdentifiers
{
  v3 = (void *)objc_opt_class();
  -[MCMEntitlements identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 systemGroupIdentifiersForIdentifier:v4 entitlements:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)containerRequiredIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"com.apple.private.security.container-required"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_self();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
    {
    }

    else if (!v4)
    {
      goto LABEL_6;
    }

    -[MCMEntitlements identifier](self, "identifier");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  if (([v4 isEqual:&stru_18A29E970] & 1) == 0)
  {
    id v7 = v4;
LABEL_9:
    uint64_t v10 = v7;
    goto LABEL_10;
  }

- (BOOL)negatesReferenceToAppGroupIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMEntitlements noReferenceAppGroupIdentifiers](self, "noReferenceAppGroupIdentifiers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  BOOL v7 = v5 && ([v5 containsObject:v4] & 1) != 0;

  return v7;
}

- (BOOL)isAllowedToControlCaches
{
  return -[MCMEntitlements allowed](self, "allowed") || -[MCMEntitlements canControlCaches](self, "canControlCaches");
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canDeleteContainerContent](self, "canDeleteContainerContent");
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    if (self->_isSimulatorTestClient
      || -[MCMEntitlements isAllowedToWipeAnyDataContainer](self, "isAllowedToWipeAnyDataContainer"))
    {
      char v5 = 1;
    }

    else
    {
      BOOL v7 = self;
      objc_sync_enter(v7);
      if (!v7->_sanitizedWipe)
      {
        -[MCMEntitlements rawEntitlements](v7, "rawEntitlements");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectForKeyedSubscript:@"com.apple.private.MobileContainerManager.wipeContainer"];
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v10 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v11 = v10;
        }
        else {
          id v11 = 0LL;
        }

        if (v11)
        {
          objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v11, "count"));
          char v12 = (void *)objc_claimAutoreleasedReturnValue();
          for (unint64_t i = 0; i < [v11 count]; ++i)
          {
            [v11 objectAtIndexedSubscript:i];
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            id v15 = v14;
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              id v16 = v15;
            }
            else {
              id v16 = 0LL;
            }

            if (v16) {
              [v12 addObject:v16];
            }
          }

          uint64_t v17 = [v12 copy];
          sanitizedWipe = v7->_sanitizedWipe;
          v7->_sanitizedWipe = (NSSet *)v17;
        }
      }

      objc_sync_exit(v7);

      char v5 = -[NSSet containsObject:](v7->_sanitizedWipe, "containsObject:", v4);
    }
  }

  else
  {
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136446466;
      uint64_t v21 = "-[MCMEntitlements isAllowedToWipePlugInDataContainerWithIdentifier:]";
      __int16 v22 = 1024;
      int v23 = 619;
      _os_log_fault_impl( &dword_188846000,  v6,  OS_LOG_TYPE_FAULT,  "Invalid nil parameter passed to %{public}s; %d",
        (uint8_t *)&v20,
        0x12u);
    }

    char v5 = 0;
  }

  return v5;
}

- (BOOL)isAllowedToReplaceContainers
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToDelete
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToTest
{
  return -[MCMEntitlements testabilityAllowed](self, "testabilityAllowed");
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToSetDataProtection
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToRestoreContainer
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToStartDataMigration
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canPerformDataMigration](self, "canPerformDataMigration");
}

- (BOOL)isAllowedToStartUserDataMigration
{
  return -[MCMEntitlements allowed](self, "allowed");
}

- (BOOL)isAllowedToStageSharedContent
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canStageSharedContent](self, "canStageSharedContent");
}

- (BOOL)isAllowedToAccessUserAssets
{
  return -[MCMEntitlements allowed](self, "allowed")
      || -[MCMEntitlements canManageUserManagedAssets](self, "canManageUserManagedAssets");
}

- (BOOL)isAllowedToReadReferences
{
  return -[MCMEntitlements canReadReferences](self, "canReadReferences")
      || -[MCMEntitlements canReadWriteReferences](self, "canReadWriteReferences");
}

- (BOOL)isAllowedToChangeReferences
{
  return -[MCMEntitlements canReadWriteReferences](self, "canReadWriteReferences");
}

- (void)prune
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 allKeys];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 arrayByExcludingToObjectsInArray:&unk_18A2BE8D8];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryWithValuesForKeys:v7];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMEntitlements setRawEntitlements:](self, "setRawEntitlements:", v6);
}

- (id)copyEntitlementsDictionaryByRemovingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    id v7 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:]( self,  "copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:",  v6);
  }

  else
  {
    if (a3 != 7)
    {
      -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = (void *)[v9 copy];

      goto LABEL_7;
    }

    id v7 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:]( self,  "copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:",  v6);
  }

  id v8 = v7;
LABEL_7:

  return v8;
}

- (id)copyEntitlementsDictionaryByRemovingAppGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v5 mutableCopy];

  -[MCMEntitlements publicAppGroupIdentifiers](self, "publicAppGroupIdentifiers");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v7 mutableCopy];

  -[MCMEntitlements protectedAppGroupIdentifiers](self, "protectedAppGroupIdentifiers");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[v9 mutableCopy];

  if (!v8)
  {
    [v6 removeObjectForKey:@"com.apple.security.application-groups"];
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    [v6 removeObjectForKey:@"com.apple.private.security.restricted-application-groups"];
    goto LABEL_6;
  }

  [v8 removeObject:v4];
  [v8 allObjects];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v11 forKeyedSubscript:@"com.apple.security.application-groups"];

  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  [v10 removeObject:v4];
  [v10 allObjects];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v12 forKeyedSubscript:@"com.apple.private.security.restricted-application-groups"];

LABEL_6:
  int v13 = (void *)[v6 copy];

  return v13;
}

- (id)copyEntitlementsDictionaryByRemovingSystemGroupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v5 mutableCopy];

  -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v7 mutableCopy];

  [v6 removeObjectForKey:@"com.apple.security.system-group-containers"];
  if (v8)
  {
    [v8 removeObject:v4];
    [v8 allObjects];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v9 forKeyedSubscript:@"com.apple.security.system-groups"];
  }

  else
  {
    [v6 removeObjectForKey:@"com.apple.security.system-groups"];
  }

  id v10 = (void *)[v6 copy];

  return v10;
}

- (id)copyEntitlementsDictionaryByAddingGroupContainerOfClass:(unint64_t)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  -[MCMEntitlements rawEntitlements](self, "rawEntitlements");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v7 mutableCopy];

  [(id)objc_opt_class() publicEntitlementForGroupContainerClass:a3];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3 == 13)
    {
      -[MCMEntitlements systemGroupIdentifiers](self, "systemGroupIdentifiers");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = (void *)[v15 mutableCopy];
      uint64_t v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }

      else
      {
        [MEMORY[0x189603FE0] set];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      __int128 v19 = v18;

      [v8 removeObjectForKey:@"com.apple.security.system-group-containers"];
    }

    else if (a3 == 7)
    {
      -[MCMEntitlements publicAppGroupIdentifiers](self, "publicAppGroupIdentifiers");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = (void *)[v10 mutableCopy];
      char v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }

      else
      {
        [MEMORY[0x189603FE0] set];
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }

      __int128 v19 = v13;
    }

    else
    {
      __int128 v19 = 0LL;
    }

    [v19 addObject:v6];
    [v19 allObjects];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v20 forKeyedSubscript:v9];

    int v14 = (void *)[v8 copy];
  }

  else
  {
    int v14 = 0LL;
  }

  return v14;
}

- (id)_setOfStringsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189603FE0];
  id v4 = a3;
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  id v11 = __42__MCMEntitlements__setOfStringsFromArray___block_invoke;
  char v12 = &unk_18A29DE20;
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:&v9];

  id v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (id)_arrayOfStringsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189603FA8];
  id v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  id v11 = __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke;
  char v12 = &unk_18A29DE20;
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:&v9];

  id v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (int)_dataProtectionClassFromString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x189607508]])
  {
    int v4 = 1;
    goto LABEL_9;
  }

  if ([v3 isEqualToString:*MEMORY[0x189607510]])
  {
LABEL_4:
    int v4 = 2;
    goto LABEL_9;
  }

  if ([v3 isEqualToString:*MEMORY[0x189607518]]) {
    goto LABEL_6;
  }
  if ([v3 isEqualToString:*MEMORY[0x189607538]])
  {
    int v4 = 4;
    goto LABEL_9;
  }

  if ([v3 isEqualToString:*MEMORY[0x189607540]]) {
    goto LABEL_4;
  }
  if ([v3 isEqualToString:*MEMORY[0x189607520]])
  {
LABEL_6:
    int v4 = 3;
    goto LABEL_9;
  }

  if ([v3 isEqualToString:*MEMORY[0x189607528]])
  {
    int v4 = 7;
  }

  else
  {
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( &dword_188846000,  v6,  OS_LOG_TYPE_DEFAULT,  "Unrecognized value for data protection entitlement: [%@]",  (uint8_t *)&v7,  0xCu);
    }

    int v4 = 0;
  }

- (NSDictionary)rawEntitlements
{
  return self->_rawEntitlements;
}

- (void)setRawEntitlements:(id)a3
{
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

void __44__MCMEntitlements__arrayOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __42__MCMEntitlements__setOfStringsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __43__MCMEntitlements_lookupForContainerClass___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  [v15 name];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    int v4 = (void *)MEMORY[0x189607968];
    [v15 containerClass];
    [v4 numberWithUnsignedLongLong:container_class_normalized()];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) lookup];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v3];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v9 = [*(id *)(a1 + 32) _setOfStringsFromArray:v8];
        goto LABEL_5;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
      {
        uint64_t v9 = [MEMORY[0x189604010] set];
LABEL_5:
        uint64_t v10 = (void *)v9;
        if (v9)
        {
          [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            char v12 = (void *)[v10 mutableCopy];
            [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 unionSet:v13];

            uint64_t v14 = [v12 copy];
            uint64_t v10 = (void *)v14;
          }

          [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
        }
      }
    }
  }
}

+ (id)copyGroupEntitlementForIdentifier:(id)a3 entitlements:(id)a4 groupKey:(id)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  [a4 objectForKeyedSubscript:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    goto LABEL_19;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) != 0)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:&v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_5:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:&v21 count:16];
          if (v13) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      container_log_handle_for_category();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v7;
      __int128 v19 = "Entitlement %@ for %@ contains non-string values; ignoring.";
      goto LABEL_22;
    }

+ (id)publicAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  return (id)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.security.application-groups"];
}

+ (id)protectedAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  return (id)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.private.security.restricted-application-groups"];
}

+ (id)appGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v6 = (void *)MEMORY[0x189603FE0];
  id v7 = a4;
  id v8 = a3;
  [v6 set];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 publicAppGroupIdentifiersForIdentifier:v8 entitlements:v7];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 protectedAppGroupIdentifiersForIdentifier:v8 entitlements:v7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 unionSet:v10];
  [v9 unionSet:v11];
  if ([v9 count]) {
    uint64_t v12 = (void *)[v9 copy];
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)noReferenceAppGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  int v4 = (void *)[a1 copyGroupEntitlementForIdentifier:a3 entitlements:a4 groupKey:@"com.apple.private.MobileContainerManager.appGroup.noReference"];
  char v5 = v4;
  if (v4 && ![v4 count]) {
    id v6 = 0LL;
  }
  else {
    id v6 = v5;
  }

  return v6;
}

+ (id)systemGroupIdentifiersForIdentifier:(id)a3 entitlements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[a1 copyGroupEntitlementForIdentifier:v6 entitlements:v7 groupKey:@"com.apple.security.system-groups"];
  uint64_t v9 = v8;
  if (v8 && [v8 count]
    || (v10 = (void *)[a1 copyGroupEntitlementForIdentifier:v6 entitlements:v7 groupKey:@"com.apple.security.system-group-containers"],  v9,  (uint64_t v9 = v10) != 0))
  {
    if ([v9 count])
    {
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_9420];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 filteredSetUsingPredicate:v11];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  return v10;
}

+ (id)publicEntitlementForGroupContainerClass:(unint64_t)a3
{
  id v3 = @"com.apple.security.system-groups";
  if (a3 != 13) {
    id v3 = 0LL;
  }
  if (a3 == 7) {
    return @"com.apple.security.application-groups";
  }
  else {
    return (id)v3;
  }
}

uint64_t __68__MCMEntitlements_systemGroupIdentifiersForIdentifier_entitlements___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = [v2 hasPrefix:@"systemgroup."];
  if ((v3 & 1) == 0)
  {
    container_log_handle_for_category();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_error_impl( &dword_188846000,  v4,  OS_LOG_TYPE_ERROR,  "System group ID %@ does not have proper prefix, ignoring.",  (uint8_t *)&v6,  0xCu);
    }
  }

  return v3;
}

@end