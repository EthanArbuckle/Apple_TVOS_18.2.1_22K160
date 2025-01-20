@interface LSApplicationWorkspace
+ (id)_defaultAppQueue;
+ (id)_remoteObserver;
+ (id)activeManagedConfigurationRestrictionUUIDs;
+ (id)callbackQueue;
+ (id)defaultWorkspace;
+ (id)progressQueue;
- (BOOL)_LSPrivateDatabaseNeedsRebuild;
- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5;
- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 uid:(unsigned int *)a6;
- (BOOL)_getBundleIdentifierForBundleAtURL:(id)a3 invokeUpdateBlockAndReregister:(id)a4 error:(id *)a5;
- (BOOL)allowsAlternateIcons;
- (BOOL)applicationIsInstalled:(id)a3;
- (BOOL)downgradeApplicationToPlaceholder:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)establishConnection;
- (BOOL)forceDatabaseSaveForTestingWithError:(id *)a3;
- (BOOL)garbageCollectDatabaseWithError:(id *)a3;
- (BOOL)getClaimedActivityTypes:(id *)a3 domains:(id *)a4;
- (BOOL)initiateProgressForApp:(id)a3 withType:(unint64_t)a4;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7;
- (BOOL)installPhaseFinishedForProgress:(id)a3;
- (BOOL)invalidateIconCache:(id)a3;
- (BOOL)isApplicationAvailableToOpenURL:(id)a3 error:(id *)a4;
- (BOOL)isApplicationAvailableToOpenURLCommon:(id)a3 includePrivateURLSchemes:(BOOL)a4 error:(id *)a5;
- (BOOL)isVersion:(id)a3 greaterThanOrEqualToVersion:(id)a4;
- (BOOL)ls_injectUTTypeWithDeclaration:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (BOOL)mayProcessWithAuditTokenMapDatabase:(id *)a3;
- (BOOL)openApplicationWithBundleID:(id)a3;
- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4;
- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)openURL:(id)a3;
- (BOOL)openURL:(id)a3 withOptions:(id)a4;
- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)registerApplication:(id)a3;
- (BOOL)registerApplicationDictionary:(id)a3;
- (BOOL)registerApplicationDictionary:(id)a3 withObserverNotification:(int)a4;
- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 requestContext:(id)a5 registrationError:(id *)a6;
- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 requestContext:(id)a4 registrationError:(id *)a5;
- (BOOL)registerApplicationForRebuildWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 requestContext:(id)a6 registrationError:(id *)a7;
- (BOOL)registerPlugin:(id)a3;
- (BOOL)restoreSystemApplication:(id)a3;
- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7;
- (BOOL)sendNotificationOfType:(unsigned int)a3 forApplicationWithBundleIdentifier:(id)a4 requestContext:(id)a5 error:(id *)a6;
- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationWithBundleIdentifier:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationsWithBundleIdentifiers:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (BOOL)uninstallContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6;
- (BOOL)unregisterApplication:(id)a3;
- (BOOL)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 saveObserver:(id)a5 requestContext:(id)a6;
- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 precondition:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 unregistrationError:(id *)a9;
- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 requestContext:(id)a6 saveObserver:(id)a7 unregistrationError:(id *)a8;
- (BOOL)unregisterPlugin:(id)a3;
- (BOOL)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failure:(unint64_t)a5 underlyingError:(id)a6 source:(unint64_t)a7 outError:(id *)a8;
- (BOOL)updatePlaceholderMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 installType:(unint64_t)a6 failure:(unint64_t)a7 saveObserver:(id)a8 error:(id *)a9;
- (BOOL)updatePlaceholderWithBundleIdentifier:(id)a3 withInstallType:(unint64_t)a4 error:(id *)a5;
- (BOOL)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 outSaveToken:(id *)a9 error:(id *)a10;
- (BOOL)updateSINFMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 parsedSINFInfo:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)updateSINFWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)updateSINFWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5;
- (BOOL)updateiTunesMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 metadataPlist:(id)a6 saveObserver:(id)a7 error:(id *)a8;
- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5;
- (BOOL)urlContainsDeviceIdentifierForAdvertising:(id)a3;
- (LSInstallProgressList)observedInstallProgresses;
- (NSMutableDictionary)createdInstallProgresses;
- (id)URLOverrideForNewsURL:(id)a3;
- (id)URLOverrideForURL:(id)a3;
- (id)_LSPrivateRemovedSystemAppIdentifiers;
- (id)allApplications;
- (id)allInstalledApplications;
- (id)applicationForOpeningResource:(id)a3;
- (id)applicationForUserActivityDomainName:(id)a3;
- (id)applicationForUserActivityType:(id)a3;
- (id)applicationProxiesWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4;
- (id)applicationsAvailableForHandlingURLScheme:(id)a3;
- (id)applicationsAvailableForOpeningDocument:(id)a3;
- (id)applicationsAvailableForOpeningURL:(id)a3;
- (id)applicationsAvailableForOpeningURL:(id)a3 legacySPI:(BOOL)a4;
- (id)applicationsForUserActivityType:(id)a3;
- (id)applicationsForUserActivityType:(id)a3 limit:(unint64_t)a4;
- (id)applicationsOfType:(unint64_t)a3;
- (id)applicationsWithAudioComponents;
- (id)applicationsWithUIBackgroundModes;
- (id)applicationsWithVPNPlugins;
- (id)bundleIdentifiersForMachOUUIDs:(id)a3 error:(id *)a4;
- (id)createDeviceIdentifierWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (id)deviceIdentifierForAdvertising;
- (id)deviceIdentifierForVendor;
- (id)deviceIdentifierForVendorSeedData;
- (id)directionsApplications;
- (id)installProgressForApplication:(id)a3 withPhase:(unint64_t)a4;
- (id)installProgressForBundleID:(id)a3 makeSynchronous:(unsigned __int8)a4;
- (id)installedPlugins;
- (id)legacyApplicationProxiesListWithType:(unint64_t)a3;
- (id)machOUUIDsForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)observerProxy;
- (id)openURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7 userInfo:(id)a8 options:(id)a9 delegate:(id)a10;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 delegate:(id)a8;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 options:(id)a8 delegate:(id)a9;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6 delegate:(id)a7;
- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 userInfo:(id)a5;
- (id)optionsFromOpenConfiguration:(id)a3;
- (id)placeholderApplications;
- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 applyFilter:(id)a6;
- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 withFilter:(id)a6;
- (id)privateURLSchemes;
- (id)publicURLSchemes;
- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 saveObserver:(id)a6 registrationError:(id *)a7;
- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 registrationError:(id *)a8;
- (id)registerContainerizedApplicationWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 operationUUID:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 registrationError:(id *)a9;
- (id)remoteObserver;
- (id)removedSystemApplications;
- (id)scanForApplicationStateChangesFromRank:(id)a3 toRank:(id)a4;
- (id)scanForApplicationStateChangesWithAllowlist:(id)a3;
- (id)scanForForDeletableSystemApps;
- (id)syncObserverProxy;
- (id)unrestrictedApplications;
- (void)_LSClearSchemaCaches;
- (void)_LSFailedToOpenURL:(id)a3 withBundle:(id)a4;
- (void)_LSPrivateNoteMigratorRunning;
- (void)_LSPrivateSetRemovedSystemAppIdentifiers:(id)a3;
- (void)_LSPrivateUpdateAppRemovalRestrictions;
- (void)_openUserActivity:(id)a3 orUserActivityUUID:(id)a4 activityTypeForUUID:(id)a5 withApplicationProxy:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)addObserver:(id)a3;
- (void)clearAdvertisingIdentifier;
- (void)clearCreatedProgressForBundleID:(id)a3;
- (void)commonClientOpenURL:(id)a3 options:(id)a4 configuration:(id)a5 synchronous:(BOOL)a6 completionHandler:(id)a7;
- (void)deviceIdentifierForVendorSeedData;
- (void)enumerateApplicationsOfType:(unint64_t)a3 block:(id)a4;
- (void)enumerateApplicationsOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5;
- (void)enumerateBundlesOfType:(unint64_t)a3 block:(id)a4;
- (void)enumerateBundlesOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5;
- (void)enumerateBundlesOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePluginsMatchingQuery:(id)a3 withBlock:(id)a4;
- (void)getKnowledgeUUID:(id *)a3 andSequenceNumber:(id *)a4;
- (void)ls_resetTestingDatabase;
- (void)ls_testWithCleanDatabaseWithError:(id *)a3;
- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3;
- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)openApplicationWithBundleIdentifier:(id)a3 usingConfiguration:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 usingApplicationRecord:(id)a4 configuration:(id)a5 completionHandler:(id)a6;
- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)openUserActivityWithUUID:(id)a3 activityType:(id)a4 usingApplicationRecord:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)placeholderInstalledForIdentifier:(id)a3 filterDowngrades:(BOOL)a4;
- (void)rebuildDatabaseContentForFrameworkAtURL:(id)a3 completionHandler:(id)a4;
- (void)relaxApplicationTypeRequirements:(BOOL)a3 forApplicationRecord:(id)a4 completionHandler:(id)a5;
- (void)removeAllDefaultApplicationPreferencesWithCompletionHandler:(id)a3;
- (void)removeDeviceIdentifierForVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sendApplicationStateChangedNotificationsFor:(id)a3 stateProvider:(id)a4 completion:(id)a5;
- (void)sendExtensionNotificationsForExtensionBundleIdentifier:(id)a3 changingRestrictionStateTo:(BOOL)a4;
- (void)sendExtensionNotificationsForSystemModeChangeFrom:(id)a3 to:(id)a4;
- (void)setDefaultMailClientToApplicationRecord:(id)a3 completionHandler:(id)a4;
- (void)setDefaultURLHandlerForScheme:(id)a3 to:(id)a4 completion:(id)a5;
- (void)setDefaultWebBrowserToApplicationRecord:(id)a3 completionHandler:(id)a4;
@end

@implementation LSApplicationWorkspace

+ (id)progressQueue
{
  if (progressQueue_once != -1) {
    dispatch_once(&progressQueue_once, &__block_literal_global_6);
  }
  return (id)progressQueue_result;
}

void __39__LSApplicationWorkspace_progressQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.clientprogress", v2);
  v1 = (void *)progressQueue_result;
  progressQueue_result = (uint64_t)v0;
}

+ (id)callbackQueue
{
  if (callbackQueue_once != -1) {
    dispatch_once(&callbackQueue_once, &__block_literal_global_119);
  }
  return (id)callbackQueue_result;
}

void __39__LSApplicationWorkspace_callbackQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.clientcallbacks", v2);
  v1 = (void *)callbackQueue_result;
  callbackQueue_result = (uint64_t)v0;
}

+ (id)defaultWorkspace
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__LSApplicationWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_once != -1) {
    dispatch_once(&defaultWorkspace_once, block);
  }
  return (id)defaultWorkspace_gDefaultWorkspace;
}

void __42__LSApplicationWorkspace_defaultWorkspace__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultWorkspace_gDefaultWorkspace;
  defaultWorkspace_gDefaultWorkspace = (uint64_t)v1;
}

+ (id)_remoteObserver
{
  if (_remoteObserver_onceToken != -1) {
    dispatch_once(&_remoteObserver_onceToken, &__block_literal_global_121);
  }
  return (id)_sRemoteObserver;
}

void __41__LSApplicationWorkspace__remoteObserver__block_invoke()
{
  dispatch_queue_t v0 = objc_alloc_init(&OBJC_CLASS___LSApplicationWorkspaceRemoteObserver);
  id v1 = (void *)_sRemoteObserver;
  _sRemoteObserver = (uint64_t)v0;
}

+ (id)activeManagedConfigurationRestrictionUUIDs
{
  return +[LSApplicationRestrictionsManager activeRestrictionIdentifiers]();
}

- (void)getKnowledgeUUID:(id *)a3 andSequenceNumber:(id *)a4
{
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0LL;
  if (_LSCurrentProcessMayMapDatabase())
  {
    v13 = 0LL;
    if (!_LSContextInit(&v13))
    {
      uint64_t v6 = _LSDatabaseGetCacheGUID();
      v7 = (void *)v21[5];
      v21[5] = v6;

      uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
      if (SequenceNumber)
      {
        uint64_t v9 = [MEMORY[0x189607968] numberWithUnsignedLongLong:SequenceNumber];
        v10 = (void *)v15[5];
        v15[5] = v9;
      }

      _LSContextDestroy(&v13);
    }

    if (a3) {
      goto LABEL_7;
    }
  }

  else
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    v11 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, 0LL);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke;
    v12[3] = &unk_189D72FA0;
    v12[4] = &v20;
    v12[5] = &v14;
    [v11 getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:v12];

    if (a3) {
LABEL_7:
    }
      *a3 = (id) v21[5];
  }

  if (a4) {
    *a4 = (id) v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)establishConnection
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__LSApplicationWorkspace_establishConnection__block_invoke;
  block[3] = &unk_189D730E8;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke(uint64_t a1)
{
  if (!_sObserverConnection)
  {
    if (_LSProcessCanAccessProgressPort_onceToken != -1) {
      dispatch_once(&_LSProcessCanAccessProgressPort_onceToken, &__block_literal_global_845);
    }
    if (_LSProcessCanAccessProgressPort_canAccessProgressPort)
    {
      id v2 = objc_alloc(MEMORY[0x189607B30]);
      [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:5];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)[v2 initWithMachServiceName:v3 options:4096];

      installProgressInterface();
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setRemoteObjectInterface:v5];

      workspaceObserverInterface();
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setExportedInterface:v6];

      uint64_t v7 = (void *)_sObserverConnection;
      _sObserverConnection = (uint64_t)v4;

      _LSProgressLog();
      char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_183E58000, v8, OS_LOG_TYPE_DEFAULT, "Establishing xpc connection to lsd", buf, 2u);
      }

      if (_sObserverConnection)
      {
        [(id)_sObserverConnection setInvalidationHandler:&__block_literal_global_128];
        [(id)_sObserverConnection setInterruptionHandler:&__block_literal_global_131];
        +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)_sObserverConnection setExportedObject:v9];

        [(id)_sObserverConnection resume];
        uint64_t v10 = [(id)_sObserverConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_138];
        id v11 = (void *)_sObserverProxy;
        _sObserverProxy = v10;

        [(id)_sObserverProxy _lsPing:@"LSWorkspaceObserverPing" reply:&__block_literal_global_143];
      }

      else
      {
        _LSProgressLog();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_183E58000, v12, OS_LOG_TYPE_DEFAULT, "Failed to establish xpc connection to lsd", v14, 2u);
        }

        v13 = (void *)_sObserverProxy;
        _sObserverProxy = 0LL;

        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
      }
    }
  }

void __45__LSApplicationWorkspace_establishConnection__block_invoke_127()
{
  dispatch_queue_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_183E58000, v0, OS_LOG_TYPE_DEFAULT, "progress connection invalidationHandler called", v2, 2u);
  }

  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_130);
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_129()
{
  dispatch_queue_t v0 = (void *)_sObserverConnection;
  _sObserverConnection = 0LL;

  +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2()
{
  dispatch_queue_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl( &dword_183E58000,  v0,  OS_LOG_TYPE_DEFAULT,  "interruptionHandler called, re-establishing connection to lsd",  v2,  2u);
  }

  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_133);
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_132()
{
  dispatch_queue_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObserver];

  +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObservinglsd:1];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2_134(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  _LSDefaultLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "Error %@ trying to re-establish observing connection to lsd",  (uint8_t *)&v5,  0xCu);
  }
  v4 = +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  [v4 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  _LSDefaultLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "Error %@ trying to establish observing connection to lsd",  (uint8_t *)&v5,  0xCu);
  }
  v4 = +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  [v4 setObservinglsd:0];
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  _LSProgressLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "Received %@, xpc connection established",  (uint8_t *)&v4,  0xCu);
  }
}

- (id)observerProxy
{
  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v4, 2u);
    }
  }

  return (id)_sObserverProxy;
}

- (id)syncObserverProxy
{
  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", buf, 2u);
    }
  }

  *(void *)buf = 0LL;
  char v8 = buf;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0LL;
  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__LSApplicationWorkspace_syncObserverProxy__block_invoke;
  block[3] = &unk_189D730E8;
  block[4] = buf;
  dispatch_sync(v3, block);

  id v4 = *((id *)v8 + 5);
  _Block_object_dispose(buf, 8);

  return v4;
}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_sObserverConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_144];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  _LSDefaultLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "Error %@ trying to establish observing connection to lsd",  (uint8_t *)&v4,  0xCu);
  }
}

- (id)remoteObserver
{
  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_183E58000, v3, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v9, 2u);
    }
  }

  int v4 = self;
  objc_sync_enter(v4);
  +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 isObservinglsd]) {
    goto LABEL_8;
  }
  +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 currentObserverCount];

  if (v7)
  {
    [(id)_sObserverProxy addObserver];
    +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObservinglsd:1];
LABEL_8:
  }

  objc_sync_exit(v4);

  +[LSApplicationWorkspace _remoteObserver](&OBJC_CLASS___LSApplicationWorkspace, "_remoteObserver");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int v5 = shouldConnectToLSD(v4);
  _LSDefaultLog();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2048;
    id v17 = v4;
    id v7 = v15;
    _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_INFO, "LSApplicationWorkspace: adding observer %@ @ %p", buf, 0x16u);
  }

  id v8 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.lsinstallprogress.appcontrols.cancel",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.lsinstallprogress.appcontrols.pause",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.lsinstallprogress.appcontrols.prioritize",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.lsinstallprogress.appcontrols.resume",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.lsinstallprogress.networkusagechanged",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.apple.LaunchServices.pluginsregistered",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.apple.LaunchServices.pluginsunregistered",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.apple.LaunchServices.pluginswillberemoved",  &__block_literal_global_863);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    mutateSubscriberCountForNotificationName( @"com.apple.LaunchServices.applicationStateChanged",  &__block_literal_global_863);
  }

  if (DeviceManagementLibrary_frameworkLibrary_0
    || (DeviceManagementLibrary_frameworkLibrary_0 = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/DeviceManagement.frame work/DeviceManagement",  2)) != 0)
  {
    objc_opt_class();
    char v9 = (objc_opt_isKindOfClass() & 1) != 0
       ? [(id)objc_opt_class() actuallyOverridesDMFObserverMethod]
       : objc_opt_respondsToSelector();
    if ((v9 & 1) != 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __38__LSApplicationWorkspace_addObserver___block_invoke;
      block[3] = &unk_189D72BF0;
      block[4] = self;
      if (addObserver__onceToken != -1) {
        dispatch_once(&addObserver__onceToken, block);
      }
    }
  }

  -[LSApplicationWorkspace remoteObserver](self, "remoteObserver");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v11 = self;
    objc_sync_enter(v11);
    [v10 setObservinglsd:1];
    [v10 addLocalObserver:v8];
    if (v5)
    {
      -[LSApplicationWorkspace observerProxy](v11, "observerProxy");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 addObserver];
    }

    objc_sync_exit(v11);
  }
}

void __38__LSApplicationWorkspace_addObserver___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __38__LSApplicationWorkspace_addObserver___block_invoke_2;
  v4[3] = &unk_189D73150;
  v4[4] = *(void *)(a1 + 32);
  id v3 = (id)[v2 addObserverForName:@"com.apple.launchservices.private._LSDMFPolicyDidChangeNotification" object:0 queue:0 usingBlock:v4];
}

void __38__LSApplicationWorkspace_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 remoteObserver];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 object];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 deviceManagementPolicyDidChange:v4];
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int v5 = shouldConnectToLSD(v4);
  _LSDefaultLog();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2048;
    id v18 = v4;
    id v7 = v16;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_INFO,  "LSApplicationWorkspace: removing observer %@ @ %p",  (uint8_t *)&v15,  0x16u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  -[LSApplicationWorkspace remoteObserver](v8, "remoteObserver");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 removeLocalObserver:v4];

  -[LSApplicationWorkspace remoteObserver](v8, "remoteObserver");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = [v10 currentObserverCount] == 0;

  if (v5) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    v13 = -[LSApplicationWorkspace observerProxy](v8, "observerProxy");
    [v13 removeObserver];

    +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, &__block_literal_global_184);
  }

  performWithLSAWDistributedNotificationNameBasedOnObserverConformance(v4, unsubscribeFromLSAWDistributedNotification);
  objc_sync_exit(v8);
}

uint64_t __41__LSApplicationWorkspace_removeObserver___block_invoke()
{
  return [(id)_sObserverConnection invalidate];
}

- (id)applicationProxiesWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  [MEMORY[0x189603FA8] array];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSApplicationProxiesWithFlagsQuery queryWithPlistFlags:bundleFlags:]( &OBJC_CLASS____LSApplicationProxiesWithFlagsQuery,  "queryWithPlistFlags:bundleFlags:",  v5,  a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke;
    v10[3] = &unk_189D73198;
    id v11 = v6;
    [v8 enumerateResolvedResultsOfQuery:v7 withBlock:v10];
  }

  return v6;
}

uint64_t __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke( uint64_t result,  uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (id)directionsApplications
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:]( self,  "applicationProxiesWithPlistFlags:bundleFlags:",  256LL,  0LL);
}

- (id)applicationsWithUIBackgroundModes
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:]( self,  "applicationProxiesWithPlistFlags:bundleFlags:",  512LL,  0LL);
}

- (id)applicationsWithAudioComponents
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:]( self,  "applicationProxiesWithPlistFlags:bundleFlags:",  1024LL,  0LL);
}

- (id)applicationsWithVPNPlugins
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:]( self,  "applicationProxiesWithPlistFlags:bundleFlags:",  4096LL,  0LL);
}

- (id)applicationsForUserActivityType:(id)a3 limit:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a3) {
    a3 = &stru_189D7B4C8;
  }
  +[LSApplicationRecord applicationRecordsForUserActivityType:limit:error:]( &OBJC_CLASS___LSApplicationRecord,  "applicationRecordsForUserActivityType:limit:error:",  a3,  a4,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "compatibilityObject", (void)v15);
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v12 = v11;
          if (v11)
          {
            [v11 detach];
            [v5 addObject:v12];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    v13 = (void *)[v5 copy];
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)applicationsForUserActivityType:(id)a3
{
  return -[LSApplicationWorkspace applicationsForUserActivityType:limit:]( self,  "applicationsForUserActivityType:limit:",  a3,  -1LL);
}

- (id)applicationForUserActivityType:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicationForUserActivityDomainName:(id)a3
{
  if (!a3) {
    a3 = &stru_189D7B4C8;
  }
  +[LSApplicationRecord applicationRecordsForUserActivityDomainName:limit:error:]( &OBJC_CLASS___LSApplicationRecord,  "applicationRecordsForUserActivityDomainName:limit:error:",  a3,  1LL,  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v4 compatibilityObject];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 detach];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)openApplicationWithBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v4 = (void *)MEMORY[0x186E2A59C]();
  _LSFaultIfRunningOnMainThreadOfShellApp();
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke;
  v7[3] = &unk_189D731C0;
  v7[4] = &v8;
  [v5 openApplicationWithIdentifier:v3 options:MEMORY[0x189604A60] useClientProcessHandle:0 completionHandler:v7];

  objc_autoreleasePoolPop(v4);
  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v4;
}

uint64_t __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (BOOL)openURL:(id)a3
{
  return -[LSApplicationWorkspace openURL:withOptions:](self, "openURL:withOptions:", a3, 0LL);
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace openURL:withOptions:error:](self, "openURL:withOptions:error:", a3, a4, 0LL);
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0LL;
  _LSFaultIfRunningOnMainThreadOfShellApp();
  uint64_t v9 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  id v20 = 0LL;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v7, 0LL, 0LL, &v20, &obj);
  id v11 = v20;
  objc_storeStrong(v9, obj);
  if (FileHandleForOpeningResource)
  {
    uint64_t v12 = MEMORY[0x1895F87A8];
    v18[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v18[1] = (void (*)(void, void))3221225472LL;
    v18[2] = (void (*)(void, void))__52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke;
    v18[3] = (void (*)(void, void))&unk_189D731E8;
    v18[4] = (void (*)(void, void))&v21;
    v13 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v18);
    v17[0] = v12;
    v17[1] = 3221225472LL;
    v17[2] = __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2;
    v17[3] = &unk_189D73210;
    v17[4] = &v27;
    v17[5] = &v21;
    [v13 openURL:v7 fileHandle:v11 options:v8 completionHandler:v17];
  }

  int v14 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v14 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace openSensitiveURL:withOptions:error:]( self,  "openSensitiveURL:withOptions:error:",  a3,  a4,  0LL);
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  if (a4)
  {
    id v9 = a3;
    id v10 = (id)[a4 mutableCopy];
  }

  else
  {
    id v11 = (objc_class *)MEMORY[0x189603FC8];
    id v12 = a3;
    id v10 = objc_alloc_init(v11);
  }

  v13 = v10;
  [v10 setObject:MEMORY[0x189604A88] forKey:@"LSOpenSensitiveURLOption"];
  BOOL v14 = -[LSApplicationWorkspace openURL:withOptions:error:](self, "openURL:withOptions:error:", a3, v13, a5);

  return v14;
}

- (void)_openUserActivity:(id)a3 orUserActivityUUID:(id)a4 activityTypeForUUID:(id)a5 withApplicationProxy:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  v52[1] = *MEMORY[0x1895F89C0];
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v19) {
    id v19 = (id)[&__block_literal_global_194 copy];
  }
  if (_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once != -1)
  {
    dispatch_once( &_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once,  &__block_literal_global_195);
    if (v14) {
      goto LABEL_5;
    }
LABEL_16:
    int v21 = 0;
    goto LABEL_17;
  }

  if (!v14) {
    goto LABEL_16;
  }
LABEL_5:
  if (v17)
  {
    [v17 appState];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v21 = [v20 isInstalled] ^ 1;
  }

  else
  {
    [(id)v14 _determineMatchingApplicationBundleIdentifierWithOptions:0];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v20,  0LL);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v41 = v16;
      uint64_t v22 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      [(id)v14 _teamIdentifier];
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [(id)v14 activityType];
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v25 = (__CFString *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType(v22, v23, v24);

      if (v25)
      {
        -[LSApplicationWorkspace applicationForUserActivityType:](self, "applicationForUserActivityType:", v25);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v17 = 0LL;
      }

      id v16 = v41;
    }

    int v21 = 1;
  }

LABEL_17:
  if (v14 | v15
    && v17
    && [v17 isInstalled]
    && ([v17 isRestricted] & 1) == 0)
  {
    v40 = (dispatch_queue_s *)_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3;
    block[3] = &unk_189D732C0;
    id v43 = (id)v14;
    id v44 = (id)v15;
    id v45 = v16;
    id v48 = v19;
    id v46 = v17;
    id v47 = v18;
    dispatch_async(v40, block);
  }

  else if (v21)
  {
    [v17 bundleIdentifier];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      [v17 bundleIdentifier];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = +[LSApplicationProxy applicationProxyForSystemPlaceholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForSystemPlaceholder:",  v27);
      if (v28)
      {
        [(id)v14 webpageURL];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 bundleIdentifier];
        char v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationWorkspace _LSFailedToOpenURL:withBundle:](self, "_LSFailedToOpenURL:withBundle:", v29, v30);
      }
    }

    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:op tions:completionHandler:]",  1771LL,  0LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v31);
  }

  else
  {
    if (v15
      && ([v17 appState],
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          char v33 = [v32 isInstalled],
          v32,
          (v33 & 1) == 0))
    {
      v38 = (void *)*MEMORY[0x189607670];
      uint64_t v51 = *MEMORY[0x189607490];
      v52[0] = @"Application must be non-nil and installed.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v38;
      uint64_t v37 = 1775LL;
    }

    else
    {
      v34 = (void *)*MEMORY[0x189607670];
      uint64_t v49 = *MEMORY[0x189607490];
      v50 = @"invalid input parameters";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      uint64_t v37 = 1779LL;
    }

    _LSMakeNSErrorImpl( v36,  -50LL,  (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:op tions:completionHandler:]",  v37,  v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v39);
  }
}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_2()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LSApplicationWorkspace openUserActivity queue", v2);
  id v1 = (void *)_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
  _openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue = (uint64_t)v0;
}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3( uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E2A59C]();
  id v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    id v4 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v7 = 0LL;
    id v6 = 0LL;
    goto LABEL_5;
  }

  [v3 _uniqueIdentifier];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(a1 + 32);
  id v16 = 0LL;
  _LSGetDataForUserActivity(v5, &v16);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v16;
  [*(id *)(a1 + 32) activityType];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:
    id v11 = (void (*)(void, void))MEMORY[0x1895F87A8];
    uint64_t v12 = 3221225472LL;
    v13 = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4;
    unint64_t v14 = &unk_189D73298;
    id v15 = *(id *)(a1 + 72);
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, &v11);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier", v11, v12, v13, v14);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 openUserActivityWithUniqueIdentifier:v4 activityData:v6 activityType:v8 bundleIdentifier:v10 options:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];

    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_6:

  objc_autoreleasePoolPop(v2);
}

uint64_t __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 options:(id)a5 completionHandler:(id)a6
{
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 completionHandler:(id)a5
{
}

- (void)openUserActivity:(id)a3 usingApplicationRecord:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v17)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1795, @"Invalid parameter not satisfying: %@", @"userActivity != nil" object file lineNumber description];
  }

  [v11 compatibilityObject];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v12);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]( self,  "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:",  v17,  0LL,  0LL,  v14,  v15,  v13);
}

- (void)openUserActivityWithUUID:(id)a3 activityType:(id)a4 usingApplicationRecord:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v22)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1896077D8] currentHandler];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1808, @"Invalid parameter not satisfying: %@", @"activityType != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1809, @"Invalid parameter not satisfying: %@", @"appRecord != nil" object file lineNumber description];

    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 1807, @"Invalid parameter not satisfying: %@", @"uuid != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v14) {
    goto LABEL_7;
  }
LABEL_4:
  [v14 compatibilityObject];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v15);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]( self,  "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:",  0LL,  v22,  v13,  v17,  v18,  v16);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7 userInfo:(id)a8 options:(id)a9 delegate:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  [MEMORY[0x1896077F0] blockOperationWithBlock:&__block_literal_global_216];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    int v21 = -[_LSOpenResourceOperationDelegateWrapper initWithOperation:wrappedDelegate:]( objc_alloc(&OBJC_CLASS____LSOpenResourceOperationDelegateWrapper),  "initWithOperation:wrappedDelegate:",  v20,  v19);

    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int v21 = 0LL;
  if (a7)
  {
LABEL_3:
    [MEMORY[0x189603F48] dataWithBytes:a7 length:32];
    a7 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)objc_claimAutoreleasedReturnValue();
  }

void __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_2( uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  v22[0] = 0LL;
  id v21 = 0LL;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v2, v3, v4, v22, &v21);
  id v6 = v22[0];
  id v7 = v21;
  if (FileHandleForOpeningResource)
  {
    v19[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v19[1] = (void (*)(void, void))3221225472LL;
    v19[2] = (void (*)(void, void))__152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3;
    v19[3] = (void (*)(void, void))&unk_189D73308;
    id v20 = *(id *)(a1 + 56);
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v19);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 88);
    uint64_t v12 = [*(id *)(a1 + 80) bytes];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v15 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4;
    v17[3] = &unk_189D73330;
    id v18 = v15;
    [v8 performOpenOperationWithURL:v9 fileHandle:v6 bundleIdentifier:v16 documentIdentifier:v10 isContentManaged:v11 sourceAuditToken:v12 userI nfo:v14 options:v13 delegate:v18 completionHandler:v17];
  }

  else
  {
    [*(id *)(a1 + 56) openResourceOperation:0 didFailWithError:v7];
  }
}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) openResourceOperation:0 didFailWithError:a2];
}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4( uint64_t a1,  int a2,  uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 openResourceOperationDidComplete:0];
  }
  else {
    return [v3 openResourceOperation:0 didFailWithError:a3];
  }
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 options:(id)a8 delegate:(id)a9
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:]( self,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo: options:delegate:",  a3,  a4,  a5,  a6,  0LL,  a7,  a8,  a9);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 delegate:(id)a8
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:]( self,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo: options:delegate:",  a3,  a4,  a5,  a6,  0LL,  a7,  0LL,  a8);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6 delegate:(id)a7
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:]( self,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo: options:delegate:",  a3,  a4,  a5,  0LL,  0LL,  a6,  0LL,  a7);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:]( self,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:",  a3,  a4,  a5,  a6,  0LL);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 userInfo:(id)a5
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:]( self,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:",  a3,  a4,  0LL,  a5);
}

- (id)optionsFromOpenConfiguration:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189603FC8] dictionary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [v3 frontBoardOptions];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v3 frontBoardOptions];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 addEntriesFromDictionary:v6];
    }

    [v3 referrerURL];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:@"ReferrerURL"];

    if (([v3 allowURLOverrides] & 1) == 0) {
      [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"NoOverrides"];
    }
    [v3 targetConnectionEndpoint];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v3 targetConnectionEndpoint];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v9 forKeyedSubscript:@"LSTargetBSServiceConnectionEndpointKey"];
    }
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"LSBlockUntilComplete"];
  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (id)openURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__3;
  id v24 = __Block_byref_object_dispose__3;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  id v19 = 0LL;
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke;
  v13[3] = &unk_189D73380;
  v13[4] = &v20;
  v13[5] = &v14;
  -[LSApplicationWorkspace commonClientOpenURL:options:configuration:synchronous:completionHandler:]( self,  "commonClientOpenURL:options:configuration:synchronous:completionHandler:",  v8,  v10,  v9,  1LL,  v13);
  if (a5) {
    *a5 = (id) v15[5];
  }
  id v11 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)openURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace commonClientOpenURL:options:configuration:synchronous:completionHandler:]( self,  "commonClientOpenURL:options:configuration:synchronous:completionHandler:",  v10,  v11,  v9,  0LL,  v8);
}

- (void)commonClientOpenURL:(id)a3 options:(id)a4 configuration:(id)a5 synchronous:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 2094, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }

  _LSDefaultLog();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    loggableURL(v13);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    id v41 = v27;
    __int16 v42 = 2113;
    id v43 = v14;
    __int16 v44 = 1024;
    BOOL v45 = v8;
    _os_log_debug_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEBUG,  "Opening URL %{private}@ with options dictionary %{private}@ synchronous: %u",  buf,  0x1Cu);
  }

  id v39 = 0LL;
  id v38 = 0LL;
  int FileHandleForOpeningResource = getFileHandleForOpeningResource(v13, 0LL, v14, &v39, &v38);
  id v19 = v39;
  id v20 = v38;
  if (FileHandleForOpeningResource)
  {
    id v21 = (void (*)(void, void))MEMORY[0x1895F87A8];
    if (v8)
    {
      _LSFaultIfRunningOnMainThreadOfShellApp();
      uint64_t v22 = v21;
      v35[0] = v21;
      v35[1] = (void (*)(void, void))3221225472LL;
      v35[2] = (void (*)(void, void))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke;
      v35[3] = (void (*)(void, void))&unk_189D733A8;
      uint64_t v23 = &v36;
      id v36 = v13;
      id v24 = &v37;
      id v37 = v16;
      uint64_t v25 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v35);
    }

    else
    {
      uint64_t v22 = (void (*)(void, void))MEMORY[0x1895F87A8];
      v32[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
      v32[1] = (void (*)(void, void))3221225472LL;
      v32[2] = (void (*)(void, void))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_222;
      v32[3] = (void (*)(void, void))&unk_189D733A8;
      uint64_t v23 = &v33;
      id v33 = v13;
      id v24 = &v34;
      id v34 = v16;
      uint64_t v25 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v32);
    }

    id v26 = (void *)v25;

    v29[0] = v22;
    v29[1] = 3221225472LL;
    v29[2] = __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_223;
    v29[3] = &unk_189D733D0;
    id v30 = v13;
    id v31 = v16;
    [v26 openURL:v30 fileHandle:v19 options:v14 completionHandler:v29];
  }

  else
  {
    (*((void (**)(id, void, id))v16 + 2))(v16, 0LL, v20);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0LL, v3);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_222( uint64_t a1,  void *a2)
{
  id v3 = a2;
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_222_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0LL, v3);
  }
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_223( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_223_cold_1();
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (a2) {
      uint64_t v8 = MEMORY[0x189604A60];
    }
    else {
      uint64_t v8 = 0LL;
    }
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingConfiguration:(id)a4 completionHandler:(id)a5
{
}

- (id)installedPlugins
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LSPlugInQuery pluginQuery](&OBJC_CLASS___LSPlugInQuery, "pluginQuery");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__LSApplicationWorkspace_installedPlugins__block_invoke;
  v6[3] = &unk_189D733F8;
  id v4 = v2;
  id v7 = v4;
  enumeratePluginsMatchingQuery(v3, v6);

  return v4;
}

void __42__LSApplicationWorkspace_installedPlugins__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) addObject:a2];
  }

  else
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get all plugins: <%@>", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 applyFilter:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  [MEMORY[0x189603FA8] arrayWithCapacity:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v12;
  if (v8)
  {
    [v12 setValue:v8 forKey:@"NSExtensionIdentifier"];
    if (v9)
    {
      [v13 setValue:v9 forKey:@"NSExtensionPointName"];
      id v14 = (id)MEMORY[0x189604A88];
      id v15 = @"LSShouldORIdentifiers";
      uint64_t v12 = v13;
LABEL_6:
      [v12 setValue:v14 forKey:v15];
    }
  }

  else if (v9)
  {
    id v15 = @"NSExtensionPointName";
    id v14 = v9;
    goto LABEL_6;
  }

  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:]( &OBJC_CLASS___LSPlugInQuery,  "pluginQueryWithQueryDictionary:applyFilter:",  v13,  v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  id v22[2] = __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke;
  v22[3] = &unk_189D73420;
  id v17 = v11;
  id v23 = v17;
  id v24 = v13;
  id v18 = v13;
  enumeratePluginsMatchingQuery(v16, v22);
  id v19 = v24;
  id v20 = v17;

  return v20;
}

void __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }

  else if (v6)
  {
    _LSDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to get plugins matching query %@: <%@>",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)enumeratePluginsMatchingQuery:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = (id)MEMORY[0x189604A60];
  }
  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:]( &OBJC_CLASS___LSPlugInQuery,  "pluginQueryWithQueryDictionary:applyFilter:",  v6,  0LL);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke;
  v9[3] = &unk_189D73448;
  id v10 = v5;
  id v8 = v5;
  enumeratePluginsMatchingQuery(v7, v9);
}

uint64_t __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x189603FA8];
  id v7 = a4;
  [v6 arrayWithCapacity:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = (id)MEMORY[0x189604A60];
  }
  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:]( &OBJC_CLASS___LSPlugInQuery,  "pluginQueryWithQueryDictionary:applyFilter:",  v9,  v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  id v19 = __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke;
  id v20 = &unk_189D73420;
  id v11 = v8;
  id v21 = v11;
  id v12 = v5;
  id v22 = v12;
  enumeratePluginsMatchingQuery(v10, &v17);
  if (!objc_msgSend(v11, "count", v17, v18, v19, v20))
  {
    _LSDefaultLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl(&dword_183E58000, v13, OS_LOG_TYPE_DEFAULT, "No plugins found to match query %@", buf, 0xCu);
    }
  }

  uint64_t v14 = v22;
  id v15 = v11;

  return v15;
}

void __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }

  else if (v6)
  {
    _LSDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to get plugins matching query %@: <%@>",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)enumerateBundlesOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v7)
  {
    if (a3 == 6)
    {
      +[LSPlugInQuery pluginQuery](&OBJC_CLASS___LSPlugInQuery, "pluginQuery");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke;
      v14[3] = &unk_189D73448;
      uint64_t v9 = &v15;
      id v15 = v7;
      enumeratePluginsMatchingQuery(v8, v14);
    }

    else
    {
      +[_LSBundleProxiesOfTypeQuery queryWithType:](&OBJC_CLASS____LSBundleProxiesOfTypeQuery, "queryWithType:", a3);
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v10;
      if (!v10)
      {
LABEL_7:

        goto LABEL_8;
      }

      [v10 setLegacy:v5];
      +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2;
      v12[3] = &unk_189D73470;
      uint64_t v9 = &v13;
      id v13 = v7;
      [v11 enumerateResolvedResultsOfQuery:v8 withBlock:v12];
    }

    goto LABEL_7;
  }

uint64_t __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke( uint64_t result,  uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

void __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id v3 = v4;
  }
}

- (void)enumerateBundlesOfType:(unint64_t)a3 block:(id)a4
{
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v7)
  {
    +[_LSApplicationProxiesOfTypeQuery queryWithType:]( &OBJC_CLASS____LSApplicationProxiesOfTypeQuery,  "queryWithType:",  a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 setLegacy:v5];
      +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke;
      v11[3] = &unk_189D73470;
      id v12 = v7;
      [v10 enumerateResolvedResultsOfQuery:v9 withBlock:v11];
    }
  }
}

uint64_t __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke( uint64_t result,  uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 block:(id)a4
{
}

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  if (v3)
  {
    +[_LSApplicationIsInstalledQuery queryWithBundleIdentifier:]( &OBJC_CLASS____LSApplicationIsInstalledQuery,  "queryWithBundleIdentifier:",  v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke;
      v8[3] = &unk_189D723E0;
      v8[4] = &v9;
      [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v8];
    }

    BOOL v6 = *((_BYTE *)v10 + 24) != 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  if (a2)
  {
    id v6 = a2;
    [v6 propertyListWithClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 BOOLValue];
    *a4 = 1;
  }

- (id)removedSystemApplications
{
  return 0LL;
}

- (id)bundleIdentifiersForMachOUUIDs:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(1, a3, a4);
}

- (id)machOUUIDsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(0, a3, a4);
}

- (BOOL)getClaimedActivityTypes:(id *)a3 domains:(id *)a4
{
  CFTypeRef v10 = 0LL;
  CFTypeRef cf = 0LL;
  int v6 = _LSCopyClaimedActivityIdentifiersAndDomains(&cf, &v10);
  if (!v6)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      if (a3)
      {
        *a3 = (id)[(id)cf copy];
        CFTypeRef v7 = cf;
      }

      CFRelease(v7);
    }

    CFTypeRef v8 = v10;
    if (v10)
    {
      if (a4)
      {
        *a4 = (id)[(id)v10 copy];
        CFTypeRef v8 = v10;
      }

      CFRelease(v8);
    }
  }

  return v6 == 0;
}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 registrationError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  id v43 = __Block_byref_object_copy__3;
  __int16 v44 = __Block_byref_object_dispose__3;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = __Block_byref_object_copy__3;
  id v38 = __Block_byref_object_dispose__3;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  uint64_t v18 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v16);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v18, (uint64_t)v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke;
  v27[3] = &unk_189D731E8;
  v27[4] = &v28;
  [v20 synchronousRemoteObjectProxyWithErrorHandler:v27];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472LL;
  v26[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2;
  v26[3] = &unk_189D73498;
  v26[4] = &v34;
  v26[5] = &v40;
  v26[6] = &v28;
  [v22 performPostInstallationRegistration:v13 personaUniqueStrings:v14 operationUUID:v15 reply:v26];

  handleSaveObserverBehavior(v17, (void *)v35[5], v15, (void *)v29[5]);
  id v23 = (void *)v41[5];
  if (a8 && !v23)
  {
    *a8 = (id) v29[5];
    id v23 = (void *)v41[5];
  }

  id v24 = v23;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke( uint64_t a1,  void *a2)
{
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2( void *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v17 = v8;

  uint64_t v12 = *(void *)(a1[5] + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  uint64_t v15 = *(void *)(a1[6] + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 saveObserver:(id)a6 registrationError:(id *)a7
{
  return -[LSApplicationWorkspace registerContainerizedApplicationWithInfoDictionaries:personaUniqueStrings:operationUUID:requestContext:saveObserver:registrationError:]( self,  "registerContainerizedApplicationWithInfoDictionaries:personaUniqueStrings:operationUUID:requestContext:saveOb server:registrationError:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (id)registerContainerizedApplicationWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 operationUUID:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 registrationError:(id *)a9
{
  uint64_t v28 = self;
  id v29 = a9;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v14, "count") + 1);
  [v13 legacyRecordDictionary];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 addObject:v19];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v20 = v14;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v24), "legacyRecordDictionary", v28, v29, (void)v30);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 addObject:v25];

        ++v24;
      }

      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v22);
  }

  -[LSApplicationWorkspace registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:]( v28,  "registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:",  v18,  v15,  v16,  v17,  v29);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 precondition:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 unregistrationError:(id *)a9
{
  uint64_t v12 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = __Block_byref_object_copy__3;
  id v39 = __Block_byref_object_dispose__3;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  __int128 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  __int128 v32 = __Block_byref_object_copy__3;
  __int128 v33 = __Block_byref_object_dispose__3;
  id v34 = 0LL;
  id v19 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v17);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v19, (uint64_t)v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = MEMORY[0x1895F87A8];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke;
  v28[3] = &unk_189D731E8;
  v28[4] = &v35;
  [v21 synchronousRemoteObjectProxyWithErrorHandler:v28];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472LL;
  v27[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2;
  v27[3] = &unk_189D734C0;
  v27[4] = &v29;
  void v27[5] = &v35;
  v27[6] = &v41;
  [v23 performPostUninstallationUnregistrationOfBundleID:v14 operationUUID:v15 unregisterType:v12 precondition:v16 reply:v27];

  handleSaveObserverBehavior(v18, (void *)v30[5], v15, (void *)v36[5]);
  int v24 = *((unsigned __int8 *)v42 + 24);
  if (a9 && !*((_BYTE *)v42 + 24))
  {
    *a9 = (id) v36[5];
    int v24 = *((unsigned __int8 *)v42 + 24);
  }

  BOOL v25 = v24 != 0;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v25;
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke( uint64_t a1,  void *a2)
{
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2( void *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v11 == 0LL;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 requestContext:(id)a6 saveObserver:(id)a7 unregistrationError:(id *)a8
{
  return -[LSApplicationWorkspace unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:requestContext:saveObserver:unregistrationError:]( self,  "unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:req uestContext:saveObserver:unregistrationError:",  a3,  a4,  *(void *)&a5,  0LL,  a6,  a7,  a8);
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationsWithBundleIdentifiers:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = __Block_byref_object_copy__3;
  id v38 = __Block_byref_object_dispose__3;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  __int128 v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  id v18 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v16);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v18, (uint64_t)v19);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke;
  v27[3] = &unk_189D731E8;
  v27[4] = &v34;
  [v20 synchronousRemoteObjectProxyWithErrorHandler:v27];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472LL;
  v26[2] = __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke_2;
  v26[3] = &unk_189D734C0;
  v26[4] = &v28;
  v26[5] = &v34;
  v26[6] = &v40;
  [v22 performUpdateOfPersonasOfBundleIDs:v14 toPersonaUniqueStrings:v13 operationUUID:v15 reply:v26];

  handleSaveObserverBehavior(v17, (void *)v29[5], v15, (void *)v35[5]);
  int v23 = *((unsigned __int8 *)v41 + 24);
  if (a8 && !*((_BYTE *)v41 + 24))
  {
    *a8 = (id) v35[5];
    int v23 = *((unsigned __int8 *)v41 + 24);
  }

  BOOL v24 = v23 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke( uint64_t a1,  void *a2)
{
}

void __135__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error___block_invoke_2( void *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v11 == 0LL;
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationWithBundleIdentifier:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v14 = (void *)MEMORY[0x189604010];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  [v14 setWithObject:a4];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = -[LSApplicationWorkspace setPersonaUniqueStrings:forApplicationsWithBundleIdentifiers:operationUUID:requestContext:saveObserver:error:]( self,  "setPersonaUniqueStrings:forApplicationsWithBundleIdentifiers:operationUUID:requestContext:saveObserver:error:",  v18,  v19,  v17,  v16,  v15,  a8);

  return (char)a8;
}

- (BOOL)sendNotificationOfType:(unsigned int)a3 forApplicationWithBundleIdentifier:(id)a4 requestContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  v34[1] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v23 = 0LL;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__3;
  uint64_t v27 = __Block_byref_object_dispose__3;
  id v28 = 0LL;
  if (v8 > 4)
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"unknown notification type %d", v8);
    id v13 = (void *)v14;
    if (v14) {
      id v15 = (const __CFString *)v14;
    }
    else {
      id v15 = @"invalid input parameters";
    }
    uint64_t v33 = *MEMORY[0x189607490];
    v34[0] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSApplicationWorkspace sendNotificationOfType:forApplicationWithBundleIdentifier:requestContext:error:]",  2661LL,  v16);
    id v18 = (void *)v24[5];
    v24[5] = v17;
  }

  else
  {
    uint64_t v12 = dword_183FBEFF8[(int)v8];
    -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    id v22[2] = __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke;
    v22[3] = &unk_189D734E8;
    void v22[4] = &v23;
    v22[5] = &v29;
    [v13 sendNotification:v12 forApplicationWithBundleIdentifier:v10 completion:v22];
  }

  int v19 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((_BYTE *)v30 + 24))
  {
    *a6 = (id) v24[5];
    int v19 = *((unsigned __int8 *)v30 + 24);
  }

  BOOL v20 = v19 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4 == 0LL;
}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 requestContext:(id)a5 registrationError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__3;
  id v26 = __Block_byref_object_dispose__3;
  id v27 = 0LL;
  uint64_t v12 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v12, (uint64_t)v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke;
  v21[3] = &unk_189D731E8;
  v21[4] = &v22;
  [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472LL;
  v20[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2;
  v20[3] = &unk_189D734E8;
  v20[4] = &v28;
  v20[5] = &v22;
  [v16 performRebuildRegistration:v9 personaUniqueStrings:v10 reply:v20];

  int v17 = *((unsigned __int8 *)v29 + 24);
  if (a6 && !*((_BYTE *)v29 + 24))
  {
    *a6 = (id) v23[5];
    int v17 = *((unsigned __int8 *)v29 + 24);
  }

  BOOL v18 = v17 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke( uint64_t a1,  void *a2)
{
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2( uint64_t a1,  void *a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2 == 0LL;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 requestContext:(id)a4 registrationError:(id *)a5
{
  return -[LSApplicationWorkspace registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:]( self,  "registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:",  a3,  0LL,  a4,  a5);
}

- (BOOL)registerApplicationForRebuildWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 requestContext:(id)a6 registrationError:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v12, "count") + 1);
  [v11 legacyRecordDictionary];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 addObject:v16];

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v21) legacyRecordDictionary];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 addObject:v22];

        ++v21;
      }

      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v19);
  }

  BOOL v23 = -[LSApplicationWorkspace registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:]( self,  "registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:",  v15,  v13,  v14,  a7);
  return v23;
}

- (BOOL)updatePlaceholderMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 installType:(unint64_t)a6 failure:(unint64_t)a7 saveObserver:(id)a8 error:(id *)a9
{
  v30[2] = *MEMORY[0x1895F89C0];
  v29[0] = @"LSInstallType";
  id v14 = (void *)MEMORY[0x189607968];
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  [v14 numberWithUnsignedInteger:a6];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = @"PlaceholderFailureReason";
  v30[0] = v18;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a7];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:2];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = a6 - 7 < 3 && a7 != 0;
  id v27 = 0LL;
  id v28 = 0LL;
  BOOL v23 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:]( self,  "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:",  v17,  0LL,  0LL,  v20,  v22,  v16,  &v28,  &v27);

  id v24 = v28;
  id v25 = v27;

  handleSaveObserverBehavior(v15, v24, v16, v25);
  if (a9 && !v23) {
    *a9 = v25;
  }

  return v23;
}

- (BOOL)updateiTunesMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 metadataPlist:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v19 = 0LL;
  id v20 = 0LL;
  id v13 = a7;
  id v14 = a4;
  BOOL v15 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:]( self,  "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:",  a3,  0LL,  a6,  0LL,  0LL,  v14,  &v20,  &v19);
  id v16 = v20;
  id v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15) {
    *a8 = v17;
  }

  return v15;
}

- (BOOL)updateSINFMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 parsedSINFInfo:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v19 = 0LL;
  id v20 = 0LL;
  id v13 = a7;
  id v14 = a4;
  BOOL v15 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:]( self,  "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:",  a3,  a6,  0LL,  0LL,  0LL,  v14,  &v20,  &v19);
  id v16 = v20;
  id v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15) {
    *a8 = v17;
  }

  return v15;
}

- (BOOL)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0LL;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0LL;
  -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke;
  v13[3] = &unk_189D731E8;
  v13[4] = &v14;
  [v10 setProgressProportionsByPhase:v8 forInstallOfApplicationWithIdentifier:v9 completion:v13];

  id v11 = (void *)v15[5];
  if (a5 && v11) {
    *a5 = v11;
  }
  _Block_object_dispose(&v14, 8);

  return v11 == 0LL;
}

void __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke( uint64_t a1,  void *a2)
{
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:]( self,  "installApplication:withOptions:error:usingBlock:",  a3,  a4,  0LL,  0LL);
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  return -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:]( self,  "installApplication:withOptions:error:usingBlock:",  a3,  a4,  a5,  0LL);
}

- (void)placeholderInstalledForIdentifier:(id)a3 filterDowngrades:(BOOL)a4
{
  BOOL v4 = a4;
  +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  a3,  1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  if (!v4
    || (uint64_t v7 = [v6 installType], v8 = v12, v7 != 8)
    && (uint64_t v9 = [v12 installType], v8 = v12, v9 != 7)
    && (v10 = [v12 installType], id v8 = v12, v10 != 9))
  {
    -[LSApplicationWorkspace installProgressForApplication:withPhase:]( self,  "installProgressForApplication:withPhase:",  v12,  3LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setInstallState:5];
    -[LSApplicationWorkspace installPhaseFinishedForProgress:](self, "installPhaseFinishedForProgress:", v11);

    id v8 = v12;
  }
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
  }

  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  __int128 v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  char v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke;
  v27[3] = &unk_189D731E8;
  v27[4] = &v28;
  [v20 synchronousRemoteObjectProxyWithErrorHandler:v27];
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472LL;
  v26[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2;
  v26[3] = &unk_189D73210;
  v26[4] = &v34;
  v26[5] = &v28;
  [v22 performShimmedInstallOfArtifact:v9 options:v10 completion:v26];

  int v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = (id) v29[5];
    int v23 = *((unsigned __int8 *)v35 + 24);
  }

  BOOL v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke( uint64_t a1,  void *a2)
{
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return -[LSApplicationWorkspace installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:]( self,  "installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:",  a3,  a4,  0LL,  a5,  a6);
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:].cold.1( v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20);
    }
  }

  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  char v32 = __Block_byref_object_copy__3;
  id v33 = __Block_byref_object_dispose__3;
  id v34 = 0LL;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = MEMORY[0x1895F87A8];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke;
  v28[3] = &unk_189D731E8;
  v28[4] = &v29;
  [v21 synchronousRemoteObjectProxyWithErrorHandler:v28];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472LL;
  v27[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2;
  v27[3] = &unk_189D73210;
  v27[4] = &v35;
  void v27[5] = &v29;
  [v23 performShimmedInstallOfArtifact:v10 options:v11 completion:v27];

  int v24 = *((unsigned __int8 *)v36 + 24);
  if (a6 && !*((_BYTE *)v36 + 24))
  {
    *a6 = (id) v30[5];
    int v24 = *((unsigned __int8 *)v36 + 24);
  }

  BOOL v25 = v24 != 0;
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v25;
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke( uint64_t a1,  void *a2)
{
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)uninstallContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace uninstallContainerizedApplicationWithIdentifier:options:error:progressBlock:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
  }

  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  char v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke;
  v27[3] = &unk_189D731E8;
  v27[4] = &v28;
  [v20 synchronousRemoteObjectProxyWithErrorHandler:v27];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472LL;
  v26[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2;
  v26[3] = &unk_189D73210;
  v26[4] = &v34;
  v26[5] = &v28;
  [v22 performShimmedUninstallOfApplicationWithIdentifier:v9 options:v10 completion:v26];

  int v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = (id) v29[5];
    int v23 = *((unsigned __int8 *)v35 + 24);
  }

  BOOL v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke( uint64_t a1,  void *a2)
{
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)downgradeApplicationToPlaceholder:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:].cold.1();
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:]",  3050LL,  0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:]( self,  "uninstallApplication:withOptions:error:usingBlock:",  a3,  a4,  0LL,  0LL);
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  return -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:]( self,  "uninstallApplication:withOptions:error:usingBlock:",  a3,  a4,  0LL,  a5);
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
  }

  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  char v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke;
  v27[3] = &unk_189D731E8;
  v27[4] = &v28;
  [v20 synchronousRemoteObjectProxyWithErrorHandler:v27];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472LL;
  v26[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2;
  v26[3] = &unk_189D73210;
  v26[4] = &v34;
  v26[5] = &v28;
  [v22 performShimmedUninstallOfApplicationWithIdentifier:v9 options:v10 completion:v26];

  int v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = (id) v29[5];
    int v23 = *((unsigned __int8 *)v35 + 24);
  }

  BOOL v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke( uint64_t a1,  void *a2)
{
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)restoreSystemApplication:(id)a3
{
  return 0;
}

- (BOOL)registerApplicationDictionary:(id)a3 withObserverNotification:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"IsPlaceholder"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 BOOLValue];

  [v6 objectForKeyedSubscript:*MEMORY[0x189604E00]];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v10 = 0LL;
    goto LABEL_11;
  }

  [v6 objectForKeyedSubscript:@"Path"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_11:
    int v11 = -50;
    goto LABEL_9;
  }

  int v11 = registerApplicationWithDictionary(v6, 1u);
  if (!v11)
  {
    +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v9,  v8);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[LSApplicationWorkspace observerProxy](self, "observerProxy");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 sendNotification:v4 forApplications:v14 withPlugins:0];
    }

    else
    {
      _LSProgressLog();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationWorkspace registerApplicationDictionary:withObserverNotification:].cold.1();
      }
    }

    int v11 = 0;
  }

- (BOOL)registerApplicationDictionary:(id)a3
{
  return -[LSApplicationWorkspace registerApplicationDictionary:withObserverNotification:]( self,  "registerApplicationDictionary:withObserverNotification:",  a3,  7LL);
}

- (BOOL)registerApplication:(id)a3
{
  OSStatus v3 = LSRegisterURL((CFURLRef)a3, 0);
  if (!v3)
  {
    _LSInstallLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "Not sending applicationsDidInstall notification, please file a bug with Purple LaunchServices if you need this",  v6,  2u);
    }
  }

  return v3 == 0;
}

- (BOOL)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 saveObserver:(id)a5 requestContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v20 = a3;
  id v21 = a4;
  id v19 = a5;
  id v9 = a6;
  uint64_t v30 = 0LL;
  v31[0] = &v30;
  v31[1] = 0x3032000000LL;
  v31[2] = __Block_byref_object_copy__3;
  v31[3] = __Block_byref_object_dispose__3;
  id v32 = 0LL;
  uint64_t v24 = 0LL;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0LL;
  uint64_t v10 = MEMORY[0x1895F87A8];
  do
  {
    int v11 = (void *)objc_opt_class();
    serviceDomainForRequestContext(v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDServiceGetXPCConnection(v11, (uint64_t)v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v10;
    v23[1] = 3221225472LL;
    v23[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke;
    v23[3] = &unk_189D731E8;
    v23[4] = &v30;
    [v13 synchronousRemoteObjectProxyWithErrorHandler:v23];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472LL;
    id v22[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2;
    v22[3] = &unk_189D73510;
    void v22[4] = &v24;
    v22[5] = &v30;
    [v14 unregisterApplicationsAtMountPoint:v20 operationUUID:v21 reply:v22];
  }

  while (_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v31[0] + 40LL)));
  handleSaveObserverBehavior(v19, (void *)v25[5], v21, *(void **)(v31[0] + 40LL));
  if (*(void *)(v31[0] + 40LL))
  {
    _LSDefaultLog();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v20 absoluteString];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSApplicationWorkspace unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:].cold.1( v16,  (uint64_t)v31,  (uint64_t)v33,  v15);
    }

    BOOL v17 = *(void *)(v31[0] + 40LL) == 0LL;
  }

  else
  {
    BOOL v17 = 1;
  }

  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke( uint64_t a1,  void *a2)
{
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)unregisterApplication:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  BOOL v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0LL;
  uint64_t v4 = (void (*)(void, void))MEMORY[0x1895F87A8];
  do
  {
    id v5 = (void *)v13[5];
    void v13[5] = 0LL;

    v11[0] = v4;
    v11[1] = (void (*)(void, void))3221225472LL;
    v11[2] = (void (*)(void, void))__48__LSApplicationWorkspace_unregisterApplication___block_invoke;
    v11[3] = (void (*)(void, void))&unk_189D731E8;
    void v11[4] = (void (*)(void, void))&v12;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v11);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472LL;
    v10[2] = __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2;
    v10[3] = &unk_189D731E8;
    void v10[4] = &v12;
    [v6 unregisterApplicationAtURL:v3 reply:v10];
  }

  while (_LSNSErrorIsXPCConnectionInterrupted((void *)v13[5]));
  if (v13[5])
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace unregisterApplication:].cold.1();
    }

    BOOL v8 = v13[5] == 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke(uint64_t a1, void *a2)
{
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }
}

- (BOOL)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 outSaveToken:(id *)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a7;
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  char v37 = __Block_byref_object_copy__3;
  char v38 = __Block_byref_object_dispose__3;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0LL;
  uint64_t v18 = MEMORY[0x1895F87A8];
  v27[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v27[1] = (void (*)(void, void))3221225472LL;
  v27[2] = (void (*)(void, void))__139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke;
  v27[3] = (void (*)(void, void))&unk_189D731E8;
  v27[4] = (void (*)(void, void))&v34;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v27);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  v26[1] = 3221225472LL;
  v26[2] = __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2;
  v26[3] = &unk_189D73538;
  v26[4] = &v28;
  v26[5] = &v40;
  void v26[6] = &v34;
  LOBYTE(v23) = a9 != 0LL;
  [v19 updateRecordForApp:v25 withSINF:v24 iTunesMetadata:v15 placeholderMetadata:v16 sendNotification:v11 operationUUID:v17 returnSaveToken:v23 completionHandler:v26];
  _LSContextInvalidate();
  int v20 = *((unsigned __int8 *)v41 + 24);
  if (a9 && *((_BYTE *)v41 + 24))
  {
    *a9 = (id) v29[5];
    int v20 = *((unsigned __int8 *)v41 + 24);
  }

  if (a10 && !v20)
  {
    *a10 = (id) v35[5];
    int v20 = *((unsigned __int8 *)v41 + 24);
  }

  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v21;
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke( uint64_t a1,  void *a2)
{
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2( void *a1,  char a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[4] + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  uint64_t v11 = *(void *)(a1[6] + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

- (BOOL)updateSINFWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:].cold.1( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:]",  3267LL,  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v15;
  if (a6) {
    *a6 = v15;
  }

  return 0;
}

- (BOOL)_getBundleIdentifierForBundleAtURL:(id)a3 invokeUpdateBlockAndReregister:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v7 = (const __CFURL *)a3;
  uint64_t v8 = (uint64_t (**)(id, const __CFURL *, os_log_s *, id *))a4;
  id v21 = 0LL;
  uint64_t v9 = -[LSApplicationRecord initWithURL:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithURL:allowPlaceholder:error:",  v7,  1LL,  &v21);
  id v10 = v21;
  if (!v9)
  {
    _LSDefaultLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.1();
    }
    goto LABEL_14;
  }

  -[LSBundleRecord bundleIdentifier](v9, "bundleIdentifier");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v20 = v10;
    int v12 = v8[2](v8, v7, v11, &v20);
    id v13 = v20;

    if (v12)
    {
      BOOL v14 = 1;
      OSStatus v15 = LSRegisterURL(v7, 1u);
      id v19 = v13;
      BOOL v16 = _LSGetNSErrorFromOSStatusImpl( v15,  &v19,  (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]",  3287LL);
      id v10 = v19;

      if (v16) {
        goto LABEL_15;
      }
      _LSDefaultLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.2();
      }
      goto LABEL_13;
    }

    _LSDefaultLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.3();
    }
  }

  else
  {
    uint64_t v22 = *MEMORY[0x189607490];
    v23[0] = @"provided bundle URL was not a bundle with a bundle identifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  112LL,  (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]",  3298LL,  v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v10 = v13;
LABEL_13:

LABEL_14:
  BOOL v14 = 0;
LABEL_15:

  if (a5) {
    *a5 = v10;
  }

  return v14;
}

- (BOOL)updateSINFWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplicationAtURL:error:]",  3335LL,  0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:].cold.1( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:]",  3347LL,  0LL);
  OSStatus v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = v15;
  if (a6) {
    *a6 = v15;
  }

  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:].cold.1( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
  }

  if (a5)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:]",  3359LL,  0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failure:(unint64_t)a5 underlyingError:(id)a6 source:(unint64_t)a7 outError:(id *)a8
{
  v43[2] = *MEMORY[0x1895F89C0];
  id v13 = a3;
  uint64_t v14 = (void *)MEMORY[0x189607968];
  id v15 = a6;
  [v14 numberWithUnsignedInteger:a5];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedInteger:a7];
  id v38 = v15;
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  char v37 = v17;
  _LSLogStepStart( 11LL,  0LL,  v13,  @"Updating PlaceholderMetadata for %@ with failure %@ <LSInstallType %@, underlyingError (%@), source %@>",  v18,  v19,  v20,  v21,  (uint64_t)v13);

  softLinkMobileInstallationUpdatePlaceholderMetadata(v13, a4, a5, v15, a7);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    _LSDefaultLog();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:].cold.1();
    }
    BOOL v24 = 0LL;
  }

  else
  {
    BOOL v26 = a4 - 7 < 3 && a5 != 0;
    v42[0] = @"LSInstallType";
    [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = @"PlaceholderFailureReason";
    v43[0] = v27;
    [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:2];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607AB8] UUID];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = 0LL;
    BOOL v24 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:]( self,  "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:",  v13,  0LL,  0LL,  v29,  v26,  v30,  0LL,  &v41,  v37,  v38,  v39);
    id v22 = v41;

    if (!v26)
    {
      uint64_t v35 = a8;
      goto LABEL_14;
    }

    -[LSApplicationWorkspace observerProxy](self, "observerProxy");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s installationEndedForApplication:withState:](v23, "installationEndedForApplication:withState:", v13, 4LL);
  }

  uint64_t v35 = a8;

LABEL_14:
  _LSLogStepFinished( 11LL,  v24,  v13,  @"Updated PlaceholderMetadata for app with error %@",  v31,  v32,  v33,  v34,  (uint64_t)v22);
  if (v35 && !v24) {
    id *v35 = v22;
  }

  return v24;
}

- (BOOL)initiateProgressForApp:(id)a3 withType:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x189607968];
  id v7 = a3;
  [v6 numberWithUnsignedInteger:a4];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSLogStepStart( 11LL,  0LL,  v7,  @"Updating PlaceholderMetadata for %@ with LSInstallType %@",  v8,  v9,  v10,  v11,  (uint64_t)v7);

  -[LSApplicationWorkspace placeholderInstalledForIdentifier:filterDowngrades:]( self,  "placeholderInstalledForIdentifier:filterDowngrades:",  v7,  0LL);
  id v20 = 0LL;
  uint64_t updated = _updatePlaceholderInstallType(self, v7, a4, &v20);
  id v13 = v20;
  _LSLogStepFinished( 11LL,  updated,  v7,  @"Updated PlaceholderMetadata for app with error %@",  v14,  v15,  v16,  v17,  (uint64_t)v13);

  return updated;
}

- (BOOL)updatePlaceholderWithBundleIdentifier:(id)a3 withInstallType:(unint64_t)a4 error:(id *)a5
{
  return _updatePlaceholderInstallType(self, a3, a4, a5);
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return -[LSApplicationWorkspace revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:]( self,  "revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:",  a3,  a4,  0LL,  a5,  a6);
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  if (a6)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSApplicationWorkspace revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:erro r:progressBlock:]",  3459LL,  0LL);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)registerPlugin:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  _LSUnregisterPluginsAtURL(v3, 0LL);
  int v4 = _LSRegisterPluginWithInfo(v3, 0LL);

  return v4 == 0;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v3 = a3;
  id v8 = 0LL;
  BOOL v4 = _LSUnregisterPluginsAtURL(v3, &v8);
  id v5 = v8;
  if (!v4)
  {
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace unregisterPlugin:].cold.1();
    }
  }

  return v4;
}

- (BOOL)allowsAlternateIcons
{
  return [(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons];
}

- (BOOL)garbageCollectDatabaseWithError:(id *)a3
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v10[1] = (void (*)(void, void))3221225472LL;
  v10[2] = (void (*)(void, void))__58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke;
  v10[3] = (void (*)(void, void))&unk_189D731E8;
  void v10[4] = (void (*)(void, void))&v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2;
  v9[3] = &unk_189D73210;
  void v9[4] = &v17;
  v9[5] = &v11;
  [v5 garbageCollectDatabaseWithCompletionHandler:v9];
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = (id) v12[5];
    int v6 = *((unsigned __int8 *)v18 + 24);
  }

  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (BOOL)isVersion:(id)a3 greaterThanOrEqualToVersion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 3515, @"Invalid parameter not satisfying: %@", @"version != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"LSApplicationWorkspace.m", 3516, @"Invalid parameter not satisfying: %@", @"minVersion != nil" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  _LSVersionNumberMakeWithString(v17, v7);
  _LSVersionNumberMakeWithString(v16, v9);
  v15[0] = v17[0];
  v15[1] = v17[1];
  v14[0] = v16[0];
  v14[1] = v16[1];
  BOOL v10 = _LSVersionNumberCompare(v15, v14) != -1;

  return v10;
}

- (BOOL)invalidateIconCache:(id)a3
{
  return 0;
}

- (void)clearAdvertisingIdentifier
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 clearAllIdentifiersOfType:1];
}

- (id)deviceIdentifierForAdvertising
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__3;
  BOOL v10 = __Block_byref_object_dispose__3;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke;
  v5[3] = &unk_189D73588;
  v5[4] = &v6;
  id v2 = _LSRetryForConnectionInterrupted(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v8[1] = (void (*)(void, void))3221225472LL;
  v8[2] = (void (*)(void, void))__56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2;
  v8[3] = (void (*)(void, void))&unk_189D731E8;
  v8[4] = (void (*)(void, void))&v9;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, v8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_260;
  v7[3] = &unk_189D73560;
  v7[4] = *(void *)(a1 + 32);
  [v3 getIdentifierOfType:1 completionHandler:v7];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (void *)v10[5];
  }
  id v5 = v4;

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSDefaultLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_260(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    _LSDefaultLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_260_cold_1();
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)deviceIdentifierForVendor
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__3;
  BOOL v10 = __Block_byref_object_dispose__3;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke;
  v5[3] = &unk_189D73588;
  v5[4] = &v6;
  id v2 = _LSRetryForConnectionInterrupted(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v8[1] = (void (*)(void, void))3221225472LL;
  v8[2] = (void (*)(void, void))__51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2;
  v8[3] = (void (*)(void, void))&unk_189D731E8;
  v8[4] = (void (*)(void, void))&v9;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, v8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_263;
  v7[3] = &unk_189D73560;
  v7[4] = *(void *)(a1 + 32);
  [v3 getIdentifierOfType:0 completionHandler:v7];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (void *)v10[5];
  }
  id v5 = v4;

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSDefaultLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_263(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    _LSDefaultLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_263_cold_1();
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)urlContainsDeviceIdentifierForAdvertising:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke;
  v8[3] = &unk_189D73600;
  id v4 = v3;
  id v9 = v4;
  BOOL v10 = &v11;
  id v5 = _LSRetryForConnectionInterrupted(v8);
  char v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

id __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  char v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v8[1] = (void (*)(void, void))3221225472LL;
  v8[2] = (void (*)(void, void))__68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2;
  v8[3] = (void (*)(void, void))&unk_189D735B0;
  id v9 = *(id *)(a1 + 32);
  BOOL v10 = &v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, v8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_264;
  v7[3] = &unk_189D735D8;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  [v3 urlContainsDeviceIdentifierForAdvertising:v4 completionHandler:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  _LSDefaultLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_264( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (id)createDeviceIdentifierWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  char v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0LL;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke;
  v10[3] = &unk_189D73560;
  void v10[4] = &v11;
  [v7 getIdentifierOfType:0 vendorName:v5 bundleIdentifier:v6 completionHandler:v10];
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke( uint64_t a1,  void *a2)
{
}

- (void)removeDeviceIdentifierForVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 clearIdentifiersForUninstallationWithVendorName:v6 bundleIdentifier:v5];
}

- (id)deviceIdentifierForVendorSeedData
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0LL;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDDeviceIdentifierService, 0LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke;
  v7[3] = &unk_189D73560;
  v7[4] = &v8;
  [v2 getIdentifierOfType:2 completionHandler:v7];
  id v3 = (void *)v9[5];
  if (v3)
  {
    [v3 getUUIDBytes:v14];
    [MEMORY[0x189603F48] dataWithBytes:v14 length:16];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _LSDefaultLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationWorkspace deviceIdentifierForVendorSeedData].cold.1();
    }

    uint64_t v4 = 0LL;
  }

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke(uint64_t a1, void *a2)
{
}

- (id)installProgressForBundleID:(id)a3 makeSynchronous:(unsigned __int8)a4
{
  id v5 = a3;
  _LSProgressLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:].cold.2();
  }

  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  char v14 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke;
  uint64_t v15 = &unk_189D72430;
  id v16 = self;
  id v8 = v5;
  id v17 = v8;
  dispatch_sync(v7, &v12);

  -[LSInstallProgressList progressForBundleID:]( self->_observedInstallProgresses,  "progressForBundleID:",  v8,  v12,  v13,  v14,  v15,  v16);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LSProgressLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:].cold.1(v9, v10);
  }

  return v9;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (uint64_t *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___LSInstallProgressList);
    id v5 = *(void **)(*v2 + 16);
    *(void *)(*v2 + 16) = v4;

    id v3 = *(void **)(*v2 + 16);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = (id *)(a1 + 40);
  [v3 progressForBundleID:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_6;
  }

  [*(id *)(*v2 + 16) subscriberForBundleID:*v6 andPublishingKey:*v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_6:
    _LSProgressLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2();
    }
    goto LABEL_8;
  }

  _LSProgressLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1();
  }

  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  char v20 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_267;
  uint64_t v21 = &unk_189D73628;
  uint64_t v12 = (os_log_s *)*v6;
  uint64_t v13 = *v2;
  id v22 = v12;
  uint64_t v23 = v13;
  char v14 = (void *)MEMORY[0x186E2A7B8](&v18);
  objc_msgSend(MEMORY[0x1896079E0], "_addSubscriberForCategory:usingPublishingHandler:", *v6, v14, v18, v19, v20, v21);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15) {
    [*(id *)(*v2 + 16) addSubscriber:v15 forPublishingKey:*v6 andBundleID:*v6];
  }
  _LSProgressLog();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *v6;
    *(_DWORD *)buf = 138412290;
    id v25 = v17;
    _os_log_impl(&dword_183E58000, v16, OS_LOG_TYPE_DEFAULT, "Subscribing to progress for app %@, ", buf, 0xCu);
  }

  uint64_t v10 = v22;
LABEL_8:
}

id __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_267( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSProgressLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 _LSDescription];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Got progress %@ for app %@, ", buf, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) setProgress:v3 forBundleID:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) remoteObserver];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = *(void *)(a1 + 32);
  [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 applicationInstallsDidChange:v8];

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  _OWORD v14[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_268;
  v14[3] = &unk_189D72430;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v16 = v10;
  uint64_t v11 = (void *)[v14 copy];
  uint64_t v12 = (void *)MEMORY[0x186E2A7B8]();

  return v12;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_268( int8x16_t *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  _LSProgressLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "Unpublishing progress block called for app %@", buf, 0xCu);
  }

  +[LSApplicationWorkspace progressQueue](&OBJC_CLASS___LSApplicationWorkspace, "progressQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_269;
  block[3] = &unk_189D72430;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);
}

void *__69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_269(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (result)
  {
    [result removeProgressForBundleID:*(void *)(a1 + 40)];
    return (void *)[*(id *)(*(void *)(a1 + 32) + 16) removeSubscriberForPublishingKey:*(void *)(a1 + 40) andBundleID:*(void *)(a1 + 40)];
  }

  return result;
}

- (id)installProgressForApplication:(id)a3 withPhase:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 bundleIdentifier];
    int8x16_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896079E0] publishingKeyForApp:v8 withPhase:a4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self;
    objc_sync_enter(v10);
    createdInstallProgresses = v10->_createdInstallProgresses;
    if (!createdInstallProgresses)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
      uint64_t v13 = v10->_createdInstallProgresses;
      v10->_createdInstallProgresses = (NSMutableDictionary *)v12;

      createdInstallProgresses = v10->_createdInstallProgresses;
    }

    -[NSMutableDictionary objectForKeyedSubscript:](createdInstallProgresses, "objectForKeyedSubscript:", v9);
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if ([v7 isPlaceholder])
      {
        [MEMORY[0x1896079E0] childProgressForBundleID:v8 andPhase:a4];
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationWorkspace syncObserverProxy](v10, "syncObserverProxy");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = MEMORY[0x1895F87A8];
        v23[0] = MEMORY[0x1895F87A8];
        v23[1] = 3221225472LL;
        void v23[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke;
        v23[3] = &unk_189D73308;
        BOOL v24 = v7;
        [v15 createInstallProgressForApplication:v24 withPhase:a4 andPublishingString:v9 reply:v23];

        v21[0] = v16;
        v21[1] = 3221225472LL;
        v21[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_272;
        v21[3] = &unk_189D72430;
        v21[4] = v10;
        id v22 = v8;
        [v14 setCancellationHandler:v21];
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_createdInstallProgresses,  "setObject:forKeyedSubscript:",  v14,  v9);
        [v14 _publish];
        _LSProgressLog();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          [v14 _LSDescription];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v18;
          _os_log_impl(&dword_183E58000, v17, OS_LOG_TYPE_DEFAULT, "Published install progress %@", buf, 0xCu);
        }

        uint64_t v19 = v24;
      }

      else
      {
        _LSProgressLog();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v7;
          _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_DEFAULT,  "App %@ is not a placeholder so cannot have progress",  buf,  0xCu);
        }

        char v14 = 0LL;
      }
    }

    objc_sync_exit(v10);
  }

  else
  {
    char v14 = 0LL;
  }

  return v14;
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  if (v2)
  {
    _LSProgressLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1();
    }
  }
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_272(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 installationEndedForApplication:*(void *)(a1 + 40) withState:3];
}

- (BOOL)installPhaseFinishedForProgress:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 userInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"bundleID"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:options:", @".", 4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v4 installState];
  if (v8 == 4)
  {
    _LSDefaultLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v4 _LSDescription];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "installPhaseFinishedForProgress: %@ - %@ called",  (uint8_t *)&v15,  0x16u);
    }

    -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 installationFailedForApplication:v7 reply:&__block_literal_global_277];
  }

  _LSDefaultLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspace installPhaseFinishedForProgress:].cold.1();
  }

  [v4 _unpublish];
  uint64_t v13 = self;
  objc_sync_enter(v13);
  if (v6) {
    -[NSMutableDictionary removeObjectForKey:](v13->_createdInstallProgresses, "removeObjectForKey:", v6);
  }
  objc_sync_exit(v13);

  return v8 != 4;
}

- (void)clearCreatedProgressForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary allKeys](v5->_createdInstallProgresses, "allKeys");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v15;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v13 = v8;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v4, v13, (void)v14))
        {
          -[NSMutableDictionary removeObjectForKey:](v5->_createdInstallProgresses, "removeObjectForKey:", v11);
          _LSProgressLog();
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v11;
            _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Clearing progress for key %@ from cache",  buf,  0xCu);
          }
        }
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5
{
  return -[LSApplicationWorkspace _LSPrivateRebuildApplicationDatabasesForSystemApps:internal:user:uid:]( self,  "_LSPrivateRebuildApplicationDatabasesForSystemApps:internal:user:uid:",  a3,  a4,  a5,  0LL);
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 uid:(unsigned int *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  _LSDefaultLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_DEFAULT, "Rebuilding LS database.", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v25 = buf;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v11 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v12 = +[_LSDServiceDomain defaultServiceDomain]();
  __int128 v13 = (void *)v12;
  if (a6)
  {
    if (*a6)
    {
      uint64_t v14 = -[_LSDServiceDomain initWithUID:](objc_alloc(&OBJC_CLASS____LSDServiceDomain), *a6);
    }

    else
    {
      uint64_t v14 = +[_LSDServiceDomain systemSessionDomain]();
    }

    __int128 v15 = (void *)v14;
  }

  else
  {
    __int128 v15 = (void *)v12;
  }

  __int128 v16 = (void *)objc_opt_class();
  _LSDServiceGetXPCConnection(v16, (uint64_t)v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_279];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  void v23[2] = __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_280;
  v23[3] = &unk_189D731C0;
  void v23[4] = buf;
  [v18 rebuildApplicationDatabasesForSystem:v9 internal:v8 user:v7 completionHandler:v23];

  objc_autoreleasePoolPop(v11);
  _LSDefaultLog();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v25[24]) {
      __int16 v20 = "SUCCESS";
    }
    else {
      __int16 v20 = "FAILED";
    }
    *(_DWORD *)uint64_t v28 = 136315138;
    id v29 = v20;
    _os_log_impl(&dword_183E58000, v19, OS_LOG_TYPE_DEFAULT, "%s Finished rebuilding LS database.", v28, 0xCu);
  }

  uint8_t v21 = v25[24];
  _Block_object_dispose(buf, 8);
  return v21;
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  _LSDefaultLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1();
  }
}

uint64_t __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_280( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (void)rebuildDatabaseContentForFrameworkAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v13[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v13[1] = (void (*)(void, void))3221225472LL;
  v13[2] = (void (*)(void, void))__84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke;
  v13[3] = (void (*)(void, void))&unk_189D73298;
  id v7 = v5;
  id v14 = v7;
  id v8 = a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v13);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472LL;
  v11[2] = __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2;
  v11[3] = &unk_189D73298;
  id v12 = v7;
  id v10 = v7;
  [v9 refreshContentInFrameworkAtURL:v8 reply:v11];
}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3
{
  id v3 = a3;
  v6[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v6[1] = (void (*)(void, void))3221225472LL;
  v6[2] = (void (*)(void, void))__71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke;
  v6[3] = (void (*)(void, void))&unk_189D73298;
  id v7 = v3;
  id v4 = v3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v6);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 updateRestrictionKnowledgeWithCompletionHandler:v4];
}

uint64_t __71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_LSPrivateUpdateAppRemovalRestrictions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager cleanRemovedSystemApplicationsList]((uint64_t)v2);
}

- (void)_LSPrivateSetRemovedSystemAppIdentifiers:(id)a3
{
  id v3 = a3;
  +[LSApplicationRestrictionsManager sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager setRemovedSystemApplicationIdentifiers:](v4, v3);
}

- (id)_LSPrivateRemovedSystemAppIdentifiers
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager removedSystemApplicationIdentifiers](v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_LSPrivateDatabaseNeedsRebuild
{
  unsigned int v2 = _LSGetStatus();
  if ((v2 & 0x200) != 0)
  {
    _LSDefaultLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "Incomplete database seed detected, _LSPrivateDatabaseNeedsRebuild = YES",  v6,  2u);
    }
  }

  return (v2 >> 9) & 1;
}

- (void)_LSPrivateNoteMigratorRunning
{
  unsigned int v2 = (void *)objc_opt_class();
  +[_LSDServiceDomain defaultServiceDomain]();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v2, (uint64_t)v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_283];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 noteMigratorRunningWithReply:&__block_literal_global_285];
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSDefaultLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1();
  }
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_284(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    _LSDefaultLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_284_cold_1();
    }
  }
}

- (void)_LSFailedToOpenURL:(id)a3 withBundle:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  _LSDefaultLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v13 = v5;
    __int16 v14 = 2113;
    id v15 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_INFO,  "_LSFailedToOpenURL:%{private}@ withBundle:%{private}@",  buf,  0x16u);
  }

  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke;
  v10[3] = &unk_189D73330;
  id v11 = v6;
  id v9 = v6;
  [v8 failedToOpenApplication:v9 withURL:v5 completionHandler:v10];
}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  _LSDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138477827;
      uint64_t v10 = v8;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_INFO,  "Finished presenting restoration prompt for %{private}@.",  (uint8_t *)&v9,  0xCu);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1();
  }
}

- (void)_LSClearSchemaCaches
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v2 = 0LL;
    if (!_LSContextInit(&v2))
    {
      _LSSchemaClearAllCaches((uint64_t)v2 + 16);
      _LSContextDestroy(&v2);
    }
  }

- (void)sendExtensionNotificationsForSystemModeChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  _LSExtensionsLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_INFO,  "Begin updating extensions for mode change %@ -> %@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_opt_new();
  int v9 = (void *)objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  uint64_t v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  _OWORD v15[2] = __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke;
  v15[3] = &unk_189D736F0;
  id v16 = v6;
  id v17 = v8;
  id v18 = v5;
  id v19 = v9;
  id v11 = v9;
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  -[LSDBExecutionContext syncRead:](v10, v15);
}

void __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke( uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  +[LSExtensionPointRecord enumerator](&OBJC_CLASS___LSExtensionPointRecord, "enumerator");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v46 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v6 SDKDictionary];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = objc_opt_class();
        [v7 objectForKey:@"LSExtensionRestrictedSystemModes" ofClass:v8 valuesOfClass:objc_opt_class()];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v3 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v3);
  }

  uint64_t v10 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v10 minusSet:*(void *)(a1 + 56)];
  id v11 = (void *)[*(id *)(a1 + 56) mutableCopy];
  [v11 minusSet:*(void *)(a1 + 40)];
  id v12 = (void *)objc_opt_new();
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0LL; j != v15; ++j)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:options:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "enumeratorWithExtensionPointRecord:options:",  *(void *)(*((void *)&v41 + 1) + 8 * j),  0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 allObjects];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 addObjectsFromArray:v19];
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }

    while (v15);
  }

  id obja = v13;

  __int16 v20 = (void *)objc_opt_new();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t k = 0LL; k != v23; ++k)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:options:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "enumeratorWithExtensionPointRecord:options:",  *(void *)(*((void *)&v37 + 1) + 8 * k),  0LL);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 allObjects];
        char v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 addObjectsFromArray:v27];
      }

      uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }

    while (v23);
  }

  if ([v12 count])
  {
    _LSExtensionsLog();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl( &dword_183E58000,  v28,  OS_LOG_TYPE_DEFAULT,  "Sending system mode unrestricted app extension installedNotifications for %@",  buf,  0xCu);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v12];
  }

  if ([v20 count])
  {
    _LSExtensionsLog();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_impl( &dword_183E58000,  v30,  OS_LOG_TYPE_DEFAULT,  "Sending system mode restricted app extension uninstalledNotifications for %@",  buf,  0xCu);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v20];
  }

  _LSExtensionsLog();
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = *(void **)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v50 = v33;
    __int16 v51 = 2112;
    uint64_t v52 = v34;
    _os_log_impl( &dword_183E58000,  v32,  OS_LOG_TYPE_INFO,  "Done updating extensions for mode change %@ -> %@",  buf,  0x16u);
  }
}

- (void)sendExtensionNotificationsForExtensionBundleIdentifier:(id)a3 changingRestrictionStateTo:(BOOL)a4
{
  id v5 = a3;
  _LSServer_DatabaseExecutionContext();
  id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke;
  v8[3] = &unk_189D73718;
  id v9 = v5;
  BOOL v10 = a4;
  id v7 = v5;
  -[LSDBExecutionContext syncRead:](v6, v8);
}

void __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke( uint64_t a1)
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0LL;
  uint64_t v4 = -[LSApplicationExtensionRecord initWithBundleIdentifier:error:](v2, "initWithBundleIdentifier:error:", v3, &v13);
  id v5 = v13;
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40)) {
      id v6 = @"com.apple.LaunchServices.pluginsunregistered";
    }
    else {
      id v6 = @"com.apple.LaunchServices.pluginsregistered";
    }
    id v7 = v6;
    _LSInstallLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17[0] = v4;
      _os_log_impl(&dword_183E58000, v8, OS_LOG_TYPE_DEFAULT, "Sending %@ for %@", buf, 0x16u);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    [MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 detachAndSendNotification:v7 forApplicationExtensionRecords:v10];
  }

  else
  {
    _LSInstallLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(os_log_s **)(a1 + 32);
      int v12 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 1024;
      LODWORD(v17[0]) = v12;
      WORD2(v17[0]) = 2112;
      *(void *)((char *)v17 + 6) = v5;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "no record for %@, could not change restriction state to %d: %@",  buf,  0x1Cu);
    }
  }
}

- (void)sendApplicationStateChangedNotificationsFor:(id)a3 stateProvider:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke;
    v26[3] = &unk_189D72C88;
    id v12 = v7;
    id v27 = v12;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v26);

    _LSServer_DatabaseExecutionContext();
    id v13 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472LL;
    id v22[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2;
    v22[3] = &unk_189D72EE8;
    id v23 = v12;
    id v24 = v8;
    id v25 = v9;
    -[LSDBExecutionContext syncRead:](v13, v22);
  }

  else
  {
    _LSDefaultLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:].cold.1( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v1);
        }
        _LSServer_UpdateDatabaseWithInfo(*(void **)(*((void *)&v9 + 1) + 8 * v8++), 0LL, 0LL, 0LL, 1LL, v3, v4, v5);
      }

      while (v6 != v8);
      uint64_t v6 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  _LSArmSaveTimer(1);
}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v84 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithCapacity:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithCapacity:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v5 = *(id *)(v1 + 32);
  uint64_t v58 = [v5 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v71;
    uint64_t v54 = v1;
    v55 = v2;
    uint64_t v52 = v4;
    v53 = v3;
    id v56 = v5;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v71 != v57) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(__CFString **)(*((void *)&v70 + 1) + 8 * v6);
        uint64_t v8 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
        id v69 = 0LL;
        __int128 v9 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v8,  "initWithBundleIdentifier:allowPlaceholder:error:",  v7,  1LL,  &v69);
        id v10 = v69;
        __int128 v11 = v10;
        if (v9)
        {
          id v60 = v10;
          uint64_t v61 = v6;
          v59 = -[LSApplicationRecord applicationState](v9, "applicationState");
          uint64_t v12 = [v59 isRestrictedWithStateProvider:*(void *)(v1 + 40)];
          v62 = v9;
          uint64_t v13 = MEMORY[0x189604A80];
          v76[0] = MEMORY[0x189604A80];
          v75[0] = @"isRemoved";
          v75[1] = @"isRestricted";
          [MEMORY[0x189607968] numberWithUnsignedChar:v12];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          v75[2] = @"isBlocked";
          v76[1] = v14;
          v76[2] = v13;
          [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:3];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 setObject:v15 forKey:v7];

          __int128 v9 = v62;
          v63 = -[LSApplicationRecord applicationExtensionRecords](v62, "applicationExtensionRecords");
          if ([v63 count])
          {
            if (_LSIsNewsBundleIdentifier(v7))
            {
              __int128 v67 = 0u;
              __int128 v68 = 0u;
              __int128 v65 = 0u;
              __int128 v66 = 0u;
              id v16 = v63;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v74 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v66;
                uint64_t v20 = @" not";
                if ((_DWORD)v12) {
                  uint64_t v20 = &stru_189D7B4C8;
                }
                v64 = (const char *)v20;
                if ((_DWORD)v12) {
                  uint64_t v21 = v3;
                }
                else {
                  uint64_t v21 = v4;
                }
                do
                {
                  for (uint64_t i = 0LL; i != v18; ++i)
                  {
                    if (*(void *)v66 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    id v23 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                    [v23 effectiveBundleIdentifier];
                    id v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!_LSIsNewsWidgetBundleIdentifier(v24)) {
                      goto LABEL_24;
                    }
                    +[LSApplicationRestrictionsManager sharedInstance]();
                    id v25 = (void *)objc_claimAutoreleasedReturnValue();
                    int v26 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((BOOL)v25, v24);

                    _LSInstallLog();
                    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v28 = @" not";
                      if (v26) {
                        uint64_t v28 = &stru_189D7B4C8;
                      }
                      v78 = v64;
                      __int16 v79 = 2112;
                      v80 = v28;
                      _os_log_impl( &dword_183E58000,  v27,  OS_LOG_TYPE_DEFAULT,  "Note: News is%@ restricted, news widget is%@ restricted",  buf,  0x16u);
                    }

                    if ((_DWORD)v12 == v26) {
LABEL_24:
                    }
                      [v21 addObject:v23];
                  }

                  uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v74 count:16];
                }

                while (v18);
                uint64_t v1 = v54;
                uint64_t v2 = v55;
                uint64_t v4 = v52;
                uint64_t v3 = v53;
                id v5 = v56;
                __int128 v9 = v62;
              }

              else
              {
                id v5 = v56;
              }
            }

            else
            {
              [v63 allObjects];
              id v16 = (id)objc_claimAutoreleasedReturnValue();
              if ((_DWORD)v12) {
                uint64_t v31 = v3;
              }
              else {
                uint64_t v31 = v4;
              }
              [v31 addObjectsFromArray:v16];
            }
          }

          __int128 v11 = v60;
          uint64_t v6 = v61;
          uint64_t v30 = (os_log_s *)v59;
        }

        else
        {
          _LSInstallLog();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v78 = "-[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:]_block_invoke_2";
            __int16 v79 = 2112;
            v80 = v7;
            __int16 v81 = 2112;
            v82 = v11;
            uint64_t v30 = v29;
            _os_log_error_impl( &dword_183E58000,  v29,  OS_LOG_TYPE_ERROR,  "%s: could not initialize record for bundleID %@: %@",  buf,  0x20u);
          }

          else
          {
            uint64_t v30 = v29;
          }
        }

        ++v6;
      }

      while (v6 != v58);
      uint64_t v32 = [v5 countByEnumeratingWithState:&v70 objects:v83 count:16];
      uint64_t v58 = v32;
    }

    while (v32);
  }

  _LSLogStepAsync( 7LL,  1LL,  0LL,  @"Sending appStateChangedNotification with payload %@",  v33,  v34,  v35,  v36,  (uint64_t)v2);
  _LSInstallLog();
  __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = (const char *)v2;
    _os_log_impl(&dword_183E58000, v37, OS_LOG_TYPE_DEFAULT, "Sending appStateChangedNotification for %@", buf, 0xCu);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions( DistributedCenter,  @"com.apple.LaunchServices.applicationStateChanged",  0LL,  (CFDictionaryRef)v2,  3uLL);
  if ([v4 count])
  {
    _LSLogStepAsync(7LL, 1LL, 0LL, @"Sending installedNotifications for %@", v39, v40, v41, v42, (uint64_t)v4);
    _LSInstallLog();
    __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v4;
      _os_log_impl(&dword_183E58000, v43, OS_LOG_TYPE_DEFAULT, "Sending installedNotifications for %@", buf, 0xCu);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v4];
  }

  if ([v3 count])
  {
    _LSLogStepAsync(7LL, 1LL, 0LL, @"Sending uninstalledNotifications for %@", v45, v46, v47, v48, (uint64_t)v3);
    _LSInstallLog();
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v3;
      _os_log_impl(&dword_183E58000, v49, OS_LOG_TYPE_DEFAULT, "Sending uninstalledNotifications for %@", buf, 0xCu);
    }
    v50 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    [v50 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v3];
  }

  uint64_t v51 = *(void *)(v1 + 48);
  if (v51) {
    (*(void (**)(void))(v51 + 16))();
  }
}

- (id)scanForApplicationStateChangesFromRank:(id)a3 toRank:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FE0] setWithCapacity:0];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    __int128 v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke;
    v11[3] = &unk_189D736F0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v14 = v8;
    -[LSDBExecutionContext syncRead:](v9, v11);
  }

  return v8;
}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2;
  v3[3] = &unk_189D73740;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateApplicationsOfType:0 block:v3];
}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2( uint64_t a1,  void *a2)
{
  id v7 = a2;
  [v7 ratingRank];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 intValue];

  LODWORD(v3) = v4 <= (int)[*(id *)(a1 + 32) intValue];
  if (((v3 ^ (v4 > (int)[*(id *)(a1 + 40) intValue])) & 1) == 0)
  {
    id v5 = *(void **)(a1 + 48);
    [v7 bundleIdentifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addObject:v6];
  }
}

- (id)scanForApplicationStateChangesWithAllowlist:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189603FE0] setWithCapacity:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke;
    v8[3] = &unk_189D73790;
    void v8[4] = self;
    id v9 = v4;
    id v10 = v5;
    -[LSDBExecutionContext syncRead:](v6, v8);
  }

  return v5;
}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2;
  v3[3] = &unk_189D73768;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateBundlesOfType:0 block:v3];
}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2( uint64_t a1,  void *a2)
{
  id v6 = a2;
  [v6 bundleIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [v6 appState];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 isAlwaysAvailable];

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (id)scanForForDeletableSystemApps
{
  uint64_t v3 = (void *)objc_opt_new();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke;
    v6[3] = &unk_189D737E0;
    void v6[4] = self;
    id v7 = v3;
    -[LSDBExecutionContext syncRead:](v4, v6);
  }

  return v3;
}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2;
  v2[3] = &unk_189D737B8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateApplicationsOfType:1 block:v2];
}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isDeletableIgnoringRestrictions])
  {
    id v3 = *(void **)(a1 + 32);
    [v5 bundleIdentifier];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }
}

- (BOOL)forceDatabaseSaveForTestingWithError:(id *)a3
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v10[1] = (void (*)(void, void))3221225472LL;
  v10[2] = (void (*)(void, void))__63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke;
  v10[3] = (void (*)(void, void))&unk_189D731E8;
  void v10[4] = (void (*)(void, void))&v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2;
  v9[3] = &unk_189D734E8;
  void v9[4] = &v11;
  v9[5] = &v17;
  [v5 forceSaveForTestingWithCompletion:v9];
  _LSContextInvalidate();
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = (id) v12[5];
    int v6 = *((unsigned __int8 *)v18 + 24);
  }

  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2( uint64_t a1,  void *a2)
{
  id v4 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4 == 0LL;
}

- (void)ls_testWithCleanDatabaseWithError:(id *)a3
{
  if (![(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -5500LL,  (uint64_t)"-[LSApplicationWorkspace ls_testWithCleanDatabaseWithError:]",  4228LL,  0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    CFTypeRef v6 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  id v8 = 0LL;
  id v4 = _LSDatabaseCreateCleanForTesting(&v8);
  id v5 = v8;
  if (v4)
  {
    _LSSetLocalDatabase(v4);
    CFTypeRef v6 = CFAutorelease(v4);
  }

  else
  {
    CFTypeRef v6 = 0LL;
  }

  if (a3)
  {
LABEL_8:
    if (!v6) {
      *a3 = v5;
    }
  }

- (BOOL)ls_injectUTTypeWithDeclaration:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (![(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    uint64_t v13 = 0LL;
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  if (v7 && v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"UTTypeDescription"];
    id v10 = (void *)v9;
    if (v9)
    {
      uint64_t v21 = v9;
      uint64_t v22 = v9;
      char v20 = @"LSDefaultLocalizedValue";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = 0LL;
    }

    int v16 = _UTTypeAddWithDeclarationDictionary();
    BOOL v14 = v16 == 0;
    if (v16)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v16,  (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]",  4256LL,  0LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = (void *)*MEMORY[0x189607670];
    uint64_t v18 = *MEMORY[0x189607490];
    uint64_t v19 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( v15,  -50LL,  (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]",  4260LL,  v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = 0;
  }

  if (a5)
  {
LABEL_15:
    if (!v14) {
      *a5 = v13;
    }
  }

- (void)ls_resetTestingDatabase
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    uint64_t v2 = 0LL;
    if (!_LSContextInit(&v2))
    {
      _LSContextUpdate(&v2, 1, 0LL);
      _LSContextDestroy(&v2);
    }
  }

- (BOOL)mayProcessWithAuditTokenMapDatabase:(id *)a3
{
  return _LSAuditTokenMayMapDatabase((uint64_t)a3) != 0;
}

- (NSMutableDictionary)createdInstallProgresses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (LSInstallProgressList)observedInstallProgresses
{
  return (LSInstallProgressList *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 withFilter:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  _OWORD v14[2] = __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke;
  v14[3] = &unk_189D73808;
  id v15 = v10;
  id v11 = v10;
  -[LSApplicationWorkspace pluginsWithIdentifiers:protocols:version:applyFilter:]( self,  "pluginsWithIdentifiers:protocols:version:applyFilter:",  a3,  a4,  a5,  v14);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5
{
  return -[LSApplicationWorkspace pluginsWithIdentifiers:protocols:version:applyFilter:]( self,  "pluginsWithIdentifiers:protocols:version:applyFilter:",  a3,  a4,  a5,  &__block_literal_global_513);
}

uint64_t __90__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version___block_invoke()
{
  return 1LL;
}

- (void)enumerateBundlesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke;
    v8[3] = &unk_189D73870;
    id v9 = v6;
    -[LSApplicationWorkspace enumerateBundlesOfType:legacySPI:block:]( self,  "enumerateBundlesOfType:legacySPI:block:",  a3,  1LL,  v8);
  }
}

uint64_t __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)applicationsOfType:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke;
  v8[3] = &unk_189D737B8;
  id v6 = v5;
  id v9 = v6;
  -[LSApplicationWorkspace enumerateApplicationsOfType:legacySPI:block:]( self,  "enumerateApplicationsOfType:legacySPI:block:",  a3,  1LL,  v8);

  return v6;
}

uint64_t __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)legacyApplicationProxiesListWithType:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke;
  v8[3] = &unk_189D737B8;
  id v6 = v5;
  id v9 = v6;
  -[LSApplicationWorkspace enumerateBundlesOfType:legacySPI:block:]( self,  "enumerateBundlesOfType:legacySPI:block:",  a3,  1LL,  v8);

  return v6;
}

uint64_t __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allInstalledApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:]( self,  "legacyApplicationProxiesListWithType:",  1LL);
}

- (id)placeholderApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:]( self,  "legacyApplicationProxiesListWithType:",  3LL);
}

- (id)unrestrictedApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:]( self,  "legacyApplicationProxiesListWithType:",  4LL);
}

- (id)allApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:]( self,  "legacyApplicationProxiesListWithType:",  0LL);
}

- (id)applicationsAvailableForOpeningDocument:(id)a3
{
  return (id)[a3 applicationsAvailableForOpeningWithStyle:0 limit:-1 XPCConnection:0 error:0];
}

+ (id)_defaultAppQueue
{
  if (_defaultAppQueue_once != -1) {
    dispatch_once(&_defaultAppQueue_once, &__block_literal_global_526);
  }
  return (id)_defaultAppQueue_result;
}

void __55__LSApplicationWorkspace_DefaultApps___defaultAppQueue__block_invoke()
{
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS default app setter queue", v2);
  uint64_t v1 = (void *)_defaultAppQueue_result;
  _defaultAppQueue_uint64_t result = (uint64_t)v0;
}

- (void)setDefaultURLHandlerForScheme:(id)a3 to:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = (void *)*MEMORY[0x189607670];
    id v7 = a5;
    _LSMakeNSErrorImpl( v6,  -4LL,  (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultURLHandlerForScheme:to:completion:]",  4427LL,  0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a5 + 2))(v7, 0LL, v8);
  }

- (void)setDefaultWebBrowserToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = (void *)*MEMORY[0x189607670];
    id v6 = a4;
    _LSMakeNSErrorImpl( v5,  -4LL,  (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultWebBrowserToApplicationRecord:completionHandler:]",  4460LL,  0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
  }

- (void)setDefaultMailClientToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = (void *)*MEMORY[0x189607670];
    id v6 = a4;
    _LSMakeNSErrorImpl( v5,  -4LL,  (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultMailClientToApplicationRecord:completionHandler:]",  4489LL,  0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
  }

- (void)relaxApplicationTypeRequirements:(BOOL)a3 forApplicationRecord:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    id v6 = (void *)*MEMORY[0x189607670];
    id v7 = a5;
    _LSMakeNSErrorImpl( v6,  -4LL,  (uint64_t)"-[LSApplicationWorkspace(DefaultApps) relaxApplicationTypeRequirements:forApplicationRecord:completionHandler:]",  4514LL,  0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))a5 + 2))(v7, 0LL, v8);
  }

- (void)removeAllDefaultApplicationPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = &__block_literal_global_528;
  }
  id v5 = v3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeAllHandlersWithCompletionHandler:v5];
}

- (id)applicationsAvailableForOpeningURL:(id)a3
{
  return -[LSApplicationWorkspace applicationsAvailableForOpeningURL:legacySPI:]( self,  "applicationsAvailableForOpeningURL:legacySPI:",  a3,  0LL);
}

- (id)applicationsAvailableForOpeningURL:(id)a3 legacySPI:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x186E2A59C]();
  if (v5 && ([v5 isFileURL] & 1) == 0)
  {
    +[_LSCanOpenURLManager queryForApplicationsAvailableForOpeningURL:]( &OBJC_CLASS____LSCanOpenURLManager,  "queryForApplicationsAvailableForOpeningURL:",  v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v8)
    {
      id v27 = v6;
      [v8 setLegacy:v4];
      +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v26 = v9;
      [MEMORY[0x189604010] setWithObject:v9];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 resolveQueries:v11 error:0];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 allValues];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 firstObject];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14) {
        id v15 = v14;
      }
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      id v7 = v14;
      uint64_t v16 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v7);
            }
            char v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            _LSDefaultLog();
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              [v20 bundleIdentifier];
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 scheme];
              id v23 = v5;
              id v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              uint64_t v33 = v22;
              __int16 v34 = 2113;
              uint64_t v35 = v24;
              _os_log_impl( &dword_183E58000,  v21,  OS_LOG_TYPE_DEFAULT,  "Found application: %{private}@ to handle url scheme: %{private}@",  buf,  0x16u);

              id v5 = v23;
            }
          }

          uint64_t v17 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }

        while (v17);
      }

      id v9 = v26;
      id v6 = v27;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  objc_autoreleasePoolPop(v6);

  return v7;
}

- (BOOL)isApplicationAvailableToOpenURL:(id)a3 error:(id *)a4
{
  return -[LSApplicationWorkspace isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:]( self,  "isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:",  a3,  1LL,  a4);
}

- (BOOL)isApplicationAvailableToOpenURLCommon:(id)a3 includePrivateURLSchemes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v32[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0LL;
  [v7 scheme];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      +[_LSCanOpenURLManager sharedManager](&OBJC_CLASS____LSCanOpenURLManager, "sharedManager");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = (id *)(v22 + 5);
      id obj = (id)v22[5];
      char v11 = [v9 canOpenURL:v7 publicSchemes:1 privateSchemes:v6 XPCConnection:0 error:&obj];
      objc_storeStrong(v10, obj);
      *((_BYTE *)v28 + 24) = v11;
    }

    else
    {
      uint64_t v14 = MEMORY[0x1895F87A8];
      v19[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
      v19[1] = (void (*)(void, void))3221225472LL;
      v19[2] = (void (*)(void, void))__107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke;
      v19[3] = (void (*)(void, void))&unk_189D731E8;
      v19[4] = (void (*)(void, void))&v21;
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v19);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      v18[1] = 3221225472LL;
      void v18[2] = __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2;
      v18[3] = &unk_189D73210;
      v18[4] = &v27;
      v18[5] = &v21;
      [v9 canOpenURL:v7 publicSchemes:1 privateSchemes:v6 completionHandler:v18];
    }
  }

  else
  {
    uint64_t v31 = *MEMORY[0x1896075E0];
    v32[0] = @"Invalid input URL";
    [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  -105LL,  (uint64_t)"-[LSApplicationWorkspace(URLQueries) isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:]",  4862LL,  v9);
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;
  }

  int v15 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v15 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke( uint64_t a1,  void *a2)
{
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2( uint64_t a1,  char a2,  id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (id)applicationForOpeningResource:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  if (a3)
  {
    BOOL v4 = (objc_class *)MEMORY[0x189604030];
    id v5 = a3;
    id v6 = objc_alloc(v4);
    [NSString stringWithFormat:@"%@://", v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = (void *)[v6 initWithString:v7];
    if ([v8 isFileURL])
    {
      id v9 = 0LL;
    }

    else
    {
      -[LSApplicationWorkspace applicationsAvailableForOpeningURL:legacySPI:]( self,  "applicationsAvailableForOpeningURL:legacySPI:",  v8,  1LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)publicURLSchemes
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[LSApplicationWorkspace(DeprecatedURLQueries) publicURLSchemes].cold.1((uint64_t)a2, v3);
  }

  return (id)MEMORY[0x189604A58];
}

- (id)privateURLSchemes
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[LSApplicationWorkspace(DeprecatedURLQueries) publicURLSchemes].cold.1((uint64_t)a2, v3);
  }

  return (id)MEMORY[0x189604A58];
}

- (id)URLOverrideForURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)URLOverrideForNewsURL:(id)a3
{
  return a3;
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1()
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Failed to open URL synchronously: %{private}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_222_cold_1()
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Failed to open URL asynchronously %{private}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_223_cold_1()
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_183E58000, v1, v2, "Failed to open URL %{private}@: %{public}@", (void)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)installApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)installContainerizedApplicationArtifactAtURL:(uint64_t)a3 withOptions:(uint64_t)a4 returningRecordPromise:(uint64_t)a5 error:(uint64_t)a6 progressBlock:(uint64_t)a7 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)uninstallContainerizedApplicationWithIdentifier:(uint64_t)a3 options:(uint64_t)a4 error:(uint64_t)a5 progressBlock:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)downgradeApplicationToPlaceholder:withOptions:error:.cold.1()
{
}

- (void)uninstallApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)registerApplicationDictionary:withObserverNotification:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_23_0();
  int v3 = 0;
  OUTLINED_FUNCTION_16_0( &dword_183E58000,  v0,  v1,  "Failed to create application proxy for %@, regustration result was %d",  v2);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterApplicationsAtMountPoint:(void *)a1 operationUUID:(uint64_t)a2 saveObserver:(uint64_t)a3 requestContext:(os_log_s *)a4 .cold.1( void *a1,  uint64_t a2,  uint64_t a3,  os_log_s *a4)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40LL);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  a4,  a3,  "Unable to unregister applications at mount point: %@: %@",  (uint8_t *)a3);
}

- (void)unregisterApplication:.cold.1()
{
}

- (void)updateSINFWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.1()
{
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.2()
{
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.3()
{
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplicationAtURL:(uint64_t)a4 error:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:.cold.1()
{
  OUTLINED_FUNCTION_3( &dword_183E58000,  v0,  v1,  "MobileInstallatinUpdatePlaceholderMetadata returned error %@, not updating LaunchServices database",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterPlugin:.cold.1()
{
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1()
{
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_260_cold_1()
{
  OUTLINED_FUNCTION_0_0( &dword_183E58000,  v0,  v1,  "advertising identifier returned from service was nil!",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1()
{
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_263_cold_1()
{
  OUTLINED_FUNCTION_0_0( &dword_183E58000,  v0,  v1,  "vendor identifier returned from service was nil!",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1()
{
  LODWORD(v3) = 138740227;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "could not retrieve device identifier for advertising while checking url: %{sensitive}@ %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)deviceIdentifierForVendorSeedData
{
}

- (void)installProgressForBundleID:(void *)a1 makeSynchronous:(os_log_s *)a2 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 _LSDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "Returning progress %@", v4, 0xCu);

  OUTLINED_FUNCTION_16();
}

- (void)installProgressForBundleID:makeSynchronous:.cold.2()
{
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1()
{
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2()
{
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Failed to create install progress for application %@: %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)installPhaseFinishedForProgress:.cold.1()
{
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1()
{
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1()
{
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_284_cold_1()
{
  OUTLINED_FUNCTION_3( &dword_183E58000,  v0,  v1,  "could not note migrator running in lsd: note returned %@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1()
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "*** ERROR *** Presenting restoration prompt for %{private}@: %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)sendApplicationStateChangedNotificationsFor:(uint64_t)a3 stateProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end