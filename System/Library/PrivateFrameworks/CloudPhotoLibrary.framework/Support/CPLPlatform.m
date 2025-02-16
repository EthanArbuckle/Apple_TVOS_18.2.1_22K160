@interface CPLPlatform
+ (void)setDirectClientImplementationForPlatform:(id)a3;
+ (void)setPrequeliteStoreImplementationForPlatform:(id)a3;
@end

@implementation CPLPlatform

+ (void)setDirectClientImplementationForPlatform:(id)a3
{
  id v6 = a3;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___CPLDirectLibraryManager);
  [v6 setPlatformImplementation:v3 forClass:objc_opt_class(CPLLibraryManager)];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CPLDirectPushChangeSession);
  [v6 setPlatformImplementation:v4 forClass:objc_opt_class(CPLPushChangeSession)];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CPLDirectPullChangeSession);
  [v6 setPlatformImplementation:v5 forClass:objc_opt_class(CPLPullChangeSession)];
}

+ (void)setPrequeliteStoreImplementationForPlatform:(id)a3
{
  id v27 = a3;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___CPLBaseSyncManager);
  [v27 setPlatformImplementation:v3 forClass:objc_opt_class(CPLEngineSyncManager)];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CPLBaseEngineLibrary);
  [v27 setPlatformImplementation:v4 forClass:objc_opt_class(CPLEngineLibrary)];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CPLBaseScheduler);
  [v27 setPlatformImplementation:v5 forClass:objc_opt_class(CPLEngineScheduler)];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteStore);
  [v27 setPlatformImplementation:v6 forClass:objc_opt_class(CPLEngineStore)];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteScopeStorage);
  [v27 setPlatformImplementation:v7 forClass:objc_opt_class(CPLEngineScopeStorage)];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteScopeCleanupTasks);
  [v27 setPlatformImplementation:v8 forClass:objc_opt_class(CPLEngineScopeCleanupTasks)];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteStorage);
  [v27 setPlatformImplementation:v9 forClass:objc_opt_class(CPLEngineStorage)];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteChangePipe);
  [v27 setPlatformImplementation:v10 forClass:objc_opt_class(CPLEngineChangePipe)];
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteRevertRecords);
  [v27 setPlatformImplementation:v11 forClass:objc_opt_class(CPLEngineRevertRecords)];
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___CPLPrequelitePushRepository);
  [v27 setPlatformImplementation:v12 forClass:objc_opt_class(CPLEnginePushRepository)];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteIDMapping);
  [v27 setPlatformImplementation:v13 forClass:objc_opt_class(CPLEngineIDMapping)];
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteClientCache);
  [v27 setPlatformImplementation:v14 forClass:objc_opt_class(CPLPrequeliteClientCacheMigrator)];
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteCloudCache);
  [v27 setPlatformImplementation:v15 forClass:objc_opt_class(CPLEngineCloudCache)];
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteResourceStorage);
  [v27 setPlatformImplementation:v16 forClass:objc_opt_class(CPLEngineResourceStorage)];
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteOutgoingResources);
  [v27 setPlatformImplementation:v17 forClass:objc_opt_class(CPLEngineOutgoingResources)];
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___CPLBucketFileStorage);
  [v27 setPlatformImplementation:v18 forClass:objc_opt_class(CPLEngineFileStorage)];
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteTransientRepository);
  [v27 setPlatformImplementation:v19 forClass:objc_opt_class(CPLEngineTransientRepository)];
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteResourceDownloadQueue);
  [v27 setPlatformImplementation:v20 forClass:objc_opt_class(CPLEngineResourceDownloadQueue)];
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteRemappedRecords);
  [v27 setPlatformImplementation:v21 forClass:objc_opt_class(CPLEngineRemappedRecords)];
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteQuarantinedRecords);
  [v27 setPlatformImplementation:v22 forClass:objc_opt_class(CPLEngineQuarantinedRecords)];
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteStatusCenter);
  [v27 setPlatformImplementation:v23 forClass:objc_opt_class(CPLEngineStatusCenter)];
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___CPLPrequelitePendingRecordChecks);
  [v27 setPlatformImplementation:v24 forClass:objc_opt_class(CPLEnginePendingRecordChecks)];
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteIgnoredRecords);
  [v27 setPlatformImplementation:v25 forClass:objc_opt_class(CPLEngineIgnoredRecords)];
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteRecordComputeStatePushQueue);
  [v27 setPlatformImplementation:v26 forClass:objc_opt_class(CPLEngineRecordComputeStatePushQueue)];
}

@end