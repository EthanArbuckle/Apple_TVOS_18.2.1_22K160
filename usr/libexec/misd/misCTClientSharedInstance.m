@interface misCTClientSharedInstance
+ (id)sharedInstance;
- (BOOL)isDualSim;
- (BOOL)registerCellularDataStatusNotification:(BOOL)a3 callback:(void *)a4 callbackArg:(void *)a5;
- (__CTServerConnection)ctServerConnection;
- (int)activateTethering:(BOOL)a3;
- (int)getTetheringInterfaceName:(char *)a3;
- (int)getTetheringStatus:(mis_ctinterface_tethering_status *)a3;
- (int)isDataPlanEnabled:(BOOL *)a3;
- (misCTClientSharedInstance)init;
- (void)_setupCTServerConnection;
- (void)_updateDualSimStatus;
- (void)convertConnectionStatus:(id)a3 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a4;
- (void)convertTetheringStatus:(mis_ctinterface_tethering_status *)a3 CTStatus:(id)a4;
- (void)dealloc;
- (void)handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4;
- (void)processCTConnectionStateChangeNotification:(id)a3 connection:(int)a4 connectionStatus:(id)a5 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a6;
- (void)processCTTetheringStatusChangeNotification:(id)a3;
@end

@implementation misCTClientSharedInstance

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EB50;
  block[3] = &unk_100030FD0;
  block[4] = a1;
  if (qword_100035410 != -1) {
    dispatch_once(&qword_100035410, block);
  }
  return (id)qword_100035418;
}

- (misCTClientSharedInstance)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___misCTClientSharedInstance;
  v2 = -[misCTClientSharedInstance init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[misCTClientSharedInstance _setupCTServerConnection](v2, "_setupCTServerConnection");
    v3->_CTAssertion = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    CFRelease(ctServerConnection);
    self->_ctServerConnection = 0LL;
  }

  CTAssertion = self->_CTAssertion;
  if (CTAssertion)
  {
    CFRelease(CTAssertion);
    self->_CTAssertion = 0LL;
  }

  -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", 0LL);
  sub_1000036BC(1u, (uint64_t)"misCTClientSharedInstance dealloc", v5, v6, v7, v8, v9, v10, (uint64_t)v11.receiver);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___misCTClientSharedInstance;
  -[misCTClientSharedInstance dealloc](&v11, "dealloc");
}

- (void)_setupCTServerConnection
{
  if (!self->_ctServerConnection)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10001ED9C;
    v21[3] = &unk_100030FF8;
    v21[4] = self;
    v3 = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue( kCFAllocatorDefault,  @"com.apple.misd",  qword_100035470,  v21);
    self->_ctServerConnection = v3;
    if (v3)
    {
      sub_1000036BC(1u, (uint64_t)"created CT server connection", v4, v5, v6, v7, v8, v9, v20);
      uint64_t v10 = objc_alloc(&OBJC_CLASS___CoreTelephonyClient);
      self->_ctClient = -[CoreTelephonyClient initWithQueue:](v10, "initWithQueue:", qword_100035470);
      self->_ctClientDelegates = objc_alloc_init(&OBJC_CLASS___misCTClientDelegates);
      uint64_t v11 = _CTServerConnectionRegisterForNotification(self->_ctServerConnection, kCTConnectionInvalidatedNotification);
      if (HIDWORD(v11))
      {
        uint64_t v20 = v11;
        v12 = "error registering kCTConnectionInvalidatedNotification (%d, %d)";
      }

      else
      {
        uint64_t v13 = _CTServerConnectionRegisterForNotification(self->_ctServerConnection, kCTDaemonReadyNotification);
        if (!HIDWORD(v13)) {
          return;
        }
        uint64_t v20 = v13;
        v12 = "error registering kCTDaemonReadyNotification (%d, %d)";
      }

      LOBYTE(v3) = 0;
    }

    else
    {
      v12 = "Unable to create CT server connection";
    }

    sub_1000036BC(v3, (uint64_t)v12, v4, v5, v6, v7, v8, v9, v20);
    if (self->_ctServerConnection)
    {
      sub_1000036BC( 0,  (uint64_t)"%s: closing CT server connection due to init errors",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[misCTClientSharedInstance _setupCTServerConnection]");
      CFRelease(self->_ctServerConnection);
      self->_ctServerConnection = 0LL;
    }
  }

- (__CTServerConnection)ctServerConnection
{
  result = self->_ctServerConnection;
  if (!result)
  {
    -[misCTClientSharedInstance _setupCTServerConnection](self, "_setupCTServerConnection");
    return self->_ctServerConnection;
  }

  return result;
}

- (BOOL)registerCellularDataStatusNotification:(BOOL)a3 callback:(void *)a4 callbackArg:(void *)a5
{
  BOOL v10 = a3;
  v12 = "NO";
  if (a3) {
    v12 = "YES";
  }
  sub_1000036BC( 1u,  (uint64_t)"registerCellularDataStatusNotification: %s",  a3,  (uint64_t)a4,  (uint64_t)a5,  v5,  v6,  v7,  (uint64_t)v12);
  if (!v10)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", 0LL);
    self->_eventCallback = 0LL;
    self->_eventCallbackArg = 0LL;
    return 1;
  }

  if (self->_ctServerConnection)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self->_ctClientDelegates);
    self->_eventCallback = a4;
    self->_eventCallbackArg = a5;
    return 1;
  }

  sub_1000036BC( 0,  (uint64_t)"registerCellularDataStatusNotification enable failed due to invalid CT server connection.",  v13,  v14,  v15,  v16,  v17,  v18,  v20);
  return 0;
}

- (void)_updateDualSimStatus
{
  uint64_t v19 = 0LL;
  self->_isDualSim = 0;
  ctClient = self->_ctClient;
  if (ctClient)
  {
    id v10 = -[CoreTelephonyClient getSubscriptionInfoWithError:](ctClient, "getSubscriptionInfoWithError:", &v19);
    if (v19)
    {
      uint64_t v17 = "%s: failed to query cellular subscription info";
    }

    else
    {
      uint64_t v18 = v10;
      if (v10 && [v10 subscriptionsInUse])
      {
        uint64_t v17 = "%s: updated dual sim status to %s";
      }

      else
      {
        uint64_t v17 = "%s: failed to get the subscription contexts";
      }
    }

    sub_1000036BC( 0,  (uint64_t)v17,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[misCTClientSharedInstance _updateDualSimStatus]");
  }

  else
  {
    sub_1000036BC( 0,  (uint64_t)"%s: CT client not initialized",  v2,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[misCTClientSharedInstance _updateDualSimStatus]");
  }

- (BOOL)isDualSim
{
  return self->_isDualSim;
}

- (int)activateTethering:(BOOL)a3
{
  if (!self->_ctClient)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: CT client not initialized",  a3,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    return -1;
  }

  BOOL v8 = a3;
  if (!-[misCTClientSharedInstance ctServerConnection](self, "ctServerConnection")) {
    sub_100023B9C();
  }
  if (v8)
  {
    sub_1000036BC( 1u,  (uint64_t)"%s: creating tethering assertion",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    ctClient = self->_ctClient;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001F0CC;
    v24[3] = &unk_100031020;
    v24[4] = self;
    self->_CTAssertion = -[CoreTelephonyClient createAssertionForConnectionType:allocator:error:onReAssertError:]( ctClient,  "createAssertionForConnectionType:allocator:error:onReAssertError:",  4LL,  0LL,  &v25,  v24);
    int result = (int)v25;
    if (v25)
    {
      objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
      sub_1000036BC( 0,  (uint64_t)"%s: failed creating CT tethering context assertion with error '%s'",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
      -[misCTClientSharedInstance activateTethering:](self, "activateTethering:", 0LL);
      return -1;
    }
  }

  else if (self->_CTAssertion)
  {
    sub_1000036BC( 1u,  (uint64_t)"%s: releasing tethering assertion",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[misCTClientSharedInstance activateTethering:]");
    CFRelease(self->_CTAssertion);
    int result = 0;
    self->_CTAssertion = 0LL;
  }

  else
  {
    return 0;
  }

  return result;
}

- (void)convertConnectionStatus:(id)a3 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a4
{
  uint64_t v6 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 20LL);
  unsigned int v7 = [a3 state];
  if (v7 >= 4)
  {
    [a3 state];
    sub_1000036BC( 0,  (uint64_t)"%s: unknown connection state %d, ignoring",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"-[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:]");
  }

  else
  {
    int v8 = v7 + 1;
    -[NSMutableString setString:](v6, "setString:", off_100031040[v7]);
    a4->var0 = v8;
    id v9 = -[NSMutableString UTF8String](v6, "UTF8String");
    objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String");
    objc_msgSend(objc_msgSend(a3, "pdp"), "intValue");
    sub_1000036BC( 1u,  (uint64_t)"convertConnectionStatus: state: %s, ifname: %s, pdp_idx: %d",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v9);
    if ([a3 interfaceName])
    {
      strncpy(a4->var2, (const char *)objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String"), 0xFuLL);
      a4->var1 = objc_msgSend(objc_msgSend(a3, "pdp"), "intValue");
    }

    else
    {
      a4->var2[0] = 0;
      a4->var1 = -1;
    }
  }

- (void)convertTetheringStatus:(mis_ctinterface_tethering_status *)a3 CTStatus:(id)a4
{
  if (![a4 carrierEnabled]
    || !objc_msgSend(objc_msgSend(a4, "carrierEnabled"), "intValue"))
  {
    a3->var0 = 0;
LABEL_9:
    a3->var1 = 0;
    goto LABEL_10;
  }

  a3->var0 = 1;
  if (![a4 userAuthenticated]
    || !objc_msgSend(objc_msgSend(a4, "userAuthenticated"), "intValue"))
  {
    goto LABEL_9;
  }

  a3->var1 = 1;
  if ([a4 connectionAvailabilityStatus]
    && (objc_msgSend(objc_msgSend(a4, "connectionAvailabilityStatus"), "available") & 1) != 0)
  {
    BOOL v7 = 1;
    goto LABEL_11;
  }

- (int)getTetheringStatus:(mis_ctinterface_tethering_status *)a3
{
  id v23 = 0LL;
  ctClient = self->_ctClient;
  if (!ctClient)
  {
    uint64_t v22 = "-[misCTClientSharedInstance getTetheringStatus:]";
    uint64_t v13 = "%s: CT client not initialized";
    goto LABEL_6;
  }

  id v11 = -[CoreTelephonyClient getTetheringStatusSync:connectionType:]( ctClient,  "getTetheringStatusSync:connectionType:",  &v23,  4LL);
  if (v23)
  {
    uint64_t v12 = (const char *)objc_msgSend(objc_msgSend(v23, "domain"), "UTF8String");
    [v23 code];
    objc_msgSend(objc_msgSend(v23, "description"), "UTF8String");
    uint64_t v22 = v12;
    uint64_t v13 = "getTetheringStatusSync() failed, domain: [%s] code: [%ld] desc: [%s]";
LABEL_4:
    LOBYTE(ctClient) = 0;
LABEL_6:
    sub_1000036BC(ctClient, (uint64_t)v13, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)v22);
    return -1;
  }

  if (!v11)
  {
    uint64_t v22 = "-[misCTClientSharedInstance getTetheringStatus:]";
    uint64_t v13 = "%s tethering status is empty";
    goto LABEL_4;
  }

  -[misCTClientSharedInstance convertTetheringStatus:CTStatus:](self, "convertTetheringStatus:CTStatus:", a3, v11);
  if (a3->var0) {
    uint64_t v15 = "true";
  }
  else {
    uint64_t v15 = "false";
  }
  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connectionStatus"), "interfaceName"), "UTF8String");
  sub_1000036BC( 1u,  (uint64_t)"getTetheringStatusSync: carrier_enabled: %s, user_auth: %s, conn_avail: %s, max_hosts: %d, ifname: %s",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)v15);
  return 0;
}

- (int)getTetheringInterfaceName:(char *)a3
{
  unsigned int v4 = -[misCTClientSharedInstance getTetheringStatus:](self, "getTetheringStatus:", v6);
  int result = -1;
  if (!v4)
  {
    if (v7[0])
    {
      strncpy(a3, v7, 0xFuLL);
      return 0;
    }
  }

  return result;
}

- (int)isDataPlanEnabled:(BOOL *)a3
{
  *a3 = 0;
  if (!((unint64_t)_CTServerConnectionGetCellularDataIsEnabled( -[misCTClientSharedInstance ctServerConnection](self, "ctServerConnection"),  a3) >> 32)) {
    return 0;
  }
  sub_1000036BC( 0,  (uint64_t)"%s: error while querying data plan status (domain %d, error %d)",  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)"-[misCTClientSharedInstance isDataPlanEnabled:]");
  return 12;
}

- (void)processCTTetheringStatusChangeNotification:(id)a3
{
  if (a3)
  {
    -[misCTClientSharedInstance convertTetheringStatus:CTStatus:](self, "convertTetheringStatus:CTStatus:", v10, a3);
    eventCallback = (void (*)(uint64_t, _BYTE *, void *))self->_eventCallback;
    if (eventCallback) {
      eventCallback(1LL, v10, self->_eventCallbackArg);
    }
  }

  else
  {
    sub_1000036BC( 0,  (uint64_t)"processCTTetheringStatusChangeNotification: tethering status is empty",  0LL,  v3,  v4,  v5,  v6,  v7,  v11);
  }

- (void)processCTConnectionStateChangeNotification:(id)a3 connection:(int)a4 connectionStatus:(id)a5 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a6
{
  if (a4 == 4)
  {
    -[misCTClientSharedInstance convertConnectionStatus:ctInterfaceConnStatus:]( self,  "convertConnectionStatus:ctInterfaceConnStatus:",  a5,  a6);
    eventCallback = (void (*)(uint64_t, mis_ctinterface_ct_conn_status *, void *))self->_eventCallback;
    if (eventCallback) {
      eventCallback(2LL, a6, self->_eventCallbackArg);
    }
  }

  else
  {
    sub_1000036BC( 1u,  (uint64_t)"processCTConnectionStateChangeNotification: ignoring unknown connection type %d",  (uint64_t)a3,  *(uint64_t *)&a4,  (uint64_t)a5,  (uint64_t)a6,  v6,  v7,  *(uint64_t *)&a4);
  }

- (void)handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4
{
  if (!self->_eventCallback)
  {
    sub_1000036BC( 0,  (uint64_t)"%s: ignoring CT notification as no service is in progress",  (uint64_t)a3,  (uint64_t)a4,  v4,  v5,  v6,  v7,  (uint64_t)"-[misCTClientSharedInstance handleCTNotification:notificationInfo:]");
    return;
  }

  if (CFEqual(a3, kCTConnectionInvalidatedNotification))
  {
    uint64_t v11 = 3LL;
LABEL_7:
    ((void (*)(uint64_t, __CFDictionary *, void *))self->_eventCallback)(v11, a4, self->_eventCallbackArg);
    return;
  }

  if (CFEqual(a3, kCTDaemonReadyNotification))
  {
    uint64_t v11 = 4LL;
    goto LABEL_7;
  }

  CFStringGetCStringPtr(a3, 0x8000100u);
  sub_1000036BC( 0,  (uint64_t)"%s: received unknown notification %s",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[misCTClientSharedInstance handleCTNotification:notificationInfo:]");
}

@end