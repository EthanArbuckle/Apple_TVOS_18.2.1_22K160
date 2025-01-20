@interface PLOutboundSharingFilesCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLOutboundSharingFilesCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathManager]);
  unsigned int v5 = [v4 isDCIM];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryPathManager]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryPathManager"));
    [v6 cleanupOutboundSharingFilesWithExpiryInterval:60.0];
  }

  return 1;
}

@end