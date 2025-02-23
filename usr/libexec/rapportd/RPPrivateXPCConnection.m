@interface RPPrivateXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)direct;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateAdvertiser)activatedAdvertiser;
- (RPPrivateDaemon)daemon;
- (RPPrivateDiscovery)activatedDiscovery;
- (void)setDaemon:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionInvalidated;
- (void)xpcPrivateAdvertiserActivate:(id)a3 completion:(id)a4;
- (void)xpcPrivateAdvertiserUpdate:(id)a3 completion:(id)a4;
- (void)xpcPrivateDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcPrivateDiscoveryUpdate:(id)a3 completion:(id)a4;
@end

@implementation RPPrivateXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100132A80 <= 90
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 90LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.rapport");
    }

    if (a3)
    {
      id v14 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)@"com.apple.rapport");
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      BOOL result = 0;
      *a3 = v15;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)xpcConnectionInvalidated
{
  v3 = self->_activatedAdvertiser;
  if (v3)
  {
    if (dword_100132A80 < 31
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcConnectionInvalidated]",  30LL,  "Invalidate: %@, from %#{pid}\n",  v3,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    if (!self->_direct) {
      -[RPPrivateAdvertiser invalidate](v3, "invalidate");
    }
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0LL;
  }

  v5 = self->_activatedDiscovery;
  if (v5)
  {
    if (dword_100132A80 < 31
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcConnectionInvalidated]",  30LL,  "Invalidate: %@, from %#{pid}\n",  v5,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    if (!self->_direct) {
      -[RPPrivateDiscovery invalidate](v5, "invalidate");
    }
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0LL;
  }

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;
}

- (void)xpcPrivateAdvertiserActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void))a4;
  id v12 = 0LL;
  unsigned int v9 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  id v10 = v12;
  id v11 = v10;
  if (v9)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcPrivateAdvertiserActivate:completion:]",  30LL,  "Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    objc_storeStrong((id *)&self->_activatedAdvertiser, a3);
    id v11 = 0LL;
  }

  ((void (**)(id, id))v8)[2](v8, v11);
}

- (void)xpcPrivateAdvertiserUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v11 = 0LL;
  unsigned int v8 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v9 = v11;
  id v10 = v9;
  if (v8)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcPrivateAdvertiserUpdate:completion:]",  30LL,  "Update: %@, from %#{pid}\n",  v6,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    id v10 = 0LL;
  }

  ((void (**)(id, id))v7)[2](v7, v10);
}

- (void)xpcPrivateDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void))a4;
  id v12 = 0LL;
  unsigned int v9 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  id v10 = v12;
  id v11 = v10;
  if (v9)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcPrivateDiscoveryActivate:completion:]",  30LL,  "Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    id v11 = 0LL;
  }

  ((void (**)(id, id))v8)[2](v8, v11);
}

- (void)xpcPrivateDiscoveryUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v11 = 0LL;
  unsigned int v8 = -[RPPrivateXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v9 = v11;
  id v10 = v9;
  if (v8)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF( &dword_100132A80,  "-[RPPrivateXPCConnection xpcPrivateDiscoveryUpdate:completion:]",  30LL,  "Update: %@, from %#{pid}\n",  v6,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    id v10 = 0LL;
  }

  ((void (**)(id, id))v7)[2](v7, v10);
}

- (RPPrivateAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (RPPrivateDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPrivateDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
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

- (void).cxx_destruct
{
}

@end