@interface CBPeer
- (BOOL)hasTag:(id)a3;
- (BOOL)isLinkEncrypted;
- (CBManager)manager;
- (CBPeer)initWithInfo:(id)a3 manager:(id)a4;
- (NSUUID)identifier;
- (id)customProperty:(id)a3;
- (id)customPropertyNames;
- (id)getTags;
- (id)peerStateToString:(int64_t)a3;
- (id)sendInternalSyncMsg:(int)a3 args:(id)a4;
- (int64_t)hostState;
- (int64_t)pairingState;
- (int64_t)role;
- (unint64_t)hash;
- (unint64_t)mtuLength;
- (unsigned)connectedTransport;
- (void)handleHostStateUpdated:(id)a3;
- (void)handleLinkEncryptionChanged:(id)a3;
- (void)handleMTUChanged:(id)a3;
- (void)handleMsg:(int)a3 args:(id)a4;
- (void)sendInternalMsg:(int)a3 args:(id)a4;
- (void)setConnectedTransport:(unsigned __int8)a3;
- (void)setCustomProperty:(id)a3 value:(id)a4;
- (void)setHostState:(int64_t)a3;
- (void)setIsLinkEncrypted:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setMtuLength:(unint64_t)a3;
- (void)setPairingState:(int64_t)a3;
- (void)setRole:(int64_t)a3;
- (void)tag:(id)a3;
- (void)untag:(id)a3;
@end

@implementation CBPeer

- (CBPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CBPeer;
  v8 = -[CBPeer init](&v15, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v10 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v9;

    [v6 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)v8 + 3) = [v11 unsignedIntegerValue];

    [v6 objectForKeyedSubscript:@"kCBMsgArgPairingState"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)v8 + 4) = [v12 integerValue];

    v8[8] = 0;
    *(_OWORD *)(v8 + 40) = xmmword_18702BF40;
    objc_storeWeak((id *)v8 + 7, v7);
    [v6 objectForKeyedSubscript:@"kCBMsgArgConnectionTransport"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[9] = [v13 unsignedIntegerValue];
  }

  return (CBPeer *)v8;
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  id v6 = a4;
  if ((a3 - 164) < 3)
  {
    objc_msgSend(self, *off_189FB44D0[a3 - 164], v6);
LABEL_3:

    return;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v7 = (os_log_s *)CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_3;
  }
  -[CBScalablePipeManager handleMsg:args:].cold.1(a3, v7);
}

- (id)peerStateToString:(int64_t)a3
{
  else {
    return off_189FB44E8[a3];
  }
}

- (void)handleMTUChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setMtuLength:](self, "setMtuLength:", [v4 unsignedIntegerValue]);
}

- (void)handleHostStateUpdated:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setHostState:](self, "setHostState:", [v4 integerValue]);
}

- (void)handleLinkEncryptionChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", [v4 BOOLValue]);
}

- (id)sendInternalSyncMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[CBPeer identifier](self, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v7 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  v8 = -[CBPeer manager](self, "manager");
  [v8 sendSyncMsg:v4 args:v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)sendInternalMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v9 = v6;
  -[CBPeer identifier](self, "identifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v7 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained sendMsg:v4 args:v9];
}

- (void)tag:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 168LL, v4);
}

- (void)untag:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 169LL, v4);
}

- (BOOL)hasTag:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 170LL, v4);
  [v5 objectForKeyedSubscript:@"kCBMsgArgData"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)getTags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"kCBMsgArgData"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCustomProperty:(id)a3 value:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 172LL, v5);
}

- (id)customProperty:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 173LL, v4);
  [v5 objectForKeyedSubscript:@"kCBMsgArgCustomPropertyValue"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)customPropertyNames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"kCBMsgArgCustomPropertyNames"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (void)setMtuLength:(unint64_t)a3
{
  self->_mtuLength = a3;
}

- (int64_t)pairingState
{
  return self->_pairingState;
}

- (void)setPairingState:(int64_t)a3
{
  self->_pairingState = a3;
}

- (int64_t)hostState
{
  return self->_hostState;
}

- (void)setHostState:(int64_t)a3
{
  self->_hostState = a3;
}

- (BOOL)isLinkEncrypted
{
  return self->_isLinkEncrypted;
}

- (void)setIsLinkEncrypted:(BOOL)a3
{
  self->_isLinkEncrypted = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (CBManager)manager
{
  return (CBManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
}

- (unsigned)connectedTransport
{
  return self->_connectedTransport;
}

- (void)setConnectedTransport:(unsigned __int8)a3
{
  self->_connectedTransport = a3;
}

- (void).cxx_destruct
{
}

@end