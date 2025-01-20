@interface AMSDTransactionStore
+ (NSCountedSet)transactionsCount;
+ (NSMutableDictionary)transactions;
+ (OS_dispatch_queue)transactionsAccessQueue;
+ (void)flushAllKeepAliveTransactions;
+ (void)releaseKeepAliveTransaction:(id)a3;
+ (void)resetReleaseKeepAliveTransactionTimeDelayValue;
+ (void)takeKeepAliveTransaction:(id)a3;
+ (void)takeKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 postActionQueue:(id)a5 whilePerformingBlockOnQueue:(id)a6 postAction:(id)a7;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingBlock:(id)a5;
+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingSyncBlock:(id)a5;
@end

@implementation AMSDTransactionStore

+ (NSMutableDictionary)transactions
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  dispatch_assert_queue_V2(v2);

  if (qword_1000F2118 != -1) {
    dispatch_once(&qword_1000F2118, &stru_1000D7E30);
  }
  return (NSMutableDictionary *)(id)qword_1000F2120;
}

+ (OS_dispatch_queue)transactionsAccessQueue
{
  if (qword_1000F2128 != -1) {
    dispatch_once(&qword_1000F2128, &stru_1000D7E50);
  }
  return (OS_dispatch_queue *)(id)qword_1000F2130;
}

+ (NSCountedSet)transactionsCount
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  dispatch_assert_queue_V2(v2);

  if (qword_1000F2138 != -1) {
    dispatch_once(&qword_1000F2138, &stru_1000D7E70);
  }
  return (NSCountedSet *)(id)qword_1000F2140;
}

+ (void)flushAllKeepAliveTransactions
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045604;
  block[3] = &unk_1000D6CC0;
  block[4] = a1;
  dispatch_sync(v3, block);
}

+ (void)resetReleaseKeepAliveTransactionTimeDelayValue
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  dispatch_sync(v2, &stru_1000D7EB0);
}

+ (void)releaseKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v6 = AMSLogKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045A94;
  block[3] = &unk_1000D5F70;
  id v21 = a1;
  id v9 = v4;
  id v20 = v9;
  dispatch_sync(v8, block);

  objc_initWeak(&location, a1);
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(*(double *)&qword_1000EFCD8 * 1000000000.0));
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100045AD4;
  v14[3] = &unk_1000D7ED8;
  objc_copyWeak(&v17, &location);
  id v15 = v7;
  id v16 = v9;
  id v12 = v9;
  id v13 = v7;
  dispatch_after(v10, v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

+ (void)takeKeepAliveTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 transactionsAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045CE4;
  block[3] = &unk_1000D5F70;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (void)takeKeepAliveTransaction:(id)a3 whilePerformingBlock:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  [a1 takeKeepAliveTransaction:v8];
  v7 = objc_autoreleasePoolPush();
  v6[2](v6);
  objc_autoreleasePoolPop(v7);
  [a1 releaseKeepAliveTransaction:v8];
}

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_time_t v10 = (dispatch_queue_s *)a4;
  id v11 = [a1 takeKeepAliveTransaction:v8];
  uint64_t v13 = AMSLogKey(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_initWeak(&location, a1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004600C;
  block[3] = &unk_1000D7F00;
  objc_copyWeak(&v22, &location);
  id v20 = v8;
  id v21 = v9;
  id v19 = v14;
  id v15 = v8;
  id v16 = v9;
  id v17 = v14;
  dispatch_async(v10, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 postActionQueue:(id)a5 whilePerformingBlockOnQueue:(id)a6 postAction:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (dispatch_queue_s *)a4;
  id v17 = [a1 takeKeepAliveTransaction:v12];
  uint64_t v19 = AMSLogKey(v17, v18);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000461B8;
  v25[3] = &unk_1000D7F50;
  id v26 = (id)objc_claimAutoreleasedReturnValue(v19);
  id v27 = v13;
  id v30 = v15;
  id v31 = a1;
  id v28 = v12;
  id v29 = v14;
  id v20 = v12;
  id v21 = v15;
  id v22 = v13;
  id v23 = v14;
  id v24 = v26;
  dispatch_async(v16, v25);
}

+ (void)takeKeepAliveTransaction:(id)a3 withQueue:(id)a4 whilePerformingSyncBlock:(id)a5
{
  id v8 = a5;
  id v9 = (dispatch_queue_s *)a4;
  id v10 = a3;
  id v11 = [a1 takeKeepAliveTransaction:v10];
  uint64_t v13 = AMSLogKey(v11, v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000463B4;
  block[3] = &unk_1000D6208;
  id v17 = (id)objc_claimAutoreleasedReturnValue(v13);
  id v18 = v8;
  id v14 = v8;
  id v15 = v17;
  dispatch_sync(v9, block);

  [a1 releaseKeepAliveTransaction:v10];
}

@end