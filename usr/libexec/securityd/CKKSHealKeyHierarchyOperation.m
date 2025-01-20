@interface CKKSHealKeyHierarchyOperation
- (BOOL)allowFullRefetchResult;
- (BOOL)cloudkitWriteFailures;
- (BOOL)ensureKeyPresent:(id)a3 viewState:(id)a4;
- (BOOL)newCloudKitRecordsWritten;
- (CKKSHealKeyHierarchyOperation)init;
- (CKKSHealKeyHierarchyOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intending:(id)a5 errorState:(id)a6;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSHashTable)ckOperations;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)attemptToHealView:(id)a3 currentTrustStates:(id)a4;
- (void)groupStart;
- (void)setAllowFullRefetchResult:(BOOL)a3;
- (void)setCkOperations:(id)a3;
- (void)setCloudkitWriteFailures:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNewCloudKitRecordsWritten:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSHealKeyHierarchyOperation

- (CKKSHealKeyHierarchyOperation)init
{
  return 0LL;
}

- (CKKSHealKeyHierarchyOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intending:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CKKSHealKeyHierarchyOperation;
  v14 = -[CKKSGroupOperation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[128] = a4;
    objc_storeStrong((id *)(v15 + 134), a5);
    objc_storeStrong((id *)(v15 + 150), a6);
    v15[129] = 0;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    v17 = *(void **)(v15 + 166);
    *(void *)(v15 + 166) = v16;
  }

  return (CKKSHealKeyHierarchyOperation *)v15;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007F338;
  v25[3] = &unk_1002850F8;
  objc_copyWeak(&v26, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"determine-next-state",  v25));
  -[CKKSHealKeyHierarchyOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v5);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 activeManagedViews]);

  v7 = 0LL;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 viewKeyHierarchyState]);
        unsigned __int8 v13 = [v12 isEqualToString:@"unhealthy"];

        if ((v13 & 1) != 0)
        {
          if (!v7)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
            v7 = (void *)objc_claimAutoreleasedReturnValue([v14 currentTrustStates]);
          }

          -[CKKSHealKeyHierarchyOperation attemptToHealView:currentTrustStates:]( self,  "attemptToHealView:currentTrustStates:",  v11,  v7);
        }

        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
          id v17 = sub_1000AA6AC(@"ckksheal", v16);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "View %@ is in okay state; ignoring",
              buf,
              0xCu);
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
    }

    while (v8);
  }

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation setResultStateOperation](self, "setResultStateOperation"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v19);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)attemptToHealView:(id)a3 currentTrustStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v50[0] = kSecurityRTCFieldFullRefetchNeeded;
  v50[1] = kSecurityRTCFieldIsPrioritized;
  v51[0] = &__kCFBooleanFalse;
  v51[1] = &__kCFBooleanFalse;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  id v14 = [v13 sendMetric];
  v15 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v8,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v9,  v12,  kSecurityRTCEventNameHealKeyHierarchy,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v14);

  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x2020000000LL;
  char v47 = 1;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_10007BBEC;
  v44 = sub_10007BBFC;
  v45 = (NSMutableArray *)0xAAAAAAAAAAAAAAAALL;
  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 databaseProvider]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10007BC04;
  v32[3] = &unk_100284678;
  id v26 = v6;
  id v33 = v26;
  v34 = self;
  v18 = v15;
  v35 = v18;
  id v27 = v7;
  id v36 = v27;
  v37 = v46;
  objc_copyWeak(&v39, &location);
  v38 = &v40;
  [v17 dispatchSyncWithSQLTransaction:v32];

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v19 = (id)v41[5];
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      __int128 v22 = 0LL;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v22);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps", v26, v27, (void)v28));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 ckdatabase]);
        [v25 addOperation:v23];

        __int128 v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v49 count:16];
    }

    while (v20);
  }

  objc_destroyWeak(&v39);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(v46, 8);
  objc_destroyWeak(&location);
}

- (BOOL)ensureKeyPresent:(id)a3 viewState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v41 = 0LL;
  unsigned __int8 v8 = [v6 loadKeyMaterialFromKeychain:&v41];
  id v9 = v41;
  if ((v8 & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
    id v13 = sub_1000AA6AC(@"ckksheal", v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v6;
      __int16 v44 = 2112;
      id v45 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Couldn't load key(%@) from keychain. Attempting recovery: %@",  buf,  0x16u);
    }

    id v40 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 unwrapViaKeyHierarchy:&v40]);
    id v16 = v40;

    if (v15)
    {
      id v39 = 0LL;
      unsigned __int8 v17 = [v6 saveKeyMaterialToKeychain:&v39];
      id v18 = v39;
      id v19 = v18;
      if ((v17 & 1) != 0)
      {

        BOOL v10 = 1;
LABEL_25:

        goto LABEL_26;
      }

      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 lockStateTracker]);
      unsigned int v31 = [v30 isLockedError:v19];

      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneName]);
      id v34 = sub_1000AA6AC(@"ckksheal", v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);

      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (v31)
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v6;
          __int16 v44 = 2112;
          id v45 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Couldn't save key(%@) to keychain due to the lock state: %@",  buf,  0x16u);
        }

        v37 = off_100290DF0;
      }

      else
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v6;
          __int16 v44 = 2112;
          id v45 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Couldn't save key(%@) to keychain: %@",  buf,  0x16u);
        }

        v37 = &off_100290E80;
      }

      [v7 setViewKeyHierarchyState:*v37];
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lockStateTracker]);
      unsigned int v22 = [v21 isLockedError:v16];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
      id v25 = sub_1000AA6AC(@"ckksheal", v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v6;
          __int16 v44 = 2112;
          id v45 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Couldn't unwrap key(%@) using key hierarchy due to the lock state: %@",  buf,  0x16u);
        }

        __int128 v28 = off_100290DF0;
      }

      else
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v6;
          __int16 v44 = 2112;
          id v45 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Couldn't unwrap key(%@) using key hierarchy. Keys are broken, quitting: %@",  buf,  0x16u);
        }

        __int128 v28 = &off_100290E80;
      }

      [v7 setViewKeyHierarchyState:*v28];
    }

    BOOL v10 = 0;
    goto LABEL_25;
  }

  BOOL v10 = 1;
LABEL_26:

  return v10;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (BOOL)allowFullRefetchResult
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (BOOL)newCloudKitRecordsWritten
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setNewCloudKitRecordsWritten:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (BOOL)cloudkitWriteFailures
{
  return BYTE2(self->super._startOperation) & 1;
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  BYTE2(self->super._startOperation) = a3;
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setCkOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end