@interface OTWaitOnPriorityViews
- (OTOperationDependencies)operationDependencies;
- (OTWaitOnPriorityViews)initWithDependencies:(id)a3;
- (void)groupStart;
- (void)setOperationDependencies:(id)a3;
@end

@implementation OTWaitOnPriorityViews

- (OTWaitOnPriorityViews)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OTWaitOnPriorityViews;
  v6 = -[CKKSGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._startOperation, a3);
  }

  return v7;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  v6 = sub_10017B854;
  v7 = &unk_100291A38;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"proceed-after-fetch",  &v4));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setOperationDependencies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end