@interface CKKSSynchronizeOperation
- (CKKSKeychainView)ckks;
- (CKKSOperationDependencies)deps;
- (CKKSSynchronizeOperation)init;
- (CKKSSynchronizeOperation)initWithCKKSKeychainView:(id)a3 dependencies:(id)a4;
- (int)restartCount;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setRestartCount:(int)a3;
@end

@implementation CKKSSynchronizeOperation

- (CKKSSynchronizeOperation)init
{
  return 0LL;
}

- (CKKSSynchronizeOperation)initWithCKKSKeychainView:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CKKSSynchronizeOperation;
  v8 = -[CKKSGroupOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
  }

  return (CKKSSynchronizeOperation *)v9;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation ckks](self, "ckks"));
  if (-[CKKSSynchronizeOperation isCancelled](self, "isCancelled"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    id v7 = sub_1000AA6AC(@"ckksresync", v6);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "CKKSSynchronizeOperation cancelled, quitting",  buf,  2u);
    }
  }

  else
  {
    [v5 setLastSynchronizeOperation:self];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    id v9 = sub_1000AA6AC(@"ckksresync", v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = -[CKKSSynchronizeOperation restartCount](self, "restartCount");
      *(_DWORD *)buf = 67109120;
      unsigned int v59 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Beginning resynchronize (attempt %u)",  buf,  8u);
    }

    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"ckks-resync"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 operationDependencies]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allCKKSManagedViews]);

    id v15 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v52 + 1) + 8 * (void)i) zoneID]);
          [v12 setObject:v5 forKeyedSubscript:v18];
        }

        id v15 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v15);
    }

    v43 = objc_alloc(&OBJC_CLASS___CKKSFetchAllRecordZoneChangesOperation);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v5 container]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudKitClassDependencies]);
    id v20 = [v19 fetchRecordZoneChangesOperationClass];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"resync"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation deps](self, "deps"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activeAccount]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 altDSID]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSynchronizeOperation deps](self, "deps"));
    LOBYTE(v41) = [v25 sendMetric];
    v44 = -[CKKSFetchAllRecordZoneChangesOperation initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:]( v43,  "initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:",  v42,  v20,  v12,  v21,  0LL,  1LL,  oslog,  v24,  v41);

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resync-step%u-fetch",  5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 1));
    -[CKKSGroupOperation setName:](v44, "setName:", v26);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v44);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000995F4;
    v50[3] = &unk_100290518;
    id v27 = v5;
    id v51 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSGroupOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSGroupOperation,  "named:withBlockTakingSelf:",  @"run-incoming",  v50));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resync-step%u-incoming",  5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 2));
    [v28 setName:v29];

    [v28 addSuccessDependency:v44];
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v28);
    v30 = objc_alloc(&OBJC_CLASS___CKKSScanLocalItemsOperation);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v27 operationDependencies]);
    v32 = -[CKKSScanLocalItemsOperation initWithDependencies:intending:errorState:ckoperationGroup:]( v30,  "initWithDependencies:intending:errorState:ckoperationGroup:",  v31,  @"ready",  @"error",  oslog);

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resync-step%u-scan",  5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 3));
    -[CKKSScanLocalItemsOperation setName:](v32, "setName:", v33);

    -[CKKSResultOperation addSuccessDependency:](v32, "addSuccessDependency:", v28);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v32);
    v34 = objc_alloc(&OBJC_CLASS___CKKSOutgoingQueueOperation);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v27 operationDependencies]);
    v36 = -[CKKSOutgoingQueueOperation initWithDependencies:intending:ckErrorState:errorState:]( v34,  "initWithDependencies:intending:ckErrorState:errorState:",  v35,  @"ready",  @"process_outgoing_queue_failed",  @"error");

    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resync-step%u-outgoing",  5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 4));
    -[CKKSGroupOperation setName:](v36, "setName:", v37);

    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v36);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);
    -[CKKSGroupOperation addDependency:](v36, "addDependency:", v32);
    v38 = objc_alloc_init(&OBJC_CLASS___CKKSResultOperation);
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resync-step%u-consider-restart",  5 * -[CKKSSynchronizeOperation restartCount](self, "restartCount") + 5));
    -[CKKSResultOperation setName:](v38, "setName:", v39);

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10009964C;
    v46[3] = &unk_100291A60;
    objc_copyWeak(&v49, &location);
    id v47 = v27;
    v40 = v32;
    v48 = v40;
    -[CKKSResultOperation addExecutionBlock:](v38, "addExecutionBlock:", v46);
    -[CKKSResultOperation addSuccessDependency:](v38, "addSuccessDependency:", v36);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v38);

    objc_destroyWeak(&v49);
  }

  objc_destroyWeak(&location);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->super._startOperation
                                                                                    + 4)));
}

- (void)setCkks:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (int)restartCount
{
  return (int)self->super._startOperation;
}

- (void)setRestartCount:(int)a3
{
  LODWORD(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end