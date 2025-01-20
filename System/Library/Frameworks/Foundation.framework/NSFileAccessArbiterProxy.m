@interface NSFileAccessArbiterProxy
+ (id)_fileReactorDebuggingInformation;
+ (id)_idForReactor:(id)a3;
+ (id)_willBeginOperationForReactor:(id)a3 withDescription:(id)a4;
+ (void)_accessPresenterOperationRecordsUsingBlock:(id)a3;
- (BOOL)itemHasPresentersAtURL:(id)a3;
- (NSFileAccessArbiterProxy)initWithServer:(id)a3 queue:(id)a4;
- (id)_onqueue_filePresenters;
- (id)_onqueue_fileProviders;
- (id)filePresenters;
- (id)fileProviders;
- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4;
- (id)idForFileReactor:(id)a3;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (void)addFilePresenter:(id)a3;
- (void)addFileProvider:(id)a3 completionHandler:(id)a4;
- (void)cancelAccessClaimForID:(id)a3;
- (void)dealloc;
- (void)getDebugInfoWithCompletionHandler:(id)a3;
- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4;
- (void)handleCanceledServer;
- (void)performBarrier;
- (void)performBarrierAsync:(id)a3;
- (void)removeFilePresenter:(id)a3;
- (void)removeFileProvider:(id)a3;
- (void)revokeAccessClaimForID:(id)a3;
- (void)revokeSubarbitrationClaimForID:(id)a3;
- (void)setAutomaticFileProviderReregistrationDisabled:(BOOL)a3;
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

@implementation NSFileAccessArbiterProxy

- (NSFileAccessArbiterProxy)initWithServer:(id)a3 queue:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSFileAccessArbiterProxy;
  v6 = -[NSFileAccessArbiterProxy init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSXPCConnection *)a3;
    uint64_t v8 = MEMORY[0x1895F87A8];
    v6->_server = v7;
    v10[0] = v8;
    v10[1] = 3221225472LL;
    v10[2] = __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke;
    v10[3] = &unk_189C9A030;
    v10[4] = v6;
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v10);
    -[NSXPCConnection setDelegate:](v6->_server, "setDelegate:", v6);
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }

  return v6;
}

void __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  if ([v2 count])
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to filecoordinationd interrupted. Attempting to re-add presenters",  v16,  2u);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(a1 + 32) addFilePresenter:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }

        uint64_t v5 = [v2 countByEnumeratingWithState:&v23 objects:v22 count:16];
      }

      while (v5);
    }
  }

  uint64_t v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  if ([v8 count])
  {
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
    v10 = (os_log_s *)_NSFCLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Connection to filecoordinationd interrupted. Client has providers, but not re-adding them because _setAutomati cFileProviderReregistrationDisabled:YES was called.",  v16,  2u);
      }
    }

    else
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Connection to filecoordinationd interrupted. Attempting to re-add providers",  v16,  2u);
      }

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t j = 0LL; j != v13; ++j)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(a1 + 32) addFileProvider:*(void *)(*((void *)&v18 + 1) + 8 * j) completionHandler:&__block_literal_global_303];
          }

          uint64_t v13 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
        }

        while (v13);
      }
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  dispatch_release((dispatch_object_t)self->_queue);
  -[NSXPCConnection setDelegate:](self->_server, "setDelegate:", 0LL);
  -[NSXPCConnection invalidate](self->_server, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileAccessArbiterProxy;
  -[NSFileAccessArbiterProxy dealloc](&v3, sel_dealloc);
}

+ (id)_idForReactor:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)[a3 _fileReactorID];
  }
  AssociatedObject = objc_getAssociatedObject(a3, "NSFileReactorID");
  if (!AssociatedObject)
  {
    uint64_t v6 = CFUUIDCreate(0LL);
    AssociatedObject = (void *)CFUUIDCreateString(0LL, v6);
    objc_setAssociatedObject(a3, "NSFileReactorID", AssociatedObject, (void *)0x301);

    CFRelease(v6);
  }

  return AssociatedObject;
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  uint64_t v6 = a5;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v6 = _secureCodingScreenedError((NSError *)a5);
  }
  uint64_t v7 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([a5 isMemberOfClass:v7] & 1) == 0) {
    return (id)objc_msgSend( objc_alloc(MEMORY[0x189604030]),  "initWithString:",  objc_msgSend(a5, "absoluteString"));
  }
  else {
    return v6;
  }
}

- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  block[6] = *MEMORY[0x1895F89C0];
  [a3 prepareClaimForGrantingWithArbiterQueue:self->_queue];
  if (v4) {
    uint64_t v7 = (void *)[a3 claimerWaiter];
  }
  else {
    uint64_t v7 = 0LL;
  }
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
  return v7;
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v0 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl( &dword_182EB1000,  v0,  OS_LOG_TYPE_ERROR,  "A process invoked one of the -[NSFileCoordinator coordinate...] methods but filecoordinationd crashed. Returning an error.",  v2,  2u);
  }

  return 1LL;
}

- (void)revokeAccessClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "remoteObjectProxy"),  "revokeAccessClaimForID:",  *(void *)(a1 + 40));
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v0 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl( &dword_182EB1000,  v0,  OS_LOG_TYPE_ERROR,  "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAcce ssor:] but filecoordinationd crashed. Invoking the batchAccessor anyway.",  v2,  2u);
  }

  return 0LL;
}

- (void)revokeSubarbitrationClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "remoteObjectProxy"),  "revokeSubarbitrationClaimForID:",  *(void *)(a1 + 40));
}

- (void)cancelAccessClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "remoteObjectProxy"),  "cancelAccessClaimForID:",  *(void *)(a1 + 40));
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
  block[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke;
  block[3] = &unk_189CA4D60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = v10;
  block[9] = v12[0];
  dispatch_async(queue, block);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke(void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didMoveItemAtURL:toURL:withFSID:andFileID:",  a1[5],  a1[6],  a1[7],  a1[9],  a1[8]);
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke(void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didDisconnectItemAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke(void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didReconnectItemAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke( void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didChangeUbiquityOfItemAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke( void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didChangeSharingOfItemAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  block[8] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
  block[3] = &unk_189CA47E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  dispatch_async(queue, block);
}

uint64_t __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke( void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:",  a1[5],  a1[6],  a1[7]);
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke( void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didMakeItemDisappearAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke(void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didChangeItemAtURL:",  a1[5],  a1[6]);
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  void block[10] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
  block[3] = &unk_189CA4810;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  void block[9] = a7;
  dispatch_async(queue, block);
}

uint64_t __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke( void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:",  a1[5],  a1[6],  a1[7],  a1[8],  a1[9]);
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke;
  v5[3] = &unk_189CA16F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke(void *a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy"),  "tiePresenterForID:toItemAtURL:",  a1[5],  a1[6]);
}

- (void)addFilePresenter:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1 + 32) + 24LL)) {
    *(void *)(*(void *)(a1 + 32) + 24LL) = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:v2];
  uint64_t v3 = [*(id *)(a1 + 40) presentedItemURL];
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    BOOL v4 = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(a1 + 40) lastPresentedItemEventIdentifier]);
  }
  else {
    BOOL v4 = 0LL;
  }
  uint64_t v5 = (objc_opt_respondsToSelector() & 1) == 0
    || [*(id *)(a1 + 40) presentedItemNeedsWatching];
  objc_lookUpClass("NSDocument");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 40) usesMainThreadDuringPresentedItemRelinquishing] & 1) != 0
    || (uint64_t v6 = (NSOperationQueue *)[*(id *)(a1 + 40) presentedItemOperationQueue],
        v6 == +[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue")))
  {
    v5 |= 2uLL;
  }

  unint64_t v7 = +[NSFileCoordinator _responsesForPresenter:]( &OBJC_CLASS___NSFileCoordinator,  "_responsesForPresenter:",  *(void *)(a1 + 40));
  if ((v7 & 0xFFFFFFFF80010000LL) != 0) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = [MEMORY[0x189604010] set];
  }
  int v9 = -[NSFilePresenterXPCMessenger initWithFilePresenter:queue:]( objc_alloc(&OBJC_CLASS___NSFilePresenterXPCMessenger),  "initWithFilePresenter:queue:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (!v10)
  {
    *(void *)(*(void *)(a1 + 32) + 32LL) = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32LL);
  }

  [v10 setObject:v9 forKey:v2];

  BOOL v11 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v14 = v2;
    __int16 v15 = 2113;
    uint64_t v16 = v3;
    _os_log_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Adding presenter %{public}@ for URL: %{private}@",  buf,  0x16u);
  }

  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "remoteObjectProxy"),  "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:",  v9,  v2,  v3,  v4,  v8,  v5,  v7);
}

- (void)removeFilePresenter:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v2];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "objectForKey:", v2), "invalidate");
  [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v2];
  objc_msgSend( objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment"),  "removeAllBlockingAccessClaimIDs");
  objc_msgSend( objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment"),  "removeAllBlockingAccessClaimIDs");
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment", 0LL, (void *)0x301);
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment", 0LL, (void *)0x301);
  uint64_t v3 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEFAULT, "Removing presenter %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "remoteObjectProxy"),  "removePresenterWithID:",  v2);
}

- (id)_onqueue_filePresenters
{
  return (id)-[NSMutableDictionary allValues](self->_presentersByID, "allValues");
}

- (id)filePresenters
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  BOOL v11 = __Block_byref_object_copy__27;
  uint64_t v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__NSFileAccessArbiterProxy_filePresenters__block_invoke;
  block[3] = &unk_189CA1890;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[MEMORY[0x189603F18] array];
  }
  int v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __42__NSFileAccessArbiterProxy_filePresenters__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (void)addFileProvider:(id)a3 completionHandler:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke;
  v5[3] = &unk_189CA37F0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1 + 32) + 40LL)) {
    *(void *)(*(void *)(a1 + 32) + 40LL) = objc_alloc_init(MEMORY[0x189603FE0]);
  }
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = -[NSFileProviderXPCMessenger initWithFileProvider:queue:]( objc_alloc(&OBJC_CLASS___NSFileProviderXPCMessenger),  "initWithFileProvider:queue:",  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 16LL));
  id v4 = *(void **)(*(void *)(a1 + 32) + 48LL);
  if (!v4)
  {
    *(void *)(*(void *)(a1 + 32) + 48LL) =  +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable");
    id v4 = *(void **)(*(void *)(a1 + 32) + 48LL);
  }

  [v4 setObject:v3 forKey:*(void *)(a1 + 40)];

  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = [*(id *)(a1 + 40) _providedItemsURL];
  uint64_t v7 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v16 = v2;
    __int16 v17 = 2113;
    uint64_t v18 = v6;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding provider %{public}@ for URL: %{private}@",  buf,  0x16u);
  }

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_327;
  v14[3] = &unk_189CA4430;
  v14[4] = *(void *)(a1 + 48);
  uint64_t v10 = (void *)[v8 remoteObjectProxyWithErrorHandler:v14];
  BOOL v11 = _uniqueFileProviderID(*(void **)(a1 + 40));
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_330;
  v13[3] = &unk_189CA4458;
  v13[4] = *(void *)(a1 + 48);
  return [v10 addProvider:v3 withID:v2 uniqueID:v11 forProvidedItemsURL:v6 options:v5 & 1 withServer:0 reply:v13];
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_327( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"addProvider";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)removeFileProvider:(id)a3
{
  void block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke;
  block[3] = &unk_189C991F0;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
}

uint64_t __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 40) removeObject:*(void *)(a1 + 32)];
  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKey:", *(void *)(a1 + 32)),  "invalidate");
  [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEFAULT, "Removing provider %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "remoteObjectProxy"),  "removeProviderWithID:uniqueID:",  v2,  _uniqueFileProviderID(*(void **)(a1 + 32)));
}

- (id)_onqueue_fileProviders
{
  return (id)-[NSMutableSet allObjects](self->_providers, "allObjects");
}

- (id)fileProviders
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  BOOL v11 = __Block_byref_object_copy__27;
  uint64_t v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__NSFileAccessArbiterProxy_fileProviders__block_invoke;
  block[3] = &unk_189CA1890;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[MEMORY[0x189603F18] array];
  }
  int v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __41__NSFileAccessArbiterProxy_fileProviders__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (id)idForFileReactor:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  uint64_t v10 = __Block_byref_object_copy__27;
  BOOL v11 = __Block_byref_object_dispose__27;
  uint64_t v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke;
  block[3] = &unk_189CA1890;
  block[4] = a3;
  block[5] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke(uint64_t a1)
{
  id result =  +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (void)getDebugInfoWithCompletionHandler:(id)a3
{
  void block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke;
  block[3] = &unk_189C9FF78;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  v9[5] = *MEMORY[0x1895F89C0];
  id v2 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_fileReactorDebuggingInformation");
  uint64_t v3 = MEMORY[0x1895F87A8];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_189CA4430;
  v9[4] = v4;
  id v6 = (void *)[v5 remoteObjectProxyWithErrorHandler:v9];
  v8[0] = v3;
  v8[1] = 3221225472LL;
  v8[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_333;
  v8[3] = &unk_189CA4898;
  v8[4] = *(void *)(a1 + 40);
  return [v6 provideDebugInfoWithLocalInfo:v2 completionHandler:v8];
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"provideDebugInfo";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_333( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (a3)
  {
    uint64_t v4 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "This process is unable to access File Coordination's debug information due to insufficient permissions.",  v5,  2u);
    }
  }

- (BOOL)itemHasPresentersAtURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  int v5 = dispatch_semaphore_create(0LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke;
  block[3] = &unk_189CA48C0;
  block[4] = self;
  block[5] = v5;
  void block[6] = a3;
  void block[7] = &v9;
  dispatch_async(queue, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)a3;
}

uint64_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke(void *a1)
{
  void v10[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 8LL);
  v10[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2;
  v10[3] = &unk_189CA0C18;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[4] = v2;
  int v5 = (void *)[v3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_336;
  v9[3] = &unk_189CA36B0;
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v9[4] = a1[5];
  v9[5] = v7;
  return [v5 getItemHasPresentersAtURL:v6 completionHandler:v9];
}

uint64_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"getItemHasPresenters";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_336(uint64_t a1, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
  self->_disableFileProviderReregistration = a3;
}

+ (void)_accessPresenterOperationRecordsUsingBlock:(id)a3
{
  if (!qword_18C494AA0) {
    qword_18C494AA0 = objc_opt_new();
  }
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(&stru_18C494A8C);
}

+ (id)_willBeginOperationForReactor:(id)a3 withDescription:(id)a4
{
  v6[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[NSFilePresenterOperationRecord operationRecordWithDescription:reactor:]( &OBJC_CLASS___NSFilePresenterOperationRecord,  "operationRecordWithDescription:reactor:",  a4,  a3);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke;
  v6[3] = &unk_189CA48E8;
  v6[4] = v4;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_accessPresenterOperationRecordsUsingBlock:",  v6);
  return v4;
}

uint64_t __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

+ (id)_fileReactorDebuggingInformation
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v3 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke;
  v13[3] = &unk_189CA48E8;
  v13[4] = v3;
  [a1 _accessPresenterOperationRecordsUsingBlock:v13];
  Class v4 = objc_lookUpClass("NSDocument");
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    id v5 = -[objc_class _debuggingInformationForFileCoordination](v4, sel__debuggingInformationForFileCoordination);
  }
  else {
    id v5 = 0LL;
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        -[NSString appendFormat:]( v3,  "appendFormat:",  @"[%i]: Presenter ID: %@ -- %@\n",  v8 + v10,  objc_msgSend( a1,  "_idForReactor:",  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "objectForKey:", @"document")),  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "objectForKey:", @"stateString"));
        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v8 = (v8 + v10);
    }

    while (v7);
  }

  if (!-[NSString length](v3, "length")) {
    -[NSString appendString:](v3, "appendString:", @"Nothing\n");
  }
  return v3;
}

uint64_t __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) appendFormat:@"%@\n", *(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }

      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v5 = result;
    }

    while (result);
  }

  return result;
}

- (void)performBarrier
{
  v4[5] = *MEMORY[0x1895F89C0];
  uint64_t v3 = dispatch_semaphore_create(0LL);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__NSFileAccessArbiterProxy_performBarrier__block_invoke;
  v4[3] = &unk_189C9A030;
  v4[4] = v3;
  -[NSFileAccessArbiterProxy performBarrierAsync:](self, "performBarrierAsync:", v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

uint64_t __42__NSFileAccessArbiterProxy_performBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performBarrierAsync:(id)a3
{
  void block[6] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke;
  block[3] = &unk_189C9FF78;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke(uint64_t a1)
{
  v5[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2;
  v5[3] = &unk_189CA4430;
  v5[1] = 3221225472LL;
  v5[4] = v2;
  return objc_msgSend( (id)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5),  "performBarrierWithCompletionHandler:",  *(void *)(a1 + 40));
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  Class v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"barrier";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)handleCanceledServer
{
}

@end