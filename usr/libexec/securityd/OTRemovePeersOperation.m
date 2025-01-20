@interface OTRemovePeersOperation
- (NSOperation)finishedOp;
- (NSSet)peerIDs;
- (OTOperationDependencies)deps;
- (OTRemovePeersOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 peerIDs:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerIDs:(id)a3;
@end

@implementation OTRemovePeersOperation

- (OTRemovePeersOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 peerIDs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OTRemovePeersOperation;
  v15 = -[CKKSGroupOperation init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._internalSuccesses, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a4);
    objc_storeStrong((id *)&v16->super._finishOperation, a5);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
    queue = v16->super._queue;
    v16->super._queue = (OS_dispatch_queue *)v17;
  }

  return v16;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation peerIDs](self, "peerIDs"));
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to remove peers: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTRemovePeersOperation setFinishedOp:](self, "setFinishedOp:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cuttlefishXPCWrapper]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation deps](self, "deps"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTRemovePeersOperation peerIDs](self, "peerIDs"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012CCA8;
  v13[3] = &unk_1002915E0;
  objc_copyWeak(&v14, (id *)buf);
  [v9 distrustPeerIDsWithSpecificUser:v11 peerIDs:v12 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (NSSet)peerIDs
{
  return (NSSet *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setPeerIDs:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end