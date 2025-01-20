@interface CPLPrequeliteWriteTransactionBlocker
- (CPLPrequeliteWriteTransactionBlocker)initWithBypassQueue:(id)a3 blockedQueue:(id)a4;
- (OS_dispatch_queue)blockedQueue;
- (OS_dispatch_queue)bypassQueue;
@end

@implementation CPLPrequeliteWriteTransactionBlocker

- (CPLPrequeliteWriteTransactionBlocker)initWithBypassQueue:(id)a3 blockedQueue:(id)a4
{
  id v7 = a3;
  v8 = (dispatch_queue_s *)a4;
  dispatch_assert_queue_V2(v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10015E978;
  v16[3] = &unk_10023DC70;
  v9 = v8;
  v17 = v9;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLPrequeliteWriteTransactionBlocker;
  v10 = -[CPLPrequeliteWriteTransactionBlocker initWithUnblockBlock:](&v15, "initWithUnblockBlock:", v16);
  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10015409C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Blocking write queue", v14, 2u);
      }
    }

    dispatch_suspend(v9);
    objc_storeStrong((id *)&v10->_bypassQueue, a3);
  }

  return v10;
}

- (OS_dispatch_queue)bypassQueue
{
  return self->_bypassQueue;
}

- (OS_dispatch_queue)blockedQueue
{
  return self->_blockedQueue;
}

- (void).cxx_destruct
{
}

@end