@interface PLMomentGenerationMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLMomentGenerationMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 momentGenerationDataManager]);

  [v6 runPeriodicMaintenanceTasks:50 withTransaction:v4];
  return 1;
}

@end