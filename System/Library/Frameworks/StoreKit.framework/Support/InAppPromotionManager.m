@interface InAppPromotionManager
+ (id)manager;
- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (InAppPromotionManager)init;
- (id)databaseStore;
- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5;
- (void)removePromotionInfoForBundleID:(id)a3;
@end

@implementation InAppPromotionManager

+ (id)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AFC8;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032ECA8 != -1) {
    dispatch_once(&qword_10032ECA8, block);
  }
  return (id)qword_10032ECA0;
}

- (InAppPromotionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___InAppPromotionManager;
  return -[InAppPromotionManager init](&v3, "init");
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (InAppPromotionDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userDatabase]);
    WeakRetained = -[SQLiteDatabaseStore initWithDatabase:]( objc_alloc(&OBJC_CLASS___InAppPromotionDatabaseStore),  "initWithDatabase:",  v5);
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)removePromotionInfoForBundleID:(id)a3
{
}

- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_10006B224;
  v22 = sub_10006B234;
  id v23 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionManager databaseStore](self, "databaseStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006B23C;
  v14[3] = &unk_1002E9C00;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  v17 = &v18;
  [v10 modifyUsingTransaction:v14];

  if (a5) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return 1;
}

- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_10006B224;
  v30 = sub_10006B234;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10006B224;
  v24 = sub_10006B234;
  id v25 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionManager databaseStore](self, "databaseStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B430;
  v15[3] = &unk_1002E9C28;
  uint64_t v18 = &v20;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v19 = &v26;
  [v10 readUsingSession:v15];

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void).cxx_destruct
{
}

@end