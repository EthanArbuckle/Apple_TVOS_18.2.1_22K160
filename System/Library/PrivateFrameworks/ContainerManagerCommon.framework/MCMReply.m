@interface MCMReply
- (BOOL)exitAfterSend;
- (MCMReply)initWithXpcReply:(id)a3 slowWorkloop:(id)a4 fastWorkloop:(id)a5 resultPromise:(id)a6;
- (MCMResultPromise)resultPromise;
- (OS_dispatch_queue)fastWorkloop;
- (OS_dispatch_queue)slowWorkloop;
- (OS_xpc_object)xpcReply;
- (void)_send;
- (void)dispatchSyncToFastWorkloopWithBlock:(id)a3;
- (void)encodeResult:(id)a3;
- (void)handoffToSlowWorkloopforClientIdentity:(id)a3 withBlock:(id)a4;
- (void)invalidate;
- (void)send;
- (void)setExitAfterSend:(BOOL)a3;
@end

@implementation MCMReply

- (MCMReply)initWithXpcReply:(id)a3 slowWorkloop:(id)a4 fastWorkloop:(id)a5 resultPromise:(id)a6
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCMReply;
  v15 = -[MCMReply init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xpcReply, a3);
    objc_storeStrong((id *)&v16->_slowWorkloop, a4);
    objc_storeStrong((id *)&v16->_fastWorkloop, a5);
    objc_storeStrong((id *)&v16->_resultPromise, a6);
    *(_WORD *)&v16->_replySent = 0;
  }

  return v16;
}

- (void)invalidate
{
  self->_replySent = 1;
  xpcReply = self->_xpcReply;
  self->_xpcReply = 0LL;

  slowWorkloop = self->_slowWorkloop;
  self->_slowWorkloop = 0LL;

  fastWorkloop = self->_fastWorkloop;
  self->_fastWorkloop = 0LL;

  resultPromise = self->_resultPromise;
  self->_resultPromise = 0LL;
}

- (void)send
{
  obj = self;
  objc_sync_enter(obj);
  v2 = -[MCMReply resultPromise](obj, "resultPromise");
  int v3 = [v2 complete];

  if (v3 && !obj->_replySent)
  {
    obj->_replySent = 1;
    objc_sync_exit(obj);

    -[MCMReply _send](obj, "_send");
  }

  else
  {
    objc_sync_exit(obj);
  }

- (void)handoffToSlowWorkloopforClientIdentity:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v6->_replySent = 1;
  objc_sync_exit(v6);
  v7 = -[MCMReply xpcReply](v6, "xpcReply");
  v8 = -[MCMReply slowWorkloop](v6, "slowWorkloop");
  id v9 = v5;
  xpc_dictionary_handoff_reply();
}

- (void)encodeResult:(id)a3
{
  id v4 = a3;
  -[MCMReply xpcReply](self, "xpcReply");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeResultOntoReply:");
}

- (void)dispatchSyncToFastWorkloopWithBlock:(id)a3
{
  id v4 = a3;
  -[MCMReply fastWorkloop](self, "fastWorkloop");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_async_and_wait(v5, v4);
}

- (void)_send
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  -[MCMReply xpcReply](v2, "xpcReply");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMReply resultPromise](v2, "resultPromise");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 result];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    _os_crash();
    __break(1u);
  }

  [v5 encodeResultOntoReply:v3];
  -[MCMReply invalidate](v2, "invalidate");

  objc_sync_exit(v2);
  xpc_dictionary_get_remote_connection(v3);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v7, v3);
  if (-[MCMReply exitAfterSend](v2, "exitAfterSend"))
  {
    container_log_handle_for_category();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_188846000, v8, OS_LOG_TYPE_DEFAULT, "EXITING AFTER REPLYING", v9, 2u);
    }

    xpc_connection_send_barrier(v7, &__block_literal_global_8343);
  }
}

- (OS_xpc_object)xpcReply
{
  return self->_xpcReply;
}

- (OS_dispatch_queue)slowWorkloop
{
  return self->_slowWorkloop;
}

- (OS_dispatch_queue)fastWorkloop
{
  return self->_fastWorkloop;
}

- (BOOL)exitAfterSend
{
  return self->_exitAfterSend;
}

- (void)setExitAfterSend:(BOOL)a3
{
  self->_exitAfterSend = a3;
}

- (MCMResultPromise)resultPromise
{
  return self->_resultPromise;
}

- (void).cxx_destruct
{
}

void __17__MCMReply__send__block_invoke()
{
}

uint64_t __61__MCMReply_handoffToSlowWorkloopforClientIdentity_withBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1895CE3A8]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
  return [*(id *)(a1 + 32) _send];
}

@end