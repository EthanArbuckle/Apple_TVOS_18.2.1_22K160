@interface AUServiceShim
- (AUServiceShim)initWithCoder:(id)a3;
- (AUServiceShim)initWithDeviceClass:(id)a3 delegate:(id)delegate info:(id *)a5 options:(id)a6;
- (FudPluginDelegate)delegate;
- (NSString)deviceClass;
- (NSString)xpcServiceName;
- (NSXPCConnection)xpcServiceConn;
- (int)currentState;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)closeXPCConnection;
- (void)connectToServer;
- (void)dealloc;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)handleServiceDisconnect;
- (void)issueNotification:(id)a3;
- (void)personalizationRequest:(id)a3;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)progress:(double)a3;
- (void)progress:(double)a3 info:(id)a4;
- (void)queryDeviceList:(id *)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)setCurrentState:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setXpcServiceConn:(id)a3;
- (void)setXpcServiceName:(id)a3;
@end

@implementation AUServiceShim

- (AUServiceShim)initWithDeviceClass:(id)a3 delegate:(id)delegate info:(id *)a5 options:(id)a6
{
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3052000000LL;
  v32 = sub_100003F84;
  v33 = sub_100003F94;
  uint64_t v34 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  v10 = (objc_class *)objc_opt_class(self);
  [delegate log:7, @"Initializing Plugin %@ for DeviceClass %@ with options %@", NSStringFromClass(v10), a3, a6 format];
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___AUServiceShim;
  v11 = -[AUServiceShim init](&v24, "init");
  v12 = v11;
  v13 = @"Init Failure";
  uint64_t v14 = 7LL;
  if (!delegate || !a3 || !v11) {
    goto LABEL_17;
  }
  v11->_deviceClass = (NSString *)a3;
  v11->_delegate = (FudPluginDelegate *)delegate;
  v11->_currentState = 2;
  v15 = (NSString *)objc_msgSend(a6, "objectForKey:", @"AUServiceName", @"Init Failure");
  v12->_xpcServiceName = v15;
  if (!v15)
  {
    v13 = @"Couldn't find XPCService name in options";
LABEL_16:
    delegate = v12->_delegate;
    uint64_t v14 = 3LL;
LABEL_17:
    [delegate log:v14 format:v13];
    goto LABEL_14;
  }

  if (*((_BYTE *)v26 + 24))
  {
    int v16 = -4;
    while (1)
    {
      int v17 = v16;
      -[AUServiceShim connectToServer](v12, "connectToServer");
      xpcServiceConn = v12->_xpcServiceConn;
      if (!xpcServiceConn) {
        break;
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100003FA0;
      v23[3] = &unk_100075198;
      v23[4] = v12;
      v23[5] = a3;
      v23[6] = &v35;
      v23[7] = &v25;
      id v19 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcServiceConn,  "synchronousRemoteObjectProxyWithErrorHandler:",  v23);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10000401C;
      v22[3] = &unk_1000751C0;
      v22[6] = &v35;
      v22[7] = &v25;
      v22[8] = &v29;
      v22[4] = v12;
      v22[5] = a3;
      [v19 deviceClassAttached:a3 options:a6 withReply:v22];
      if (*((_BYTE *)v26 + 24))
      {
        -[AUServiceShim closeXPCConnection](v12, "closeXPCConnection");
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.5);
        if (*((_BYTE *)v26 + 24))
        {
          int v16 = v17 + 1;
          if (v17) {
            continue;
          }
        }
      }

      goto LABEL_11;
    }

    v13 = @"Could not connect to XPCService";
    goto LABEL_16;
  }

- (void)handleServiceDisconnect
{
  uint64_t currentState = self->_currentState;
  switch((int)currentState)
  {
    case 3:
      -[FudPluginDelegate didBootstrap:info:error:](self->_delegate, "didBootstrap:info:error:", 0LL, 0LL, 0LL);
      break;
    case 5:
      -[FudPluginDelegate didFind:info:updateAvailable:needsDownload:error:]( self->_delegate,  "didFind:info:updateAvailable:needsDownload:error:",  0LL,  0LL,  0LL,  0LL,  0LL);
      break;
    case 7:
      -[FudPluginDelegate didDownload:info:error:](self->_delegate, "didDownload:info:error:", 0LL, 0LL, 0LL);
      break;
    case 8:
      -[FudPluginDelegate didPrepare:info:error:](self->_delegate, "didPrepare:info:error:", 0LL, 0LL, 0LL);
      break;
    case 9:
      -[FudPluginDelegate didApply:info:error:](self->_delegate, "didApply:info:error:", 0LL, 0LL, 0LL);
      break;
    case 10:
      -[FudPluginDelegate didFinish:info:error:](self->_delegate, "didFinish:info:error:", 0LL, 0LL, 0LL);
      break;
    default:
      -[FudPluginDelegate log:format:]( self->_delegate,  "log:format:",  3LL,  @"XPC disconnected during unknown state: %d",  currentState);
      break;
  }

- (void)connectToServer
{
  if (!self->_xpcServiceConn)
  {
    v3 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  self->_xpcServiceName);
    self->_xpcServiceConn = v3;
    if (v3)
    {
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___AUDAccessory);
      v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
      -[NSXPCConnection setRemoteObjectInterface:]( self->_xpcServiceConn,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUServiceProtocol));
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_xpcServiceConn, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v6,  "queryDeviceList:",  0LL,  1LL);
      -[NSXPCConnection setExportedInterface:]( self->_xpcServiceConn,  "setExportedInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUDaemonProtocol));
      -[NSXPCConnection setExportedObject:](self->_xpcServiceConn, "setExportedObject:", self);
      v9[0] = 0LL;
      v9[1] = v9;
      v9[2] = 0x3052000000LL;
      v9[3] = sub_100003F84;
      v9[4] = sub_100003F94;
      v9[5] = self;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100004398;
      v8[3] = &unk_1000751E8;
      v8[4] = self;
      v8[5] = v9;
      -[NSXPCConnection setInvalidationHandler:](self->_xpcServiceConn, "setInvalidationHandler:", v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000043F4;
      v7[3] = &unk_1000751E8;
      v7[4] = self;
      v7[5] = v9;
      -[NSXPCConnection setInterruptionHandler:](self->_xpcServiceConn, "setInterruptionHandler:", v7);
      -[NSXPCConnection resume](self->_xpcServiceConn, "resume");
      _Block_object_dispose(v9, 8);
    }

    else
    {
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3LL, @"Failed to connect to XPCService");
    }
  }

- (void)bootstrapWithOptions:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004588;
  v5[3] = &unk_100075210;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend( objc_msgSend( -[NSXPCConnection remoteObjectProxy](xpcServiceConn, "remoteObjectProxy"),  "remoteObjectProxyWithErrorHandler:",  v5),  "bootstrapWithOptions:",  a3);
  if (!*((_BYTE *)v7 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didBootstrap:info:error:](self->_delegate, "didBootstrap:info:error:", 0LL, 0LL, v11[5]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  uint64_t v14 = sub_100003F84;
  uint64_t v15 = sub_100003F94;
  uint64_t v16 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v10 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 5;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004748;
  v6[3] = &unk_100075210;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v6),  "findFirmwareWithOptions:remote:",  a3,  a4);
  if (!*((_BYTE *)v8 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didFind:info:updateAvailable:needsDownload:error:]( self->_delegate,  "didFind:info:updateAvailable:needsDownload:error:",  0LL,  0LL,  0LL,  0LL,  v12[5]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000048F0;
  v5[3] = &unk_100075210;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5),  "downloadFirmwareWithOptions:",  a3);
  if (!*((_BYTE *)v7 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didDownload:info:error:](self->_delegate, "didDownload:info:error:", 0LL, 0LL, v11[5]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004A98;
  v5[3] = &unk_100075210;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5),  "prepareFirmwareWithOptions:",  a3);
  if (!*((_BYTE *)v7 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didPrepare:info:error:](self->_delegate, "didPrepare:info:error:", 0LL, 0LL, v11[5]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)applyFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 9;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004C40;
  v5[3] = &unk_100075210;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5),  "applyFirmwareWithOptions:",  a3);
  if (!*((_BYTE *)v7 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didApply:info:error:](self->_delegate, "didApply:info:error:", 0LL, 0LL, v11[5]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)finishWithOptions:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }

  self->_uint64_t currentState = 10;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004DDC;
  v5[3] = &unk_100075210;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5),  "finishWithOptions:",  a3);
  if (!*((_BYTE *)v7 + 24)) {
LABEL_3:
  }
    -[FudPluginDelegate didFinish:info:error:](self->_delegate, "didFinish:info:error:", 0LL, 0LL, v11[5]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)queryDeviceList:(id *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = sub_100003F84;
  uint64_t v14 = sub_100003F94;
  uint64_t v15 = 0LL;
  xpcServiceConn = self->_xpcServiceConn;
  if (xpcServiceConn)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004F6C;
    v9[3] = &unk_100075238;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100004FC4;
    v8[3] = &unk_100075260;
    v8[4] = &v10;
    objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcServiceConn,  "synchronousRemoteObjectProxyWithErrorHandler:",  v9),  "queryDeviceList:",  v8);
    uint64_t v6 = (id *)(v11 + 5);
    uint64_t v7 = (void *)v11[5];
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v6 = (id *)&v15;
  }

  *a3 = v7;
  if (![*v6 count]) {
    -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
  }
  _Block_object_dispose(&v10, 8);
}

- (void)closeXPCConnection
{
  xpcServiceConn = self->_xpcServiceConn;
  if (xpcServiceConn)
  {
    -[NSXPCConnection invalidate](xpcServiceConn, "invalidate");
    self->_xpcServiceConn = 0LL;
    self->_uint64_t currentState = -1;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AUServiceShim;
  -[AUServiceShim dealloc](&v3, "dealloc");
}

- (void)progress:(double)a3 info:(id)a4
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPluginDelegate *)a3;
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 3)
  {
    uint64_t v8 = a3 & ~-[NSString containsString:]( self->_xpcServiceName,  "containsString:",  @"AppleSTDP2700Bootstrap");
    if ((v8 & 1) == 0) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    -[FudPluginDelegate didBootstrap:info:error:](self->_delegate, "didBootstrap:info:error:", v8, a4, a5);
  }

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  if (self->_currentState == 5)
  {
    BOOL v8 = a6;
    BOOL v9 = a5;
    BOOL v11 = a3;
    if (!a3) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    if (!v9) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    -[FudPluginDelegate didFind:info:updateAvailable:needsDownload:error:]( self->_delegate,  "didFind:info:updateAvailable:needsDownload:error:",  v11,  a4,  v9,  v8,  a7);
  }

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 7)
  {
    BOOL v7 = a3;
    if (!a3) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    -[FudPluginDelegate didDownload:info:error:](self->_delegate, "didDownload:info:error:", v7, a4, a5);
  }

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 8)
  {
    BOOL v7 = a3;
    if (!a3) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    -[FudPluginDelegate didPrepare:info:error:](self->_delegate, "didPrepare:info:error:", v7, a4, a5);
  }

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 9)
  {
    BOOL v7 = a3;
    if (!a3) {
      -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    }
    -[FudPluginDelegate didApply:info:error:](self->_delegate, "didApply:info:error:", v7, a4, a5);
  }

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 10)
  {
    BOOL v7 = a3;
    -[AUServiceShim closeXPCConnection](self, "closeXPCConnection");
    -[FudPluginDelegate didFinish:info:error:](self->_delegate, "didFinish:info:error:", v7, a4, a5);
  }

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  xpcServiceConn = self->_xpcServiceConn;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000053A0;
  v6[3] = &unk_100075238;
  v6[4] = self;
  objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcServiceConn,  "synchronousRemoteObjectProxyWithErrorHandler:",  v6),  "personalizationResponse:response:status:",  a3,  a4,  a5);
}

- (void)personalizationRequest:(id)a3
{
}

- (void)progress:(double)a3
{
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
}

- (void)issueNotification:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "issueNotification:") & 1) != 0) {
    -[FudPluginDelegate issueNotification:](self->_delegate, "issueNotification:", a3);
  }
}

- (AUServiceShim)initWithCoder:(id)a3
{
  return 0LL;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_uint64_t currentState = a3;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  self->_deviceClass = (NSString *)a3;
}

- (FudPluginDelegate)delegate
{
  return self->_delegate;
}

- (NSString)xpcServiceName
{
  return self->_xpcServiceName;
}

- (void)setXpcServiceName:(id)a3
{
  self->_xpcServiceName = (NSString *)a3;
}

- (NSXPCConnection)xpcServiceConn
{
  return self->_xpcServiceConn;
}

- (void)setXpcServiceConn:(id)a3
{
  self->_xpcServiceConn = (NSXPCConnection *)a3;
}

@end