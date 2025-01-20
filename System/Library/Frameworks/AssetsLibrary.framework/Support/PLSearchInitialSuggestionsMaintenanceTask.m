@interface PLSearchInitialSuggestionsMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLSearchInitialSuggestionsMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 libraryServicesManager]);
  id v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 != (id)1)
  {
    uint64_t Log = PLBackendGetLog(v6, v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Initial suggestion generation requested for unsupported library with identifier: %tu. No initial suggestions will be generated.",  (uint8_t *)&v11,  0xCu);
    }
  }

  return v5 == (id)1;
}

@end