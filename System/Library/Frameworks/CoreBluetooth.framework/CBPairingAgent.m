@interface CBPairingAgent
- (BOOL)isPeerCloudPaired:(id)a3;
- (BOOL)isPeerMagicPaired:(id)a3;
- (BOOL)isPeerPaired:(id)a3;
- (BOOL)useOOBMode;
- (CBPairingAgent)initWithParentManager:(id)a3;
- (CBPairingAgentDelegate)delegate;
- (CBPairingAgentParentDelegate)parentManager;
- (id)retrieveOOBDataForPeer:(id)a3;
- (id)retrievePairedPeers;
- (void)dealloc;
- (void)handlePairingCompleted:(id)a3;
- (void)handlePairingMessage:(unsigned __int16)a3 args:(id)a4;
- (void)handlePairingRequested:(id)a3;
- (void)handleUnpaired:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pairPeer:(id)a3;
- (void)pairPeer:(id)a3 options:(id)a4;
- (void)pairPeer:(id)a3 useMITM:(BOOL)a4;
- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 data:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setOOBPairingEnabled:(BOOL)a3 forPeer:(id)a4;
- (void)setParentManager:(id)a3;
- (void)setUseOOBMode:(BOOL)a3;
- (void)unpairPeer:(id)a3;
- (void)unpairPeer:(id)a3 options:(id)a4;
- (void)updateRegistration;
@end

@implementation CBPairingAgent

- (CBPairingAgent)initWithParentManager:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CBPairingAgent;
  v5 = -[CBPairingAgent init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CBPairingAgent setParentManager:](v5, "setParentManager:", v4);
    v7 = -[CBPairingAgent parentManager](v6, "parentManager");
    [v7 sendMsg:8 args:MEMORY[0x189604A60]];
    v8 = -[CBPairingAgent parentManager](v6, "parentManager");
    [v8 sendSyncMsg:10 args:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v20 = v9;
    [v9 objectForKeyedSubscript:@"kCBMsgArgDevices"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          v16 = -[CBPairingAgent parentManager](v6, "parentManager");
          [v16 peerWithInfo:v15];
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          [v15 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPairingState:", objc_msgSend(v18, "integerValue"));

          ++v14;
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v12);
    }

    -[CBPairingAgent addObserver:forKeyPath:options:context:]( v6,  "addObserver:forKeyPath:options:context:",  v6,  @"delegate",  0LL,  objc_opt_class());
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBPairingAgent;
  -[CBPairingAgent dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if ((void *)objc_opt_class() == a6)
  {
    int v13 = [v12 isEqualToString:@"delegate"];

    if (v13) {
      -[CBPairingAgent updateRegistration](self, "updateRegistration");
    }
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___CBPairingAgent;
    -[CBPairingAgent observeValueForKeyPath:ofObject:change:context:]( &v14,  sel_observeValueForKeyPath_ofObject_change_context_,  v12,  v10,  v11,  a6);
  }
}

- (void)updateRegistration
{
  v11[1] = *MEMORY[0x1895F89C0];
  -[CBPairingAgent delegate](self, "delegate");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CBPairingAgent delegate](self, "delegate");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = objc_opt_respondsToSelector();
    v6 = -[CBPairingAgent parentManager](self, "parentManager");
    id v10 = @"kCBMsgArgProgrammaticPairing";
    [MEMORY[0x189607968] numberWithBool:v5 & 1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 sendMsg:8 args:v8];
  }

  else
  {
    -[CBPairingAgent parentManager](self, "parentManager");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v9 sendMsg:8 args:MEMORY[0x189604A60]];
  }

- (BOOL)isPeerPaired:(id)a3
{
  return [a3 pairingState] != 0;
}

- (BOOL)isPeerCloudPaired:(id)a3
{
  return [a3 pairingState] == 2;
}

- (BOOL)isPeerMagicPaired:(id)a3
{
  return [a3 pairingState] == 3;
}

- (id)retrievePairedPeers
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[CBPairingAgent parentManager](self, "parentManager");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 sendSyncMsg:10 args:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FA8] array];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", @"kCBMsgArgDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        -[CBPairingAgent parentManager](self, "parentManager");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 peerWithInfo:v11];
        int v13 = (void *)objc_claimAutoreleasedReturnValue();

        [v5 addObject:v13];
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void)pairPeer:(id)a3
{
}

- (void)pairPeer:(id)a3 useMITM:(BOOL)a4
{
  BOOL v4 = a4;
  v12[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 118, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }

  v11[0] = @"kCBMsgArgPairingOptionsUseMITMAuthentication";
  [MEMORY[0x189607968] numberWithBool:v4];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = @"kCBMsgArgPairingOptionsDistributeIRK";
  v12[0] = v8;
  v12[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPairingAgent pairPeer:options:](self, "pairPeer:options:", v7, v9);
}

- (void)pairPeer:(id)a3 options:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 125, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v9 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  -[CBPairingAgent parentManager](self, "parentManager");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 sendMsg:11 args:v8];
}

- (void)unpairPeer:(id)a3 options:(id)a4
{
  v6 = (void *)MEMORY[0x189603FC8];
  id v7 = a3;
  [v6 dictionaryWithDictionary:a4];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 setObject:v8 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  -[CBPairingAgent parentManager](self, "parentManager");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 sendMsg:13 args:v10];
}

- (void)unpairPeer:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 143, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];

    id v5 = 0LL;
  }

  -[CBPairingAgent unpairPeer:options:](self, "unpairPeer:options:", v5, MEMORY[0x189604A60]);
}

- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 data:(id)a6
{
  BOOL v7 = a5;
  id v18 = a3;
  id v11 = a6;
  if (!v18)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"CBPairingAgent.m", 149, @"Invalid parameter not satisfying: %@", @"peer" object file lineNumber description];
  }

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 identifier];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v13 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  [MEMORY[0x189607968] numberWithInteger:a4];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v14 forKeyedSubscript:@"kCBMsgArgPairingType"];

  [MEMORY[0x189607968] numberWithBool:v7];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v15 forKeyedSubscript:@"kCBMsgArgPairingAccept"];

  -[CBPairingAgent parentManager](self, "parentManager");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 sendMsg:12 args:v12];
}

- (void)setUseOOBMode:(BOOL)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (self->_useOOBMode != a3)
  {
    self->_useOOBMode = a3;
    -[CBPairingAgent parentManager](self, "parentManager");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = @"kCBMsgArgUseOOBPairing";
    [MEMORY[0x189607968] numberWithBool:self->_useOOBMode];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 sendMsg:14 args:v6];
  }

- (id)retrieveOOBDataForPeer:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    id v12 = @"kCBMsgArgDeviceUUID";
    [v4 identifier];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 sendSyncMsg:15 args:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v5 sendSyncMsg:15 args:MEMORY[0x189604A60]];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v9 objectForKeyedSubscript:@"kCBMsgArgPairingData"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setOOBPairingEnabled:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  v6 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithBool:v4];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dictionaryWithObject:v7 forKey:@"kCBMsgArgUseOOBPairing"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v11 identifier];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v9 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  }

  -[CBPairingAgent parentManager](self, "parentManager");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 sendMsg:14 args:v8];
}

- (void)handlePairingRequested:(id)a3
{
  id v4 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 peerWithInfo:v4];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v4 objectForKeyedSubscript:@"kCBMsgArgPairingType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 integerValue];

  [v4 objectForKeyedSubscript:@"kCBMsgArgPairingPasskey"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPairingAgent delegate](self, "delegate");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CBPairingAgent delegate](self, "delegate");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 pairingAgent:self peerDidRequestPairing:v12 type:v7 passkey:v8];
  }
}

- (void)handlePairingCompleted:(id)a3
{
  id v13 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 peerWithInfo:v13];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithInfo:v13];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CBPairingAgent delegate](self, "delegate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CBPairingAgent delegate](self, "delegate");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 pairingAgent:self peerDidFailToCompletePairing:v5 error:v6];
LABEL_6:
    }
  }

  else
  {
    [v13 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPairingState:", objc_msgSend(v10, "integerValue"));

    -[CBPairingAgent delegate](self, "delegate");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CBPairingAgent delegate](self, "delegate");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 pairingAgent:self peerDidCompletePairing:v5];
      goto LABEL_6;
    }
  }
}

- (void)handleUnpaired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CBPairingAgent parentManager](self, "parentManager");
  [(id)v5 peerWithInfo:v4];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setPairingState:0];
  v6 = -[CBPairingAgent delegate](self, "delegate");
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CBPairingAgent delegate](self, "delegate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 pairingAgent:self peerDidUnpair:v8];
  }
}

- (void)handlePairingMessage:(unsigned __int16)a3 args:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if ((v4 - 16) < 3)
  {
    objc_msgSend(self, *off_189FB5E40[(__int16)(v4 - 16)], v6);
LABEL_3:

    return;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v7 = (os_log_s *)CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_3;
  }
  -[CBScalablePipeManager handleMsg:args:].cold.1(v4, v7);
}

- (CBPairingAgentDelegate)delegate
{
  return (CBPairingAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useOOBMode
{
  return self->_useOOBMode;
}

- (CBPairingAgentParentDelegate)parentManager
{
  return (CBPairingAgentParentDelegate *)objc_loadWeakRetained((id *)&self->_parentManager);
}

- (void)setParentManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end