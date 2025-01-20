@interface MILaunchServicesDatabaseGatherer
+ (BOOL)enumerateAppExtensionsInBundle:(id)a3 forPersona:(id)a4 updatingAppExtensionParentID:(BOOL)a5 ensureAppExtensionsAreExecutable:(BOOL)a6 installProfiles:(BOOL)a7 error:(id *)a8 enumerator:(id)a9;
+ (id)_createDataContainerAndSetDataProtectionForBundle:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)_createPluginDataContainerForAppexBundle:(id)a3 forPersona:(id)a4 setParent:(id)a5;
+ (id)entryForBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
+ (id)fetchInfoForBundle:(id)a3 forPersona:(id)a4 inContainer:(id)a5 withError:(id *)a6;
- (BOOL)_scanAppExtensionsInBundle:(id)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_scanBundle:(id)a3 inContainer:(id)a4 addingToBundleSet:(id)a5 enumeratingEntry:(id)a6 withError:(id *)a7;
- (BOOL)performGatherWithError:(id *)a3;
- (BOOL)scanAppExtensionsInFrameworkBundle:(id)a3 withError:(id *)a4;
- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
- (BOOL)shouldUpdateAppExtensionDataContainersWithParentID;
- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 enumerator:(id)a4;
- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 personaUniqueString:(id)a4 enumerator:(id)a5;
- (NSMutableSet)appExtensions;
- (NSMutableSet)coreServices;
- (NSMutableSet)frameworks;
- (NSMutableSet)internalApps;
- (NSMutableSet)systemAppPlaceholders;
- (NSMutableSet)systemApps;
- (NSMutableSet)userApps;
- (NSString)personaUniqueString;
- (id)_setForEntry:(id)a3;
- (id)enumerator;
- (unint64_t)gatherOptions;
- (void)errorOccurred:(id)a3;
@end

@implementation MILaunchServicesDatabaseGatherer

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 personaUniqueString:(id)a4 enumerator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MILaunchServicesDatabaseGatherer;
  v11 = -[MILaunchServicesDatabaseGatherer init](&v30, sel_init);
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    internalApps = v11->_internalApps;
    v11->_internalApps = (NSMutableSet *)v12;

    uint64_t v14 = objc_opt_new();
    systemApps = v11->_systemApps;
    v11->_systemApps = (NSMutableSet *)v14;

    uint64_t v16 = objc_opt_new();
    userApps = v11->_userApps;
    v11->_userApps = (NSMutableSet *)v16;

    uint64_t v18 = objc_opt_new();
    appExtensions = v11->_appExtensions;
    v11->_appExtensions = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    frameworks = v11->_frameworks;
    v11->_frameworks = (NSMutableSet *)v20;

    uint64_t v22 = objc_opt_new();
    coreServices = v11->_coreServices;
    v11->_coreServices = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    systemAppPlaceholders = v11->_systemAppPlaceholders;
    v11->_systemAppPlaceholders = (NSMutableSet *)v24;
    v26 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    v11->_shouldUpdateAppExtensionDataContainersWithParentID = [v26 haveUpdatedAppExtensionDataContainersWithParentID] ^ 1;

    uint64_t v27 = MEMORY[0x186E27154](v10);
    id enumerator = v11->_enumerator;
    v11->_id enumerator = (id)v27;

    v11->_gatherOptions = a3;
    objc_storeStrong((id *)&v11->_personaUniqueString, a4);
  }

  return v11;
}

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 enumerator:(id)a4
{
  return -[MILaunchServicesDatabaseGatherer initWithOptions:personaUniqueString:enumerator:]( self,  "initWithOptions:personaUniqueString:enumerator:",  a3,  0LL,  a4);
}

+ (id)_createPluginDataContainerForAppexBundle:(id)a3 forPersona:(id)a4 setParent:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v16 = 0;
  id v15 = 0LL;
  [v7 dataContainerCreatingIfNeeded:1 forPersona:v8 makeLive:1 created:&v16 error:&v15];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v15;
  if (v10)
  {
    if (v9 && !v16) {
      [v10 setParentBundleID:v9];
    }
    id v12 = v10;
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    [v7 identifier];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  return v10;
}

+ (BOOL)enumerateAppExtensionsInBundle:(id)a3 forPersona:(id)a4 updatingAppExtensionParentID:(BOOL)a5 ensureAppExtensionsAreExecutable:(BOOL)a6 installProfiles:(BOOL)a7 error:(id *)a8 enumerator:(id)a9
{
  BOOL v63 = a6;
  BOOL v64 = a7;
  BOOL v65 = a5;
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v61 = a4;
  v62 = (void (**)(id, void *, void))a9;
  [v10 identifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v92 = 0LL;
  id v60 = v10;
  [v10 appExtensionBundlesWithError:&v92];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v92;
  if (!v12)
  {
    v52 = 0LL;
    BOOL IsMalformedBundleError = _IsMalformedBundleError(v13);
    v53 = a8;
    v51 = v60;
    if (a8) {
      goto LABEL_64;
    }
    goto LABEL_66;
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  v58 = v12;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (!v14)
  {
LABEL_57:

    BOOL IsMalformedBundleError = 1;
    v51 = v60;
    v52 = v58;
    goto LABEL_66;
  }

  uint64_t v15 = v14;
  uint64_t v73 = *(void *)v89;
  v68 = v11;
LABEL_4:
  uint64_t v16 = 0LL;
  uint64_t v66 = v15;
  while (1)
  {
    if (*(void *)v89 != v73) {
      objc_enumerationMutation(obj);
    }
    v17 = *(void **)(*((void *)&v88 + 1) + 8 * v16);
    id v87 = v13;
    char v18 = objc_msgSend(v17, "validateBundleMetadataWithError:", &v87, v55, v56, v57);
    id v19 = v87;

    if ((v18 & 1) != 0) {
      break;
    }
    [v17 bundleURL];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 path];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v55 = v21;
    MOLogWrite();
LABEL_54:

LABEL_55:
    id v13 = v19;
    if (++v16 == v15)
    {
      uint64_t v15 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_57;
    }
  }

  uint64_t v20 = (void *)objc_opt_new();
  if (v65) {
    id v21 = v11;
  }
  else {
    id v21 = 0LL;
  }
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 deviceHasPersonas];

  if (!v23)
  {
    [(id)objc_opt_class() _createPluginDataContainerForAppexBundle:v17 forPersona:0 setParent:v21];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26) {
      [v20 addObject:v26];
    }
LABEL_31:

    if (v63)
    {
      id v81 = v19;
      char v33 = [v17 makeExecutableWithError:&v81];
      id v34 = v81;
      v35 = v19;
      id v19 = v34;

      if ((v33 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        [v17 identifier];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        id v56 = v19;
        MOLogWrite();
      }
    }

    if (v64) {
      [v17 installEmbeddedProvisioningProfileWithProgress:0];
    }
    v36 = objc_alloc(&OBJC_CLASS___MIInstalledInfoGatherer);
    v37 = (void *)[v20 copy];
    v38 = -[MIInstalledInfoGatherer initWithAppExtensionBundle:inBundleIdentifier:dataContainers:]( v36,  "initWithAppExtensionBundle:inBundleIdentifier:dataContainers:",  v17,  v11,  v37);

    id v80 = v19;
    v39 = -[MIInstalledInfoGatherer bundleRecordWithError:](v38, "bundleRecordWithError:", &v80);
    id v75 = v80;

    if (v39)
    {
      v69 = v39;
      v70 = v38;
      v71 = v20;
      uint64_t v72 = v16;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      id v40 = v20;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v93 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v77;
        do
        {
          for (uint64_t i = 0LL; i != v42; ++i)
          {
            if (*(void *)v77 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            objc_msgSend(v45, "rawContainer", v55);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            int v47 = [v46 isNew];

            if (v47)
            {
              v48 = +[MIContainerProtectionManager defaultManager]( &OBJC_CLASS___MIContainerProtectionManager,  "defaultManager");
              [v48 setDataProtectionOnDataContainer:v45 forNewBundle:v17 retryIfLocked:0];
            }
          }

          uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v93 count:16];
        }

        while (v42);
      }

      [v17 identifier];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v69;
      ((void (**)(id, void *, void *))v62)[2](v62, v49, v69);
      id v11 = v68;
      uint64_t v20 = v71;
      uint64_t v16 = v72;
      v38 = v70;
    }

    else
    {
      objc_msgSend(v17, "identifier", v55);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      id v56 = v11;
      id v57 = v75;
      v55 = v49;
      MOLogWrite();
    }

LABEL_53:
    uint64_t v15 = v66;
    id v19 = v75;
    goto LABEL_54;
  }

  if (v61)
  {
    id v74 = v19;
    uint64_t v24 = v16;
    objc_msgSend(MEMORY[0x189604010], "setWithObject:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v26 = v25;
    uint64_t v28 = [v26 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v83;
      do
      {
        for (uint64_t j = 0LL; j != v29; ++j)
        {
          if (*(void *)v83 != v30) {
            objc_enumerationMutation(v26);
          }
          [(id)objc_opt_class() _createPluginDataContainerForAppexBundle:v17 forPersona:*(void *)(*((void *)&v82 + 1) + 8 * j) setParent:v21];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32) {
            [v20 addObject:v32];
          }
        }

        uint64_t v29 = [v26 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }

      while (v29);
    }

    uint64_t v16 = v24;
    id v11 = v68;
    id v19 = v74;
    goto LABEL_31;
  }

  uint64_t v27 = v20;
  id v86 = v19;
  _AllPersonasAssociatedWithIdentifier(v11, &v86);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v86;

  if (v25)
  {
    uint64_t v24 = v16;
    id v74 = v13;
    uint64_t v20 = v27;
    goto LABEL_21;
  }

  BOOL IsMalformedBundleError = 0;
  v53 = a8;
  v51 = v60;
  v52 = v58;
  if (!a8) {
    goto LABEL_66;
  }
LABEL_64:
  if (!IsMalformedBundleError)
  {
    id v13 = v13;
    BOOL IsMalformedBundleError = 0;
    id *v53 = v13;
  }

+ (id)_createDataContainerAndSetDataProtectionForBundle:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  char v16 = 0;
  id v15 = 0LL;
  [v7 dataContainerCreatingIfNeeded:1 forPersona:v8 makeLive:1 created:&v16 error:&v15];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v15;
  if (v9)
  {
    if (v16)
    {
      +[MIContainerProtectionManager defaultManager](&OBJC_CLASS___MIContainerProtectionManager, "defaultManager");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setDataProtectionOnDataContainer:v9 forNewBundle:v7 retryIfLocked:0];
    }
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v7 bundleURL];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 path];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    if (a5) {
      *a5 = v10;
    }
  }

  return v9;
}

+ (id)entryForBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_opt_new();
  if (![v9 needsDataContainer])
  {
    id v21 = a6;
    uint64_t v22 = 0LL;
    goto LABEL_31;
  }

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 deviceHasPersonas];

  if (!v14)
  {
    id v50 = 0LL;
    [(id)objc_opt_class() _createDataContainerAndSetDataProtectionForBundle:v9 forPersona:0 error:&v50];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = v50;
    if (!v23) {
      goto LABEL_39;
    }
    id v21 = a6;
    [v12 addObject:v23];
    goto LABEL_30;
  }

  id v48 = v11;
  +[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 enterprisePersonaUniqueString];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v57 = 0LL;
  uint64_t v17 = [v15 multiPersonaSADAppBundleIDsWithError:&v57];
  id v19 = v57;
  int v47 = (void *)v17;
  if (!v17)
  {
    _CreateAndLogError( (uint64_t)"+[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]",  299LL,  @"MIInstallerErrorDomain",  4LL,  v19,  0LL,  @"Failed to query multi persona SAD apps from UserManagement",  v18,  v42);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }

  v46 = v16;
  if (!v48)
  {
    [v9 identifier];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v56 = v19;
    _AllPersonasAssociatedWithIdentifier(v25, &v56);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = v56;

    char v16 = v46;
    id v19 = v24;
    if (v20) {
      goto LABEL_11;
    }
LABEL_22:

    id v23 = 0LL;
    id v11 = v48;
LABEL_38:

LABEL_39:
    if (a6)
    {
LABEL_40:
      id v24 = v24;
      id v40 = 0LL;
      *a6 = v24;
      goto LABEL_43;
    }

+ (id)fetchInfoForBundle:(id)a3 forPersona:(id)a4 inContainer:(id)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = 0LL;
  [(id)objc_opt_class() entryForBundle:v9 inContainer:v11 forPersona:v10 withError:&v29];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = v29;
  if (!v12)
  {
    uint64_t v22 = 0LL;
    id v18 = 0LL;
    id v17 = 0LL;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  int v14 = (void *)objc_opt_new();
  id v15 = (void *)objc_opt_new();
  [v9 identifier];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setObject:v12 forKeyedSubscript:v16];

  [v14 addObject:v12];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke;
  v26[3] = &unk_189D492D0;
  id v17 = v15;
  id v27 = v17;
  id v18 = v14;
  id v28 = v18;
  id v19 = (void *)MEMORY[0x186E27154](v26);
  id v25 = v13;
  int v20 = [(id)objc_opt_class() enumerateAppExtensionsInBundle:v9 forPersona:v10 updatingAppExtensionParentID:0 ensureAppExtensionsAreExecutable:0 instal lProfiles:0 error:&v25 enumerator:v19];
  id v21 = v25;

  if (v20) {
    uint64_t v22 = (void *)[v18 copy];
  }
  else {
    uint64_t v22 = 0LL;
  }
  id v13 = v21;
  if (a6)
  {
LABEL_8:
    if (v13) {
      *a6 = v13;
    }
  }

void __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, v12);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 bundleURL];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 path];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 bundleURL];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 path];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)_scanAppExtensionsInBundle:(id)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke;
  v18[3] = &unk_189D492F8;
  v18[4] = self;
  id v9 = (void *)MEMORY[0x186E27154](v18);
  if ([v8 bundleType] == 10)
  {
    id v10 = 0LL;
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v12 = objc_opt_class();
    -[MILaunchServicesDatabaseGatherer personaUniqueString](self, "personaUniqueString");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL shouldUpdateAppExtensionDataContainersWithParentID = self->_shouldUpdateAppExtensionDataContainersWithParentID;
    BOOL v15 = a4 != 0LL;
    id v17 = 0LL;
    BOOL v11 = 1;
    LOBYTE(v12) = [(id)v12 enumerateAppExtensionsInBundle:v8 forPersona:v13 updatingAppExtensionParentID:shouldUpdateAppExtensionDataContainersWithParentID ensureAppExtensionsAreExecuta ble:v15 installProfiles:1 error:&v17 enumerator:v9];
    id v10 = v17;

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        id v10 = v10;
        BOOL v11 = 0;
        *a5 = v10;
      }

      else
      {
        BOOL v11 = 0;
      }
    }
  }

  return v11;
}

void __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) appExtensions];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 containsObject:v11];

  if (!v7)
  {
    [*(id *)(a1 + 32) enumerator];
    id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v9)[2](v9, v5, 0LL);

    [*(id *)(a1 + 32) appExtensions];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v11];
    goto LABEL_6;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    [v5 bundleURL];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 path];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_6:
  }
}

- (id)_setForEntry:(id)a3
{
  id v4 = a3;
  switch([v4 applicationType])
  {
    case 1LL:
      uint64_t v5 = -[MILaunchServicesDatabaseGatherer coreServices](self, "coreServices");
      goto LABEL_9;
    case 2LL:
      uint64_t v5 = -[MILaunchServicesDatabaseGatherer systemApps](self, "systemApps");
      goto LABEL_9;
    case 3LL:
      uint64_t v5 = -[MILaunchServicesDatabaseGatherer systemAppPlaceholders](self, "systemAppPlaceholders");
      goto LABEL_9;
    case 4LL:
      uint64_t v5 = -[MILaunchServicesDatabaseGatherer userApps](self, "userApps");
      goto LABEL_9;
    case 5LL:
      uint64_t v5 = -[MILaunchServicesDatabaseGatherer internalApps](self, "internalApps");
      goto LABEL_9;
    default:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v5 = -[MILaunchServicesDatabaseGatherer appExtensions](self, "appExtensions");
LABEL_9:
        v6 = (void *)v5;
        goto LABEL_10;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v5 = -[MILaunchServicesDatabaseGatherer frameworks](self, "frameworks");
        goto LABEL_9;
      }

      v6 = 0LL;
LABEL_10:

      return v6;
  }

- (BOOL)_scanBundle:(id)a3 inContainer:(id)a4 addingToBundleSet:(id)a5 enumeratingEntry:(id)a6 withError:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [v12 identifier];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v14 containsObject:v16];

  if ((v17 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v12 identifier];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 bundleURL];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 path];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    id v20 = 0LL;
LABEL_17:
    BOOL v32 = 1;
    goto LABEL_18;
  }

  if (v15)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    id v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v21)[2](v21, v15, 0LL);
  }

  [v12 identifier];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 addObject:v22];

  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v23 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    id v24 = v23;
    [v12 bundleURL];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 path];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v26;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ScanPlugins",  "Scanning plugins in bundle at %@",  buf,  0xCu);
  }

  id v39 = 0LL;
  BOOL v27 = -[MILaunchServicesDatabaseGatherer _scanAppExtensionsInBundle:inBundleContainer:withError:]( self,  "_scanAppExtensionsInBundle:inBundleContainer:withError:",  v12,  v13,  &v39);
  id v20 = v39;
  if (v27)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    id v28 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v29 = v28;
      [v12 bundleURL];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 path];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = v31;
      _os_signpost_emit_with_name_impl( &dword_183D22000,  v29,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ScanPlugins",  "Done scanning plugins in bundle at %@",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v34 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    int v35 = v34;
    [v12 bundleURL];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 path];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v37;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v35,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ScanPlugins",  "[FAIL] Done scanning plugins in bundle at %@",  buf,  0xCu);
  }

  if (a7)
  {
    id v20 = v20;
    BOOL v32 = 0;
    *a7 = v20;
  }

  else
  {
    BOOL v32 = 0;
  }

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v13 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    id v14 = v13;
    [v10 bundleURL];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 path];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v16;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ScanBundle",  "Scanning bundle at %@",  buf,  0xCu);
  }

  id v35 = 0LL;
  [(id)objc_opt_class() entryForBundle:v10 inContainer:v11 forPersona:v12 withError:&v35];
  char v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = v35;
  if (v17)
  {
    uint64_t v19 = -[MILaunchServicesDatabaseGatherer _setForEntry:](self, "_setForEntry:", v17);
    if (v19)
    {
      id v21 = (void *)v19;
      id v34 = v18;
      BOOL v22 = -[MILaunchServicesDatabaseGatherer _scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:]( self,  "_scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:",  v10,  v11,  v19,  v17,  &v34);
      id v23 = v34;

      id v18 = v21;
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MILaunchServicesDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]",  568LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not find appropriate set for app %@",  v20,  (uint64_t)v17);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v22 = 0;
    }

    id v18 = v23;
    if (!a6) {
      goto LABEL_14;
    }
  }

  else
  {
    BOOL v22 = 0;
    if (!a6) {
      goto LABEL_14;
    }
  }

  if (!v22) {
    *a6 = v18;
  }
LABEL_14:
  if (v18) {
    char v24 = v22;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, id))v26)[2](v26, 0LL, v18);
    }
  }

  if (v22)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    BOOL v27 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v28 = v27;
      [v10 bundleURL];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 path];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      uint64_t v31 = "Done scanning bundle at %@";
LABEL_29:
      _os_signpost_emit_with_name_impl( &dword_183D22000,  v28,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ScanBundle",  v31,  buf,  0xCu);
    }
  }

  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    BOOL v32 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v28 = v32;
      [v10 bundleURL];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 path];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      uint64_t v31 = "[FAIL] Done scanning bundle at %@";
      goto LABEL_29;
    }
  }

  return v22;
}

- (BOOL)scanAppExtensionsInFrameworkBundle:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  int v7 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    id v8 = v7;
    [v6 bundleURL];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v10;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ScanBundle",  "Scanning framework at %@",  buf,  0xCu);
  }

  -[MILaunchServicesDatabaseGatherer frameworks](self, "frameworks");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = 0LL;
  BOOL v12 = -[MILaunchServicesDatabaseGatherer _scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:]( self,  "_scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:",  v6,  0LL,  v11,  0LL,  &v24);
  id v13 = v24;

  if (a4 && !v12) {
    *a4 = v13;
  }
  if (v13) {
    char v14 = v12;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
      char v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, id))v16)[2](v16, 0LL, v13);
    }
  }

  if (v12)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    char v17 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v18 = v17;
      [v6 bundleURL];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 path];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v20;
      id v21 = "Done scanning framework at %@";
LABEL_23:
      _os_signpost_emit_with_name_impl( &dword_183D22000,  v18,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ScanBundle",  v21,  buf,  0xCu);
    }
  }

  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    BOOL v22 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v18 = v22;
      [v6 bundleURL];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 path];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v20;
      id v21 = "[FAIL] Done scanning framework at %@";
      goto LABEL_23;
    }
  }

  return v12;
}

- (void)errorOccurred:(id)a3
{
  id v6 = a3;
  -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    uint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v5)[2](v5, 0LL, v6);
  }
}

- (BOOL)performGatherWithError:(id *)a3
{
  if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 2) != 0)
  {
    uint64_t v5 = 2298LL;
  }

  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 4) != 0)
  {
    uint64_t v5 = 1029LL;
  }

  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 8) != 0)
  {
    uint64_t v5 = 768LL;
  }

  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 0x10) != 0)
  {
    uint64_t v5 = 4LL;
  }

  else
  {
    uint64_t v5 = 3967LL;
  }

  unint64_t v6 = ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 1) << 7) | v5;
  int v7 = objc_alloc(&OBJC_CLASS___MIFilesystemScanner);
  -[MILaunchServicesDatabaseGatherer personaUniqueString](self, "personaUniqueString");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:]( v7,  "initWithScanOptions:personaUniqueString:",  v6,  v8);

  -[MIFilesystemScanner setDelegate:](v9, "setDelegate:", self);
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 reScanSystemApps];

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 reScanInternalApps];

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 reScanCoreServicesApps];

  +[MIKeychainAccessGroupTracker sharedTracker](&OBJC_CLASS___MIKeychainAccessGroupTracker, "sharedTracker");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 invalidateCache];

  BOOL v14 = -[MIFilesystemScanner performScanWithError:](v9, "performScanWithError:", a3);
  if (v14 && self->_shouldUpdateAppExtensionDataContainersWithParentID)
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setHaveUpdatedAppExtensionDataContainersWithParentID:1];
  }

  return v14;
}

- (NSMutableSet)coreServices
{
  return self->_coreServices;
}

- (NSMutableSet)systemApps
{
  return self->_systemApps;
}

- (NSMutableSet)userApps
{
  return self->_userApps;
}

- (NSMutableSet)internalApps
{
  return self->_internalApps;
}

- (NSMutableSet)appExtensions
{
  return self->_appExtensions;
}

- (NSMutableSet)frameworks
{
  return self->_frameworks;
}

- (NSMutableSet)systemAppPlaceholders
{
  return self->_systemAppPlaceholders;
}

- (id)enumerator
{
  return self->_enumerator;
}

- (unint64_t)gatherOptions
{
  return self->_gatherOptions;
}

- (BOOL)shouldUpdateAppExtensionDataContainersWithParentID
{
  return self->_shouldUpdateAppExtensionDataContainersWithParentID;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
}

@end