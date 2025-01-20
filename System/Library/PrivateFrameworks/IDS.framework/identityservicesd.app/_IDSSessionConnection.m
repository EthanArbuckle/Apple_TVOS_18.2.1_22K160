@interface _IDSSessionConnection
- (BOOL)getAudioEnabled;
- (BOOL)muted;
- (BOOL)startConnectionAsInitiator:(BOOL)a3 peerProtocolVersion:(unsigned int)a4 errorHandler:(id)a5;
- (BOOL)stopConnection:(id *)a3;
- (_IDSSessionConnection)initWithQueue:(id)a3;
- (_IDSSessionConnectionDelegate)delegate;
- (id)connectionInfoForCallID:(int64_t)a3;
- (id)connectionInfoWithState:(int64_t)a3;
- (int64_t)bestCallID;
- (int64_t)callID;
- (int64_t)connectionType;
- (int64_t)localCell;
- (int64_t)remoteCell;
- (unsigned)natType;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)createConnectionData:(BOOL)a3 handler:(id)a4;
- (void)dealloc;
- (void)receivedRemoteConnectionData:(id)a3;
- (void)sendData:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _IDSSessionConnection

- (_IDSSessionConnection)initWithQueue:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____IDSSessionConnection;
  id v5 = -[_IDSSessionConnection init](&v14, "init");
  if (v5)
  {
    if (qword_1009C0A20 == -1)
    {
      if (v4)
      {
LABEL_4:
        id v6 = v4;
        v7 = (dispatch_queue_attr_s *)*((void *)v5 + 3);
        *((void *)v5 + 3) = v6;
LABEL_7:

        id v11 = objc_alloc_init((Class)qword_1009C0A18);
        v12 = (void *)*((void *)v5 + 1);
        *((void *)v5 + 1) = v11;

        [*((id *)v5 + 1) setDelegate:v5];
        *((_WORD *)v5 + 36) = 0;
        goto LABEL_8;
      }
    }

    else
    {
      dispatch_once(&qword_1009C0A20, &stru_1008FFB00);
      if (v4) {
        goto LABEL_4;
      }
    }

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ids.connection.queue", v7);
    v10 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v9;

    goto LABEL_7;
  }

- (void)dealloc
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v3 = self->_connectionInfos;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v20,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        [v7 setState:4];
        -[AVConference stopCallID:](self->_connection, "stopCallID:", [v7 callID]);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v20,  16LL);
    }

    while (v4);
  }

  uint64_t v8 = OSLogHandleForIDSCategory("IDSSessionConnection");
  dispatch_queue_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cleaning up: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v10)
    && _IDSShouldLog(0LL, @"IDSSessionConnection"))
  {
    v12 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSSessionConnection", @"Cleaning up: %@");
  }

  -[AVConference setDelegate:](self->_connection, "setDelegate:", 0LL, v12);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0LL;

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____IDSSessionConnection;
  -[_IDSSessionConnection dealloc](&v13, "dealloc");
}

- (id)connectionInfoWithState:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_connectionInfos;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "state", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)connectionInfoForCallID:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_connectionInfos;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "callID", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (int64_t)bestCallID
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v2 = self->_connectionInfos;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (!v3)
  {
    unsigned int v15 = 0;
    goto LABEL_22;
  }

  id v4 = v3;
  id v5 = 0LL;
  id v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = *(void *)v18;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v2);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      if ((objc_msgSend(v10, "isFinished", (void)v17) & 1) == 0)
      {
        id v11 = v10;

        uint64_t v7 = v11;
      }

      if (([v10 isFinished] & 1) == 0
        && ([v10 isBeingHandedOff] & 1) == 0)
      {
        __int128 v12 = v10;

        id v5 = v12;
      }

      if ((uint64_t)[v10 state] <= 2)
      {
        __int128 v13 = v10;

        id v6 = v13;
      }

      unsigned int v14 = [v10 callID];
    }

    unsigned int v15 = v14;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  }

  while (v4);

  if (v5)
  {
    unsigned int v15 = -[NSMutableArray callID](v5, "callID");

    v2 = v5;
LABEL_22:

    return v15;
  }

  if (v6)
  {
    unsigned int v15 = -[NSMutableArray callID](v6, "callID");

    v2 = v6;
    goto LABEL_22;
  }

  if (v7)
  {
    unsigned int v15 = -[NSMutableArray callID](v7, "callID");
    v2 = v7;
    goto LABEL_22;
  }

  return v15;
}

- (void)receivedRemoteConnectionData:(id)a3
{
  id v4 = a3;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B5E48;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

- (void)createConnectionData:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForIDSCategory("IDSSessionConnection");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v6);
    connectionQueue = self->_connectionQueue;
    *(_DWORD *)buf = 67109632;
    BOOL v21 = v4;
    __int16 v22 = 2048;
    id v23 = v9;
    __int16 v24 = 2048;
    v25 = connectionQueue;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "createConnectionData: requiresWifi = %d, dataReadyHandler = %p, _connectionQueue = %p",  buf,  0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled(v11)
    && _IDSShouldLog(0LL, @"IDSSessionConnection"))
  {
    id v15 = objc_retainBlock(v6);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSSessionConnection",  @"createConnectionData: requiresWifi = %d, dataReadyHandler = %p, _connectionQueue = %p");
  }

  if (v6)
  {
    id v12 = [v6 copy];
    __int128 v13 = (dispatch_queue_s *)self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B63AC;
    block[3] = &unk_1008FFAB8;
    BOOL v19 = v4;
    block[4] = self;
    id v17 = v6;
    id v18 = v12;
    id v14 = v12;
    dispatch_async(v13, block);
  }
}

- (BOOL)startConnectionAsInitiator:(BOOL)a3 peerProtocolVersion:(unsigned int)a4 errorHandler:(id)a5
{
  id v8 = a5;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B72DC;
  block[3] = &unk_1008FFAE0;
  unsigned int v14 = a4;
  BOOL v15 = a3;
  block[4] = self;
  id v13 = v8;
  id v10 = v8;
  dispatch_async(connectionQueue, block);

  return 1;
}

- (BOOL)stopConnection:(id *)a3
{
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B764C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(connectionQueue, block);
  return 1;
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B77E4;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

- (BOOL)getAudioEnabled
{
  return 0;
}

- (BOOL)muted
{
  return 0;
}

- (unsigned)natType
{
  return -[AVConference natType](self->_connection, "natType");
}

- (int64_t)callID
{
  return self->_callID;
}

- (int64_t)connectionType
{
  return self->_connType;
}

- (int64_t)localCell
{
  return self->_localCell;
}

- (int64_t)remoteCell
{
  return self->_remoteCell;
}

- (_IDSSessionConnectionDelegate)delegate
{
  return (_IDSSessionConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v6 = a4;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002B7A9C;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(connectionQueue, v9);
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  id v7 = a5;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B7C20;
  block[3] = &unk_1008F7DE0;
  id v11 = v7;
  id v12 = self;
  BOOL v13 = a4;
  id v9 = v7;
  dispatch_async(connectionQueue, block);
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B8164;
  block[3] = &unk_1008FEDE8;
  id v11 = v7;
  int64_t v12 = a4;
  void block[4] = self;
  id v9 = v7;
  dispatch_async(connectionQueue, block);
}

@end