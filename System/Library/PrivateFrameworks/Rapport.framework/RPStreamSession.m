@interface RPStreamSession
+ (BOOL)supportsSecureCoding;
- (BOOL)_startServerConnectionAndReturnError:(id *)a3;
- (BOOL)serverMode;
- (NSData)pskData;
- (NSData)streamKey;
- (NSString)destinationString;
- (NSString)serviceType;
- (NSString)streamID;
- (NSString)trafficSessionID;
- (NSUUID)nwClientID;
- (OS_dispatch_queue)dispatchQueue;
- (RPMessageable)messenger;
- (RPStreamSession)init;
- (RPStreamSession)initWithCoder:(id)a3;
- (id)_lowLatencySelfAddressString:(id *)a3;
- (id)connectionReadyHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)disconnectHandler;
- (id)flowControlWriteChangedHandler;
- (id)invalidationHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)statusChangedHandler;
- (id)streamAcceptHandler;
- (int)flowControlWriteState;
- (int)streamQoS;
- (int)streamSocket;
- (int)streamType;
- (unint64_t)delegatedProcessUPID;
- (unint64_t)statusFlags;
- (unsigned)_getSockAddrInterfaceType:(const void *)a3;
- (unsigned)streamFlags;
- (unsigned)trafficFlags;
- (void)_clientRPConnectionPrepareResponse:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_clientRPConnectionPrepareWithCompletion:(id)a3;
- (void)_clientRPConnectionStartWithCompletion:(id)a3;
- (void)_clientUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 usb:(BOOL)a6 completion:(id)a7;
- (void)_clientUDPNWPathStartResponse:(id)a3 options:(id)a4 localEndpoint:(id)a5 nwInterface:(id)a6 selfIPString:(id)a7 usb:(BOOL)a8 completion:(id)a9;
- (void)_clientUDPNWPathStartWithCompletion:(id)a3;
- (void)_clientUDPSocketStartResponse:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_clientUDPSocketStartWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_serverRPConnectionHandleConnectionAccepted:(int)a3;
- (void)_serverRPConnectionHandleConnectionStarted:(id)a3;
- (void)_serverRPConnectionStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_serverUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 peerIP:(id *)a6 peerMACData:(id)a7 usb:(BOOL)a8 responseHandler:(id)a9;
- (void)_serverUDPNWPathStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_serverUDPSocketStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_updateTrafficRegistration;
- (void)_updateTrafficRegistrationForDestination:(id)a3;
- (void)_updateTrafficRegistrationForIP:(id *)a3;
- (void)acceptedByServer;
- (void)activateForServerRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)prepareWithCompletion:(id)a3;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setConnectionReadyHandler:(id)a3;
- (void)setDelegatedProcessUPID:(unint64_t)a3;
- (void)setDestinationString:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlowControlWriteChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setNwClientID:(id)a3;
- (void)setPskData:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setServerMode:(BOOL)a3;
- (void)setServiceType:(id)a3;
- (void)setStatusChangedHandler:(id)a3;
- (void)setStreamAcceptHandler:(id)a3;
- (void)setStreamFlags:(unsigned int)a3;
- (void)setStreamID:(id)a3;
- (void)setStreamKey:(id)a3;
- (void)setStreamQoS:(int)a3;
- (void)setStreamQoSOnSocket:(int)a3;
- (void)setStreamSocket:(int)a3;
- (void)setStreamType:(int)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)setTrafficSessionID:(id)a3;
- (void)startServerConnectionWithCompletion:(id)a3;
@end

@implementation RPStreamSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStreamSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPStreamSession;
  v2 = -[RPStreamSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_streamSocket = -1;
    v4 = v3;
  }

  return v3;
}

- (RPStreamSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RPStreamSession;
  v5 = -[RPStreamSession init](&v20, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v6->_streamSocket = -1;
    id v7 = v4;

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ((NSDecodeSInt64RangedIfPresent() & 1) != 0) {
      LOBYTE(streamFlags) = v21;
    }
    else {
      unsigned int streamFlags = v6->_streamFlags;
    }
    v6->_unsigned int streamFlags = streamFlags & 2;
    id v14 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v15 containsValueForKey:@"streamSocket"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v15 decodeXPCObjectOfType:MEMORY[0x1895F9270] forKey:@"streamSocket"];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16) {
          v6->_streamSocket = xpc_fd_dup(v16);
        }
      }
    }

    v18 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t delegatedProcessUPID = self->_delegatedProcessUPID;
  v18 = v4;
  if (delegatedProcessUPID)
  {
    [v4 encodeInt64:delegatedProcessUPID forKey:@"dpUPID"];
    v5 = v18;
  }

  destinationString = self->_destinationString;
  if (destinationString)
  {
    [v5 encodeObject:destinationString forKey:@"dstS"];
    v5 = v18;
  }

  nwClientID = self->_nwClientID;
  if (nwClientID)
  {
    [v5 encodeObject:nwClientID forKey:@"nwClientID"];
    v5 = v18;
  }

  pskData = self->_pskData;
  if (pskData)
  {
    [v5 encodeObject:pskData forKey:@"pskD"];
    v5 = v18;
  }

  if (self->_serverMode)
  {
    [v5 encodeBool:1 forKey:@"serverMode"];
    v5 = v18;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v5 encodeObject:serviceType forKey:@"streamSrv"];
    v5 = v18;
  }

  if ((self->_streamFlags & 2) != 0)
  {
    objc_msgSend(v5, "encodeInt64:forKey:");
    v5 = v18;
  }

  streamID = self->_streamID;
  if (streamID)
  {
    [v5 encodeObject:streamID forKey:@"streamID"];
    v5 = v18;
  }

  streamKey = self->_streamKey;
  if (streamKey)
  {
    [v5 encodeObject:streamKey forKey:@"streamKey"];
    v5 = v18;
  }

  uint64_t streamType = self->_streamType;
  if ((_DWORD)streamType)
  {
    [v5 encodeInteger:streamType forKey:@"streamType"];
    v5 = v18;
  }

  uint64_t streamQoS = self->_streamQoS;
  if ((_DWORD)streamQoS)
  {
    [v5 encodeInteger:streamQoS forKey:@"streamQoS"];
    v5 = v18;
  }

  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = v18;
    if ((isKindOfClass & 1) != 0)
    {
      xpc_object_t v17 = xpc_fd_create(streamSocket);
      [v18 encodeXPCObject:v17 forKey:@"streamSocket"];

      v5 = v18;
    }
  }
}

- (void)dealloc
{
  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = -1;
  }

  -[RPStreamSession _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPStreamSession;
  -[RPStreamSession dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPStreamSession descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  v5 = v4;
  if (self->_streamType)
  {
    id v15 = v4;
    NSAppendPrintF();
    id v6 = v15;

    v5 = v6;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    id v14 = serviceType;
    NSAppendPrintF();
    id v8 = v5;

    v5 = v8;
  }

  if (self->_streamQoS)
  {
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }

  if (self->_statusFlags)
  {
    NSAppendPrintF();
    id v11 = v5;

    v5 = v11;
  }

  if (self->_trafficFlags)
  {
    NSAppendPrintF();
    id v12 = v5;

    v5 = v12;
  }

  return v5;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_trafficRegistrationCalled)
    {
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __35__RPStreamSession_setTrafficFlags___block_invoke;
      block[3] = &unk_18A031A30;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }

uint64_t __35__RPStreamSession_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

- (void)setStreamQoS:(int)a3
{
  int streamQoS = self->_streamQoS;
  if (streamQoS != a3)
  {
    if (gLogCategory_RPStreamSession > 30) {
      goto LABEL_28;
    }
    if (gLogCategory_RPStreamSession == -1)
    {
      int streamQoS = self->_streamQoS;
    }

    id v6 = "Default";
    switch(streamQoS)
    {
      case 0:
        break;
      case 1:
        id v6 = "Background";
        break;
      case 2:
        id v6 = "Video";
        break;
      case 3:
        id v6 = "Voice";
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_11;
      case 10:
        id v6 = "AirPlayAudio";
        break;
      case 11:
        id v6 = "AirPlayScreenAudio";
        break;
      case 12:
        id v6 = "AirPlayScreenVideo";
        break;
      default:
        if (streamQoS == 20) {
          id v6 = "NTP";
        }
        else {
LABEL_11:
        }
          id v6 = "?";
        break;
    }

    id v7 = "Default";
    switch(a3)
    {
      case 0:
        break;
      case 1:
        id v7 = "Background";
        break;
      case 2:
        id v7 = "Video";
        break;
      case 3:
        id v7 = "Voice";
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_21;
      case 10:
        id v7 = "AirPlayAudio";
        break;
      case 11:
        id v7 = "AirPlayScreenAudio";
        break;
      case 12:
        id v7 = "AirPlayScreenVideo";
        break;
      default:
        if (a3 == 20) {
          id v7 = "NTP";
        }
        else {
LABEL_21:
        }
          id v7 = "?";
        break;
    }

    id v12 = v6;
    v13 = v7;
    LogPrintF();
LABEL_28:
    self->_int streamQoS = a3;
    -[RPConnection tcpConnection](self->_rpCnx, "tcpConnection", v12, v13);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 socketFD];

    if (v9 < 0)
    {
      uint64_t streamSocket = self->_streamSocket;
      if ((streamSocket & 0x80000000) != 0) {
        return;
      }
    }

    else
    {
      -[RPConnection tcpConnection](self->_rpCnx, "tcpConnection");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t streamSocket = [v10 socketFD];

      if ((streamSocket & 0x80000000) != 0) {
        return;
      }
    }

    -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", streamSocket);
  }

- (void)setStreamQoSOnSocket:(int)a3
{
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  SocketSetQoS();
}

- (void)acceptedByServer
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__RPStreamSession_acceptedByServer__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPStreamSession_acceptedByServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrafficRegistration];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __42__RPStreamSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __42__RPStreamSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(v2 + 144) & 0x80000000) == 0
    || *(void *)(v2 + 288) && *(void *)(v2 + 296)
    || *(void *)(v2 + 208))
  {
    int v3 = 1;
  }

  else
  {
    if (!*(void *)(v2 + 200))
    {
LABEL_19:
      RPErrorF();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));

      return;
    }

    int v3 = 0;
  }

  if (!*(void *)(v2 + 264)) {
    goto LABEL_19;
  }
  [*(id *)(v2 + 200) setServiceType:*(void *)(v2 + 240)];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(v4 + 148);
  if (v5 != 3)
  {
    if (v5 == 2)
    {
      if (*(_BYTE *)(v4 + 136))
      {
        id v10 = 0LL;
        [(id)v4 _startServerConnectionAndReturnError:&v10];
        id v7 = v10;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }

      else
      {
        uint64_t v8 = *(void *)(a1 + 40);
        if (v3) {
          [(id)v4 _clientRPConnectionStartWithCompletion:v8];
        }
        else {
          [(id)v4 _clientRPConnectionPrepareWithCompletion:v8];
        }
      }

      return;
    }

    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v3)
      {
        [(id)v4 _clientUDPSocketStartWithCompletion:v6];
        return;
      }

      goto LABEL_16;
    }

    goto LABEL_19;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v3)
  {
LABEL_16:
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
    return;
  }

  [(id)v4 _clientUDPNWPathStartWithCompletion:v6];
}

- (void)activateForServerRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  id v11 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v11;
  if (!v11) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = (dispatch_queue_s *)self->_dispatchQueue;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke;
  v17[3] = &unk_18A0324F8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, v17);
}

void __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke(void *a1)
{
  *(_BYTE *)(a1[4] + 136LL) = 1;
  [*(id *)(a1[4] + 200) setServiceType:*(void *)(a1[4] + 240)];
  uint64_t v2 = (_DWORD *)a1[4];
  int v3 = v2[37];
  switch(v3)
  {
    case 3:
      [v2 _serverUDPNWPathStartRequest:a1[5] options:a1[6] responseHandler:a1[7]];
      break;
    case 2:
      [v2 _serverRPConnectionStartRequest:a1[5] options:a1[6] responseHandler:a1[7]];
      break;
    case 1:
      [v2 _serverUDPSocketStartRequest:a1[5] options:a1[6] responseHandler:a1[7]];
      break;
    default:
      RPErrorF();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      (*(void (**)(void))(a1[7] + 16LL))(a1[7]);

      break;
  }

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__RPStreamSession_prepareWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __41__RPStreamSession_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 200) && *(void *)(v2 + 264))
  {
    int v3 = *(_DWORD *)(v2 + 148);
    switch(v3)
    {
      case 3:
        [(id)v2 _clientUDPNWPathStartWithCompletion:*(void *)(a1 + 40)];
        return;
      case 2:
        *(_BYTE *)(v2 + 96) = 1;
        [*(id *)(a1 + 32) _clientRPConnectionPrepareWithCompletion:*(void *)(a1 + 40)];
        return;
      case 1:
        [(id)v2 _clientUDPSocketStartWithCompletion:*(void *)(a1 + 40)];
        return;
    }
  }

  RPErrorF();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
}

- (void)startServerConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = 0LL;
  [v2 _startServerConnectionAndReturnError:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)_startServerConnectionAndReturnError:(id *)a3
{
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    else {
      id v6 = off_18A0342D8[streamType];
    }
    id v7 = "yes";
    if (!self->_pskData) {
      id v7 = "no";
    }
    uint64_t streamSocket = self->_streamSocket;
    v26 = v7;
    v24 = v6;
    LogPrintF();
  }

  uint64_t v8 = self->_streamSocket;
  if ((v8 & 0x80000000) != 0)
  {
    RPErrorF();
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (a3) {
      *a3 = v15;
    }

    return 0;
  }

  else
  {
    socklen_t v33 = 28;
    getsockname(v8, &v34, &v33);
    id v9 = objc_alloc_init(MEMORY[0x18960EDA8]);
    [v9 setDispatchQueue:self->_dispatchQueue];
    [v9 setFlags:137];
    id v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Stream-%u",  SockAddrGetPort());
    [v9 setLabel:v10];

    [v9 setSocketFD:v8];
    self->_uint64_t streamSocket = -1;
    if (self->_streamQoS >= 1) {
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", v8);
    }
    id v32 = 0LL;
    [v9 activateDirectAndReturnError:&v32];
    id v11 = v32;
    BOOL v12 = v11 == 0LL;
    if (v11)
    {
      v13 = v11;
      RPErrorF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        id v23 = v14;
        LogPrintF();
      }

      objc_msgSend(v9, "invalidate", v23, v24, streamSocket, v26);
      if (a3)
      {
        id v14 = v14;
        *a3 = v14;
      }
    }

    else
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___RPConnection);
      -[RPConnection setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
      -[RPConnection setFlags:](v16, "setFlags:", -[RPConnection flags](v16, "flags") | 0x80000);
      [v9 label];
      xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPConnection setLabel:](v16, "setLabel:", v17);

      -[RPConnection setPskData:](v16, "setPskData:", self->_pskData);
      pskData = self->_pskData;
      self->_pskData = 0LL;

      -[RPConnection setTcpConnection:](v16, "setTcpConnection:", v9);
      uint64_t v19 = MEMORY[0x1895F87A8];
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke;
      v31[3] = &unk_18A031A30;
      v31[4] = self;
      -[RPConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v31);
      v30[0] = v19;
      v30[1] = 3221225472LL;
      v30[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2;
      v30[3] = &unk_18A033298;
      v30[4] = self;
      -[RPConnection setReceivedEventHandler:](v16, "setReceivedEventHandler:", v30);
      v29[0] = v19;
      v29[1] = 3221225472LL;
      v29[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3;
      v29[3] = &unk_18A0332C0;
      v29[4] = self;
      -[RPConnection setReceivedRequestHandler:](v16, "setReceivedRequestHandler:", v29);
      v28[0] = v19;
      v28[1] = 3221225472LL;
      v28[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4;
      v28[3] = &unk_18A033118;
      v28[4] = self;
      -[RPConnection setStateChangedHandler:](v16, "setStateChangedHandler:", v28);
      v27[0] = v19;
      v27[1] = 3221225472LL;
      v27[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5;
      v27[3] = &unk_18A031AC0;
      v27[4] = self;
      -[RPConnection setReadErrorHandler:](v16, "setReadErrorHandler:", v27);
      rpCnx = self->_rpCnx;
      self->_rpCnx = v16;
      uint64_t v21 = v16;

      -[RPConnection activate](v21, "activate");
      id v14 = 0LL;
    }
  }

  return v12;
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 216LL));
  id v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 224LL));
  v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) connectionReadyHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      id v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 168LL));
    if (v4)
    {
      int v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 176LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6;
      block[3] = &unk_18A0340D0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__RPStreamSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPStreamSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t streamType = self->_streamType;
      else {
        id v4 = off_18A0342D8[streamType];
      }
      streamID = self->_streamID;
      id v14 = v4;
      LogPrintF();
    }

    nwPathEvaluator = self->_nwPathEvaluator;
    if (nwPathEvaluator)
    {
      id v6 = nwPathEvaluator;
      nw_path_evaluator_cancel();
      id v7 = self->_nwPathEvaluator;
      self->_nwPathEvaluator = 0LL;
    }

    nwListener = self->_nwListener;
    if (nwListener)
    {
      id v9 = nwListener;
      nw_listener_cancel(v9);
      id v10 = self->_nwListener;
      self->_nwListener = 0LL;
    }

    -[RPConnection invalidate](self->_rpCnx, "invalidate", streamID, v14);
    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      if (close(streamSocket))
      {
        if (*__error()) {
          __error();
        }
      }

      self->_int streamSocket = -1;
    }

    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0LL;

    -[RPStreamSession _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_rpCnx && !self->_tcpServer)
  {
    uint64_t v3 = MEMORY[0x1895A4770](self->_invalidationHandler);
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id disconnectHandler = self->_disconnectHandler;
    self->_id disconnectHandler = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    messenger = self->_messenger;
    self->_messenger = 0LL;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0LL;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0LL;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0LL;

    id streamAcceptHandler = self->_streamAcceptHandler;
    self->_id streamAcceptHandler = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)_clientUDPNWPathStartWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  socklen_t v33 = __Block_byref_object_copy__6;
  sockaddr v34 = __Block_byref_object_dispose__6;
  uint64_t v5 = MEMORY[0x1895F87A8];
  id v35 = 0LL;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke;
  v27[3] = &unk_18A033FA0;
  v29 = &v30;
  id v6 = v4;
  id v28 = v6;
  id v7 = (void (**)(void))MEMORY[0x1895A4770](v27);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = self->_messenger;
    BOOL v9 = -[RPMessageable linkType](v8, "linkType") == 4;
  }

  else
  {
    BOOL v9 = 0;
  }

  secure_udp = nw_parameters_create_secure_udp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EA8]);
  if (!secure_udp)
  {
    uint64_t v16 = RPErrorF();
    id v11 = (id)v31[5];
    void v31[5] = v16;
    goto LABEL_24;
  }

  nw_parameters_set_allow_duplicate_state_updates();
  id v11 = 0LL;
  uint64_t v12 = 0LL;
  id v26 = 0LL;
  if (!v9) {
    goto LABEL_15;
  }
  if ((self->_streamFlags & 2) == 0) {
    goto LABEL_11;
  }
  -[RPStreamSession _lowLatencySelfAddressString:](self, "_lowLatencySelfAddressString:", &v26);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

uint64_t __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_73( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v5 = a3;
  id v6 = v5;
  if (gLogCategory_RPStreamSession <= 30)
  {
    v13 = v5;
    if (gLogCategory_RPStreamSession != -1 || (v7 = _LogCategory_Initialize(), id v6 = v13, v7))
    {
      LogPrintF();
      id v6 = v13;
    }
  }

  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16LL))
  {
    if (a2 == 3 || v6)
    {
      id v14 = v6;
      if (v6) {
        id v8 = nw_error_copy_cf_error(v6);
      }
      else {
        id v8 = 0LL;
      }
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
      uint64_t v10 = *(void *)(v9 + 40);
      if (!v10)
      {
        uint64_t v12 = 0LL;
        goto LABEL_23;
      }

      RPNestedErrorF();
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

LABEL_21:
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
      uint64_t v12 = *(void **)(v9 + 40);
LABEL_23:
      *(void *)(v9 + 40) = 0LL;

LABEL_24:
      id v6 = v14;
      goto LABEL_25;
    }

    if ((a2 - 1) <= 1 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      id v14 = 0LL;
      id v8 = (void *)nw_listener_copy_local_endpoint();
      if (!v8)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_24;
      }

      [*(id *)(a1 + 40) _clientUDPNWPathNextWithEndpoint:v8 nwInterface:*(void *)(a1 + 48) selfMACData:*(void *)(a1 + 56) usb:0 completion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      goto LABEL_21;
    }
  }

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  id v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = v4, v3))
    {
      LogPrintF();
      uint64_t v2 = v4;
    }
  }

  nw_connection_cancel(v2);
}

- (void)_clientUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 usb:(BOOL)a6 completion:(id)a7
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (nw_endpoint *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  address = nw_endpoint_get_address(v12);
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30)
    {
      if (!*(_DWORD *)&address->sa_data[6]
        && !*(_DWORD *)&address->sa_data[10]
        && !*(_DWORD *)&address[1].sa_len
        && !*(_DWORD *)&address[1].sa_data[2])
      {
        goto LABEL_5;
      }
    }

    else if (sa_family == 2 && !*(_DWORD *)&address->sa_data[2])
    {
LABEL_5:
      id v18 = 0LL;
      goto LABEL_14;
    }

    v46[0] = 0;
    SockAddrToString();
    [NSString stringWithUTF8String:v46];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    uint64_t Port = SockAddrGetPort();
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t streamType = self->_streamType;
      else {
        id v22 = off_18A0342D8[streamType];
      }
      v38 = v12;
      uint64_t v39 = Port;
      v36 = v18;
      id v37 = v14;
      uint64_t streamFlags = self->_streamFlags;
      id v35 = &unk_1873E8432;
      streamID = self->_streamID;
      socklen_t v33 = v22;
      LogPrintF();
    }

    id v23 = objc_alloc_init(MEMORY[0x189603FC8]);
    v24 = v23;
    if (v18) {
      [v23 setObject:v18 forKeyedSubscript:@"_streamAddr"];
    }
    if (v14) {
      [v24 setObject:v14 forKeyedSubscript:@"_streamMACAddr"];
    }
    if (self->_streamFlags)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setObject:v25 forKeyedSubscript:@"_streamFlags"];
    }

    objc_msgSend( v24,  "setObject:forKeyedSubscript:",  self->_streamID,  @"_streamID",  streamID,  v33,  streamFlags,  v35,  v36,  v37,  v38,  v39);
    [MEMORY[0x189607968] numberWithInt:Port];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 setObject:v26 forKeyedSubscript:@"_streamPort"];

    [MEMORY[0x189607968] numberWithInt:self->_streamType];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 setObject:v27 forKeyedSubscript:@"_streamType"];

    [MEMORY[0x189607968] numberWithUnsignedInt:self->_trafficFlags];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 setObject:v28 forKeyedSubscript:@"_tf"];

    serviceType = self->_serviceType;
    if (serviceType) {
      [v24 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
    }
    messenger = self->_messenger;
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v40[2] = __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke;
    v40[3] = &unk_18A034160;
    id v44 = v15;
    v40[4] = self;
    v41 = v12;
    id v42 = v13;
    id v43 = v18;
    BOOL v45 = a6;
    id v31 = v18;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_streamStart",  v24,  @"rapport:rdid:DirectPeer",  0LL,  v40);

    goto LABEL_33;
  }

  RPErrorF();
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*((void (**)(id, void *))v15 + 2))(v15, v19);

LABEL_33:
}

void __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  if (!v12 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v10 = *(void *)(a1 + 64);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }

    else
    {
      RPErrorF();
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }

  else
  {
    [*(id *)(a1 + 32) _clientUDPNWPathStartResponse:v12 options:v8 localEndpoint:*(void *)(a1 + 40) nwInterface:*(void *)(a1 + 48) selfIPString:*(void *)(a1 + 56) usb:*(unsigned __int8 *)(a1 + 72) completion:*(void *)(a1 + 64)];
  }
}

- (void)_clientUDPNWPathStartResponse:(id)a3 options:(id)a4 localEndpoint:(id)a5 nwInterface:(id)a6 selfIPString:(id)a7 usb:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v48 = a4;
  local_endpoint = (nw_endpoint *)a5;
  interface = (nw_interface *)a6;
  id v49 = a7;
  id v16 = a9;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = __Block_byref_object_copy__6;
  v58 = __Block_byref_object_dispose__6;
  id v59 = 0LL;
  v51[0] = MEMORY[0x1895F87A8];
  v51[1] = 3221225472LL;
  v51[2] = __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke;
  v51[3] = &unk_18A033FA0;
  v53 = &v54;
  id v17 = v16;
  id v52 = v17;
  id v18 = (void (**)(void))MEMORY[0x1895A4770](v51);
  CFStringGetTypeID();
  if (![(id) CFDictionaryGetTypedValue() UTF8String])
  {
    uint64_t v38 = RPErrorF();
    id v20 = (void *)v55[5];
    v55[5] = v38;
    goto LABEL_40;
  }

  if (stristr() || stristr())
  {
    StringToSockAddr();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v19;
    if (v19)
    {
      if (v49) {
        id v21 = @"%llw0";
      }
      else {
        id v21 = @"%awdl0";
      }
      id v22 = [v19 stringByAppendingString:v21];
      uint64_t v23 = [v22 UTF8String];

      if (!v23)
      {
        uint64_t v41 = RPErrorF();
        id v42 = (void *)v55[5];
        v55[5] = v41;

        goto LABEL_40;
      }
    }

    else if (v49 {
           && gLogCategory_RPStreamSession <= 30
    }
           && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetCFDataOfLength();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CFDictionaryGetInt64Ranged())
  {
    uint64_t v39 = RPErrorF();
    v40 = (void *)v55[5];
    v55[5] = v39;

    goto LABEL_39;
  }

  if (!StringToSockAddr())
  {
    SockAddrSetPort();
    if (!SockAddrConvertToIPv6())
    {
      if (v24)
      {
        uint64_t v27 = [v24 bytes];
        int v28 = *(_DWORD *)v27;
        __int16 v61 = *(_WORD *)(v27 + 4);
        int v60 = v28;
        uint64_t address_with_ethernet = nw_endpoint_create_address_with_ethernet();
      }

      else
      {
        uint64_t address_with_ethernet = (uint64_t)nw_endpoint_create_address(&address);
      }

      id v26 = (void *)address_with_ethernet;
      if (address_with_ethernet)
      {
        -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &address);
        if (v9)
        {
          legacy_tcp_socket = (nw_parameters *)nw_parameters_create_legacy_tcp_socket();
          nw_parameters_t secure_udp = legacy_tcp_socket;
          if (legacy_tcp_socket)
          {
            uint64_t v32 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
            if (!v32)
            {
LABEL_47:
              uint64_t v43 = RPErrorF();
              id v44 = (void *)v55[5];
              v55[5] = v43;

LABEL_37:
              goto LABEL_38;
            }

            options = nw_udp_create_options();
            nw_udp_options_set_no_metadata();
            nw_protocol_stack_set_transport_protocol(v32, options);

LABEL_29:
            nw_parameters_set_delegated_unique_pid();
            nw_parameters_set_reuse_local_address(secure_udp, 1);
            nw_parameters_set_local_endpoint(secure_udp, local_endpoint);
            evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
            nwPathEvaluator = self->_nwPathEvaluator;
            self->_nwPathEvaluator = evaluator_for_endpoint;

            if (self->_nwPathEvaluator)
            {
              nw_path_evaluator_get_client_id();
              v36 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v60];
              nwClientID = self->_nwClientID;
              self->_nwClientID = v36;

              if (gLogCategory_RPStreamSession <= 30
                && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }

              (*((void (**)(id, void))v17 + 2))(v17, 0LL);
              goto LABEL_37;
            }

            goto LABEL_47;
          }
        }

        else
        {
          nw_parameters_t secure_udp = nw_parameters_create_secure_udp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  &__block_literal_global_126);
          if (secure_udp) {
            goto LABEL_29;
          }
        }
      }

      uint64_t v45 = RPErrorF();
      nw_parameters_t secure_udp = (nw_parameters_t)v55[5];
      v55[5] = v45;
      goto LABEL_37;
    }
  }

  uint64_t v25 = RPErrorF();
  id v26 = (void *)v55[5];
  v55[5] = v25;
LABEL_38:

LABEL_39:
LABEL_40:

  v18[2](v18);
  _Block_object_dispose(&v54, 8);
}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_serverUDPNWPathStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = __Block_byref_object_copy__6;
  v68 = __Block_byref_object_dispose__6;
  uint64_t v11 = MEMORY[0x1895F87A8];
  id v69 = 0LL;
  v61[0] = MEMORY[0x1895F87A8];
  v61[1] = 3221225472LL;
  v61[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke;
  v61[3] = &unk_18A033FA0;
  v63 = &v64;
  id v49 = v10;
  id v62 = v49;
  id v12 = (void (**)(void))MEMORY[0x1895A4770](v61);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    else {
      id v14 = off_18A0342D8[streamType];
    }
    uint64_t trafficFlags = self->_trafficFlags;
    v46 = &unk_1873E83BF;
    uint64_t streamFlags = self->_streamFlags;
    id v44 = &unk_1873E8432;
    streamID = self->_streamID;
    id v42 = v14;
    LogPrintF();
  }

  id v60 = 0LL;
  CFStringGetTypeID();
  if (![(id) CFDictionaryGetTypedValue() UTF8String])
  {
    uint64_t v31 = RPErrorF();
    id v15 = (NSString *)v65[5];
    v65[5] = v31;
    goto LABEL_55;
  }

  if (!stristr() && !stristr())
  {
    id v15 = 0LL;
    goto LABEL_21;
  }

  StringToSockAddr();
  if ((self->_streamFlags & 2) != 0)
  {
    -[RPStreamSession _lowLatencySelfAddressString:](self, "_lowLatencySelfAddressString:", &v60);
    id v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      goto LABEL_15;
    }
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  id v15 = 0LL;
LABEL_15:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v16;
  if (v16)
  {
    if (v15) {
      id v18 = @"%llw0";
    }
    else {
      id v18 = @"%awdl0";
    }
    id v19 = objc_msgSend(v16, "stringByAppendingString:", v18, streamID, v42, streamFlags, v44, trafficFlags, v46);
    uint64_t v20 = [v19 UTF8String];

    if (!v20)
    {
      uint64_t v38 = RPErrorF();
      uint64_t v39 = (void *)v65[5];
      v65[5] = v38;

      goto LABEL_55;
    }
  }

  else if (v15 {
         && gLogCategory_RPStreamSession <= 30
  }
         && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    streamID = v15;
    LogPrintF();
  }

LABEL_21:
  int v58 = StringToSockAddr();
  if (v58)
  {
    uint64_t v32 = RPErrorF();
    id v48 = (void *)v65[5];
    v65[5] = v32;

    goto LABEL_55;
  }

  CFDictionaryGetCFDataOfLength();
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  SockAddrSetPort();
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  self->_uint64_t trafficFlags = Int64Ranged;
  if (v15)
  {
    id v22 = -[NSString stringByAppendingString:](v15, "stringByAppendingString:", @"%llw0", streamID);
    uint64_t v23 = [v22 UTF8String];

    if (!v23)
    {
LABEL_63:
      uint64_t v33 = RPErrorF();
      sockaddr v34 = (void *)v65[5];
      v65[5] = v33;

      goto LABEL_54;
    }
  }

  else
  {
    CFStringGetTypeID();
    if (![(id) CFDictionaryGetTypedValue() UTF8String]) {
      goto LABEL_63;
    }
  }

  int v58 = StringToSockAddr();
  if (v58)
  {
    uint64_t v35 = RPErrorF();
    nw_parameters_t secure_udp = (nw_parameters *)v65[5];
    v65[5] = v35;
    goto LABEL_53;
  }

  nw_parameters_t secure_udp = nw_parameters_create_secure_udp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EA8]);
  if (secure_udp)
  {
    nw_parameters_set_allow_duplicate_state_updates();
    uint64_t v25 = v11;
    id v26 = 0LL;
    if (!v15 || (self->_streamFlags & 2) == 0) {
      goto LABEL_31;
    }
    id v26 = (nw_interface *)nw_interface_create_with_name();
    if (v26)
    {
      nw_parameters_require_interface(secure_udp, v26);
LABEL_31:
      uint64_t v27 = self->_nwListener;
      int v28 = v27;
      if (v27) {
        nw_listener_cancel(v27);
      }

      nw_listener_t v29 = nw_listener_create(secure_udp);
      objc_storeStrong((id *)&self->_nwListener, v29);
      if (v29)
      {
        nw_listener_set_queue(v29, (dispatch_queue_t)self->_dispatchQueue);
        v56[0] = 0LL;
        v56[1] = v56;
        v56[2] = 0x3032000000LL;
        v56[3] = __Block_byref_object_copy__71;
        v56[4] = __Block_byref_object_dispose__72;
        id v57 = (id)MEMORY[0x1895A4770](v49);
        v50[0] = v25;
        v50[1] = 3221225472LL;
        v50[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2;
        v50[3] = &unk_18A0341C8;
        v50[4] = v29;
        v50[5] = self;
        uint64_t v54 = v56;
        v51 = v26;
        id v30 = v60;
        v55[0] = *(_OWORD *)v59;
        *(_OWORD *)((char *)v55 + 12) = *(_OWORD *)&v59[12];
        id v52 = v30;
        v53 = v47;
        MEMORY[0x1895A44C4](v29, v50);
        nw_listener_set_new_connection_handler(v29, &__block_literal_global_140);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        nw_listener_start(v29);

        _Block_object_dispose(v56, 8);
      }

      else
      {
        uint64_t v36 = RPErrorF();
        id v37 = (void *)v65[5];
        v65[5] = v36;
      }

      goto LABEL_52;
    }
  }

  uint64_t v40 = RPErrorF();
  id v26 = (nw_interface *)v65[5];
  v65[5] = v40;
LABEL_52:

LABEL_53:
LABEL_54:

LABEL_55:
  v12[2](v12);

  _Block_object_dispose(&v64, 8);
}

uint64_t __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v5 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16LL))
  {
    if (a2 == 3 || v5)
    {
      if (v5) {
        id v6 = nw_error_copy_cf_error(v5);
      }
      else {
        id v6 = 0LL;
      }
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v13 = *(void *)(v12 + 40);
      if (!v13)
      {
        id v15 = 0LL;
        goto LABEL_23;
      }

      RPNestedErrorF();
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0LL, 0LL, v14);

LABEL_21:
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v15 = *(void **)(v12 + 40);
LABEL_23:
      *(void *)(v12 + 40) = 0LL;

LABEL_24:
      goto LABEL_25;
    }

    if ((a2 - 1) <= 1 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
    {
      id v6 = (void *)nw_listener_copy_local_endpoint();
      if (!v6)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_24;
      }

      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
      v16[0] = *(_OWORD *)(a1 + 80);
      *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)(a1 + 92);
      [v7 _serverUDPNWPathNextWithEndpoint:v6 nwInterface:v8 selfMACData:v9 peerIP:v16 peerMACData:v10 usb:0 responseHandler:v11];
      goto LABEL_21;
    }
  }

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v2 = a2;
  id v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = v4, v3))
    {
      LogPrintF();
      uint64_t v2 = v4;
    }
  }

  nw_connection_cancel(v2);
}

- (void)_serverUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 peerIP:(id *)a6 peerMACData:(id)a7 usb:(BOOL)a8 responseHandler:(id)a9
{
  BOOL v9 = a8;
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v14 = (nw_endpoint *)a3;
  interface = (nw_interface *)a4;
  id v58 = a5;
  id v15 = a7;
  id v16 = a9;
  uint64_t v63 = 0LL;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x3032000000LL;
  uint64_t v66 = __Block_byref_object_copy__6;
  v67 = __Block_byref_object_dispose__6;
  id v68 = 0LL;
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 3221225472LL;
  v60[2] = __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke;
  v60[3] = &unk_18A033FA0;
  id v62 = &v63;
  id v17 = v16;
  id v61 = v17;
  id v18 = (void (**)(void))MEMORY[0x1895A4770](v60);
  id v19 = nw_endpoint_get_address(v14);
  if (!v19)
  {
    uint64_t v41 = RPErrorF();
    id v22 = (void *)v64[5];
    v64[5] = v41;
    goto LABEL_36;
  }

  unsigned int Port = SockAddrGetPort();
  int sa_family = v19->sa_family;
  unsigned int v56 = Port;
  if (sa_family != 30)
  {
    if (sa_family == 2 && !*(_DWORD *)&v19->sa_data[2]) {
      goto LABEL_5;
    }
LABEL_11:
    LOBYTE(v69) = 0;
    SockAddrToString();
    [NSString stringWithUTF8String:&v69];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }

  if (*(_DWORD *)&v19->sa_data[6]
    || *(_DWORD *)&v19->sa_data[10]
    || *(_DWORD *)&v19[1].sa_len
    || *(_DWORD *)&v19[1].sa_data[2])
  {
    goto LABEL_11;
  }

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_clientUDPSocketStartWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  int streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = -1;
  }

  unsigned int v15 = 0;
  LODWORD(v12) = 3;
  if (ServerSocketOpenEx2())
  {
    RPErrorF();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v4[2](v4, v6);
  }

  else
  {
    if (self->_streamQoS >= 1) {
      -[RPStreamSession setStreamQoSOnSocket:]( self,  "setStreamQoSOnSocket:",  self->_streamSocket,  v12,  &self->_streamSocket);
    }
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v6 setObject:self->_streamID forKeyedSubscript:@"_streamID"];
    [MEMORY[0x189607968] numberWithInt:v15];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKeyedSubscript:@"_streamPort"];

    [MEMORY[0x189607968] numberWithInt:self->_streamType];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v8 forKeyedSubscript:@"_streamType"];

    [MEMORY[0x189607968] numberWithUnsignedInt:self->_trafficFlags];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v9 forKeyedSubscript:@"_tf"];

    serviceType = self->_serviceType;
    if (serviceType) {
      [v6 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
    }
    messenger = self->_messenger;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke;
    v13[3] = &unk_18A0335E0;
    v13[4] = self;
    id v14 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_streamStart",  v6,  @"rapport:rdid:DirectPeer",  0LL,  v13);
  }
}

void __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }

    else
    {
      RPErrorF();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }

  else
  {
    [*(id *)(a1 + 32) _clientUDPSocketStartResponse:v10 options:v8 completion:*(void *)(a1 + 40)];
  }
}

- (void)_clientUDPSocketStartResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CFDictionaryGetInt64Ranged()
    || (CFStringGetTypeID(), ![(id) CFDictionaryGetTypedValue() UTF8String])
    || StringToSockAddr()
    || (SockAddrSetPort(), SockAddrConvertToIPv6())
    || (int streamSocket = self->_streamSocket, Size = SockAddrGetSize(), connect(streamSocket, &v17, Size))
    && (!*__error() || *__error()))
  {
    RPErrorF();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v10[2](v10, v12);
  }

  else
  {
    socklen_t v15 = 28;
    getsockname(self->_streamSocket, &v16, &v15);
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v10[2](v10, 0LL);
  }
}

- (void)_serverUDPSocketStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  v28[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringGetTypeID();
  if ([(id) CFDictionaryGetTypedValue() UTF8String])
  {
    int v24 = StringToSockAddr();
    if (!v24)
    {
      if (CFDictionaryGetInt64Ranged())
      {
        SockAddrSetPort();
        self->_uint64_t trafficFlags = CFDictionaryGetInt64Ranged();
        CFStringGetTypeID();
        if ([(id) CFDictionaryGetTypedValue() UTF8String])
        {
          int v24 = StringToSockAddr();
          if (!v24)
          {
            p_int streamSocket = &self->_streamSocket;
            if ((self->_streamSocket & 0x80000000) == 0)
            {
              if (close(self->_streamSocket) && *__error()) {
                __error();
              }
              *p_int streamSocket = -1;
            }

            id v19 = &self->_streamSocket;
            LODWORD(streamID) = 1;
            int v24 = ServerSocketOpenEx2();
            if (!v24)
            {
              SockAddrSetPort();
              if (self->_streamQoS >= 1) {
                -[RPStreamSession setStreamQoSOnSocket:]( self,  "setStreamQoSOnSocket:",  self->_streamSocket,  streamID,  v19);
              }
              int v24 = connect(*p_streamSocket, &v26, v25);
              if (!v24)
              {
                int v24 = 0;
                goto LABEL_28;
              }

              if (*__error())
              {
                int v24 = *__error();
                if (!v24)
                {
LABEL_28:
                  NSRandomData();
                  id v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong((id *)&self->_streamKey, v13);
                  if (gLogCategory_RPStreamSession <= 30
                    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
                  {
                    uint64_t streamType = self->_streamType;
                    else {
                      socklen_t v15 = off_18A0342D8[streamType];
                    }
                    serviceType = self->_serviceType;
                    uint64_t v20 = &v23;
                    id v21 = &v26;
                    streamID = self->_streamID;
                    id v19 = (int *)v15;
                    LogPrintF();
                  }

                  v27[1] = @"_streamPort";
                  v28[0] = v13;
                  v27[0] = @"_streamKey";
                  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 0, streamID, v19, v20, v21, serviceType);
                  sockaddr v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v28[1] = v16;
                  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:2];
                  sockaddr v17 = (void *)objc_claimAutoreleasedReturnValue();

                  (*((void (**)(id, void *, void, void))v10 + 2))(v10, v17, 0LL, 0LL);
LABEL_38:

                  goto LABEL_12;
                }
              }

              else
              {
                int v24 = -6700;
              }
            }

            RPErrorF();
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (gLogCategory_RPStreamSession <= 90
              && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }

            (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v13);
            goto LABEL_38;
          }
        }
      }
    }
  }

  RPErrorF();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v11);

LABEL_12:
}

- (void)_clientRPConnectionPrepareWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  RPStreamSessionLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  RPStreamSessionLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self->_streamID);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    streamID = self->_streamID;
    *(_DWORD *)buf = 138412290;
    id v19 = streamID;
    _os_signpost_emit_with_name_impl( &dword_18736A000,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "RPStreamBringUpTime",  " enableTelemetry=YES {streamID:%@, signpost.description:begin_time}",  buf,  0xCu);
  }

  Curve25519MakeKeyPair();
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v9 setObject:self->_streamID forKeyedSubscript:@"_streamID"];
  id v10 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buf length:32];
  [v9 setObject:v10 forKeyedSubscript:@"_streamKey"];

  [MEMORY[0x189607968] numberWithInt:self->_streamType];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v11 forKeyedSubscript:@"_streamType"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_trafficFlags];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v12 forKeyedSubscript:@"_tf"];

  serviceType = self->_serviceType;
  if (serviceType) {
    [v9 setObject:serviceType forKeyedSubscript:@"_streamSrv"];
  }
  messenger = self->_messenger;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  _OWORD v16[2] = __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke;
  v16[3] = &unk_18A0335E0;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_streamStart",  v9,  @"rapport:rdid:DirectPeer",  0LL,  v16);
}

void __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }

    else
    {
      RPErrorF();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }

  else
  {
    [*(id *)(a1 + 32) _clientRPConnectionPrepareResponse:v10 options:v8 completion:*(void *)(a1 + 40)];
  }
}

- (void)_clientRPConnectionPrepareResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy__6;
  sockaddr v34 = __Block_byref_object_dispose__6;
  id v35 = 0LL;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  void v27[2] = __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke;
  v27[3] = &unk_18A033FA0;
  nw_listener_t v29 = &v30;
  id v11 = v10;
  id v28 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x1895A4770](v27);
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged
    && (self->_peerunsigned int Port = Int64Ranged,
        CFStringGetTypeID(),
        [(id) CFDictionaryGetTypedValue() UTF8String]))
  {
    if (StringToSockAddr())
    {
      uint64_t v23 = RPErrorF();
      id v17 = (id)v31[5];
      void v31[5] = v23;
    }

    else
    {
      SockAddrSetPort();
      NSPrintF();
      id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      destinationString = self->_destinationString;
      self->_destinationString = v14;

      CFDictionaryGetCFDataOfLength();
      sockaddr v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v16;
      if (!v16) {
        goto LABEL_21;
      }
      id v17 = v16;
      if (objc_msgSend(v17, "bytes", v26))
      {
        [v17 bytes];
        cccurve25519();
      }

      else
      {
        cccurve25519_make_pub();
      }

      memset_s(self->_ourCurveSK, 0x20uLL, 0, 0x20uLL);
      int8x16_t v18 = vorrq_s8(__s[1], __s[0]);
      if (vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))
      {
        CryptoHKDF();
        id v19 = (NSData *)objc_msgSend(MEMORY[0x189603F48], "_newZeroingDataWithBytes:length:", __s, 32, __s);
        pskData = self->_pskData;
        self->_pskData = v19;

        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        if (self->_prepareOnly) {
          (*((void (**)(id, void))v11 + 2))(v11, 0LL);
        }
        else {
          -[RPStreamSession _clientRPConnectionStartWithCompletion:]( self,  "_clientRPConnectionStartWithCompletion:",  v11);
        }
      }

      else
      {
LABEL_21:
        uint64_t v24 = RPErrorF();
        socklen_t v25 = (void *)v31[5];
        void v31[5] = v24;
      }
    }
  }

  else
  {
    uint64_t v21 = RPErrorF();
    id v22 = (void *)v31[5];
    void v31[5] = v21;
  }

  v12[2](v12);

  _Block_object_dispose(&v30, 8);
}

uint64_t __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL))
  {
    uint64_t v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16LL))();
  }

  return result;
}

- (void)_clientRPConnectionStartWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t streamType = self->_streamType;
    else {
      id v6 = off_18A0342D8[streamType];
    }
    destinationString = self->_destinationString;
    peerunsigned int Port = self->_peerPort;
    streamID = self->_streamID;
    id v14 = v6;
    LogPrintF();
  }

  -[RPStreamSession _updateTrafficRegistrationForDestination:]( self,  "_updateTrafficRegistrationForDestination:",  self->_destinationString,  streamID,  v14,  destinationString,  peerPort);
  id v7 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setDestinationString:](v7, "setDestinationString:", self->_destinationString);
  -[RPConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setFlags:](v7, "setFlags:", -[RPConnection flags](v7, "flags") | 0x80000);
  id v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Stream-%u",  self->_peerPort);
  -[RPConnection setLabel:](v7, "setLabel:", v8);

  -[RPConnection setPskData:](v7, "setPskData:", self->_pskData);
  pskData = self->_pskData;
  self->_pskData = 0LL;

  uint64_t v10 = MEMORY[0x1895F87A8];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke;
  v22[3] = &unk_18A031A30;
  v22[4] = self;
  -[RPConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v22);
  v21[0] = v10;
  v21[1] = 3221225472LL;
  v21[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2;
  v21[3] = &unk_18A033298;
  v21[4] = self;
  -[RPConnection setReceivedEventHandler:](v7, "setReceivedEventHandler:", v21);
  v20[0] = v10;
  v20[1] = 3221225472LL;
  v20[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3;
  v20[3] = &unk_18A0332C0;
  v20[4] = self;
  -[RPConnection setReceivedRequestHandler:](v7, "setReceivedRequestHandler:", v20);
  v19[0] = v10;
  v19[1] = 3221225472LL;
  v19[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4;
  v19[3] = &unk_18A031A30;
  v19[4] = self;
  -[RPConnection setFlowControlWriteChangedHandler:](v7, "setFlowControlWriteChangedHandler:", v19);
  v18[0] = v10;
  v18[1] = 3221225472LL;
  v18[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5;
  v18[3] = &unk_18A033208;
  v18[4] = self;
  v18[5] = v7;
  -[RPConnection setStateChangedHandler:](v7, "setStateChangedHandler:", v18);
  v17[0] = v10;
  v17[1] = 3221225472LL;
  v17[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_171;
  v17[3] = &unk_18A031AC0;
  v17[4] = self;
  -[RPConnection setReadErrorHandler:](v7, "setReadErrorHandler:", v17);
  rpCnx = self->_rpCnx;
  self->_rpCnx = v7;
  uint64_t v12 = v7;

  -[RPConnection activate](v12, "activate");
  v4[2](v4, 0LL);
}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 216LL));
  uint64_t v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 224LL));
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 184LL));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a2 == 1)
  {
    [MEMORY[0x1896079D8] processInfo];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 processName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    RPStreamSessionLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    RPStreamSessionLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(*(void *)(a1 + 32) + 264LL));

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 264LL);
      unsigned int v9 = [*(id *)(a1 + 40) linkType];
      if (v9 > 0xB) {
        id v10 = "?";
      }
      else {
        id v10 = off_18A0342F8[v9];
      }
      int v15 = 138412802;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      int8x16_t v18 = v10;
      __int16 v19 = 2080;
      uint64_t v20 = [v4 UTF8String];
      _os_signpost_emit_with_name_impl( &dword_18736A000,  v5,  OS_SIGNPOST_INTERVAL_END,  v7,  "RPStreamBringUpTime",  " enableTelemetry=YES {streamID:%@, linkType=%{signpost.telemetry:string1}s, process=%{signpost.telemetry:string2 }s, signpost.description:end_time}",  (uint8_t *)&v15,  0x20u);
    }

    id v11 = *(int **)(a1 + 32);
    if (v11[38] >= 1)
    {
      [*(id *)(a1 + 40) tcpConnection];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStreamQoSOnSocket:", objc_msgSend(v12, "socketFD"));

      id v11 = *(int **)(a1 + 32);
    }

    uint64_t v13 = [v11 connectionReadyHandler];
    id v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
  }

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 168LL));
    if (v4)
    {
      uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 176LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_172;
      block[3] = &unk_18A0340D0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_serverRPConnectionStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = __Block_byref_object_copy__6;
  uint64_t v47 = __Block_byref_object_dispose__6;
  id v48 = 0LL;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke;
  v40[3] = &unk_18A034230;
  uint64_t v42 = &v43;
  v40[4] = self;
  id v12 = v10;
  id v41 = v12;
  uint64_t v13 = (void (**)(void))MEMORY[0x1895A4770](v40);
  CFDictionaryGetCFDataOfLength();
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14) {
    goto LABEL_21;
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!v39) {
    self->_uint64_t trafficFlags = Int64Ranged;
  }
  CFStringGetTypeID();
  if ([(id) CFDictionaryGetTypedValue() UTF8String]
    && (int v39 = StringToSockAddr()) == 0)
  {
    uint64_t v16 = (CUTCPServer *)objc_alloc_init(MEMORY[0x18960EDB0]);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v16;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 201LL);
    v37[0] = *(_OWORD *)v38;
    *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)&v38[12];
    -[CUTCPServer setInterfaceAddress:](self->_tcpServer, "setInterfaceAddress:", v37);
    if ((self->_streamFlags & 5) != 0)
    {
      v36[0] = v11;
      v36[1] = 3221225472LL;
      v36[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2;
      v36[3] = &unk_18A033118;
      v36[4] = self;
      -[CUTCPServer setConnectionAcceptHandler:](self->_tcpServer, "setConnectionAcceptHandler:", v36);
    }

    else
    {
      v35[0] = v11;
      v35[1] = 3221225472LL;
      v35[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3;
      v35[3] = &unk_18A034258;
      v35[4] = self;
      -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v35);
    }

    v34[0] = v11;
    v34[1] = 3221225472LL;
    v34[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4;
    v34[3] = &unk_18A031A30;
    v34[4] = self;
    -[CUTCPServer setInvalidationHandler:](self->_tcpServer, "setInvalidationHandler:", v34);
    int8x16_t v18 = self->_tcpServer;
    __int16 v19 = (id *)(v44 + 5);
    id obj = (id)v44[5];
    -[CUTCPServer activateDirectAndReturnError:](v18, "activateDirectAndReturnError:", &obj);
    objc_storeStrong(v19, obj);
    if (v44[5])
    {
      uint64_t v30 = RPNestedErrorF();
      uint64_t v31 = (void *)v44[5];
      v44[5] = v30;
    }

    else
    {
      uint64_t v20 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      SockAddrSetPort();
      Curve25519MakeKeyPair();
      id v21 = v14;
      if ([v21 bytes])
      {
        [v21 bytes];
        cccurve25519();
      }

      else
      {
        cccurve25519_make_pub();
      }

      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      int8x16_t v22 = vorrq_s8(v51[1], v51[0]);
      if (vorr_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))
      {
        CryptoHKDF();
        uint64_t v23 = (NSData *)objc_msgSend(MEMORY[0x189603F48], "_newZeroingDataWithBytes:length:", v51, 32, v51);
        pskData = self->_pskData;
        self->_pskData = v23;

        memset_s(v51, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        v49[0] = @"_streamKey";
        socklen_t v25 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v53 length:32];
        v49[1] = @"_streamPort";
        v50[0] = v25;
        [MEMORY[0x189607968] numberWithInt:v20];
        sockaddr v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v26;
        [MEMORY[0x189603F68] dictionaryWithObjects:v50 forKeys:v49 count:2];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *, void, void))v12 + 2))(v12, v27, 0LL, 0LL);
      }

      else
      {
        uint64_t v32 = RPErrorF();
        uint64_t v27 = (void *)v44[5];
        v44[5] = v32;
      }
    }
  }

  else
  {
LABEL_21:
    uint64_t v28 = RPErrorF();
    nw_listener_t v29 = (void *)v44[5];
    v44[5] = v28;
  }

  v13[2](v13);
  _Block_object_dispose(&v43, 8);
}

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke( uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v1)
  {
    uint64_t v2 = (void *)result;
    if (gLogCategory_RPStreamSession <= 90)
    {
      if (gLogCategory_RPStreamSession == -1)
      {
        uint64_t v1 = *(void *)(*(void *)(v2[6] + 8LL) + 40LL);
      }

      uint64_t v5 = v1;
      LogPrintF();
    }

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(_BYTE **)(a1 + 32);
  if (!v3[8])
  {
    [v3 _serverRPConnectionHandleConnectionAccepted:a2];
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0LL;
  }

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(_BYTE **)(a1 + 32);
  if (!v3[8])
  {
    [v3 _serverRPConnectionHandleConnectionStarted:a2];
    [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0LL;
  }

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_serverRPConnectionHandleConnectionAccepted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  id v8 = (void (**)(id, void))MEMORY[0x1895A4770](self->_streamAcceptHandler);
  if (v8)
  {
    id streamAcceptHandler = self->_streamAcceptHandler;
    self->_id streamAcceptHandler = 0LL;

    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0 && close(streamSocket) && *__error()) {
      __error();
    }
    self->_int streamSocket = v3;
    if (self->_streamQoS >= 1) {
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", v3);
    }
    v8[2](v8, v6);
  }

  else
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    close(v3);
  }
}

- (void)_serverRPConnectionHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setFlags:](v5, "setFlags:", -[RPConnection flags](v5, "flags") | 0x80000);
  uint64_t v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Stream-%u",  -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
  -[RPConnection setLabel:](v5, "setLabel:", v6);

  -[RPConnection label](v5, "label");
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setLabel:v7];

  -[RPConnection setPskData:](v5, "setPskData:", self->_pskData);
  pskData = self->_pskData;
  self->_pskData = 0LL;

  -[RPConnection setTcpConnection:](v5, "setTcpConnection:", v4);
  if (self->_streamQoS >= 1) {
    -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", [v4 socketFD]);
  }
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke;
  v17[3] = &unk_18A031A30;
  v17[4] = self;
  -[RPConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v17);
  v16[0] = v9;
  v16[1] = 3221225472LL;
  _OWORD v16[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2;
  v16[3] = &unk_18A033298;
  v16[4] = self;
  -[RPConnection setReceivedEventHandler:](v5, "setReceivedEventHandler:", v16);
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3;
  v15[3] = &unk_18A0332C0;
  v15[4] = self;
  -[RPConnection setReceivedRequestHandler:](v5, "setReceivedRequestHandler:", v15);
  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4;
  v14[3] = &unk_18A031A30;
  v14[4] = self;
  -[RPConnection setFlowControlWriteChangedHandler:](v5, "setFlowControlWriteChangedHandler:", v14);
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5;
  v13[3] = &unk_18A033118;
  v13[4] = self;
  -[RPConnection setStateChangedHandler:](v5, "setStateChangedHandler:", v13);
  v12[0] = v9;
  v12[1] = 3221225472LL;
  v12[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6;
  v12[3] = &unk_18A031AC0;
  v12[4] = self;
  -[RPConnection setReadErrorHandler:](v5, "setReadErrorHandler:", v12);
  rpCnx = self->_rpCnx;
  self->_rpCnx = v5;
  uint64_t v11 = v5;

  -[RPConnection activate](v11, "activate");
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 216LL));
  id v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 224LL));
  uint64_t v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 184LL));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) connectionReadyHandler];
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    id v4 = (void *)MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 168LL));
    if (v4)
    {
      uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 176LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7;
      block[3] = &unk_18A0340D0;
      block[4] = v4;
      dispatch_async(v5, block);
    }
  }
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (unsigned)_getSockAddrInterfaceType:(const void *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  unsigned int v7 = 0;
  uint64_t v6 = 0LL;
  if (!SockAddrSimplify())
  {
    if (getifaddrs(&v6) && *__error()) {
      __error();
    }
    id v4 = v6;
    if (v6)
    {
      char v8 = 0;
      while (!v4->ifa_addr || !v4->ifa_name || SockAddrCompareAddr())
      {
        id v4 = v4->ifa_next;
        if (!v4) {
          goto LABEL_13;
        }
      }

      __strlcpy_chk();
LABEL_13:
      if (v8)
      {
        if (SocketGetInterfaceInfo())
        {
          if (gLogCategory_RPStreamSession <= 90
            && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_30;
          }
        }

        else if (!v7 {
               && gLogCategory_RPStreamSession <= 90
        }
               && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
LABEL_30:
          LogPrintF();
        }
      }

      else if (gLogCategory_RPStreamSession <= 90 {
             && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_30;
      }
    }

    else
    {
      if (gLogCategory_RPStreamSession > 90) {
        return v7;
      }
    }
  }

  if (v6) {
    MEMORY[0x1895A429C](v6, v3);
  }
  return v7;
}

- (id)_lowLatencySelfAddressString:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  char v6 = 0;
  __int16 v5 = 0;
  int v4 = 0;
  CUGetInterfaceAddresses();
  return 0LL;
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__RPStreamSession_sendEventID_event_options_completion___block_invoke;
    block[3] = &unk_18A034280;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(dispatchQueue, block);
  }

  else
  {
    RPErrorF();
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    (*((void (**)(id, void *))v13 + 2))(v13, v15);
  }
}

uint64_t __56__RPStreamSession_sendEventID_event_options_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 104) sendEncryptedEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke;
    block[3] = &unk_18A034280;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(dispatchQueue, block);
  }

  else
  {
    RPErrorF();
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v15);
  }
}

uint64_t __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 104) sendEncryptedRequestID:a1[5] request:a1[6] xpcID:0 options:a1[7] responseHandler:a1[8]];
}

- (void)_updateTrafficRegistration
{
  if (self->_peerIP.sa.sa_family)
  {
    -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &self->_peerIP);
  }

  else if (self->_trafficFlags)
  {
    int streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      socklen_t v5 = 28;
      getpeername(streamSocket, &v6, &v5);
      if (v6.sa_family == 30 && v6.sa_data[6] == 254 && (v6.sa_data[7] & 0xC0) == 0x80)
      {
        int v4 = v7;
        if (v7)
        {
          if (v4 == if_nametoindex("awdl0")) {
            -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &v6);
          }
        }
      }
    }
  }

- (void)_updateTrafficRegistrationForIP:(id *)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!self->_trafficSessionID)
  {
    [MEMORY[0x189607AB8] UUID];
    socklen_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    sockaddr v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    trafficSessionID = self->_trafficSessionID;
    self->_trafficSessionID = v6;
  }

  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = &unk_1873E83BF;
    id v17 = self->_trafficSessionID;
    id v14 = a3;
    uint64_t trafficFlags = self->_trafficFlags;
    LogPrintF();
  }

  self->_trafficRegistrationCalled = 1;
  if (!self->_wifiManager)
  {
    char v8 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x18960EDB8]);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.rapport.traffic_registration", v10);
    -[CUWiFiManager setDispatchQueue:](self->_wifiManager, "setDispatchQueue:", v11);

    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke;
    v19[3] = &unk_18A031A30;
    v19[4] = self;
    -[CUWiFiManager setWifiStateChangedHandler:](self->_wifiManager, "setWifiStateChangedHandler:", v19);
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      -[CUWiFiManager setValue:forKey:]( self->_wifiManager,  "setValue:forKey:",  MEMORY[0x189604A88],  @"degradeOnAnyTrafficUnavailable");
    }
    -[CUWiFiManager activateWithCompletion:]( self->_wifiManager,  "activateWithCompletion:",  0LL,  v14,  trafficFlags,  v16,  v17);
  }

  id v12 = objc_alloc_init(MEMORY[0x18960EDC8]);
  v18[0] = a3->var0;
  *(in6_addr *)((char *)v18 + 12) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  [v12 setPeerIP:v18];
  [v12 setSessionID:self->_trafficSessionID];
  [v12 setTrafficFlags:self->_trafficFlags];
  v20[0] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWiFiManager setTrafficPeers:](self->_wifiManager, "setTrafficPeers:", v13);
}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 176);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2;
  block[3] = &unk_18A031A30;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 256);
  int v4 = [*(id *)(v2 + 128) wifiFlags];
  unint64_t v5 = v3 & 0xFFFFFFFFF9FFFFFFLL | (v4 << 19) & 0x2000000 | (v4 << 19) & 0x4000000;
  if (v5 != v3)
  {
    *(void *)(*(void *)(a1 + 32) + 256LL) = v5;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v6)
    {
      id v10 = v6;
      v6[2](v6, v7, v8, v9);
      sockaddr v6 = (void (**)(void, void, void, void))v10;
    }
  }

- (void)_updateTrafficRegistrationForDestination:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  if (StringToSockAddr())
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  else
  {
    self->_peerIP.sa = *(sockaddr *)v5;
    *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)&v5[12];
    -[RPStreamSession _updateTrafficRegistration](self, "_updateTrafficRegistration");
  }
}

- (int)flowControlWriteState
{
  rpCnx = self->_rpCnx;
  if (rpCnx)
  {
    int v3 = -[RPConnection flowControlWriteState](rpCnx, "flowControlWriteState");
    if (v3 == 10) {
      LODWORD(rpCnx) = 1;
    }
    else {
      LODWORD(rpCnx) = 2 * (v3 == 20);
    }
  }

  return (int)rpCnx;
}

- (unint64_t)delegatedProcessUPID
{
  return self->_delegatedProcessUPID;
}

- (void)setDelegatedProcessUPID:(unint64_t)a3
{
  self->_unint64_t delegatedProcessUPID = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (NSUUID)nwClientID
{
  return self->_nwClientID;
}

- (void)setNwClientID:(id)a3
{
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_uint64_t streamFlags = a3;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
}

- (NSData)streamKey
{
  return self->_streamKey;
}

- (void)setStreamKey:(id)a3
{
}

- (int)streamSocket
{
  return self->_streamSocket;
}

- (void)setStreamSocket:(int)a3
{
  self->_int streamSocket = a3;
}

- (int)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(int)a3
{
  self->_uint64_t streamType = a3;
}

- (int)streamQoS
{
  return self->_streamQoS;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSString)trafficSessionID
{
  return self->_trafficSessionID;
}

- (void)setTrafficSessionID:(id)a3
{
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (id)streamAcceptHandler
{
  return self->_streamAcceptHandler;
}

- (void)setStreamAcceptHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end