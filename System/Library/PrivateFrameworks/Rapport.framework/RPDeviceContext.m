@interface RPDeviceContext
- (BOOL)reported;
- (RPDevice)device;
- (RPLegacyDeviceDiscovery)discovery;
- (RPLegacySession)session;
- (int)state;
- (void)invalidate;
- (void)pairVerify;
- (void)setDevice:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setReported:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setState:(int)a3;
- (void)systemInfoResponse:(id)a3 error:(id)a4;
@end

@implementation RPDeviceContext

- (void)invalidate
{
  discovery = self->_discovery;
  self->_discovery = 0LL;

  -[RPLegacySession invalidate](self->_session, "invalidate");
  session = self->_session;
  self->_session = 0LL;
}

- (void)pairVerify
{
  v3 = objc_alloc_init(&OBJC_CLASS___RPLegacySession);
  session = self->_session;
  self->_session = v3;

  -[RPLegacySession setPeerDevice:](self->_session, "setPeerDevice:", self->_device);
  -[RPLegacySession setSecurityFlags:](self->_session, "setSecurityFlags:", 3LL);
  -[RPLegacySession setServiceType:](self->_session, "setServiceType:", @"RPLegacyServiceTypeSystem");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v6 = self->_session;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __29__RPDeviceContext_pairVerify__block_invoke;
  v9[3] = &unk_18A031AC0;
  v9[4] = self;
  -[RPLegacySession activateWithCompletion:](v6, "activateWithCompletion:", v9);
  v7 = self->_session;
  v8[0] = v5;
  v8[1] = 3221225472LL;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke_2;
  v8[3] = &unk_18A031AC0;
  v8[4] = self;
  -[RPLegacySession pairVerifyWithFlags:completion:](v7, "pairVerifyWithFlags:completion:", 8LL, v8);
}

void __29__RPDeviceContext_pairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "invalidate", v6);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    id v3 = v7;
  }
}

void __29__RPDeviceContext_pairVerify__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16LL);
    id v7 = v3;
    LogPrintF();
  }

  if (!v3) {
    [*(id *)(*(void *)(a1 + 32) + 16) setSystemPairState:30];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke_3;
  v8[3] = &unk_18A0338F8;
  v8[4] = v4;
  objc_msgSend(v5, "requestSystemInfoWithCompletion:", v8, v6, v7);
}

uint64_t __29__RPDeviceContext_pairVerify__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) systemInfoResponse:a2 error:a3];
}

- (void)systemInfoResponse:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    -[RPDevice updateWithSystemInfo:](self->_device, "updateWithSystemInfo:");
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      LogPrintF();
    }

    self->_state = 4;
    -[RPLegacyDeviceDiscovery _foundDevice:](self->_discovery, "_foundDevice:", self, device);
  }

  else
  {
    self->_state = 3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      id v9 = v6;
      LogPrintF();
    }
  }

  -[RPLegacySession invalidate](self->_session, "invalidate", device, v9);
  session = self->_session;
  self->_session = 0LL;
}

- (RPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (RPLegacyDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (BOOL)reported
{
  return self->_reported;
}

- (void)setReported:(BOOL)a3
{
  self->_reported = a3;
}

- (RPLegacySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end