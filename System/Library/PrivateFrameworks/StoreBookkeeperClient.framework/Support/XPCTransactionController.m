@interface XPCTransactionController
+ (id)sharedInstance;
- (BOOL)isInTransaction;
- (NSMutableArray)openTransactions;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)beginTransactionWithIdentifier:(id)a3;
- (void)endTransaction:(id)a3;
@end

@implementation XPCTransactionController

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XPCTransactionController;
  v2 = -[XPCTransactionController init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storebookkeeperd.XPCTransactionController", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = (NSMutableArray *)v5;
  }

  return v2;
}

- (id)beginTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_1000044A8;
  v17 = sub_1000044B8;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000044C0;
  block[3] = &unk_10001CF90;
  v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)isInTransaction
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000446C;
  v5[3] = &unk_10001CFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004434;
  block[3] = &unk_10001CFB8;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)openTransactions
{
  return self->_openTransactions;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000476C;
  block[3] = &unk_10001C900;
  void block[4] = a1;
  if (qword_100023870 != -1) {
    dispatch_once(&qword_100023870, block);
  }
  return (id)qword_100023868;
}

@end