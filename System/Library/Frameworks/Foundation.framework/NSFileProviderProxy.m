@interface NSFileProviderProxy
- (BOOL)allowedForURL:(id)a3;
- (BOOL)wantsWriteNotifications;
- (NSFileProviderProxy)initWithClient:(id)a3 remoteProvider:(id)a4 reactorID:(id)a5 secureID:(id)a6 uniqueID:(id)a7;
- (NSFileProviderXPCInterface)remoteProvider;
- (NSString)secureID;
- (NSUUID)uniqueID;
- (id)_clientProxy;
- (id)provideItemAtURL:(id)a3 withOptions:(unint64_t)a4 forAccessClaim:(id)a5 completionHandler:(id)a6;
- (id)provideItemForKernelRequestWithInfo:(id)a3 atURL:(id)a4 forProcess:(id *)a5 withOptions:(unint64_t)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)forwardUsingProxy:(id)a3;
- (void)invalidate;
- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationDirectoryURL:(id)a4 newFileName:(id)a5 completionHandler:(id)a6;
- (void)observeEndOfWriteAtLocation:(id)a3 forAccessClaim:(id)a4;
- (void)observePresentationChangeOfKind:(id)a3 withPresenter:(id)a4 url:(id)a5 newURL:(id)a6;
- (void)provideLogicalURLForURL:(id)a3 completionHandler:(id)a4;
- (void)providePhysicalURLForURL:(id)a3 completionHandler:(id)a4;
- (void)setItemLocation:(id)a3;
- (void)setWantsWriteNotifications:(BOOL)a3;
@end

@implementation NSFileProviderProxy

- (NSFileProviderProxy)initWithClient:(id)a3 remoteProvider:(id)a4 reactorID:(id)a5 secureID:(id)a6 uniqueID:(id)a7
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSFileProviderProxy;
  v10 = -[NSFileReactorProxy initWithClient:reactorID:](&v12, sel_initWithClient_reactorID_, a3, a5);
  if (v10)
  {
    v10->_remoteProvider = (NSFileProviderXPCInterface *)a4;
    v10->_uniqueID = (NSUUID *)[a7 copy];
    v10->_secureID = (NSString *)[a6 copy];
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileProviderProxy;
  -[NSFileReactorProxy dealloc](&v3, sel_dealloc);
}

- (id)_clientProxy
{
  return self->_remoteProvider;
}

- (void)setItemLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  itemLocation = self->super._itemLocation;
  if (a3 && itemLocation)
  {
    v6 = (os_log_s *)_NSFCProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEFAULT,  "[NSFileProviderProxy setItemLocation:] was invoked for a provider proxy that already has a location. Ignoring it.",  buf,  2u);
    }
  }

  else
  {
    if (itemLocation) {
      -[NSFileAccessNode forEachPresenterOfItemOrContainedItemPerformProcedure:]( itemLocation,  "forEachPresenterOfItemOrContainedItemPerformProcedure:",  &__block_literal_global_186);
    }
    v7 = self;
    -[NSFileAccessNode removeProvider:](self->super._itemLocation, "removeProvider:", self);
    if ([a3 setProvider:self])
    {
      uint64_t v8 = MEMORY[0x1895F87A8];
      self->super._itemLocation = (NSFileAccessNode *)a3;
      v9[0] = v8;
      v9[1] = 3221225472LL;
      v9[2] = __39__NSFileProviderProxy_setItemLocation___block_invoke_2;
      v9[3] = &unk_189CA4688;
      v9[4] = self;
      [a3 forEachPresenterOfItemOrContainedItemPerformProcedure:v9];
    }

    else
    {
      self->super._itemLocation = 0LL;
    }
  }

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observeNewProvider:0];
}

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 observeNewProvider:*(void *)(a1 + 32)];
}

- (void)forwardUsingProxy:(id)a3
{
  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = -[NSFileProviderXPCMessenger initWithFileProviderProxy:]( objc_alloc(&OBJC_CLASS___NSFileProviderXPCMessenger),  "initWithFileProviderProxy:",  self);
    self->_forwardedMessenger = forwardedMessenger;
  }

  objc_msgSend( a3,  "addProvider:withID:uniqueID:forProvidedItemsURL:options:withServer:reply:",  forwardedMessenger,  self->super._reactorID,  self->_uniqueID,  -[NSFileAccessNode url](self->super._itemLocation, "url"),  0,  0,  &__block_literal_global_189);
}

- (void)invalidate
{
  self->_forwardedMessenger = 0LL;
}

- (BOOL)allowedForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if ([a3 isFileURL])
  {
    *(void *)v20 = 0LL;
    *(void *)&v20[8] = v20;
    *(void *)&v20[16] = 0x2020000000LL;
    char v21 = 0;
    id v5 = -[NSFileReactorProxy client](self, "client");
    if (v5)
    {
      [v5 auditToken];
    }

    else
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
    }

    id v8 = +[NSFileAccessArbiter entitlementForConnection:key:]( &OBJC_CLASS___NSFileAccessArbiter,  "entitlementForConnection:key:",  -[NSFileReactorProxy client](self, "client"),  @"application-identifier");
    if (([v8 isEqualToString:@"com.apple.bird"] & 1) != 0
      || ([v8 isEqualToString:@"com.apple.fileprovider.fileproviderd"] & 1) != 0
      || (*(_OWORD *)buf = v18, *(_OWORD *)&buf[16] = v19, !sandbox_check_by_audit_token()))
    {
      *(_BYTE *)(*(void *)&v20[8] + 24LL) = 1;
    }

    else
    {
      v14[1] = 3221225472LL;
      __int128 v15 = v18;
      v14[0] = MEMORY[0x1895F87A8];
      v14[2] = __37__NSFileProviderProxy_allowedForURL___block_invoke;
      v14[3] = &unk_189CA4DA8;
      __int128 v16 = v19;
      v14[4] = v20;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:usingBlock:]( &OBJC_CLASS___NSFileReactorProxy,  "_enumerateParentDirectoriesStartingAtURL:usingBlock:",  a3,  v14);
      if (!*(_BYTE *)(*(void *)&v20[8] + 24LL))
      {
        v9 = (os_log_s *)_NSFCPresenterLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id reactorID = self->super._reactorID;
          int v11 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          uint64_t v12 = [a3 path];
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v11;
          *(_WORD *)&buf[18] = 2113;
          *(void *)&buf[20] = v12;
          _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Registering provider %{public}@ disallowed. Process %d is not allowed to access the requested path or any of its parent directories: %{private}@",  buf,  0x1Cu);
        }
      }
    }

    BOOL v7 = *(_BYTE *)(*(void *)&v20[8] + 24LL) != 0;
    _Block_object_dispose(v20, 8);
  }

  else
  {
    v6 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 138543619;
      *(void *)&v20[4] = self;
      *(_WORD *)&v20[12] = 2113;
      *(void *)&v20[14] = a3;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Registering provider %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@",  v20,  0x16u);
    }

    return 0;
  }

  return v7;
}

uint64_t __37__NSFileProviderProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
{
  uint64_t v8 = [a2 fileSystemRepresentation];
  char v6 = 1;
  uint64_t result = sandbox_check_by_audit_token();
  if ((_DWORD)result)
  {
    uint64_t result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", 0, v8);
    char v6 = result;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  *a3 = v6;
  return result;
}

- (id)provideItemAtURL:(id)a3 withOptions:(unint64_t)a4 forAccessClaim:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v11 = [a5 claimID];
  uint64_t v12 = (void *)[a5 client];
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v27, 0, sizeof(v27));
  }
  uint64_t v13 = +[NSFileProvidingInfo infoWithReaderID:options:auditToken:kernelMaterializationInfo:]( &OBJC_CLASS___NSFileProvidingInfo,  "infoWithReaderID:options:auditToken:kernelMaterializationInfo:",  v11,  a4,  v27,  0LL);
  v14 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [a5 claimID];
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v15;
    __int16 v25 = 2114;
    id v26 = reactorID;
    _os_log_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ asking provider %{public}@ to provide",  buf,  0x16u);
  }

  remoteProvider = self->_remoteProvider;
  uint64_t v18 = MEMORY[0x1895F87A8];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke;
  v22[3] = &unk_189CA4F88;
  v22[4] = a3;
  v22[5] = a6;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_202;
  v21[3] = &unk_189CA4FB0;
  v21[4] = self;
  v21[5] = a5;
  v21[6] = a6;
  objc_msgSend( (id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:]( remoteProvider,  "remoteObjectProxyWithErrorHandler:",  v22),  "provideItemAtURL:withInfo:completionHandler:",  a3,  v13,  v21);
  v20[0] = v18;
  v20[1] = 3221225472LL;
  v20[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_204;
  v20[3] = &unk_189CA16F0;
  v20[4] = a5;
  v20[5] = self;
  v20[6] = a3;
  return (id)[v20 copy];
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    v9 = @"provide";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = +[NSFileProvidingResponse responseWithError:]( &OBJC_CLASS___NSFileProvidingResponse,  "responseWithError:",  _NSErrorWithFilePath(256LL, *(void *)(a1 + 32)));
  return (*(uint64_t (**)(uint64_t, NSFileProvidingResponse *))(v5 + 16))(v5, v6);
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_202( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16LL);
    uint64_t v4 = [*(id *)(a1 + 40) claimID];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ finished providing for %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_204( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) claimID];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16LL);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ cancelled providing by %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return objc_msgSend( *(id *)(*(void *)(a1 + 40) + 56),  "cancelProvidingItemAtURL:forClaimWithID:",  *(void *)(a1 + 48),  objc_msgSend(*(id *)(a1 + 32), "claimID"));
}

- (id)provideItemForKernelRequestWithInfo:(id)a3 atURL:(id)a4 forProcess:(id *)a5 withOptions:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v13 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  __int128 v14 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a5->var0;
  *(_OWORD *)&buf[16] = v14;
  uint64_t v15 = +[NSFileProvidingInfo infoWithReaderID:options:auditToken:kernelMaterializationInfo:]( &OBJC_CLASS___NSFileProvidingInfo,  "infoWithReaderID:options:auditToken:kernelMaterializationInfo:",  v13,  a6,  buf,  a3);
  __int128 v16 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = reactorID;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = a4;
    _os_log_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_DEFAULT,  "Kernel asking provider %{public}@ to provide %{private}@",  buf,  0x16u);
  }

  remoteProvider = self->_remoteProvider;
  uint64_t v19 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke;
  v23[3] = &unk_189CA4430;
  v23[4] = a7;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_206;
  v22[3] = &unk_189CA4FD8;
  v22[4] = self;
  v22[5] = a7;
  objc_msgSend( (id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:]( remoteProvider,  "remoteObjectProxyWithErrorHandler:",  v23),  "provideItemAtURL:withInfo:completionHandler:",  a4,  v15,  v22);
  v21[0] = v19;
  v21[1] = 3221225472LL;
  v21[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_207;
  v21[3] = &unk_189CA16F0;
  v21[4] = v13;
  v21[5] = self;
  v21[6] = a4;
  return (id)[v21 copy];
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
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

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_206( uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ finished providing for kernel",  (uint8_t *)&v5,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_207( void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(a1[5] + 16LL);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ cancelled providing by %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return [*(id *)(a1[5] + 56) cancelProvidingItemAtURL:a1[6] forClaimWithID:a1[4]];
}

- (void)providePhysicalURLForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    id v13 = reactorID;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEFAULT,  "Asking provider %{public}@ to provide physical URL",  buf,  0xCu);
  }

  remoteProvider = self->_remoteProvider;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke;
  v11[3] = &unk_189CA4430;
  v11[4] = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_210;
  v10[3] = &unk_189CA3B40;
  v10[4] = self;
  v10[5] = a4;
  objc_msgSend( (id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:]( remoteProvider,  "remoteObjectProxyWithErrorHandler:",  v11),  "providePhysicalItemForURL:completionHandler:",  a3,  v10);
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"providePhysical";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_210(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ finished providing physical URL",  (uint8_t *)&v5,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)provideLogicalURLForURL:(id)a3 completionHandler:(id)a4
{
  if (_CFURLIsItemPromiseAtURL())
  {
    uint64_t v6 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (!v6)
    {
      __int16 v8 = 0LL;
      goto LABEL_7;
    }

    uint64_t v7 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", v6);
  }

  else
  {
    uint64_t v7 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( &OBJC_CLASS___NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  a3,  0LL);
  }

  __int16 v8 = v7;
LABEL_7:
  (*((void (**)(id, NSURLPromisePair *))a4 + 2))(a4, v8);
}

- (void)observePresentationChangeOfKind:(id)a3 withPresenter:(id)a4 url:(id)a5 newURL:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v12 = [a4 reactorID];
  id v13 = (void *)[a4 client];
  if (v13)
  {
    [v13 auditToken];
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
  }

  uint64_t v14 = +[NSFileProviderPresenterInfo infoWithPresenterID:auditToken:observedUbiquityAttributes:]( &OBJC_CLASS___NSFileProviderPresenterInfo,  "infoWithPresenterID:auditToken:observedUbiquityAttributes:",  v12,  &v16,  v11);
  uint64_t v15 = v14;
  if (a6) {
    -[NSFileProviderPresenterInfo setChangedURL:](v14, "setChangedURL:", a6);
  }
  -[NSFileProviderXPCInterface observePresentationChangeOfKind:forPresenterOfURL:withInfo:]( self->_remoteProvider,  "observePresentationChangeOfKind:forPresenterOfURL:withInfo:",  a3,  a5,  v15,  v16,  v17);
}

- (void)observeEndOfWriteAtLocation:(id)a3 forAccessClaim:(id)a4
{
  if (self->_wantsWriteNotifications
    && (objc_msgSend((id)objc_msgSend(a4, "purposeID"), "isEqual:", self->super._reactorID) & 1) == 0)
  {
    -[NSFileProviderXPCInterface observeEndOfWriteAtURL:forClaimWithID:fromProcessWithIdentifier:]( self->_remoteProvider,  "observeEndOfWriteAtURL:forClaimWithID:fromProcessWithIdentifier:",  [a3 standardizedURL],  objc_msgSend(a4, "claimID"),  objc_msgSend(a4, "clientProcessIdentifier"));
  }

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationDirectoryURL:(id)a4 newFileName:(id)a5 completionHandler:(id)a6
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v10 = +[NSFileProviderMovingInfo infoWithDestinationDirectoryURL:]( &OBJC_CLASS___NSFileProviderMovingInfo,  "infoWithDestinationDirectoryURL:",  a4);
  uint64_t v11 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    id v16 = reactorID;
    _os_log_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Asking provider %{public}@ if moving item within its container requires providing",  buf,  0xCu);
  }

  remoteProvider = self->_remoteProvider;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke;
  v14[3] = &unk_189CA5000;
  v14[4] = self;
  void v14[5] = a6;
  -[NSFileProviderXPCInterface movingItemAtURL:withInfo:fileName:completionHandler:]( remoteProvider,  "movingItemAtURL:withInfo:fileName:completionHandler:",  a3,  v10,  a5,  v14);
}

uint64_t __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = a2;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ responded to moving check: %@",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (NSString)secureID
{
  return self->_secureID;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSFileProviderXPCInterface)remoteProvider
{
  return self->_remoteProvider;
}

- (BOOL)wantsWriteNotifications
{
  return self->_wantsWriteNotifications;
}

- (void)setWantsWriteNotifications:(BOOL)a3
{
  self->_wantsWriteNotifications = a3;
}

@end