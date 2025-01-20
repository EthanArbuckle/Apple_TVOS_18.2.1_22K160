@interface PLExpiredCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLExpiredCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  [v4 deleteExpiredTrashedAssetsAndAlbums];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  [v5 deleteExpiredTrashedResources];

  return 1;
}

@end