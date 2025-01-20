@interface B2PEngine
- (B2PEngine)initWithDelegate:(id)a3;
- (BOOL)sendCommand:(id)a3;
- (BOOL)sendResponse:(id)a3;
- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4 dataSessionProtocol:(unsigned __int8)a5;
- (id)b2pTimerForNSTimer:(id)a3;
- (id)inputCommandWithOpCode:(unsigned __int16)a3 data:(id)a4;
- (int)debugLevel;
- (int)sendData:(id)a3;
- (void)dealloc;
- (void)inputCommandResponseWithOpCode:(unsigned __int16)a3 status:(int)a4 data:(id)a5;
- (void)lock;
- (void)receiveData:(id)a3;
- (void)resetWithReason:(int)a3;
- (void)setDebugLevel:(int)a3;
- (void)setMaxTransmitAttempts:(unsigned __int8)a3;
- (void)startTimerType:(int)a3 deadlineMS:(unsigned int)a4;
- (void)stopTimerType:(int)a3;
- (void)timerFired:(id)a3;
- (void)unlock;
@end

@implementation B2PEngine

- (B2PEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___B2PEngine;
  v5 = -[B2PEngine init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    p_client_context = &v5->_b2pContext.client_context;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v17[0] = 0x4000000010000LL;
    v17[1] = v5->_b2pReceiveBuffer;
    v17[2] = v5->_b2pLinkLinearBuffer;
    v17[3] = v5->_b2pTransmitBuffer;
    b2p_init((uint64_t)&v5->_b2pContext, (uint64_t)v17);
    *p_client_context = v6;
    int v15 = 131072050;
    __int16 v16 = 1;
    b2p_enable((__int16 *)&v6->_b2pContext, (uint64_t)&v15);
    b2p_set_max_attempts((uint64_t)&v6->_b2pContext, 6);
    uint64_t v8 = [MEMORY[0x189603FA8] array];
    scheduledTimers = v6->_scheduledTimers;
    v6->_scheduledTimers = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    b2pLock = v6->_b2pLock;
    v6->_b2pLock = v10;

    objc_storeWeak((id *)&v6->_delegate, v4);
    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "b2pEngine");
    log = v6->_log;
    v6->_log = v12;

    *(void *)&v6->_category = 0x1000000FFLL;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_scheduledTimers;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___B2PEngine;
  -[B2PEngine dealloc](&v8, sel_dealloc);
}

- (void)setMaxTransmitAttempts:(unsigned __int8)a3
{
}

- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4 dataSessionProtocol:(unsigned __int8)a5
{
  return 0;
}

- (void)receiveData:(id)a3
{
  p_b2pContext = &self->_b2pContext;
  id v4 = a3;
  uint64_t v5 = (unsigned __int8 *)[v4 bytes];
  unsigned __int16 v6 = [v4 length];

  b2p_recv_bytes(p_b2pContext, v5, v6);
}

- (BOOL)sendCommand:(id)a3
{
  id v4 = a3;
  [v4 data];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = [v4 opCode];

  id v7 = v5;
  LOBYTE(self) = b2p_send_command( (uint64_t)&self->_b2pContext,  v6,  (char *)[v7 bytes],  (unsigned __int16)objc_msgSend(v7, "length")) == 0;

  return (char)self;
}

- (BOOL)sendResponse:(id)a3
{
  id v4 = a3;
  [v4 data];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v6 = [v4 opCodeField];
  char v7 = [v4 status];

  id v8 = v5;
  LOBYTE(self) = b2p_send_response( (uint64_t)&self->_b2pContext,  v6,  v7,  (const void *)[v8 bytes],  (unsigned __int16)objc_msgSend(v8, "length")) == 0;

  return (char)self;
}

- (id)inputCommandWithOpCode:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  uint64_t v7 = v4 & 0xFFF;
  uint64_t v8 = v4 >> 12;
  if ((_DWORD)v7 != 18)
  {
    __int128 v9 = 0LL;
LABEL_6:
    __int128 v12 = -[B2PResponse initWithOpCode:route:status:]( objc_alloc(&OBJC_CLASS___B2PResponse),  "initWithOpCode:route:status:",  v7,  v8,  2LL);
    goto LABEL_7;
  }

  __int128 v9 = -[B2PCommand initWithOpCode:route:data:]( objc_alloc(&OBJC_CLASS___B2PDataSessionDataCommand),  "initWithOpCode:route:data:",  18LL,  v8,  v6);
  if (!v9) {
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = [WeakRetained receivedCommand:v9];

  if ((v11 & 1) == 0) {
    goto LABEL_6;
  }
  __int128 v12 = 0LL;
LABEL_7:

  return v12;
}

- (void)inputCommandResponseWithOpCode:(unsigned __int16)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  unsigned int v6 = a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  int v9 = v6 & 0xFFF;
  if (![v8 length])
  {
    char v11 = objc_alloc(&OBJC_CLASS___B2PResponse);
    uint64_t v12 = v6 & 0xFFF;
    uint64_t v13 = v6 >> 12;
    uint64_t v14 = v5;
    id v15 = 0LL;
    goto LABEL_25;
  }

  if ((v6 & 0xFFF) <= 0x26)
  {
    if ((v6 & 0xFFF) > 0x10)
    {
      if (v9 == 17)
      {
        uint64_t v10 = v6 >> 12;
        char v11 = objc_alloc(&OBJC_CLASS___B2PDataSessionConnectResponse);
        uint64_t v12 = 17LL;
        goto LABEL_24;
      }

      if (v9 == 19)
      {
        uint64_t v10 = v6 >> 12;
        char v11 = objc_alloc(&OBJC_CLASS___B2PDataSessionDataResponse);
        uint64_t v12 = 19LL;
        goto LABEL_24;
      }
    }

    else
    {
      if (v9 == 1)
      {
        uint64_t v10 = v6 >> 12;
        char v11 = objc_alloc(&OBJC_CLASS___B2PPingResponse);
        uint64_t v12 = 1LL;
        goto LABEL_24;
      }

      if (v9 == 3)
      {
        uint64_t v10 = v6 >> 12;
        char v11 = objc_alloc(&OBJC_CLASS___B2PIdentificationResponse);
        uint64_t v12 = 3LL;
        goto LABEL_24;
      }
    }

- (void)resetWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained b2pReset:v3];
}

- (int)sendData:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  int v6 = [WeakRetained sendData:v4];

  return v6 ^ 1;
}

- (void)startTimerType:(int)a3 deadlineMS:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_initWeak(&location, self);
  uint64_t v7 = objc_alloc(&OBJC_CLASS___B2PTimer);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained queue];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = __39__B2PEngine_startTimerType_deadlineMS___block_invoke;
  uint64_t v14 = &unk_18A3C13B0;
  objc_copyWeak(&v15, &location);
  uint64_t v10 = -[B2PTimer initWithDeadlineMS:type:queue:block:](v7, "initWithDeadlineMS:type:queue:block:", v4, v5, v9, &v11);

  -[B2PTimer start](v10, "start", v11, v12, v13, v14);
  -[NSMutableArray addObject:](self->_scheduledTimers, "addObject:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __39__B2PEngine_startTimerType_deadlineMS___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained timerFired:v3];
}

- (void)stopTimerType:(int)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  p_scheduledTimers = &self->_scheduledTimers;
  uint64_t v5 = self->_scheduledTimers;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v11) == a3)
        {
          [v10 cancel];
          -[NSMutableArray removeObject:](*p_scheduledTimers, "removeObject:", v10);
          goto LABEL_11;
        }
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)b2pTimerForNSTimer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = self->_scheduledTimers;
  id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "timer", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)timerFired:(id)a3
{
  if (a3) {
    ((void (*)($12A943311ED4ED0627C40B4A7BCE4186 *, uint64_t))sTimerCallback)( &self->_b2pContext,  [a3 type]);
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (int)debugLevel
{
  return self->_debugLevel;
}

- (void)setDebugLevel:(int)a3
{
  self->_debugLevel = a3;
}

- (void).cxx_destruct
{
}

- (void)inputCommandResponseWithOpCode:(unsigned __int16)a1 status:(os_log_s *)a2 data:.cold.1(unsigned __int16 a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_189540000,  a2,  OS_LOG_TYPE_ERROR,  "Unable to parse command response for op code 0x%04x",  (uint8_t *)v2,  8u);
}

@end