@interface PLCacheDeleteCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCacheDeleteCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pathManager]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100006664;
  v17[3] = &unk_1000211F0;
  id v9 = v7;
  id v18 = v9;
  id v10 = v5;
  id v19 = v10;
  [v8 performTransactionAndWait:v17];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilities]);
  LODWORD(v8) = [v11 isCentralizedCacheDeleteCapable];

  if ((_DWORD)v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000671C;
    v14[3] = &unk_1000211F0;
    id v15 = v10;
    id v16 = v9;
    [v12 performBlockAndWait:v14];
  }

  return 1;
}

@end