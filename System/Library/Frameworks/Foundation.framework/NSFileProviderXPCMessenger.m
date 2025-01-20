@interface NSFileProviderXPCMessenger
- (NSFileProviderXPCMessenger)initWithFileProvider:(id)a3 queue:(id)a4;
- (NSFileProviderXPCMessenger)initWithFileProviderProxy:(id)a3;
- (void)_makeProvider:(id)a3 provideItemAtURL:(id)a4 withInfo:(id)a5 completionHandler:(id)a6;
- (void)cancelProvidingItemAtURL:(id)a3 forClaimWithID:(id)a4;
- (void)checkInProviderWithReply:(id)a3;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 fileName:(id)a5 completionHandler:(id)a6;
- (void)observeEndOfWriteAtURL:(id)a3 forClaimWithID:(id)a4 fromProcessWithIdentifier:(int)a5;
- (void)observePresentationChangeOfKind:(id)a3 forPresenterOfURL:(id)a4 withInfo:(id)a5;
- (void)provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)providePhysicalItemForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation NSFileProviderXPCMessenger

- (NSFileProviderXPCMessenger)initWithFileProvider:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileProviderXPCMessenger;
  v6 = -[NSFileProviderXPCMessenger init](&v8, sel_init);
  if (v6)
  {
    v6->_fileProvider = (NSFileProvider *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }

  return v6;
}

- (NSFileProviderXPCMessenger)initWithFileProviderProxy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileProviderXPCMessenger;
  v4 = -[NSFileProviderXPCMessenger init](&v6, sel_init);
  if (v4) {
    v4->_fileProviderProxy = (NSFileProviderProxy *)a3;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileProviderXPCMessenger;
  -[NSFileProviderXPCMessenger dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  self->_fileProvider = 0LL;

  self->_fileProviderProxy = 0LL;
}

- (void)checkInProviderWithReply:(id)a3
{
}

- (void)_makeProvider:(id)a3 provideItemAtURL:(id)a4 withInfo:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v11 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:");
  uint64_t v12 = [a5 readerID];
  v13 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    id v18 = v11;
    __int16 v19 = 2113;
    uint64_t v20 = [a4 path];
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ providing %{private}@ for claim %{public}@",  buf,  0x20u);
  }

  id v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Provide");
  v15 = (void *)[a3 _providedItemsOperationQueue];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke;
  v16[3] = &unk_189CA4C28;
  v16[4] = v11;
  v16[5] = v14;
  v16[6] = a3;
  v16[7] = a4;
  v16[8] = a5;
  v16[9] = self;
  v16[10] = v12;
  v16[11] = a6;
  objc_msgSend(v15, "_fc_addUncancellableOperationForReactorID:block:", v11, v16);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v3;
    _os_log_impl(&dword_182EB1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ began providing", buf, 0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = *(void **)(a1 + 48);
  if ((v4 & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_629;
    v19[3] = &unk_189CA42C8;
    __int128 v20 = *(_OWORD *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 88);
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v22 = v8;
    return [v5 _provideItemAtURL:v6 withInfo:v7 completionHandler:v19];
  }

  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = *(void **)(a1 + 64);
    if (v10)
    {
      [v10 readerAuditToken];
      uint64_t v11 = DWORD1(v24);
    }

    else
    {
      uint64_t v11 = 0LL;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
    }

    +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:]( &OBJC_CLASS___NSFileCoordinator,  "_addProcessIdentifier:observedUbiquityAttributes:forID:",  v11,  0LL,  *(void *)(a1 + 80));
    +[NSFileCoordinator _setReadingOptions:]( NSFileCoordinator,  "_setReadingOptions:",  [*(id *)(a1 + 64) readingOptions]);
    +[NSFileCoordinator _setKernelMaterializationInfo:]( NSFileCoordinator,  "_setKernelMaterializationInfo:",  [*(id *)(a1 + 64) kernelMaterializationInfo]);
    objc_msgSend(*(id *)(a1 + 48), "_provideItemAtURL:toReaderWithID:completionHandler:", *(void *)(a1 + 56));
    +[NSFileCoordinator _setReadingOptions:](&OBJC_CLASS___NSFileCoordinator, "_setReadingOptions:", 0LL);
    return +[NSFileCoordinator _setKernelMaterializationInfo:]( &OBJC_CLASS___NSFileCoordinator,  "_setKernelMaterializationInfo:",  0LL);
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_635;
    v15[3] = &unk_189CA4A20;
    __int128 v16 = *(_OWORD *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = v14;
    return [v12 _provideItemAtURL:v13 completionHandler:v15];
  }

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_629( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_630;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_630( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }

  +[NSFileCoordinator _removeInfoForID:](&OBJC_CLASS___NSFileCoordinator, "_removeInfoForID:", *(void *)(a1 + 40));
  [*(id *)(a1 + 48) willEnd];
  uint64_t v6 = +[NSFileProvidingResponse responseWithError:](&OBJC_CLASS___NSFileProvidingResponse, "responseWithError:", a2);
  -[NSFileProvidingResponse setProvidedItemRecursiveGenerationCount:]( v6,  "setProvidedItemRecursiveGenerationCount:",  +[NSFileCoordinator _providedItemGenerationCount](&OBJC_CLASS___NSFileCoordinator, "_providedItemGenerationCount"));
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_634;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v9 = *(void *)(a1 + 64);
  block[5] = v6;
  block[6] = v9;
  block[4] = v7;
  dispatch_async(v8, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_634( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_635( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_636;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_636( uint64_t a1)
{
  return (*(uint64_t (**)(void, NSFileProvidingResponse *))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  +[NSFileProvidingResponse responseWithError:]( &OBJC_CLASS___NSFileProvidingResponse,  "responseWithError:",  *(void *)(a1 + 40)));
}

- (void)provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  v12[8] = *MEMORY[0x1895F89C0];
  fileProvider = self->_fileProvider;
  if (fileProvider)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke;
    v12[3] = &unk_189CA42C8;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    v12[7] = a5;
    -[NSFileProviderXPCMessenger _makeProvider:provideItemAtURL:withInfo:completionHandler:]( self,  "_makeProvider:provideItemAtURL:withInfo:completionHandler:",  fileProvider,  a3,  a4,  v12);
  }

  else
  {
    fileProviderProxy = self->_fileProviderProxy;
    if (fileProviderProxy)
    {
      v10 = -[NSFileProviderProxy remoteProvider](fileProviderProxy, "remoteProvider");
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3;
      v11[3] = &unk_189CA4430;
      v11[4] = a5;
      objc_msgSend( (id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:]( v10,  "remoteObjectProxyWithErrorHandler:",  v11),  "provideItemAtURL:withInfo:completionHandler:",  a3,  a4,  a5);
    }

    else
    {
      (*((void (**)(id, void))a5 + 2))(a5, 0LL);
    }
  }

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke( uint64_t a1,  NSFileProvidingResponse *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  char v4 = (objc_class *)objc_opt_class();
  if (-[NSString hasSuffix:](NSStringFromClass(v4), "hasSuffix:", @"TiWorkFileProvider")
    && !-[NSFileProvidingResponse error](a2, "error"))
  {
    uint64_t v5 = (char *)[*(id *)(a1 + 40) fileSystemRepresentation];
    if (v5)
    {
      uint64_t v8 = *(void **)(a1 + 48);
      if (v8)
      {
        [v8 readerAuditToken];
      }

      else
      {
        __int128 v11 = 0u;
        __int128 v12 = 0u;
      }

      uint64_t v9 = sandbox_extension_issue_file_to_process();
      uint64_t v5 = (char *)v9;
      if (a2 || !v9)
      {
        if (!v9) {
          goto LABEL_4;
        }
      }

      else
      {
        a2 = objc_alloc_init(&OBJC_CLASS___NSFileProvidingResponse);
      }

      -[NSFileProvidingResponse setSandboxToken:]( a2,  "setSandboxToken:",  -[NSFileManager stringWithFileSystemRepresentation:length:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "stringWithFileSystemRepresentation:length:",  v5,  strlen(v5)));
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"provide";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void, NSFileProvidingResponse *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  +[NSFileProvidingResponse responseWithError:]( &OBJC_CLASS___NSFileProvidingResponse,  "responseWithError:",  a2));
}

- (void)cancelProvidingItemAtURL:(id)a3 forClaimWithID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (self->_fileProvider)
  {
    uint64_t v7 = (os_log_s *)_NSFCProviderLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = a4;
      _os_log_impl(&dword_182EB1000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling providing for claim %{public}@", buf, 0xCu);
    }

    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_fileProvider,  @"Provide");
    uint64_t v9 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    id v10 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  self->_fileProvider);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke;
    v11[3] = &unk_189CA47E8;
    v11[4] = v8;
    void v11[5] = self;
    v11[6] = a3;
    v11[7] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v10, v11);
  }

uint64_t __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(*(void *)(a1 + 40) + 8) _cancelProvidingItemAtURL:*(void *)(a1 + 48) toReaderWithID:*(void *)(a1 + 56)];
  }
  return [*(id *)(a1 + 32) didEnd];
}

- (void)providePhysicalItemForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (self->_fileProvider)
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:");
    id v8 = (os_log_s *)_NSFCProviderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ providing physical URL", buf, 0xCu);
    }

    id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_fileProvider,  @"Provide Physical URL");
    id v10 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke;
    v11[3] = &unk_189CA4C50;
    v11[4] = v9;
    void v11[5] = self;
    v11[6] = a3;
    v11[7] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

void __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didBegin];
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2;
  v8[3] = &unk_189CA3BE0;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[4] = v3;
  v8[5] = v4;
  uint64_t v5 = *(void *)(a1 + 56);
  v8[6] = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 8) _physicalURLForURL:*(void *)(a1 + 48)];
    [v3 willEnd];
    id v7 = *(dispatch_queue_s **)(v4 + 16);
    uint64_t block = v2;
    uint64_t v10 = 3221225472LL;
    __int128 v11 = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
    __int128 v12 = &unk_189CA4980;
    uint64_t v14 = v6;
    uint64_t v15 = v5;
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 8) _getPhysicalURLForURL:*(void *)(a1 + 48) completionHandler:v8];
      return;
    }

    [v3 willEnd];
    id v7 = *(dispatch_queue_s **)(v4 + 16);
    uint64_t block = v2;
    uint64_t v10 = 3221225472LL;
    __int128 v11 = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
    __int128 v12 = &unk_189CA4980;
    uint64_t v14 = 0LL;
    uint64_t v15 = v5;
  }

  id v13 = v3;
  dispatch_async(v7, &block);
}

void __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  v7[7] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) willEnd];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 16LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
  v7[3] = &unk_189CA4980;
  v7[1] = 3221225472LL;
  uint64_t v6 = *(void *)(a1 + 48);
  v7[5] = a2;
  v7[6] = v6;
  v7[4] = v4;
  dispatch_async(v5, v7);
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3( uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didEnd];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4;
  v3[3] = &unk_189C9E898;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  return +[NSFileCoordinator _performBarrierAsync:](&OBJC_CLASS___NSFileCoordinator, "_performBarrierAsync:", v3);
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)observePresentationChangeOfKind:(id)a3 forPresenterOfURL:(id)a4 withInfo:(id)a5
{
  v13[10] = *MEMORY[0x1895F89C0];
  if (self->_fileProvider)
  {
    id v9 = -[NSProcessInfo beginActivityWithOptions:reason:]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "beginActivityWithOptions:reason:",  0x80000000000LL,  @"Sending an NSFileProvider an observePresentationChangeOfKind: message");
    id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_fileProvider,  @"Observe Presentation Change");
    __int128 v11 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    id v12 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  self->_fileProvider);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke;
    v13[3] = &unk_189CA4810;
    v13[4] = v10;
    v13[5] = a3;
    v13[6] = self;
    v13[7] = a4;
    v13[8] = a5;
    v13[9] = v9;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v12, v13);
  }

void __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didBegin];
  if ([*(id *)(a1 + 40) isEqualToString:@"added"])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      [*(id *)(*(void *)(a1 + 48) + 8) _providedItemAtURL:*(void *)(a1 + 56) didGainPresenterWithInfo:*(void *)(a1 + 64)];
    }

    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v2 = *(void **)(a1 + 64);
      if (v2)
      {
        [v2 presenterAuditToken];
        uint64_t v3 = DWORD1(v8);
        uint64_t v2 = *(void **)(a1 + 64);
      }

      else
      {
        uint64_t v3 = 0LL;
        __int128 v7 = 0u;
        __int128 v8 = 0u;
      }

      +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:]( NSFileCoordinator,  "_addProcessIdentifier:observedUbiquityAttributes:forID:",  v3,  [v2 observedUbiquityAttributes],  objc_msgSend(*(id *)(a1 + 64), "presenterID"));
      objc_msgSend( *(id *)(*(void *)(a1 + 48) + 8),  "_providedItemAtURL:didGainPresenterWithID:",  *(void *)(a1 + 56),  objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    }
  }

  else if ([*(id *)(a1 + 40) isEqualToString:@"removed"])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend( *(id *)(*(void *)(a1 + 48) + 8),  "_providedItemAtURL:didLosePresenterWithID:",  *(void *)(a1 + 56),  objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    }
    +[NSFileCoordinator _removeInfoForID:]( NSFileCoordinator,  "_removeInfoForID:",  [*(id *)(a1 + 64) presenterID]);
  }

  else if ([*(id *)(a1 + 40) isEqualToString:@"itemMoved"] {
         && (objc_opt_respondsToSelector() & 1) != 0)
  }
  {
    objc_msgSend( *(id *)(*(void *)(a1 + 48) + 8),  "_providedItemAtURL:withPresenterWithID:didMoveToURL:",  *(void *)(a1 + 56),  objc_msgSend(*(id *)(a1 + 64), "presenterID"),  objc_msgSend(*(id *)(a1 + 64), "changedURL"));
  }

  [*(id *)(a1 + 32) willEnd];
  __int128 v4 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2;
  v6[3] = &unk_189C991F0;
  uint64_t v5 = *(void *)(a1 + 72);
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v5;
  dispatch_async(v4, v6);
}

uint64_t __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2( uint64_t a1)
{
  return -[NSProcessInfo endActivity:]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "endActivity:",  *(void *)(a1 + 40));
}

- (void)observeEndOfWriteAtURL:(id)a3 forClaimWithID:(id)a4 fromProcessWithIdentifier:(int)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (self->_fileProvider)
  {
    id v9 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:");
    id v10 = (os_log_s *)_NSFCProviderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = a4;
      _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ observing end of writing claim %{public}@",  buf,  0x16u);
    }

    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_fileProvider,  @"Observe End Of Write");
    id v12 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke;
    v13[3] = &unk_189CA4C78;
    v13[4] = v11;
    v13[5] = self;
    int v14 = a5;
    v13[6] = a4;
    v13[7] = a3;
    objc_msgSend(v12, "_fc_addUncancellableOperationForReactorID:block:", v9, v13);
  }

uint64_t __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke( uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:]( &OBJC_CLASS___NSFileCoordinator,  "_addProcessIdentifier:observedUbiquityAttributes:forID:",  *(unsigned int *)(a1 + 64),  0LL,  *(void *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 40) + 8) _writerWithID:*(void *)(a1 + 48) didFinishWritingForURL:*(void *)(a1 + 56)];
    +[NSFileCoordinator _removeInfoForID:](&OBJC_CLASS___NSFileCoordinator, "_removeInfoForID:", *(void *)(a1 + 48));
  }

  return [*(id *)(a1 + 32) didEnd];
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 fileName:(id)a5 completionHandler:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (self->_fileProvider)
  {
    id v11 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:");
    id v12 = (os_log_s *)_NSFCProviderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_log_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ checking if moving an item within its container requires providing",  buf,  0xCu);
    }

    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_fileProvider,  @"Check Moving Requires Providing");
    int v14 = (void *)-[NSFileProvider _providedItemsOperationQueue](self->_fileProvider, "_providedItemsOperationQueue");
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke;
    v15[3] = &unk_189CA4CC8;
    void v15[4] = v13;
    v15[5] = v11;
    v15[9] = a5;
    v15[10] = a6;
    v15[6] = self;
    v15[7] = a3;
    v15[8] = a4;
    objc_msgSend(v14, "_fc_addUncancellableOperationForReactorID:block:", v11, v15);
  }

  else
  {
    (*((void (**)(id, id))a6 + 2))( a6,  +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:]( &OBJC_CLASS___NSFileProviderMovingResponse,  "providingNotRequiredResponseWithSyncRootID:",  0LL,  a4,  a5));
  }

void __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didBegin];
  uint64_t v2 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2;
  v8[3] = &unk_189CA4CA0;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(*(void *)(a1 + 48) + 8) _movingItemAtURL:*(void *)(a1 + 56) withInfo:*(void *)(a1 + 64) completionHandler:v8];
  }

  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void **)(*(void *)(a1 + 48) + 8LL);
    uint64_t v6 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 64), "destinationDirectoryURL"),  "URLByAppendingPathComponent:isDirectory:",  *(void *)(a1 + 72),  0);
    v7[0] = v2;
    v7[1] = 3221225472LL;
    v7[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_673;
    v7[3] = &unk_189CA4458;
    v7[4] = v8;
    [v5 _movingItemAtURL:v4 requiresProvidingWithDestinationURL:v6 completionHandler:v7];
  }

  else
  {
    __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2( (uint64_t)v8,  (uint64_t)+[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:]( &OBJC_CLASS___NSFileProviderMovingResponse,  "providingNotRequiredResponseWithSyncRootID:",  0LL));
  }

void __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ responded to moving check with: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  __int128 v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_668;
  block[3] = &unk_189CA04E8;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = v6;
  block[6] = v8;
  block[4] = a2;
  dispatch_async(v7, block);
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_668( uint64_t a1)
{
  return [*(id *)(a1 + 40) didEnd];
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_673( uint64_t a1,  int a2)
{
  if (a2) {
    +[NSFileProviderMovingResponse providingRequiredResponse]( &OBJC_CLASS___NSFileProviderMovingResponse,  "providingRequiredResponse");
  }
  else {
    +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:]( &OBJC_CLASS___NSFileProviderMovingResponse,  "providingNotRequiredResponseWithSyncRootID:",  -1LL);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
}

@end