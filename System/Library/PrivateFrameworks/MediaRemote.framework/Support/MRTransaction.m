@interface MRTransaction
- (MRPlayerPath)playerPath;
- (MRTransaction)initWithName:(unint64_t)a3 fromMessage:(id)a4 withDelegate:(id)a5;
- (MRTransaction)initWithName:(unint64_t)a3 playerPath:(id)a4;
- (MRTransactionDelegate)delegate;
- (double)outOfMemoryWaitDuration;
- (unint64_t)_calculateMemory;
- (unint64_t)name;
- (void)_processMessage:(id)a3;
- (void)_query:(id)a3;
- (void)_transactionEnded;
- (void)cancel;
- (void)dealloc;
- (void)send:(id)a3 toConnection:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MRTransaction

- (MRTransaction)initWithName:(unint64_t)a3 fromMessage:(id)a4 withDelegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MRTransaction;
  v10 = -[MRTransaction init](&v27, "init");
  v11 = v10;
  if (v10)
  {
    v10->_name = a3;
    uint64_t v12 = MRCreatePlayerPathFromXPCMessage(v8);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    playerPath = v11->_playerPath;
    v11->_playerPath = (MRPlayerPath *)v13;

    objc_storeWeak((id *)&v11->_delegate, v9);
    uint64_t v16 = _MRLogForCategory(0LL, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t Description = MRTransactionNameGetDescription(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue(Description);
      v23 = v11->_playerPath;
      *(_DWORD *)buf = 134218498;
      v29 = v11;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v23;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "[MRDTransaction] New Transaction: %p %@ for playerPath %@",  buf,  0x20u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100067710;
    v24[3] = &unk_100398E60;
    v25 = v11;
    id v26 = v8;
    dispatch_async(v19, v24);
  }

  return v11;
}

- (MRTransaction)initWithName:(unint64_t)a3 playerPath:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRTransaction;
  id v8 = -[MRTransaction init](&v17, "init");
  id v9 = v8;
  if (v8)
  {
    v8->_name = a3;
    objc_storeStrong((id *)&v8->_playerPath, a4);
    uint64_t v11 = _MRLogForCategory(0LL, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t Description = MRTransactionNameGetDescription(a3);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(Description);
      playerPath = v9->_playerPath;
      *(_DWORD *)buf = 134218498;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = playerPath;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[MRDTransaction] New Transaction: %p %@ for playerPath %@",  buf,  0x20u);
    }
  }

  return v9;
}

- (double)outOfMemoryWaitDuration
{
  if (qword_1003FDD30 != -1) {
    dispatch_once(&qword_1003FDD30, &stru_10039C5F8);
  }
  return *(double *)&qword_1003FDD28;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1002B5C60();
  }

  -[MRDTaskAssertion invalidateWithReason:](self->_taskAssertion, "invalidateWithReason:", @"Deprecated");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransaction;
  -[MRTransaction dealloc](&v5, "dealloc");
}

- (void)send:(id)a3 toConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = MRCreateXPCMessage(0x700000000000003LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t ExternalRepresentation = MRTransactionPacketsCreateExternalRepresentation(v8);
    id v14 = objc_claimAutoreleasedReturnValue(ExternalRepresentation);
    xpc_dictionary_set_data( v12,  "MRXPC_TRANSACTION_DATA",  [v14 bytes],  (size_t)objc_msgSend(v14, "length"));
    MRAddPlayerPathToXPCMessage(v12, self->_playerPath);
    xpc_dictionary_set_uint64(v12, "MRXPC_TRANSACTION_NAME", self->_name);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100067ABC;
    v18[3] = &unk_10039C620;
    id v19 = v12;
    id v20 = v10;
    id v17 = v12;
    xpc_connection_send_message_with_reply(v9, v17, v16, v18);
  }

  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)cancel
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1002B5CF8();
  }

  -[MRTransaction _transactionEnded](self, "_transactionEnded");
}

- (void)_processMessage:(id)a3
{
  id v4 = a3;
  v6 = v4;
  if (v4 == &_xpc_error_connection_interrupted || v4 == &_xpc_error_connection_invalid)
  {
    uint64_t v8 = _MRLogForCategory(0LL, v5);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B5D88();
    }

    -[MRTransaction _transactionEnded](self, "_transactionEnded");
  }

  else
  {
    self->_bytesInUse = 0LL;
    id v10 = (void *)MRCreateDataFromXPCMessage(v4, "MRXPC_TRANSACTION_DATA");
    uint64_t v11 = MRTransactionPacketsCreateFromExternalRepresentation();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE");
    uint64_t v15 = _MRLogForCategory(0LL, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1002B5E04((uint64_t)self, v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v19 = [v10 length];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100067CF4;
    v22[3] = &unk_100398E60;
    v22[4] = self;
    id v23 = v6;
    [WeakRetained transaction:self didReceivePackets:v12 receivedSize:v19 requestedSize:uint64 queue:v21 completion:v22];
  }
}

- (void)_query:(id)a3
{
  id v4 = a3;
  if (xpc_dictionary_get_BOOL(v4, "MRXPC_TRANSACTION_ENDED"))
  {
    uint64_t v6 = _MRLogForCategory(0LL, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1002B5EAC();
    }

    -[MRTransaction _transactionEnded](self, "_transactionEnded");
  }

  else
  {
    unint64_t v8 = -[MRTransaction _calculateMemory](self, "_calculateMemory");
    self->_bytesInUse = v8;
    if (v8)
    {
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
      uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      if (v12)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v4);
        uint64_t v15 = reply;
        if (reply)
        {
          xpc_dictionary_set_uint64(reply, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE", self->_bytesInUse);
          uint64_t v17 = _MRLogForCategory(0LL, v16);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_1002B6030((uint64_t)self);
          }

          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
          id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_1000680B0;
          handler[3] = &unk_100399350;
          handler[4] = self;
          xpc_connection_send_message_with_reply(v12, v15, v20, handler);
        }

        else
        {
          uint64_t v30 = _MRLogForCategory(0LL, v14);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_1002B5FB4();
          }

          -[MRTransaction _transactionEnded](self, "_transactionEnded");
        }
      }

      else
      {
        uint64_t v28 = _MRLogForCategory(0LL, v11);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1002B5F38();
        }

        -[MRTransaction _transactionEnded](self, "_transactionEnded");
      }
    }

    else
    {
      uint64_t v21 = _MRLogForCategory(0LL, v9);
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[MRTransaction outOfMemoryWaitDuration](self, "outOfMemoryWaitDuration");
        *(_DWORD *)buf = 134218240;
        v36 = self;
        __int16 v37 = 2048;
        uint64_t v38 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%p No memory available, waiting %lf and requesting again",  buf,  0x16u);
      }

      -[MRTransaction outOfMemoryWaitDuration](self, "outOfMemoryWaitDuration");
      dispatch_time_t v25 = dispatch_time(0LL, (uint64_t)(v24 * 1000000000.0));
      dispatch_queue_global_t v26 = dispatch_get_global_queue(0LL, 0LL);
      objc_super v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100068000;
      block[3] = &unk_100398E60;
      block[4] = self;
      id v34 = v4;
      dispatch_after(v25, v27, block);
    }
  }
}

- (void)_transactionEnded
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1002B60C0();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transactionDidEnd:self bytesRemaining:self->_bytesInUse];
}

- (unint64_t)_calculateMemory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained transactionRequestingMemorySize:self];

  return (unint64_t)v4;
}

- (MRTransactionDelegate)delegate
{
  return (MRTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)name
{
  return self->_name;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
}

@end