@interface TransactionStore
+ (id)globalStore;
+ (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
+ (void)releaseKeepAliveTransaction:(id)a3;
+ (void)takeKeepAliveTransaction:(id)a3;
- (NSCountedSet)activeTransactions;
- (TransactionStore)init;
- (TransactionStore)initWithHoldTime:(double)a3;
- (unint64_t)transactionCount;
- (void)dealloc;
- (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
- (void)releaseKeepAliveTransaction:(id)a3;
- (void)takeKeepAliveTransaction:(id)a3;
@end

@implementation TransactionStore

+ (id)globalStore
{
  if (qword_10032E800 != -1) {
    dispatch_once(&qword_10032E800, &stru_1002E9220);
  }
  return (id)qword_10032E7F8;
}

- (TransactionStore)init
{
  return -[TransactionStore initWithHoldTime:](self, "initWithHoldTime:", 5.0);
}

- (TransactionStore)initWithHoldTime:(double)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TransactionStore;
  v4 = -[TransactionStore init](&v17, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AppStoreFoundation.TransactionStore", v6);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v7;

    v4->_holdTime = (uint64_t)(a3 * 1000000000.0);
    v9 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    transactionCount = v4->_transactionCount;
    v4->_transactionCount = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactionStore = v4->_transactionStore;
    v4->_transactionStore = v11;

    v13 = v4->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100050FC8;
    v15[3] = &unk_1002E9248;
    v16 = v4;
    v16->_handle = os_state_add_handler(v13, v15);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransactionStore;
  -[TransactionStore dealloc](&v3, "dealloc");
}

- (NSCountedSet)activeTransactions
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100051374;
  v10 = sub_100051384;
  id v11 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005138C;
  v5[3] = &unk_1002E6A00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSCountedSet *)v3;
}

- (unint64_t)transactionCount
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100051454;
  v5[3] = &unk_1002E6A00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 globalStore]);
  [v8 holdKeepAliveTransaction:v7 whilePerformingBlock:v6];
}

+ (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 globalStore]);
  [v5 takeKeepAliveTransaction:v4];
}

+ (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 globalStore]);
  [v5 releaseKeepAliveTransaction:v4];
}

- (void)holdKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  -[TransactionStore takeKeepAliveTransaction:](self, "takeKeepAliveTransaction:", v8);
  id v7 = objc_autoreleasePoolPush();
  v6[2](v6);
  objc_autoreleasePoolPop(v7);
  -[TransactionStore releaseKeepAliveTransaction:](self, "releaseKeepAliveTransaction:", v8);
}

- (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051680;
  block[3] = &unk_1002E78B8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0LL, self->_holdTime);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000518A0;
  v8[3] = &unk_1002E78B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, (dispatch_queue_t)dispatchQueue, v8);
}

- (void).cxx_destruct
{
}

@end