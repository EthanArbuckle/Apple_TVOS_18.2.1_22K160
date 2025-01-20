@interface PLCleanupOrphanedProjectPreviewsMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCleanupOrphanedProjectPreviewsMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003D34;
  v8[3] = &unk_1000211F0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performTransaction:v8];

  return 1;
}

@end