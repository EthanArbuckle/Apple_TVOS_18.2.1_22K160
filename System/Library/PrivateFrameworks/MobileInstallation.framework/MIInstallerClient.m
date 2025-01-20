@interface MIInstallerClient
+ (id)installerWithAppDictionaryEnumerator:(id)a3;
+ (id)installerWithProgressBlock:(id)a3;
+ (id)installerWithProgressBlock:(id)a3 releaseTerminationAssertionBlock:(id)a4;
- (BOOL)clearTestFlags:(unint64_t)a3 withError:(id *)a4;
- (BOOL)delegatesComplete;
- (BOOL)endTestMode:(id *)a3;
- (BOOL)getTestModeEnabled:(BOOL *)a3 outError:(id *)a4;
- (BOOL)setEligibilityTestOverrides:(id)a3 withError:(id *)a4;
- (BOOL)setTestFlags:(unint64_t)a3 withError:(id *)a4;
- (BOOL)setTestMode:(id *)a3;
- (MIInstallerClient)init;
- (NSError)delegatesCompleteError;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_waitForPendingDelegateMessages;
- (id)appDictionaryEnumBlock;
- (id)progressBlock;
- (id)raiseException;
- (id)releaseTerminationAssertBlock;
- (int)pidForTesting;
- (void)_invalidateObject;
- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 withCompletion:(id)a6;
- (void)addDataSeparatedAppsWithBundleIDs:(id)a3 toPersona:(id)a4 withCompletion:(id)a5;
- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4;
- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7;
- (void)dealloc;
- (void)delegateMessageDeliveryCompleteWithError:(id)a3;
- (void)dieForTesting;
- (void)enumerateAppDictionary:(id)a3 error:(id)a4;
- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4;
- (void)fetchInfoForContainerizedAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)finalizeReference:(id)a3 withCompletion:(id)a4;
- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5;
- (void)getAppMetadataForApp:(id)a3 completion:(id)a4;
- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8;
- (void)invalidateReference:(id)a3 withCompletion:(id)a4;
- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4;
- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4;
- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4;
- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withCompletion:(id)a5;
- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4;
- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)releaseTerminationAssertion;
- (void)removeDataSeparatedAppsWithBundleIDs:(id)a3 fromPersona:(id)a4 withCompletion:(id)a5;
- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6;
- (void)reportProgress:(id)a3;
- (void)revertForLSWithIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)setAppDictionaryEnumBlock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDataSeparatedAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withCompletion:(id)a5;
- (void)setDelegatesComplete:(BOOL)a3;
- (void)setDelegatesCompleteError:(id)a3;
- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6;
- (void)setProgressBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReleaseTerminationAssertBlock:(id)a3;
- (void)setSystemAppMigrationComplete:(id)a3;
- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)systemAppMigratorHasCompleted:(id)a3;
- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8;
- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6;
- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5;
- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)waitForSystemAppMigratorToComplete:(id)a3;
- (void)waitForSystemAppMigratorWithCompletion:(id)a3;
@end

@implementation MIInstallerClient

- (void)_invalidateObject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  _CreateError( (uint64_t)"-[MIInstallerClient _invalidateObject]",  201LL,  (void *)*MEMORY[0x189610040],  131LL,  0LL,  0LL,  @"Connection was invalidated before all delegate messages were received",  v4,  v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MIInstallerClient delegateMessageDeliveryCompleteWithError:](self, "delegateMessageDeliveryCompleteWithError:", v6);
  -[MIInstallerClient setConnection:](self, "setConnection:", 0LL);
  -[MIInstallerClient setProgressBlock:](self, "setProgressBlock:", 0LL);
  -[MIInstallerClient setAppDictionaryEnumBlock:](self, "setAppDictionaryEnumBlock:", 0LL);
}

- (MIInstallerClient)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MIInstallerClient;
  v2 = -[MIInstallerClient init](&v22, sel_init);
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.mobile.installd" options:4096];
    -[MIInstallerClient setConnection:](v2, "setConnection:", v3);

    -[MIInstallerClient connection](v2, "connection");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      MobileInstallerProtocolInterface();
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIInstallerClient connection](v2, "connection");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setRemoteObjectInterface:v5];

      MobileInstallerDelegateProtocolInterface();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MIInstallerClient connection](v2, "connection");
      [v8 setExportedInterface:v7];
      v9 = -[MIInstallerClient connection](v2, "connection");
      [v9 setExportedObject:v2];

      objc_initWeak(&location, v2);
      uint64_t v10 = MEMORY[0x1895F87A8];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __25__MIInstallerClient_init__block_invoke;
      v19[3] = &unk_189E41928;
      objc_copyWeak(&v20, &location);
      v11 = -[MIInstallerClient connection](v2, "connection");
      [v11 setInterruptionHandler:v19];

      v17[0] = v10;
      v17[1] = 3221225472LL;
      v17[2] = __25__MIInstallerClient_init__block_invoke_3;
      v17[3] = &unk_189E41928;
      objc_copyWeak(&v18, &location);
      v12 = -[MIInstallerClient connection](v2, "connection");
      [v12 setInvalidationHandler:v17];

      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v14 = dispatch_queue_create("com.apple.mobileinstallation_client", v13);
      -[MIInstallerClient setQueue:](v2, "setQueue:", v14);

      pthread_cond_init(&v2->_delegatesCompleteCond, 0LL);
      pthread_mutex_init(&v2->_delegatesCompleteCondMutex, 0LL);
      -[MIInstallerClient setDelegatesComplete:](v2, "setDelegatesComplete:", 0LL);
      v15 = -[MIInstallerClient connection](v2, "connection");
      [v15 resume];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

    else
    {

      return 0LL;
    }
  }

  return v2;
}

void __25__MIInstallerClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained queue];
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__MIInstallerClient_init__block_invoke_2;
  block[3] = &unk_189E41A28;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_sync(v2, block);
}

void __25__MIInstallerClient_init__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) delegateMessageDeliveryCompleteWithError:v10];
}

void __25__MIInstallerClient_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained queue];
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__MIInstallerClient_init__block_invoke_4;
  block[3] = &unk_189E41A28;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_sync(v2, block);
}

uint64_t __25__MIInstallerClient_init__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateObject];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIInstallerClient;
  -[MIInstallerClient dealloc](&v3, sel_dealloc);
}

+ (id)installerWithProgressBlock:(id)a3 releaseTerminationAssertionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setProgressBlock:v6];

  [v7 setReleaseTerminationAssertBlock:v5];
  return v7;
}

+ (id)installerWithProgressBlock:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() installerWithProgressBlock:v3 releaseTerminationAssertionBlock:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)installerWithAppDictionaryEnumerator:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAppDictionaryEnumBlock:v3];

  return v4;
}

- (void)reportProgress:(id)a3
{
  id v4 = a3;
  -[MIInstallerClient queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__MIInstallerClient_reportProgress___block_invoke;
  v7[3] = &unk_189E41A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__MIInstallerClient_reportProgress___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) progressBlock];
    id v3 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(void *)(a1 + 40));
  }

- (void)enumerateAppDictionary:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MIInstallerClient queue](self, "queue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__MIInstallerClient_enumerateAppDictionary_error___block_invoke;
  block[3] = &unk_189E41A78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __50__MIInstallerClient_enumerateAppDictionary_error___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) appDictionaryEnumBlock];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }

- (void)delegateMessageDeliveryCompleteWithError:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_delegatesCompleteCondMutex);
  if (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"))
  {
    -[MIInstallerClient setDelegatesComplete:](self, "setDelegatesComplete:", 1LL);
    -[MIInstallerClient setDelegatesCompleteError:](self, "setDelegatesCompleteError:", v4);
  }

  pthread_cond_signal(&self->_delegatesCompleteCond);
  pthread_mutex_unlock(&self->_delegatesCompleteCondMutex);
}

- (void)releaseTerminationAssertion
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__MIInstallerClient_releaseTerminationAssertion__block_invoke;
  block[3] = &unk_189E41A28;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __48__MIInstallerClient_releaseTerminationAssertion__block_invoke(uint64_t a1)
{
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (id)_waitForPendingDelegateMessages
{
  p_delegatesCompleteCondMutex = &self->_delegatesCompleteCondMutex;
  pthread_mutex_lock(&self->_delegatesCompleteCondMutex);
  if (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"))
  {
    do
      pthread_cond_wait(&self->_delegatesCompleteCond, p_delegatesCompleteCondMutex);
    while (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"));
  }

  -[MIInstallerClient delegatesCompleteError](self, "delegatesCompleteError");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 copy];

  pthread_mutex_unlock(p_delegatesCompleteCondMutex);
  return v5;
}

- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke;
  v25[3] = &unk_189E41AC8;
  v25[4] = self;
  id v20 = v14;
  id v26 = v20;
  [v18 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472LL;
  v23[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_3;
  v23[3] = &unk_189E41B18;
  v23[4] = self;
  id v24 = v20;
  id v22 = v20;
  [v21 installURL:v17 identity:v16 targetingDomain:a5 options:v15 returningResultInfo:v8 completion:v23];
}

void __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_3( uint64_t a1,  char a2,  void *a3,  void *a4,  void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v18 = v19;
    MOLogWrite();
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_4;
  block[3] = &unk_189E41AF0;
  id v13 = *(id *)(a1 + 40);
  char v26 = a2;
  id v21 = v9;
  id v22 = v10;
  uint64_t v14 = *(void *)(a1 + 32);
  id v23 = v11;
  uint64_t v24 = v14;
  id v25 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v12, block);
}

uint64_t __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 56) _invalidateObject];
}

- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke;
  v23[3] = &unk_189E41AC8;
  v23[4] = self;
  id v18 = v12;
  id v24 = v18;
  [v16 synchronousRemoteObjectProxyWithErrorHandler:v23];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472LL;
  v21[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_3;
  v21[3] = &unk_189E41B68;
  v21[4] = self;
  id v22 = v18;
  id v20 = v18;
  [v19 stageInstallURL:v15 identity:v14 targetingDomain:a5 withOptions:v13 completion:v21];
}

void __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke;
  v17[3] = &unk_189E41AC8;
  void v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472LL;
  v15[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_3;
  v15[3] = &unk_189E41B18;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 finalizeStagedInstallForUUID:v9 returningResultInfo:v5 completion:v15];
}

void __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_3( uint64_t a1,  char a2,  void *a3,  void *a4,  void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v18 = v19;
    MOLogWrite();
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_4;
  block[3] = &unk_189E41AF0;
  id v13 = *(id *)(a1 + 40);
  char v26 = a2;
  id v21 = v9;
  id v22 = v10;
  uint64_t v14 = *(void *)(a1 + 32);
  id v23 = v11;
  uint64_t v24 = v14;
  id v25 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v12, block);
}

uint64_t __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 56) _invalidateObject];
}

- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_3;
  v13[3] = &unk_189E41BB8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 cancelUpdateForStagedUUID:v7 completion:v13];
}

void __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_3( uint64_t a1,  char a2,  void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) queue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_4;
  block[3] = &unk_189E41B90;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_sync(v6, block);
}

uint64_t __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_3;
  v13[3] = &unk_189E41BE0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 registerPlaceholderForReference:v7 completion:v13];
}

void __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)revertForLSWithIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41B18;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 revertForLSWithIdentifier:v10 withOptions:v9 completion:v16];
}

void __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_3( uint64_t a1,  char a2,  void *a3,  void *a4,  void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v18 = v19;
    MOLogWrite();
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AF0;
  id v13 = *(id *)(a1 + 40);
  char v26 = a2;
  id v21 = v9;
  id v22 = v10;
  uint64_t v14 = *(void *)(a1 + 32);
  id v23 = v11;
  uint64_t v24 = v14;
  id v25 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v12, block);
}

uint64_t __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 56) _invalidateObject];
}

- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41B18;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 revertIdentity:v10 withOptions:v9 completion:v16];
}

void __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_3( uint64_t a1,  char a2,  void *a3,  void *a4,  void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v18 = v19;
    MOLogWrite();
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AF0;
  id v13 = *(id *)(a1 + 40);
  char v26 = a2;
  id v21 = v9;
  id v22 = v10;
  uint64_t v14 = *(void *)(a1 + 32);
  id v23 = v11;
  uint64_t v24 = v14;
  id v25 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v12, block);
}

uint64_t __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 56) _invalidateObject];
}

- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41C08;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 uninstallIdentifiers:v10 withOptions:v9 completion:v16];
}

void __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v11 = v12;
    MOLogWrite();
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v11);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v6;
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 uninstallIdentity:v10 withOptions:v9 completion:v16];
}

void __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)finalizeReference:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_3;
  v13[3] = &unk_189E41BE0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 finalizeReference:v7 completion:v13];
}

void __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke;
  v20[3] = &unk_189E41AC8;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472LL;
  v18[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_3;
  v18[3] = &unk_189E41C30;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 acquireReferenceforInstalledAppWithIdentity:v12 inDomain:a4 matchingInstallSessionID:v11 completion:v18];
}

void __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)invalidateReference:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_3;
  v13[3] = &unk_189E41AC8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 invalidateReference:v7 completion:v13];
}

void __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_3;
  v13[3] = &unk_189E41C58;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 lookupUninstalledWithOptions:v7 completion:v13];
}

void __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 clearUninstalledIdentifiers:v10 withOptions:v9 completion:v16];
}

void __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_3;
  v13[3] = &unk_189E41C58;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 lookupSystemAppStateWithOptions:v7 completion:v13];
}

void __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke;
  v17[3] = &unk_189E41AC8;
  void v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472LL;
  v15[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_3;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 updateSystemAppStateForIdentifier:v9 appState:v5 completion:v15];
}

void __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_3;
  v13[3] = &unk_189E41AC8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 registerContentsForDiskImageAtURL:v7 completion:v13];
}

void __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_3;
  v13[3] = &unk_189E41AC8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 unregisterContentsForDiskImageAtURL:v7 completion:v13];
}

void __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_3;
  v13[3] = &unk_189E41AC8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 enumerateInstalledAppsWithOptions:v7 completion:v13];
}

void __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) _waitForPendingDelegateMessages];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v10;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v9 = v3;
      MOLogWrite();
    }

    id v4 = v3;
  }

  objc_msgSend(*(id *)(a1 + 32), "queue", v9);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v4;
  uint64_t v13 = v7;
  id v14 = v6;
  id v8 = v4;
  dispatch_sync(v5, block);
}

uint64_t __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_3;
  v16[3] = &unk_189E41C08;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 fetchInfoForFrameworkAtURL:v10 options:v9 completion:v16];
}

void __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)fetchInfoForContainerizedAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke;
  v19[3] = &unk_189E41AC8;
  void v19[4] = self;
  id v13 = v8;
  id v20 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v19];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[objc_alloc(MEMORY[0x1896100A0]) initWithBundleID:v10];

  v17[0] = v12;
  v17[1] = 3221225472LL;
  v17[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_3;
  v17[3] = &unk_189E41C08;
  void v17[4] = self;
  id v18 = v13;
  id v16 = v13;
  [v14 fetchInfoForContainerizedAppWithIdentity:v15 inDomain:2 options:v9 completion:v17];
}

void __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[MIInstallerClient connection](self, "connection");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke;
  v21[3] = &unk_189E41AC8;
  v21[4] = self;
  id v16 = v10;
  id v22 = v16;
  [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472LL;
  v19[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_3;
  v19[3] = &unk_189E41C80;
  void v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 updateSinfForIXWithIdentifier:v13 withOptions:v12 sinfData:v11 completion:v19];
}

void __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 updateiTunesMetadataForIXWithIdentifier:v10 metadata:v9 completion:v16];
}

void __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke;
  v23[3] = &unk_189E41AC8;
  v23[4] = self;
  id v18 = v12;
  id v24 = v18;
  [v16 synchronousRemoteObjectProxyWithErrorHandler:v23];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472LL;
  v21[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_3;
  v21[3] = &unk_189E41AC8;
  v21[4] = self;
  id v22 = v18;
  id v20 = v18;
  [v19 registerSafeHarborAtPath:v15 forIdentity:v14 ofType:a5 withOptions:v13 completion:v21];
}

void __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke;
  v20[3] = &unk_189E41AC8;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472LL;
  v18[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_3;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 removeSafeHarborForIdentity:v12 ofType:a4 withOptions:v11 completion:v18];
}

void __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[MIInstallerClient connection](self, "connection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke;
  v20[3] = &unk_189E41AC8;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472LL;
  v18[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_3;
  v18[3] = &unk_189E41C58;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 listSafeHarborsOfType:a3 forPersona:v12 withOptions:v11 completion:v18];
}

void __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_3;
  v16[3] = &unk_189E41C58;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 checkCapabilities:v10 withOptions:v9 completion:v16];
}

void __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke;
  v24[3] = &unk_189E41AC8;
  v24[4] = self;
  id v18 = v13;
  id v25 = v18;
  [v16 synchronousRemoteObjectProxyWithErrorHandler:v24];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472LL;
  v22[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_3;
  v22[3] = &unk_189E41AC8;
  v22[4] = self;
  id v23 = v18;
  id v20 = v18;
  [v19 updatePlaceholderMetadataForApp:v15 installType:a4 failureReason:a5 underlyingError:v14 failureSource:a7 completion:v22];
}

void __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)getAppMetadataForApp:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_3;
  v13[3] = &unk_189E41CA8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 getAppMetadataForApp:v7 completion:v13];
}

void __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)setSystemAppMigrationComplete:(id)a3
{
  id v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke;
  v12[3] = &unk_189E41AC8;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_3;
  v10[3] = &unk_189E41AC8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 setSystemAppMigrationComplete:v10];
}

void __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)systemAppMigratorHasCompleted:(id)a3
{
  id v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke;
  v12[3] = &unk_189E41AC8;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_3;
  v10[3] = &unk_189E41BB8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 systemAppMigratorHasCompleted:v10];
}

void __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) queue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_4;
  block[3] = &unk_189E41B90;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_sync(v6, block);
}

uint64_t __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)waitForSystemAppMigratorToComplete:(id)a3
{
  id v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke;
  v12[3] = &unk_189E41AC8;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_3;
  v10[3] = &unk_189E41AC8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 waitForSystemAppMigratorToComplete:v10];
}

void __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)waitForSystemAppMigratorWithCompletion:(id)a3
{
  id v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke;
  v12[3] = &unk_189E41AC8;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [v5 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472LL;
  v10[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_3;
  v10[3] = &unk_189E41AC8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 waitForSystemAppMigratorToComplete:v10];
}

void __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke;
  v23[3] = &unk_189E41AC8;
  v23[4] = self;
  id v18 = v12;
  id v24 = v18;
  [v16 synchronousRemoteObjectProxyWithErrorHandler:v23];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472LL;
  v21[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_3;
  v21[3] = &unk_189E41AC8;
  v21[4] = self;
  id v22 = v18;
  id v20 = v18;
  [v19 createSerializedPlaceholderForInstalledAppWithBundeID:v15 personaUniqueString:v14 atResultURL:v13 onDevice:v7 withCompletion:v21];
}

void __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke;
  v21[3] = &unk_189E41AC8;
  v21[4] = self;
  id v16 = v10;
  id v22 = v16;
  [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472LL;
  v19[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_3;
  v19[3] = &unk_189E41AC8;
  void v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 setLaunchWarningForApp:v13 withUniqueInstallIdentifier:v12 warningData:v11 completion:v19];
}

void __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)setDataSeparatedAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 setDataSeparatedAppsWithBundleIDs:v10 withPersona:v9 withCompletion:v16];
}

void __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __82__MIInstallerClient_setDataSeparatedAppsWithBundleIDs_withPersona_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)addDataSeparatedAppsWithBundleIDs:(id)a3 toPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 addDataSeparatedAppsWithBundleIDs:v10 toPersona:v9 withCompletion:v16];
}

void __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __80__MIInstallerClient_addDataSeparatedAppsWithBundleIDs_toPersona_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)removeDataSeparatedAppsWithBundleIDs:(id)a3 fromPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke;
  v18[3] = &unk_189E41AC8;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_3;
  v16[3] = &unk_189E41AC8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 removeDataSeparatedAppsWithBundleIDs:v10 fromPersona:v9 withCompletion:v16];
}

void __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_4;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __85__MIInstallerClient_removeDataSeparatedAppsWithBundleIDs_fromPersona_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke;
  v15[3] = &unk_189E41AC8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_3;
  v13[3] = &unk_189E41CD0;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 linkedBundleIDsForAppIdentity:v7 withCompletion:v13];
}

void __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke;
  v17[3] = &unk_189E41AC8;
  void v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472LL;
  v15[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_3;
  v15[3] = &unk_189E41C58;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 referencesForBundleWithIdentifier:v9 inDomain:a4 completion:v15];
}

void __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_2;
  block[3] = &unk_189E41AA0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v4, block);
}

uint64_t __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 40) _invalidateObject];
}

void __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_4;
  block[3] = &unk_189E41B40;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

uint64_t __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 48) _invalidateObject];
}

- (int)pidForTesting
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = -1;
  v2 = -[MIInstallerClient connection](self, "connection");
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__MIInstallerClient_pidForTesting__block_invoke_2;
  v5[3] = &unk_189E41D38;
  v5[4] = &v6;
  [v3 getPidForTestingWithCompletion:v5];

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __34__MIInstallerClient_pidForTesting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v3 = v2;
    MOLogWrite();
    id v2 = v3;
  }
}

uint64_t __34__MIInstallerClient_pidForTesting__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (void)dieForTesting
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 dieForTesting];
}

void __34__MIInstallerClient_dieForTesting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v3 = v2;
    MOLogWrite();
    id v2 = v3;
  }
}

- (id)raiseException
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __35__MIInstallerClient_raiseException__block_invoke;
  v8[3] = &unk_189E41D80;
  v8[4] = &v9;
  [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472LL;
  v7[2] = __35__MIInstallerClient_raiseException__block_invoke_2;
  v7[3] = &unk_189E41D80;
  v7[4] = &v9;
  [v4 raiseExceptionWithCompletion:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __35__MIInstallerClient_raiseException__block_invoke(uint64_t a1, void *a2)
{
}

void __35__MIInstallerClient_raiseException__block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)setTestMode:(id *)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __33__MIInstallerClient_setTestMode___block_invoke;
  v13[3] = &unk_189E41D80;
  v13[4] = &v14;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472LL;
  v12[2] = __33__MIInstallerClient_setTestMode___block_invoke_2;
  v12[3] = &unk_189E41D80;
  v12[4] = &v14;
  [v6 setTestModeWithCompletion:v12];

  id v7 = (void *)v15[5];
  if (!v7) {
    goto LABEL_4;
  }
  [v7 domain];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:*MEMORY[0x189610040]])
  {
    uint64_t v9 = [(id)v15[5] code];

    if (v9 == 157)
    {
LABEL_4:
      BOOL v10 = 1;
      goto LABEL_11;
    }
  }

  else
  {
  }

  BOOL v10 = 0;
  if (a3) {
    *a3 = (id) v15[5];
  }
LABEL_11:
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __33__MIInstallerClient_setTestMode___block_invoke(uint64_t a1, void *a2)
{
}

void __33__MIInstallerClient_setTestMode___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)endTestMode:(id *)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __33__MIInstallerClient_endTestMode___block_invoke;
  v13[3] = &unk_189E41D80;
  v13[4] = &v14;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472LL;
  v12[2] = __33__MIInstallerClient_endTestMode___block_invoke_2;
  v12[3] = &unk_189E41D80;
  v12[4] = &v14;
  [v6 endTestModeWithCompletion:v12];

  id v7 = (void *)v15[5];
  if (!v7) {
    goto LABEL_4;
  }
  [v7 domain];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:*MEMORY[0x189610040]])
  {
    uint64_t v9 = [(id)v15[5] code];

    if (v9 == 157)
    {
LABEL_4:
      BOOL v10 = 1;
      goto LABEL_11;
    }
  }

  else
  {
  }

  BOOL v10 = 0;
  if (a3) {
    *a3 = (id) v15[5];
  }
LABEL_11:
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __33__MIInstallerClient_endTestMode___block_invoke(uint64_t a1, void *a2)
{
}

void __33__MIInstallerClient_endTestMode___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)getTestModeEnabled:(BOOL *)a3 outError:(id *)a4
{
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  -[MIInstallerClient connection](self, "connection");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke;
  v13[3] = &unk_189E41D80;
  v13[4] = &v18;
  [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke_2;
  v12[3] = &unk_189E41DA8;
  v12[4] = &v14;
  void v12[5] = &v18;
  v12[6] = a3;
  [v8 getTestModeWithCompletion:v12];

  int v9 = *((unsigned __int8 *)v15 + 24);
  if (a4 && !*((_BYTE *)v15 + 24))
  {
    *a4 = (id) v19[5];
    int v9 = *((unsigned __int8 *)v15 + 24);
  }

  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke_2(void *a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
    id v6 = v8;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    uint64_t v7 = (_BYTE *)a1[6];
    if (v7) {
      _BYTE *v7 = a2;
    }
  }
}

- (BOOL)setTestFlags:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  char v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __44__MIInstallerClient_setTestFlags_withError___block_invoke;
  v12[3] = &unk_189E41D80;
  v12[4] = &v13;
  [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472LL;
  v11[2] = __44__MIInstallerClient_setTestFlags_withError___block_invoke_2;
  v11[3] = &unk_189E41D80;
  v11[4] = &v13;
  [v8 setTestFlags:a3 withCompletion:v11];

  int v9 = (void *)v14[5];
  if (a4 && v9) {
    *a4 = v9;
  }
  _Block_object_dispose(&v13, 8);

  return v9 == 0LL;
}

void __44__MIInstallerClient_setTestFlags_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __44__MIInstallerClient_setTestFlags_withError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)clearTestFlags:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  char v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __46__MIInstallerClient_clearTestFlags_withError___block_invoke;
  v12[3] = &unk_189E41D80;
  v12[4] = &v13;
  [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472LL;
  v11[2] = __46__MIInstallerClient_clearTestFlags_withError___block_invoke_2;
  v11[3] = &unk_189E41D80;
  v11[4] = &v13;
  [v8 clearTestFlags:a3 withCompletion:v11];

  int v9 = (void *)v14[5];
  if (a4 && v9) {
    *a4 = v9;
  }
  _Block_object_dispose(&v13, 8);

  return v9 == 0LL;
}

void __46__MIInstallerClient_clearTestFlags_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __46__MIInstallerClient_clearTestFlags_withError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)setEligibilityTestOverrides:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  char v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  -[MIInstallerClient connection](self, "connection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke;
  v13[3] = &unk_189E41D80;
  v13[4] = &v14;
  [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472LL;
  v12[2] = __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke_2;
  v12[3] = &unk_189E41D80;
  v12[4] = &v14;
  [v9 setEligibilityTestOverrides:v6 withCompletion:v12];

  BOOL v10 = (void *)v15[5];
  if (a4 && v10) {
    *a4 = v10;
  }
  _Block_object_dispose(&v14, 8);

  return v10 == 0LL;
}

void __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (id)appDictionaryEnumBlock
{
  return self->_appDictionaryEnumBlock;
}

- (void)setAppDictionaryEnumBlock:(id)a3
{
}

- (id)releaseTerminationAssertBlock
{
  return self->_releaseTerminationAssertBlock;
}

- (void)setReleaseTerminationAssertBlock:(id)a3
{
}

- (BOOL)delegatesComplete
{
  return self->_delegatesComplete;
}

- (void)setDelegatesComplete:(BOOL)a3
{
  self->_delegatesComplete = a3;
}

- (NSError)delegatesCompleteError
{
  return self->_delegatesCompleteError;
}

- (void)setDelegatesCompleteError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end