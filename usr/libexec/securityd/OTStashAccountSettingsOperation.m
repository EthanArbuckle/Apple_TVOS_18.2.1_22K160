@interface OTStashAccountSettingsOperation
+ (void)performWithAccountWide:(BOOL)a3 forceFetch:(BOOL)a4 cuttlefishXPCWrapper:(id)a5 activeAccount:(id)a6 containerName:(id)a7 contextID:(id)a8 reply:(id)a9;
- (BOOL)accountWide;
- (BOOL)forceFetch;
- (NSOperation)finishedOp;
- (OTAccountSettingsContainer)accountSettings;
- (OTOperationDependencies)deps;
- (OTStashAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 accountSettings:(id)a6 accountWide:(BOOL)a7 forceFetch:(BOOL)a8;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setAccountSettings:(id)a3;
- (void)setAccountWide:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setForceFetch:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTStashAccountSettingsOperation

- (OTStashAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 accountSettings:(id)a6 accountWide:(BOOL)a7 forceFetch:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___OTStashAccountSettingsOperation;
  v18 = -[CKKSGroupOperation init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a7;
    v19[129] = a8;
  }

  return (OTStashAccountSettingsOperation *)v19;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stashing account settings", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTStashAccountSettingsOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  unsigned int v16 = -[OTStashAccountSettingsOperation accountWide](self, "accountWide");
  unsigned int v15 = -[OTStashAccountSettingsOperation forceFetch](self, "forceFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cuttlefishXPCWrapper]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeAccount]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 containerName]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contextID]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000872B8;
  v17[3] = &unk_100284780;
  objc_copyWeak(&v18, (id *)buf);
  +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:]( &OBJC_CLASS___OTStashAccountSettingsOperation,  "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:",  v16,  v15,  v8,  v10,  v12,  v14,  v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OTAccountSettingsContainer)accountSettings
{
  return (OTAccountSettingsContainer *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (BOOL)accountWide
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setAccountWide:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (BOOL)forceFetch
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setForceFetch:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

+ (void)performWithAccountWide:(BOOL)a3 forceFetch:(BOOL)a4 cuttlefishXPCWrapper:(id)a5 activeAccount:(id)a6 containerName:(id)a7 contextID:(id)a8 reply:(id)a9
{
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  if (v13)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100087588;
    v24[3] = &unk_100284710;
    id v17 = &v25;
    id v25 = v14;
    id v18 = &v26;
    id v26 = v15;
    v19 = &v27;
    id v27 = v16;
    [a5 fetchAccountSettingsWithSpecificUser:a6 forceFetch:v12 reply:v24];
  }

  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10008782C;
    v20[3] = &unk_100284738;
    id v17 = &v21;
    id v21 = v14;
    id v18 = &v22;
    id v22 = v15;
    v19 = &v23;
    id v23 = v16;
    [a5 fetchTrustStateWithSpecificUser:a6 reply:v20];
  }
}

@end