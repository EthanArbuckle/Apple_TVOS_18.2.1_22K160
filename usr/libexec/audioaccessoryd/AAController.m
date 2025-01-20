@interface AAController
- (AAController)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)conversationDetectMessageHandler;
- (id)description;
- (id)deviceInfoChangeHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)multimodalContextMessageHandler;
- (id)pmeConfigMessageHandler;
- (unsigned)clientID;
- (unsigned)coreBluetoothInternalFlag;
- (void)_activate;
- (void)_activateXPC:(BOOL)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4;
- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_xpcReceivedAccessoryEvent:(id)a3;
- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectMessageHandler:(id)a3;
- (void)setCoreBluetoothInternalFlag:(unsigned int)a3;
- (void)setDeviceInfoChangeHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMultimodalContextMessageHandler:(id)a3;
- (void)setPmeConfigMessageHandler:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation AAController

- (AAController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AAController;
  v2 = -[AAController init](&v5, "init");
  if (v2)
  {
    v2->_clientID = sub_10000441C();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_coreBluetoothInternalFlag = 0x2000;
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  unsigned int clientID = self->_clientID;
  id v4 = 0LL;
  NSAppendPrintF(&v4, "AAController, CID 0x%X", clientID);
  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    id v6 = objc_retainBlock(v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = v6;

    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000045F4;
    block[3] = &unk_100206058;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

- (void)_activate
{
  if (self->_invalidateCalled)
  {
    uint64_t v3 = NSErrorF(NSOSStatusErrorDomain, 4294896148LL, "Activate after invalidate");
    id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
    if (dword_100234180 <= 90
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
    {
      LogPrintF(&dword_100234180, "-[AAController _activate]", 90LL, "### Activate failed: %@, %@", self, v6);
    }

    id v4 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v4) {
      v4[2](v4, v6);
    }
  }

  else
  {
    -[AAController _activateXPC:](self, "_activateXPC:", 0LL);
  }

- (void)_activateXPC:(BOOL)a3
{
  if (a3)
  {
    if (dword_100234180 <= 30
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 30LL)))
    {
      LogPrintF(&dword_100234180, "-[AAController _activateXPC:]", 30LL, "Re-activate: CID 0x%X");
    }
  }

  else if (dword_100234180 <= 30 {
         && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 30LL)))
  }
  {
    LogPrintF(&dword_100234180, "-[AAController _activateXPC:]", 30LL, "Activate: CID 0x%X");
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  objc_super v5 = v4;
  uint64_t coreBluetoothInternalFlag = self->_coreBluetoothInternalFlag;
  if ((_DWORD)coreBluetoothInternalFlag) {
    xpc_dictionary_set_uint64(v4, "intF", coreBluetoothInternalFlag);
  }
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100004848;
  handler[3] = &unk_100206180;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v7, v5, dispatchQueue, handler);
}

- (void)_activateXPCCompleted:(id)a3
{
  xpc_object_t xdict = a3;
  uint64_t v4 = CUXPCDecodeNSErrorIfNeeded(xdict);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    if (dword_100234180 <= 90
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
    {
      uint64_t clientID = self->_clientID;
      uint64_t v7 = CUPrintNSError(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF( &dword_100234180,  "-[AAController _activateXPCCompleted:]",  90LL,  "### Activate failed: CID 0x%X, %@",  clientID,  v8,  xdict);
    }

    v11 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v11) {
      v11[2](v11, v5);
    }
  }

  else
  {
    xpc_object_t array = xpc_dictionary_get_array(xdict, "aaDD");
    v10 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(array);
    v11 = v10;
    if (v10)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_100004A20;
      applier[3] = &unk_1002061A8;
      applier[4] = self;
      xpc_array_apply(v10, applier);
    }

    if (dword_100234180 <= 30
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 30LL)))
    {
      LogPrintF( &dword_100234180,  "-[AAController _activateXPCCompleted:]",  30LL,  "Activated: CID 0x%X",  self->_clientID);
    }

    v13 = (void (**)(id, void))objc_retainBlock(self->_activateCompletion);
    id v14 = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v13) {
      v13[2](v13, 0LL);
    }
  }
}

- (id)_ensureXPCStarted
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_xpcCnx;
  if (!v2->_xpcCnx)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.bluetooth.xpc",  (dispatch_queue_t)v2->_dispatchQueue,  0LL);

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100004B6C;
    v6[3] = &unk_1002061D0;
    uint64_t v3 = mach_service;
    uint64_t v7 = v3;
    v8 = v2;
    xpc_connection_set_event_handler(v3, v6);
    xpc_connection_activate(v3);
  }

  objc_sync_exit(v2);

  return v3;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (dword_100234180 <= 30
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 30LL)))
    {
      LogPrintF(&dword_100234180, "-[AAController _interrupted]", 30LL, "### Interrupted");
    }

    id v3 = objc_retainBlock(self->_interruptionHandler);
    uint64_t v4 = v3;
    if (v3) {
      (*((void (**)(id))v3 + 2))(v3);
    }

    if (self->_activateCalled) {
      -[AAController _activateXPC:](self, "_activateXPC:", 1LL);
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C90;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      id conversationDetectMessageHandler = v3->_conversationDetectMessageHandler;
      v3->_id conversationDetectMessageHandler = 0LL;

      id deviceInfoChangeHandler = v3->_deviceInfoChangeHandler;
      v3->_id deviceInfoChangeHandler = 0LL;

      id multimodalContextMessageHandler = v3->_multimodalContextMessageHandler;
      v3->_id multimodalContextMessageHandler = 0LL;

      id pmeConfigMessageHandler = v3->_pmeConfigMessageHandler;
      v3->_id pmeConfigMessageHandler = 0LL;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0LL;

      id v13 = objc_retainBlock(v3->_invalidationHandler);
      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0LL;

      v11 = v13;
      if (v13)
      {
        (*((void (**)(id))v13 + 2))(v13);
        v11 = v13;
      }

      self->_invalidateDone = 1;
      if (dword_100234180 <= 30)
      {
        if (dword_100234180 != -1 || (int v12 = _LogCategory_Initialize(&dword_100234180, 30LL), v11 = v13, v12))
        {
          LogPrintF(&dword_100234180, "-[AAController _invalidated]", 30LL, "Invalidated");
          v11 = v13;
        }
      }
    }
  }

- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004F98;
  v15[3] = &unk_1002061F8;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000050E8;
  v15[3] = &unk_1002061F8;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100005238;
  v15[3] = &unk_1002061F8;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100005388;
  v15[3] = &unk_1002061F8;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000054B4;
  block[3] = &unk_100206220;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6
{
  unsigned int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (self->_invalidateCalled)
  {
    uint64_t v13 = NSErrorF(NSOSStatusErrorDomain, 4294896148LL, "Request after invalidate");
    id v14 = (CBDevice *)objc_claimAutoreleasedReturnValue(v13);
    if (v8 > 6) {
      v15 = "?";
    }
    else {
      v15 = (&off_100206290)[(char)v8];
    }
    uint64_t v31 = CUPrintNSError(v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    LogPrintF( &dword_100234180,  "-[AAController _sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:]",  90LL,  "### sendAccessoryEvent type %s, destination %@, failed with error: %@",  v15,  v11,  v32);
LABEL_20:

LABEL_21:
    v12[2](v12, v14);
    goto LABEL_22;
  }

  if (!v11)
  {
    uint64_t v29 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "Invalid parameter");
    id v14 = (CBDevice *)objc_claimAutoreleasedReturnValue(v29);
    if (v8 > 6) {
      v30 = "?";
    }
    else {
      v30 = (&off_100206290)[(char)v8];
    }
    uint64_t v33 = CUPrintNSError(v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
    LogPrintF( &dword_100234180,  "-[AAController _sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:]",  90LL,  "### sendAccessoryEvent type %s failed with error: %@",  v30,  v32);
    goto LABEL_20;
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v14, "setIdentifier:", v11);
  id v16 = (void *)_CFXPCCreateXPCObjectFromCFObject(-[CBDevice dictionaryRepresentation](v14, "dictionaryRepresentation"));
  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v17, "mTyp", "SnAE");
  xpc_dictionary_set_uint64(v17, "acET", v8);
  if (v10)
  {
    id v18 = v10;
    id v19 = v17;
    id v20 = v18;
    v21 = (const char *)[v20 bytes];
    v22 = "";
    if (v21) {
      v22 = v21;
    }
    bytes = v22;
    v23 = v14;
    v24 = v16;
    id v25 = [v20 length];

    size_t v26 = (size_t)v25;
    id v16 = v24;
    id v14 = v23;
    xpc_dictionary_set_data(v19, "acMd", bytes, v26);
  }

  xpc_dictionary_set_value(v17, "dstD", v16);
  v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000058B4;
  handler[3] = &unk_100206248;
  v36 = v12;
  xpc_connection_send_message_with_reply(v27, v17, dispatchQueue, handler);

LABEL_22:
}

- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, CBDevice *))a5;
  if (self->_invalidateCalled)
  {
    uint64_t v11 = NSErrorF(NSOSStatusErrorDomain, 4294896148LL, "Request after invalidate");
    id v12 = (CBDevice *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = CUPrintNSError(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    LogPrintF( &dword_100234180,  "-[AAController _sendDeviceConfig:destinationIdentifier:completionHandler:]",  90LL,  "### sendDeviceConfig destination %@, failed with error: %@",  v9,  v14);
LABEL_5:

LABEL_12:
    v10[2](v10, v12);
    goto LABEL_13;
  }

  if (!v9)
  {
    uint64_t v19 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "Invalid parameter");
    id v12 = (CBDevice *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v20 = CUPrintNSError(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
    LogPrintF( &dword_100234180,  "-[AAController _sendDeviceConfig:destinationIdentifier:completionHandler:]",  90LL,  "### sendDeviceConfig failed with error: %@",  v14);
    goto LABEL_5;
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  -[CBDevice setIdentifier:](v12, "setIdentifier:", v9);
  v15 = (void *)_CFXPCCreateXPCObjectFromCFObject(-[CBDevice dictionaryRepresentation](v12, "dictionaryRepresentation"));
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v16, "mTyp", "SnAC");
  xpc_dictionary_set_value(v16, "acMd", v8);
  xpc_dictionary_set_value(v16, "dstD", v15);
  xpc_object_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100005B84;
  handler[3] = &unk_100206248;
  v22 = v10;
  xpc_connection_send_message_with_reply(v17, v16, dispatchQueue, handler);

LABEL_13:
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  id v21 = v4;
  if (dword_100234180 <= 10)
  {
    if (dword_100234180 != -1 || (v7 = _LogCategory_Initialize(&dword_100234180, 10LL), id v4 = v21, v7))
    {
      uint64_t v5 = CUPrintXPC(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_100234180, "-[AAController xpcReceivedMessage:]", 10LL, "XPC event: %@", v6);

      id v4 = v21;
    }
  }

  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[AAController _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v21);
  }

  else if (v21 == &_xpc_error_connection_interrupted)
  {
    -[AAController _interrupted](self, "_interrupted");
  }

  else if (v21 == &_xpc_error_connection_invalid)
  {
    if (!self->_invalidateCalled
      && dword_100234180 <= 90
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
    {
      id v12 = (const char *)xpc_connection_copy_invalidation_reason(self->_xpcCnx);
      LogPrintF( &dword_100234180,  "-[AAController xpcReceivedMessage:]",  90LL,  "### Invalidated unexpectedly for reason %s",  v12);
    }

    uint64_t v19 = self;
    objc_sync_enter(v19);
    xpcCnx = v19->_xpcCnx;
    v19->_xpcCnx = 0LL;

    objc_sync_exit(v19);
    -[AAController _invalidated](v19, "_invalidated");
  }

  else
  {
    uint64_t v8 = CUXPCDecodeNSErrorIfNeeded(v21);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }

    else
    {
      uint64_t v13 = NSErrorF(NSOSStatusErrorDomain, 4294960596LL, "XPC event error");
      id v11 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    id v14 = v11;

    if (dword_100234180 <= 90
      && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
    {
      uint64_t v15 = CUPrintNSError(v14);
      xpc_object_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = CUPrintXPC(v21);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      LogPrintF(&dword_100234180, "-[AAController xpcReceivedMessage:]", 90LL, "### XPC error: %@, %@", v16, v18);
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, "mTyp");
  if (string)
  {
    uint64_t v5 = string;
    if (!strcmp(string, "AcRc"))
    {
      -[AAController _xpcReceivedAccessoryEvent:](self, "_xpcReceivedAccessoryEvent:", v6);
    }

    else if (!strcmp(v5, "AcIC"))
    {
      -[AAController _xpcReceivedAudioAccessoryDeviceInfoChange:]( self,  "_xpcReceivedAudioAccessoryDeviceInfoChange:",  v6);
    }

    else if (dword_100234180 <= 10 {
           && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 10LL)))
    }
    {
      LogPrintF(&dword_100234180, "-[AAController _xpcReceivedMessage:]", 10LL, "### XPC unknown message type: '%s'");
    }
  }

  else if (dword_100234180 <= 90 {
         && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
  }
  {
    LogPrintF(&dword_100234180, "-[AAController _xpcReceivedMessage:]", 90LL, "### XPC no message type");
  }
}

- (void)_xpcReceivedAccessoryEvent:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_10000634C;
  v36 = sub_10000635C;
  id v37 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100006364;
  v31[3] = &unk_100206270;
  v31[4] = &v32;
  uint64_t v5 = objc_retainBlock(v31);
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = (id)v33[5];
    v33[5] = (uint64_t)@"non-dict message";
    goto LABEL_23;
  }

  id v30 = 0LL;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CBDevice);
  id v29 = 0LL;
  CUXPCDecodeObject(v4, "srcD", v6, &v30, &v29);
  id v7 = v29;
  id v8 = v7;
  if (!v30)
  {
    uint64_t v13 = CUPrintNSError(v7);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = NSPrintF_safe("bad source device: %@", v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = (void *)v33[5];
    v33[5] = v16;

    goto LABEL_22;
  }

  id v27 = v7;
  id v28 = 0LL;
  CUXPCDecodeNSData(v4, "acMd", &v28, &v27);
  id v9 = v27;

  if (v28)
  {
    id v26 = v9;
    uint64_t v38 = 0LL;
    int v10 = CUXPCDecodeUInt64RangedEx(v4, "acET", 0LL, 255LL, &v38, &v26);
    unsigned __int8 v11 = v38;
    id v8 = v26;

    if (v10 != 5)
    {
      switch(v11)
      {
        case 1u:
        case 3u:
          if (dword_100234180 <= 30
            && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 30LL)))
          {
            else {
              id v12 = (&off_1002062C8)[(char)(v11 - 1)];
            }
            LogPrintF(&dword_100234180, "-[AAController _xpcReceivedAccessoryEvent:]", 30LL, "%s event unhandled", v12);
          }

          break;
        case 2u:
          -[AAController _conversationDetectMessageReceived:fromDevice:]( self,  "_conversationDetectMessageReceived:fromDevice:",  v28,  v30);
          break;
        case 4u:
          -[AAController _multimodalContextMessageReceived:fromDevice:]( self,  "_multimodalContextMessageReceived:fromDevice:",  v28,  v30);
          break;
        case 5u:
          -[AAController _pmeConfigDataReceived:fromDevice:](self, "_pmeConfigDataReceived:fromDevice:", v28, v30);
          break;
        default:
          if (dword_100234180 <= 90
            && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 90LL)))
          {
            LogPrintF( &dword_100234180,  "-[AAController _xpcReceivedAccessoryEvent:]",  90LL,  "### unknown event type: %d",  v11);
          }

          break;
      }

      goto LABEL_21;
    }

    uint64_t v23 = CUPrintNSError(v8);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v24 = NSPrintF_safe("bad accessory event type: %@", v19);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    v22 = (void *)v33[5];
    v33[5] = v25;
  }

  else
  {
    uint64_t v18 = CUPrintNSError(v9);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = NSPrintF_safe("bad message data: %@", v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v33[5];
    v33[5] = v21;
    id v8 = v9;
  }

LABEL_21:
LABEL_22:

LABEL_23:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v32, 8);
}

- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_10000634C;
  uint64_t v15 = sub_10000635C;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006594;
  v10[3] = &unk_100206270;
  v10[4] = &v11;
  uint64_t v5 = objc_retainBlock(v10);
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, "aaID");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v8 = objc_retainBlock(self->_deviceInfoChangeHandler);
      id v9 = v8;
      if (v8) {
        (*((void (**)(id, void *))v8 + 2))(v8, v7);
      }
    }

    else
    {
      id v9 = (void *)v12[5];
      v12[5] = (uint64_t)@"missing key for AADeviceInfo";
    }
  }

  else
  {
    id v7 = (void *)v12[5];
    v12[5] = (uint64_t)@"non-dict message";
  }

  ((void (*)(void *))v5[2])(v5);
  _Block_object_dispose(&v11, 8);
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10000634C;
  uint64_t v23 = sub_10000635C;
  id v24 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006828;
  v18[3] = &unk_100206270;
  v18[4] = &v19;
  id v8 = objc_retainBlock(v18);
  if (dword_100234180 <= 10 && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 10LL)))
  {
    uint64_t v9 = CUPrintNSDataHex(v6, 50LL, 0LL);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF( &dword_100234180,  "-[AAController _conversationDetectMessageReceived:fromDevice:]",  10LL,  "Conversation detect message received: source %@, data <%@>",  v7,  v10);
  }

  uint64_t v11 = (void (**)(id, void *, id))objc_retainBlock(self->_conversationDetectMessageHandler);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if (v12)
    {
      v11[2](v11, v12, v6);
    }

    else
    {
      uint64_t v13 = CUPrintNSError(0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = NSPrintF_safe("bad source identifier: %@", v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = (void *)v20[5];
      v20[5] = v16;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);
}

- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10000634C;
  uint64_t v23 = sub_10000635C;
  id v24 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006ABC;
  v18[3] = &unk_100206270;
  v18[4] = &v19;
  id v8 = objc_retainBlock(v18);
  if (dword_100234180 <= 10 && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 10LL)))
  {
    uint64_t v9 = CUPrintNSDataHex(v6, 50LL, 0LL);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF( &dword_100234180,  "-[AAController _multimodalContextMessageReceived:fromDevice:]",  10LL,  "Multimodal context message received: source %@, data <%@>",  v7,  v10);
  }

  uint64_t v11 = (void (**)(id, void *, id))objc_retainBlock(self->_multimodalContextMessageHandler);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if (v12)
    {
      v11[2](v11, v12, v6);
    }

    else
    {
      uint64_t v13 = CUPrintNSError(0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = NSPrintF_safe("bad source identifier: %@", v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = (void *)v20[5];
      v20[5] = v16;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);
}

- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10000634C;
  uint64_t v23 = sub_10000635C;
  id v24 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006D50;
  v18[3] = &unk_100206270;
  v18[4] = &v19;
  id v8 = objc_retainBlock(v18);
  if (dword_100234180 <= 10 && (dword_100234180 != -1 || _LogCategory_Initialize(&dword_100234180, 10LL)))
  {
    uint64_t v9 = CUPrintNSDataHex(v6, 50LL, 0LL);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF( &dword_100234180,  "-[AAController _pmeConfigDataReceived:fromDevice:]",  10LL,  "PME config received: source %@, data <%@>",  v7,  v10);
  }

  uint64_t v11 = (void (**)(id, void *, id))objc_retainBlock(self->_pmeConfigMessageHandler);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if (v12)
    {
      v11[2](v11, v12, v6);
    }

    else
    {
      uint64_t v13 = CUPrintNSError(0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = NSPrintF_safe("bad source identifier: %@", v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = (void *)v20[5];
      v20[5] = v16;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);
}

- (id)conversationDetectMessageHandler
{
  return self->_conversationDetectMessageHandler;
}

- (void)setConversationDetectMessageHandler:(id)a3
{
}

- (id)deviceInfoChangeHandler
{
  return self->_deviceInfoChangeHandler;
}

- (void)setDeviceInfoChangeHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)multimodalContextMessageHandler
{
  return self->_multimodalContextMessageHandler;
}

- (void)setMultimodalContextMessageHandler:(id)a3
{
}

- (id)pmeConfigMessageHandler
{
  return self->_pmeConfigMessageHandler;
}

- (void)setPmeConfigMessageHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (unsigned)coreBluetoothInternalFlag
{
  return self->_coreBluetoothInternalFlag;
}

- (void)setCoreBluetoothInternalFlag:(unsigned int)a3
{
  self->_uint64_t coreBluetoothInternalFlag = a3;
}

- (void).cxx_destruct
{
}

@end