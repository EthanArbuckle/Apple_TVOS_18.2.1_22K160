@interface NSFileCoordinator
+ (BOOL)_itemHasPresentersAtURL:(id)a3;
+ (BOOL)_provideRecursively;
+ (BOOL)_skipCoordinationWork;
+ (NSArray)filePresenters;
+ (id)_canonicalURLForURL:(id)a3;
+ (id)_createConnectionToFileAccessArbiterForQueue:(id)a3;
+ (id)_createConnectionToProgressRegistrar;
+ (id)_createIdentifierForNewClaim;
+ (id)_currentClaimPurposeIdentifier;
+ (id)_currentFileCoordinator;
+ (id)_endpointForInProcessFileCoordinationServer;
+ (id)_fileAccessArbiterInterface;
+ (id)_filePresenterInterface;
+ (id)_fileProviderInterface;
+ (id)_fileProviders;
+ (id)_inProcessFileAccessArbiter;
+ (id)_kernelMaterializationInfo;
+ (id)_nextClaimIdentifier;
+ (id)_observedUbiquityAttributesForPresenterWithID:(id)a3;
+ (int)_processIdentifierForID:(id)a3;
+ (unint64_t)_providedItemGenerationCount;
+ (unint64_t)_readingOptions;
+ (unint64_t)_responsesForPresenter:(id)a3;
+ (unsigned)_kernelMaterializationOperation;
+ (void)__itemAtURL:(id)a3 didChangeUbiquityWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didChangeWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didDisappearWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didDisconnectWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didGainVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)__itemAtURL:(id)a3 didLoseVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)__itemAtURL:(id)a3 didMoveToURL:(id)a4 purposeID:(id)a5;
+ (void)__itemAtURL:(id)a3 didReconnectWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didResolveConflictVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)_accessPresenterInfoUsingBlock:(id)a3;
+ (void)_addFileProvider:(id)a3;
+ (void)_addFileProvider:(id)a3 completionHandler:(id)a4;
+ (void)_addProcessIdentifier:(int)a3 observedUbiquityAttributes:(id)a4 forID:(id)a5;
+ (void)_adoptFCDEndpointForTest:(id)a3;
+ (void)_getDebugInfoWithCompletionHandler:(id)a3;
+ (void)_performBarrier;
+ (void)_performBarrierAsync:(id)a3;
+ (void)_removeFileProvider:(id)a3;
+ (void)_removeInfoForID:(id)a3;
+ (void)_setAutomaticFileProviderReregistrationDisabled:(BOOL)a3;
+ (void)_setCurrentClaimPurposeIdentifier:(id)a3;
+ (void)_setKernelMaterializationInfo:(id)a3;
+ (void)_setNextClaimIdentifier:(id)a3;
+ (void)_setProvidedItemRecursiveGenerationCount:(unint64_t)a3;
+ (void)_setReadingOptions:(unint64_t)a3;
+ (void)_startInProcessFileCoordinationAndProgressServers;
+ (void)_stopInProcessFileCoordinationAndProgressServers;
+ (void)addFilePresenter:(id)filePresenter;
+ (void)removeFilePresenter:(id)filePresenter;
- (BOOL)_isValidUbiquityAttribute:(id)a3;
- (BOOL)_purposeIdentifierLockedDown;
- (NSFileCoordinator)init;
- (NSFileCoordinator)initWithFilePresenter:(id)filePresenterOrNil;
- (NSString)purposeIdentifier;
- (id)_willStartWriteWithIntents:(id)a3 async:(BOOL)a4;
- (id)retainAccess;
- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6;
- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8;
- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6;
- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8;
- (void)__prepareForReadingItemsAtURLs:(id)a3 options:(unint64_t)a4 writingItemsAtURLs:(id)a5 options:(unint64_t)a6 byAccessor:(id)a7;
- (void)_cancelClaimWithIdentifier:(id)a3;
- (void)_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5;
- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8;
- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8;
- (void)_didEndWrite:(id)a3;
- (void)_forgetAccessClaimForID:(id)a3;
- (void)_invokeAccessor:(id)a3 thenCompletionHandler:(id)a4;
- (void)_itemAtURL:(id)a3 didMoveToURL:(id)a4;
- (void)_itemDidChangeAtURL:(id)a3;
- (void)_itemDidDisappearAtURL:(id)a3;
- (void)_lockdownPurposeIdentifier;
- (void)_requestAccessClaim:(id)a3 withProcedure:(id)a4;
- (void)_setFileProvider:(id)a3;
- (void)_setPurposeIdentifier:(id)a3;
- (void)_ubiquityDidChangeForItemAtURL:(id)a3;
- (void)_withAccessArbiter:(id)a3 invokeAccessor:(id)a4 orDont:(BOOL)a5 andRelinquishAccessClaim:(id)a6;
- (void)cancel;
- (void)coordinateAccessWithIntents:(NSArray *)intents queue:(NSOperationQueue *)queue byAccessor:(void *)accessor;
- (void)coordinateReadingItemAtURL:(NSURL *)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL *)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)readerWriter;
- (void)coordinateReadingItemAtURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options error:(NSError *)outError byAccessor:(void *)reader;
- (void)coordinateWritingItemAtURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options error:(NSError *)outError byAccessor:(void *)writer;
- (void)coordinateWritingItemAtURL:(NSURL *)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL *)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError *)outError byAccessor:(void *)writer;
- (void)dealloc;
- (void)itemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL;
- (void)itemAtURL:(NSURL *)oldURL willMoveToURL:(NSURL *)newURL;
- (void)itemAtURL:(NSURL *)url didChangeUbiquityAttributes:(NSSet *)attributes;
- (void)prepareForReadingItemsAtURLs:(NSArray *)readingURLs options:(NSFileCoordinatorReadingOptions)readingOptions writingItemsAtURLs:(NSArray *)writingURLs options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)batchAccessor;
- (void)releaseAccess:(id)a3;
- (void)setPurposeIdentifier:(NSString *)purposeIdentifier;
- (void)sharingDidChangeForItemAtURL:(id)a3;
@end

@implementation NSFileCoordinator

+ (void)addFilePresenter:(id)filePresenter
{
}

+ (void)removeFilePresenter:(id)filePresenter
{
}

+ (NSArray)filePresenters
{
  return (NSArray *)-[NSFileAccessArbiterProxy filePresenters](NSFileCoordinatorSharedAccessArbiter(), "filePresenters");
}

- (NSFileCoordinator)init
{
  return -[NSFileCoordinator initWithFilePresenter:](self, "initWithFilePresenter:", 0LL);
}

- (NSFileCoordinator)initWithFilePresenter:(id)filePresenterOrNil
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileCoordinator;
  v4 = -[NSFileCoordinator init](&v8, sel_init);
  if (v4)
  {
    v4->_accessArbiter = NSFileCoordinatorSharedAccessArbiter();
    id v5 = filePresenterOrNil;
    v4->_fileReactor = v5;
    if (!v4->_purposeID)
    {
      if (v5)
      {
        v4->_purposeID = (id)objc_msgSend((id)objc_msgSend(v4->_accessArbiter, "idForFileReactor:", v5), "copy");
        -[NSFileCoordinator _lockdownPurposeIdentifier](v4, "_lockdownPurposeIdentifier");
      }

      else
      {
        v6 = CFUUIDCreate(0LL);
        v4->_purposeID = (id)CFUUIDCreateString(0LL, v6);
        CFRelease(v6);
      }
    }

    v4->_recentFilePresenterURL = (NSURL *)objc_msgSend( (id)objc_msgSend(filePresenterOrNil, "presentedItemURL"),  "copy");
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileCoordinator;
  -[NSFileCoordinator dealloc](&v3, sel_dealloc);
}

- (void)setPurposeIdentifier:(NSString *)purposeIdentifier
{
  if (-[NSFileCoordinator _purposeIdentifierLockedDown](self, "_purposeIdentifierLockedDown"))
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: A purpose identifier can't be set more than once.",  _NSMethodExceptionProem((objc_class *)self, a2));
    v7 = (void *)MEMORY[0x189603F70];
    objc_super v8 = (void *)MEMORY[0x189603A48];
  }

  else
  {
    if (-[NSString length](purposeIdentifier, "length"))
    {
      -[NSFileCoordinator _setPurposeIdentifier:](self, "_setPurposeIdentifier:", purposeIdentifier);
      return;
    }

    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: A nil or zero-length purpose identifier is not allowed.",  _NSMethodExceptionProem((objc_class *)self, a2));
    v7 = (void *)MEMORY[0x189603F70];
    objc_super v8 = (void *)MEMORY[0x189603A60];
  }

  objc_exception_throw((id)[v7 exceptionWithName:*v8 reason:v6 userInfo:0]);
  -[NSFileCoordinator purposeIdentifier](v9, v10);
}

- (NSString)purposeIdentifier
{
  return (NSString *)self->_purposeID;
}

+ (id)_canonicalURLForURL:(id)a3
{
  return a3;
}

- (void)_invokeAccessor:(id)a3 thenCompletionHandler:(id)a4
{
  TSD = (uint64_t *)NSFileCoordinatorGetTSD();
  uint64_t v8 = *TSD;
  uint64_t *TSD = (uint64_t)self;
  uint64_t v9 = +[NSFileCoordinatorAccessorBlockCompletion completionWithBlock:]( &OBJC_CLASS___NSFileCoordinatorAccessorBlockCompletion,  "completionWithBlock:",  a4);
  TSD[1] = (uint64_t)v9;
  (*((void (**)(id))a3 + 2))(a3);
  uint64_t *TSD = v8;
  -[NSFileCoordinatorAccessorBlockCompletion decrement](v9, "decrement");
  TSD[1] = 0LL;
}

- (void)coordinateReadingItemAtURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options error:(NSError *)outError byAccessor:(void *)reader
{
  v6[6] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_189CA2B08;
  v6[4] = self;
  v6[5] = reader;
  -[NSFileCoordinator _coordinateReadingItemAtURL:options:error:byAccessor:]( self,  "_coordinateReadingItemAtURL:options:error:byAccessor:",  url,  options,  outError,  v6);
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6[6] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_189C9E898;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)coordinateWritingItemAtURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options error:(NSError *)outError byAccessor:(void *)writer
{
  v6[6] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_189CA2B08;
  v6[4] = self;
  v6[5] = writer;
  -[NSFileCoordinator _coordinateWritingItemAtURL:options:error:byAccessor:]( self,  "_coordinateWritingItemAtURL:options:error:byAccessor:",  url,  options,  outError,  v6);
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6[6] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_189C9E898;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)coordinateReadingItemAtURL:(NSURL *)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL *)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)readerWriter
{
  v8[6] = *MEMORY[0x1895F89C0];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_189CA2B30;
  v8[4] = self;
  v8[5] = readerWriter;
  -[NSFileCoordinator _coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:]( self,  "_coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:",  readingURL,  readingOptions,  writingURL,  writingOptions,  outError,  v8);
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  void v6[7] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_189CA04E8;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)coordinateWritingItemAtURL:(NSURL *)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL *)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError *)outError byAccessor:(void *)writer
{
  v8[6] = *MEMORY[0x1895F89C0];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_189CA2B30;
  v8[4] = self;
  v8[5] = writer;
  -[NSFileCoordinator _coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:]( self,  "_coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:",  url1,  options1,  url2,  options2,  outError,  v8);
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  void v6[7] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_189CA04E8;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)coordinateAccessWithIntents:(NSArray *)intents queue:(NSOperationQueue *)queue byAccessor:(void *)accessor
{
  v5[6] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke;
  v5[3] = &unk_189CA2B58;
  v5[4] = self;
  v5[5] = accessor;
  -[NSFileCoordinator _coordinateAccessWithIntents:queue:byAccessor:]( self,  "_coordinateAccessWithIntents:queue:byAccessor:",  intents,  queue,  v5);
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6[6] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2;
  v6[3] = &unk_189C9E898;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)prepareForReadingItemsAtURLs:(NSArray *)readingURLs options:(NSFileCoordinatorReadingOptions)readingOptions writingItemsAtURLs:(NSArray *)writingURLs options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)batchAccessor
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  v35 = __Block_byref_object_copy__24;
  v36 = __Block_byref_object_dispose__24;
  uint64_t v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  v29 = __Block_byref_object_copy__24;
  v30 = __Block_byref_object_dispose__24;
  uint64_t v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3052000000LL;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__12;
  uint64_t v25 = 0LL;
  v13 = dispatch_semaphore_create(0LL);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke;
  v19[3] = &unk_189CA2B80;
  v19[6] = &v26;
  v19[7] = &v20;
  v19[4] = v13;
  v19[5] = &v32;
  -[NSFileCoordinator __prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:byAccessor:]( self,  "__prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:byAccessor:",  readingURLs,  readingOptions,  writingURLs,  writingOptions,  v19);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v13);
  if (v27[5])
  {
    (*(void (**)(void))(v21[5] + 16))();

    if (outError) {
      *outError = (NSError *)(id)v27[5];
    }
  }

  else
  {
    id accessArbiter = self->_accessArbiter;
    self->_id accessArbiter = (id)v33[5];
    v18[0] = v14;
    v18[1] = 3221225472LL;
    v18[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2;
    v18[3] = &unk_189CA3210;
    v18[4] = self;
    v18[5] = accessArbiter;
    v18[6] = &v20;
    (*((void (**)(void *, void *))batchAccessor + 2))(batchAccessor, v18);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a4 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2( void *a1)
{
  *(void *)(a1[4] + 8LL) = a1[5];
  (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8LL) + 40LL) + 16LL))();
}

- (void)itemAtURL:(NSURL *)oldURL willMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() == self)
  {
    -[NSFileCoordinator _itemAtURL:willMoveToURL:](self, "_itemAtURL:willMoveToURL:", oldURL, newURL);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"-[NSFileCoordinator itemAtURL:willMoveToURL:] may only be invoked from within a block passed to a -coordinate... method." userInfo:0]);
    -[NSFileCoordinator itemAtURL:didMoveToURL:](v7, v8, v9, v10);
  }

- (void)itemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() == self)
  {
    -[NSFileCoordinator _itemAtURL:didMoveToURL:](self, "_itemAtURL:didMoveToURL:", oldURL, newURL);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"-[NSFileCoordinator itemAtURL:didMoveToURL:] may only be invoked from within a block passed to a -coordinate... method." userInfo:0]);
    -[NSFileCoordinator _isValidUbiquityAttribute:](v7, v8, v9);
  }

- (BOOL)_isValidUbiquityAttribute:(id)a3
{
  if (qword_18C497170 != -1) {
    dispatch_once(&qword_18C497170, &__block_literal_global_73);
  }
  return [(id)qword_18C497168 member:a3] != 0;
}

uint64_t __47__NSFileCoordinator__isValidUbiquityAttribute___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t result = objc_msgSend( v0,  "initWithObjects:",  *MEMORY[0x189603CA8],  *MEMORY[0x189603D58],  *MEMORY[0x189603D60],  *MEMORY[0x189603D78],  *MEMORY[0x189603D80],  *MEMORY[0x189603D50],  *MEMORY[0x189603D48],  *MEMORY[0x189603D88],  *MEMORY[0x189603D40],  *MEMORY[0x189603D38],  *MEMORY[0x189603D70],  *MEMORY[0x189603D98],  *MEMORY[0x189603D90],  *MEMORY[0x189603DA8],  *MEMORY[0x189603DA0],  0);
  qword_18C497168 = result;
  return result;
}

- (void)itemAtURL:(NSURL *)url didChangeUbiquityAttributes:(NSSet *)attributes
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!attributes) {
    goto LABEL_16;
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( attributes,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(attributes);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!-[NSFileCoordinator _isValidUbiquityAttribute:](self, "_isValidUbiquityAttribute:", v11))
        {
          v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid attribute: %@",  v11);
          uint64_t v14 = (void *)MEMORY[0x189603F70];
          uint64_t v15 = *MEMORY[0x189603A60];
          while (1)
          {
            objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v13 userInfo:0]);
LABEL_16:
            uint64_t v14 = (void *)MEMORY[0x189603F70];
            uint64_t v15 = *MEMORY[0x189603A60];
            v13 = (NSString *)@"nil attributes";
          }
        }
      }

      uint64_t v8 = -[NSSet countByEnumeratingWithState:objects:count:]( attributes,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
    }

    while (v8);
  }

  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    if (-[NSSet count](attributes, "count"))
    {
      v12 = (void *)MEMORY[0x186E1FF60]();
      objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:",  self->_purposeID,  attributes,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", url)));
      objc_autoreleasePoolPop(v12);
    }
  }

- (void)cancel
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(&stru_18C49712C);
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  objc_super v3 = (os_log_s *)qword_18C497138;
  if (os_log_type_enabled((os_log_t)qword_18C497138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = self;
    _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "NSFileCoordinator instance %p was cancelled. All future claims made on this instance will immediately fail with cancellation",  buf,  0xCu);
  }

  if (_NSIsNSSet())
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
    uint64_t v5 = [accessClaimIDOrIDs countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v17;
      *(void *)&__int128 v6 = 138543362LL;
      __int128 v14 = v6;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(accessClaimIDOrIDs);
          }
          SEL v10 = *(NSFileCoordinator **)(*((void *)&v16 + 1) + 8 * v9);
          if (qword_18C4971D8 != -1) {
            dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
          }
          uint64_t v11 = (os_log_s *)qword_18C497140;
          if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            uint64_t v21 = v10;
            _os_log_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEFAULT,  "In-flight claim %{public}@ was cancelled",  buf,  0xCu);
          }

          objc_msgSend(self->_accessArbiter, "cancelAccessClaimForID:", v10, v14);
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [accessClaimIDOrIDs countByEnumeratingWithState:&v16 objects:v15 count:16];
      }

      while (v7);
    }
  }

  else if (self->_accessClaimIDOrIDs)
  {
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    v12 = (os_log_s *)qword_18C497140;
    if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (NSFileCoordinator *)self->_accessClaimIDOrIDs;
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v13;
      _os_log_impl(&dword_182EB1000, v12, OS_LOG_TYPE_DEFAULT, "In-flight claim %{public}@ was cancelled", buf, 0xCu);
    }

    [self->_accessArbiter cancelAccessClaimForID:self->_accessClaimIDOrIDs];
  }

  self->_isCancelled = 1;
  os_unfair_lock_unlock(&stru_18C49712C);
}

+ (BOOL)_skipCoordinationWork
{
  if (qword_18C497178 != -1) {
    dispatch_once(&qword_18C497178, &__block_literal_global_67_1);
  }
  return _MergedGlobals_147;
}

void __53__NSFileCoordinator_NSPrivate___skipCoordinationWork__block_invoke()
{
  id v0 = (void *)MEMORY[0x186E1FF60]();
  BOOL v1 = (objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileCoordinatorDoesNothing") & 1) != 0 || getenv("NSDisableFileCoordination") != 0;
  _MergedGlobals_147 = v1;
  objc_autoreleasePoolPop(v0);
  if (_MergedGlobals_147) {
    NSLog((NSString *)@"NSFileCoordinator is doing nothing.");
  }
}

+ (id)_nextClaimIdentifier
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  id result = *(id *)(TSD + 32);
  if (!result)
  {
    id result = (id)__CFCreateUUIDString();
    *(void *)(TSD + 32) = result;
  }

  return result;
}

+ (void)_setNextClaimIdentifier:(id)a3
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  if (*(void *)(TSD + 32))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't set next claim identifier when current identifier has not been consumed" userInfo:0]);
    -[NSFileCoordinator _cancelClaimWithIdentifier:](v5, v6, v7);
  }

  else
  {
    *(void *)(TSD + 32) = [a3 copy];
  }

- (void)_cancelClaimWithIdentifier:(id)a3
{
}

- (void)_requestAccessClaim:(id)a3 withProcedure:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(&stru_18C49712C);
  if (self->_isCancelled)
  {
    os_unfair_lock_unlock(&stru_18C49712C);
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    id v7 = (os_log_s *)qword_18C497140;
    if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = [a3 claimID];
      __int16 v12 = 2048;
      v13 = self;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@ was probably made on an already-cancelled NSFileCoordinator instance (%p). It will be immediately can celled before being sent to the server.",  buf,  0x16u);
    }

    objc_msgSend( a3,  "setClaimerError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3072,  0));
    [a3 unblockClaimerForReason:0x189CC6E28];
  }

  else
  {
    if (self->_accessClaimIDOrIDs)
    {
      int v8 = _NSIsNSSet();
      id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
      if (v8)
      {
        objc_msgSend(accessClaimIDOrIDs, "addObject:", objc_msgSend(a3, "claimID"));
      }

      else
      {
        self->_id accessClaimIDOrIDs = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithObjects:",  accessClaimIDOrIDs,  objc_msgSend(a3, "claimID"),  0);
      }
    }

    else
    {
      self->_id accessClaimIDOrIDs = (id)[a3 claimID];
    }

    (*((void (**)(id))a4 + 2))(a4);
    os_unfair_lock_unlock(&stru_18C49712C);
  }

- (void)_forgetAccessClaimForID:(id)a3
{
  int v5 = _NSIsNSSet();
  id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
  if (v5)
  {
    [accessClaimIDOrIDs removeObject:a3];
  }

  else if (accessClaimIDOrIDs && [accessClaimIDOrIDs isEqual:a3])
  {

    self->_id accessClaimIDOrIDs = 0LL;
  }

  os_unfair_lock_unlock(&stru_18C49712C);
}

uint64_t __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:1];
  objc_super v3 = *(dispatch_object_s **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v3) {
    dispatch_retain(v3);
  }
  return -[NSAutoreleasePool drain](v2, "drain");
}

void __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke_2( uint64_t a1,  uint64_t a2)
{
}

- (id)_willStartWriteWithIntents:(id)a3 async:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  SEL v6 = (void *)[MEMORY[0x189603FA8] array];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke;
  v8[3] = &unk_189CA2C28;
  BOOL v9 = a4;
  v8[4] = a3;
  v8[5] = v6;
  [a3 enumerateObjectsUsingBlock:v8];
  return v6;
}

void __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v6 = [a2 URL];
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if ([a2 isRead]) {
    return;
  }
  char v8 = [a2 writingOptions];
  char v9 = v8;
  if (!*(_BYTE *)(a1 + 48))
  {
    if ((v8 & 1) != 0)
    {
      id v10 = +[NSMetadataQuery willBeginPossibleDeletionOfItemAtURL:]( &OBJC_CLASS___NSMetadataQuery,  "willBeginPossibleDeletionOfItemAtURL:",  v7);
      goto LABEL_9;
    }

    if ((v8 & 2) == 0)
    {
      id v10 = +[NSMetadataQuery willBeginPossibleCreationOfItemAtURL:]( &OBJC_CLASS___NSMetadataQuery,  "willBeginPossibleCreationOfItemAtURL:",  v7);
      goto LABEL_9;
    }

    unint64_t v15 = a3 + 1;
    if (v15 < [*(id *)(a1 + 32) count])
    {
      __int128 v16 = (void *)[*(id *)(a1 + 32) objectAtIndex:v15];
      if (([v16 isRead] & 1) == 0)
      {
        if ([v16 URL])
        {
          id v10 = +[NSMetadataQuery willBeginPossibleMoveOfItemAtURL:toURL:]( NSMetadataQuery,  "willBeginPossibleMoveOfItemAtURL:toURL:",  v7,  [v16 URL]);
LABEL_9:
          if (v10) {
            [*(id *)(a1 + 40) addObject:v10];
          }
        }
      }
    }
  }

  if (_CFURLIsItemPromiseAtURL())
  {
    if ((v9 & 3) != 0)
    {
      uint64_t v11 = _CFURLCopyLogicalURLOfPromiseAtURL();
      if (v11)
      {
        __int16 v12 = (const void *)v11;
        v13 = (void *)objc_opt_new();
        [v13 setPromiseURL:v7];
        [v13 setLogicalURL:v12];
        id v14 = v13;
        CFRelease(v12);
        if (v14) {
          [*(id *)(a1 + 40) addObject:v14];
        }
      }
    }
  }

- (void)_didEndWrite:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (object_getClass(v9) == (Class)&OBJC_CLASS___NSFilePromiseWriteToken)
        {
          if ((objc_msgSend((id)objc_msgSend(v9, "promiseURL"), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0) {
            -[NSFileCoordinator _itemDidDisappearAtURL:]( self,  "_itemDidDisappearAtURL:",  [v9 logicalURL]);
          }
        }

        else
        {
          +[NSMetadataQuery didEndPossibleFileOperation:]( &OBJC_CLASS___NSMetadataQuery,  "didEndPossibleFileOperation:",  v9);
        }
      }

      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v6);
  }

- (void)_withAccessArbiter:(id)a3 invokeAccessor:(id)a4 orDont:(BOOL)a5 andRelinquishAccessClaim:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v11 = [a6 claimID];
  if (v7)
  {
    [a3 revokeAccessClaimForID:v11];
    [a6 finished];
  }

  else
  {
    int v12 = [a6 shouldBeRevokedPriorToInvokingAccessor];
    char v13 = v12;
    if (v12)
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      __int128 v14 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        _os_log_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_INFO,  "Revoking claim %{public}@ prior to invoking accessor",  buf,  0xCu);
      }

      [a3 revokeAccessClaimForID:v11];
    }

    *(_DWORD *)buf = -1;
    int v23 = 1;
    int v15 = _NSSetThreadSpecificMaterializationState(1, (int *)buf);
    [a6 protectFilesAgainstEviction];
    if (v15)
    {
      else {
        int v16 = *(_DWORD *)buf;
      }
      if (_NSSetThreadSpecificMaterializationState(v16, &v23) && v23 != 1) {
        __assert_rtn( "-[NSFileCoordinator(NSPrivate) _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]",  "NSFileCoordinator.m",  962,  "materializationOffState == IOPOL_MATERIALIZE_DATALESS_FILES_OFF");
      }
      int v15 = [a6 shouldEnableMaterializationDuringAccessorBlock];
    }

    int v17 = [self->_fileReactor conformsToProtocol:&unk_18C68EA18];
    char v18 = v17;
    if (v17) {
      uint64_t v19 = [self->_fileReactor presentedItemURL];
    }
    else {
      uint64_t v19 = 0LL;
    }
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke;
    v20[3] = &unk_189CA2C50;
    char v21 = v18;
    v20[4] = self;
    v20[5] = v19;
    char v22 = v13;
    v20[6] = a3;
    v20[7] = v11;
    v20[8] = a6;
    (*((void (**)(id, void *))a4 + 2))(a4, v20);
    if (v15) {
      _NSSetThreadSpecificMaterializationState(*(int *)buf, &v24);
    }
  }

uint64_t __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke( uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_super v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) presentedItemURL];
    if (v3 != *(void **)(a1 + 40))
    {
      uint64_t v4 = v3;
      if ((objc_msgSend(v3, "isEqual:") & 1) == 0) {
        objc_msgSend( *(id *)(a1 + 48),  "tiePresenterForID:toItemAtURL:",  objc_msgSend(*(id *)(a1 + 48), "idForFileReactor:", *(void *)(*(void *)(a1 + 32) + 16)),  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", v4));
      }
    }
  }

  if (!*(_BYTE *)(a1 + 73)) {
    [*(id *)(a1 + 48) revokeAccessClaimForID:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) finished];
  return -[NSAutoreleasePool drain](v2, "drain");
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void *))a6 + 2))(a6, a3, &__block_literal_global_178_0);
  }

  else
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = &v36;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
      unint64_t v11 = a4 | 0x80000000;
    }
    else {
      unint64_t v11 = a4;
    }
    uint64_t v38 = 0x3052000000LL;
    v39 = __Block_byref_object_copy__24;
    v40 = __Block_byref_object_dispose__24;
    uint64_t v41 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3052000000LL;
    v33 = __Block_byref_object_copy__24;
    uint64_t v34 = __Block_byref_object_dispose__24;
    uint64_t v35 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000LL;
    uint64_t v27 = __Block_byref_object_copy__24;
    uint64_t v28 = __Block_byref_object_dispose__24;
    uint64_t v29 = 0LL;
    int v12 = objc_alloc(&OBJC_CLASS___NSFileReadingClaim);
    id purposeID = self->_purposeID;
    id v14 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    uint64_t v15 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
    v23[3] = &unk_189CA2C98;
    v23[4] = &v36;
    v23[5] = &v30;
    v23[6] = &v24;
    int v16 = -[NSFileReadingClaim initWithPurposeID:url:options:claimer:]( v12,  "initWithPurposeID:url:options:claimer:",  purposeID,  v14,  v11,  v23);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      int v17 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = self->_purposeID;
        uint64_t v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v43 = v11;
        __int16 v44 = 2113;
        id v45 = a3;
        __int16 v46 = 2114;
        id v47 = v18;
        __int16 v48 = 2114;
        uint64_t v49 = v19;
        _os_log_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEFAULT,  "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    id v20 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:]( self,  "_blockOnAccessClaim:withAccessArbiter:",  v16,  v20);
    v22[0] = v15;
    v22[1] = 3221225472LL;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_182;
    v22[3] = &unk_189CA2CC0;
    v22[6] = a6;
    v22[7] = &v36;
    v22[4] = a3;
    v22[5] = v20;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]( self,  "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:",  v20,  v22,  v25[5] != 0,  v16);
    char v21 = (void *)v25[5];
    if (a5)
    {
      if (v21)
      {
        *a5 = v21;
        char v21 = (void *)v25[5];
      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }

id __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2( void *a1,  uint64_t a2,  void *a3,  void *a4,  void *a5)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 40LL) = a3;
  *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = a4;
  id result = a5;
  *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = result;
  return result;
}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_182( void *a1,  uint64_t a2)
{
  v5[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
  if (!v2) {
    uint64_t v2 = a1[4];
  }
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_183;
  v5[3] = &unk_189C9E898;
  uint64_t v3 = a1[6];
  v5[4] = a1[5];
  v5[5] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v5);
}

void __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_183( uint64_t a1)
{
}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void *))a6 + 2))(a6, a3, &__block_literal_global_185);
  }

  else
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3052000000LL;
    uint64_t v32 = __Block_byref_object_copy__24;
    v33 = __Block_byref_object_dispose__24;
    uint64_t v34 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3052000000LL;
    uint64_t v26 = __Block_byref_object_copy__24;
    uint64_t v27 = __Block_byref_object_dispose__24;
    uint64_t v28 = 0LL;
    unint64_t v11 = objc_alloc(&OBJC_CLASS___NSFileWritingClaim);
    id purposeID = self->_purposeID;
    id v13 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    uint64_t v14 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
    v22[3] = &unk_189CA2D08;
    v22[4] = &v29;
    v22[5] = &v23;
    uint64_t v15 = -[NSFileWritingClaim initWithPurposeID:url:options:claimer:]( v11,  "initWithPurposeID:url:options:claimer:",  purposeID,  v13,  a4,  v22);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      int v16 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = self->_purposeID;
        uint64_t v18 = -[NSFileAccessClaim claimID](v15, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v36 = a4;
        __int16 v37 = 2113;
        id v38 = a3;
        __int16 v39 = 2114;
        id v40 = v17;
        __int16 v41 = 2114;
        uint64_t v42 = v18;
        _os_log_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_DEFAULT,  "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    id v19 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:]( self,  "_blockOnAccessClaim:withAccessArbiter:",  v15,  v19);
    v21[0] = v14;
    v21[1] = 3221225472LL;
    v21[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_188;
    v21[3] = &unk_189CA2D58;
    v21[4] = a3;
    v21[5] = self;
    v21[8] = &v29;
    v21[9] = a4;
    v21[6] = v19;
    v21[7] = a6;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]( self,  "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:",  v19,  v21,  v24[5] != 0,  v15);
    id v20 = (void *)v24[5];
    if (a5)
    {
      if (v20)
      {
        *a5 = v20;
        id v20 = (void *)v24[5];
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }

id __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = a3;
  id result = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_188( void *a1,  uint64_t a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)(a1[8] + 8LL) + 40LL);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  uint64_t v5 = (void *)a1[5];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  v4,  a1[9]);
  uint64_t v6 = objc_msgSend( v5,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v11, 1),  0);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_191;
  v10[3] = &unk_189CA2D30;
  uint64_t v8 = a1[6];
  uint64_t v7 = a1[7];
  v10[4] = a1[5];
  v10[5] = v6;
  v10[6] = v8;
  v10[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v4, v10);
}

void __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_191( uint64_t a1)
{
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void *))a8 + 2))(a8, a3, a5, &__block_literal_global_192);
  }

  else
  {
    uint64_t v32 = a7;
    uint64_t v53 = 0LL;
    v54 = &v53;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
      unint64_t v15 = a4 | 0x80000000;
    }
    else {
      unint64_t v15 = a4;
    }
    uint64_t v55 = 0x3052000000LL;
    v56 = __Block_byref_object_copy__24;
    v57 = __Block_byref_object_dispose__24;
    uint64_t v58 = 0LL;
    uint64_t v47 = 0LL;
    __int16 v48 = &v47;
    uint64_t v49 = 0x3052000000LL;
    uint64_t v50 = __Block_byref_object_copy__24;
    v51 = __Block_byref_object_dispose__24;
    uint64_t v52 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3052000000LL;
    __int16 v44 = __Block_byref_object_copy__24;
    id v45 = __Block_byref_object_dispose__24;
    uint64_t v46 = 0LL;
    uint64_t v35 = 0LL;
    unint64_t v36 = &v35;
    uint64_t v37 = 0x3052000000LL;
    id v38 = __Block_byref_object_copy__24;
    __int16 v39 = __Block_byref_object_dispose__24;
    uint64_t v40 = 0LL;
    int v16 = objc_alloc(&OBJC_CLASS___NSFileReadingWritingClaim);
    id purposeID = self->_purposeID;
    id v18 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    id v19 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a5);
    uint64_t v20 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v34[3] = &unk_189CA2DA0;
    v34[4] = &v53;
    v34[5] = &v47;
    v34[6] = &v41;
    v34[7] = &v35;
    char v21 = -[NSFileReadingWritingClaim initWithPurposeID:readingURL:options:writingURL:options:claimer:]( v16,  "initWithPurposeID:readingURL:options:writingURL:options:claimer:",  purposeID,  v18,  v15,  v19,  a6,  v34);
    char v22 = v32;
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      uint64_t v23 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = self->_purposeID;
        uint64_t v25 = -[NSFileAccessClaim claimID](v21, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v60 = v15;
        __int16 v61 = 2113;
        id v62 = a3;
        __int16 v63 = 2114;
        id v64 = v24;
        __int16 v65 = 2114;
        uint64_t v66 = v25;
        _os_log_impl( &dword_182EB1000,  v23,  OS_LOG_TYPE_DEFAULT,  "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        char v22 = v32;
        if (qword_18C4971D8 != -1) {
          dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
        }
      }

      uint64_t v26 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = v20;
        id v28 = self->_purposeID;
        uint64_t v29 = -[NSFileAccessClaim claimID](v21, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v60 = a6;
        __int16 v61 = 2113;
        id v62 = a5;
        __int16 v63 = 2114;
        id v64 = v28;
        __int16 v65 = 2114;
        uint64_t v66 = v29;
        _os_log_impl( &dword_182EB1000,  v26,  OS_LOG_TYPE_DEFAULT,  "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        uint64_t v20 = v27;
      }
    }

    id v30 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:]( self,  "_blockOnAccessClaim:withAccessArbiter:",  v21,  v30);
    v33[0] = v20;
    v33[1] = 3221225472LL;
    v33[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_195;
    v33[3] = &unk_189CA2DC8;
    v33[4] = a3;
    v33[5] = a5;
    v33[10] = &v47;
    v33[11] = a6;
    v33[8] = a8;
    v33[9] = &v53;
    v33[6] = self;
    v33[7] = v30;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]( self,  "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:",  v30,  v33,  v36[5] != 0,  v21);
    uint64_t v31 = v36;
    if (v36[5])
    {

      uint64_t v31 = v36;
      if (v22)
      {
        *char v22 = (id)v36[5];
        uint64_t v31 = v36;
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);
  }

id __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2( void *a1,  uint64_t a2,  void *a3,  void *a4,  void *a5,  void *a6)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 40LL) = a3;
  *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = a4;
  *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = a5;
  id result = a6;
  *(void *)(*(void *)(a1[7] + 8LL) + 40LL) = result;
  return result;
}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_195( void *a1,  uint64_t a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)(a1[9] + 8LL) + 40LL);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  uint64_t v5 = *(void *)(*(void *)(a1[10] + 8LL) + 40LL);
  if (!v5) {
    uint64_t v5 = a1[5];
  }
  uint64_t v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  v5,  a1[11]);
  uint64_t v7 = objc_msgSend( v6,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v12, 1),  0);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_196;
  v11[3] = &unk_189CA2D30;
  uint64_t v9 = a1[7];
  uint64_t v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, v4, v5, v11);
}

void __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_196( uint64_t a1)
{
}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void *))a8 + 2))(a8, a3, a5, &__block_literal_global_197);
  }

  else
  {
    id v30 = a7;
    uint64_t v45 = 0LL;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3052000000LL;
    __int16 v48 = __Block_byref_object_copy__24;
    uint64_t v49 = __Block_byref_object_dispose__24;
    uint64_t v50 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3052000000LL;
    uint64_t v42 = __Block_byref_object_copy__24;
    uint64_t v43 = __Block_byref_object_dispose__24;
    uint64_t v44 = 0LL;
    uint64_t v33 = 0LL;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3052000000LL;
    unint64_t v36 = __Block_byref_object_copy__24;
    uint64_t v37 = __Block_byref_object_dispose__24;
    uint64_t v38 = 0LL;
    unint64_t v15 = objc_alloc(&OBJC_CLASS___NSFileWritingWritingClaim);
    id purposeID = self->_purposeID;
    id v17 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    id v18 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a5);
    uint64_t v19 = MEMORY[0x1895F87A8];
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v32[3] = &unk_189CA2E10;
    v32[4] = &v45;
    v32[5] = &v39;
    v32[6] = &v33;
    uint64_t v20 = -[NSFileWritingWritingClaim initWithPurposeID:url:options:url:options:claimer:]( v15,  "initWithPurposeID:url:options:url:options:claimer:",  purposeID,  v17,  a4,  v18,  a6,  v32);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      char v21 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = self->_purposeID;
        uint64_t v23 = -[NSFileAccessClaim claimID](v20, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v52 = a4;
        __int16 v53 = 2113;
        id v54 = a3;
        __int16 v55 = 2114;
        id v56 = v22;
        __int16 v57 = 2114;
        uint64_t v58 = v23;
        _os_log_impl( &dword_182EB1000,  v21,  OS_LOG_TYPE_DEFAULT,  "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        uint64_t v19 = MEMORY[0x1895F87A8];
        if (qword_18C4971D8 != -1) {
          dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
        }
      }

      id v24 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v19;
        id v26 = self->_purposeID;
        uint64_t v27 = -[NSFileAccessClaim claimID](v20, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v52 = a6;
        __int16 v53 = 2113;
        id v54 = a5;
        __int16 v55 = 2114;
        id v56 = v26;
        __int16 v57 = 2114;
        uint64_t v58 = v27;
        _os_log_impl( &dword_182EB1000,  v24,  OS_LOG_TYPE_DEFAULT,  "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        uint64_t v19 = v25;
      }
    }

    id v28 = self->_accessArbiter;
    -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:]( self,  "_blockOnAccessClaim:withAccessArbiter:",  v20,  v28);
    v31[0] = v19;
    v31[1] = 3221225472LL;
    v31[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_200;
    v31[3] = &unk_189CA2E38;
    v31[4] = a3;
    v31[5] = a5;
    v31[10] = &v39;
    v31[11] = a4;
    v31[12] = a6;
    v31[8] = a8;
    v31[9] = &v45;
    v31[6] = self;
    v31[7] = v28;
    -[NSFileCoordinator _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]( self,  "_withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:",  v28,  v31,  v34[5] != 0,  v20);
    uint64_t v29 = v34;
    if (v34[5])
    {

      uint64_t v29 = v34;
      if (v30)
      {
        *id v30 = (id)v34[5];
        uint64_t v29 = v34;
      }
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }

id __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2( void *a1,  uint64_t a2,  void *a3,  void *a4,  void *a5)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 40LL) = a3;
  *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = a4;
  id result = a5;
  *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = result;
  return result;
}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_200( void *a1,  uint64_t a2)
{
  void v12[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)(a1[9] + 8LL) + 40LL);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  uint64_t v5 = *(void *)(*(void *)(a1[10] + 8LL) + 40LL);
  if (!v5) {
    uint64_t v5 = a1[5];
  }
  uint64_t v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  v4,  a1[11]);
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  v5,  a1[12]);
  uint64_t v7 = objc_msgSend( v6,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v12, 2),  0);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_201;
  v11[3] = &unk_189CA2D30;
  uint64_t v9 = a1[7];
  uint64_t v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, v4, v5, v11);
}

void __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_201( uint64_t a1)
{
}

- (void)_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke;
    v36[3] = &unk_189C9DCE8;
    v36[4] = a5;
    objc_msgSend(a4, "_fc_addUncancellableOperationWithBlock:", v36);
  }

  else
  {
    id accessArbiter = self->_accessArbiter;
    id v30 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    id v10 = objc_alloc(&OBJC_CLASS___NSFileMultipleAccessClaim);
    id purposeID = self->_purposeID;
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3;
    v35[3] = &unk_189CA2EA8;
    v35[4] = self;
    v35[5] = a3;
    id v29 = accessArbiter;
    v35[6] = accessArbiter;
    v35[7] = a4;
    v35[8] = a5;
    uint64_t v32 = -[NSFileMultipleAccessClaim initWithPurposeID:intents:claimer:]( v10,  "initWithPurposeID:intents:claimer:",  purposeID,  a3,  v35);
    if (__NSFCShouldLog(1))
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v49;
        unint64_t v15 = &off_18C497000;
        int v16 = &off_18C497000;
        id v31 = a3;
        do
        {
          uint64_t v17 = 0LL;
          uint64_t v33 = v13;
          do
          {
            if (*(void *)v49 != v14) {
              objc_enumerationMutation(a3);
            }
            id v18 = *(void **)(*((void *)&v48 + 1) + 8 * v17);
            uint64_t v19 = (os_log_s *)v16[40];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = v14;
              char v21 = v16;
              id v22 = v15;
              else {
                uint64_t v23 = "Write";
              }
              else {
                uint64_t v24 = [v18 writingOptions];
              }
              uint64_t v25 = v24;
              uint64_t v26 = [v18 URL];
              id v27 = self->_purposeID;
              uint64_t v28 = -[NSFileAccessClaim claimID](v32, "claimID");
              *(_DWORD *)buf = 136316163;
              uint64_t v38 = v23;
              __int16 v39 = 2048;
              uint64_t v40 = v25;
              __int16 v41 = 2113;
              uint64_t v42 = v26;
              __int16 v43 = 2114;
              id v44 = v27;
              __int16 v45 = 2114;
              uint64_t v46 = v28;
              _os_log_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_DEFAULT,  "%s options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x34u);
              a3 = v31;
              unint64_t v15 = v22;
              int v16 = v21;
              uint64_t v14 = v20;
              uint64_t v13 = v33;
            }

            ++v17;
          }

          while (v13 != v17);
          uint64_t v13 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
        }

        while (v13);
      }
    }

    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_208;
    v34[3] = &unk_189C991F0;
    v34[4] = v29;
    v34[5] = v32;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v32, v34);

    -[NSAutoreleasePool drain](v30, "drain");
  }

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        else {
          uint64_t v15 = [a4 objectAtIndex:v10++];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          [v14 setURL:v15];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }

    while (v9);
  }

  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4;
  v22[3] = &unk_189CA3238;
  uint64_t v16 = *(void *)(a1 + 48);
  v22[4] = *(void *)(a1 + 56);
  v22[5] = a6;
  __int128 v23 = *(_OWORD *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 64);
  return [(id)v23 _withAccessArbiter:v16 invokeAccessor:v22 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5;
  v5[3] = &unk_189CA2E80;
  __int128 v3 = *(_OWORD *)(a1 + 56);
  __int128 v6 = *(_OWORD *)(a1 + 40);
  __int128 v7 = v3;
  uint64_t v8 = a2;
  return objc_msgSend(v2, "_fc_addUncancellableOperationWithBlock:", v5);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5( uint64_t a1)
{
  v7[7] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) _willStartWriteWithIntents:*(void *)(a1 + 48) async:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6;
  v7[3] = &unk_189CA04E8;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[5] = v3;
  v7[6] = v5;
  v7[4] = *(void *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v2, v7);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6( uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_208( uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)_itemAtURL:(id)a3 didMoveToURL:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    __int128 v7 = (void *)MEMORY[0x186E1FF60]();
    objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didMoveItemAtURL:toURL:",  self->_purposeID,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)),  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a4)));
    objc_autoreleasePoolPop(v7);
  }

- (void)_ubiquityDidChangeForItemAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didChangeUbiquityOfItemAtURL:",  self->_purposeID,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }

- (void)sharingDidChangeForItemAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v5 = (void *)MEMORY[0x186E1FF60]();
    objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didChangeSharingOfItemAtURL:",  self->_purposeID,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    objc_autoreleasePoolPop(v5);
  }

- (void)_itemDidDisappearAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didMakeItemDisappearAtURL:",  self->_purposeID,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }

- (void)_itemDidChangeAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    objc_msgSend( self->_accessArbiter,  "writerWithPurposeID:didChangeItemAtURL:",  self->_purposeID,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    -[NSAutoreleasePool drain](v5, "drain");
  }

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void, void *))a6 + 2))(a6, a3, 0LL, &__block_literal_global_209);
  }

  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSFileReadingClaim);
    id v14 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    uint64_t v15 = MEMORY[0x1895F87A8];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_189CA2F18;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    uint64_t v16 = -[NSFileReadingClaim initWithPurposeID:url:options:claimer:]( v13,  "initWithPurposeID:url:options:claimer:",  a5,  v14,  a4,  v21);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      uint64_t v17 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id purposeID = self->_purposeID;
        uint64_t v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v23 = a4;
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2114;
        id v27 = purposeID;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEFAULT,  "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    v20[0] = v15;
    v20[1] = 3221225472LL;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_210;
    v20[3] = &unk_189C991F0;
    v20[4] = accessArbiter;
    v20[5] = v16;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v16, v20);

    -[NSAutoreleasePool drain](v12, "drain");
  }

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  v13[9] = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v13[3] = &unk_189CA2EF0;
  v13[4] = v9;
  v13[5] = a3;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 48);
  v13[7] = *(void *)(a1 + 56);
  v13[8] = v10;
  v13[6] = a5;
  return [v9 _withAccessArbiter:v11 invokeAccessor:v13 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3( void *a1,  uint64_t a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent readingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "readingIntentWithURL:options:",  a1[5],  a1[8]);
  uint64_t v5 = objc_msgSend( v4,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v11, 1),  1);
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_189CA04E8;
  v10[5] = v5;
  v10[6] = a2;
  uint64_t v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_210( uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void, void *))a6 + 2))(a6, a3, 0LL, &__block_literal_global_211);
  }

  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSFileWritingClaim);
    id v14 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    uint64_t v15 = MEMORY[0x1895F87A8];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_189CA2F60;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    uint64_t v16 = -[NSFileWritingClaim initWithPurposeID:url:options:claimer:]( v13,  "initWithPurposeID:url:options:claimer:",  a5,  v14,  a4,  v21);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      uint64_t v17 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        id purposeID = self->_purposeID;
        uint64_t v19 = -[NSFileAccessClaim claimID](v16, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v23 = a4;
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2114;
        id v27 = purposeID;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEFAULT,  "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    v20[0] = v15;
    v20[1] = 3221225472LL;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_212;
    v20[3] = &unk_189C991F0;
    v20[4] = accessArbiter;
    v20[5] = v16;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v16, v20);

    -[NSAutoreleasePool drain](v12, "drain");
  }

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  v12[9] = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  void v12[3] = &unk_189CA2EF0;
  v12[4] = v8;
  v12[5] = a3;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 48);
  v12[7] = *(void *)(a1 + 56);
  v12[8] = v9;
  v12[6] = a4;
  return [v8 _withAccessArbiter:v10 invokeAccessor:v12 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3( void *a1,  uint64_t a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  a1[5],  a1[8]);
  uint64_t v5 = objc_msgSend( v4,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v11, 1),  1);
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_189CA04E8;
  v10[5] = v5;
  v10[6] = a2;
  uint64_t v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_212( uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void, void *))a8 + 2))(a8, a3, a5, 0LL, &__block_literal_global_213);
  }

  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    __int16 v39 = self;
    unint64_t v16 = a4;
    uint64_t v17 = objc_alloc(&OBJC_CLASS___NSFileReadingWritingClaim);
    id v18 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    id v19 = accessArbiter;
    unint64_t v20 = a6;
    id v21 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a5);
    uint64_t v22 = MEMORY[0x1895F87A8];
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v41[3] = &unk_189CA2FD0;
    v41[4] = v39;
    v41[5] = a3;
    v41[6] = a5;
    v41[7] = v19;
    v41[8] = a8;
    v41[9] = v20;
    unint64_t v23 = v17;
    unint64_t v24 = v16;
    id v25 = v39;
    __int16 v26 = -[NSFileReadingWritingClaim initWithPurposeID:readingURL:options:writingURL:options:claimer:]( v23,  "initWithPurposeID:readingURL:options:writingURL:options:claimer:",  a7,  v18,  v24,  v21,  v20,  v41);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      id v27 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v28 = v24;
        id v29 = v19;
        id purposeID = v39->_purposeID;
        uint64_t v31 = -[NSFileAccessClaim claimID](v26, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v43 = v28;
        __int16 v44 = 2113;
        id v45 = a3;
        __int16 v46 = 2114;
        id v47 = purposeID;
        id v19 = v29;
        __int16 v48 = 2114;
        uint64_t v49 = v31;
        _os_log_impl( &dword_182EB1000,  v27,  OS_LOG_TYPE_DEFAULT,  "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        if (qword_18C4971D8 != -1) {
          dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
        }
      }

      uint64_t v32 = (os_log_s *)qword_18C497140;
      id v25 = v39;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = v22;
        id v34 = v19;
        id v35 = v39->_purposeID;
        uint64_t v36 = -[NSFileAccessClaim claimID](v26, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v43 = v20;
        __int16 v44 = 2113;
        id v45 = a5;
        __int16 v46 = 2114;
        id v47 = v35;
        id v19 = v34;
        uint64_t v22 = v33;
        __int16 v48 = 2114;
        uint64_t v49 = v36;
        _os_log_impl( &dword_182EB1000,  v32,  OS_LOG_TYPE_DEFAULT,  "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    v40[0] = v22;
    v40[1] = 3221225472LL;
    v40[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_214;
    v40[3] = &unk_189C991F0;
    v40[4] = v19;
    v40[5] = v26;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](v25, "_requestAccessClaim:withProcedure:", v26, v40, v37);

    [v38 drain];
  }

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v15[10] = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(void *)(a1 + 40);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    a4 = *(void *)(a1 + 48);
    goto LABEL_3;
  }

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v15[3] = &unk_189CA2FA8;
  v15[4] = v11;
  v15[5] = a4;
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 56);
  v15[8] = *(void *)(a1 + 64);
  v15[9] = v12;
  v15[6] = a3;
  v15[7] = a6;
  return [v11 _withAccessArbiter:v13 invokeAccessor:v15 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3( void *a1,  uint64_t a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  a1[5],  a1[9]);
  uint64_t v5 = objc_msgSend( v4,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v12, 1),  1);
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[8];
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_189CA04E8;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v9, v6, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_214( uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, id, void, void *))a8 + 2))(a8, a3, a5, 0LL, &__block_literal_global_215);
  }

  else
  {
    unint64_t v31 = a4;
    unint64_t v15 = a6;
    id accessArbiter = self->_accessArbiter;
    uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    uint64_t v17 = objc_alloc(&OBJC_CLASS___NSFileWritingWritingClaim);
    id v18 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a3);
    id v19 = +[NSFileCoordinator _canonicalURLForURL:](&OBJC_CLASS___NSFileCoordinator, "_canonicalURLForURL:", a5);
    uint64_t v20 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v34[3] = &unk_189CA3040;
    v34[4] = self;
    v34[5] = a3;
    void v34[6] = a5;
    v34[7] = accessArbiter;
    unint64_t v21 = v15;
    v34[9] = v31;
    v34[10] = v15;
    void v34[8] = a8;
    uint64_t v22 = -[NSFileWritingWritingClaim initWithPurposeID:url:options:url:options:claimer:]( v17,  "initWithPurposeID:url:options:url:options:claimer:",  a7,  v18,  v31,  v19,  v15,  v34);
    if (__NSFCShouldLog(1))
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      unint64_t v23 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v20;
        id purposeID = self->_purposeID;
        uint64_t v26 = -[NSFileAccessClaim claimID](v22, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v36 = v31;
        __int16 v37 = 2113;
        id v38 = a3;
        __int16 v39 = 2114;
        id v40 = purposeID;
        uint64_t v20 = v24;
        __int16 v41 = 2114;
        uint64_t v42 = v26;
        _os_log_impl( &dword_182EB1000,  v23,  OS_LOG_TYPE_DEFAULT,  "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
        if (qword_18C4971D8 != -1) {
          dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
        }
      }

      id v27 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = v20;
        id v29 = self->_purposeID;
        uint64_t v30 = -[NSFileAccessClaim claimID](v22, "claimID");
        *(_DWORD *)buf = 134218755;
        unint64_t v36 = v21;
        __int16 v37 = 2113;
        id v38 = a5;
        __int16 v39 = 2114;
        id v40 = v29;
        uint64_t v20 = v28;
        __int16 v41 = 2114;
        uint64_t v42 = v30;
        _os_log_impl( &dword_182EB1000,  v27,  OS_LOG_TYPE_DEFAULT,  "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
      }
    }

    v33[0] = v20;
    v33[1] = 3221225472LL;
    v33[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_216;
    v33[3] = &unk_189C991F0;
    v33[4] = self;
    v33[5] = v22;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v22, v33);

    -[NSAutoreleasePool drain](v32, "drain");
  }

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(void *)(a1 + 40);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    a4 = *(void *)(a1 + 48);
    goto LABEL_3;
  }

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v14[3] = &unk_189CA3018;
  v14[4] = v10;
  v14[5] = a3;
  __int128 v15 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v14[7] = a5;
  v14[8] = v12;
  v14[6] = a4;
  return [v10 _withAccessArbiter:v11 invokeAccessor:v14 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3( void *a1,  uint64_t a2)
{
  void v12[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  a1[5],  a1[9]);
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "writingIntentWithURL:options:",  a1[6],  a1[10]);
  uint64_t v5 = objc_msgSend( v4,  "_willStartWriteWithIntents:async:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v12, 2),  1);
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_189CA04E8;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v9, v6, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4( uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_216( uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__prepareForReadingItemsAtURLs:(id)a3 options:(unint64_t)a4 writingItemsAtURLs:(id)a5 options:(unint64_t)a6 byAccessor:(id)a7
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    (*((void (**)(id, id, void, void *))a7 + 2))( a7,  self->_accessArbiter,  0LL,  &__block_literal_global_217_0);
  }

  else
  {
    qos_class_t v13 = qos_class_main();
    id v14 = dispatch_queue_attr_make_with_qos_class(0LL, v13, 0);
    __int128 v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.FileCoordination.subarbitration", v15);
    uint64_t v17 = +[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener");
    id v18 = -[NSFileAccessSubarbiter initWithQueue:listener:]( objc_alloc(&OBJC_CLASS___NSFileAccessSubarbiter),  "initWithQueue:listener:",  v16,  v17);
    -[NSXPCListener setDelegate:](v17, "setDelegate:", v18);
    -[NSXPCListener _setQueue:](v17, "_setQueue:", v16);
    -[NSXPCListener resume](v17, "resume");
    uint64_t v42 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    id v19 = objc_alloc(&OBJC_CLASS___NSFileSubarbitrationClaim);
    v50[0] = MEMORY[0x1895F87A8];
    v50[1] = 3221225472LL;
    v50[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2;
    v50[3] = &unk_189CA30B0;
    v50[7] = v16;
    v50[8] = a7;
    __int16 v48 = self;
    v50[4] = self;
    v50[5] = v18;
    __int16 v44 = v17;
    v50[6] = v17;
    obuint64_t j = a5;
    id v47 = -[NSFileSubarbitrationClaim initWithReadingURLs:options:writingURLs:options:claimer:]( v19,  "initWithReadingURLs:options:writingURLs:options:claimer:",  a3,  a4,  a5,  a6,  v50);
    if (__NSFCShouldLog(1))
    {
      id v20 = a3;
      unint64_t v45 = a4;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      uint64_t v21 = [a3 countByEnumeratingWithState:&v65 objects:v64 count:16];
      uint64_t v22 = &off_18C497000;
      unint64_t v23 = &off_18C497000;
      if (v21)
      {
        uint64_t v24 = v21;
        uint64_t v25 = *(void *)v66;
        do
        {
          for (uint64_t i = 0LL; i != v24; ++i)
          {
            if (*(void *)v66 != v25) {
              objc_enumerationMutation(v20);
            }
            uint64_t v27 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            uint64_t v28 = (os_log_s *)v23[40];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = v23;
              uint64_t v30 = v22;
              id v31 = v20;
              id purposeID = v48->_purposeID;
              uint64_t v33 = -[NSFileAccessClaim claimID](v47, "claimID");
              *(_DWORD *)buf = 134218755;
              unint64_t v57 = v45;
              __int16 v58 = 2113;
              uint64_t v59 = v27;
              __int16 v60 = 2114;
              id v61 = purposeID;
              id v20 = v31;
              uint64_t v22 = v30;
              unint64_t v23 = v29;
              __int16 v62 = 2114;
              uint64_t v63 = v33;
              _os_log_impl( &dword_182EB1000,  v28,  OS_LOG_TYPE_DEFAULT,  "Read (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
            }
          }

          uint64_t v24 = [v20 countByEnumeratingWithState:&v65 objects:v64 count:16];
        }

        while (v24);
      }

      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      uint64_t v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16, v42);
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v53;
        do
        {
          for (uint64_t j = 0LL; j != v35; ++j)
          {
            if (*(void *)v53 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v38 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            __int16 v39 = (os_log_s *)v23[40];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              id v40 = v48->_purposeID;
              uint64_t v41 = -[NSFileAccessClaim claimID](v47, "claimID");
              *(_DWORD *)buf = 134218755;
              unint64_t v57 = a6;
              __int16 v58 = 2113;
              uint64_t v59 = v38;
              __int16 v60 = 2114;
              id v61 = v40;
              __int16 v62 = 2114;
              uint64_t v63 = v41;
              _os_log_impl( &dword_182EB1000,  v39,  OS_LOG_TYPE_DEFAULT,  "Write (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@",  buf,  0x2Au);
            }
          }

          uint64_t v35 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
        }

        while (v35);
      }
    }

    v49[0] = MEMORY[0x1895F87A8];
    v49[1] = 3221225472LL;
    v49[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_223;
    v49[3] = &unk_189CA16F0;
    v49[4] = v48;
    v49[5] = v47;
    v49[6] = v44;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](v48, "_requestAccessClaim:withProcedure:", v47, v49, v42);

    [v43 drain];
  }

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a2 claimID];
  [*(id *)(a1 + 32) _forgetAccessClaimForID:v5];
  do
    unint64_t v10 = __ldaxr(&_NSFCSubarbitrationCount);
  while (__stlxr(v10 + 1, &_NSFCSubarbitrationCount));
  if (!v10) {
    atomic_store( objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileCoordinationDisableLogSuppression"),  _NSFCDisableLogSuppression);
  }
  uint64_t v11 = *(void *)(a1 + 64);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3;
  v14[3] = &unk_189CA3088;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = v12;
  uint64_t v17 = v5;
  __int128 v18 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))( v11,  v15,  a3,  v14,  v6,  v7,  v8,  v9);
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  do
  {
    unint64_t v2 = __ldaxr(&_NSFCSubarbitrationCount);
    unint64_t v3 = v2 - 1;
  }

  while (__stlxr(v3, &_NSFCSubarbitrationCount));
  if (!v3)
  {
    do
      uint64_t v4 = __ldaxr(&_NSFCSubarbitratedClaimCount);
    while (__stlxr(0LL, &_NSFCSubarbitratedClaimCount));
    if (v4 >= 101)
    {
      if (qword_18C4971D8 != -1) {
        dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
      }
      uint64_t v5 = (os_log_s *)qword_18C497140;
      if (os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_182EB1000, v5, OS_LOG_TYPE_DEFAULT, "Resuming normal logging", v8, 2u);
      }
    }
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  [*(id *)(a1 + 32) stopArbitrating];
  [*(id *)(*(void *)(a1 + 40) + 8) revokeSubarbitrationClaimForID:*(void *)(a1 + 48)];

  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  return -[NSAutoreleasePool drain](v6, "drain");
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_223( void *a1)
{
  return [*(id *)(a1[4] + 8) grantSubarbitrationClaim:a1[5] withServer:a1[6]];
}

+ (void)__itemAtURL:(id)a3 didMoveToURL:(id)a4 purposeID:(id)a5
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v9 = (void *)MEMORY[0x186E1FF60]();
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMoveItemAtURL:toURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didMoveItemAtURL:toURL:",  a5,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]),  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  objc_msgSend(a1, "_canonicalURLForURL:", a4)));
    objc_autoreleasePoolPop(v9);
  }

+ (void)__itemAtURL:(id)a3 didDisconnectWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didDisconnectItemAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didDisconnectItemAtURL:",  a4,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]));
    -[NSAutoreleasePool drain](v7, "drain");
  }

+ (void)__itemAtURL:(id)a3 didReconnectWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didReconnectItemAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didReconnectItemAtURL:",  a4,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]));
    -[NSAutoreleasePool drain](v7, "drain");
  }

+ (void)__itemAtURL:(id)a3 didChangeUbiquityWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeUbiquityOfItemAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didChangeUbiquityOfItemAtURL:",  a4,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]));
    -[NSAutoreleasePool drain](v7, "drain");
  }

+ (void)__itemAtURL:(id)a3 didDisappearWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMakeItemDisappearAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didMakeItemDisappearAtURL:",  a4,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]));
    -[NSAutoreleasePool drain](v7, "drain");
  }

+ (void)__itemAtURL:(id)a3 didChangeWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeItemAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didChangeItemAtURL:",  a4,  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]));
    -[NSAutoreleasePool drain](v7, "drain");
  }

+ (void)__itemAtURL:(id)a3 didGainVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:",  a6,  @"added",  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]),  a4,  a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }

+ (void)__itemAtURL:(id)a3 didLoseVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:",  a6,  @"removed",  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]),  a4,  a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }

+ (void)__itemAtURL:(id)a3 didResolveConflictVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork](&OBJC_CLASS___NSFileCoordinator, "_skipCoordinationWork"))
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:]( NSFileCoordinatorSharedAccessArbiter(),  "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:",  a6,  @"resolved",  +[NSURLPromisePair pairWithURL:]( NSURLPromisePair,  "pairWithURL:",  [a1 _canonicalURLForURL:a3]),  a4,  a5);
    -[NSAutoreleasePool drain](v11, "drain");
  }

+ (void)_addFileProvider:(id)a3
{
}

+ (void)_addFileProvider:(id)a3 completionHandler:(id)a4
{
}

+ (void)_removeFileProvider:(id)a3
{
}

+ (id)_fileProviders
{
  return -[NSFileAccessArbiterProxy fileProviders](NSFileCoordinatorSharedAccessArbiter(), "fileProviders");
}

+ (void)_setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
}

- (void)_setFileProvider:(id)a3
{
  id fileReactor = self->_fileReactor;
  if (fileReactor != a3)
  {

    id v6 = a3;
    self->_id fileReactor = v6;
    uint64_t v7 = [self->_accessArbiter idForFileReactor:v6];
    if (v7) {
      -[NSFileCoordinator setPurposeIdentifier:](self, "setPurposeIdentifier:", v7);
    }
  }

+ (BOOL)_itemHasPresentersAtURL:(id)a3
{
  return -[NSFileAccessArbiterProxy itemHasPresentersAtURL:]( NSFileCoordinatorSharedAccessArbiter(),  "itemHasPresentersAtURL:",  a3);
}

- (void)_lockdownPurposeIdentifier
{
}

- (BOOL)_purposeIdentifierLockedDown
{
  return objc_getAssociatedObject(self, sel__purposeIdentifierLockedDown) == (id)1;
}

- (void)_setPurposeIdentifier:(id)a3
{
  id purposeID = self->_purposeID;
  if (purposeID != a3)
  {

    self->_id purposeID = (id)[a3 copy];
    -[NSFileCoordinator _lockdownPurposeIdentifier](self, "_lockdownPurposeIdentifier");
  }

- (id)retainAccess
{
  unint64_t v2 = *(void **)(NSFileCoordinatorGetTSD() + 8);
  uint64_t TSD = NSFileCoordinatorGetTSD();
  uint64_t v4 = *(void *)(TSD + 16);
  if (v2)
  {
    if (v4) {
      __assert_rtn( "-[NSFileCoordinator(NSPrivate) retainAccess]",  "NSFileCoordinator.m",  1893,  "NSFileCoordinatorGetTSD()->reacquisitionBlockCompletion == NULL");
    }
    goto LABEL_5;
  }

  unint64_t v2 = *(void **)(TSD + 16);
  if (v4) {
LABEL_5:
  }
    [v2 increment];
  return v2;
}

- (void)releaseAccess:(id)a3
{
}

+ (id)_currentFileCoordinator
{
  return *(id *)NSFileCoordinatorGetTSD();
}

+ (id)_currentClaimPurposeIdentifier
{
  return *(id *)(NSFileCoordinatorGetTSD() + 40);
}

+ (void)_getDebugInfoWithCompletionHandler:(id)a3
{
  if (qword_18C497180) {
    objc_msgSend( (id)qword_18C497180,  "getDebugInformationIncludingEverything:withString:fromPid:thenContinue:",  1,  +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation]( NSFileAccessArbiterProxy,  "_fileReactorDebuggingInformation"),  getpid(),  a3);
  }
  else {
    -[NSFileAccessArbiterProxy getDebugInfoWithCompletionHandler:]( NSFileCoordinatorSharedAccessArbiter(),  "getDebugInfoWithCompletionHandler:",  a3);
  }
}

+ (id)_createIdentifierForNewClaim
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  unint64_t v3 = *(void **)(TSD + 32);
  if (!v3) {
    return (id)__CFCreateUUIDString();
  }
  *(void *)(TSD + 32) = 0LL;
  return v3;
}

+ (id)_filePresenterInterface
{
  unint64_t v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", &unk_18C67F840);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v5,  "setClasses:forSelector:argumentIndex:ofReply:",  v4,  sel_observeChangeOfUbiquityAttributes_,  0LL,  0LL);
  return v5;
}

+ (id)_fileProviderInterface
{
  if (qword_18C497188 != -1) {
    dispatch_once(&qword_18C497188, &__block_literal_global_334);
  }
  return (id)qword_18C497190;
}

NSXPCInterface *__55__NSFileCoordinator_NSInternal___fileProviderInterface__block_invoke()
{
  id result =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &unk_18C6800F0);
  qword_18C497190 = (uint64_t)result;
  return result;
}

+ (id)_fileAccessArbiterInterface
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C497198 != -1) {
    dispatch_once(&qword_18C497198, v3);
  }
  return (id)qword_18C4971A0;
}

uint64_t __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1895F89C0];
  unint64_t v2 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &unk_18C67EA70);
  qword_18C4971A0 = (uint64_t)v2;
  uint64_t v3 = (void *)MEMORY[0x189604010];
  v17[0] = objc_opt_self();
  v17[1] = objc_opt_self();
  v17[2] = objc_opt_self();
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v2,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v3, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v17, 3)),  sel_grantAccessClaim_withReply_,  0,  1);
  uint64_t v4 = (void *)qword_18C4971A0;
  uint64_t v5 = (void *)MEMORY[0x189604010];
  v16[0] = objc_opt_self();
  v16[1] = objc_opt_self();
  v16[2] = objc_opt_self();
  objc_msgSend( v4,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v16, 3)),  sel_grantAccessClaim_withReply_,  1,  1);
  id v6 = (void *)qword_18C4971A0;
  uint64_t v7 = (void *)MEMORY[0x189604010];
  v15[0] = objc_opt_self();
  v15[1] = objc_opt_self();
  objc_msgSend( v6,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v15, 2)),  sel_grantAccessClaim_withReply_,  2,  1);
  uint64_t v8 = (void *)qword_18C4971A0;
  uint64_t v9 = (void *)MEMORY[0x189604010];
  v14[0] = objc_opt_self();
  v14[1] = objc_opt_self();
  objc_msgSend( v8,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v14, 2)),  sel_prepareToArbitrateForURLs_,  0,  0);
  objc_msgSend( (id)qword_18C4971A0,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_filePresenterInterface"),  sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_,  0,  0);
  objc_msgSend( (id)qword_18C4971A0,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_fileProviderInterface"),  sel_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply_,  0,  0);
  unint64_t v10 = (void *)MEMORY[0x189604010];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [(id)qword_18C4971A0 setClasses:v12 forSelector:sel_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL_ argumentIndex:1 ofReply:0];
  return [(id)qword_18C4971A0 setClasses:v12 forSelector:sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_ argumentIndex:4 ofReply:0];
}

+ (void)_startInProcessFileCoordinationAndProgressServers
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSFileCoordinator.m",  2010LL,  @"%@ must be invoked on main thread.",  NSStringFromSelector(a2));
  }
  _NSFCIP = 1;
  qos_class_t v4 = qos_class_main();
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, v4, 0);
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.FileCoordination.inProcessServerQueue", v6);
  if (!qword_18C497180)
  {
    qword_18C4971A8 = +[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener");
    uint64_t v8 = objc_alloc(&OBJC_CLASS___NSFileAccessArbiter);
    qword_18C497180 = -[NSFileAccessArbiter initWithQueue:isSubarbiter:listener:]( v8,  "initWithQueue:isSubarbiter:listener:",  v7,  0LL,  qword_18C4971A8);
    [(id)qword_18C4971A8 setDelegate:qword_18C497180];
    [(id)qword_18C4971A8 resume];
  }

  if (!qword_18C4971B0)
  {
    qword_18C4971B8 = +[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener");
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSProgressRegistrar);
    qword_18C4971B0 = -[NSProgressRegistrar initWithQueue:rootFileAccessNode:]( v9,  "initWithQueue:rootFileAccessNode:",  v7,  [(id)qword_18C497180 rootNode]);
    [(id)qword_18C4971B8 setDelegate:qword_18C4971B0];
    [(id)qword_18C4971B8 resume];
  }

  dispatch_release(v7);
  NSFileCoordinatorSharedAccessArbiter();
}

+ (id)_inProcessFileAccessArbiter
{
  return (id)qword_18C497180;
}

+ (void)_stopInProcessFileCoordinationAndProgressServers
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSFileCoordinator.m",  2047LL,  @"%@ must be invoked on main thread.",  NSStringFromSelector(a2));
  }
  _NSFCIP = 0;

  qword_18C4971C0 = 0LL;
  [(id)qword_18C497180 stopArbitrating];

  qword_18C497180 = 0LL;
  [(id)qword_18C4971A8 invalidate];

  qword_18C4971A8 = 0LL;
  qword_18C4971B0 = 0LL;
  [(id)qword_18C4971B8 invalidate];

  qword_18C4971B8 = 0LL;
}

+ (id)_createConnectionToFileAccessArbiterForQueue:(id)a3
{
  uint64_t v4 = qword_18C4971A8;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  if (v4) {
    id v6 = -[NSXPCConnection initWithListenerEndpoint:]( v5,  "initWithListenerEndpoint:",  [(id)qword_18C4971A8 endpoint]);
  }
  else {
    id v6 = -[NSXPCConnection initWithMachServiceName:options:]( v5,  "initWithMachServiceName:options:",  @"com.apple.FileCoordination",  0LL);
  }
  dispatch_queue_t v7 = v6;
  -[NSXPCConnection setRemoteObjectInterface:]( v6,  "setRemoteObjectInterface:",  +[NSFileCoordinator _fileAccessArbiterInterface](&OBJC_CLASS___NSFileCoordinator, "_fileAccessArbiterInterface"));
  -[NSXPCConnection setOptions:](v7, "setOptions:", 4096LL);
  -[NSXPCConnection _setQueue:](v7, "_setQueue:", a3);
  return v7;
}

+ (id)_createConnectionToProgressRegistrar
{
  uint64_t v2 = qword_18C4971B8;
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  if (v2) {
    return -[NSXPCConnection initWithListenerEndpoint:]( v3,  "initWithListenerEndpoint:",  [(id)qword_18C4971B8 endpoint]);
  }
  else {
    return -[NSXPCConnection initWithMachServiceName:options:]( v3,  "initWithMachServiceName:options:",  @"com.apple.ProgressReporting",  0LL);
  }
}

+ (void)_adoptFCDEndpointForTest:(id)a3
{
  qos_class_t v5 = qos_class_main();
  id v6 = dispatch_queue_attr_make_with_qos_class(0LL, v5, 0);
  dispatch_queue_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.FileCoordination.test-connectionToInProcessServerQueue", v7);
  uint64_t v9 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  a3);
  -[NSXPCConnection setRemoteObjectInterface:]( v9,  "setRemoteObjectInterface:",  [a1 _fileAccessArbiterInterface]);
  -[NSXPCConnection _setQueue:](v9, "_setQueue:", v8);
  qword_18C4971C0 = -[NSFileAccessArbiterProxy initWithServer:queue:]( objc_alloc(&OBJC_CLASS___NSFileAccessArbiterProxy),  "initWithServer:queue:",  v9,  v8);
  -[NSXPCConnection resume](v9, "resume");

  dispatch_release(v8);
}

+ (id)_endpointForInProcessFileCoordinationServer
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    __assert_rtn( "+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]",  "NSFileCoordinator.m",  2108,  "[NSThread isMainThread]");
  }
  if (!qword_18C4971A8) {
    __assert_rtn( "+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]",  "NSFileCoordinator.m",  2109,  "inProcessFileAccessArbiterListener");
  }
  return (id)[(id)qword_18C4971A8 endpoint];
}

+ (void)_performBarrier
{
}

+ (void)_performBarrierAsync:(id)a3
{
}

+ (void)_accessPresenterInfoUsingBlock:(id)a3
{
  if (qword_18C4971D0 != -1) {
    dispatch_once(&qword_18C4971D0, &__block_literal_global_436);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C497130);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, qword_18C4971C8);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C497130);
}

uint64_t __85__NSFileCoordinator_NSFileProviderInternalAdditions___accessPresenterInfoUsingBlock___block_invoke()
{
  uint64_t result = objc_opt_new();
  qword_18C4971C8 = result;
  return result;
}

+ (void)_addProcessIdentifier:(int)a3 observedUbiquityAttributes:(id)a4 forID:(id)a5
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3 >= 1)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke;
    v5[3] = &unk_189CA3138;
    int v6 = a3;
    void v5[4] = a5;
    v5[5] = a4;
    [a1 _accessPresenterInfoUsingBlock:v5];
  }

uint64_t __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v4 = (void *)[a2 objectForKey:*(void *)(a1 + 32)];
  if (!v4)
  {
    uint64_t v4 = (void *)objc_opt_new();
    [a2 setObject:v4 forKey:*(void *)(a1 + 32)];
  }

  uint64_t result = objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)),  @"pid");
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    return [v4 setObject:v6 forKey:@"ubiquityAttributes"];
  }
  return result;
}

+ (void)_removeInfoForID:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke;
  v3[3] = &unk_189CA3160;
  v3[4] = a3;
  [a1 _accessPresenterInfoUsingBlock:v3];
}

uint64_t __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

+ (void)_setReadingOptions:(unint64_t)a3
{
  *(void *)(NSFileCoordinatorGetTSD() + 24) = a3 & 0x7FFFFFFF;
}

+ (void)_setKernelMaterializationInfo:(id)a3
{
  if (*(id *)(NSFileCoordinatorGetTSD() + 48) != a3)
  {

    id v4 = a3;
    *(void *)(NSFileCoordinatorGetTSD() + 48) = v4;
  }

+ (void)_setCurrentClaimPurposeIdentifier:(id)a3
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  id v5 = *(id *)(TSD + 40);
  if (v5 != a3)
  {
    uint64_t v6 = TSD;

    *(void *)(v6 + 40) = [a3 copy];
  }

+ (unint64_t)_providedItemGenerationCount
{
  return *(void *)(NSFileCoordinatorGetTSD() + 56);
}

+ (int)_processIdentifierForID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = -1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke;
  v5[3] = &unk_189CA1048;
  void v5[4] = a3;
  v5[5] = &v6;
  [a1 _accessPresenterInfoUsingBlock:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = (void *)objc_msgSend( (id)objc_msgSend(a2, "objectForKey:", *(void *)(a1 + 32)),  "objectForKey:",  @"pid");
  if (result)
  {
    uint64_t result = (void *)[result intValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)result;
  }

  return result;
}

+ (id)_observedUbiquityAttributesForPresenterWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  int v9 = __Block_byref_object_copy__24;
  uint64_t v10 = __Block_byref_object_dispose__24;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke;
  v5[3] = &unk_189CA3188;
  void v5[4] = a3;
  v5[5] = &v6;
  [a1 _accessPresenterInfoUsingBlock:v5];
  int v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = objc_msgSend( (id)objc_msgSend(a2, "objectForKey:", *(void *)(a1 + 32)),  "objectForKey:",  @"ubiquityAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

+ (BOOL)_provideRecursively
{
  return (*(unsigned __int8 *)(NSFileCoordinatorGetTSD() + 26) >> 1) & 1;
}

+ (unint64_t)_readingOptions
{
  return *(void *)(NSFileCoordinatorGetTSD() + 24);
}

+ (unsigned)_kernelMaterializationOperation
{
  if (*(void *)(NSFileCoordinatorGetTSD() + 48)) {
    return [*(id *)(NSFileCoordinatorGetTSD() + 48) operation];
  }
  else {
    return 0;
  }
}

+ (void)_setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  *(void *)(NSFileCoordinatorGetTSD() + 56) = a3;
}

+ (id)_kernelMaterializationInfo
{
  return *(id *)(NSFileCoordinatorGetTSD() + 48);
}

+ (unint64_t)_responsesForPresenter:(id)a3
{
  char v3 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = v3 & 1 | 2LL;
  }
  else {
    uint64_t v4 = v3 & 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 4uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 8uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x10uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x20uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x40uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x80uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x100uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x200uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x400uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x800uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x1000uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x2000uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x4000uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    v4 |= 0x8000uLL;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    unint64_t v5 = v4 | 0x10000;
  }
  else {
    unint64_t v5 = v4;
  }
  char v16 = objc_opt_respondsToSelector();
  char v15 = objc_opt_respondsToSelector();
  char v6 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  char v11 = objc_opt_respondsToSelector();
  char v12 = objc_opt_respondsToSelector();
  char v13 = objc_opt_respondsToSelector();
  else {
    return v5;
  }
}

@end