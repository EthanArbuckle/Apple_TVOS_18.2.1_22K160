@interface NSFilePresenterXPCMessenger
- (NSFilePresenterXPCMessenger)initWithFilePresenter:(id)a3 queue:(id)a4;
- (NSFilePresenterXPCMessenger)initWithFilePresenterProxy:(id)a3;
- (id)_readRelinquishment;
- (id)_writeRelinquishment;
- (void)_makePresenter:(id)a3 accommodateDeletionWithSubitemURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 accommodateDisconnectionWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 accommodateEvictionWithSubitemURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 observeChangeOfUbiquityAttributes:(id)a4;
- (void)_makePresenter:(id)a3 observeChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeMoveToURL:(id)a4 withSubitemURL:(id)a5;
- (void)_makePresenter:(id)a3 observeSharingChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeUbiquityChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeVersionChangeOfKind:(id)a4 withClientID:(id)a5 name:(id)a6 subitemURL:(id)a7;
- (void)_makePresenter:(id)a3 relinquishToAccessClaimWithID:(id)a4 purposeID:(id)a5 ifNecessaryUsingSelector:(SEL)a6 recordingRelinquishment:(id)a7 continuer:(id)a8;
- (void)_makePresenter:(id)a3 relinquishToReadingClaimWithID:(id)a4 purposeID:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)_makePresenter:(id)a3 relinquishToWritingClaimWithID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 completionHandler:(id)a8;
- (void)_makePresenter:(id)a3 reportUnsavedChangesWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 saveChangesWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 setLastPresentedItemEventIdentifier:(unint64_t)a4;
- (void)_makePresenter:(id)a3 setProviderPurposeIdentifier:(id)a4;
- (void)_makePresenter:(id)a3 validateRelinquishmentToSubitemAtURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 validateRemoteDeletionRecordingRelinquishment:(id)a4 completionHandler:(id)a5;
- (void)_makePresenterObserveDisconnection:(id)a3;
- (void)_makePresenterObserveReconnection:(id)a3;
- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)logSuspensionWarning;
- (void)observeChangeOfUbiquityAttributes:(id)a3;
- (void)observeChangeWithSubitemURL:(id)a3;
- (void)observeDisconnection;
- (void)observeMoveToURL:(id)a3 withSubitemURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)observePresenterChange:(BOOL)a3 forSubitemAtURL:(id)a4;
- (void)observeReconnection;
- (void)observeSharingChangeWithSubitemURL:(id)a3;
- (void)observeUbiquityChangeWithSubitemURL:(id)a3;
- (void)observeVersionChangeOfKind:(id)a3 toItemAtURL:(id)a4 withClientID:(id)a5 name:(id)a6;
- (void)reacquireFromReadingClaimForID:(id)a3;
- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4;
- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6;
- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7;
- (void)saveChangesWithCompletionHandler:(id)a3;
- (void)setProviderPurposeIdentifier:(id)a3;
- (void)updateLastEventID:(unint64_t)a3;
@end

@implementation NSFilePresenterXPCMessenger

- (NSFilePresenterXPCMessenger)initWithFilePresenter:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFilePresenterXPCMessenger;
  v6 = -[NSFilePresenterXPCMessenger init](&v8, sel_init);
  if (v6)
  {
    v6->_filePresenter = (NSFilePresenter *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }

  return v6;
}

- (NSFilePresenterXPCMessenger)initWithFilePresenterProxy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFilePresenterXPCMessenger;
  v4 = -[NSFilePresenterXPCMessenger init](&v6, sel_init);
  if (v4) {
    v4->_filePresenterProxy = (NSFilePresenterProxy *)a3;
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
  v4.super_class = (Class)&OBJC_CLASS___NSFilePresenterXPCMessenger;
  -[NSFilePresenterXPCMessenger dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  self->_filePresenter = 0LL;

  self->_filePresenterProxy = 0LL;
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6
{
  v14[5] = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke;
    v14[3] = &unk_189CA4430;
    v14[4] = a6;
    -[NSFilePresenterXPCMessenger _makePresenter:relinquishToReadingClaimWithID:purposeID:options:completionHandler:]( self,  "_makePresenter:relinquishToReadingClaimWithID:purposeID:options:completionHandler:",  filePresenter,  a3,  a5,  a4,  v14);
  }

  else if (self->_filePresenterProxy)
  {
    id v13 = -[NSXPCConnection userInfo]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "userInfo");
    if (object_getClass(v13) != (Class)&OBJC_CLASS___NSFileSubarbitrationClaim) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessArbiter.m",  3328LL,  @"Wrong class in connection userInfo: %@",  objc_opt_class());
    }
    [v13 forwardRelinquishmentForWritingClaim:0 withID:a3 options:a4 purposeID:a5 subitemURL:0 toPresenter:self->_filePresenterProxy usingReplySender:a6];
  }

  else
  {
    (*((void (**)(id, void))a6 + 2))(a6, 0LL);
  }

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2;
  v4[3] = &unk_189C9E898;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](&OBJC_CLASS___NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7
{
  v17[10] = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v14 = [a6 URL];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
    v17[3] = &unk_189CA4930;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a5;
    v17[7] = a6;
    v17[8] = a7;
    v17[9] = a4;
    -[NSFilePresenterXPCMessenger _makePresenter:validateRelinquishmentToSubitemAtURL:completionHandler:]( self,  "_makePresenter:validateRelinquishmentToSubitemAtURL:completionHandler:",  filePresenter,  v14,  v17);
  }

  else if (self->_filePresenterProxy)
  {
    id v16 = -[NSXPCConnection userInfo]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "userInfo");
    if (object_getClass(v16) != (Class)&OBJC_CLASS___NSFileSubarbitrationClaim) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessArbiter.m",  3364LL,  @"Wrong class in connection userInfo: %@",  objc_opt_class());
    }
    [v16 forwardRelinquishmentForWritingClaim:1 withID:a3 options:a4 purposeID:a5 subitemURL:a6 toPresenter:self->_filePresenterProxy usingReplySender:a7];
  }

  else
  {
    (*((void (**)(id, void))a7 + 2))(a7, 0LL);
  }

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke( void *a1,  int a2)
{
  v9[5] = *MEMORY[0x1895F89C0];
  if (!a2) {
    return (*(uint64_t (**)(void, void))(a1[8] + 16LL))(a1[8], 0LL);
  }
  v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = v3[1];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
  v9[3] = &unk_189CA4430;
  uint64_t v7 = a1[9];
  v9[4] = a1[8];
  return [v3 _makePresenter:v4 relinquishToWritingClaimWithID:v2 options:v7 purposeID:v5 subitemURL:v6 completionHandler:v9];
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
  v4[3] = &unk_189C9E898;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](&OBJC_CLASS___NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)reacquireFromReadingClaimForID:(id)a3
{
  if (self->_filePresenter)
  {
    objc_msgSend( -[NSFilePresenterXPCMessenger _readRelinquishment](self, "_readRelinquishment"),  "removeBlockingAccessClaimID:",  a3);
  }

  else if (self->_filePresenterProxy)
  {
    id v6 = -[NSXPCConnection userInfo]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "userInfo");
    if (object_getClass(v6) != (Class)&OBJC_CLASS___NSFileSubarbitrationClaim) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessArbiter.m",  3391LL,  @"Wrong class in connection userInfo: %@",  objc_opt_class());
    }
    objc_msgSend( v6,  "forwardReacquisitionForWritingClaim:withID:toPresenterForID:usingReplySender:",  0,  a3,  -[NSFileReactorProxy reactorID](self->_filePresenterProxy, "reactorID"),  0);
  }

- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4
{
  if (self->_filePresenter)
  {
    objc_msgSend( -[NSFilePresenterXPCMessenger _writeRelinquishment](self, "_writeRelinquishment"),  "removeBlockingAccessClaimID:thenContinue:",  a3,  a4);
  }

  else if (self->_filePresenterProxy)
  {
    id v8 = -[NSXPCConnection userInfo]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "userInfo");
    if (object_getClass(v8) != (Class)&OBJC_CLASS___NSFileSubarbitrationClaim) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessArbiter.m",  3414LL,  @"Wrong class in connection userInfo: %@",  objc_opt_class());
    }
    objc_msgSend( v8,  "forwardReacquisitionForWritingClaim:withID:toPresenterForID:usingReplySender:",  1,  a3,  -[NSFileReactorProxy reactorID](self->_filePresenterProxy, "reactorID"),  a4);
  }

  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }

- (void)saveChangesWithCompletionHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke;
    v5[3] = &unk_189CA4430;
    v5[4] = a3;
    -[NSFilePresenterXPCMessenger _makePresenter:saveChangesWithCompletionHandler:]( self,  "_makePresenter:saveChangesWithCompletionHandler:",  filePresenter,  v5);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a saveChangesWithCompletionHandler: message",  buf,  2u);
    }
  }

  else
  {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_189C9E898;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](&OBJC_CLASS___NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v7 = [a3 URL];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke;
    v9[3] = &unk_189CA4430;
    v9[4] = a4;
    -[NSFilePresenterXPCMessenger _makePresenter:accommodateDeletionWithSubitemURL:completionHandler:]( self,  "_makePresenter:accommodateDeletionWithSubitemURL:completionHandler:",  filePresenter,  v7,  v9);
  }

  else if (self->_filePresenterProxy)
  {
    id v8 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a accommodateDeletionOfSubitemAtURL: message",  buf,  2u);
    }
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2;
  v4[3] = &unk_189C9E898;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:](&OBJC_CLASS___NSFileCoordinator, "_performBarrierAsync:", v4);
}

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)observeChangeWithSubitemURL:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeChangeWithSubitemURL:]( self,  "_makePresenter:observeChangeWithSubitemURL:",  filePresenter,  [a3 URL]);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeChangeWithSubitemURL: message",  v5,  2u);
    }
  }

- (void)observeMoveToURL:(id)a3 withSubitemURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  if (self->_filePresenter)
  {
    objc_msgSend(a3, "logicalURL", a3, a4, a5);
    _CFURLNoteSecurityScopedResourceMoved();
    -[NSFilePresenterXPCMessenger _makePresenter:observeMoveToURL:withSubitemURL:]( self,  "_makePresenter:observeMoveToURL:withSubitemURL:",  self->_filePresenter,  [a3 URL],  objc_msgSend(a4, "URL"));
  }

  else if (self->_filePresenterProxy)
  {
    id v14 = -[NSXPCConnection userInfo]( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  "userInfo");
    if (object_getClass(v14) != (Class)&OBJC_CLASS___NSFileSubarbitrationClaim) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessArbiter.m",  3510LL,  @"Wrong class in connection userInfo: %@",  objc_opt_class());
    }
    -[NSFilePresenterProxy observeMoveOfSubitemAtURL:toURL:byWriterWithPurposeID:withFSID:andFileID:]( self->_filePresenterProxy,  "observeMoveOfSubitemAtURL:toURL:byWriterWithPurposeID:withFSID:andFileID:",  a4,  a3,  a5,  a6,  a7);
  }

- (void)observeDisconnection
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveDisconnection:](self, "_makePresenterObserveDisconnection:");
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeDisconnection message",  v3,  2u);
    }
  }

- (void)observeReconnection
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveReconnection:](self, "_makePresenterObserveReconnection:");
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeReconnection message",  v3,  2u);
    }
  }

- (void)observeUbiquityChangeWithSubitemURL:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeUbiquityChangeWithSubitemURL:]( self,  "_makePresenter:observeUbiquityChangeWithSubitemURL:",  filePresenter,  [a3 URL]);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeUbiquityChangeWithSubitemURL: message",  v5,  2u);
    }
  }

- (void)observeSharingChangeWithSubitemURL:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeSharingChangeWithSubitemURL:]( self,  "_makePresenter:observeSharingChangeWithSubitemURL:",  filePresenter,  [a3 URL]);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeSharingChangeWithSubitemURL: message",  v5,  2u);
    }
  }

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeChangeOfUbiquityAttributes:]( self,  "_makePresenter:observeChangeOfUbiquityAttributes:");
  }

  else if (self->_filePresenterProxy)
  {
    v3 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeChangeOfUbiquityAttributes: message",  v4,  2u);
    }
  }

- (void)observeVersionChangeOfKind:(id)a3 toItemAtURL:(id)a4 withClientID:(id)a5 name:(id)a6
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeVersionChangeOfKind:withClientID:name:subitemURL:]( self,  "_makePresenter:observeVersionChangeOfKind:withClientID:name:subitemURL:",  filePresenter,  a3,  a5,  a6,  [a4 URL]);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v7 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observeVersionChangeOfKind: message",  v8,  2u);
    }
  }

- (void)observePresenterChange:(BOOL)a3 forSubitemAtURL:(id)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  self->_filePresenter);
    id v8 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543875;
      id v15 = v7;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      __int16 v18 = 2113;
      id v19 = a4;
      _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ observe presenter change: %d at %{private}@",  buf,  0x1Cu);
    }

    id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  self->_filePresenter,  @"Observe Presenter Change");
    v10 = (void *)-[NSFilePresenter presentedItemOperationQueue](self->_filePresenter, "presentedItemOperationQueue");
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke;
    v12[3] = &unk_189CA4958;
    v12[4] = v9;
    v12[5] = self;
    BOOL v13 = v5;
    v12[6] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v12);
  }

  else if (self->_filePresenterProxy)
  {
    uint64_t v11 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a observePresenterChange: message",  buf,  2u);
    }
  }

uint64_t __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)updateLastEventID:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setLastPresentedItemEventIdentifier:]( self,  "_makePresenter:setLastPresentedItemEventIdentifier:");
  }

  else if (self->_filePresenterProxy)
  {
    v3 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a updateLastEventID: message",  v4,  2u);
    }
  }

- (void)setProviderPurposeIdentifier:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setProviderPurposeIdentifier:]( self,  "_makePresenter:setProviderPurposeIdentifier:");
  }

  else if (self->_filePresenterProxy)
  {
    v3 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_FAULT,  "A server unexpectedly received a setProviderPurposeIdentifier: message",  v4,  2u);
    }
  }

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
}

- (void)logSuspensionWarning
{
  filePresenter = self->_filePresenter;
  if (filePresenter) {
    v3 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"File presenter %@ with presentedItemURL %@",  filePresenter,  objc_msgSend((id)-[NSFilePresenter presentedItemURL](self->_filePresenter, "presentedItemURL"), "path"));
  }
  else {
    v3 = (NSString *)@"An unknown file presenter";
  }
  NSLog( (NSString *)@"%@ was still registered at the time this application was suspended, and implements one or more NSFilePresenter messages requiring a response. For NSFilePresenters for file system locations that are accessible to other processes (e.g. iCloud or group containers), you should either call removeFilePresenter: when the process is backgrounded, or remove any implementations of NSFilePresenter methods requiring a response. Otherwise, the system will kill your process instead of risking deadlock.",  v3);
}

- (void)_makePresenter:(id)a3 saveChangesWithCompletionHandler:(id)a4
{
  uint8_t v8[8] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Save Changes");
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke;
    v8[3] = &unk_189CA49A8;
    v8[4] = a3;
    v8[5] = v7;
    v8[6] = self;
    v8[7] = a4;
    objc_msgSend( (id)objc_msgSend(a3, "presentedItemOperationQueue"),  "addOperation:",  +[NSFilePresenterAsynchronousOperation operationWithBlock:]( NSFilePresenterAsynchronousOperation,  "operationWithBlock:",  v8));
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 32));
  uint64_t v5 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ savePresentedItemChanges",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  uint64_t v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_415;
  v9[3] = &unk_189CA4C00;
  v9[4] = v4;
  __int128 v10 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v11 = a2;
  uint64_t v12 = v7;
  return [v6 savePresentedItemChangesWithCompletionHandler:v9];
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_415( uint64_t a1,  uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished savePresentedItemChanges", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_416;
  block[3] = &unk_189CA4980;
  uint64_t v8 = *(void *)(a1 + 64);
  block[5] = a2;
  block[6] = v8;
  block[1] = 3221225472LL;
  block[4] = v6;
  dispatch_async(v7, block);
  return [*(id *)(a1 + 56) finish];
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_416( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_makePresenter:(id)a3 reportUnsavedChangesWithCompletionHandler:(id)a4
{
  v10[9] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Report Unsaved Changes");
    id v9 = (void *)[a3 presentedItemOperationQueue];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke;
    v10[3] = &unk_189CA04C0;
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = a3;
    v10[7] = self;
    v10[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v10);
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ reportUnsavedChanges",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  id v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_422;
  v7[3] = &unk_189CA4408;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  return [v4 presentedItemHasUnsavedChangesWithCompletionHandler:v7];
}

void __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_422( uint64_t a1,  int a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v5 = "NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      __int128 v5 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = v5;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished reportUnsavedChanges with reply: %s",  buf,  0x16u);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v7 = *(void *)(a1 + 40);
  __int128 v8 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_425;
  block[3] = &unk_189CA49D0;
  block[1] = 3221225472LL;
  uint64_t v9 = *(void *)(a1 + 56);
  block[4] = v7;
  block[5] = v9;
  char v11 = a2;
  dispatch_async(v8, block);
}

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_425( uint64_t a1)
{
  return (*(uint64_t (**)(void, NSNumber *))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
}

- (void)_makePresenter:(id)a3 validateRemoteDeletionRecordingRelinquishment:(id)a4 completionHandler:(id)a5
{
  void v9[6] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke;
    v9[3] = &unk_189CA49F8;
    v9[4] = a3;
    void v9[5] = self;
    [a4 performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:v9 withReply:a5];
  }

  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1LL);
  }

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 32));
  id v5 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  *(void *)(a1 + 32),  @"Validate Deletion");
  uint64_t v6 = (void *)[*(id *)(a1 + 32) presentedItemOperationQueue];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2;
  v8[3] = &unk_189CA04C0;
  v8[4] = v4;
  v8[5] = v5;
  __int128 v9 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = a2;
  return objc_msgSend(v6, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ validatePresentedItemDeletion",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  id v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_430;
  v7[3] = &unk_189CA4408;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  return [v4 validatePresentedItemRemoteDeletionWithCompletionHandler:v7];
}

void __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_430( uint64_t a1,  int a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v5 = "NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      __int128 v5 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = v5;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished validatePresentedItemDeletion with reply: %s",  buf,  0x16u);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v7 = *(void *)(a1 + 40);
  __int128 v8 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_431;
  block[3] = &unk_189CA49D0;
  block[1] = 3221225472LL;
  uint64_t v9 = *(void *)(a1 + 56);
  block[4] = v7;
  block[5] = v9;
  char v11 = a2;
  dispatch_async(v8, block);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_431( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_makePresenter:(id)a3 accommodateDeletionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Accommodate Subitem Deletion");
      char v11 = (void *)[a3 presentedItemOperationQueue];
      uint64_t v23 = MEMORY[0x1895F87A8];
      uint64_t v24 = 3221225472LL;
      v25 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke;
      v26 = &unk_189CA3998;
      id v27 = v9;
      id v28 = a4;
      id v29 = v10;
      id v30 = a3;
      v31 = self;
      id v32 = a5;
      uint64_t v12 = &v23;
LABEL_6:
      objc_msgSend( v11,  "_fc_addUncancellableOperationForReactorID:block:",  v9,  v12,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
      return;
    }
  }

  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Accommodate Deletion");
    char v11 = (void *)[a3 presentedItemOperationQueue];
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2;
    BOOL v17 = &unk_189CA04C0;
    id v18 = v9;
    id v19 = v13;
    id v20 = a3;
    v21 = self;
    id v22 = a5;
    uint64_t v12 = &v14;
    goto LABEL_6;
  }

  (*((void (**)(id, void))a5 + 2))(a5, 0LL);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v12 = v3;
    __int16 v13 = 2113;
    uint64_t v14 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ accommodateSubitemDeletion for %{private}@",  buf,  0x16u);
  }

  [*(id *)(a1 + 48) didBegin];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_437;
  v9[3] = &unk_189CA4A20;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v7;
  __int128 v10 = *(_OWORD *)(a1 + 64);
  return [v6 accommodatePresentedSubitemDeletionAtURL:v5 completionHandler:v9];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_437( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemDeletion", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_438;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_438( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ accommodateDeletion",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_443;
  v7[3] = &unk_189CA4A20;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  return [v4 accommodatePresentedItemDeletionWithCompletionHandler:v7];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_443( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateDeletion", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_444;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_444( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_makePresenter:(id)a3 accommodateEvictionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Accommodate Subitem Eviction");
      uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
      uint64_t v23 = MEMORY[0x1895F87A8];
      uint64_t v24 = 3221225472LL;
      v25 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke;
      v26 = &unk_189CA3998;
      id v27 = v9;
      id v28 = a4;
      id v29 = v10;
      id v30 = a3;
      v31 = self;
      id v32 = a5;
      uint64_t v12 = &v23;
LABEL_6:
      objc_msgSend( v11,  "_fc_addUncancellableOperationForReactorID:block:",  v9,  v12,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
      return;
    }
  }

  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Accommodate Eviction");
    uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2;
    BOOL v17 = &unk_189CA04C0;
    id v18 = v9;
    id v19 = v13;
    id v20 = a3;
    v21 = self;
    id v22 = a5;
    uint64_t v12 = &v14;
    goto LABEL_6;
  }

  (*((void (**)(id, void))a5 + 2))(a5, 0LL);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v12 = v3;
    __int16 v13 = 2113;
    uint64_t v14 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ accommodateSubitemEviction for %{private}@",  buf,  0x16u);
  }

  [*(id *)(a1 + 48) didBegin];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_449;
  v9[3] = &unk_189CA4A20;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v7;
  __int128 v10 = *(_OWORD *)(a1 + 64);
  return [v6 accommodatePresentedSubitemEvictionAtURL:v5 completionHandler:v9];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_449( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemEviction", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_450;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_450( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ accommodateEviction",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_455;
  v7[3] = &unk_189CA4A20;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  return [v4 accommodatePresentedItemEvictionWithCompletionHandler:v7];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_455( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateEviction", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_456;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_456( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_makePresenter:(id)a3 accommodateDisconnectionWithCompletionHandler:(id)a4
{
  v10[9] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Accommodate Disconnection");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke;
    v10[3] = &unk_189CA04C0;
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = a3;
    v10[7] = self;
    v10[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v10);
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ accommodateDisconnection",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_461;
  v7[3] = &unk_189CA4A20;
  __int128 v5 = *(_OWORD *)(a1 + 56);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  return [v4 accommodatePresentedItemDisconnectionWithCompletionHandler:v7];
}

void __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_461( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_INFO, "%{public}@ finished accommodateDisconnection", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_462;
  block[3] = &unk_189CA4980;
  block[1] = 3221225472LL;
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_462( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_makePresenter:(id)a3 observeChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v7 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_182EB1000, v7, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ observe change", buf, 0xCu);
  }

  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Subitem Did Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_189CA16F0;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    __int128 v10 = v13;
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Did Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_189C991F0;
    v12[4] = v11;
    v12[5] = a3;
    __int128 v10 = v12;
  }

  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenter:(id)a3 observeMoveToURL:(id)a4 withSubitemURL:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  __int128 v9 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v19 = v8;
    __int16 v20 = 2113;
    id v21 = a4;
    _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ observe move to URL: %{private}@",  buf,  0x16u);
  }

  if (a5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Subitem Did Move");
      id v11 = (void *)[a3 presentedItemOperationQueue];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke;
      v17[3] = &unk_189CA47E8;
      v17[4] = v10;
      v17[5] = a3;
      v17[6] = a5;
      v17[7] = a4;
      uint64_t v12 = v17;
    }

    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Did Change");
      id v11 = (void *)[a3 presentedItemOperationQueue];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2;
      v16[3] = &unk_189C991F0;
      v16[4] = v14;
      v16[5] = a3;
      uint64_t v12 = v16;
    }
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Did Move");
    id v11 = (void *)[a3 presentedItemOperationQueue];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3;
    v15[3] = &unk_189CA16F0;
    v15[4] = v13;
    v15[5] = a3;
    v15[6] = a4;
    uint64_t v12 = v15;
  }

  objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v8, v12);
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenterObserveDisconnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  uint64_t v5 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_182EB1000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe disconnection", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Disconnection");
    id v7 = (void *)[a3 presentedItemOperationQueue];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke;
    v8[3] = &unk_189C991F0;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }

uint64_t __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenterObserveReconnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  uint64_t v5 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_182EB1000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe reconnection", buf, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Reconnection");
    id v7 = (void *)[a3 presentedItemOperationQueue];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke;
    v8[3] = &unk_189C991F0;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }

uint64_t __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenter:(id)a3 observeUbiquityChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v7 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ observe ubiquity change",  buf,  0xCu);
  }

  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Subitem Ubiquity Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_189CA16F0;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    id v10 = v13;
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Ubiquity Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_189C991F0;
    v12[4] = v11;
    v12[5] = a3;
    id v10 = v12;
  }

  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenter:(id)a3 observeSharingChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v7 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ observe sharing change",  buf,  0xCu);
  }

  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Subitem Sharing Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_189CA16F0;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    id v10 = v13;
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Observe Sharing Change");
    __int128 v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_189C991F0;
    v12[4] = v11;
    v12[5] = a3;
    id v10 = v12;
  }

  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnd];
}

- (void)_makePresenter:(id)a3 observeChangeOfUbiquityAttributes:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v8 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = a4;
    _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ observe ubiquity attributes change: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSFilePresenterXPCMessenger _makePresenter:observeUbiquityChangeWithSubitemURL:]( self,  "_makePresenter:observeUbiquityChangeWithSubitemURL:",  a3,  0LL);
  }
}

- (void)_makePresenter:(id)a3 observeVersionChangeOfKind:(id)a4 withClientID:(id)a5 name:(id)a6 subitemURL:(id)a7
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke;
  v23[3] = &unk_189CA4A48;
  v23[4] = a7;
  v23[5] = a3;
  v23[6] = a5;
  v23[7] = a6;
  id v13 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v14 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v13;
    _os_log_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ observe version change",  buf,  0xCu);
  }

  if ([a4 isEqualToString:@"added"])
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v22[0] = v12;
      v22[1] = 3221225472LL;
      v22[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_509;
      v22[3] = &unk_189CA04E8;
      v22[5] = a7;
      v22[6] = v23;
      v22[4] = a3;
      uint64_t v16 = v22;
    }

    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v21[0] = v12;
      v21[1] = 3221225472LL;
      v21[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2;
      v21[3] = &unk_189C9E898;
      v21[4] = a3;
      v21[5] = v23;
      uint64_t v16 = v21;
    }
  }

  else if ([a4 isEqualToString:@"removed"])
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v20[0] = v12;
      v20[1] = 3221225472LL;
      v20[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3;
      v20[3] = &unk_189CA04E8;
      v20[5] = a7;
      v20[6] = v23;
      v20[4] = a3;
      uint64_t v16 = v20;
    }

    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v19[0] = v12;
      v19[1] = 3221225472LL;
      v19[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4;
      v19[3] = &unk_189C9E898;
      v19[4] = a3;
      v19[5] = v23;
      uint64_t v16 = v19;
    }
  }

  else
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v18[0] = v12;
      v18[1] = 3221225472LL;
      v18[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5;
      v18[3] = &unk_189CA04E8;
      v18[5] = a7;
      v18[6] = v23;
      v18[4] = a3;
      uint64_t v16 = v18;
    }

    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v15 = (void *)[a3 presentedItemOperationQueue];
      v17[0] = v12;
      v17[1] = 3221225472LL;
      v17[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6;
      v17[3] = &unk_189C9E898;
      v17[4] = a3;
      v17[5] = v23;
      uint64_t v16 = v17;
    }
  }

  objc_msgSend(v15, "_fc_addUncancellableOperationForReactorID:block:", v13, v16);
}

id __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2 || (result = (id)[*(id *)(a1 + 40) presentedItemURL], (id v2 = result) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v4 = [*(id *)(a1 + 40) _presentedItemTemporaryVersionStorageIdentifier];
    }
    else {
      uint64_t v4 = 0LL;
    }
    return +[NSFileVersion _versionOfItemAtURL:forClientID:name:temporaryStorageIdentifier:evenIfDeleted:]( &OBJC_CLASS___NSFileVersion,  "_versionOfItemAtURL:forClientID:name:temporaryStorageIdentifier:evenIfDeleted:",  v2,  *(void *)(a1 + 48),  *(void *)(a1 + 56),  v4,  1LL);
  }

  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_509( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedSubitemAtURL:*(void *)(a1 + 40) didGainVersion:result];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedItemDidGainVersion:result];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedSubitemAtURL:*(void *)(a1 + 40) didLoseVersion:result];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedItemDidLoseVersion:result];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedSubitemAtURL:*(void *)(a1 + 40) didResolveConflictVersion:result];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (result) {
    return [*(id *)(a1 + 32) presentedItemDidResolveConflictVersion:result];
  }
  return result;
}

- (void)_makePresenter:(id)a3 setLastPresentedItemEventIdentifier:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
  id v7 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ setLastPresentedItemIdentifier: %llu",  buf,  0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = (void *)[a3 presentedItemOperationQueue];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke;
    v9[3] = &unk_189C9E2F8;
    v9[4] = a3;
    void v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastPresentedItemEventIdentifier:*(void *)(a1 + 40)];
}

- (void)_makePresenter:(id)a3 setProviderPurposeIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:");
  id v7 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = a4;
    _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "Making presenter %{public}@ setProviderPurposeIdentifier: %{public}@",  buf,  0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = (void *)[a3 presentedItemOperationQueue];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke;
    v9[3] = &unk_189C991F0;
    v9[4] = a3;
    void v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }

uint64_t __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) setProviderPurposeIdentifier:*(void *)(a1 + 40)];
}

- (id)_readRelinquishment
{
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject( self->_filePresenter,  "NSFilePresenterReadRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(&OBJC_CLASS___NSFilePresenterRelinquishment);
    objc_setAssociatedObject(self->_filePresenter, "NSFilePresenterReadRelinquishment", AssociatedObject, (void *)0x301);
  }

  return AssociatedObject;
}

- (id)_writeRelinquishment
{
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject( self->_filePresenter,  "NSFilePresenterWriteRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(&OBJC_CLASS___NSFilePresenterRelinquishment);
    objc_setAssociatedObject( self->_filePresenter,  "NSFilePresenterWriteRelinquishment",  AssociatedObject,  (void *)0x301);
  }

  return AssociatedObject;
}

- (void)_makePresenter:(id)a3 relinquishToAccessClaimWithID:(id)a4 purposeID:(id)a5 ifNecessaryUsingSelector:(SEL)a6 recordingRelinquishment:(id)a7 continuer:(id)a8
{
  v15[10] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke;
    v15[3] = &unk_189CA4B10;
    v15[4] = self;
    v15[5] = a3;
    v15[6] = a4;
    void v15[7] = a5;
    v15[8] = a7;
    v15[9] = a6;
    [a7 performRelinquishmentToAccessClaimIfNecessary:a4 usingBlock:v15 withReply:a8];
  }

  else
  {
    (*((void (**)(id))a8 + 2))(a8);
  }

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16LL));
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_idForReactor:",  *(void *)(a1 + 40));
  uint64_t v5 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    Name = sel_getName(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138543874;
    id v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2082;
    id v21 = Name;
    _os_log_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEFAULT,  "Asking presenter %{public}@ to relinquish to claim %{public}@ via %{public}s",  buf,  0x20u);
  }

  id v8 = (void *)[*(id *)(a1 + 40) presentedItemOperationQueue];
  id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  *(void *)(a1 + 40),  @"Relinquish");
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_529;
  v15[3] = &unk_189CA4AE8;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v15[4] = v9;
  v15[5] = v10;
  uint64_t v12 = *(void *)(a1 + 72);
  void v15[11] = a2;
  v15[12] = v12;
  uint64_t v13 = *(void *)(a1 + 32);
  v15[6] = *(void *)(a1 + 40);
  void v15[7] = v4;
  v15[8] = v13;
  v15[9] = v11;
  v15[10] = v8;
  return objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v4, v15);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_529( uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didBegin];
  +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:]( &OBJC_CLASS___NSFileCoordinator,  "_setCurrentClaimPurposeIdentifier:",  *(void *)(a1 + 40));
  v7[1] = 3221225472LL;
  __int128 v2 = *(_OWORD *)(a1 + 80);
  __int128 v8 = *(_OWORD *)(a1 + 64);
  uint64_t v3 = *(const char **)(a1 + 96);
  v7[0] = MEMORY[0x1895F87A8];
  v7[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2;
  v7[3] = &unk_189CA4AC0;
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  void v7[4] = *(void *)(a1 + 56);
  v7[5] = v5;
  id v9 = v4;
  __int128 v10 = v2;
  objc_msgSend(v4, v3, v7);
  return +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:]( &OBJC_CLASS___NSFileCoordinator,  "_setCurrentClaimPurposeIdentifier:",  0LL);
}

void __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ relinquished", buf, 0xCu);
  }

  [*(id *)(a1 + 40) willEnd];
  v9[1] = 3221225472LL;
  __int128 v6 = *(_OWORD *)(a1 + 64);
  id v7 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 16LL);
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v9[0] = MEMORY[0x1895F87A8];
  v9[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_530;
  v9[3] = &unk_189CA4A98;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  __int128 v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = a2;
  uint64_t v15 = *(void *)(a1 + 80);
  dispatch_async(v7, v9);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_530( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_531;
    v6[3] = &unk_189CA3238;
    __int128 v4 = *(_OWORD *)(a1 + 56);
    __int128 v7 = *(_OWORD *)(a1 + 40);
    __int128 v8 = v4;
    uint64_t v9 = v2;
    [v3 setReacquirer:v6];
  }

  [*(id *)(a1 + 72) didEnd];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_531( void *a1,  uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16LL));
  __int128 v4 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v5;
    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Telling presenter %{public}@ to reacquire", buf, 0xCu);
  }

  id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a1[6],  @"Reacquire");
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_534;
  uint64_t v14 = &unk_189CA4A70;
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  id v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  uint64_t v18 = a2;
  uint64_t v9 = (void *)a1[7];
  uint64_t v19 = a1[8];
  return objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:");
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_534( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didBegin];
  uint64_t TSD = NSFileCoordinatorGetTSD();
  v5[0] = MEMORY[0x1895F87A8];
  v5[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_536;
  v5[3] = &unk_189CA37F0;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v5[1] = 3221225472LL;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  *(void *)(TSD + 16) = +[NSFileCoordinatorReacquisitionBlockCompletion completionWithBlock:queue:]( &OBJC_CLASS___NSFileCoordinatorReacquisitionBlockCompletion,  "completionWithBlock:queue:",  v5,  *(void *)(v3 + 16));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  [*(id *)(a1 + 32) willEnd];
  uint64_t result = [*(id *)(TSD + 16) decrement];
  *(void *)(TSD + 16) = 0LL;
  return result;
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_536( uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_182EB1000, v2, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ reacquired", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_makePresenter:(id)a3 relinquishToReadingClaimWithID:(id)a4 purposeID:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  int v8 = a6;
  v17[5] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke;
  v17[3] = &unk_189C9DCE8;
  v17[4] = a7;
  if ((v8 & 1) != 0)
  {
    uint64_t v14 = v17;
  }

  else
  {
    if ((v8 & 0x10000) != 0)
    {
      uint64_t v16 = MEMORY[0x1895F87A8];
      uint64_t v13 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2;
      uint64_t v14 = &v16;
    }

    else
    {
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v13 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4;
      uint64_t v14 = &v15;
    }

    v14[1] = 3221225472LL;
    v14[2] = (uint64_t)v13;
    v14[3] = (uint64_t)&unk_189CA37F0;
    v14[4] = (uint64_t)self;
    v14[5] = (uint64_t)a3;
    void v14[6] = (uint64_t)a7;
  }

  -[NSFilePresenterXPCMessenger _makePresenter:relinquishToAccessClaimWithID:purposeID:ifNecessaryUsingSelector:recordingRelinquishment:continuer:]( self,  "_makePresenter:relinquishToAccessClaimWithID:purposeID:ifNecessaryUsingSelector:recordingRelinquishment:continuer:",  a3,  a4,  a5,  sel_relinquishPresentedItemToReader_,  -[NSFilePresenterXPCMessenger _readRelinquishment](self, "_readRelinquishment", v15),  v14);
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2( uint64_t a1)
{
  v3[7] = *MEMORY[0x1895F89C0];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3;
  v3[3] = &unk_189CA4B38;
  v3[4] = v1;
  return [v1 _makePresenter:*(void *)(a1 + 40) reportUnsavedChangesWithCompletionHandler:v3];
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  if (!a2) {
    return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) saveChangesWithCompletionHandler:*(void *)(a1 + 48)];
  }
  int v3 = [a2 BOOLValue];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    int v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3072LL,  0LL);
    uint64_t v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
    uint64_t v7 = v4;
  }

  else
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
    uint64_t v7 = v4;
    int v5 = 0LL;
  }

  return v6(v7, v5);
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) saveChangesWithCompletionHandler:*(void *)(a1 + 48)];
}

- (void)_makePresenter:(id)a3 relinquishToWritingClaimWithID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 completionHandler:(id)a8
{
  v35[5] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
  v35[3] = &unk_189C9DCE8;
  v35[4] = a8;
  if ((a5 & 4) != 0)
  {
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
    v34[3] = &unk_189CA37F0;
    v34[4] = self;
    v34[5] = a3;
    v34[6] = a8;
    uint64_t v16 = (id)[v34 copy];
  }

  else
  {
    uint64_t v16 = v35;
  }

  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  char v33 = 1;
  if ((a5 & 9) != 0)
  {
    v31[0] = v15;
    v31[1] = 3221225472LL;
    v31[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
    v31[3] = &unk_189CA4B60;
    v31[7] = a8;
    v31[8] = v32;
    v31[4] = self;
    v31[5] = a3;
    v31[6] = a7;
    uint64_t v16 = (id)[v31 copy];
  }

  if ((a5 & 0x100000) != 0)
  {
    v30[0] = v15;
    v30[1] = 3221225472LL;
    v30[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4;
    v30[3] = &unk_189CA0838;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = a7;
    v30[7] = a8;
    uint64_t v16 = (id)[v30 copy];
  }

  if ((a5 & 0x10000) != 0)
  {
    v29[0] = v15;
    v29[1] = 3221225472LL;
    v29[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5;
    v29[3] = &unk_189CA4BB0;
    v29[4] = self;
    v29[5] = a3;
    v29[6] = a8;
    v29[7] = a5;
    uint64_t v16 = (id)[v29 copy];
  }

  id v17 = -[NSFilePresenterXPCMessenger _writeRelinquishment](self, "_writeRelinquishment");
  v20[0] = v15;
  v20[1] = 3221225472LL;
  uint64_t v21 = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7;
  uint64_t v22 = &unk_189CA3998;
  uint64_t v23 = self;
  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = v17;
  id v28 = v16;
  if ((a5 & 1) != 0)
  {
    if (([a6 isEqualToString:@"com.apple.icloud.drive"] & 1) != 0
      || ([a6 isEqualToString:@"com.apple.bird"] & 1) != 0)
    {
      filePresenter = self->_filePresenter;
      v19[0] = v15;
      v19[1] = 3221225472LL;
      v19[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8;
      v19[3] = &unk_189CA4BD8;
      void v19[6] = v32;
      v19[4] = self;
      v19[5] = v20;
      -[NSFilePresenterXPCMessenger _makePresenter:validateRemoteDeletionRecordingRelinquishment:completionHandler:]( self,  "_makePresenter:validateRemoteDeletionRecordingRelinquishment:completionHandler:",  filePresenter,  v17,  v19);
    }

    else
    {
      v21((uint64_t)v20);
    }
  }

  else
  {
    __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7((uint64_t)v20);
  }

  _Block_object_dispose(v32, 8);
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) saveChangesWithCompletionHandler:*(void *)(a1 + 48)];
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3( uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
    return objc_msgSend( *(id *)(a1 + 32),  "_makePresenter:accommodateDeletionWithSubitemURL:completionHandler:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "URL"),  *(void *)(a1 + 56));
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_makePresenter:accommodateEvictionWithSubitemURL:completionHandler:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "URL"),  *(void *)(a1 + 56));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if ((*(_BYTE *)(a1 + 56) & 4) == 0) {
    return [v2 _makePresenter:v3 accommodateDisconnectionWithCompletionHandler:*(void *)(a1 + 48)];
  }
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = 3221225472LL;
  uint64_t v7 = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6;
  int v8 = &unk_189CA4B88;
  return objc_msgSend( v2,  "_makePresenter:saveChangesWithCompletionHandler:",  MEMORY[0x1895F87A8],  3221225472,  __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6,  &unk_189CA4B88,  v2,  v3,  *(void *)(a1 + 48));
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  else {
    return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) accommodateDisconnectionWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7( uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) relinquishToAccessClaimWithID:*(void *)(a1 + 48) purposeID:*(void *)(a1 + 56) ifNecessaryUsingSelector:sel_relinquishPresentedItemToWriter_ recordingRelinquishment:*(void *)(a1 + 64) continuer:*(void *)(a1 + 72)];
}

void __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8( uint64_t a1,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16LL), *(dispatch_block_t *)(a1 + 40));
}

- (void)_makePresenter:(id)a3 validateRelinquishmentToSubitemAtURL:(id)a4 completionHandler:(id)a5
{
  v12[10] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = +[NSFileAccessArbiterProxy _idForReactor:](&OBJC_CLASS___NSFileAccessArbiterProxy, "_idForReactor:", a3);
    id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:withDescription:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_willBeginOperationForReactor:withDescription:",  a3,  @"Validate Subitem Relinquishment");
    uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke;
    v12[3] = &unk_189CA3998;
    v12[4] = v9;
    v12[5] = a4;
    void v12[6] = v10;
    void v12[7] = a3;
    v12[8] = self;
    v12[9] = a5;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12);
  }

  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1LL);
  }

void __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v14 = v3;
    __int16 v15 = 2113;
    uint64_t v16 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ validate subitem relinquishment for URL: %{private}@",  buf,  0x16u);
  }

  [*(id *)(a1 + 48) didBegin];
  int v5 = [*(id *)(a1 + 56) shouldRelinquishToWriterOfSubitemAtURL:*(void *)(a1 + 40)];
  uint64_t v6 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "NO";
    uint64_t v8 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v7 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    uint64_t v16 = v7;
    _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished validate subitem relinquishment with reply: %s",  buf,  0x16u);
  }

  [*(id *)(a1 + 48) willEnd];
  uint64_t v9 = *(void *)(a1 + 72);
  id v10 = *(dispatch_queue_s **)(*(void *)(a1 + 64) + 16LL);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_551;
  block[3] = &unk_189CA49D0;
  block[1] = 3221225472LL;
  block[4] = *(void *)(a1 + 48);
  block[5] = v9;
  char v12 = v5;
  dispatch_async(v10, block);
}

uint64_t __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_551( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end