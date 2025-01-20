@interface PLJournalMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (void)coalesceRebuildJournals;
- (void)snapshotComputeCacheJournals;
@end

@implementation PLJournalMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  return 1;
}

- (void)coalesceRebuildJournals
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathManager]);
  unsigned int v5 = +[PLRebuildJournalManager isEnabledWithPathManager:error:]( &OBJC_CLASS___PLRebuildJournalManager,  "isEnabledWithPathManager:error:",  v4,  0LL);

  if (v5)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v8 rebuildJournalManager]);
    LODWORD(v7) = 0.5;
    [v6 coalesceJournalsForPayloadClassIDs:0 withChangeJournalOverThreshold:0 error:v7];
  }

- (void)snapshotComputeCacheJournals
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 computeCacheManager]);

  id v8 = 0LL;
  unsigned __int8 v4 = [v3 snapshotComputeCacheAndBackupIfNeededWithError:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    uint64_t Log = PLBackendGetLog();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Maintenance task: Failed to generate compute cache backup. Error: %@",  buf,  0xCu);
    }
  }
}

@end