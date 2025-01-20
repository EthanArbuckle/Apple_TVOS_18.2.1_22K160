@interface MCMDataProtectionChangeOperation
+ (BOOL)deleteUpdateFileWithContainerIdentity:(id)a3 error:(id *)a4;
+ (id)_readAndValidateDataProtectionUpdateAtURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5;
+ (id)dataProtectionChangeOperationAtURL:(id)a3 queue:(id)a4 error:(id *)a5;
+ (id)dataProtectionChangeOperationWithContainerMetadata:(id)a3 settingClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7;
+ (id)urlForProtectionOperationWithContainerIdentity:(id)a3;
- (BOOL)_deleteUpdateFileWithError:(id *)a3;
- (BOOL)_onQueue_deleteUpdateFileWithError:(id *)a3;
- (BOOL)_onQueue_stillMostCurrentUpdate;
- (BOOL)_onQueue_writeToDiskWithError:(id *)a3;
- (BOOL)_runChangeOperationNeedToRetry:(BOOL *)a3 error:(id *)a4;
- (BOOL)_stillMostCurrentUpdate;
- (BOOL)retried;
- (BOOL)retryIfLocked;
- (BOOL)writeToDiskWithError:(id *)a3;
- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 internalChangeID:(id)a7 queue:(id)a8 userIdentityCache:(id)a9;
- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7 userIdentityCache:(id)a8;
- (MCMMetadata)dataContainerMetadata;
- (MCMUserIdentityCache)userIdentityCache;
- (NSUUID)internalChangeID;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)retryStartBlock;
- (int)changeType;
- (int)newDataProtectionClass;
- (void)performChangeOperation;
- (void)setChangeType:(int)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataContainerMetadata:(id)a3;
- (void)setInternalChangeID:(id)a3;
- (void)setNewDataProtectionClass:(int)a3;
- (void)setRetried:(BOOL)a3;
- (void)setRetryIfLocked:(BOOL)a3;
- (void)setRetryStartBlock:(id)a3;
@end

@implementation MCMDataProtectionChangeOperation

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 internalChangeID:(id)a7 queue:(id)a8 userIdentityCache:(id)a9
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v25 = a3;
  id v24 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCMDataProtectionChangeOperation;
  v18 = -[MCMDataProtectionChangeOperation init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataContainerMetadata, a3);
    v19->_retryIfLocked = a5;
    p_internalChangeID = (void **)&v19->_internalChangeID;
    v19->_newDataProtectionClass = a4;
    v19->_changeType = a6;
    objc_storeStrong((id *)&v19->_internalChangeID, a7);
    objc_storeStrong((id *)&v19->_queue, a8);
    objc_storeStrong((id *)&v19->_userIdentityCache, a9);
    if (!v19->_internalChangeID)
    {
      uint64_t v21 = [MEMORY[0x189607AB8] UUID];
      v22 = *p_internalChangeID;
      *p_internalChangeID = (void *)v21;
    }
  }

  return v19;
}

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7 userIdentityCache:(id)a8
{
  return -[MCMDataProtectionChangeOperation initWithContainerMetadata:newClass:retryingIfLocked:changeType:internalChangeID:queue:userIdentityCache:]( self,  "initWithContainerMetadata:newClass:retryingIfLocked:changeType:internalChangeID:queue:userIdentityCache:",  a3,  *(void *)&a4,  a5,  *(void *)&a6,  0LL,  a7,  a8);
}

- (BOOL)_onQueue_writeToDiskWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  if (!v5
    || (v6 = (void *)v5, int v7 = -[MCMDataProtectionChangeOperation changeType](self, "changeType"), v6, !v7))
  {
    v30 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  38LL,  3LL);
    container_log_handle_for_category();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v36 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      *(_DWORD *)buf = 138412546;
      v45 = v36;
      __int16 v46 = 1024;
      int v47 = -[MCMDataProtectionChangeOperation changeType](self, "changeType");
      _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Invalid Update Info: metadata: %@, changeType: %u",  buf,  0x12u);
    }

    id v24 = 0LL;
    id v17 = 0LL;
    id v27 = 0LL;
    goto LABEL_19;
  }

  v37 = a3;
  v42[0] = @"MCMDataOperationIdentifier";
  v39 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  [v39 identifier];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  v42[1] = @"MCMDataOperationContainerClass";
  v8 = (void *)MEMORY[0x189607968];
  v9 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "containerClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v10;
  v42[2] = @"MCMDataOperationProtectionClass";
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v11;
  v42[3] = @"MCMDataOperationChangeType";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[MCMDataProtectionChangeOperation changeType](self, "changeType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v12;
  v42[4] = @"MCMDataOperationRetryIfLocked";
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MCMDataProtectionChangeOperation retryIfLocked](self, "retryIfLocked"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v13;
  v42[5] = @"MCMDataOperationInternalID";
  v14 = -[MCMDataProtectionChangeOperation internalChangeID](self, "internalChangeID");
  [v14 UUIDString];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:6];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = (void *)[v16 mutableCopy];
  v18 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  LODWORD(v14) = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  [v18 containerClass]);

  if ((_DWORD)v14)
  {
    v19 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
    [v19 userIdentity];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 plist];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v21 forKeyedSubscript:@"MCMDataOperationUserIdentity"];
  }
  v22 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  [v22 containerIdentity];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "urlForProtectionOperationWithContainerIdentity:",  v23);
  id v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v30 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  84LL,  1LL);
    container_log_handle_for_category();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing pending operations.",  buf,  2u);
    }

    id v24 = 0LL;
    id v27 = 0LL;
    goto LABEL_18;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v41 = 0LL;
  char v26 = [v25 removeItemAtURL:v24 error:&v41];
  id v27 = v41;

  if ((v26 & 1) != 0)
  {
    uint64_t v28 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v29 = [(id)v28 dataWritingOptionsForFileAtURL:v24];

    id v40 = 0LL;
    LOBYTE(v28) = objc_msgSend(v17, "MCM_writeToURL:withOptions:error:", v24, v29, &v40);
    id v27 = v40;
    if ((v28 & 1) != 0)
    {
      v30 = 0LL;
      BOOL v31 = 1;
      goto LABEL_22;
    }

    v30 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v27,  v24,  85LL);
    container_log_handle_for_category();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    [v24 path];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    v34 = "Failed to write data protection update dictionary to URL %@";
    goto LABEL_24;
  }

  v30 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v27,  v24,  36LL);
  container_log_handle_for_category();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    [v24 path];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    v34 = "Failed to remove pending data protection file at %@";
LABEL_24:
    _os_log_error_impl(&dword_188846000, v32, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
  }

- (BOOL)writeToDiskWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke;
  v7[3] = &unk_18A29DB88;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_onQueue_stillMostCurrentUpdate
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v3 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  [v3 containerIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "urlForProtectionOperationWithContainerIdentity:",  v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    container_log_handle_for_category();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing pending operations.",  buf,  2u);
    }

    goto LABEL_9;
  }
  v6 = -[MCMDataProtectionChangeOperation userIdentityCache](self, "userIdentityCache");
  id v17 = 0LL;
  +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "_readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:",  v5,  v6,  &v17);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (os_log_s *)v17;

  if (!v7)
  {
    container_log_handle_for_category();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [v5 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to read data protection update from %@; error = %@",
        buf,
        0x16u);
    }

LABEL_9:
    char v13 = 0;
    goto LABEL_10;
  }

  id v9 = objc_alloc(MEMORY[0x189607AB8]);
  [v7 objectForKeyedSubscript:@"MCMDataOperationInternalID"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = (void *)[v9 initWithUUIDString:v10];

  -[MCMDataProtectionChangeOperation internalChangeID](self, "internalChangeID");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v12 isEqual:v11];

LABEL_10:
  return v13;
}

- (BOOL)_stillMostCurrentUpdate
{
  v2 = self;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke;
  block[3] = &unk_18A29DC28;
  block[4] = v2;
  block[5] = &v6;
  dispatch_sync(v3, block);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_onQueue_deleteUpdateFileWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!-[MCMDataProtectionChangeOperation _onQueue_stillMostCurrentUpdate](self, "_onQueue_stillMostCurrentUpdate"))
  {
    container_log_handle_for_category();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 userIdentity];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      char v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 identifier];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = [v15 containerClass];
      _os_log_impl( &dword_188846000,  v10,  OS_LOG_TYPE_DEFAULT,  "Nothing to delete because there is a newer update for user: %@, id: %@, containerClass: %llu",  buf,  0x20u);
    }

    id v8 = 0LL;
    goto LABEL_8;
  }

  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containerIdentity];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  BOOL v7 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:error:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "deleteUpdateFileWithContainerIdentity:error:",  v6,  &v17);
  id v8 = v17;

  if (v7)
  {
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_9;
  }

  if (a3)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a3 = v8;
  }

  else
  {
    BOOL v9 = 0;
  }

- (BOOL)_deleteUpdateFileWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke;
  v7[3] = &unk_18A29DB88;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_runChangeOperationNeedToRetry:(BOOL *)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = __Block_byref_object_copy__8019;
  v75 = __Block_byref_object_dispose__8020;
  id v76 = 0LL;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = __Block_byref_object_copy__8019;
  v69 = __Block_byref_object_dispose__8020;
  id v70 = 0LL;
  uint64_t v5 = (dispatch_queue_s *)MCMSharedFastWorkloop();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke;
  block[3] = &unk_18A29DBB0;
  block[4] = self;
  block[5] = &v71;
  void block[6] = &v65;
  dispatch_async_and_wait(v5, block);

  if (!v66[5])
  {
    container_log_handle_for_category();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      id v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 userIdentity];
      id v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      [v42 identifier];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      uint64_t v45 = [v44 containerClass];
      uint64_t v46 = v72[5];
      *(_DWORD *)buf = 138413058;
      v88 = v41;
      __int16 v89 = 2112;
      v90 = v43;
      __int16 v91 = 2048;
      uint64_t v92 = v45;
      __int16 v93 = 2112;
      uint64_t v94 = v46;
      _os_log_error_impl( &dword_188846000,  v39,  OS_LOG_TYPE_ERROR,  "Failed to lookup container to set data protection for user identity: %@, identifier: %@, Class: %llu; %@",
        buf,
        0x2Au);
    }

- (void)performChangeOperation
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  char v50 = 0;
  id v49 = 0LL;
  BOOL v3 = -[MCMDataProtectionChangeOperation _runChangeOperationNeedToRetry:error:]( self,  "_runChangeOperationNeedToRetry:error:",  &v50,  &v49);
  id v4 = v49;
  if (!v3)
  {
    char v50 = 0;
    container_log_handle_for_category();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 userIdentity];
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 identifier];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 containerClass];
      int v12 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v11;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v12;
      *(_WORD *)&buf[38] = 2112;
      id v52 = v4;
      _os_log_impl( &dword_188846000,  v5,  OS_LOG_TYPE_DEFAULT,  "Operation to update protection classes for user: %@, id: %@, containerClass: %llu to class %d failed with error %@",  buf,  0x30u);
    }
  }

  if (v50)
  {
    if (-[MCMDataProtectionChangeOperation retryIfLocked](self, "retryIfLocked"))
    {
      container_log_handle_for_category();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
        v15 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        [v15 userIdentity];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 identifier];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        uint64_t v20 = [v19 containerClass];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v16;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v18;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v20;
        _os_log_impl( &dword_188846000,  v13,  OS_LOG_TYPE_DEFAULT,  "Retrying container protection update to %d on next unlock for user: %@, id: %@, containerClass: %llu",  buf,  0x26u);
      }

      uint64_t v21 = MEMORY[0x1895F87A8];
      __int16 v22 = (void *)gLockStateQueue;
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke;
      v48[3] = &unk_18A29E378;
      v48[4] = self;
      id v23 = v48;
      uint64_t v24 = v22;
      MEMORY[0x1895CEC0C]();
      dispatch_time_t v25 = dispatch_time(0LL, 10000000000LL);
      *(void *)buf = v21;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __MCMRunTransactionalTaskWithDelay_block_invoke;
      *(void *)&buf[24] = &unk_18A29E4D0;
      *(void *)&buf[32] = v23;
      uint64_t v26 = v23;
      dispatch_after(v25, v24, buf);

      goto LABEL_21;
    }

    if (v50)
    {
      container_log_handle_for_category();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 userIdentity];
        id v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        [v42 identifier];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        uint64_t v45 = [v44 containerClass];
        int v46 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v45;
        *(_WORD *)&buf[32] = 1024;
        *(_DWORD *)&buf[34] = v46;
        _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "Tried to update user: %@, id: %@, containerClass: %llu to protection class %d, but was locked and didn't retry",  buf,  0x26u);
      }
    }
  }

  id v47 = v4;
  BOOL v28 = -[MCMDataProtectionChangeOperation _deleteUpdateFileWithError:](self, "_deleteUpdateFileWithError:", &v47);
  id v29 = v47;

  if (!v28)
  {
    container_log_handle_for_category();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v33 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      [v33 userIdentity];
      BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      [v35 identifier];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      BOOL v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [v37 containerClass];
      int v39 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v38;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v39;
      _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to delete update file for user: %@, id: %@, containerClass: %llu, protection class %d",  buf,  0x26u);
    }
  }

  -[MCMDataProtectionChangeOperation completionBlock](self, "completionBlock");
  char v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MCMDataProtectionChangeOperation completionBlock](self, "completionBlock");
    id v32 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v32)[2](v32, v29);
  }

  id v4 = v29;
LABEL_21:
}

- (MCMMetadata)dataContainerMetadata
{
  return self->_dataContainerMetadata;
}

- (void)setDataContainerMetadata:(id)a3
{
}

- (int)newDataProtectionClass
{
  return self->_newDataProtectionClass;
}

- (void)setNewDataProtectionClass:(int)a3
{
  self->_newDataProtectionClass = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (void)setRetryIfLocked:(BOOL)a3
{
  self->_retryIfLocked = a3;
}

- (id)retryStartBlock
{
  return self->_retryStartBlock;
}

- (void)setRetryStartBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)retried
{
  return self->_retried;
}

- (void)setRetried:(BOOL)a3
{
  self->_retried = a3;
}

- (NSUUID)internalChangeID
{
  return self->_internalChangeID;
}

- (void)setInternalChangeID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

uint64_t __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) retried] & 1) == 0)
  {
    [*(id *)(a1 + 32) retryStartBlock];
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      [*(id *)(a1 + 32) retryStartBlock];
      BOOL v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();
    }
  }

  [*(id *)(a1 + 32) setRetried:1];
  return [*(id *)(a1 + 32) performChangeOperation];
}

void __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke(uint64_t a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  v2 = +[MCMCommandContext privileged](&OBJC_CLASS___MCMCommandContext, "privileged");
  [v2 containerCache];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) dataContainerMetadata];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containerIdentity];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  obj[0] = *(id *)(v6 + 40);
  [v3 entryForContainerIdentity:v5 error:obj];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj[0]);

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v12 = *(id *)(v8 + 40);
    uint64_t v9 = [v7 metadataWithError:&v12];
    objc_storeStrong((id *)(v8 + 40), v12);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

uint64_t __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_deleteUpdateFileWithError:", *(void *)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_stillMostCurrentUpdate");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeToDiskWithError:", *(void *)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

+ (id)dataProtectionChangeOperationWithContainerMetadata:(id)a3 settingClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  id v11 = a7;
  id v12 = a3;
  id v13 = objc_alloc((Class)objc_opt_class());
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)[v13 initWithContainerMetadata:v12 newClass:v9 retryingIfLocked:v8 changeType:v7 queue:v11 userIdentityCache:v14];

  return v15;
}

+ (id)dataProtectionChangeOperationAtURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v61 = a4;
  uint64_t v67 = 1LL;
  uint64_t v8 = +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v66 = 0LL;
  +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "_readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:",  v7,  v8,  &v66);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v66;
  char v60 = (void *)v8;
  if (!v9)
  {
    container_log_handle_for_category();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [v7 path];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)v69 = v38;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to read data protection update at %@",  buf,  0xCu);
    }

    v15 = 0LL;
    id v16 = 0LL;
    id v17 = 0LL;
    v62 = 0LL;
    id v63 = 0LL;
    goto LABEL_7;
  }

  [v9 objectForKeyedSubscript:@"MCMDataOperationUserIdentity"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }

  else
  {
    +[MCMUserIdentityCache defaultUserIdentity](&OBJC_CLASS___MCMUserIdentityCache, "defaultUserIdentity");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v20 = v13;

  id v63 = v20;
  v62 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:]( &OBJC_CLASS___MCMClientConnection,  "privilegedClientConnectionWithUserIdentity:",  v20);
  [v9 objectForKeyedSubscript:@"MCMDataOperationContainerClass"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 unsignedLongLongValue];

  id v23 = containermanager_copy_global_configuration();
  [v23 staticConfig];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 configForContainerClass:v22];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    id v32 = v7;
    v33 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  20LL,  3LL);

    container_log_handle_for_category();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v69 = v22;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Container class [%llu] in operation undefined.",  buf,  0xCu);
    }

    v15 = 0LL;
    goto LABEL_20;
  }

  if (([v15 supportedOnPlatform] & 1) == 0)
  {
    id v32 = v7;
    v33 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  72LL,  3LL);

    container_log_handle_for_category();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v69 = v22;
      _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "Container class [%llu] in operation unsupported.",  buf,  0xCu);
    }

+ (id)_readAndValidateDataProtectionUpdateAtURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 38LL);
    container_log_handle_for_category();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "URL cannot be nil", buf, 2u);
    }

    goto LABEL_9;
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfURL:v7];
  if (!v9)
  {
    int v14 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 12LL);
    container_log_handle_for_category();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v7 path];
      id v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = (uint64_t)v61;
      _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "Failed to read update info at URL %@", buf, 0xCu);
    }

+ (id)urlForProtectionOperationWithContainerIdentity:(id)a3
{
  id v3 = a3;
  id v4 = containermanager_copy_global_configuration();
  [v4 managedPathRegistry];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containermanagerPendingUpdates];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 url];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)NSString;
  [v3 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 containerConfig];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 containerClass];
  [v3 userIdentity];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 identifier];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@-%llu-%@.plist", v9, v11, v13];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:v14 isDirectory:0];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)deleteUpdateFileWithContainerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:]( &OBJC_CLASS___MCMDataProtectionChangeOperation,  "urlForProtectionOperationWithContainerIdentity:",  a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = 0LL;
    char v7 = [v6 removeItemAtURL:v5 error:&v14];
    id v8 = v14;

    if ((v7 & 1) != 0)
    {
      uint64_t v9 = 0LL;
      BOOL v10 = 1;
      goto LABEL_12;
    }

    uint64_t v9 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v8,  v5,  36LL);
    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [v5 path];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to remove data protection file at %@ : %@",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v9 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 84LL);
    container_log_handle_for_category();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to get url for storing pending operations.",  buf,  2u);
    }

    id v8 = 0LL;
  }

  if (a4)
  {
    uint64_t v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v10 = 0;
  }

@end