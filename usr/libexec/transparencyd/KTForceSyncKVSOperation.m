@interface KTForceSyncKVSOperation
- (KTForceSyncKVSOperation)initWithDependencies:(id)a3 timeout:(unint64_t)a4 intendedState:(id)a5 errorState:(id)a6;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (unint64_t)timeout;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation KTForceSyncKVSOperation

- (KTForceSyncKVSOperation)initWithDependencies:(id)a3 timeout:(unint64_t)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KTForceSyncKVSOperation;
  v14 = -[KTGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->super._queue, a3);
    v15->_intendedState = (KTStateString *)a4;
    objc_storeStrong((id *)&v15->super._startOperation, a5);
    objc_storeStrong((id *)&v15->super._finishOperation, a6);
  }

  return v15;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTForceSyncKVSOperation setFinishedOp:](self, "setFinishedOp:", v3);

  if (qword_1002EE810 != -1) {
    dispatch_once(&qword_1002EE810, &stru_100283690);
  }
  v4 = (os_log_s *)qword_1002EE818;
  if (os_log_type_enabled((os_log_t)qword_1002EE818, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "ForceSyncKVS start", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___KTResultOperation);
  id v6 = -[KTResultOperation timeout:](v5, "timeout:", -[KTForceSyncKVSOperation timeout](self, "timeout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTForceSyncKVSOperation finishedOp](self, "finishedOp"));
  -[KTResultOperation addDependency:](v5, "addDependency:", v7);

  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v8 addOperation:v5];

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTForceSyncKVSOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 kvs]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013BA90;
  v11[3] = &unk_1002836F8;
  objc_copyWeak(&v12, (id *)buf);
  [v10 forceSync:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (unint64_t)timeout
{
  return (unint64_t)self->_intendedState;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_intendedState = (KTStateString *)a3;
}

- (void).cxx_destruct
{
}

@end