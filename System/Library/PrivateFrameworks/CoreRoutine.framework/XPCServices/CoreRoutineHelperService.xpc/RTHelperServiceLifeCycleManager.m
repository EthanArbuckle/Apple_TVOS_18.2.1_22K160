@interface RTHelperServiceLifeCycleManager
+ (id)createSourceForSignal:(int)a3 withBlock:(id)a4;
- (OS_dispatch_queue)queue;
- (RTHelperServiceLifeCycleManager)init;
- (RTHelperServiceLifeCycleManager)initWithEntitlementProvider:(id)a3 exitHandler:(id)a4 timerManager:(id)a5;
- (RTHelperServiceLifeCycleManager)initWithExitHandler:(id)a3;
- (void)_extendLifetime;
- (void)_handleLifeCycleTimerExpiration;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)serviceListener:(id)a3 didAcceptConnection:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation RTHelperServiceLifeCycleManager

+ (id)createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (RTHelperServiceLifeCycleManager)init
{
  uint64_t v3 = objc_opt_class(self);
  sub_10000A2A8(v3, "initWithExitHandler:");

  return 0LL;
}

- (RTHelperServiceLifeCycleManager)initWithExitHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RTEntitlementProvider helperServiceProtocolEntitlementProvider]( &OBJC_CLASS___RTEntitlementProvider,  "helperServiceProtocolEntitlementProvider"));
  v6 = objc_opt_new(&OBJC_CLASS___RTTimerManager);
  v7 = -[RTHelperServiceLifeCycleManager initWithEntitlementProvider:exitHandler:timerManager:]( self,  "initWithEntitlementProvider:exitHandler:timerManager:",  v5,  v4,  v6);

  return v7;
}

- (RTHelperServiceLifeCycleManager)initWithEntitlementProvider:(id)a3 exitHandler:(id)a4 timerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    id v20 = sub_10000B294(&qword_10002D0A0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: entitlementProvider";
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }

  if (!v10)
  {
    id v23 = sub_10000B294(&qword_10002D0A0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: exitHandler";
    goto LABEL_13;
  }

  if (!v11)
  {
    id v24 = sub_10000B294(&qword_10002D0A0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_13;
    }

- (void)dealloc
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = self->_signals;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  -[RTTimer invalidate](self->_transactionTimer, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RTHelperServiceLifeCycleManager;
  -[RTHelperServiceLifeCycleManager dealloc](&v8, "dealloc");
}

- (void)_handleLifeCycleTimerExpiration
{
  id v3 = sub_10000B294(&qword_10002D0D0);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "life cycle timer of the helper service expired.",  v6,  2u);
  }

  id exitHandler = (void (**)(void))self->_exitHandler;
  if (exitHandler) {
    exitHandler[2]();
  }
}

- (void)_extendLifetime
{
  id v3 = sub_10000B294(&qword_10002D0D0);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "extending the life time of the helper service.",  v5,  2u);
  }

  xpc_transaction_interrupt_clean_exit();
  -[RTTimer suspend](self->_transactionTimer, "suspend");
  -[RTTimer fireAfterDelay:](self->_transactionTimer, "fireAfterDelay:", 120.0);
  -[RTTimer resume](self->_transactionTimer, "resume");
}

- (void)serviceListener:(id)a3 didAcceptConnection:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100015400;
  v8[3] = &unk_1000245D0;
  id v9 = v5;
  __int128 v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  [v10 retainArguments];
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_100015674;
  v32[4] = sub_100015684;
  __int128 v11 = (objc_class *)objc_opt_class(self);
  __int128 v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v13, v15));
  id v33 = (id)os_transaction_create([v16 UTF8String]);

  id v17 = sub_10000B294(&qword_10002D0A0);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v22 = (objc_class *)objc_opt_class(self);
    id v23 = NSStringFromClass(v22);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    v25 = NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138412546;
    id v35 = v24;
    __int16 v36 = 2112;
    v37 = v26;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "creating os_transaction, %@, %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001568C;
  block[3] = &unk_100024AC8;
  BOOL v31 = a5;
  block[4] = self;
  id v28 = v10;
  id v29 = v9;
  id v30 = v32;
  id v20 = v9;
  id v21 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v32, 8);
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