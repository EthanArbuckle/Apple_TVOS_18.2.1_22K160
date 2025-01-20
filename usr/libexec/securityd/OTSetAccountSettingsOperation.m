@interface OTSetAccountSettingsOperation
- (NSOperation)finishOp;
- (OTAccountSettings)settings;
- (OTOperationDependencies)deps;
- (OTSetAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 settings:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation OTSetAccountSettingsOperation

- (OTSetAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 settings:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTSetAccountSettingsOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._queue, a6);
    objc_storeStrong((id *)&v16->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._finishOperation, a4);
    objc_storeStrong((id *)&v16->super._startOperation, a5);
  }

  return v16;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTSetAccountSettingsOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
  if (v5)
  {
    if (-[OS_dispatch_queue hasWalrus](self->super._queue, "hasWalrus"))
    {
      v6 = (TPPBPeerStableInfoSetting *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_queue walrus](self->super._queue, "walrus"));

      if (v6)
      {
        v6 = objc_alloc_init(&OBJC_CLASS___TPPBPeerStableInfoSetting);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 walrus]);
        -[TPPBPeerStableInfoSetting setValue:](v6, "setValue:", [v8 enabled]);
      }
    }

    else
    {
      v6 = 0LL;
    }

    if (-[OS_dispatch_queue hasWebAccess](self->super._queue, "hasWebAccess"))
    {
      v10 = (TPPBPeerStableInfoSetting *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_queue webAccess](self->super._queue, "webAccess"));

      if (v10)
      {
        v10 = objc_alloc_init(&OBJC_CLASS___TPPBPeerStableInfoSetting);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 webAccess]);
        -[TPPBPeerStableInfoSetting setValue:](v10, "setValue:", [v12 enabled]);
      }
    }

    else
    {
      v10 = 0LL;
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation deps](self, "deps"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cuttlefishXPCWrapper]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10017F654;
    v18[3] = &unk_100291330;
    objc_copyWeak(&v19, &location);
    [v14 updateWithSpecificUser:v16 forceRefetch:0 deviceName:0 serialNumber:0 osVersion:0 policyVersion:0 policySecrets:0 syncUserControll ableViews:0 secureElementIdentity:0 walrusSetting:v6 webAccess:v10 reply:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation intendedState](self, "intendedState"));
    -[OTSetAccountSettingsOperation setNextState:](self, "setNextState:", v9);

    id v17 = (id)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
  }

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (OTAccountSettings)settings
{
  return self->super._queue;
}

- (void)setSettings:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end