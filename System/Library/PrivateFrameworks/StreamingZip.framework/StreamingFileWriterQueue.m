@interface StreamingFileWriterQueue
+ (id)sharedInstance;
- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4;
- (NSMutableArray)pendingOperations;
- (NSMutableDictionary)pendingOperationPathsByGroupPointer;
- (OS_dispatch_queue)fileWriterQueue;
- (StreamingFileWriterQueue)init;
- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6;
- (int64_t)maxPendingItemSize;
- (int64_t)maxPendingOperationSize;
- (int64_t)pendingOperationSize;
- (os_unfair_lock_s)pendingStateLock;
- (unint64_t)maxConcurrency;
- (unint64_t)runningOperationCount;
- (void)_runOperation:(id)a3;
- (void)setPendingOperationSize:(int64_t)a3;
- (void)setPendingStateLock:(os_unfair_lock_s)a3;
- (void)setRunningOperationCount:(unint64_t)a3;
@end

@implementation StreamingFileWriterQueue

- (StreamingFileWriterQueue)init
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___StreamingFileWriterQueue;
  v2 = -[StreamingFileWriterQueue init](&v26, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StreamingZip.StreamingFileWriterQueue", v3);
    fileWriterQueue = v2->_fileWriterQueue;
    v2->_fileWriterQueue = (OS_dispatch_queue *)v4;

    v2->_pendingOperationSize = 0LL;
    v2->_runningOperationCount = 0LL;
    uint64_t v6 = objc_opt_new();
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    pendingOperationPathsByGroupPointer = v2->_pendingOperationPathsByGroupPointer;
    v2->_pendingOperationPathsByGroupPointer = (NSMutableDictionary *)v8;

    v2->_pendingStateLock._os_unfair_lock_opaque = 0;
    [MEMORY[0x189604038] standardUserDefaults];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 integerForKey:@"MaxAsyncOperationSize"];

    SZGetLoggingHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 < 1)
    {
      if (!v13)
      {
        uint64_t v11 = 10485760LL;
LABEL_9:

        v2->_maxPendingOperationSize = v11;
        [MEMORY[0x189604038] standardUserDefaults];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 integerForKey:@"MaxAsyncItemSize"];

        SZGetLoggingHandle();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16 < 1)
        {
          if (!v18)
          {
            uint64_t v16 = 0x200000LL;
LABEL_16:

            v2->_maxPendingItemSize = v16;
            [MEMORY[0x189604038] standardUserDefaults];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v21 = [v20 integerForKey:@"MaxConcurrency"];

            SZGetLoggingHandle();
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v21 < 1)
            {
              if (!v23)
              {
                uint64_t v21 = 4LL;
                goto LABEL_23;
              }

              *(_DWORD *)buf = 134217984;
              uint64_t v21 = 4LL;
              uint64_t v28 = 4LL;
              v24 = "Max concurrency is %lu";
            }

            else
            {
              if (!v23)
              {
LABEL_23:

                v2->_maxConcurrency = v21;
                return v2;
              }

              *(_DWORD *)buf = 134217984;
              uint64_t v28 = v21;
              v24 = "Overriding max concurrency to %lu";
            }

            _os_log_impl(&dword_1870CA000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
            goto LABEL_23;
          }

          *(_DWORD *)buf = 134217984;
          uint64_t v16 = 0x200000LL;
          uint64_t v28 = 0x200000LL;
          v19 = "Max async item size limit is %lld";
        }

        else
        {
          if (!v18) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v28 = v16;
          v19 = "Overriding max async item size limit to %lld";
        }

        _os_log_impl(&dword_1870CA000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        goto LABEL_16;
      }

      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 10485760LL;
      uint64_t v28 = 10485760LL;
      v14 = "Max async operation size limit is %lld";
    }

    else
    {
      if (!v13) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v11;
      v14 = "Overriding max async operation size limit to %lld";
    }

    _os_log_impl(&dword_1870CA000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_9;
  }

  return v2;
}

- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  if (-[StreamingFileWriterQueue maxPendingItemSize](self, "maxPendingItemSize") >= a3)
  {
    BOOL v12 = a3 >= 0;
  }

  else
  {
    SZGetTraceHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2048;
      int64_t v28 = a3;
      _os_signpost_emit_with_name_impl( &dword_1870CA000,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "FILE_TOO_BIG",  "Too large for async: %@ size %lld",  buf,  0x16u);
    }

    BOOL v12 = 0;
  }

  [MEMORY[0x189607B18] valueWithNonretainedObject:v10];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_pendingStateLock);
  v14 = -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
  [v14 objectForKeyedSubscript:v13];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    int v16 = [v15 containsObject:v9];
    if (!v12)
    {
LABEL_11:

      os_unfair_lock_unlock(&self->_pendingStateLock);
      int v18 = 0;
      v19 = 0LL;
      if (!v16) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
  }

  else
  {
    int v16 = 0;
    if (!v12) {
      goto LABEL_11;
    }
  }

  int64_t v17 = -[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") + a3;
  if (v17 > -[StreamingFileWriterQueue maxPendingOperationSize](self, "maxPendingOperationSize")) {
    goto LABEL_11;
  }
  -[StreamingFileWriterQueue setPendingOperationSize:](self, "setPendingOperationSize:", v17);

  os_unfair_lock_unlock(&self->_pendingStateLock);
  SZGetTraceHandle();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v9;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2048;
    int64_t v30 = v17;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v20,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_FILE_RESERVED",  "Async op reserved for %@ size %lld (cur total: %lld)",  buf,  0x20u);
  }

  v19 = -[StreamingFileWriterQueueReservation initWithReservationSize:]( objc_alloc(&OBJC_CLASS___StreamingFileWriterQueueReservation),  "initWithReservationSize:",  a3);
  int v18 = 1;
  if (v16)
  {
LABEL_16:
    SZGetTraceHandle();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_signpost_emit_with_name_impl( &dword_1870CA000,  v21,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_OP_EXISTS",  "Async op exists for %@",  buf,  0xCu);
    }
  }

- (void)_runOperation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 reservation];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 reservedSize];

  [v4 path];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 trackingGroup];
  uint64_t v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  [v4 executeAsyncOperation];

  dispatch_group_leave(v8);
  os_unfair_lock_lock(&self->_pendingStateLock);
  -[StreamingFileWriterQueue setPendingOperationSize:]( self,  "setPendingOperationSize:",  -[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") - v6);
  [MEMORY[0x189607B18] valueWithNonretainedObject:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = v11;
  if (v11)
  {
    [v11 removeObject:v7];
    if (![v12 count]) {
      [v10 removeObjectForKey:v9];
    }
  }

  else
  {
    SZGetLoggingHandle();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      BOOL v23 = v7;
      _os_log_fault_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_FAULT,  "No pending operation paths found for group %@ when trying to remove path %@",  buf,  0x16u);
    }
  }
  v14 = -[StreamingFileWriterQueue pendingOperations](self, "pendingOperations");
  if ([v14 count])
  {
    [v14 objectAtIndexedSubscript:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 removeObjectAtIndex:0];
  }

  else
  {
    -[StreamingFileWriterQueue setRunningOperationCount:]( self,  "setRunningOperationCount:",  -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") - 1);
    v15 = 0LL;
  }

  os_unfair_lock_unlock(&self->_pendingStateLock);
  if (v15)
  {
    [v15 trackingGroup];
    int v16 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
    -[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue");
    int64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __42__StreamingFileWriterQueue__runOperation___block_invoke;
    v18[3] = &unk_189FE1D48;
    v18[4] = self;
    id v19 = v15;
    dispatch_group_async(v16, v17, v18);
  }
}

- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 reservation];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isValid];
  if ((v8 & 1) != 0)
  {
    uint64_t v9 = [v7 reservedSize];
    [v7 setValid:0];
    [v6 trackingGroup];
    id v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);
    [v6 path];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_pendingStateLock);
    unint64_t v11 = -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount");
    unint64_t v12 = -[StreamingFileWriterQueue maxConcurrency](self, "maxConcurrency");
    char v25 = v8;
    if (v11 >= v12)
    {
      uint64_t v24 = v9;
      -[StreamingFileWriterQueue pendingOperations](self, "pendingOperations");
      int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 addObject:v6];
      SZGetTraceHandle();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v30 = v24;
        __int16 v31 = 2048;
        uint64_t v32 = [v17 count];
        _os_signpost_emit_with_name_impl( &dword_1870CA000,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CONCURRENCY_LIMIT",  "Added async operation for size %lld; queue count: %lu",
          buf,
          0x16u);
      }
    }

    else
    {
      -[StreamingFileWriterQueue setRunningOperationCount:]( self,  "setRunningOperationCount:",  -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") + 1);
    }

    [MEMORY[0x189607B18] valueWithNonretainedObject:v10];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer](self, "pendingOperationPathsByGroupPointer");
    [v20 objectForKeyedSubscript:v19];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      uint64_t v21 = (void *)objc_opt_new();
      [v20 setObject:v21 forKeyedSubscript:v19];
    }

    [v21 addObject:v26];

    os_unfair_lock_unlock(&self->_pendingStateLock);
    if (v11 < v12)
    {
      -[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue");
      __int16 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __59__StreamingFileWriterQueue_insertAsyncFileOperation_error___block_invoke;
      block[3] = &unk_189FE1D48;
      block[4] = self;
      id v28 = v6;
      dispatch_group_async(v10, v22, block);
    }

    char v8 = v25;
  }

  else
  {
    SZGetLoggingHandle();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = [v7 reservedSize];
      _os_log_error_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_ERROR,  "Rejecting insert of file operation because the reservation for size %llu was not valid",  buf,  0xCu);
    }

    uint64_t v14 = [v7 reservedSize];
    _CreateError( (uint64_t)"-[StreamingFileWriterQueue insertAsyncFileOperation:error:]",  237LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Rejecting insert of file operation because the reservation for size %llu was not valid",  v15,  v14);
    int v16 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
    id v10 = v16;
    if (a4)
    {
      id v10 = v16;
      *a4 = v10;
    }
  }

  return v8;
}

- (OS_dispatch_queue)fileWriterQueue
{
  return self->_fileWriterQueue;
}

- (int64_t)maxPendingOperationSize
{
  return self->_maxPendingOperationSize;
}

- (int64_t)maxPendingItemSize
{
  return self->_maxPendingItemSize;
}

- (unint64_t)maxConcurrency
{
  return self->_maxConcurrency;
}

- (int64_t)pendingOperationSize
{
  return self->_pendingOperationSize;
}

- (void)setPendingOperationSize:(int64_t)a3
{
  self->_pendingOperationSize = a3;
}

- (unint64_t)runningOperationCount
{
  return self->_runningOperationCount;
}

- (void)setRunningOperationCount:(unint64_t)a3
{
  self->_runningOperationCount = a3;
}

- (NSMutableArray)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMutableDictionary)pendingOperationPathsByGroupPointer
{
  return self->_pendingOperationPathsByGroupPointer;
}

- (os_unfair_lock_s)pendingStateLock
{
  return self->_pendingStateLock;
}

- (void)setPendingStateLock:(os_unfair_lock_s)a3
{
  self->_pendingStateLock = a3;
}

- (void).cxx_destruct
{
}

uint64_t __59__StreamingFileWriterQueue_insertAsyncFileOperation_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

uint64_t __42__StreamingFileWriterQueue__runOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

+ (id)sharedInstance
{
  v2 = (objc_class *)a1;
  objc_sync_enter(v2);
  if (!sharedInstance_sharedInstance)
  {
    id v3 = objc_alloc_init(v2);
    id v4 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (id)sharedInstance_sharedInstance;
}

@end