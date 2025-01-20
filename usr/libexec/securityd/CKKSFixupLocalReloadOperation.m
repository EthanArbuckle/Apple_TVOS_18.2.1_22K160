@interface CKKSFixupLocalReloadOperation
- (CKKSFixupLocalReloadOperation)initWithOperationDependencies:(id)a3 fixupNumber:(unint64_t)a4 ckoperationGroup:(id)a5 entering:(id)a6;
- (CKKSOperationDependencies)deps;
- (CKOperationGroup)group;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (unint64_t)fixupNumber;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFixupNumber:(unint64_t)a3;
- (void)setGroup:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSFixupLocalReloadOperation

- (CKKSFixupLocalReloadOperation)initWithOperationDependencies:(id)a3 fixupNumber:(unint64_t)a4 ckoperationGroup:(id)a5 entering:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CKKSFixupLocalReloadOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->super._queue, a3);
    v15->_intendedState = (OctagonStateString *)a4;
    objc_storeStrong((id *)&v15->super._internalSuccesses, a5);
    objc_storeStrong((id *)&v15->super._startOperation, a6);
    objc_storeStrong((id *)&v15->super._finishOperation, @"error");
  }

  return v15;
}

- (id)description
{
  unint64_t v3 = -[CKKSFixupLocalReloadOperation fixupNumber](self, "fixupNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupLocalReloadOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 views]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSFixup:LocalReload (%d)(%@)>",  v3,  v5));

  return v6;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupLocalReloadOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = objc_alloc(&OBJC_CLASS___CKKSReloadAllItemsOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupLocalReloadOperation deps](self, "deps"));
  v7 = -[CKKSReloadAllItemsOperation initWithOperationDependencies:](v5, "initWithOperationDependencies:", v6);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100129B44;
  v10[3] = &unk_100290FC8;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  id v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"local-reload-cleanup",  v10));
  [v9 addNullableDependency:v8];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
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

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setGroup:(id)a3
{
}

- (unint64_t)fixupNumber
{
  return (unint64_t)self->_intendedState;
}

- (void)setFixupNumber:(unint64_t)a3
{
  self->_intendedState = (OctagonStateString *)a3;
}

- (void).cxx_destruct
{
}

@end