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
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___StreamingFileWriterQueue;
  v2 = -[StreamingFileWriterQueue init](&v30, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StreamingZip.StreamingFileWriterQueue", v4);
    fileWriterQueue = v2->_fileWriterQueue;
    v2->_fileWriterQueue = (OS_dispatch_queue *)v5;

    v2->_pendingOperationSize = 0LL;
    v2->_runningOperationCount = 0LL;
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    pendingOperationPathsByGroupPointer = v2->_pendingOperationPathsByGroupPointer;
    v2->_pendingOperationPathsByGroupPointer = v9;

    v2->_pendingStateLock._os_unfair_lock_opaque = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v12 = (uint64_t)[v11 integerForKey:@"MaxAsyncOperationSize"];

    v13 = sub_100004680();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12 < 1)
    {
      if (!v15)
      {
        uint64_t v12 = 10485760LL;
LABEL_9:

        v2->_maxPendingOperationSize = v12;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        uint64_t v18 = (uint64_t)[v17 integerForKey:@"MaxAsyncItemSize"];

        v19 = sub_100004680();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v18 < 1)
        {
          if (!v21)
          {
            uint64_t v18 = 0x200000LL;
LABEL_16:

            v2->_maxPendingItemSize = v18;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
            uint64_t v24 = (uint64_t)[v23 integerForKey:@"MaxConcurrency"];

            v25 = sub_100004680();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v24 < 1)
            {
              if (!v27)
              {
                uint64_t v24 = 4LL;
                goto LABEL_23;
              }

              *(_DWORD *)buf = 134217984;
              uint64_t v24 = 4LL;
              uint64_t v32 = 4LL;
              v28 = "Max concurrency is %lu";
            }

            else
            {
              if (!v27)
              {
LABEL_23:

                v2->_maxConcurrency = v24;
                return v2;
              }

              *(_DWORD *)buf = 134217984;
              uint64_t v32 = v24;
              v28 = "Overriding max concurrency to %lu";
            }

            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
            goto LABEL_23;
          }

          *(_DWORD *)buf = 134217984;
          uint64_t v18 = 0x200000LL;
          uint64_t v32 = 0x200000LL;
          v22 = "Max async item size limit is %lld";
        }

        else
        {
          if (!v21) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v32 = v18;
          v22 = "Overriding max async item size limit to %lld";
        }

        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        goto LABEL_16;
      }

      *(_DWORD *)buf = 134217984;
      uint64_t v12 = 10485760LL;
      uint64_t v32 = 10485760LL;
      v16 = "Max async operation size limit is %lld";
    }

    else
    {
      if (!v15) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v12;
      v16 = "Overriding max async operation size limit to %lld";
    }

    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_9;
  }

  return v2;
}

- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (-[StreamingFileWriterQueue maxPendingItemSize](self, "maxPendingItemSize") >= a3)
  {
    BOOL v13 = a3 >= 0;
  }

  else
  {
    v11 = sub_100004700();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v9;
      __int16 v31 = 2048;
      int64_t v32 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "FILE_TOO_BIG",  "Too large for async: %@ size %lld",  buf,  0x16u);
    }

    BOOL v13 = 0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v10));
  os_unfair_lock_lock(&self->_pendingStateLock);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer]( self,  "pendingOperationPathsByGroupPointer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

  if (v16)
  {
    unsigned int v17 = [v16 containsObject:v9];
    if (!v13)
    {
LABEL_11:

      os_unfair_lock_unlock(&self->_pendingStateLock);
      int v19 = 0;
      v20 = 0LL;
      if (!v17) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
  }

  else
  {
    unsigned int v17 = 0;
    if (!v13) {
      goto LABEL_11;
    }
  }

  uint64_t v18 = (char *)-[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") + a3;
  -[StreamingFileWriterQueue setPendingOperationSize:](self, "setPendingOperationSize:", v18);

  os_unfair_lock_unlock(&self->_pendingStateLock);
  BOOL v21 = sub_100004700();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v9;
    __int16 v31 = 2048;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    v34 = v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_FILE_RESERVED",  "Async op reserved for %@ size %lld (cur total: %lld)",  buf,  0x20u);
  }

  v20 = -[StreamingFileWriterQueueReservation initWithReservationSize:]( objc_alloc(&OBJC_CLASS___StreamingFileWriterQueueReservation),  "initWithReservationSize:",  a3);
  int v19 = 1;
  if (v17)
  {
LABEL_16:
    v23 = sub_100004700();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_OP_EXISTS",  "Async op exists for %@",  buf,  0xCu);
    }
  }

- (void)_runOperation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 reservation]);
  v6 = [v5 reservedSize];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v4 trackingGroup]);
  [v4 executeAsyncOperation];

  dispatch_group_leave(v8);
  os_unfair_lock_lock(&self->_pendingStateLock);
  -[StreamingFileWriterQueue setPendingOperationSize:]( self,  "setPendingOperationSize:",  (_BYTE *)-[StreamingFileWriterQueue pendingOperationSize](self, "pendingOperationSize") - v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer]( self,  "pendingOperationPathsByGroupPointer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 removeObject:v7];
    if (![v12 count]) {
      [v10 removeObjectForKey:v9];
    }
  }

  else
  {
    BOOL v13 = sub_100004680();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "No pending operation paths found for group %@ when trying to remove path %@",  buf,  0x16u);
    }
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriterQueue pendingOperations](self, "pendingOperations"));
  if ([v15 count])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
    [v15 removeObjectAtIndex:0];
  }

  else
  {
    -[StreamingFileWriterQueue setRunningOperationCount:]( self,  "setRunningOperationCount:",  (char *)-[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") - 1);
    v16 = 0LL;
  }

  os_unfair_lock_unlock(&self->_pendingStateLock);
  if (v16)
  {
    unsigned int v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v16 trackingGroup]);
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000145C0;
    v19[3] = &unk_100028BE8;
    v19[4] = self;
    id v20 = v16;
    dispatch_group_async(v17, v18, v19);
  }
}

- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reservation]);
  unsigned __int8 v8 = [v7 isValid];
  if ((v8 & 1) != 0)
  {
    id v9 = [v7 reservedSize];
    [v7 setValid:0];
    id v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v6 trackingGroup]);
    dispatch_group_enter(v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    os_unfair_lock_lock(&self->_pendingStateLock);
    unint64_t v11 = -[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount");
    unint64_t v12 = -[StreamingFileWriterQueue maxConcurrency](self, "maxConcurrency");
    unsigned __int8 v28 = v8;
    if (v11 >= v12)
    {
      id v27 = v9;
      int v19 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriterQueue pendingOperations](self, "pendingOperations"));
      [v19 addObject:v6];
      id v20 = sub_100004700();
      BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 134218240;
        id v33 = v27;
        __int16 v34 = 2048;
        id v35 = [v19 count];
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CONCURRENCY_LIMIT",  "Added async operation for size %lld; queue count: %lu",
          buf,
          0x16u);
      }
    }

    else
    {
      -[StreamingFileWriterQueue setRunningOperationCount:]( self,  "setRunningOperationCount:",  (char *)-[StreamingFileWriterQueue runningOperationCount](self, "runningOperationCount") + 1);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v10));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( -[StreamingFileWriterQueue pendingOperationPathsByGroupPointer]( self,  "pendingOperationPathsByGroupPointer"));
    uint64_t v24 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v22]);
    if (!v24)
    {
      uint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      [v23 setObject:v24 forKeyedSubscript:v22];
    }

    -[NSMutableSet addObject:](v24, "addObject:", v29);

    os_unfair_lock_unlock(&self->_pendingStateLock);
    if (v11 < v12)
    {
      v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriterQueue fileWriterQueue](self, "fileWriterQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000145B4;
      block[3] = &unk_100028BE8;
      block[4] = self;
      id v31 = v6;
      dispatch_group_async(v10, v25, block);
    }

    unsigned __int8 v8 = v28;
  }

  else
  {
    BOOL v13 = sub_100004680();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v33 = [v7 reservedSize];
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Rejecting insert of file operation because the reservation for size %llu was not valid",  buf,  0xCu);
    }

    id v15 = [v7 reservedSize];
    id v17 = sub_100007A7C( (uint64_t)"-[StreamingFileWriterQueue insertAsyncFileOperation:error:]",  237LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Rejecting insert of file operation because the reservation for size %llu was not valid",  v16,  (uint64_t)v15);
    uint64_t v18 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v17);
    id v10 = v18;
    if (a4)
    {
      id v10 = v18;
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

+ (id)sharedInstance
{
  v2 = (objc_class *)a1;
  objc_sync_enter(v2);
  if (!qword_10002F3C0)
  {
    id v3 = objc_alloc_init(v2);
    id v4 = (void *)qword_10002F3C0;
    qword_10002F3C0 = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (id)qword_10002F3C0;
}

@end