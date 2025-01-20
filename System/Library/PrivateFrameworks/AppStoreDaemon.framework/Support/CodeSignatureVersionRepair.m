@interface CodeSignatureVersionRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (LogKey)logKey;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation CodeSignatureVersionRepair

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  return objc_msgSend(a4, "exitReason", a3) == (id)32;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10032223C;
  v41 = sub_10032224C;
  id v42 = 0LL;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100322254;
  v34[3] = &unk_1003F0B80;
  v34[4] = self;
  v36 = &v37;
  v7 = dispatch_semaphore_create(0LL);
  v35 = v7;
  v8 = objc_retainBlock(v34);
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_10032223C;
  v32 = sub_10032224C;
  id v33 = 0LL;
  id v9 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1003223F4;
  v27[3] = &unk_1003EBC50;
  v27[4] = self;
  v27[5] = &v28;
  [v10 readUsingSession:v27];

  if (v29[5])
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___ASDCoastGuard);
    id v12 = [v6 storeItemID];
    if ([v11 isUnrepairableAppWithItemID:v12 externalVersionID:1])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v29[5] evid]);
      unsigned __int8 v14 = objc_msgSend( v11,  "isUnrepairableAppWithItemID:externalVersionID:",  v12,  objc_msgSend(v13, "unsignedLongLongValue"));

      if ((v14 & 1) == 0)
      {
        ((void (*)(void *))v8[2])(v8);
        goto LABEL_7;
      }
    }

    else
    {
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  requestToken = self->_requestToken;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100322438;
  v23[3] = &unk_1003F3520;
  v25 = v8;
  v26 = &v37;
  v24 = v7;
  [v15 reloadFromServerWithRequestToken:requestToken replyHandler:v23];

LABEL_7:
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v38[5])
  {
    repairedBundleIDs = self->_repairedBundleIDs;
    self->_repairedBundleIDs = (NSArray *)&__NSArray0__struct;
  }

  else
  {
    bundleID = self->_bundleID;
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &bundleID,  1LL));
    repairedBundleIDs = self->_repairedBundleIDs;
    self->_repairedBundleIDs = v18;
  }

  v19 = v38;
  if (a4)
  {
    v20 = (void *)v38[5];
    if (v20)
    {
      *a4 = v20;
      v19 = v38;
    }
  }

  BOOL v21 = v19[5] == 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v37, 8);
  return v21;
}

- (int)fairPlayStatus
{
  return 0;
}

- (NSString)repairType
{
  return (NSString *)@"Code Signature Verification";
}

- (ApplicationRepairDelegate)delegate
{
  return (ApplicationRepairDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (LogKey)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSArray)repairedBundleIDs
{
  return self->_repairedBundleIDs;
}

- (void).cxx_destruct
{
}

@end