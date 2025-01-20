@interface MCMCommandOperationReclaimDiskSpace
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_removeItemOrMoveToTempAtURL:(id)a3 error:(id *)a4;
- (BOOL)asynchronously;
- (BOOL)preflightClientAllowed;
- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5 handoffForReply:(id)a6;
- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5 asyncResultPromise:(id)a6;
- (MCMReply)handoffReply;
- (MCMXPCMessage)message;
- (void)_deleteContainersAtDeathRowURL:(id)a3 error:(id *)a4;
- (void)_deleteContainersOnDeathRowWithCompletion:(id)a3;
- (void)execute;
@end

@implementation MCMCommandOperationReclaimDiskSpace

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5 handoffForReply:(id)a6
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace;
  v12 = -[MCMCommand initWithContext:resultPromise:](&v16, sel_initWithContext_resultPromise_, a4, a5);
  v13 = v12;
  if (v12)
  {
    v12->_asynchronously = a3;
    message = v12->_message;
    v12->_message = 0LL;

    objc_storeStrong((id *)&v13->_handoffReply, a6);
  }

  return v13;
}

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5
{
  return -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:handoffForReply:]( self,  "initWithAsynchronously:context:resultPromise:handoffForReply:",  a3,  a4,  a5,  0LL);
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5 asyncResultPromise:(id)a6
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandOperationReclaimDiskSpace;
  v12 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v10, a4, v11);
  v13 = v12;
  if (v12)
  {
    v12->_asynchronously = 0;
    objc_storeStrong((id *)&v12->_handoffReply, a5);
    objc_storeStrong((id *)&v13->_message, a3);
  }

  return v13;
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  return -[MCMCommandOperationReclaimDiskSpace initWithMessage:context:reply:asyncResultPromise:]( self,  "initWithMessage:context:reply:asyncResultPromise:",  a3,  a4,  a5,  0LL);
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 codeSignInfo];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 entitlements];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 allowed] & 1) != 0 || (objc_msgSend(v5, "canDelete")) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 canManageUserManagedAssets];
  }

  return v6;
}

- (void)execute
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = -[MCMCommand resultPromise](self, "resultPromise");
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  v19 = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke;
  v20 = &unk_18A29E238;
  v21 = self;
  id v22 = v4;
  id v6 = v4;
  v7 = (void *)MEMORY[0x1895CE54C](&v17);
  if (-[MCMCommandOperationReclaimDiskSpace asynchronously](self, "asynchronously", v17, v18, v19, v20, v21))
  {
    id v8 = MCMSharedSlowWorkloop();
    id v9 = v7;
    id v10 = (dispatch_queue_s *)v8;
    MEMORY[0x1895CEC0C]();
    *(void *)&__int128 block = v5;
    *((void *)&block + 1) = 3221225472LL;
    v24 = __MCMRunTransactionalTask_block_invoke;
    v25 = &unk_18A29E4D0;
    id v26 = v9;
    id v11 = v9;
    dispatch_async(v10, &block);
  }

  else
  {
    v12 = -[MCMCommandOperationReclaimDiskSpace handoffReply](self, "handoffReply");
    if (!v12)
    {
      id v10 = (dispatch_queue_s *)MCMSharedSlowWorkloop();
      dispatch_async_and_wait(v10, v7);
      goto LABEL_8;
    }

    container_log_handle_for_category();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[MCMCommand context](self, "context");
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 clientIdentity];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = v16;
      _os_log_debug_impl( &dword_188846000,  v13,  OS_LOG_TYPE_DEBUG,  "Reply to reclaim handed off to the slow workloop for client [%@]",  (uint8_t *)&block,  0xCu);
    }

    -[MCMCommandOperationReclaimDiskSpace handoffReply](self, "handoffReply");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 clientIdentity];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_s handoffToSlowWorkloopforClientIdentity:withBlock:]( v10,  "handoffToSlowWorkloopforClientIdentity:withBlock:",  v14,  v7);
  }

LABEL_8:
  objc_autoreleasePoolPop(v3);
}

- (BOOL)_removeItemOrMoveToTempAtURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v6 = 1;
  [MEMORY[0x189604030] fileURLWithPath:@"/tmp" isDirectory:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = 0LL;
  char v9 = [v8 removeItemAtURL:v5 error:&v26];
  id v10 = v26;

  if ((v9 & 1) != 0) {
    goto LABEL_4;
  }
  [v10 domain];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 isEqualToString:*MEMORY[0x189607688]])
  {
    uint64_t v12 = [v10 code];

    if (v12 == 2)
    {
LABEL_4:
      v13 = 0LL;
      goto LABEL_16;
    }
  }

  else
  {
  }

  container_log_handle_for_category();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [v5 path];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v22;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_debug_impl( &dword_188846000,  v14,  OS_LOG_TYPE_DEBUG,  "Couldn't remove, so moving item to /tmp: %@ : %@",  buf,  0x16u);
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 lastPathComponent];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = v10;
  char v18 = [v15 moveItemIfExistsAtURL:v5 toURL:v17 error:&v25];
  id v19 = v25;

  if ((v18 & 1) != 0)
  {
    v13 = 0LL;
    BOOL v6 = 1;
  }

  else
  {
    v13 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v19,  v5,  17LL);
    container_log_handle_for_category();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [v5 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 path];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_error_impl(&dword_188846000, v20, OS_LOG_TYPE_ERROR, "Failed to move dir %@ to %@: %@", buf, 0x20u);
    }

    BOOL v6 = 0;
    if (a4 && v13)
    {
      v13 = v13;
      BOOL v6 = 0;
      *a4 = v13;
    }
  }

  id v10 = v19;
LABEL_16:

  return v6;
}

- (void)_deleteContainersAtDeathRowURL:(id)a3 error:(id *)a4
{
  uint64_t v27 = a4;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = __Block_byref_object_copy__3495;
  v44 = __Block_byref_object_dispose__3496;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy__3495;
  v38 = __Block_byref_object_dispose__3496;
  id v39 = 0LL;
  BOOL v6 = (dispatch_queue_s *)MCMSharedDeathrowQueue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke;
  block[3] = &unk_18A29DBB0;
  id v32 = &v40;
  id v28 = v5;
  id v31 = v28;
  uint64_t v33 = &v34;
  dispatch_sync(v6, block);

  if ([(id)v41[5] count])
  {
    container_log_handle_for_category();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v8 = (void *)v41[5];
    *(_DWORD *)buf = 138412290;
    id v52 = v8;
    char v9 = "Preparing to delete: %@";
  }

  else
  {
    container_log_handle_for_category();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v52 = v28;
    char v9 = "There are no items staged for delete at %@.";
  }

  _os_log_impl(&dword_188846000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:

  id v10 = (void *)v41[5];
  if (v10)
  {
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v48;
      do
      {
        uint64_t v15 = 0LL;
        uint64_t v16 = v12;
        do
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
          __int16 v29 = v16;
          BOOL v18 = -[MCMCommandOperationReclaimDiskSpace _removeItemOrMoveToTempAtURL:error:]( self,  "_removeItemOrMoveToTempAtURL:error:",  v17,  &v29,  v27);
          uint64_t v12 = v29;

          if (!v18)
          {
            container_log_handle_for_category();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              [v17 path];
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v21 = v35[5];
              *(_DWORD *)buf = 138412546;
              id v52 = v20;
              __int16 v53 = 2112;
              uint64_t v54 = v21;
              _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to destroy item at %@: %@",  buf,  0x16u);
            }
          }

          ++v15;
          uint64_t v16 = v12;
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
      }

      while (v13);
    }
  }

  else
  {
    [(id)v35[5] domain];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v22 isEqualToString:*MEMORY[0x189607688]])
    {
      BOOL v23 = [(id)v35[5] code] == 2;

      if (v23)
      {
        uint64_t v12 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
    }

    v24 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v12 = -[MCMError initWithNSError:url:defaultErrorType:]( v24,  "initWithNSError:url:defaultErrorType:",  v35[5],  v28,  28LL);
    container_log_handle_for_category();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      [v28 path];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = v35[5];
      *(_DWORD *)buf = 138412546;
      id v52 = v25;
      __int16 v53 = 2112;
      uint64_t v54 = v26;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Failed to get items for deletion at %@: %@",  buf,  0x16u);
    }
  }

  if (v27 && v12)
  {
    uint64_t v12 = v12;
    *uint64_t v27 = v12;
  }

- (void)_deleteContainersOnDeathRowWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, void))a3;
  uint64_t v23 = 0LL;
  v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = __Block_byref_object_copy__3495;
  uint64_t v27 = __Block_byref_object_dispose__3496;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__3495;
  uint64_t v21 = __Block_byref_object_dispose__3496;
  id v22 = 0LL;
  id v5 = containermanager_copy_global_configuration();
  BOOL v6 = [v5 dispositionForContainerClass:2] == 1;

  if (v6)
  {
    v7 = -[MCMCommand context](self, "context");
    [v7 userIdentityCache];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke;
    v16[3] = &unk_18A29D2F0;
    v16[4] = self;
    v16[5] = &v17;
    v16[6] = &v23;
    [v8 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v16];
  }

  id v9 = containermanager_copy_global_configuration();
  BOOL v10 = [v9 dispositionForContainerClass:1] == 1;

  if (v10)
  {
    uint64_t v11 = +[MCMContainerClassDeletedPath deletedGlobalURL](&OBJC_CLASS___MCMContainerClassDeletedPath, "deletedGlobalURL");
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    uint64_t v13 = v18[5];
    uint64_t v14 = v24;
    id obj = v24[5];
    -[MCMCommandOperationReclaimDiskSpace _deleteContainersAtDeathRowURL:error:]( self,  "_deleteContainersAtDeathRowURL:error:",  v13,  &obj);
    objc_storeStrong(v14 + 5, obj);
  }

  if (v4) {
    ((void (**)(id, id))v4)[2](v4, v24[5]);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (MCMReply)handoffReply
{
  return self->_handoffReply;
}

- (BOOL)asynchronously
{
  return self->_asynchronously;
}

- (void).cxx_destruct
{
}

void __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke( void *a1,  uint64_t a2)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v3 = +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:]( &OBJC_CLASS___MCMContainerClassDeletedPath,  "deletedURLWithUserIdentity:",  a2);
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
  uint64_t v8 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v8 + 40);
  [v6 _deleteContainersAtDeathRowURL:v7 error:obj];
  objc_storeStrong((id *)(v8 + 40), obj[0]);
}

void __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke( void *a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  v2 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v4 + 40);
  uint64_t v5 = [v2 urlsForItemsInDirectoryAtURL:v3 error:obj];
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  [v2 waitOnLock:9];

  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2;
  v4[3] = &unk_18A29D2C8;
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  [v5 _deleteContainersOnDeathRowWithCompletion:v4];
}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v3);

  uint64_t v4 = [*(id *)(a1 + 32) message];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = containermanager_copy_global_configuration();
    if ([v6 runmode] == 2)
    {
    }

    else
    {
      id v7 = containermanager_copy_global_configuration();
      int v8 = [v7 runmode];

      if (v8 != 3) {
        goto LABEL_8;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "message", v13);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) context];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommand relayToPrivilegedDaemonMessage:context:]( &OBJC_CLASS___MCMCommand,  "relayToPrivilegedDaemonMessage:context:",  v9,  v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      uint64_t v12 = v11;

      uint64_t v13 = v12;
    }
  }

+ (unint64_t)command
{
  return 4LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end