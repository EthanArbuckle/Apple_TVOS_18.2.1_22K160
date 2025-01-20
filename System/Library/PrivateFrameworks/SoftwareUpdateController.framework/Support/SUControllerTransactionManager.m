@interface SUControllerTransactionManager
+ (id)sharedManager;
- (NSMutableDictionary)transactions;
- (NSString)pathState;
- (OS_dispatch_queue)queue;
- (SUControllerTransactionManager)init;
- (void)beginTransaction:(id)a3;
- (void)endTransaction:(id)a3;
- (void)setPathState:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactions:(id)a3;
@end

@implementation SUControllerTransactionManager

+ (id)sharedManager
{
  if (qword_100079668 != -1) {
    dispatch_once(&qword_100079668, &stru_100065C18);
  }
  return (id)qword_100079660;
}

- (SUControllerTransactionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUControllerTransactionManager;
  v2 = -[SUControllerTransactionManager init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SUController.transactionManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactions = v2->_transactions;
    v2->_transactions = v5;

    pathState = v2->_pathState;
    v2->_pathState = 0LL;
  }

  return v2;
}

- (void)beginTransaction:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerTransactionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037FA0;
  block[3] = &unk_100065250;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerTransactionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038160;
  block[3] = &unk_100065250;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSString)pathState
{
  return self->_pathState;
}

- (void)setPathState:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end