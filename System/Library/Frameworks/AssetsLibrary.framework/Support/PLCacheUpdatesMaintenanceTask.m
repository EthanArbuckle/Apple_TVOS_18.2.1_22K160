@interface PLCacheUpdatesMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCacheUpdatesMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  id v9 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100002984;
  v10[3] = &unk_1000211C8;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002AE8;
  v8[3] = &unk_1000211F0;
  v8[4] = self;
  id v6 = v4;
  [v5 performTransactionAndWait:v10 completionHandler:v8];

  return 1;
}

@end