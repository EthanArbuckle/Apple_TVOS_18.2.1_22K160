@interface PurchaseManager
- (PurchaseManager)init;
- (void)checkStoreQueue:(int64_t)a3;
- (void)processPurchases:(id)a3 failBatchOnError:(BOOL)a4 requestToken:(id)a5 withReplyHandler:(id)a6;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PurchaseManager

- (PurchaseManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PurchaseManager;
  v2 = -[PurchaseManager init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.PurchaseManager.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v7;

    v9 = v2->_taskQueue;
    if (v9) {
      -[NSOperationQueue setName:]( v9->_operationQueue,  "setName:",  @"com.apple.appstored.PurchaseManager.taskQueue");
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    activeBatches = v2->_activeBatches;
    v2->_activeBatches = (NSHashTable *)v10;

    id v12 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned __int8 v14 = [v13 isHRNMode];

    if ((v14 & 1) == 0)
    {
      id v15 = sub_10028ECBC((uint64_t)&OBJC_CLASS___PushService);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_10028EF00((uint64_t)v16, v2, 2LL);
      sub_10028EF00((uint64_t)v16, v2, 11LL);
    }
  }

  return v2;
}

- (void)checkStoreQueue:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001997AC;
  v4[3] = &unk_1003E9E38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)processPurchases:(id)a3 failBatchOnError:(BOOL)a4 requestToken:(id)a5 withReplyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10019A160;
  v16[3] = &unk_1003EA5C0;
  id v17 = v9;
  objc_super v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(dispatchQueue, v16);
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v7 = sub_10025F5A0((void **)a4);
  sub_10019A878((uint64_t)self, (uint64_t)v7, v8);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
}

@end