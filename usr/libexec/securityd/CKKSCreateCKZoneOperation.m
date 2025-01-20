@interface CKKSCreateCKZoneOperation
- (BOOL)allZoneCreationsSucceeded;
- (BOOL)allZoneSubscriptionsSucceeded;
- (BOOL)networkError;
- (CKKSCreateCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSError)zoneModificationError;
- (NSError)zoneSubscriptionError;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setAllZoneCreationsSucceeded:(BOOL)a3;
- (void)setAllZoneSubscriptionsSucceeded:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNetworkError:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
- (void)setZoneModificationError:(id)a3;
- (void)setZoneSubscriptionError:(id)a3;
@end

@implementation CKKSCreateCKZoneOperation

- (CKKSCreateCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSCreateCKZoneOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 1;
    v13[129] = 1;
    v13[130] = 0;
  }

  return (CKKSCreateCKZoneOperation *)v13;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_100075924;
  v54 = sub_100075934;
  id v55 = (id)0xAAAAAAAAAAAAAAAALL;
  id v55 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x3032000000LL;
  v48[3] = sub_100075924;
  v48[4] = sub_100075934;
  id v49 = (id)0xAAAAAAAAAAAAAAAALL;
  id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10007593C;
  v47[3] = &unk_1002914F8;
  v47[4] = self;
  v47[5] = &v50;
  v47[6] = v48;
  [v6 dispatchSyncWithReadOnlySQLTransaction:v47];

  if ([(id)v51[5] count])
  {
    v7 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    uint64_t v61 = kSecurityRTCFieldNumViews;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [(id)v51[5] count]));
    v62 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    id v14 = [v13 sendMetric];
    objc_super v15 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v7,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v9,  v12,  kSecurityRTCEventNameZoneCreation,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v14);

    id v16 = sub_1000AA6AC(@"ckkszone", 0LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v51[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Asking to create and subscribe to CloudKit zones: %@",  (uint8_t *)&buf,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 overallLaunch]);
    [v20 addEvent:@"zone-create"];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v21 = sub_1000AA6AC(@"ckkszonemodifier", 0LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v51[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Attempting to create zones %@",  (uint8_t *)&buf,  0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 cloudKitClassDependencies]);
    id v26 = objc_msgSend(objc_msgSend(v25, "modifyRecordZonesOperationClass"), "alloc");
    id v27 = [v26 initWithRecordZonesToSave:v51[5] recordZoneIDsToDelete:0];

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x3032000000LL;
    v58 = sub_100075924;
    v59 = sub_100075934;
    id v60 = 0LL;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 configuration]);
    [v28 setIsCloudKitSupportOperation:1];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 ckdatabase]);
    [v27 setDatabase:v30];

    [v27 setName:@"zone-creation-operation"];
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"zone-creation"));
    [v27 setGroup:v31];

    [v27 setQualityOfService:25];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100075C84;
    v44[3] = &unk_1002844F0;
    objc_copyWeak(&v45, &location);
    v44[4] = v48;
    v44[5] = &buf;
    v44[6] = &v50;
    [v27 setModifyRecordZonesCompletionBlock:v44];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 ckdatabase]);
    [v33 addOperation:v27];

    v38 = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472LL;
    v40 = sub_100076108;
    v41 = &unk_100290E58;
    objc_copyWeak(&v43, &location);
    v34 = v15;
    v42 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"determine-next-state",  &v38));
    -[CKKSCreateCKZoneOperation setSetResultStateOperation:]( self,  "setSetResultStateOperation:",  v35,  v38,  v39,  v40,  v41);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    [v36 addNullableDependency:*(void *)(*((void *)&buf + 1) + 40)];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v37);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }

  else
  {
    v34 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation intendedState](self, "intendedState"));
    -[CKKSCreateCKZoneOperation setNextState:](self, "setNextState:", v34);
  }

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);
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

- (BOOL)allZoneCreationsSucceeded
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setAllZoneCreationsSucceeded:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (BOOL)allZoneSubscriptionsSucceeded
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setAllZoneSubscriptionsSucceeded:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (BOOL)networkError
{
  return BYTE2(self->super._startOperation) & 1;
}

- (void)setNetworkError:(BOOL)a3
{
  BYTE2(self->super._startOperation) = a3;
}

- (NSError)zoneModificationError
{
  return (NSError *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setZoneModificationError:(id)a3
{
}

- (NSError)zoneSubscriptionError
{
  return (NSError *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setZoneSubscriptionError:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end