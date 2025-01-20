@interface CKKSProvideKeySetOperation
- (CKKSProvideKeySetOperation)initWithIntendedZoneIDs:(id)a3;
- (NSDictionary)keysets;
- (NSOperation)startDependency;
- (NSSet)intendedZoneIDs;
- (OS_dispatch_queue)queue;
- (void)provideKeySets:(id)a3;
- (void)setKeysets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartDependency:(id)a3;
@end

@implementation CKKSProvideKeySetOperation

- (CKKSProvideKeySetOperation)initWithIntendedZoneIDs:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CKKSProvideKeySetOperation;
  v6 = -[CKKSGroupOperation init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._finishOperation, a3);
    startOperation = v7->super._startOperation;
    v7->super._startOperation = 0LL;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &stru_100284B48));
    internalSuccesses = v7->super._internalSuccesses;
    v7->super._internalSuccesses = (NSMutableArray *)v9;

    -[NSMutableArray setName:](v7->super._internalSuccesses, "setName:", @"key-set-provided");
    dispatch_queue_t v11 = dispatch_queue_create("key-set-queue", 0LL);
    queue = v7->super._queue;
    v7->super._queue = (OS_dispatch_queue *)v11;

    -[CKKSGroupOperation addDependency:](v7, "addDependency:", v7->super._internalSuccesses);
  }

  return v7;
}

- (void)provideKeySets:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSProvideKeySetOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A1D0;
  block[3] = &unk_100290788;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setKeysets:(id)a3
{
}

- (NSSet)intendedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperation)startDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setStartDependency:(id)a3
{
}

- (void).cxx_destruct
{
}

@end