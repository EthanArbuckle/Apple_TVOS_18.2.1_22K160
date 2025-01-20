@interface OperationState
- (BOOL)begin;
- (BOOL)cancelled;
- (BOOL)operationCancelled;
- (OS_dispatch_queue)queue;
- (OperationState)init;
- (int)operationRefcount;
- (void)cancel;
- (void)end;
- (void)setOperationCancelled:(BOOL)a3;
- (void)setOperationRefcount:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation OperationState

- (OperationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OperationState;
  v2 = -[OperationState init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.cache_delete_services_operation_queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (BOOL)cancelled
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[OperationState queue](self, "queue");
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __27__OperationState_cancelled__block_invoke;
  v5[3] = &unk_18A066718;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __27__OperationState_cancelled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) operationCancelled];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    return [*(id *)(a1 + 32) setOperationCancelled:0];
  }

  return result;
}

- (void)cancel
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __24__OperationState_cancel__block_invoke;
  block[3] = &unk_18A0661C8;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __24__OperationState_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOperationCancelled:1];
}

- (BOOL)begin
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  -[OperationState queue](self, "queue");
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __23__OperationState_begin__block_invoke;
  v5[3] = &unk_18A066718;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __23__OperationState_begin__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) operationCancelled]) {
    return objc_msgSend( *(id *)(a1 + 32),  "setOperationRefcount:",  objc_msgSend(*(id *)(a1 + 32), "operationRefcount") + 1);
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return [*(id *)(a1 + 32) setOperationCancelled:0];
}

- (void)end
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __21__OperationState_end__block_invoke;
  block[3] = &unk_18A0661C8;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __21__OperationState_end__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) operationRefcount];
  if ((result & 0x80000000) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl( &dword_1874E4000,  v3,  OS_LOG_TYPE_ERROR,  "UNBALANCED: operation refcount went below zero, resetting to zero",  v4,  2u);
    }

    return [*(id *)(a1 + 32) setOperationRefcount:0];
  }

  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)operationCancelled
{
  return self->_operationCancelled;
}

- (void)setOperationCancelled:(BOOL)a3
{
  self->_operationCancelled = a3;
}

- (int)operationRefcount
{
  return self->_operationRefcount;
}

- (void)setOperationRefcount:(int)a3
{
  self->_operationRefcount = a3;
}

- (void).cxx_destruct
{
}

@end