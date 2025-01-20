@interface CBScalablePipeManager
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (CBScalablePipeManager)initWithDelegate:(id)a3;
- (CBScalablePipeManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CBScalablePipeManagerDelegate)delegate;
- (NSHashTable)pipes;
- (NSSet)identifiers;
- (id)pipeForName:(id)a3 identifier:(id)a4;
- (id)sharedPairingAgent;
- (void)dealloc;
- (void)getStatistics:(id)a3;
- (void)handleEndpointAdded:(id)a3;
- (void)handleEndpointRemoved:(id)a3;
- (void)handleHostStateUpdated:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePipeConnected:(id)a3;
- (void)handlePipeDisconnected:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanPipes;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 options:(id)a6;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6;
- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6 requireEncryption:(BOOL)a7;
- (void)setDelegate:(id)a3;
- (void)setLinkRequirementsForPeer:(id)a3 packetsPerSecond:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6;
- (void)setLinkRequirementsForPeer:(id)a3 withClientName:(id)a4 packetsPerSecond:(unsigned int)a5 inputBytesPerSecond:(unsigned int)a6 outputBytesPerSecond:(unsigned int)a7;
- (void)setLinkRequirementsForPeerWithLatency:(id)a3 latencyInMs:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6;
- (void)unregisterAllEndpoints;
- (void)unregisterEndpoint:(id)a3;
@end

@implementation CBScalablePipeManager

- (CBScalablePipeManager)initWithDelegate:(id)a3
{
  return -[CBScalablePipeManager initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, 0LL);
}

- (CBScalablePipeManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CBScalablePipeManager;
  v8 = -[CBManager initInternal](&v14, sel_initInternal);
  if (v8)
  {
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"state",  0LL,  objc_opt_class());
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"delegate",  0LL,  objc_opt_class());
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:]( v8,  "addObserver:forKeyPath:options:context:",  v8,  @"localName",  0LL,  objc_opt_class());
    -[CBScalablePipeManager setDelegate:](v8, "setDelegate:", v6);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    identifiers = v8->_identifiers;
    v8->_identifiers = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1896078B8]) initWithOptions:5 capacity:0];
    pipes = v8->_pipes;
    v8->_pipes = (NSHashTable *)v11;

    -[CBManager startWithQueue:options:sessionType:](v8, "startWithQueue:options:sessionType:", v7, 0LL, 2LL);
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBScalablePipeManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if ([v10 isEqualToString:@"state"])
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn)
      {
        -[CBScalablePipeManager orphanPipes](self, "orphanPipes");
        if (-[CBManager state](self, "state") == CBManagerStateResetting) {
          -[NSMutableSet removeAllObjects](self->_identifiers, "removeAllObjects");
        }
      }
      v13 = -[CBScalablePipeManager delegate](self, "delegate");
      [v13 scalablePipeManagerDidUpdateState:self];
    }

    else
    {
      -[CBScalablePipeManager delegate](self, "delegate");
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      v15 = -[CBScalablePipeManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v16 = 2;
      }
      else {
        char v16 = 0;
      }
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v16;
      v17 = -[CBScalablePipeManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v18 = 4;
      }
      else {
        char v18 = 0;
      }
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v18;
      v13 = -[CBScalablePipeManager delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        char v19 = 8;
      }
      else {
        char v19 = 0;
      }
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v19;
    }

    goto LABEL_20;
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CBScalablePipeManager;
  -[CBScalablePipeManager observeValueForKeyPath:ofObject:change:context:]( &v20,  sel_observeValueForKeyPath_ofObject_change_context_,  v10,  v11,  v12,  a6);
LABEL_20:
}

- (id)sharedPairingAgent
{
  return 0LL;
}

- (id)pipeForName:(id)a3 identifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v20 = a4;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = self->_pipes;
  uint64_t v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_4:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
      [v12 name];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v13 isEqualToString:v6])
      {
        [v12 peer];
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 identifier];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        char v16 = [v15 isEqual:v20];

        if ((v16 & 1) != 0)
        {
          id v17 = v12;

          goto LABEL_17;
        }
      }

      else
      {
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        if (!v9) {
          break;
        }
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  char v18 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBScalablePipeManager pipeForName:identifier:].cold.1((uint64_t)v20, (uint64_t)v6, v18);
  }
  id v17 = 0LL;
LABEL_17:

  return v17;
}

- (void)orphanPipes
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  objc_super v3 = self->_pipes;
  uint64_t v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setOrphan", (void)v8);
      }

      while (v5 != v7);
      uint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSHashTable removeAllObjects](self->_pipes, "removeAllObjects");
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5
{
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6
{
  v15[1] = *MEMORY[0x1895F89C0];
  objc_super v14 = @"kCBMsgArgsTransport";
  __int128 v10 = (void *)MEMORY[0x189607968];
  id v11 = a3;
  [v10 numberWithInteger:a6];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager registerEndpoint:type:priority:options:]( self,  "registerEndpoint:type:priority:options:",  v11,  a4,  a5,  v13);
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6 requireEncryption:(BOOL)a7
{
  BOOL v7 = a7;
  v18[2] = *MEMORY[0x1895F89C0];
  v17[0] = @"kCBMsgArgsTransport";
  id v12 = (void *)MEMORY[0x189607968];
  id v13 = a3;
  [v12 numberWithInteger:a6];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = @"kCBMsgArgRequiresEncryption";
  v18[0] = v14;
  [MEMORY[0x189607968] numberWithBool:v7];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager registerEndpoint:type:priority:options:]( self,  "registerEndpoint:type:priority:options:",  v13,  a4,  a5,  v16);
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 options:(id)a6
{
  v42[8] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  [v11 objectForKeyedSubscript:@"kCBMsgArgRequiresEncryption"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v11 objectForKeyedSubscript:@"kCBMsgArgRequiresEncryption"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v39 = [v13 BOOLValue];
  }

  else
  {
    unsigned int v39 = 1;
  }

  [v11 objectForKeyedSubscript:@"kCBMsgArgsTransport"];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    [v11 objectForKeyedSubscript:@"kCBMsgArgsTransport"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = (int)[v15 intValue];
  }

  else
  {
    uint64_t v38 = 0LL;
  }

  [v11 objectForKeyedSubscript:@"kCBDisableBluetoothReliability"];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    [v11 objectForKeyedSubscript:@"kCBDisableBluetoothReliability"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 BOOLValue];
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  v40 = self;

  [v11 objectForKeyedSubscript:@"kCBOptionStayConnectedWhenIdle"];
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    [v11 objectForKeyedSubscript:@"kCBOptionStayConnectedWhenIdle"];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 BOOLValue];
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  [v11 objectForKeyedSubscript:@"kCBLePipeOptionTrace"];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    [v11 objectForKeyedSubscript:@"kCBLePipeOptionTrace"];
    int64_t v23 = a5;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v37 = [v24 intValue];

    a5 = v23;
    if ([v10 length]) {
      goto LABEL_15;
    }
  }

  else
  {
    unsigned int v37 = 0;

    if ([v10 length]) {
      goto LABEL_15;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 handleFailureInMethod:a2, v40, @"CBScalablePipeManager.m", 158, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];

LABEL_15:
  v42[0] = v10;
  v41[0] = @"kCBMsgArgName";
  v41[1] = @"kCBMsgArgType";
  v34 = v10;
  [MEMORY[0x189607968] numberWithInteger:a4];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v36;
  v41[2] = @"kCBLePipeMsgArgPriority";
  [MEMORY[0x189607968] numberWithInteger:a5];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v25;
  v41[3] = @"kCBMsgArgOptions";
  [MEMORY[0x189607968] numberWithInteger:v38];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v26;
  v41[4] = @"kCBMsgArgRequiresEncryption";
  [MEMORY[0x189607968] numberWithInt:v39];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v27;
  v41[5] = @"kCBDisableBluetoothReliability";
  [MEMORY[0x189607968] numberWithInt:v18];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v28;
  v41[6] = @"kCBOptionStayConnectedWhenIdle";
  [MEMORY[0x189607968] numberWithInt:v21];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v29;
  v41[7] = @"kCBLePipeOptionTrace";
  [MEMORY[0x189607968] numberWithInt:v37];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:8];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v32 = -[CBManager sendMsg:args:](v40, "sendMsg:args:", 8LL, v31);

  if (v32) {
    -[NSMutableSet addObject:](v40->_identifiers, "addObject:", v34);
  }
}

- (void)unregisterEndpoint:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (![v5 length])
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"CBScalablePipeManager.m", 167, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];
  }

  __int128 v9 = @"kCBMsgArgName";
  v10[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 9LL, v6);

  if (v7) {
    -[NSMutableSet removeObject:](self->_identifiers, "removeObject:", v5);
  }
}

- (void)unregisterAllEndpoints
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_super v3 = self->_identifiers;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        objc_super v14 = @"kCBMsgArgName";
        uint64_t v15 = v8;
        objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, (void)v10);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBManager sendMsg:args:](self, "sendMsg:args:", 9LL, v9);

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v16,  16LL);
    }

    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_identifiers, "removeAllObjects");
}

- (void)setLinkRequirementsForPeer:(id)a3 packetsPerSecond:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v17[4] = *MEMORY[0x1895F89C0];
  v17[0] = a3;
  v16[0] = @"kCBMsgArgDeviceUUID";
  v16[1] = @"kCBMsgArgPacketsPerSecond";
  __int128 v10 = (void *)MEMORY[0x189607968];
  id v11 = a3;
  [v10 numberWithUnsignedInt:v8];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = @"kCBMsgArgInputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v7];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  void v17[2] = v13;
  v16[3] = @"kCBMsgArgOutputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:4];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 10LL, v15);
}

- (void)setLinkRequirementsForPeer:(id)a3 withClientName:(id)a4 packetsPerSecond:(unsigned int)a5 inputBytesPerSecond:(unsigned int)a6 outputBytesPerSecond:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  v20[5] = *MEMORY[0x1895F89C0];
  v19[0] = @"kCBMsgArgDeviceUUID";
  v19[1] = @"kCBMsgArgClientName";
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = @"kCBMsgArgPacketsPerSecond";
  __int128 v12 = (void *)MEMORY[0x189607968];
  id v13 = a4;
  id v14 = a3;
  [v12 numberWithUnsignedInt:v9];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  v19[3] = @"kCBMsgArgInputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v8];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  v19[4] = @"kCBMsgArgOutputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v7];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v17;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:5];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 10LL, v18);
}

- (void)setLinkRequirementsForPeerWithLatency:(id)a3 latencyInMs:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v17[4] = *MEMORY[0x1895F89C0];
  v17[0] = a3;
  v16[0] = @"kCBMsgArgDeviceUUID";
  v16[1] = @"kCBMsgArgLatencyInMs";
  __int128 v10 = (void *)MEMORY[0x189607968];
  id v11 = a3;
  [v10 numberWithUnsignedInt:v8];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = @"kCBMsgArgInputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  void v17[2] = v13;
  v16[3] = @"kCBMsgArgOutputBytesPerSecond";
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:4];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 11LL, v15);
}

- (void)getStatistics:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __39__CBScalablePipeManager_getStatistics___block_invoke;
  v6[3] = &unk_189FB1978;
  id v7 = v4;
  id v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 12LL, MEMORY[0x189604A60], v6);
}

uint64_t __39__CBScalablePipeManager_getStatistics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)handleEndpointAdded:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithInfo:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet member:](self->_identifiers, "member:", v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v5) {
      -[NSMutableSet removeObject:](self->_identifiers, "removeObject:", v8);
    }
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      -[CBScalablePipeManager delegate](self, "delegate");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 scalablePipeManager:self didRegisterEndpoint:v8 error:v5];
    }
  }
}

- (void)handleEndpointRemoved:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_identifiers, "removeObject:");
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    -[CBScalablePipeManager delegate](self, "delegate");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 scalablePipeManager:self didUnregisterEndpoint:v5];
  }
}

- (void)handlePipeConnected:(id)a3
{
  id v4 = a3;
  uint64_t v6 = -[CBScalablePipe initWithPipeManager:info:]( objc_alloc(&OBJC_CLASS___CBScalablePipe),  "initWithPipeManager:info:",  self,  v4);

  -[NSHashTable addObject:](self->_pipes, "addObject:", v6);
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    -[CBScalablePipeManager delegate](self, "delegate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 scalablePipeManager:self pipeDidConnect:v6];
  }
}

- (void)handlePipeDisconnected:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBScalablePipeManager pipeForName:identifier:](self, "pipeForName:identifier:", v9, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
    {
      -[CBScalablePipeManager delegate](self, "delegate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 scalablePipeManager:self pipeDidDisconnect:v7 error:v6];
    }

    -[NSHashTable removeObject:](self->_pipes, "removeObject:", v7);
  }
}

- (void)handleHostStateUpdated:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgName"];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager pipeForName:identifier:](self, "pipeForName:identifier:", v10, v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgState"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 integerValue];
  [v6 peer];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setHostState:v8];
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFE) == 8;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  char v7 = 1;
  uint64_t v8 = &selRef_handleEndpointAdded_;
  switch(v4)
  {
    case 13:
      goto LABEL_9;
    case 14:
      id v9 = sel_handleEndpointRemoved_;
      -[CBManager state](self, "state");
      goto LABEL_16;
    case 15:
      id v9 = sel_handlePipeConnected_;
      CBManagerState v11 = -[CBManager state](self, "state");
      goto LABEL_10;
    case 16:
      char v7 = 0;
      uint64_t v8 = &selRef_handlePipeDisconnected_;
LABEL_9:
      id v9 = *v8;
      CBManagerState v11 = -[CBManager state](self, "state");
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    case 17:
      id v9 = sel_handleHostStateUpdated_;
      CBManagerState v11 = -[CBManager state](self, "state");
LABEL_10:
      if (v11 == CBManagerStatePoweredOn)
      {
LABEL_16:
        objc_msgSend(self, v9, v6);
      }

      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        __int128 v12 = (os_log_s *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        {
          -[CBScalablePipeManager handleMsg:args:].cold.2((uint64_t)self, v4, v12);
        }

        else
        {
LABEL_6:
        }
      }

      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      id v10 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      -[CBScalablePipeManager handleMsg:args:].cold.1(v4, v10);

      break;
  }

- (NSSet)identifiers
{
  return &self->_identifiers->super;
}

- (CBScalablePipeManagerDelegate)delegate
{
  return (CBScalablePipeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSHashTable)pipes
{
  return self->_pipes;
}

- (void).cxx_destruct
{
}

- (void)pipeForName:(os_log_t)log identifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_186F9B000,  log,  OS_LOG_TYPE_ERROR,  "Unable to locate pipe to device %@ on endpoint \"%@\"",  (uint8_t *)&v3,  0x16u);
}

- (void)handleMsg:(int)a1 args:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_186F9B000, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
}

- (void)handleMsg:(os_log_t)log args:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl( &dword_186F9B000,  log,  OS_LOG_TYPE_DEBUG,  "%@ is not powered on, ignoring message: %u",  (uint8_t *)&v3,  0x12u);
}

@end