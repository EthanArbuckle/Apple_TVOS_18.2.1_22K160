@interface NSFileAccessSubarbiter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSFileAccessSubarbiter)initWithQueue:(id)a3 listener:(id)a4;
- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4;
- (void)cancelAccessClaimForID:(id)a3;
- (void)dealloc;
- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4;
- (void)revokeAccessClaimForID:(id)a3;
- (void)stopArbitrating;
- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5;
- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7;
@end

@implementation NSFileAccessSubarbiter

- (NSFileAccessSubarbiter)initWithQueue:(id)a3 listener:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSFileAccessSubarbiter;
  v6 = -[NSFileAccessSubarbiter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_realSubarbiter = -[NSFileAccessArbiter initWithQueue:isSubarbiter:listener:]( objc_alloc(&OBJC_CLASS___NSFileAccessArbiter),  "initWithQueue:isSubarbiter:listener:",  a3,  1LL,  a4);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileAccessSubarbiter;
  -[NSFileAccessSubarbiter dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 1;
}

- (void)stopArbitrating
{
}

- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  uint64_t v17 = 0LL;
  [a3 prepareClaimForGrantingWithArbiterQueue:self->_queue];
  queue = (dispatch_queue_s *)self->_queue;
  if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke;
    block[3] = &unk_189CA3210;
    block[4] = self;
    block[5] = a3;
    block[6] = &v12;
    dispatch_sync(queue, block);
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke_2;
    v10[3] = &unk_189C991F0;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(queue, v10);
  }

  v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) claimerWaiter];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

uint64_t __67__NSFileAccessSubarbiter_grantAccessClaim_synchronouslyIfPossible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) _grantAccessClaim:*(void *)(a1 + 40)];
}

- (void)revokeAccessClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__NSFileAccessSubarbiter_revokeAccessClaimForID___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(queue, block);
}

uint64_t __49__NSFileAccessSubarbiter_revokeAccessClaimForID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) _revokeAccessClaimForID:*(void *)(a1 + 40) fromLocal:1];
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
}

- (void)cancelAccessClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__NSFileAccessSubarbiter_cancelAccessClaimForID___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

void __49__NSFileAccessSubarbiter_cancelAccessClaimForID___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "cancelAccessClaimForID:", *(void *)(a1 + 40));
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of cancellation and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5
{
  v12[1] = *MEMORY[0x1895F89C0];
  v12[0] = 0LL;
  uint64_t v10 = 0LL;
  _NSGetFSIDAndFileID((void *)[a5 logicalURL], v12, &v10);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__NSFileAccessSubarbiter_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke;
  block[3] = &unk_189CA4D60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = v10;
  block[9] = v12[0];
  dispatch_async(queue, block);
}

void __69__NSFileAccessSubarbiter_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke(void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend( (id)objc_msgSend(v2, "remoteObjectProxy"),  "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:",  a1[5],  a1[6],  a1[7],  a1[9],  a1[8]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of file movement and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of item disconnection, which is a surprise.",  v5,  2u);
  }

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of item reconnection, which is a surprise.",  v5,  2u);
  }

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __75__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __75__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke( void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend( (id)objc_msgSend(v2, "remoteObjectProxy"),  "writerWithPurposeID:didChangeUbiquityOfItemAtURL:",  a1[5],  a1[6]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of a ubiquity change and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __74__NSFileAccessSubarbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __74__NSFileAccessSubarbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend( (id)objc_msgSend(v2, "remoteObjectProxy"),  "writerWithPurposeID:didChangeSharingOfItemAtURL:",  a1[5],  a1[6]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of a sharing change and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  block[8] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
  block[3] = &unk_189CA47E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  dispatch_async(queue, block);
}

void __86__NSFileAccessSubarbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke( void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend( (id)objc_msgSend(v2, "remoteObjectProxy"),  "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:",  a1[5],  a1[6],  a1[7]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of a ubiquity attribute change and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of item disappearance, which is a surprise.",  v5,  2u);
  }

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of a change, which is a surprise.",  v5,  2u);
  }

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  void block[10] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __99__NSFileAccessSubarbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
  block[3] = &unk_189CA4810;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  void block[9] = a7;
  dispatch_async(queue, block);
}

void __99__NSFileAccessSubarbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke( void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend( (id)objc_msgSend(v2, "remoteObjectProxy"),  "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:",  a1[5],  a1[6],  a1[7],  a1[8],  a1[9]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of file movement and it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __56__NSFileAccessSubarbiter_tiePresenterForID_toItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

void __56__NSFileAccessSubarbiter_tiePresenterForID_toItemAtURL___block_invoke(void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 16) superarbitrationConnection];
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxy"), "tiePresenterForID:toItemAtURL:", a1[5], a1[6]);
  }

  else
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A subarbiter is being notified of file prsenter tying it's not even subarbitrating yet, which is a surprise.",  v4,  2u);
    }
  }

@end