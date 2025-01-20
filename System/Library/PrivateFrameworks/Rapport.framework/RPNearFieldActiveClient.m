@interface RPNearFieldActiveClient
- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3;
- (void)startDiscoveryWithApplicationLabel:(id)a3 completion:(id)a4;
@end

@implementation RPNearFieldActiveClient

- (void)startDiscoveryWithApplicationLabel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[RPNearFieldClient _ensureXPCStarted](self, "_ensureXPCStarted");
  v9 = -[RPNearFieldClient xpcCnx](self, "xpcCnx");
  uint64_t v10 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke;
  v18[3] = &unk_18A031B10;
  id v11 = v7;
  id v19 = v11;
  [v9 remoteObjectProxyWithErrorHandler:v18];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472LL;
  v15[2] = __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke_2;
  v15[3] = &unk_18A032290;
  id v16 = v6;
  id v17 = v11;
  id v13 = v11;
  id v14 = v6;
  [v12 startActiveDiscoveryWithApplicationLabel:v14 completion:v15];
}

void __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v3 = MEMORY[0x1895A4770](*(void *)(a1 + 32));
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke_2( uint64_t a1,  void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPNearFieldClient <= 40 {
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  uint64_t v3 = MEMORY[0x1895A4770](*(void *)(a1 + 40));
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

@end