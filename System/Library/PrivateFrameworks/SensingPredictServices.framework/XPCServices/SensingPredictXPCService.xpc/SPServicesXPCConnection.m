@interface SPServicesXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (SPContext)context;
- (SPContextMonitor)contextMonitor;
- (SPXPCService)xpcService;
- (void)contextMonitorActivate:(id)a3 completion:(id)a4;
- (void)contextMonitorReportContextSignalUpdated:(id)a3 contextFusedState:(unsigned int)a4;
- (void)contextMonitorReportLocationChanged:(id)a3;
- (void)contextMonitorUpdate:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextMonitor:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcService:(id)a3;
@end

@implementation SPServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.SensingPredict"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100011DA0 <= 90
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 90LL)))
    {
      LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.SensingPredict");
    }

    if (a3)
    {
      uint64_t v8 = NSErrorF(NSOSStatusErrorDomain, 4294896128LL, "Missing entitlement '%@'", @"com.apple.SensingPredict");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      BOOL result = 0;
      *a3 = v9;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)contextMonitorActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_1000075A8;
  v20 = sub_1000075B8;
  id v21 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000075C0;
  v13[3] = &unk_10000C4E0;
  v15 = &v16;
  id v8 = a4;
  id v14 = v8;
  id v9 = objc_retainBlock(v13);
  if (dword_100011DA0 <= 30 && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL))) {
    LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorActivate:completion:]",  30LL,  "SPServicesXPCConnection: Activate: %@",  v7);
  }
  v10 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v11 = -[SPServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_contextMonitor, a3);
    objc_storeStrong((id *)&self->_xpcService->_contextMonitor, a3);
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
    -[SPXPCService _update](self->_xpcService, "_update");
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v16, 8);
}

- (void)contextMonitorUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000075A8;
  uint64_t v16 = sub_1000075B8;
  id v17 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007888;
  v11[3] = &unk_10000C508;
  v11[4] = &v12;
  v5 = objc_retainBlock(v11);
  v6 = (id *)(v13 + 5);
  id obj = (id)v13[5];
  unsigned __int8 v7 = -[SPServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    if (dword_100011DA0 <= 30
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
    {
      LogPrintF(&dword_100011DA0, "-[SPServicesXPCConnection contextMonitorUpdate:]", 30LL, "Update: %@", v4);
    }

    unsigned int v8 = -[SPContextMonitor contextChangeFlags](self->_contextMonitor, "contextChangeFlags");
    id v9 = [v4 contextChangeFlags];
    if (v8 != (_DWORD)v9)
    {
      if (dword_100011DA0 <= 30
        && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
      {
        LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorUpdate:]",  30LL,  "Updating contextChangeSignal from %d to %d",  v8,  (_DWORD)v9);
      }

      -[SPContextMonitor setContextChangeFlags:](self->_contextMonitor, "setContextChangeFlags:", v9);
      -[SPXPCService _update](self->_xpcService, "_update");
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v12, 8);
}

- (void)contextMonitorReportContextSignalUpdated:(id)a3 contextFusedState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  v6 = self->_contextMonitor;
  if (v6)
  {
    if (dword_100011DA0 <= 30
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
    {
      unsigned int v7 = [v11 locationCategory];
      if (v7 > 9) {
        unsigned int v8 = @"?";
      }
      else {
        unsigned int v8 = off_10000C540[(char)v7];
      }
      else {
        id v9 = off_10000C528[(int)v4];
      }
      LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorReportContextSignalUpdated:contextFusedState:]",  30LL,  "SPServicesXPCConnection: reporting location category %@ fusedState : %s",  v8,  v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    [v10 contextSignalUpdated:v11 fusedState:v4];
  }
}

- (void)contextMonitorReportLocationChanged:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self->_contextMonitor;
  if (v4)
  {
    if (dword_100011DA0 <= 30
      && (dword_100011DA0 != -1 || _LogCategory_Initialize(&dword_100011DA0, 30LL)))
    {
      unsigned int v5 = [v8 locationCategory];
      if (v5 > 9) {
        v6 = @"?";
      }
      else {
        v6 = off_10000C540[(char)v5];
      }
      LogPrintF( &dword_100011DA0,  "-[SPServicesXPCConnection contextMonitorReportLocationChanged:]",  30LL,  "SPServicesXPCConnection: reporting location category %@",  v6);
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    [v7 contextMonitorContextChanged:v8];
  }
}

- (SPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (SPContextMonitor)contextMonitor
{
  return self->_contextMonitor;
}

- (void)setContextMonitor:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (SPXPCService)xpcService
{
  return self->_xpcService;
}

- (void)setXpcService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end