@interface CKKSDeleteCKZoneOperation
- (BOOL)networkError;
- (CKKSDeleteCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setNetworkError:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSDeleteCKZoneOperation

- (CKKSDeleteCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSDeleteCKZoneOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 0;
  }

  return (CKKSDeleteCKZoneOperation *)v13;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_100057498;
  v43 = sub_1000574A8;
  id v44 = (id)0xAAAAAAAAAAAAAAAALL;
  id v44 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 views]);

  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v36;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)v40[5];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)v9) zoneID]);
        [v10 addObject:v11];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }

    while (v7);
  }

  id v12 = [(id)v40[5] count];
  id v13 = sub_1000AA6AC(@"ckkszone", 0LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      uint64_t v16 = v40[5];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting CloudKit zones: %@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudKitClassDependencies]);
    id v19 = objc_msgSend(objc_msgSend(v18, "modifyRecordZonesOperationClass"), "alloc");
    id v20 = [v19 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v40[5]];

    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 configuration]);
    [v21 setIsCloudKitSupportOperation:1];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 ckdatabase]);
    [v20 setDatabase:v23];

    [v20 setName:@"zone-creation-operation"];
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"zone-creation"));
    [v20 setGroup:v24];

    [v20 setQualityOfService:25];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000574B0;
    v33[3] = &unk_1002841B0;
    objc_copyWeak(&v34, (id *)buf);
    v33[4] = &v39;
    [v20 setModifyRecordZonesCompletionBlock:v33];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 ckdatabase]);
    [v26 addOperation:v20];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100057734;
    v31[3] = &unk_1002850F8;
    objc_copyWeak(&v32, (id *)buf);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"determine-next-state",  v31));
    -[CKKSDeleteCKZoneOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    [v28 addDependency:v20];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);

    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No zones to delete", buf, 2u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation intendedState](self, "intendedState"));
    -[CKKSDeleteCKZoneOperation setNextState:](self, "setNextState:", v30);
  }

  _Block_object_dispose(&v39, 8);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)networkError
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setNetworkError:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end