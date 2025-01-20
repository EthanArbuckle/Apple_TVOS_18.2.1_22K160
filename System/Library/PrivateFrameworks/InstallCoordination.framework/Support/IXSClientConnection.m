@interface IXSClientConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)clientProcessExists;
- (BOOL)fakeClientProcessDeath;
- (BOOL)interestedInCoordinatorUUID:(id)a3;
- (BOOL)interestedInPromiseUUID:(id)a3;
- (BOOL)invalidated;
- (IXSClientConnection)initWithConnection:(id)a3;
- (NSCountedSet)interestedCoordinatorUUIDs;
- (NSCountedSet)interestedPromiseUUIDs;
- (NSString)clientName;
- (NSString)description;
- (NSUUID)connectionUUID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3;
- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3;
- (void)_client_coordinatorShouldPauseWithUUID:(id)a3;
- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3;
- (void)_client_coordinatorShouldResumeWithUUID:(id)a3;
- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3;
- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_fetchDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchIXSCoordinatedAppInstallForUUID:(id)a3 method:(const char *)a4 andRunWithCoordinator:(id)a5 error:(id)a6;
- (void)_fetchOwnedDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPlaceholderForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedOutOfBandStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedTransferToPathForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 appAssetPromiseHasBegunFulfillment:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 convertToGloballyScopedWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 conveyPriorityReplacingExisting:(BOOL)a4 withCompletion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 fireObserversWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromiseDRI:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinationState:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinatorScopeWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getDeviceSecurityPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getErrorInfo:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getEssentialAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getHasDeviceSecurityPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInitialODRAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInstallOptions:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsComplete:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsPausedWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getNeedsPostProcessing:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderDispositionWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPostProcessingShouldBegin:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPreparationPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getProgressHintWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataRestoreShouldBegin:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasAppAssetPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasEssentialAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInitialODRAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInstallOptions:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasPlaceholderPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasUserDataPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 importanceWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 prioritizeWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 removabilityWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseDRI:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setDeviceSecurityPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setEssentialAssetPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setImportance:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInitialODRAssetPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInstallOptionsPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setIsPaused:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setNeedsPostProcessing:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderDisposition:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPreparationPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setProgressHint:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setRemovability:(unint64_t)a4 byClient:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setUserDataPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSDataPromise:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSDataPromise:(id)a3 getErrorInfo:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 getIsComplete:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 getPercentComplete:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 preflightWithCompletion:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 resetWithCompletion:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 setIsComplete:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSDataPromise:(id)a3 setPercentComplete:(double)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 getStagedPath:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 getTargetLastPathComponent:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 setStagedPath:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 setTargetLastPathComponent:(id)a4 withCompletion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 getAppExtensionPlaceholderPromises:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getAttributesWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getEntitlementsPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getIconPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getIconResourcesPromiseAndInfoPlistContentPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getInfoPlistLoctablePromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getLaunchProhibitedWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getLocalizationDictionary:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getMetadataWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getSinfDataWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasAppExtensionPlaceholderPromises:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasEntitlementsPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasIconPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasIconResourcesPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasInfoPlistLoctablePromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 setAppExtensionPlaceholderPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setAttributes:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setConfigurationCompleteWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 setEntitlementsPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setIconPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setIconResourcesPromiseUUID:(id)a4 withInfoPlistIconContentPromiseUUID:(id)a5 completion:(id)a6;
- (void)_remote_IXSPlaceholder:(id)a3 setInfoPlistLoctablePromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setLaunchProhibited:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setLocalizationPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setMetadataPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setSinfPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPromisedOutOfBandStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4;
- (void)_remote_IXSPromisedStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setShouldCopy:(BOOL)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTransferPath:(id)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTryDeltaCopy:(BOOL)a4;
- (void)_remote_addBundleIDs:(id)a3 toMappingsForPersona:(id)a4 completion:(id)a5;
- (void)_remote_addObserversForCoordinatorsWithUUIDs:(id)a3 fireObserverMethods:(BOOL)a4;
- (void)_remote_addObserversForDataPromisesWithUUIDs:(id)a3;
- (void)_remote_associateMultiPersonaAppsWithBundleIDs:(id)a3 withPersona:(id)a4 completion:(id)a5;
- (void)_remote_cancelCoordinatorForAppWithIdentity:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_cancelCoordinatorsForAppsWithIdentities:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_checkIfDataPromiseExistsForUUID:(id)a3 completion:(id)a4;
- (void)_remote_createAppInstallCoordinatorWithSeed:(id)a3 createIfNotExisting:(BOOL)a4 requireMatchingIntent:(BOOL)a5 scopeRequirement:(unsigned __int8)a6 completion:(id)a7;
- (void)_remote_createAppReferenceDataPromiseWithSeed:(id)a3 ifMatchingPredicate:(id)a4 completion:(id)a5;
- (void)_remote_createInMemoryDataPromiseWithSeed:(id)a3 data:(id)a4 completion:(id)a5;
- (void)_remote_createInMemoryDictionaryPromiseWithSeed:(id)a3 dictionary:(id)a4 completion:(id)a5;
- (void)_remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createOutOfBandTransferPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createPlaceholderDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createTransferToPathDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_displayUserPresentableErrorForApp:(id)a3 code:(int64_t)a4;
- (void)_remote_displayUserPresentableErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4;
- (void)_remote_displayUserPresentableErrorForApps:(id)a3 code:(int64_t)a4;
- (void)_remote_fakeClientDeathWithCompletion:(id)a3;
- (void)_remote_fetchRegisteredDataPromiseInfoForCreator:(unint64_t)a3 completion:(id)a4;
- (void)_remote_fetchSeedsForCoordinatorsWithIntent:(unint64_t)a3 completion:(id)a4;
- (void)_remote_killDaemonForTestingWithCompletion:(id)a3;
- (void)_remote_pingDaemonWithCompletion:(id)a3;
- (void)_remote_postNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)_remote_prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:(unint64_t)a3 completion:(id)a4;
- (void)_remote_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)_remote_registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_registerObserverMachServiceName:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)_remote_registerTransientObserver:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)_remote_removabilityDataWithCompletion:(id)a3;
- (void)_remote_removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5;
- (void)_remote_removabilityForAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_removeBundleIDs:(id)a3 fromMappingsForPersona:(id)a4 completion:(id)a5;
- (void)_remote_removeObserverForCoordinatorWithUUID:(id)a3;
- (void)_remote_removeObserverForDataPromiseWithUUID:(id)a3;
- (void)_remote_revertAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_setIsPaused:(BOOL)a3 forCoordinatorForAppWithIdentity:(id)a4 completion:(id)a5;
- (void)_remote_setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6;
- (void)_remote_setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5 completion:(id)a6;
- (void)_remote_setTestingEnabled:(BOOL)a3 completion:(id)a4;
- (void)_remote_uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_remote_updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 completion:(id)a5;
- (void)addInterestedCoordinatorUUID:(id)a3;
- (void)addInterestedCoordinatorUUIDs:(id)a3;
- (void)addInterestedPromiseUUID:(id)a3;
- (void)addInterestedPromiseUUIDs:(id)a3;
- (void)cancelOrphanedPromisesAndRemovePromiseReferences;
- (void)connectionInvalidated;
- (void)removeInterestedCoordinatorUUID:(id)a3;
- (void)removeInterestedCoordinatorUUIDs:(id)a3;
- (void)removeInterestedPromiseUUID:(id)a3;
- (void)removeInterestedPromiseUUIDs:(id)a3;
- (void)setFakeClientProcessDeath:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation IXSClientConnection

- (IXSClientConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IXSClientConnection;
  v5 = -[IXSClientConnection init](&v23, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.installcoordinationd.IXSClientConnection.internal", v7);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSCountedSet);
    interestedCoordinatorUUIDs = v5->_interestedCoordinatorUUIDs;
    v5->_interestedCoordinatorUUIDs = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSCountedSet);
    interestedPromiseUUIDs = v5->_interestedPromiseUUIDs;
    v5->_interestedPromiseUUIDs = v12;

    id v14 = sub_10000C330(v4);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v15;

    *(_WORD *)&v5->_invalidated = 0;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    connectionUUID = v5->_connectionUUID;
    v5->_connectionUUID = (NSUUID *)v17;

    -[IXSClientConnection setXpcConnection:](v5, "setXpcConnection:", v4);
    if (v4)
    {
      [v4 auditToken];
    }

    else
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
    }

    *(_OWORD *)v5->_clientAuditToken.val = v21;
    *(_OWORD *)&v5->_clientAuditToken.val[4] = v22;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance",  v21,  v22));
    [v19 registerClientConnection:v5];
  }

  return v5;
}

- (BOOL)clientProcessExists
{
  if (-[IXSClientConnection fakeClientProcessDeath](self, "fakeClientProcessDeath")) {
    return 0;
  }
  -[IXSClientConnection clientAuditToken](self, "clientAuditToken");
  return proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) > 0;
}

- (void)connectionInvalidated
{
  if (!-[IXSClientConnection invalidated](self, "invalidated"))
  {
    -[IXSClientConnection setInvalidated:](self, "setInvalidated:", 1LL);
    v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      dispatch_queue_t v8 = "-[IXSClientConnection connectionInvalidated]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Connection Invalidated",  (uint8_t *)&v7,  0x16u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
    [v5 unregisterClientConnection:self];

    dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v6 connectionInvalidated:self];

    -[IXSClientConnection cancelOrphanedPromisesAndRemovePromiseReferences]( self,  "cancelOrphanedPromisesAndRemovePromiseReferences");
  }

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection connectionUUID](self, "connectionUUID"));
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> client:%@ uuid:%@>",  v5,  self,  v6,  v7));

  return (NSString *)v8;
}

- (void)addInterestedCoordinatorUUIDs:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005CCE0;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)addInterestedCoordinatorUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005CE60;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)removeInterestedCoordinatorUUIDs:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005CFE0;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)removeInterestedCoordinatorUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  -[IXSClientConnection removeInterestedCoordinatorUUIDs:](self, "removeInterestedCoordinatorUUIDs:", v4);
}

- (BOOL)interestedInCoordinatorUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D504;
  block[3] = &unk_1000CCF40;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)cancelOrphanedPromisesAndRemovePromiseReferences
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
  id v6 = sub_10003556C( (uint64_t)"-[IXSClientConnection cancelOrphanedPromisesAndRemovePromiseReferences]",  255LL,  @"IXErrorDomain",  0x12uLL,  0LL,  0LL,  @"Promise was not attached to a coordinator and is no longer referenced by client %@",  v5,  (uint64_t)v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D660;
  block[3] = &unk_1000CCF90;
  block[4] = self;
  id v12 = v3;
  id v13 = v7;
  id v9 = v7;
  id v10 = v3;
  dispatch_sync(v8, block);
}

- (void)addInterestedPromiseUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D808;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)addInterestedPromiseUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D988;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)removeInterestedPromiseUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DB08;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)removeInterestedPromiseUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  -[IXSClientConnection removeInterestedPromiseUUIDs:](self, "removeInterestedPromiseUUIDs:", v4);
}

- (BOOL)interestedInPromiseUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DEA0;
  block[3] = &unk_1000CCF40;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_remote_createPlaceholderDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = objc_alloc(&OBJC_CLASS___IXSPlaceholder);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  id v40 = 0LL;
  id v10 = -[IXSPlaceholder initWithSeed:fromConnection:error:](v8, "initWithSeed:fromConnection:error:", v6, v9, &v40);
  id v11 = v40;

  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v12 registerPromise:v10];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v10, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v13);

    uint64_t v34 = 0LL;
    v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    v37 = sub_10005E1CC;
    v38 = sub_10005E1DC;
    id v39 = 0LL;
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    v31 = sub_10005E1CC;
    v32 = sub_10005E1DC;
    id v33 = 0LL;
    char v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005E1E4;
    block[3] = &unk_1000CD448;
    v25 = v10;
    v26 = &v28;
    v27 = &v34;
    dispatch_sync(v14, block);

    v7[2](v7, v35[5], v29[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }

  else
  {
    uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100082758(v6, (uint64_t)v11, v16);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleName]);
    v19 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createPlaceholderDataPromiseWithSeed:completion:]",  337LL,  @"IXErrorDomain",  2uLL,  v11,  0LL,  @"Failed to create placeholder data promise with name: %@ bundleName: %@ client: %@",  v20,  (uint64_t)v17);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

    v7[2](v7, 0LL, v22);
    id v11 = (id)v22;
  }
}

- (void)_remote_createTransferToPathDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v39 = 0LL;
  id v8 = -[IXSOwnedDataPromise initWithSeed:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedTransferToPath),  "initWithSeed:error:",  v6,  &v39);
  id v9 = v39;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v10 registerPromise:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v8, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v11);

    uint64_t v33 = 0LL;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    uint64_t v36 = sub_10005E1CC;
    v37 = sub_10005E1DC;
    id v38 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = sub_10005E1CC;
    v31 = sub_10005E1DC;
    id v32 = 0LL;
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v8, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005E530;
    block[3] = &unk_1000CD448;
    v24 = v8;
    v25 = &v27;
    v26 = &v33;
    dispatch_sync(v12, block);

    v7[2](v7, v34[5], v28[5]);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }

  else
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100082838(v6, (uint64_t)v9, v14);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 transferPath]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
    v18 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createTransferToPathDataPromiseWithSeed:completion:]",  363LL,  @"IXErrorDomain",  2uLL,  v9,  0LL,  @"Failed to create promised transfer to path data promise with name: %@ path: %@ client: %@",  v19,  (uint64_t)v15);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    v7[2](v7, 0LL, v21);
    id v9 = (id)v21;
  }
}

- (void)_remote_createStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v37 = 0LL;
  id v8 = -[IXSPromisedStreamingZipTransfer initWithSeed:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedStreamingZipTransfer),  "initWithSeed:error:",  v6,  &v37);
  id v9 = v37;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v10 registerPromise:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v8, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v11);

    uint64_t v31 = 0LL;
    id v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    uint64_t v34 = sub_10005E1CC;
    uint64_t v35 = sub_10005E1DC;
    id v36 = 0LL;
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    uint64_t v28 = sub_10005E1CC;
    uint64_t v29 = sub_10005E1DC;
    id v30 = 0LL;
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v8, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005E84C;
    block[3] = &unk_1000CD448;
    uint64_t v22 = v8;
    objc_super v23 = &v25;
    v24 = &v31;
    dispatch_sync(v12, block);

    v7[2](v7, v32[5], v26[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }

  else
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100082928();
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v16 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createStreamingZipTransferDataPromiseWithSeed:completion:]",  389LL,  @"IXErrorDomain",  2uLL,  v9,  0LL,  @"Failed to create streaming zip transfer data promise with name: %@ client: %@",  v17,  (uint64_t)v15);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    v7[2](v7, 0LL, v19);
    id v9 = (id)v19;
  }
}

- (void)_remote_createInMemoryDataPromiseWithSeed:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v33 = 0LL;
  id v11 = -[IXSPromisedInMemoryData initWithSeed:data:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedInMemoryData),  "initWithSeed:data:error:",  v8,  v9,  &v33);
  id v12 = v33;
  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v13 registerPromise:v11];

    char v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v11, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v14);

    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    id v30 = sub_10005E1CC;
    uint64_t v31 = sub_10005E1DC;
    id v32 = 0LL;
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v11, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005EB44;
    block[3] = &unk_1000CCEF8;
    v26 = &v27;
    uint64_t v25 = v11;
    dispatch_sync(v15, block);

    v10[2](v10, v28[5], 0LL);
    _Block_object_dispose(&v27, 8);
  }

  else
  {
    v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000829C4();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    uint64_t v19 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createInMemoryDataPromiseWithSeed:data:completion:]",  416LL,  @"IXErrorDomain",  2uLL,  v12,  0LL,  @"Failed to create in memory data promise with name: %@ client: %@",  v20,  (uint64_t)v18);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

    v10[2](v10, 0LL, v22);
    id v12 = (id)v22;
  }
}

- (void)_remote_createInMemoryDictionaryPromiseWithSeed:(id)a3 dictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v33 = 0LL;
  id v11 = -[IXSPromisedInMemoryDictionary initWithSeed:dictionary:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedInMemoryDictionary),  "initWithSeed:dictionary:error:",  v8,  v9,  &v33);
  id v12 = v33;
  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v13 registerPromise:v11];

    char v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v11, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v14);

    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    id v30 = sub_10005E1CC;
    uint64_t v31 = sub_10005E1DC;
    id v32 = 0LL;
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v11, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005EDF8;
    block[3] = &unk_1000CCEF8;
    v26 = &v27;
    uint64_t v25 = v11;
    dispatch_sync(v15, block);

    v10[2](v10, v28[5], 0LL);
    _Block_object_dispose(&v27, 8);
  }

  else
  {
    v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100082A60();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    uint64_t v19 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createInMemoryDictionaryPromiseWithSeed:dictionary:completion:]",  438LL,  @"IXErrorDomain",  2uLL,  v12,  0LL,  @"Failed to create in memory dictionary promise with name: %@ client: %@",  v20,  (uint64_t)v18);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

    v10[2](v10, 0LL, v22);
    id v12 = (id)v22;
  }
}

- (void)_remote_createOutOfBandTransferPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  id v30 = 0LL;
  id v8 = -[IXSDataPromise initWithSeed:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedOutOfBandTransfer),  "initWithSeed:error:",  v6,  &v30);
  id v9 = v30;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v10 registerPromise:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v8, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v11);

    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    uint64_t v27 = sub_10005E1CC;
    uint64_t v28 = sub_10005E1DC;
    id v29 = 0LL;
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v8, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005F098;
    block[3] = &unk_1000CCEF8;
    objc_super v23 = &v24;
    uint64_t v22 = v8;
    dispatch_sync(v12, block);

    v7[2](v7, v25[5], 0LL);
    _Block_object_dispose(&v24, 8);
  }

  else
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100082AFC();
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v16 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createOutOfBandTransferPromiseWithSeed:completion:]",  460LL,  @"IXErrorDomain",  2uLL,  v9,  0LL,  @"Failed to create out of band transfer promise with name: %@ client: %@",  v17,  (uint64_t)v15);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    v7[2](v7, 0LL, v19);
    id v9 = (id)v19;
  }
}

- (void)_remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  id v30 = 0LL;
  id v8 = -[IXSPromisedOutOfBandStreamingZipTransfer initWithSeed:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedOutOfBandStreamingZipTransfer),  "initWithSeed:error:",  v6,  &v30);
  id v9 = v30;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v10 registerPromise:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v8, "uniqueIdentifier"));
    -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v11);

    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    uint64_t v27 = sub_10005E1CC;
    uint64_t v28 = sub_10005E1DC;
    id v29 = 0LL;
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v8, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005F338;
    block[3] = &unk_1000CCEF8;
    objc_super v23 = &v24;
    uint64_t v22 = v8;
    dispatch_sync(v12, block);

    v7[2](v7, v25[5], 0LL);
    _Block_object_dispose(&v24, 8);
  }

  else
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100082B98();
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v16 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:completion:]",  482LL,  @"IXErrorDomain",  2uLL,  v9,  0LL,  @"Failed to create out of band streaming zip transfer promise with name: %@ client: %@",  v17,  (uint64_t)v15);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    v7[2](v7, 0LL, v19);
    id v9 = (id)v19;
  }
}

- (void)_remote_createAppReferenceDataPromiseWithSeed:(id)a3 ifMatchingPredicate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
  id v31 = 0LL;
  unsigned __int8 v12 = [v11 resolvePersonaWithError:&v31];
  id v13 = v31;

  if ((v12 & 1) != 0)
  {
    id v30 = v13;
    char v14 = -[IXSPromisedAppReference initWithSeed:ifMatchingPredicate:error:]( objc_alloc(&OBJC_CLASS___IXSPromisedAppReference),  "initWithSeed:ifMatchingPredicate:error:",  v8,  v9,  &v30);
    id v15 = v30;

    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
      [v16 registerPromise:v14];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v14, "uniqueIdentifier"));
      -[IXSClientConnection addInterestedPromiseUUID:](self, "addInterestedPromiseUUID:", v17);

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v14, "accessQueue"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10005F5DC;
      v27[3] = &unk_1000CE208;
      id v29 = v10;
      uint64_t v28 = v14;
      sub_10005A8F0(v18, v27);
    }

    else
    {
      uint64_t v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100082C34();
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      uint64_t v22 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppReferenceDataPromiseWithSeed:ifMatchingPredicate:completion:]",  511LL,  @"IXErrorDomain",  2uLL,  v15,  0LL,  @"Failed to create promised app reference with name: %@ client: %@",  v23,  (uint64_t)v21);
      uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);

      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v25);
      id v15 = (id)v25;
    }

    id v13 = v15;
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)_remote_createAppInstallCoordinatorWithSeed:(id)a3 createIfNotExisting:(BOOL)a4 requireMatchingIntent:(BOOL)a5 scopeRequirement:(unsigned __int8)a6 completion:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  uint64_t v124 = 0LL;
  v125 = &v124;
  uint64_t v126 = 0x2020000000LL;
  char v127 = 0;
  char v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
  id v15 = v14;
  if (v14)
  {
    id v123 = 0LL;
    unsigned __int8 v16 = [v14 resolvePersonaWithError:&v123];
    id v17 = v123;
    if ((v16 & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
      v117 = v18;
      if (!v18)
      {
        id v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
          sub_100082D48(v33, buf);
        }

        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        id v36 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  572LL,  @"IXErrorDomain",  0xDuLL,  0LL,  0LL,  @"Expected a non-nil bundleID from client: %@",  v35,  (uint64_t)v34);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v36);

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        id v24 = 0LL;
        goto LABEL_53;
      }

      if ([v18 containsString:@"/"])
      {
        uint64_t v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100082D9C();
        }

        id v22 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  578LL,  @"IXErrorDomain",  0x2CuLL,  0LL,  0LL,  @"Bundle identifier %@ contains /, which is not allowed",  v21,  (uint64_t)v117);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v22);

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        id v24 = 0LL;
        goto LABEL_53;
      }

      if (![v117 length])
      {
        id v38 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_100082E0C();
        }

        id v41 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  584LL,  @"IXErrorDomain",  0x2CuLL,  0LL,  0LL,  @"Bundle identifier is an empty string, which is not allowed",  v40,  v110);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v41);

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        id v24 = 0LL;
        goto LABEL_53;
      }

      if (!sub_100031790(v8))
      {
        v42 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          sub_100082F08(v8, v43, buf);
          uint64_t v8 = *(unsigned int *)buf;
        }

        id v45 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  590LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Scope requirement parameter value was not a known value: %hhu",  v44,  v8);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v45);

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        id v24 = 0LL;
        goto LABEL_53;
      }

      id v37 = [v12 installationDomain];
      if ((MIIsValidInstallationDomain() & 1) == 0)
      {
        v46 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100082E80((uint64_t)v37, v47, v48);
        }

        id v50 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  597LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Installation domain in seed was not a known value: %lu",  v49,  (uint64_t)v37);
        id v23 = (id)objc_claimAutoreleasedReturnValue(v50);

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        id v24 = 0LL;
        goto LABEL_53;
      }

      if (v10)
      {
        v119[0] = _NSConcreteStackBlock;
        v119[1] = 3221225472LL;
        v119[2] = sub_1000603B4;
        v119[3] = &unk_1000CE8F8;
        char v122 = v8;
        v119[4] = self;
        id v120 = v12;
        v121 = &v124;
        id v24 = objc_retainBlock(v119);
      }

      else
      {
        id v24 = 0LL;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
      id v118 = v17;
      v116 = (void *)objc_claimAutoreleasedReturnValue( [v51 coordinatorForIdentity:v15 connection:self error:&v118 creatingIfNotExisting:v24]);
      id v23 = v118;

      if (!v116)
      {
        v60 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v129 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIn"
                 "tent:scopeRequirement:completion:]";
          __int16 v130 = 2112;
          v131 = v15;
          __int16 v132 = 2112;
          id v133 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create/get coordinator for %@ : %@",  buf,  0x20u);
        }

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
        goto LABEL_52;
      }

      if (sub_10006042C(v116, v8))
      {
        if (!v9) {
          goto LABEL_51;
        }
        id v52 = [v12 intent];
        if (v52 == [v116 originalIntent]) {
          goto LABEL_51;
        }
        if (*((_BYTE *)v125 + 24))
        {
          v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v100 = sub_100060484((unint64_t)[v12 intent]);
            id v101 = (id)objc_claimAutoreleasedReturnValue(v100);
            v102 = sub_100060484((unint64_t)[v116 originalIntent]);
            v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
            *(_DWORD *)buf = 136316162;
            v129 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatching"
                   "Intent:scopeRequirement:completion:]";
            __int16 v130 = 2112;
            v131 = v15;
            __int16 v132 = 2112;
            id v133 = v101;
            __int16 v134 = 2112;
            id v135 = v103;
            __int16 v136 = 2112;
            v137 = 0LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "%s: Created an IXCoordinatedAppInstall object for %@ expecting it to have intent %@ but it had %@ : %@",  buf,  0x34u);
          }

          v55 = sub_100060484((unint64_t)[v12 intent]);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v57 = sub_100060484((unint64_t)[v116 originalIntent]);
          v111 = (void *)objc_claimAutoreleasedReturnValue(v57);
          id v59 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:require MatchingIntent:scopeRequirement:completion:]",  635LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Created an IXCoordinatedAppInstall object for %@ expecting it to have intent %@ but it had %@",  v58,  (uint64_t)v15);
          id v23 = (id)objc_claimAutoreleasedReturnValue(v59);

          [v116 cancelForReason:v23 client:15 error:0];
          goto LABEL_49;
        }

        v83 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v104 = sub_100060484((unint64_t)[v116 originalIntent]);
          id v115 = (id)objc_claimAutoreleasedReturnValue(v104);
          v105 = IXStringForClientID((unint64_t)[v116 creator]);
          id v106 = (id)objc_claimAutoreleasedReturnValue(v105);
          v107 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
          v108 = sub_100060484((unint64_t)[v12 intent]);
          v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
          *(_DWORD *)buf = 136316674;
          v129 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIn"
                 "tent:scopeRequirement:completion:]";
          __int16 v130 = 2112;
          v131 = v15;
          __int16 v132 = 2112;
          id v133 = v115;
          __int16 v134 = 2112;
          id v135 = v106;
          __int16 v136 = 2112;
          v137 = v107;
          __int16 v138 = 2112;
          uint64_t v139 = (uint64_t)v109;
          __int16 v140 = 2112;
          uint64_t v141 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "%s: A coordinated app install already exists for %@ with intent %@ (creator %@) but request by %@ was for intent %@ : %@",  buf,  0x48u);
        }

        v85 = sub_100060484((unint64_t)[v116 originalIntent]);
        v72 = (void *)objc_claimAutoreleasedReturnValue(v85);
        v86 = IXStringForClientID((unint64_t)[v116 creator]);
        v74 = (void *)objc_claimAutoreleasedReturnValue(v86);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        v87 = sub_100060484((unint64_t)[v12 intent]);
        v77 = (void *)objc_claimAutoreleasedReturnValue(v87);
        id v89 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  639LL,  @"IXErrorDomain",  5uLL,  0LL,  0LL,  @"A coordinated app install already exists for %@ with intent %@ (creator %@) but request by %@ was for intent %@",  v88,  (uint64_t)v15);
        uint64_t v80 = objc_claimAutoreleasedReturnValue(v89);
      }

      else
      {
        if (*((_BYTE *)v125 + 24))
        {
          v62 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v90 = sub_100031738(v8);
            id v91 = (id)objc_claimAutoreleasedReturnValue(v90);
            v92 = IXStringForCoordinatorScope([v116 coordinatorScope]);
            v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
            *(_DWORD *)buf = 136316162;
            v129 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatching"
                   "Intent:scopeRequirement:completion:]";
            __int16 v130 = 2112;
            v131 = v15;
            __int16 v132 = 2112;
            id v133 = v91;
            __int16 v134 = 2112;
            id v135 = v93;
            __int16 v136 = 2112;
            v137 = 0LL;
            _os_log_error_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%s: Created an IXCoordinatedAppInstall object for %@ expecting it to have scope requirement %@ but it had scope %@ : %@",  buf,  0x34u);
          }

          v64 = sub_100031738(v8);
          v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
          v66 = IXStringForCoordinatorScope([v116 coordinatorScope]);
          v112 = (void *)objc_claimAutoreleasedReturnValue(v66);
          id v68 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:require MatchingIntent:scopeRequirement:completion:]",  626LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Created an IXCoordinatedAppInstall object for %@ expecting it to have scope requirement %@ but it had scope %@",  v67,  (uint64_t)v15);
          id v23 = (id)objc_claimAutoreleasedReturnValue(v68);

          [v116 cancelForReason:v23 client:15 error:0];
LABEL_49:
          if (v23)
          {
            (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v23);
LABEL_52:

LABEL_53:
            id v17 = v23;
            goto LABEL_54;
          }

- (void)_remote_fetchSeedsForCoordinatorsWithIntent:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  int v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000606BC;
  v15[3] = &unk_1000CE920;
  unint64_t v17 = a3;
  BOOL v9 = v7;
  unsigned __int8 v16 = v9;
  [v8 enumerateCoordinatorsApplicableToConnection:self usingBlock:v15];

  BOOL v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v13 = -[NSMutableArray count](v9, "count");
    if (a3 >= 8) {
      char v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  a3));
    }
    else {
      char v14 = off_1000CEF18[a3];
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[IXSClientConnection _remote_fetchSeedsForCoordinatorsWithIntent:completion:]";
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    id v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ fetched %lu coordinators for enumeration with intent %@",  buf,  0x2Au);
  }

  v6[2](v6, v9, 0LL);
}

- (void)_remote_fetchRegisteredDataPromiseInfoForCreator:(unint64_t)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, id, void))a4;
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100060800;
  id v13 = &unk_1000CE948;
  char v14 = v6;
  unint64_t v15 = a3;
  uint64_t v8 = v6;
  [v7 enumeratePromises:&v10];

  id v9 = -[NSMutableArray copy](v8, "copy", v10, v11, v12, v13);
  v5[2](v5, v9, 0LL);
}

- (void)_remote_checkIfDataPromiseExistsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 promiseForUUID:v6]);

  v5[2](v5, v8 != 0LL, 0LL);
}

- (void)_remote_cancelCoordinatorForAppWithIdentity:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, IXUninstallOptions *))a6;
  id v38 = 0LL;
  unsigned __int8 v13 = [v10 resolvePersonaWithError:&v38];
  char v14 = (IXUninstallOptions *)v38;
  if ((v13 & 1) != 0)
  {
    unint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = IXStringForClientID(a5);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      uint64_t v40 = "-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]";
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2112;
      uint64_t v44 = v18;
      __int16 v45 = 2112;
      v46 = v19;
      __int16 v47 = 2112;
      id v48 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Cancellation for %@ (client %@) requested by %@ for reason %@",  buf,  0x34u);
    }

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 coordinatorForIdentity:v10]);

    if (v21)
    {
      buf[0] = 0;
      id v37 = 0LL;
      unsigned __int8 v22 = [v21 cancelForReason:v11 client:a5 needsLSDatabaseSync:buf error:&v37];
      id v23 = v37;
      __int16 v24 = v23;
      uint64_t v25 = 0LL;
      if ((v22 & 1) == 0) {
        uint64_t v25 = (IXUninstallOptions *)v23;
      }
      v12[2](v12, buf[0], v25);

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }

    if (a5 != 8)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
      if ([v26 isEqualToString:@"IXUserPresentableErrorDomain"])
      {
        id v27 = [v11 code];

        if (v27 == (id)3) {
          goto LABEL_12;
        }
      }

      else
      {
      }

      id v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_100082FA0();
      }

      id v33 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]",  740LL,  @"IXErrorDomain",  6uLL,  0LL,  0LL,  @"Coordinator did not exist for bundle ID %@",  v32,  (uint64_t)v10);
      uint64_t v34 = (IXUninstallOptions *)objc_claimAutoreleasedReturnValue(v33);
      v12[2](v12, 0LL, v34);

      goto LABEL_16;
    }

- (void)_remote_cancelCoordinatorsForAppsWithIdentities:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v8 = a3;
  id v34 = a4;
  id v35 = a6;
  id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v8 count];
    id v12 = IXStringForClientID(a5);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    char v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[IXSClientConnection _remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v11;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v13;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v14;
    *(_WORD *)&buf[38] = 2112;
    id v67 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Bulk cancellation of %d coordinators (client %@) requested by %@ for reason %@",  buf,  0x30u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_10005E1CC;
  *(void *)&buf[32] = sub_10005E1DC;
  id v67 = 0LL;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = v8;
  id v15 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v61;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        uint64_t v19 = *(void *)&buf[8];
        id v59 = *(id *)(*(void *)&buf[8] + 40LL);
        unsigned __int8 v20 = [v18 resolvePersonaWithError:&v59];
        objc_storeStrong((id *)(v19 + 40), v59);
        if ((v20 & 1) == 0)
        {
          (*((void (**)(id, void, void))v35 + 2))(v35, 0LL, *(void *)(*(void *)&buf[8] + 40LL));

          goto LABEL_26;
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x2020000000LL;
  char v58 = 0;
  id v21 = v34;
  id v22 = (id)objc_claimAutoreleasedReturnValue([v21 domain]);
  if ([v22 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 userInfo]);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"AlertUser"]);
    unsigned int v25 = sub_100072D10(v24, 0LL);

    if (!v25)
    {
      char v33 = 0;
      id v38 = v21;
      goto LABEL_18;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 userInfo]);
    id v22 = [v26 mutableCopy];

    [v22 removeObjectForKey:@"AlertUser"];
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v27,  [v21 code],  v22));

    char v33 = 1;
  }

  else
  {
    char v33 = 0;
    id v38 = v21;
  }

LABEL_18:
  uint64_t v28 = dispatch_group_create();
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v37 = obj;
  id v29 = [v37 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v54;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v37);
        }
        uint64_t v32 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)j);
        dispatch_group_enter(v28);
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_100061294;
        v49[3] = &unk_1000CD150;
        v51 = buf;
        id v52 = v57;
        id v50 = v28;
        -[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]( self,  "_remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:",  v32,  v38,  a5,  v49);
      }

      id v29 = [v37 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }

    while (v29);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061310;
  block[3] = &unk_1000CE998;
  char v48 = v33;
  id v42 = v21;
  id v43 = v37;
  unint64_t v47 = a5;
  id v44 = v35;
  __int16 v45 = v57;
  v46 = buf;
  dispatch_group_notify(v28, &_dispatch_main_q, block);

  _Block_object_dispose(v57, 8);
LABEL_26:
  _Block_object_dispose(buf, 8);
}

- (void)_remote_setIsPaused:(BOOL)a3 forCoordinatorForAppWithIdentity:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v23 = 0LL;
  unsigned __int8 v10 = [v8 resolvePersonaWithError:&v23];
  id v11 = v23;
  if ((v10 & 1) != 0)
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        int v14 = 89;
      }
      else {
        int v14 = 78;
      }
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315906;
      unsigned int v25 = "-[IXSClientConnection _remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:]";
      __int16 v26 = 1024;
      int v27 = v14;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Setting isPaused to %c for %@ requested by %@",  buf,  0x26u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 coordinatorForIdentity:v8]);

    if (v17)
    {
      [v17 externalSetIsPaused:v6 completion:v9];
    }

    else
    {
      id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100083010();
      }

      id v21 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:]",  813LL,  @"IXErrorDomain",  6uLL,  0LL,  0LL,  @"Coordinator did not exist for bundle ID %@",  v20,  (uint64_t)v8);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

      v9[2](v9, v22);
      id v11 = (id)v22;
    }
  }

  else
  {
    v9[2](v9, (uint64_t)v11);
  }
}

- (void)_remote_prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v84 = 0LL;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v84];
  id v9 = v84;
  if ((v8 & 1) != 0)
  {
    unsigned __int8 v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
      __int16 v87 = 2112;
      id v88 = v6;
      __int16 v89 = 2112;
      id v90 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Prioritizing coordinator for %@ as requested by %@",  buf,  0x20u);
    }

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 coordinatorForIdentity:v6]);

    if (v14)
    {
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_100061F60;
      v82[3] = &unk_1000CE9C0;
      id v83 = v7;
      [v14 prioritizeWithCompletion:v82];
      id v15 = v83;
LABEL_69:

      goto LABEL_70;
    }

    int v77 = sub_10005A9F0();
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    id v81 = v9;
    uint64_t v16 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v15,  0LL,  &v81);
    id v17 = v81;

    if (v16)
    {
      if (-[LSApplicationRecord hasParallelPlaceholder](v16, "hasParallelPlaceholder"))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        uint64_t v19 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Uninstalling orphaned parallel placeholder for %@ when %@ sent us a prioritize message",  v6,  v18));

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppUninstaller sharedUninstaller](&OBJC_CLASS___IXSAppUninstaller, "sharedUninstaller"));
        [v20 uninstallParallelPlaceholderForIdentity:v6 reason:v19];

        uint64_t v21 = 1LL;
LABEL_67:

        goto LABEL_68;
      }

      unint64_t v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
      char v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        __int16 v87 = 2112;
        id v88 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%s: Discovered that app %@ is fully installed when trying to prioritize; this doesn't make sense.",
          buf,
          0x16u);
      }

      if (!v77)
      {
        uint64_t v21 = 0LL;
LABEL_68:
        (*((void (**)(id, uint64_t, id))v7 + 2))(v7, v21, v17);

        id v9 = v17;
        goto LABEL_69;
      }

      uint64_t v19 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempted to prioritize app %@ but it was fully installed!",  v6));
      nullsub_10(v19, 0LL);
LABEL_66:
      uint64_t v21 = 0LL;
      goto LABEL_67;
    }

    uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
      __int16 v87 = 2112;
      id v88 = v15;
      __int16 v89 = 2112;
      id v90 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to fetch LSApplicationRecord for application with identifier %@: %@",  buf,  0x20u);
    }

    id v80 = 0LL;
    uint64_t v19 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v15,  1LL,  &v80);
    id v24 = v80;
    unsigned int v25 = v24;
    if (!v19)
    {
      uint64_t v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_100083080();
      }

      id v52 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]",  882LL,  @"IXErrorDomain",  1uLL,  v25,  0LL,  @"Failed to get a placeholder app record for %@; it does not appear to be installed.",
              v51,
              (uint64_t)v6);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v52);

      if (!v77)
      {
        uint64_t v21 = 0LL;
        uint64_t v16 = 0LL;
        goto LABEL_67;
      }

      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Got prioritize for app %@ but it's not installed nor is it a placeholder!",  v6));
      nullsub_10(v53, 0LL);
      uint64_t v16 = 0LL;
      goto LABEL_65;
    }

    id v79 = v24;
    uint64_t v26 = MobileInstallationCopyAppMetadata(v15, &v79);
    int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v17 = v79;

    if (!v27)
    {
      __int128 v54 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_1000830F4();
      }

      uint64_t v16 = 0LL;
      if (!v77)
      {
        __int128 v53 = 0LL;
LABEL_65:

        goto LABEL_66;
      }

      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get bundle metadata for %@",  v6));
      nullsub_10(v56, v17);
      __int128 v53 = 0LL;
LABEL_64:

      goto LABEL_65;
    }

    id v72 = v17;
    id v75 = [v27 placeholderFailureReason];
    uint64_t v78 = v27;
    id v73 = [v27 placeholderFailureUnderlyingErrorSource];
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v19, "iTunesMetadata"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 distributorInfo]);

    v76 = v29;
    unsigned int v30 = [v29 distributorIsThirdParty];
    BOOL v70 = sub_100031BB0(v15, 13LL);
    BOOL v69 = sub_100031BB0(v15, 2LL);
    unsigned int v31 = -[LSApplicationRecord isAppStoreVendable](v19, "isAppStoreVendable");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v19, "iTunesMetadata"));
    char v33 = (void *)objc_claimAutoreleasedReturnValue([v32 managementDeclarationIdentifier]);

    uint64_t v34 = (uint64_t)v73;
    unsigned int v68 = v30;
    if (v33) {
      int v35 = 1;
    }
    else {
      int v35 = v30;
    }
    if (v31) {
      uint64_t v34 = 1LL;
    }
    if (v35) {
      unint64_t v36 = 28LL;
    }
    else {
      unint64_t v36 = v34;
    }
    int IsHardError = IXUserPresentableErrorCodeIsHardError((unint64_t)v75, v36);
    int v38 = IsHardError;
    if (v75 && (IsHardError & 1) != 0)
    {
LABEL_24:
      unint64_t v71 = v36;
      uint64_t v74 = objc_claimAutoreleasedReturnValue([v78 placeholderFailureUnderlyingError]);
      uint64_t v39 = 8LL;
      if (v31) {
        uint64_t v39 = 0LL;
      }
      if (v75) {
        id v40 = v75;
      }
      else {
        id v40 = (id)v39;
      }
      __int16 v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      if (v38)
      {
        id v17 = v72;
        if (v43)
        {
          *(_DWORD *)buf = 136315650;
          v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          __int16 v87 = 2112;
          id v88 = v6;
          __int16 v89 = 2048;
          id v90 = v40;
          id v44 = "%s: No coordinator found for %@ and error is a hard error (%ld) so showing alert";
          __int16 v45 = v42;
          uint32_t v46 = 32;
LABEL_61:
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);
        }

- (void)_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v8 = sub_10000C398(v7, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = IXStringForClientID(a3);
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v23 = "-[IXSClientConnection _remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:]";
      __int16 v24 = 2112;
      unsigned int v25 = v13;
      __int16 v26 = 2112;
      int v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Purging all registered coordinators and promises for creator %@ as requested by %@",  buf,  0x20u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v15 clearAllCoordinatorsForCreator:a3];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v16 clearAllPromisesForCreator:a3];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[IXSPendingOperationsTracker sharedInstance]( &OBJC_CLASS___IXSPendingOperationsTracker,  "sharedInstance"));
    [v17 clearAllPendingOperations];

    v6[2](v6, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100083168(self);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v20 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:]",  980LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v19,  (uint64_t)v18);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    v6[2](v6, v21);
    id v6 = (void (**)(id, void))v21;
  }
}

- (void)_remote_killDaemonForTestingWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v6 = sub_10000C398(v5, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[IXSClientConnection _remote_killDaemonForTestingWithCompletion:]";
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Exiting because testing client %@ told us to",  buf,  0x16u);
    }

    exit(1);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000831EC(self);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
  id v12 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_killDaemonForTestingWithCompletion:]",  1000LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v11,  (uint64_t)v10);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v4[2](v4, v13);
}

- (void)_remote_pingDaemonWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v6 = sub_10000C398(v5, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[IXSClientConnection _remote_pingDaemonWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Ping", buf, 0xCu);
    }

    uint64_t v10 = getpid();
    v4[2](v4, v10, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100083270(self);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v13 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_pingDaemonWithCompletion:]",  1017LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v12,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    v4[2](v4, 0xFFFFFFFFLL, v14);
    id v4 = (void (**)(id, uint64_t, void))v14;
  }
}

- (void)_remote_fakeClientDeathWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v6 = sub_10000C398(v5, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[IXSClientConnection _remote_fakeClientDeathWithCompletion:]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Faking death of client %@", buf, 0x16u);
    }

    -[IXSClientConnection setFakeClientProcessDeath:](self, "setFakeClientProcessDeath:", 1LL);
    -[IXSClientConnection cancelOrphanedPromisesAndRemovePromiseReferences]( self,  "cancelOrphanedPromisesAndRemovePromiseReferences");
    v4[2](v4, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000832F4(self);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v13 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_fakeClientDeathWithCompletion:]",  1033LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v12,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    v4[2](v4, v14);
    id v4 = (void (**)(id, void))v14;
  }
}

- (void)_remote_postNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v6 = sub_10000C398(v5, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[IXSClientConnection _remote_postNSCurrentLocaleDidChangeNotification:]";
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Posting NSCurrentLocaleDidChangeNotification because testing client %@ told us to",  buf,  0x16u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:NSCurrentLocaleDidChangeNotification object:0];

    v4[2](v4, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100083378(self);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v14 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_postNSCurrentLocaleDidChangeNotification:]",  1059LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v13,  (uint64_t)v12);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

    v4[2](v4, v15);
    id v4 = (void (**)(id, void))v15;
  }
}

- (void)_remote_setTestingEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  unsigned __int8 v6 = (void (**)(id, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v8 = sub_10000C398(v7, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        int v12 = 89;
      }
      else {
        int v12 = 78;
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "-[IXSClientConnection _remote_setTestingEnabled:completion:]";
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Setting testing enabled to %c by client %@",  buf,  0x1Cu);
    }

    if (v4) {
      sub_100031D30();
    }
    else {
      sub_100031D44();
    }
    v6[2](v6, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000833FC(self);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v16 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_setTestingEnabled:completion:]",  1077LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v15,  (uint64_t)v14);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

    v6[2](v6, v17);
    unsigned __int8 v6 = (void (**)(id, void))v17;
  }
}

- (void)_remote_setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void))a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v14 = sub_10000C398(v13, (uint64_t)@"com.apple.private.InstallCoordination.unitTestRunner");

  uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315906;
      __int16 v24 = "-[IXSClientConnection _remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:]";
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      unsigned int v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Setting test mode %lu for bundle prefix %@ by client %@",  buf,  0x2Au);
    }

    sub_100031BB8(v10, a4, v11);
    v12[2](v12, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100083480(self);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v21 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:]",  1099LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing test runner entitlement.",  v20,  (uint64_t)v19);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

    v12[2](v12, v22);
    int v12 = (void (**)(id, void))v22;
  }
}

- (void)_remote_registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v11 = sub_10000C398( v10,  (uint64_t)@"com.apple.private.InstallCoordination.diskImageContentRegistration");

  if ((v11 & 1) == 0)
  {
    __int16 v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100083588(self);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v17 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]",  1139LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing disk image (client registration/unregistration) operation entitlement.",  v20,  (uint64_t)v15);
    goto LABEL_9;
  }

  int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  unsigned __int8 v14 = v13;
  if (a4)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100083504(self);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v17 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]",  1145LL,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  @"Client %@ has passed non-nil options.",  v16,  (uint64_t)v15);
LABEL_9:
    id v21 = (id)objc_claimAutoreleasedReturnValue(v17);

    v9[2](v9, 0LL, v21);
    goto LABEL_10;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    *(_DWORD *)buf = 136315650;
    __int16 v27 = "-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]";
    __int16 v28 = 2112;
    __int16 v29 = v22;
    __int16 v30 = 2112;
    unsigned int v31 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Registering contents for disk image mounted at %@ by client %@",  buf,  0x20u);
  }

  id v25 = 0LL;
  uint64_t v24 = MobileInstallationRegisterContentsForDiskImageAtURL(v8, &v25);
  id v21 = v25;
  v9[2](v9, v24, v21);
LABEL_10:
}

- (void)_remote_unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v11 = sub_10000C398( v10,  (uint64_t)@"com.apple.private.InstallCoordination.diskImageContentRegistration");

  if ((v11 & 1) == 0)
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100083704(self);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v16 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]",  1163LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing disk image (contents registration/unregistration) operation entitlement.",  v19,  (uint64_t)v14);
    goto LABEL_9;
  }

  if (a4)
  {
    int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100083680(self);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v16 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]",  1169LL,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  @"Client %@ has passed non-nil options.",  v15,  (uint64_t)v14);
LABEL_9:
    id v20 = (id)objc_claimAutoreleasedReturnValue(v16);

    v9[2](v9, 0LL, v20);
    goto LABEL_10;
  }

  id v21 = objc_claimAutoreleasedReturnValue([v8 path]);
  uint64_t v22 = realpath_DARWIN_EXTSN((const char *)[v21 fileSystemRepresentation], 0);
  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:",  v22));
    uint64_t v24 = 0LL;
  }

  else
  {
    id v25 = __error();
    unint64_t v59 = *v25;
    strerror(*v25);
    id v27 = sub_10003556C( (uint64_t)"_SanitizedRealPath",  1119LL,  NSPOSIXErrorDomain,  v59,  0LL,  0LL,  @"Failed to retrieve realpath for %@ : %d (%s)",  v26,  (uint64_t)v21);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v23 = 0LL;
  }

  free(v22);
  if (v23) {
    id v28 = 0LL;
  }
  else {
    id v28 = v24;
  }

  id v64 = v28;
  if (!v23)
  {
    unint64_t v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      char v58 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315906;
      uint64_t v74 = "-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]";
      __int16 v75 = 2112;
      v76 = v58;
      __int16 v77 = 2112;
      id v78 = v21;
      __int16 v79 = 2112;
      id v80 = v64;
      _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s: Client %@ has passed an invalid disk image path %@ : %@",  buf,  0x2Au);
    }

    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v51 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]",  1180LL,  @"IXErrorDomain",  0x35uLL,  v64,  0LL,  @"Client %@ has passed an invalid disk image path %@",  v50,  (uint64_t)v49);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v51);

    v9[2](v9, 0LL, v20);
    goto LABEL_47;
  }

  uint64_t v60 = self;
  id v61 = v21;
  __int128 v62 = v9;
  id v63 = v8;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  __int16 v30 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v31 = v29;
  id v32 = [v31 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (!v32) {
    goto LABEL_30;
  }
  id v33 = v32;
  uint64_t v34 = *(void *)v69;
  do
  {
    for (i = 0LL; i != v33; i = (char *)i + 1)
    {
      if (*(void *)v69 != v34) {
        objc_enumerationMutation(v31);
      }
      unint64_t v36 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 URL]);
      int v38 = (void *)objc_claimAutoreleasedReturnValue([v37 path]);
      if ([v38 hasPrefix:v23])
      {
        unsigned __int8 v39 = [v36 isPlaceholder];

        if ((v39 & 1) != 0) {
          continue;
        }
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleIdentifier]);
        -[NSMutableSet addObject:](v30, "addObject:", v37);
      }

      else
      {
      }
    }

    id v33 = [v31 countByEnumeratingWithState:&v68 objects:v72 count:16];
  }

  while (v33);
LABEL_30:

  if (!-[NSMutableSet count](v30, "count"))
  {
    id v43 = 0LL;
    id v45 = v64;
    goto LABEL_38;
  }

  id v40 = objc_alloc(&OBJC_CLASS___IXSTerminationAssertion);
  id v41 = -[NSMutableSet copy](v30, "copy");
  id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unregistering %@ for unmounting disk image at %@",  v30,  v23));
  id v67 = v64;
  id v43 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( v40,  "initForBundleIDs:description:terminationResistance:error:",  v41,  v42,  40LL,  &v67);
  id v20 = v67;

  if (v43)
  {
    id v66 = v20;
    unsigned int v44 = [v43 acquireAssertion:&v66];
    id v45 = v66;

    if (!v44)
    {
      uint64_t v46 = 0LL;
      id v20 = v45;
      goto LABEL_46;
    }

- (void)_remote_associateMultiPersonaAppsWithBundleIDs:(id)a3 withPersona:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v12 = sub_10000C398( v11,  (uint64_t)@"com.apple.private.InstallCoordination.personaBasedMultiUser");

  uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 136315906;
      id v32 = "-[IXSClientConnection _remote_associateMultiPersonaAppsWithBundleIDs:withPersona:completion:]";
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      int v38 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ associating persona %@ with bundle IDs: %@",  buf,  0x2Au);
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___IXSTerminationAssertion);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion for associating persona %@ : %@",  v9,  v8));
    id v30 = 0LL;
    id v21 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( v19,  "initForBundleIDs:description:terminationResistance:error:",  v8,  v20,  50LL,  &v30);
    id v22 = v30;

    if (v21)
    {
      id v29 = v22;
      id v23 = [v21 acquireAssertion:&v29];
      id v24 = v29;

      if ((_DWORD)v23)
      {
        id v28 = v24;
        id v23 = (id)MobileInstallationSetPersonaForDataSeparatedApps(v8, v9, &v28);
        id v22 = v28;
      }

      else
      {
        id v22 = v24;
      }
    }

    else
    {
      id v23 = 0LL;
    }

    [v21 invalidate];
    v10[2](v10, v23, v22);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100083788(self);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v27 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_associateMultiPersonaAppsWithBundleIDs:withPersona:completion:]",  1225LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement.",  v26,  (uint64_t)v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v27);

    v10[2](v10, 0LL, v22);
    id v21 = v10;
  }
}

- (void)_remote_addBundleIDs:(id)a3 toMappingsForPersona:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v12 = sub_10000C398( v11,  (uint64_t)@"com.apple.private.InstallCoordination.personaBasedMultiUser");

  uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 136315906;
      id v32 = "-[IXSClientConnection _remote_addBundleIDs:toMappingsForPersona:completion:]";
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ adding bundleID %@ to persona: %@",  buf,  0x2Au);
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___IXSTerminationAssertion);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion for associating persona %@ : %@",  v9,  v8));
    id v30 = 0LL;
    id v21 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( v19,  "initForBundleIDs:description:terminationResistance:error:",  v8,  v20,  50LL,  &v30);
    id v22 = v30;

    if (v21)
    {
      id v29 = v22;
      id v23 = [v21 acquireAssertion:&v29];
      id v24 = v29;

      if ((_DWORD)v23)
      {
        id v28 = v24;
        id v23 = (id)MobileInstallationAddDataSeparatedAppsToPersona(v8, v9, &v28);
        id v22 = v28;
      }

      else
      {
        id v22 = v24;
      }
    }

    else
    {
      id v23 = 0LL;
    }

    [v21 invalidate];
    v10[2](v10, v23, v22);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008380C(self);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v27 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_addBundleIDs:toMappingsForPersona:completion:]",  1254LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement.",  v26,  (uint64_t)v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v27);

    v10[2](v10, 0LL, v22);
    id v21 = v10;
  }
}

- (void)_remote_removeBundleIDs:(id)a3 fromMappingsForPersona:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v12 = sub_10000C398( v11,  (uint64_t)@"com.apple.private.InstallCoordination.personaBasedMultiUser");

  uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 136315906;
      id v32 = "-[IXSClientConnection _remote_removeBundleIDs:fromMappingsForPersona:completion:]";
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ removing bundle IDs: %@ from persona %@",  buf,  0x2Au);
    }

    uint64_t v19 = objc_alloc(&OBJC_CLASS___IXSTerminationAssertion);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion for disassociating persona %@ : %@",  v9,  v8));
    id v30 = 0LL;
    id v21 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( v19,  "initForBundleIDs:description:terminationResistance:error:",  v8,  v20,  50LL,  &v30);
    id v22 = v30;

    if (v21)
    {
      id v29 = v22;
      id v23 = [v21 acquireAssertion:&v29];
      id v24 = v29;

      if ((_DWORD)v23)
      {
        id v28 = v24;
        id v23 = (id)MobileInstallationRemoveDataSeparatedAppsFromPersona(v8, v9, &v28);
        id v22 = v28;
      }

      else
      {
        id v22 = v24;
      }
    }

    else
    {
      id v23 = 0LL;
    }

    [v21 invalidate];
    v10[2](v10, v23, v22);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100083890(self);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v27 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_removeBundleIDs:fromMappingsForPersona:completion:]",  1283LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement.",  v26,  (uint64_t)v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v27);

    v10[2](v10, 0LL, v22);
    id v21 = v10;
  }
}

- (void)_remote_removabilityForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v19 = 0LL;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v19];
  id v9 = v19;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 removabilityMetadataForAppWithIdentity:v6]);

    id v13 = [v12 removability];
    unsigned __int8 v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = IXStringForAppRemovability((unint64_t)v13);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315906;
      id v21 = "-[IXSClientConnection _remote_removabilityForAppWithIdentity:completion:]";
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Returning removability %@ for %@ to client %@",  buf,  0x2Au);
    }

    v7[2](v7, v13, 0LL);
  }

  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0LL, v9);
  }
}

- (void)_remote_removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, void))a5;
  id v22 = 0LL;
  unsigned __int8 v10 = [v8 resolvePersonaWithError:&v22];
  id v11 = v22;
  if ((v10 & 1) != 0)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    id v14 = [v13 removabilityForAppWithIdentity:v8 client:a4];

    uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = IXStringForAppRemovability((unint64_t)v14);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = IXStringForAppRemovabilityClient(a4);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      __int16 v24 = "-[IXSClientConnection _remote_removabilityForAppWithIdentity:byClient:completion:]";
      __int16 v25 = 2112;
      __int16 v26 = v18;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Returning removability %@ set for %@ by client %@ to caller %@",  buf,  0x34u);
    }

    v9[2](v9, v14, 0LL);
  }

  else
  {
    ((void (**)(id, id, id))v9)[2](v9, 0LL, v11);
  }
}

- (void)_remote_setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t))a6;
  id v37 = 0LL;
  unsigned __int8 v12 = [v10 resolvePersonaWithError:&v37];
  id v13 = v37;
  if ((v12 & 1) != 0)
  {
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    unsigned __int8 v15 = sub_10000C398(v14, (uint64_t)@"com.apple.springboard.application-removability.proxy");
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    __int16 v18 = v17;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = IXStringForAppRemovability(a3);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        id v22 = IXStringForAppRemovabilityClient(a5);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 136316162;
        unsigned __int8 v39 = "-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]";
        __int16 v40 = 2112;
        id v41 = v35;
        __int16 v42 = 2112;
        id v43 = v20;
        __int16 v44 = 2112;
        id v45 = v21;
        __int16 v46 = 2112;
        unint64_t v47 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Setting removability for %@ to %@ for client %@ with type %@",  buf,  0x34u);
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
      id v36 = v13;
      unsigned __int8 v25 = [v24 setRemovability:a3 forAppWithIdentity:v10 byClient:a5 error:&v36];
      id v26 = v36;

      if ((v25 & 1) != 0)
      {
        uint64_t v27 = 0LL;
      }

      else
      {
        uint64_t v27 = (uint64_t)v26;
        if (!v26)
        {
          __int16 v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100083914();
          }

          id v34 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]",  1374LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"-[IXSAppRemovabilityManager setRemovability:] for %@ returned NO but did not set an error.",  v33,  (uint64_t)v35);
          uint64_t v27 = objc_claimAutoreleasedReturnValue(v34);
          id v26 = (id)v27;
        }
      }
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100083984(self);
      }

      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      id v30 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]",  1360LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Client %@ is missing %@ entitlement, rejecting attempt to set app removability.",  v29,  (uint64_t)v28);
      uint64_t v27 = objc_claimAutoreleasedReturnValue(v30);

      id v26 = (id)v27;
    }

    v11[2](v11, v27);

    id v13 = v26;
  }

  else
  {
    v11[2](v11, (uint64_t)v13);
  }
}

- (void)_remote_removabilityDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id, id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  unsigned __int8 v6 = sub_10000C398(v5, (uint64_t)@"com.apple.springboard.application-removability.proxy");
  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100083A88(self, v9);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    id v26 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 removabilityDataWithChangeClock:&v26]);
    id v12 = v26;

    if (v11)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100064824;
      v24[3] = &unk_1000CDA30;
      unsigned __int8 v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      id v13 = v25;
      [v11 enumerateKeysAndObjectsUsingBlock:v24];
      id v14 = -[NSMutableDictionary copy](v13, "copy");
      v4[2](v4, v14, v12, 0LL);

      unsigned __int8 v15 = 0LL;
    }

    else
    {
      id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100083A14();
      }

      id v22 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_removabilityDataWithCompletion:]",  1401LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Unexpectedly received nil value for app removability data",  v21,  v23);
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v22);
      ((void (**)(id, id, id, void *))v4)[2](v4, 0LL, 0LL, v15);
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100083B2C(self);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v18 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_removabilityDataWithCompletion:]",  1389LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Client %@ is missing %@ entitlement, rejecting attempt to read app removability data.",  v17,  (uint64_t)v16);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v18);

    ((void (**)(id, id, id, void *))v4)[2](v4, 0LL, 0LL, v15);
  }
}

- (void)_remote_uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  if ((sub_10000C398(v11, (uint64_t)@"com.apple.private.InstallCoordination.uninstall") & 1) == 0)
  {
    id v12 = sub_10000C4A8(v11, @"UninstallForLaunchServices");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v16) {
        sub_100083E00(self);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]",  1428LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing entitlement %@ : TRUE (BOOLean) to uninstall applications",  v18,  (uint64_t)v17);
LABEL_46:
      id v24 = (id)objc_claimAutoreleasedReturnValue(v19);

LABEL_47:
      v10[2](v10, 0LL, v24);
      goto LABEL_48;
    }

    if (v16) {
      sub_100083D48(self, v15);
    }
  }

  if ([v9 ignoreRemovability]
    && (sub_10000C398(v11, (uint64_t)@"com.apple.private.InstallCoordination.ignoreRemovability") & 1) == 0)
  {
    id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100083CC4(self);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]",  1436LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing ignore removability operation entitlement.",  v30,  (uint64_t)v17);
    goto LABEL_46;
  }

  if ([v9 ignoreRestrictions]
    && (sub_10000C398(v11, (uint64_t)@"com.apple.private.InstallCoordination.ignoreRestrictions") & 1) == 0)
  {
    __int16 v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100083C40(self);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]",  1444LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing ignore restrictions operation entitlement.",  v33,  (uint64_t)v17);
    goto LABEL_46;
  }

  if ([v9 ignoreAppProtection]
    && (sub_10000C398(v11, (uint64_t)@"com.apple.private.InstallCoordination.ignoreAppProtection") & 1) == 0)
  {
    id v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100083BBC(self);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]",  1452LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing ignore app protection operation entitlement.",  v36,  (uint64_t)v17);
    goto LABEL_46;
  }

  id v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    *(_DWORD *)buf = 136315906;
    id v41 = "-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]";
    __int16 v42 = 2112;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v22;
    __int16 v46 = 2112;
    id v47 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Uninstall of %@ requested by client %@ with uninstall options %@",  buf,  0x2Au);
  }

  id v39 = 0LL;
  unsigned __int8 v23 = [v8 resolvePersonaWithError:&v39];
  id v24 = v39;
  if ((v23 & 1) == 0) {
    goto LABEL_47;
  }
  else {
    uint64_t v25 = 0LL;
  }
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppUninstaller sharedUninstaller](&OBJC_CLASS___IXSAppUninstaller, "sharedUninstaller"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100064DAC;
  v37[3] = &unk_1000CE970;
  id v38 = v10;
  [v26 uninstallAppWithIdentity:v8 clientName:v27 options:v25 completion:v37];

LABEL_48:
}

- (void)_remote_revertAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v14 = 0LL;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v14];
  id v9 = v14;
  if ((v8 & 1) != 0)
  {
    id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      BOOL v16 = "-[IXSClientConnection _remote_revertAppWithIdentity:completion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Revert of %@ requested by client %@",  buf,  0x20u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    +[IXSRevertManager revertAppWithIdentity:forClientWithName:completion:]( &OBJC_CLASS___IXSRevertManager,  "revertAppWithIdentity:forClientWithName:completion:",  v6,  v13,  v7);
  }

  else
  {
    v7[2](v7, 0LL, v9);
  }
}

- (void)_remote_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t))a6;
  id v36 = 0LL;
  unsigned __int8 v13 = [v10 resolvePersonaWithError:&v36];
  id v14 = v36;
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if ((sub_10000C398( v15,  (uint64_t)@"com.apple.private.InstallCoordination.refreshContainerTypes") & 1) == 0)
    {
      __int16 v35 = v15;
      id v16 = sub_10000C4A8(v15, @"UninstallForLaunchServices");
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v17)
      {
        if (v20) {
          sub_100083FD4(self);
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        id v23 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]",  1528LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing entitlement %@ = TRUE (BOOLean) to refresh containers",  v22,  (uint64_t)v21);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);

        v12[2](v12, v24);
        id v14 = (id)v24;
        unsigned __int8 v15 = v35;
LABEL_18:

        goto LABEL_19;
      }

      if (v20) {
        sub_100083F1C(self, v19);
      }

      unsigned __int8 v15 = v35;
    }

    uint64_t v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = v26;
    if (v11)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        *(_DWORD *)buf = 136315906;
        id v38 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
        __int16 v39 = 2048;
        unint64_t v40 = a3;
        __int16 v41 = 2112;
        id v42 = v10;
        __int16 v43 = 2112;
        __int16 v44 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: Refreshing container types 0x%lx of %@ requested by client %@",  buf,  0x2Au);
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[IXSContainerRefreshManager sharedInstance]( &OBJC_CLASS___IXSContainerRefreshManager,  "sharedInstance"));
      [v29 refreshContainerTypes:a3 forAppWithIdentity:v10 reason:v11 completion:v12];
    }

    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100083E90(v27, v30, v31);
      }

      id v33 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]",  1534LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Reason passed to %s was nil!",  v32,  (uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);

      v12[2](v12, v34);
      id v14 = (id)v34;
    }

    goto LABEL_18;
  }

  v12[2](v12, (uint64_t)v14);
LABEL_19:
}

- (void)_remote_registerObserverMachServiceName:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    int v14 = 136316162;
    unsigned __int8 v15 = "-[IXSClientConnection _remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:]";
    __int16 v16 = 2112;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ registered mach service name %@ for client identifiers %@ responding to selectors %lu",  (uint8_t *)&v14,  0x34u);
  }

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v13 registerMachServiceName:v8 forClientIDs:v9 respondingToSelectors:a5];
}

- (void)_remote_registerTransientObserver:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    int v14 = 136316162;
    unsigned __int8 v15 = "-[IXSClientConnection _remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:]";
    __int16 v16 = 2112;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ registered transient observer %@ for client identifiers %@ responding to selectors %lu",  (uint8_t *)&v14,  0x34u);
  }

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v13 registerListenerEndpoint:v8 forClientIDs:v9 respondingToSelectors:a5];
}

- (void)_remote_displayUserPresentableErrorForApp:(id)a3 code:(int64_t)a4
{
  id v6 = (char *)a3;
  id v7 = v6;
  if (!v6)
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      int v13 = 136315650;
      int v14 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v15 = 2080;
      __int16 v16 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Got nil identity in call to %s from client %@",  (uint8_t *)&v13,  0x20u);
    }

    goto LABEL_8;
  }

  if (([v6 resolvePersonaWithError:0] & 1) == 0)
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      int v14 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v15 = 2112;
      __int16 v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to resolve persona for %@",  (uint8_t *)&v13,  0x16u);
    }

- (void)_remote_displayUserPresentableErrorForApps:(id)a3 code:(int64_t)a4
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "resolvePersonaWithError:", 0, (void)v14) & 1) == 0)
        {
          id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
          int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApps:code:]";
            __int16 v20 = 2112;
            id v21 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to resolve persona for %@",  buf,  0x16u);
          }

          id v11 = v5;
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
  [v11 presentErrorForIdentities:v5 code:a4 underlyingError:0 errorSource:0];
LABEL_13:
}

- (void)_remote_displayUserPresentableErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
  [v6 presentErrorForAppWithLocalizedName:v5 code:a4 underlyingError:0 errorSource:0];
}

- (void)_remote_addObserversForCoordinatorsWithUUIDs:(id)a3 fireObserverMethods:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[IXSClientConnection addInterestedCoordinatorUUIDs:](self, "addInterestedCoordinatorUUIDs:", v6);
  if (v4)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v21 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v11);
          int v13 = objc_autoreleasePoolPush();
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 coordinatorForUUID:v12]);

          if (v15)
          {
            objc_msgSend(v15, "_remote_fireObserversForClient:completion:", self, &stru_1000CEA00);
          }

          else
          {
            __int128 v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
            __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v27 = "-[IXSClientConnection _remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:]";
              __int16 v28 = 2112;
              uint64_t v29 = v12;
              __int16 v30 = 2112;
              uint64_t v31 = 0LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed to locate coordinator with UUID %@ when trying to add observer for it : %@",  buf,  0x20u);
            }

            id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:]",  1623LL,  @"IXErrorDomain",  6uLL,  0LL,  0LL,  @"Failed to locate coordinator with UUID %@ when trying to add observer for it",  v18,  v12);
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            -[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]( self,  "_client_coordinatorWithUUID:didCancelWithReason:client:",  v12,  v20,  15LL);
          }

          objc_autoreleasePoolPop(v13);
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }

      while (v9);
    }

    id v6 = v21;
  }
}

- (void)_remote_removeObserverForCoordinatorWithUUID:(id)a3
{
}

- (void)_remote_addObserversForDataPromisesWithUUIDs:(id)a3
{
}

- (void)_remote_removeObserverForDataPromiseWithUUID:(id)a3
{
}

- (void)_remote_updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v26 = 0LL;
  unsigned __int8 v14 = [v10 resolvePersonaWithError:&v26];
  id v15 = v26;
  if ((v14 & 1) != 0)
  {
    __int128 v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v28 = "-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]";
      __int16 v29 = 2112;
      __int16 v30 = v18;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: %@ wants to update the SINF of %@",  buf,  0x20u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100065D58;
    v20[3] = &unk_1000CEA28;
    id v21 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    id v22 = v10;
    id v23 = v12;
    id v24 = v11;
    id v25 = v13;
    id v19 = v21;
    [v19 performCreationBlockingOperation:v20];
  }

  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

- (void)_remote_updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v27 = 0LL;
  unsigned __int8 v11 = [v9 resolvePersonaWithError:&v27];
  id v12 = v27;
  if ((v11 & 1) != 0)
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v29 = "-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]";
      __int16 v30 = 2112;
      __int16 v31 = v15;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@ wants to update the iTunesMetadata of %@",  buf,  0x20u);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    id v26 = v12;
    id v17 = sub_10000C700(v8, v16, @"updated metadata", &v26);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    id v19 = v26;

    if (v18)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100066168;
      v21[3] = &unk_1000CCE80;
      id v22 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
      id v23 = v9;
      id v18 = v18;
      id v24 = v18;
      id v25 = v10;
      id v20 = v22;
      [v20 performCreationBlockingOperation:v21];
    }

    else
    {
      (*((void (**)(id, id))v10 + 2))(v10, v19);
    }

    id v12 = v19;
  }

  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
    id v18 = 0LL;
  }
}

- (void)_fetchIXSCoordinatedAppInstallForUUID:(id)a3 method:(const char *)a4 andRunWithCoordinator:(id)a5 error:(id)a6
{
  id v10 = a3;
  unsigned __int8 v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 coordinatorForUUID:v10]);

  if (v14)
  {
    v11[2](v11, v14);
  }

  else
  {
    id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v23 = "-[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]";
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2080;
      id v27 = a4;
      __int16 v28 = 2112;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Coordinator did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v18 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]",  1769LL,  @"IXErrorDomain",  6uLL,  0LL,  0LL,  @"Coordinator did not exist for UUID %@ when called for %s by client %@",  v17,  (uint64_t)v10);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v12[2](v12, v19);
  }
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 appAssetPromiseHasBegunFulfillment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066638;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000666C0;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000666CC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:appAssetPromiseHasBegunFulfillment:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066844;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v24 = v10;
  id v14 = v10;
  dispatch_sync(v13, block);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000668CC;
  v19[3] = &unk_1000CEA78;
  id v20 = v11;
  unint64_t v22 = a5;
  id v21 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000668DC;
  v17[3] = &unk_1000CE9C0;
  id v18 = v21;
  id v15 = v21;
  id v16 = v11;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v14,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:cancelForReason:client:completion:]",  v19,  v17);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 fireObserversWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066A24;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100066AAC;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100066AB8;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:fireObserversWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066BF8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100066C80;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100066D7C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getAppAssetPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromiseDRI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066EC0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100066F48;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100066F54;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getAppAssetPromiseDRI:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067098;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100067120;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006712C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getCoordinationState:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getErrorInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067270;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000672F8;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067304;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getErrorInfo:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInitialODRAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006744C;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000674D4;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067684;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000677C8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100067850;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006785C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getIsComplete:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsPausedWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000679A0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100067A28;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067A34;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getIsPausedWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067B7C;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100067C04;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067D00;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPlaceholderPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPreparationPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067E48;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100067ED0;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067FCC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPreparationPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068114;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006819C;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100068298;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getUserDataPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getDeviceSecurityPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000683E0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100068468;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100068564;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getDeviceSecurityPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getHasDeviceSecurityPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000686A8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100068730;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006873C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getHasDeviceSecurityPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setNeedsPostProcessing:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068890;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100068918;
  v15[3] = &unk_1000CEB18;
  BOOL v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100068928;
  v13[3] = &unk_1000CE9C0;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v11,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setNeedsPostProcessing:completion:]",  v15,  v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getNeedsPostProcessing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068A64;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100068AEC;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100068AF8;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getNeedsPostProcessing:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPostProcessingShouldBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068C3C;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100068CC4;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100068CD0;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPostProcessingShouldBegin:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setEssentialAssetPromiseUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068E40;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100068EC8;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100068ED4;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getEssentialAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069014;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006909C;
  v13[3] = &unk_1000CEAA0;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006924C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasEssentialAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069390;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069418;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100069424;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasEssentialAssetPromises:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataRestoreShouldBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069568;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000695F0;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000695FC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getUserDataRestoreShouldBegin:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasAppAssetPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069740;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000697C8;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000697D4;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasAppAssetPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInitialODRAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069918;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000699A0;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000699AC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasInitialODRAssetPromises:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInstallOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069AF0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069B78;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100069B84;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasInstallOptions:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInstallOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069CC8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069D50;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100069D5C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getInstallOptions:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasPlaceholderPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069EA0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100069F28;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100069F34;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasPlaceholderPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasUserDataPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A078;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A100;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006A10C;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasUserDataPromise:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setImportance:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A260;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006A2E8;
  v15[3] = &unk_1000CEB40;
  unint64_t v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A2F4;
  v13[3] = &unk_1000CE9C0;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v11,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setImportance:completion:]",  v15,  v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 importanceWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A430;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A4B8;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006A4C4;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:importanceWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 conveyPriorityReplacingExisting:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A61C;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006A6A4;
  v15[3] = &unk_1000CEB68;
  BOOL v17 = a4;
  void v15[4] = self;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A70C;
  v13[3] = &unk_1000CE9C0;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v11,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:conveyPriorityReplacingExisting:withCompletion:]",  v15,  v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 prioritizeWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A848;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A8D0;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006A8DC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:prioritizeWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseDRI:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AA28;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006AAB0;
  v15[3] = &unk_1000CEB40;
  unint64_t v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006AABC;
  v13[3] = &unk_1000CE9C0;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v11,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setAppAssetPromiseDRI:completion:]",  v15,  v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AC24;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v22 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006ACAC;
  v17[3] = &unk_1000CEB90;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006AD10;
  v15[3] = &unk_1000CE9C0;
  id v16 = v20;
  id v13 = v20;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setAppAssetPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInitialODRAssetPromiseUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AE78;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006AF00;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006AF0C;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInstallOptionsPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B074;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v22 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B0FC;
  v17[3] = &unk_1000CEB90;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B160;
  v15[3] = &unk_1000CE9C0;
  id v16 = v20;
  id v13 = v20;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setInstallOptionsPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setIsPaused:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B2AC;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B334;
  v15[3] = &unk_1000CEB18;
  BOOL v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006B344;
  v13[3] = &unk_1000CE9C0;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v11,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setIsPaused:completion:]",  v15,  v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B4AC;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B534;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B540;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPreparationPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B6A8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B730;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B73C;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPreparationPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setUserDataPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B8A4;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B92C;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B938;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setUserDataPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setDeviceSecurityPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BAA0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006BB28;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006BB34;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setDeviceSecurityPromiseUUID:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinatorScopeWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BC70;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006BCF8;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006BD04;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getCoordinatorScopeWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 convertToGloballyScopedWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BE48;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006BED0;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006BEDC;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:convertToGloballyScopedWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderDisposition:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
  if ((sub_10000C398( v10,  (uint64_t)@"com.apple.private.InstallCoordination.overridePlaceholderDisposition") & 1) != 0)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006C0F0;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v12 = v8;
    id v25 = v12;
    dispatch_sync(v11, block);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10006C178;
    v21[3] = &unk_1000CEB40;
    unint64_t v23 = a4;
    id v22 = v9;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10006C184;
    v19[3] = &unk_1000CE9C0;
    id v20 = v22;
    -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:]",  v21,  v19);
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008590C(self);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v17 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:]",  2079LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ is missing entitlement to set placeholder disposition.",  v16,  (uint64_t)v15);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    (*((void (**)(id, void *))v9 + 2))(v9, v18);
  }
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderDispositionWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C2C0;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006C348;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006C354;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPlaceholderDispositionWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setProgressHint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C4C4;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006C54C;
  v17[3] = &unk_1000CEAA0;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006C558;
  v15[3] = &unk_1000CE9C0;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v12,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setProgressHint:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getProgressHintWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C694;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006C71C;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006C728;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getProgressHintWithCompletion:]",  v13,  v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setRemovability:(unint64_t)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006C880;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v22 = v10;
  id v13 = v10;
  dispatch_sync(v12, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006C908;
  v17[3] = &unk_1000CEBB8;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v18 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006C918;
  v15[3] = &unk_1000CE9C0;
  id v16 = v18;
  id v14 = v18;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v13,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setRemovability:byClient:completion:]",  v17,  v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 removabilityWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006CA54;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006CADC;
  v13[3] = &unk_1000CEA50;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006CAE8;
  v11[3] = &unk_1000CE9C0;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]( self,  "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:",  v9,  "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:removabilityWithCompletion:]",  v13,  v11);
}

- (void)_fetchDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSDataPromise)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: DataPromise did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]",  2190LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"DataPromise did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSDataPromise:(id)a3 getPercentComplete:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006CDCC;
  v9[3] = &unk_1000CEBE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006CDD8;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:getPercentComplete:]",  v9,  v7);
}

- (void)_remote_IXSDataPromise:(id)a3 setPercentComplete:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006CE48;
  v4[3] = &unk_1000CEC00;
  *(double *)&v4[4] = a4;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:setPercentComplete:]",  v4,  &stru_1000CEC20);
}

- (void)_remote_IXSDataPromise:(id)a3 getIsComplete:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006CF20;
  v9[3] = &unk_1000CEBE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006CF2C;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:getIsComplete:]",  v9,  v7);
}

- (void)_remote_IXSDataPromise:(id)a3 setIsComplete:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006D010;
  v10[3] = &unk_1000CEC48;
  BOOL v12 = a4;
  id v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006D028;
  v8[3] = &unk_1000CE9C0;
  id v9 = v11;
  id v7 = v11;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:setIsComplete:completion:]",  v10,  v8);
}

- (void)_remote_IXSDataPromise:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006D130;
  v14[3] = &unk_1000CEC70;
  id v15 = a4;
  unint64_t v17 = a5;
  id v16 = a6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006D140;
  v12[3] = &unk_1000CE9C0;
  id v13 = v16;
  id v10 = v16;
  id v11 = v15;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:cancelForReason:client:completion:]",  v14,  v12);
}

- (void)_remote_IXSDataPromise:(id)a3 resetWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006D214;
  v9[3] = &unk_1000CEBE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D220;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:resetWithCompletion:]",  v9,  v7);
}

- (void)_remote_IXSDataPromise:(id)a3 getErrorInfo:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006D2F4;
  v9[3] = &unk_1000CEBE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D300;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:getErrorInfo:]",  v9,  v7);
}

- (void)_remote_IXSDataPromise:(id)a3 preflightWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006D3DC;
  v9[3] = &unk_1000CEBE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D3E8;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSDataPromise:preflightWithCompletion:]",  v9,  v7);
}

- (void)_fetchOwnedDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  BOOL v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSOwnedDataPromise)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: OwnedDataPromise did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]",  2234LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"OwnedDataPromise did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 setStagedPath:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D694;
  v7[3] = &unk_1000CEC98;
  id v8 = a4;
  id v6 = v8;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSOwnedDataPromise:setStagedPath:]",  v7,  &stru_1000CECB8);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 getStagedPath:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006D76C;
  v9[3] = &unk_1000CECE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D778;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSOwnedDataPromise:getStagedPath:]",  v9,  v7);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 setTargetLastPathComponent:(id)a4 withCompletion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006D878;
  v12[3] = &unk_1000CED08;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006D884;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSOwnedDataPromise:setTargetLastPathComponent:withCompletion:]",  v12,  v10);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 getTargetLastPathComponent:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006D958;
  v9[3] = &unk_1000CECE0;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006D964;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]( self,  "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSOwnedDataPromise:getTargetLastPathComponent:]",  v9,  v7);
}

- (void)_fetchPlaceholderForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  BOOL v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSPlaceholder)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Placeholder did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]",  2258LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Placeholder did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSPlaceholder:(id)a3 setMetadataPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006DC6C;
  v12[3] = &unk_1000CED30;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006DCD0;
  v10[3] = &unk_1000CE9C0;
  id v11 = v15;
  id v8 = v15;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setMetadataPromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getMetadataWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006DDA4;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006DDB0;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getMetadataWithCompletion:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setSinfPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006DEB0;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006DEBC;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setSinfPromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getSinfDataWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006DF90;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006DF9C;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getSinfDataWithCompletion:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setLaunchProhibited:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006E080;
  v10[3] = &unk_1000CEDA8;
  BOOL v12 = a4;
  id v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006E090;
  v8[3] = &unk_1000CE9C0;
  id v9 = v11;
  id v7 = v11;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setLaunchProhibited:completion:]",  v10,  v8);
}

- (void)_remote_IXSPlaceholder:(id)a3 getLaunchProhibitedWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006E164;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E170;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getLaunchProhibitedWithCompletion:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setAttributes:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006E270;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006E27C;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setAttributes:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getAttributesWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006E350;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E35C;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getAttributesWithCompletion:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setIconPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006E45C;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006E468;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setIconPromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasIconPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006E53C;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E548;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:hasIconPromise:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getIconPromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006E628;
  v8[3] = &unk_1000CED80;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006E724;
  v6[3] = &unk_1000CE9C0;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( v9,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getIconPromise:]",  v8,  v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setIconResourcesPromiseUUID:(id)a4 withInfoPlistIconContentPromiseUUID:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006E84C;
  v15[3] = &unk_1000CED30;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006E85C;
  v13[3] = &unk_1000CE9C0;
  id v14 = v18;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setIconResourcesPromiseUUID:withInfoPlistIconContentPromiseUUID:completion:]",  v15,  v13);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasIconResourcesPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006E930;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E93C;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:hasIconResourcesPromise:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getIconResourcesPromiseAndInfoPlistContentPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006EA18;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006EA24;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getIconResourcesPromiseAndInfoPlistContentPromise:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setLocalizationPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006EB28;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006EB34;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setLocalizationPromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getLocalizationDictionary:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006EC08;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006EC14;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getLocalizationDictionary:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setEntitlementsPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006ED14;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006ED20;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setEntitlementsPromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasEntitlementsPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006EDF4;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006EE00;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:hasEntitlementsPromise:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getEntitlementsPromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006EEE0;
  v8[3] = &unk_1000CED80;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006EFDC;
  v6[3] = &unk_1000CE9C0;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( v9,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getEntitlementsPromise:]",  v8,  v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setInfoPlistLoctablePromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006F0DC;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006F0E8;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setInfoPlistLoctablePromiseUUID:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasInfoPlistLoctablePromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F1BC;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006F1C8;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:hasInfoPlistLoctablePromise:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getInfoPlistLoctablePromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006F2A8;
  v8[3] = &unk_1000CED80;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006F3A4;
  v6[3] = &unk_1000CE9C0;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( v9,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getInfoPlistLoctablePromise:]",  v8,  v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setAppExtensionPlaceholderPromiseUUIDs:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006F4A4;
  v12[3] = &unk_1000CED80;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006F4B0;
  v10[3] = &unk_1000CE9C0;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:]",  v12,  v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasAppExtensionPlaceholderPromises:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F584;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006F590;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:hasAppExtensionPlaceholderPromises:]",  v9,  v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getAppExtensionPlaceholderPromises:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006F670;
  v8[3] = &unk_1000CED80;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006F820;
  v6[3] = &unk_1000CE9C0;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( v9,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:]",  v8,  v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setConfigurationCompleteWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F8FC;
  v9[3] = &unk_1000CED58;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006F908;
  v7[3] = &unk_1000CE9C0;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]( self,  "_fetchPlaceholderForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPlaceholder:setConfigurationCompleteWithCompletion:]",  v9,  v7);
}

- (void)_fetchPromisedTransferToPathForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSPromisedTransferToPath)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: PromisedTransferToPath did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]",  2417LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"PromisedTransferToPath did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTransferPath:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006FBB4;
  v7[3] = &unk_1000CEDD0;
  id v8 = a4;
  id v6 = v8;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]( self,  "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setTransferPath:]",  v7,  &stru_1000CEDF0);
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setShouldCopy:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006FC24;
  v4[3] = &unk_1000CEE10;
  BOOL v5 = a4;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]( self,  "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setShouldCopy:]",  v4,  &stru_1000CEE30);
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTryDeltaCopy:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006FC94;
  v4[3] = &unk_1000CEE10;
  BOOL v5 = a4;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]( self,  "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setTryDeltaCopy:]",  v4,  &stru_1000CEE50);
}

- (void)_fetchPromisedStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSPromisedStreamingZipTransfer)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: PromisedStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:]",  2437LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"PromisedStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSPromisedStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006FF0C;
  v4[3] = &unk_1000CEE70;
  void v4[4] = a4;
  -[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:]( self,  "_fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPromisedStreamingZipTransfer:setArchiveBytesConsumed:]",  v4,  &stru_1000CEE90);
}

- (void)_fetchPromisedOutOfBandStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class(IXSPromisedOutOfBandStreamingZipTransfer)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v11[2](v11, v15);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136316162;
      id v24 = "-[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2080;
      __int16 v28 = a4;
      __int16 v29 = 2112;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: PromisedOutOfBandStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@ : %@",  buf,  0x34u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v19 = sub_10003556C( (uint64_t)"-[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:]",  2446LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"PromisedOutOfBandStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@",  v18,  (uint64_t)v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v12[2](v12, v20);
  }
}

- (void)_remote_IXSPromisedOutOfBandStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100070184;
  v4[3] = &unk_1000CEEB0;
  void v4[4] = a4;
  -[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:]( self,  "_fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:",  a3,  "-[IXSClientConnection _remote_IXSPromisedOutOfBandStreamingZipTransfer:setArchiveBytesConsumed:]",  v4,  &stru_1000CEED0);
}

- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorDidRegisterForObservationWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100070368;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]( v8,  "_client_coordinatorDidRegisterForObservationWithUUID:",  v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorShouldPrioritizeWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10007062C;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]( v8,  "_client_coordinatorShouldPrioritizeWithUUID:",  v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldResumeWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorShouldResumeWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000708F0;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]( v8,  "_client_coordinatorShouldResumeWithUUID:",  v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldPauseWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorShouldPauseWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100070BB4;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_coordinatorShouldPauseWithUUID:](v8, "_client_coordinatorShouldPauseWithUUID:", v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v7)
    {
      id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v14 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]";
        __int16 v15 = 2112;
        id v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorWithUUID:uuid configuredPromiseDidBeginFulfillment:ident to %@",  buf,  0x16u);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100070E88;
      v12[3] = &unk_1000CEEF8;
      void v12[4] = self;
      id v10 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:v12]);
      -[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]( v10,  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  v6,  a4);
      goto LABEL_8;
    }
  }

  else
  {
    id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v14 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]";
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorShouldBeginRestoringUserDataWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10007114C;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]( v8,  "_client_coordinatorShouldBeginRestoringUserDataWithUUID:",  v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v8)
    {
      id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorShouldBeginPostProcessingWithUUID:uuid forRecordPromise:recordPromise to %@",  buf,  0x16u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10007142C;
      v13[3] = &unk_1000CEEF8;
      void v13[4] = self;
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:v13]);
      -[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]( v11,  "_client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:",  v6,  v7);
      goto LABEL_8;
    }
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v8)
    {
      id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorDidInstallPlaceholderWithUUID:uuid forRecordPromise:recordPromise to %@",  buf,  0x16u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10007170C;
      v13[3] = &unk_1000CEEF8;
      void v13[4] = self;
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:v13]);
      -[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]( v11,  "_client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:",  v6,  v7);
      goto LABEL_8;
    }
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v8)
    {
      id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorDidCompleteSuccessfullyWithUUID:uuid forRecordPromise:recordPromise to %@",  buf,  0x16u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000719EC;
      v13[3] = &unk_1000CEEF8;
      void v13[4] = self;
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:v13]);
      -[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]( v11,  "_client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:",  v6,  v7);
      goto LABEL_8;
    }
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v10)
    {
      id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]";
        __int16 v18 = 2112;
        id v19 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorWithUUID:uuid didCancelWithReason:cancelReason client:client to %@",  buf,  0x16u);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100071CD4;
      v15[3] = &unk_1000CEEF8;
      void v15[4] = self;
      __int16 v13 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v15]);
      -[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]( v13,  "_client_coordinatorWithUUID:didCancelWithReason:client:",  v8,  v9,  a5);
      goto LABEL_8;
    }
  }

  else
  {
    id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]";
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10 = a3;
  if (-[IXSClientConnection interestedInCoordinatorUUID:](self, "interestedInCoordinatorUUID:", v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v11)
    {
      id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v18 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]";
        __int16 v19 = 2112;
        __int16 v20 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_coordinatorWithUUID:uuid didUpdateProgress:percentComplete forPhase:phase overallProgr ess:overallProgress to %@",  buf,  0x16u);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100071FC0;
      v16[3] = &unk_1000CEEF8;
      v16[4] = self;
      id v14 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxyWithErrorHandler:v16]);
      -[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]( v14,  "_client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:",  v10,  a5,  a4,  a6);
      goto LABEL_8;
    }
  }

  else
  {
    __int16 v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]";
      __int16 v19 = 2112;
      __int16 v20 = v14;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in coordinator UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3
{
  id v4 = a3;
  if (-[IXSClientConnection interestedInPromiseUUID:](self, "interestedInPromiseUUID:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v5)
    {
      id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_promiseDidCompleteSuccessfullyWithUUID:uuid to %@",  buf,  0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100072284;
      v10[3] = &unk_1000CEEF8;
      void v10[4] = self;
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v10]);
      -[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]( v8,  "_client_promiseDidCompleteSuccessfullyWithUUID:",  v4);
      goto LABEL_8;
    }
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in promise UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[IXSClientConnection interestedInPromiseUUID:](self, "interestedInPromiseUUID:", v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection xpcConnection](self, "xpcConnection"));
    if (v10)
    {
      id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]";
        __int16 v18 = 2112;
        __int16 v19 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Dispatching _client_promiseWithUUID:uuid didCancelWithReason:cancelReason client:client to %@",  buf,  0x16u);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10007256C;
      v15[3] = &unk_1000CEEF8;
      void v15[4] = self;
      __int16 v13 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v15]);
      -[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]( v13,  "_client_promiseWithUUID:didCancelWithReason:client:",  v8,  v9,  a5);
      goto LABEL_8;
    }
  }

  else
  {
    id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]";
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "%s: Client %@ was not interested in promise UUID %@",  buf,  0x20u);
LABEL_8:
    }
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)fakeClientProcessDeath
{
  return self->_fakeClientProcessDeath;
}

- (void)setFakeClientProcessDeath:(BOOL)a3
{
  self->_fakeClientProcessDeath = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSCountedSet)interestedCoordinatorUUIDs
{
  return self->_interestedCoordinatorUUIDs;
}

- (NSCountedSet)interestedPromiseUUIDs
{
  return self->_interestedPromiseUUIDs;
}

- (void).cxx_destruct
{
}

  ;
}

@end