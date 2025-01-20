@interface OTModifyUserControllableViewStatusOperation
- (OTModifyUserControllableViewStatusOperation)initWithDependencies:(id)a3 intendedViewStatus:(int)a4 intendedState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)peerMissingState;
- (int)intendedViewStatus;
- (void)groupStart;
- (void)performWithStatus:(int)a3;
- (void)setDeps:(id)a3;
- (void)setIntendedViewStatus:(int)a3;
- (void)setNextState:(id)a3;
- (void)setPeerMissingState:(id)a3;
@end

@implementation OTModifyUserControllableViewStatusOperation

- (OTModifyUserControllableViewStatusOperation)initWithDependencies:(id)a3 intendedViewStatus:(int)a4 intendedState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OTModifyUserControllableViewStatusOperation;
  v17 = -[CKKSGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 148), a3);
    *((_DWORD *)v18 + 32) = a4;
    objc_storeStrong((id *)(v18 + 132), a5);
    objc_storeStrong((id *)(v18 + 156), a6);
    objc_storeStrong((id *)(v18 + 140), a7);
  }

  return (OTModifyUserControllableViewStatusOperation *)v18;
}

- (void)groupStart
{
}

- (void)performWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = sub_10001267C("octagon-ckks");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = -[OTModifyUserControllableViewStatusOperation intendedViewStatus](self, "intendedViewStatus");
    if (v7 >= 4) {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v7));
    }
    else {
      v8 = *(&off_100283840 + v7);
    }
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting user-controllable views to %@",  buf,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cuttlefishXPCWrapper]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002902C;
  v14[3] = &unk_100291330;
  objc_copyWeak(&v15, &location);
  [v10 updateWithSpecificUser:v12 forceRefetch:0 deviceName:0 serialNumber:0 osVersion:0 policyVersion:0 policySecrets:0 syncUserControllab leViews:v13 secureElementIdentity:0 walrusSetting:0 webAccess:0 reply:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 132LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 140LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 148LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OctagonStateString)peerMissingState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 156LL, 1);
}

- (void)setPeerMissingState:(id)a3
{
}

- (int)intendedViewStatus
{
  return (int)self->super._startOperation;
}

- (void)setIntendedViewStatus:(int)a3
{
  LODWORD(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end