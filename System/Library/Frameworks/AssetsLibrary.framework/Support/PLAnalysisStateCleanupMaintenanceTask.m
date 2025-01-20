@interface PLAnalysisStateCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLAnalysisStateCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryBundle](self, "libraryBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryURL]);
  id v12 = 0LL;
  unsigned __int8 v6 = +[PLAssetAnalysisState cleanupInvalidIgnoreUntilDatesInLibraryAtURL:error:]( &OBJC_CLASS___PLAssetAnalysisState,  "cleanupInvalidIgnoreUntilDatesInLibraryAtURL:error:",  v5,  &v12);
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    uint64_t Log = PLAssetAnalysisGetLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error cleaning up invalid ignoreUntilDate values: %@",  buf,  0xCu);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  +[PLAssetAnalysisState removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:library:]( &OBJC_CLASS___PLAssetAnalysisState,  "removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:library:",  1LL,  v10);

  return 1;
}

@end