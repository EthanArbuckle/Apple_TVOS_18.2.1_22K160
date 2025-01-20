@interface Transport
- (IAPXPCConnection)xpc_connection;
- (OS_dispatch_queue)inQ;
- (OS_dispatch_queue)initQ;
- (OS_dispatch_queue)mainLinkQ;
- (OS_dispatch_queue)runLoopEventQ;
- (Transport)initWithXPCConnection:(id)a3;
- (iAP2LinkRunLoop_st)iAP2LinkRL;
- (iAP2Link_st)iAP2Link;
- (iAP2SessionHandler)sessionHandler;
- (unint64_t)portID;
- (unint64_t)portNumber;
- (void)_sendData:(id)a3;
- (void)detach;
- (void)receiveIAP2Data:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setInQ:(id)a3;
- (void)setInitQ:(id)a3;
- (void)setMainLinkQ:(id)a3;
- (void)setPortID:(unint64_t)a3;
- (void)setPortNumber:(unint64_t)a3;
- (void)setRunLoopEventQ:(id)a3;
- (void)setSessionHandler:(id)a3;
- (void)setXpc_connection:(id)a3;
@end

@implementation Transport

- (Transport)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___Transport;
  v6 = -[Transport init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpc_connection, a3);
    *(_WORD *)&v7->_shuttingDown = 256;
    nullsub_1();
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iapmd.linkInQ", 0LL);
    inQ = v7->_inQ;
    v7->_inQ = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iapmd.linkInitQ", 0LL);
    initQ = v7->_initQ;
    v7->_initQ = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iapmd.linkRLEventQ", 0LL);
    runLoopEventQ = v7->_runLoopEventQ;
    v7->_runLoopEventQ = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.iapmd.mainLinkQ", 0LL);
    mainLinkQ = v7->_mainLinkQ;
    v7->_mainLinkQ = (OS_dispatch_queue *)v14;

    v7->_iAP2LinkRL = -[Transport iAP2LinkRL](v7, "iAP2LinkRL");
    v16 = -[iAP2SessionHandler initWithTransport:]( objc_alloc(&OBJC_CLASS___iAP2SessionHandler),  "initWithTransport:",  v7);
    sessionHandler = v7->_sessionHandler;
    v7->_sessionHandler = v16;
  }

  return v7;
}

- (void)_sendData:(id)a3
{
  id v4 = a3;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  int v10 = 0;
  NSLog(@"### <-- Sending Data: %@", v4);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "portID", -[Transport portID](self, "portID"));
  id v6 = v4;
  xpc_dictionary_set_data(v5, "data", [v6 bytes], (size_t)objc_msgSend(v6, "length"));
  xpc_dictionary_set_string(v5, "requestType", "transmitData");
  xpc_dictionary_set_BOOL(v5, "waitSendDone", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Transport xpc_connection](self, "xpc_connection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004428;
  v8[3] = &unk_10001C588;
  v8[4] = v9;
  [v7 sendMessage:v5 withReply:v8];

  _Block_object_dispose(v9, 8);
}

- (void)sendMessage:(id)a3
{
  id v7 = a3;
  id v4 = malloc([v7 getRawMsgLength]);
  id v5 = [v7 generateRawMsgBuffer:v4];
  uint64_t v6 = sub_10000ADC8((uint64_t)-[Transport iAP2Link](self, "iAP2Link"), 0);
  if (!(_DWORD)v5
    || (sub_100009CA4( (uint64_t)-[Transport iAP2Link](self, "iAP2Link"),  (uint64_t)v4,  (uint64_t)v5,  v6,  0LL,  0LL,  0LL,  0LL) & 1) == 0)
  {
    NSLog(@"### Link: Failed to send message: %@", v7);
  }

  free(v4);
}

- (void)receiveIAP2Data:(id)a3
{
  id v4 = a3;
  NSLog(@"### --> receiveIAP2Data: %@", v4);
  if (self->_detached)
  {
    *(_WORD *)&self->_shuttingDown = 0;
    id v5 = -[Transport iAP2LinkRL](self, "iAP2LinkRL");
    sub_100009930((uint64_t)v5->var3, v6, v7, v8, v9, v10, v11, v12);
  }

  if (v4 && [v4 length])
  {
    inQ = (dispatch_queue_s *)self->_inQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000046C0;
    block[3] = &unk_10001C5D8;
    id v15 = v4;
    v16 = self;
    dispatch_async(inQ, block);
  }

  else
  {
    NSLog( @"%s:%d NULL linkRL(%hhx) or payload(%hhx) or no payload!\n",  "/Library/Caches/com.apple.xbs/Sources/iapmd/iapmd/Transport.m",  187LL,  self->_iAP2LinkRL,  v4);
  }
}

- (void)detach
{
  *(_WORD *)&self->_shuttingDown = 257;
}

- (iAP2Link_st)iAP2Link
{
  return (iAP2Link_st *)*((void *)-[Transport iAP2LinkRL](self, "iAP2LinkRL") + 3);
}

- (iAP2LinkRunLoop_st)iAP2LinkRL
{
  result = self->_iAP2LinkRL;
  if (!result)
  {
    initQ = (dispatch_queue_s *)self->_initQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004918;
    block[3] = &unk_10001C600;
    void block[4] = self;
    dispatch_sync(initQ, block);
    return self->_iAP2LinkRL;
  }

  return result;
}

- (IAPXPCConnection)xpc_connection
{
  return (IAPXPCConnection *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setXpc_connection:(id)a3
{
}

- (unint64_t)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unint64_t)a3
{
  self->_portNumber = a3;
}

- (unint64_t)portID
{
  return self->_portID;
}

- (void)setPortID:(unint64_t)a3
{
  self->_portID = a3;
}

- (OS_dispatch_queue)runLoopEventQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setRunLoopEventQ:(id)a3
{
}

- (OS_dispatch_queue)mainLinkQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setMainLinkQ:(id)a3
{
}

- (OS_dispatch_queue)inQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setInQ:(id)a3
{
}

- (OS_dispatch_queue)initQ
{
  Property = (OS_dispatch_queue *)objc_getProperty(self, a2, 120LL, 1);

  return Property;
}

- (void)setInitQ:(id)a3
{
}

- (iAP2SessionHandler)sessionHandler
{
  return (iAP2SessionHandler *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSessionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end