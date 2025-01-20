@interface PLReportSystemWorkloadMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLReportSystemWorkloadMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PLReportSystemWorkloadDate"]);

  if (v5)
  {
    [v5 timeIntervalSinceNow];
    BOOL v7 = fabs(v6) > 259200.0;
  }

  else
  {
    BOOL v7 = 1;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager"));
  unsigned int v9 = [v8 isSystemPhotoLibrary];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cplStatus]);

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 initialSyncDate]);
  v13 = (void *)v12;
  if (v9 && v7 && v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    [v14 reportLibrarySizeToDAS];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 setObject:v16 forKey:@"PLReportSystemWorkloadDate"];
  }

  return 1;
}

@end