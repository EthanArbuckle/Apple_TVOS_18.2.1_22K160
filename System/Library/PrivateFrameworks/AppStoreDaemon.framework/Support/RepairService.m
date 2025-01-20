@interface RepairService
- (RepairService)init;
- (void)refreshKeybagWithReplyHandler:(id)a3;
- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4;
@end

@implementation RepairService

- (RepairService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RepairService;
  v2 = -[RepairService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.RepairService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F86C8;
  block[3] = &unk_1003EA390;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(dispatchQueue, v14);
}

- (void)refreshKeybagWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002F88B8;
  v11[3] = &unk_1003E9FF8;
  id v12 = v6;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
  dispatch_async(dispatchQueue, v10);
}

- (void).cxx_destruct
{
}

@end