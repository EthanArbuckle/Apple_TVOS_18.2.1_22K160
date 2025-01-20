@interface PLSearchRemoveUnusedGroupsMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLSearchRemoveUnusedGroupsMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 libraryServicesManager]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 searchIndexingEngine]);
  [v5 removeUnusedGroupsFromPSI];

  return 1;
}

@end