@interface CUPairingXPCConnection
- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5;
- (void)connectionInvalidated;
- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)showWithCompletion:(id)a3;
- (void)startMonitoringWithOptions:(unint64_t)a3;
@end

@implementation CUPairingXPCConnection

- (void)connectionInvalidated
{
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    char v3 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection connectionInvalidated]",  0x14u,  (uint64_t)"XPC connection invalidated from %#{pid}\n",  v4,  v5,  v6,  v7,  v3);
  }

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (*a4
    || (-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        *a4 = [v10 isEqual:MEMORY[0x189604A88]],
        v10,
        *a4)
    || -[CUPairingDaemon testMode](self->_daemon, "testMode"))
  {
    int v11 = 0;
  }

  else
  {
    int v11 = -71168;
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      char v13 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection _entitled:state:label:]",  0x3Cu,  (uint64_t)"### %#{pid} lacks '%@' entitlement to use %@\n",  v14,  v15,  v16,  v17,  v13);
    }
  }

  return v11;
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]",  0x1Eu,  (uint64_t)"%@ %#{flags}\n",  v7,  v8,  v9,  v10,  (char)@"GetPairingIdentity");
  }

  int v11 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Read",  &self->_pmEntitledRead,  @"GetPairingIdentity");
  if (v11
    || (a3 & 0x138) != 0
    && (int v11 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.HomeKit",  &self->_pmEntitledHomeKit,  @"GetPairingIdentity")) != 0)
  {
    int v16 = v11;
    if (v11 != -25300
      && gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]",  0x3Cu,  (uint64_t)"### %@ failed: %#m\n",  v12,  v13,  v14,  v15,  (char)@"GetPairingIdentity");
    }

    if (v6)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      uint64_t v18 = *MEMORY[0x189607670];
      uint64_t v19 = v16;
      uint64_t v25 = *MEMORY[0x1896075E0];
      uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
      v21 = (void *)v20;
      v22 = @"?";
      if (v20) {
        v22 = (const __CFString *)v20;
      }
      v26[0] = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:v18 code:v19 userInfo:v23];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0LL, v24);
    }
  }

  else
  {
    -[CUPairingDaemon getIdentityWithOptions:completionHandler:]( self->_daemon,  "getIdentityWithOptions:completionHandler:",  a3,  v6);
  }
}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]",  0x1Eu,  (uint64_t)"%@ %#{flags}\n",  v7,  v8,  v9,  v10,  (char)@"DeletePairingIdentity");
  }

  if ((a3 & 0x138) != 0)
  {
    int v12 = -6735;
    BOOL v13 = 1;
LABEL_10:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]",  0x3Cu,  (uint64_t)"### %@ %#{flags} failed: %#m\n",  v7,  v8,  v9,  v10,  (char)@"DeletePairingIdentity");
    }

    goto LABEL_14;
  }

  int v11 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.DeleteIdentity",  &self->_pmEntitledDeleteIdentity,  @"DeletePairingIdentity");
  if (!v11) {
    int v11 = -[CUPairingDaemon deleteIdentityWithOptions:](self->_daemon, "deleteIdentityWithOptions:", a3);
  }
  int v12 = v11;
  BOOL v13 = v11 != 0;
  if (v11 != -25300 && v11) {
    goto LABEL_10;
  }
LABEL_14:
  if (v6)
  {
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = *MEMORY[0x189607670];
      uint64_t v16 = v12;
      uint64_t v22 = *MEMORY[0x1896075E0];
      uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v12, 0, 0));
      uint64_t v18 = (void *)v17;
      uint64_t v19 = @"?";
      if (v17) {
        uint64_t v19 = (const __CFString *)v17;
      }
      v23[0] = v19;
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 errorWithDomain:v15 code:v16 userInfo:v20];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v21);
    }

    else
    {
      v6[2](v6, 0LL);
    }
  }
}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void (**)(id, id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]",  0x1Eu,  (uint64_t)"%@ %#{flags}\n",  v7,  v8,  v9,  v10,  (char)@"GetPairedPeers");
  }

  if ((a3 & 0x138) != 0)
  {
    id v11 = 0LL;
    int v20 = -6735;
LABEL_24:
    int v21 = v20;
    goto LABEL_10;
  }

  int v21 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Read",  &self->_pmEntitledRead,  @"GetPairedPeers");
  if (!v21)
  {
    id v11 = -[CUPairingDaemon copyPairedPeersWithOptions:error:]( self->_daemon,  "copyPairedPeersWithOptions:error:",  a3,  &v21);
    if (v21 || v11)
    {
      if (!v21) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }

    int v20 = -6762;
    goto LABEL_24;
  }

  id v11 = 0LL;
LABEL_10:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]",  0x3Cu,  (uint64_t)"### %@ %#{flags} failed: %#m\n",  v7,  v8,  v9,  v10,  (char)@"GetPairedPeers");
  }

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    [v8 identifier];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"%@ %@ %#{flags}\n",  v10,  v11,  v12,  v13,  (char)@"FindPairedPeer");
  }

  int v14 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Read",  &self->_pmEntitledRead,  @"FindPairedPeer");
  int v30 = v14;
  if (v14
    || (a4 & 0x138) != 0
    && (int v14 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.HomeKit",  &self->_pmEntitledHomeKit,  @"FindPairedPeer"),  (v30 = v14) != 0))
  {
    uint64_t v15 = 0LL;
    goto LABEL_10;
  }

  -[CUPairingDaemon findPairedPeer:options:error:](self->_daemon, "findPairedPeer:options:error:", v8, a4, &v30);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = v30;
  if (v30 || v15)
  {
LABEL_10:
    if (v14 == -25300 || !v14) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }

  int v30 = -6762;
LABEL_12:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    [v8 identifier];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### %@ %@ %#{flags} failed: %#m\n",  v17,  v18,  v19,  v20,  (char)@"FindPairedPeer");
  }

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    [v8 identifier];
    int v30 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"%@ %@ %#{flags}\n",  v10,  v11,  v12,  v13,  (char)@"SavePairedPeer");
  }

  if ((a4 & 0x138) != 0)
  {
    int v17 = -6735;
    goto LABEL_11;
  }

  int v14 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Write",  &self->_pmEntitledWrite,  @"SavePairedPeer");
  if (v14)
  {
    int v17 = v14;
LABEL_11:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      [v8 identifier];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### %@ %@ %#{flags} failed: %#m\n",  v18,  v19,  v20,  v21,  (char)@"SavePairedPeer");
    }

    if (v9)
    {
      uint64_t v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x189607670];
      uint64_t v24 = v17;
      uint64_t v32 = *MEMORY[0x1896075E0];
      uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      v26 = (void *)v25;
      v27 = @"?";
      if (v25) {
        v27 = (const __CFString *)v25;
      }
      v33[0] = v27;
      [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 errorWithDomain:v23 code:v24 userInfo:v28];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v29);
    }

    goto LABEL_21;
  }

  if (self->_pmEntitledRemoveAdmin)
  {
    BOOL pmEntitledRemoveAdmin = 1LL;
  }

  else
  {
    -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.PairingManager.RemoveAdmin");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_BOOL pmEntitledRemoveAdmin = [v16 isEqual:MEMORY[0x189604A88]];

    BOOL pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
  }

  int v17 = -[CUPairingDaemon savePairedPeer:options:removeAdminAllowed:]( self->_daemon,  "savePairedPeer:options:removeAdminAllowed:",  v8,  a4,  pmEntitledRemoveAdmin);
  if (v17) {
    goto LABEL_11;
  }
  if (v9) {
    v9[2](v9, 0LL);
  }
LABEL_21:
}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    [v8 identifier];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]",  0x1Eu,  (uint64_t)"%@ %@ %#{flags}\n",  v10,  v11,  v12,  v13,  (char)@"RemovePairedPeer");
  }

  if ((a4 & 0x138) != 0)
  {
    int v17 = -6735;
    BOOL v18 = 1;
LABEL_13:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      [v8 identifier];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]",  0x3Cu,  (uint64_t)"### %@ %@ %#{flags} failed: %#m\n",  v19,  v20,  v21,  v22,  (char)@"RemovePairedPeer");
    }

    goto LABEL_17;
  }

  int v14 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.RemovePeer",  &self->_pmEntitledRemovePeer,  @"RemovePairedPeer");
  if (!v14)
  {
    if (self->_pmEntitledRemoveAdmin)
    {
      BOOL pmEntitledRemoveAdmin = 1LL;
    }

    else
    {
      -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.PairingManager.RemoveAdmin");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_BOOL pmEntitledRemoveAdmin = [v16 isEqual:MEMORY[0x189604A88]];

      BOOL pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
    }

    int v14 = -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:]( self->_daemon,  "removePairedPeer:options:removeAdminAllowed:",  v8,  a4,  pmEntitledRemoveAdmin);
  }

  int v17 = v14;
  BOOL v18 = v14 != 0;
  if (v14 != -25300 && v14) {
    goto LABEL_13;
  }
LABEL_17:
  if (v9)
  {
    if (v18)
    {
      uint64_t v23 = (void *)MEMORY[0x189607870];
      uint64_t v24 = *MEMORY[0x189607670];
      uint64_t v25 = v17;
      uint64_t v33 = *MEMORY[0x1896075E0];
      uint64_t v26 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      v27 = (void *)v26;
      v28 = @"?";
      if (v26) {
        v28 = (const __CFString *)v26;
      }
      v34[0] = v28;
      [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 errorWithDomain:v24 code:v25 userInfo:v29];
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v30);
    }

    else
    {
      v9[2](v9, 0LL);
    }
  }
}

- (void)showWithCompletion:(id)a3
{
  v26[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]",  0x1Eu,  (uint64_t)"%@\n",  v5,  v6,  v7,  v8,  (char)@"Show");
  }

  int v9 = -[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Read",  &self->_pmEntitledRead,  @"Show");
  if (v9)
  {
    int v16 = v9;
  }

  else
  {
    uint64_t v14 = -[CUPairingDaemon detailedDescription](self->_daemon, "detailedDescription");
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      if (v4) {
        v4[2](v4, v14, 0LL);
      }
      goto LABEL_9;
    }

    int v16 = -6762;
  }

  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]",  0x3Cu,  (uint64_t)"### %@ failed: %#m\n",  v10,  v11,  v12,  v13,  (char)@"Show");
  }

  if (v4)
  {
    int v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607670];
    uint64_t v19 = v16;
    uint64_t v25 = *MEMORY[0x1896075E0];
    uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
    uint64_t v21 = (void *)v20;
    uint64_t v22 = @"?";
    if (v20) {
      uint64_t v22 = (const __CFString *)v20;
    }
    v26[0] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:v18 code:v19 userInfo:v23];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0LL, v24);
  }

  uint64_t v15 = 0LL;
LABEL_9:
}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]",  0x1Eu,  (uint64_t)"%@ %#{flags}\n",  v4,  v5,  v6,  v7,  (char)@"StartMonitoring");
  }

  if (-[CUPairingXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.PairingManager.Read",  &self->_pmEntitledRead,  @"StartMonitoring"))
  {
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUPairingDaemon,  (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]",  0x3Cu,  (uint64_t)"### %@ %#{flags} failed: %#m\n",  v8,  v9,  v10,  v11,  (char)@"StartMonitoring");
    }
  }

  else
  {
    self->_monitoring = 1;
  }

- (void).cxx_destruct
{
}

@end