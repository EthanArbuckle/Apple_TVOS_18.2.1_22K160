@interface IAPEAClient
+ (unsigned)clientIDForCameraClient;
+ (unsigned)clientIDForLocationClient;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)cameraSupportedByClient;
- (BOOL)canSendConnectionEventForAccessory:(id)a3;
- (BOOL)clientRequiresAccReset;
- (BOOL)locationSupportedByClient;
- (BOOL)supportsAccessibility;
- (IAPEAClient)initWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 xpcConnection:(id)a5 eaProtocols:(id)a6 andBundleId:(id)a7;
- (NSString)bundleId;
- (OS_xpc_object)xpcConnection;
- (int)_getProcessId;
- (int)processID;
- (unsigned)applicationState;
- (unsigned)capabilities;
- (unsigned)clientID;
- (void)_setJetsamPrioritySpecialCasing:(BOOL)a3;
- (void)dealloc;
- (void)decreaseSessionRefCount;
- (void)increaseSessionRefCount;
- (void)setApplicationState:(unsigned int)a3;
- (void)setCameraSupportedByClient:(BOOL)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setClientRequiresAccReset:(BOOL)a3;
- (void)setLocationSupportedByClient:(BOOL)a3;
- (void)takeProcessAssertion:(id)a3;
@end

@implementation IAPEAClient

- (IAPEAClient)initWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 xpcConnection:(id)a5 eaProtocols:(id)a6 andBundleId:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IAPEAClient;
  result = -[IAPEAClient init](&v26, "init");
  v13 = result;
  if (!result) {
    return v13;
  }
  if ((((_BYTE)result + 120) & 3) != 0
    || (result->_iapSessionRefCount = 0, ((unint64_t)&result->_capabilities & 3) != 0)
    || (result->_capabilities = v11, ((unint64_t)result->_auditToken.val & 3) != 0))
  {
LABEL_38:
    __break(0x5516u);
    goto LABEL_39;
  }

  __int128 v14 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)result->_auditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&result->_auditToken.val[4] = v14;
  if (a5)
  {
    result = (IAPEAClient *)xpc_retain(a5);
    if ((((int)v13 + 144) & 7LL) == 0)
    {
      v13->_xpcConnection = (OS_xpc_object *)result;
      result = (IAPEAClient *)[a7 copy];
      if ((((_BYTE)v13 + 56) & 7) == 0)
      {
        v13->_bundleId = (NSString *)&result->super.isa;
        if ((((_BYTE)v13 + 20) & 3) == 0)
        {
          v13->_processId = -1;
          result = (IAPEAClient *)dispatch_queue_create("IAPEAClient Process Assertion Queue", 0LL);
          if ((((_BYTE)v13 + 80) & 7) == 0)
          {
            v13->_processAssertionQ = (OS_dispatch_queue *)result;
            if ((((_BYTE)v13 + 88) & 7) == 0)
            {
              v13->_processAssertion = 0LL;
              if ((((_BYTE)v13 + 96) & 7) == 0)
              {
                v13->_bksProcessAssertion = 0LL;
                if ((((int)v13 + 104) & 7LL) == 0)
                {
                  v13->_processAssertionStartTime = 0LL;
                  *(_WORD *)&v13->_clientRequiresAccReset = 0;
                  result = (IAPEAClient *)[a6 copy];
                  if ((((_BYTE)v13 + 72) & 7) == 0)
                  {
                    v13->_clientEAProtocols = (NSArray *)result;
                    __int128 v15 = *(_OWORD *)&a4->var0[4];
                    __int128 v24 = *(_OWORD *)a4->var0;
                    __int128 v25 = v15;
                    v13->_entitlementForAllAccessories = sub_1000A33E4( @"com.apple.private.externalaccessory.showallaccessories",  &v24);
                    sub_1000CEA98( 3u,  @"INIT - %s:%s - %d capability=0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m",  "-[IAPEAClient initWithCapabilities:auditToken:xpcConnection:eaProtocols:andBundleId:]",  104LL,  v11);
                    if ((v11 & 0x10) != 0) {
                      v16 = "YES";
                    }
                    else {
                      v16 = "NO";
                    }
                    sub_1000CEA98(3u, @"%@ supports EA while suspended = %s", a7, v16);
                    if ((v11 & 0x20) != 0) {
                      v17 = "YES";
                    }
                    else {
                      v17 = "NO";
                    }
                    sub_1000CEA98(3u, @"%@ supports EA while backgrounded = %s", a7, v17);
                    if ((v11 & 0x8000) != 0) {
                      v18 = "YES";
                    }
                    else {
                      v18 = "NO";
                    }
                    sub_1000CEA98(3u, @"%@ supports Application state = %s", a7, v18);
                    sub_1000CEA98( 3u,  @"_entitlementForAllAccessories = %d",  v13->_entitlementForAllAccessories);
                    result = objc_alloc_init(&OBJC_CLASS___IAPApplicationStateMonitor);
                    if ((((int)v13 + 128) & 7LL) == 0)
                    {
                      v13->_appStateMonitor = (IAPApplicationStateMonitor *)result;
                      id v19 = -[IAPEAClient applicationInfoForBundleIDSync:]( result,  "applicationInfoForBundleIDSync:",  v13->_bundleId);
                      result = (IAPEAClient *)objc_msgSend( objc_msgSend(v19, "objectForKey:", BKSApplicationStateKey),  "unsignedIntegerValue");
                      if ((((int)v13 + 136) & 3LL) == 0)
                      {
                        v13->_applicationState = result;
                        -[IAPEAClient _getProcessId](v13, "_getProcessId");
                        result = (IAPEAClient *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v13->_processAssertionQ);
                        p_processAssertionTimer = (IAPEAClient **)&v13->_processAssertionTimer;
                        if (((unint64_t)&v13->_processAssertionTimer & 7) == 0)
                        {
                          *p_processAssertionTimer = result;
                          if (!result) {
                            goto LABEL_39;
                          }
                          handler[0] = _NSConcreteStackBlock;
                          handler[1] = 3221225472LL;
                          handler[2] = sub_1000A34E4;
                          handler[3] = &unk_100101C70;
                          handler[4] = v13;
                          dispatch_source_set_event_handler((dispatch_source_t)result, handler);
                          result = (IAPEAClient *)v13->_processAssertionTimer;
                          if (!result) {
                            goto LABEL_39;
                          }
                          dispatch_source_set_timer( (dispatch_source_t)result,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
                          result = *p_processAssertionTimer;
                          if (!*p_processAssertionTimer) {
                            goto LABEL_39;
                          }
                          dispatch_resume((dispatch_object_t)result);
                          if (*p_processAssertionTimer)
                          {
                            BOOL v22 = 0;
                            if ((v13->_capabilities & 2) != 0)
                            {
                              __int128 v21 = *(_OWORD *)&a4->var0[4];
                              __int128 v24 = *(_OWORD *)a4->var0;
                              __int128 v25 = v21;
                              if (sub_1000A33E4(@"com.apple.iapd.accessibility", &v24)) {
                                BOOL v22 = 1;
                              }
                            }

                            v13->_supportsAccessibility = v22;
                            return v13;
                          }

                          __break(0x5518u);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_38;
  }

- (void)dealloc
{
  if (self->_iapSessionRefCount) {
    -[IAPEAClient _setJetsamPrioritySpecialCasing:](self, "_setJetsamPrioritySpecialCasing:", 0LL);
  }
  if ((((_BYTE)self + 8) & 3) != 0) {
    goto LABEL_22;
  }
  sub_1000CEA98( 3u,  @"DEALLOC - %s:%s - %d clientID=%d",  "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m",  "-[IAPEAClient dealloc]",  148LL,  self->_clientID);
  p_processAssertionTimer = &self->_processAssertionTimer;
  if (*p_processAssertionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)*p_processAssertionTimer);
    if (!*p_processAssertionTimer) {
      goto LABEL_23;
    }
    dispatch_release((dispatch_object_t)*p_processAssertionTimer);
    *p_processAssertionTimer = 0LL;
  }

  p_processAssertionQ = (dispatch_queue_t *)&self->_processAssertionQ;
  if (((unint64_t)&self->_processAssertionQ & 7) != 0)
  {
LABEL_22:
    __break(0x5516u);
    goto LABEL_23;
  }

  v5 = *p_processAssertionQ;
  if (*p_processAssertionQ)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A3780;
    block[3] = &unk_100101C70;
    block[4] = self;
    dispatch_sync(v5, block);
    self->_processAssertionStartTime = 0LL;
    if (!*p_processAssertionQ) {
      goto LABEL_23;
    }
    dispatch_sync(*p_processAssertionQ, &stru_100106730);
    if (!*p_processAssertionQ) {
      goto LABEL_23;
    }
    dispatch_release(*p_processAssertionQ);
    p_xpcConnection = &self->_xpcConnection;
    if (*p_xpcConnection)
    {
      xpc_release(*p_xpcConnection);
      if (-[IAPEAClient locationSupportedByClient](self, "locationSupportedByClient")) {
        dword_10011C0D8 = 0;
      }
      if ((((_BYTE)self + 0x80) & 7) == 0)
      {

        if ((((_BYTE)self + 56) & 7) == 0)
        {

          if ((((_BYTE)self + 72) & 7) == 0)
          {

            v7.receiver = self;
            v7.super_class = (Class)&OBJC_CLASS___IAPEAClient;
            -[IAPEAClient dealloc](&v7, "dealloc");
            return;
          }
        }
      }

      goto LABEL_22;
    }
  }

+ (unsigned)clientIDForLocationClient
{
  return dword_10011C0D8;
}

+ (unsigned)clientIDForCameraClient
{
  return dword_10011C0DC;
}

- (void)takeProcessAssertion:(id)a3
{
  if ((self->_capabilities & 0x10) == 0) {
    return;
  }
  if (self->_processAssertion)
  {
    time_t v5 = time(0LL);
    if (((unint64_t)&self->_processAssertionStartTime & 7) != 0)
    {
LABEL_12:
      __break(0x5516u);
      goto LABEL_13;
    }

    int64_t processAssertionStartTime = self->_processAssertionStartTime;
    BOOL v7 = __OFSUB__(v5, processAssertionStartTime);
    uint64_t v8 = v5 - processAssertionStartTime;
    if (v7)
    {
LABEL_13:
      __break(0x5515u);
      goto LABEL_14;
    }

    if (v8 < 3) {
      return;
    }
  }

  p_processAssertionQ = &self->_processAssertionQ;
  v10 = (dispatch_queue_s *)*p_processAssertionQ;
  if (!*p_processAssertionQ)
  {
LABEL_14:
    __break(0x5510u);
    return;
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A38BC;
  v11[3] = &unk_100104538;
  v11[4] = self;
  v11[5] = a3;
  dispatch_sync(v10, v11);
}

- (BOOL)canSendConnectionEventForAccessory:(id)a3
{
  unsigned __int8 v5 = -[IAPEAClient capabilities](self, "capabilities");
  unsigned __int8 v6 = -[IAPEAClient capabilities](self, "capabilities");
  unsigned __int16 v7 = (unsigned __int16)-[IAPEAClient capabilities](self, "capabilities");
  unsigned int v8 = -[IAPEAClient applicationState](self, "applicationState");
  unsigned int v9 = -[IAPEAClient applicationState](self, "applicationState");
  id v10 = [a3 objectForKey:IAPAppAccessoryProtocolsKey];
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v11 = v10;
  id v10 = -[NSArray count](self->_clientEAProtocols, "count");
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000A3D2C;
    v23[3] = &unk_100106780;
    v23[4] = self;
    v23[5] = &v24;
    LOBYTE(v10) = [v11 enumerateKeysAndObjectsUsingBlock:v23];
    if (!*((_BYTE *)v25 + 24))
    {
      if (((unint64_t)&self->_bundleId & 7) != 0)
      {
LABEL_27:
        __break(0x5516u);
        return (char)v10;
      }

      sub_1000CEA98(3u, @"No protocols found for client %@", self->_bundleId);
    }
  }

  uint64_t v12 = *((unsigned __int8 *)v25 + 24);
  if (*((_BYTE *)v25 + 24)) {
    goto LABEL_11;
  }
  if (self->_entitlementForAllAccessories > 1u)
  {
LABEL_26:
    __break(0x550Au);
    goto LABEL_27;
  }

  if (!self->_entitlementForAllAccessories)
  {
    LOBYTE(v15) = 0;
    goto LABEL_24;
  }

- (void)increaseSessionRefCount
{
  p_int iapSessionRefCount = &self->_iapSessionRefCount;
  if (((unint64_t)&self->_iapSessionRefCount & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    int iapSessionRefCount = *p_iapSessionRefCount;
    if (!*p_iapSessionRefCount)
    {
      -[IAPEAClient _setJetsamPrioritySpecialCasing:](self, "_setJetsamPrioritySpecialCasing:", 1LL);
      int iapSessionRefCount = self->_iapSessionRefCount;
    }

    BOOL v5 = __OFADD__(iapSessionRefCount, 1);
    int v6 = iapSessionRefCount + 1;
    if (!v5)
    {
      int *p_iapSessionRefCount = v6;
      return;
    }
  }

  __break(0x5500u);
}

- (void)decreaseSessionRefCount
{
  p_int iapSessionRefCount = &self->_iapSessionRefCount;
  int iapSessionRefCount = self->_iapSessionRefCount;
  BOOL v4 = __OFSUB__(iapSessionRefCount, 1);
  int v5 = iapSessionRefCount - 1;
  if (v4)
  {
    __break(0x5515u);
    goto LABEL_9;
  }

  int *p_iapSessionRefCount = v5;
  if ((p_iapSessionRefCount & 3) != 0)
  {
LABEL_9:
    __break(0x5516u);
    return;
  }

  if (v5)
  {
    if ((v5 & 0x80000000) == 0) {
      return;
    }
LABEL_7:
    NSLog( @"ERROR - %s:%s - %d session ref count is < 0 for pid=%d, please file a bug",  "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m",  "-[IAPEAClient decreaseSessionRefCount]",  304LL,  -[IAPEAClient _getProcessId](self, "_getProcessId"));
    return;
  }

  -[IAPEAClient _setJetsamPrioritySpecialCasing:](self, "_setJetsamPrioritySpecialCasing:", 0LL);
  if (self->_iapSessionRefCount < 0) {
    goto LABEL_7;
  }
}

- (void)setLocationSupportedByClient:(BOOL)a3
{
  if (!a3)
  {
    unsigned int clientID = 0;
    goto LABEL_7;
  }

  if (dword_10011C0D8) {
    NSLog( @"ERROR - %s:%s - %d there is already a client (0x%x) supporting location",  a2,  "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m",  "-[IAPEAClient setLocationSupportedByClient:]",  314LL,  dword_10011C0D8);
  }
  if (((unint64_t)&self->_clientID & 3) == 0)
  {
    unsigned int clientID = self->_clientID;
LABEL_7:
    dword_10011C0D8 = clientID;
    return;
  }

  __break(0x5516u);
}

- (void)setClientRequiresAccReset:(BOOL)a3
{
  self->_clientRequiresAccReset = a3;
}

- (BOOL)locationSupportedByClient
{
  if (((unint64_t)&self->_clientID & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    unsigned int clientID = self->_clientID;
    if (clientID) {
      BOOL v3 = dword_10011C0D8 == clientID;
    }
    else {
      BOOL v3 = 0;
    }
    LOBYTE(self) = v3;
  }

  return (char)self;
}

- (void)setCameraSupportedByClient:(BOOL)a3
{
  if (!a3)
  {
    unsigned int clientID = 0;
    goto LABEL_7;
  }

  if (dword_10011C0DC) {
    NSLog( @"ERROR - %s:%s - %d there is already a client (0x%x) supporting camera",  a2,  "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m",  "-[IAPEAClient setCameraSupportedByClient:]",  336LL,  dword_10011C0DC);
  }
  if (((unint64_t)&self->_clientID & 3) == 0)
  {
    unsigned int clientID = self->_clientID;
LABEL_7:
    dword_10011C0DC = clientID;
    return;
  }

  __break(0x5516u);
}

- (BOOL)cameraSupportedByClient
{
  if (((unint64_t)&self->_clientID & 3) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    unsigned int clientID = self->_clientID;
    if (clientID) {
      BOOL v3 = dword_10011C0DC == clientID;
    }
    else {
      BOOL v3 = 0;
    }
    LOBYTE(self) = v3;
  }

  return (char)self;
}

- (int)_getProcessId
{
  p_processId = &self->_processId;
  BOOL v3 = self;
  LODWORD(self) = *p_processId;
  if (*p_processId != -1) {
    return (int)self;
  }
  v3->_processId = 0;
  self = -[IAPEAClient xpcConnection](v3, "xpcConnection");
  if (!self) {
    goto LABEL_13;
  }
  uint64_t pid = xpc_connection_get_pid((xpc_connection_t)self);
  if ((pid + 1) > 1)
  {
    int v6 = pid;
    NSLog(@"got valid pid from xpc connection, setting _processID to xpcConnectionPid %d", pid);
    int *p_processId = v6;
    LODWORD(self) = v6;
    return (int)self;
  }

  NSLog(@"invalid pid, falling back to bundleID");
  if (!v3->_bundleId)
  {
    LODWORD(self) = *p_processId;
    return (int)self;
  }

  if (((unint64_t)&v3->_appStateMonitor & 7) != 0)
  {
LABEL_12:
    __break(0x5516u);
LABEL_13:
    __break(0x5510u);
    return (int)self;
  }

  id v5 = -[IAPApplicationStateMonitor applicationInfoForBundleIDSync:]( v3->_appStateMonitor,  "applicationInfoForBundleIDSync:");
  LODWORD(self) = objc_msgSend( objc_msgSend(v5, "valueForKey:", BKSApplicationStateProcessIDKey),  "unsignedIntegerValue");
  int *p_processId = (int)self;
  return (int)self;
}

- (void)_setJetsamPrioritySpecialCasing:(BOOL)a3
{
  p_bksProcessAssertion = (id *)&self->_bksProcessAssertion;
  unint64_t v5 = (unint64_t)&self->_bksProcessAssertion & 7;
  if (a3)
  {
    if (!v5)
    {
      if (*p_bksProcessAssertion) {
        return;
      }
      int v6 = -[BKSProcessAssertion initWithPID:flags:reason:name:]( objc_alloc(&OBJC_CLASS___BKSProcessAssertion),  "initWithPID:flags:reason:name:",  -[IAPEAClient _getProcessId](self, "_getProcessId"),  13LL,  3LL,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.iapd.ea.assertion.pid.%d",  -[IAPEAClient _getProcessId](self, "_getProcessId")));
      self->_bksProcessAssertion = v6;
      -[BKSProcessAssertion acquire](v6, "acquire");
      unsigned __int16 v7 = @"Taking BKSProcessAssertion for pid %d";
      goto LABEL_8;
    }

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  else {
    self->_unsigned int clientID = a3;
  }
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (BOOL)supportsAccessibility
{
  unsigned int supportsAccessibility = self->_supportsAccessibility;
  if (supportsAccessibility >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = supportsAccessibility != 0;
  }
  return (char)self;
}

- (BOOL)clientRequiresAccReset
{
  unsigned int clientRequiresAccReset = self->_clientRequiresAccReset;
  if (clientRequiresAccReset >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = clientRequiresAccReset != 0;
  }
  return (char)self;
}

- (int)processID
{
  return self->_processId;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  else {
    self->_applicationState = a3;
  }
}

@end