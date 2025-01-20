@interface NEIKEv2Listener
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 includeP2P:(BOOL)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (OS_dispatch_queue)listenerQueue;
- (id)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 listenerUDPPort:(void *)a6 listenerInterface:(void *)a7 listenerQueue:(void *)a8 delegate:(void *)a9 delegateQueue:(char)a10 includeP2P:;
- (id)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 packetDelegate:(void *)a6 listenerQueue:(void *)a7 delegate:(void *)a8 delegateQueue:;
- (void)cancel;
- (void)createListenerWithParameters:(unsigned int)a3 attempt:;
- (void)dealloc;
- (void)invalidatingTransport:(id)a3;
- (void)receivePacket:(id)a3 transport:(id)a4;
- (void)requestConfigurationForSession:(id)a3 sessionConfig:(id)a4 childConfig:(id)a5 validateAuthBlock:(id)a6 responseBlock:(id)a7;
- (void)sessionFailedBeforeRequestingConfiguration:(id)a3;
@end

@implementation NEIKEv2Listener

- (void)requestConfigurationForSession:(id)a3 sessionConfig:(id)a4 childConfig:(id)a5 validateAuthBlock:(id)a6 responseBlock:(id)a7
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  ne_log_obj();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v12;
    _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEFAULT, "Session %@ requesting configuration", buf, 0xCu);
  }

  if (self)
  {
    -[NSMutableSet removeObject:](self->_sessionsBeforeAuth, "removeObject:", v12);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v19 = WeakRetained;
      v20 = (void *)[v13 copy];
      v21 = (void *)[v14 copy];
      delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke;
      block[3] = &unk_18A08D320;
      id v28 = v19;
      v29 = self;
      id v30 = v12;
      id v31 = v20;
      id v32 = v21;
      id v33 = v15;
      id v34 = v16;
      id v23 = v21;
      id v24 = v20;
      id v25 = v19;
      dispatch_async(delegateQueue, block);

      goto LABEL_6;
    }
  }

  else
  {
    [0 removeObject:v12];
  }

  ne_log_obj();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1876B1000, v26, OS_LOG_TYPE_ERROR, "Listener delegate is nil, returning failure", buf, 2u);
  }

  (*((void (**)(id, void, void, void))v16 + 2))(v16, 0LL, 0LL, 0LL);
LABEL_6:
}

- (void)sessionFailedBeforeRequestingConfiguration:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v4 = (char *)a3;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "Session %@ failed before requesting configuration",  (uint8_t *)&v8,  0xCu);
    }

    if (self) {
      sessionsBeforeAuth = self->_sessionsBeforeAuth;
    }
    else {
      sessionsBeforeAuth = 0LL;
    }
    -[NSMutableSet removeObject:](sessionsBeforeAuth, "removeObject:", v4);
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[NEIKEv2Listener sessionFailedBeforeRequestingConfiguration:]";
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "%s called with null session", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)receivePacket:(id)a3 transport:(id)a4
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  v6 = a3;
  id v7 = a4;
  -[NEIKEv2Listener listenerQueue](self, "listenerQueue");
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!self || !self->_cancelled)
  {
    if (!v6 || (v6[11] & 1) == 0)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        v11 = "Listener received responder packet %@";
LABEL_41:
        _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
        goto LABEL_12;
      }

      goto LABEL_12;
    }

    if ((v6[10] & 1) != 0)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        v11 = "Listener received response packet %@";
        goto LABEL_41;
      }

      goto LABEL_12;
    }

    id v12 = objc_getProperty(v6, v9, 40LL, 1);
    uint64_t v13 = [v12 value];

    if (v13)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        v11 = "Listener received packet with non-zero responder SPI %@";
        goto LABEL_41;
      }

- (void)invalidatingTransport:(id)a3
{
  if (self) {
    self = (NEIKEv2Listener *)self->_connectionTransports;
  }
  -[NEIKEv2Listener removeObject:](self, "removeObject:", a3);
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = v21;
  if (!v15)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_1876B1000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }

  if (!v17)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }

  if (!v20)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null delegate";
    goto LABEL_18;
  }

  if (!v21)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }

  if (!v18)
  {
    ne_log_obj();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delega"
            "te:delegateQueue:]";
      v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }

  if (!v16)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }

  if (!v18)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null delegate";
    goto LABEL_15;
  }

  if (!v19)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      BOOL v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }

  if (!v16)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }

  if (!v18)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null delegate";
    goto LABEL_15;
  }

  if (!v19)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      BOOL v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = v21;
  if (!v15)
  {
    ne_log_obj();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_1876B1000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }

  if (!v17)
  {
    ne_log_obj();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }

  if (!v20)
  {
    ne_log_obj();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null delegate";
    goto LABEL_18;
  }

  if (!v21)
  {
    ne_log_obj();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }

  if (!v18)
  {
    ne_log_obj();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQu"
            "eue:delegate:delegateQueue:]";
      v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }

  if (!v16)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }

  if (!v18)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null delegate";
    goto LABEL_15;
  }

  if (!v19)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      BOOL v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 includeP2P:(BOOL)a9
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = v20;
  if (!v15)
  {
    ne_log_obj();
    BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v24, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_16;
  }

  if (!v17)
  {
    ne_log_obj();
    BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }

  if (!v19)
  {
    ne_log_obj();
    BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null delegate";
    goto LABEL_15;
  }

  if (!v20)
  {
    ne_log_obj();
    BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:deleg"
            "ateQueue:includeP2P:]";
      int v25 = "%s called with null delegateQueue";
      goto LABEL_15;
    }

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }

  if (!v16)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }

  if (!v18)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    BOOL v24 = "%s called with null delegate";
    goto LABEL_15;
  }

  if (!v19)
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      BOOL v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2Listener;
  -[NEIKEv2Listener dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling IKE listener", buf, 2u);
  }

  if (self)
  {
    self->_cancelled = 1;
    listener = self->_listener;
    if (listener)
    {
      nw_listener_cancel(listener);
      objc_storeStrong((id *)&self->_listener, 0LL);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    sessionsBeforeAuth = self->_sessionsBeforeAuth;
  }

  else
  {
    sessionsBeforeAuth = 0LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
  }

  v6 = sessionsBeforeAuth;
  uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v10++) invalidate];
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
    }

    while (v8);
  }

  if (self)
  {
    -[NSMutableSet removeAllObjects](self->_sessionsBeforeAuth, "removeAllObjects");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    connectionTransports = self->_connectionTransports;
  }

  else
  {
    [0 removeAllObjects];
    connectionTransports = 0LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
  }

  id v12 = connectionTransports;
  uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v26,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]( *(void *)(*((void *)&v17 + 1) + 8 * v16++),  0LL,  0);
      }

      while (v14 != v16);
      uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v26,  16LL);
    }

    while (v14);
  }

  if (self)
  {
    -[NSMutableSet removeAllObjects](self->_connectionTransports, "removeAllObjects", (void)v17);
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]((uint64_t)self->_packetDelegateTransport, 0LL, 0);
    objc_storeStrong((id *)&self->_packetDelegateTransport, 0LL);
  }

  else
  {
    objc_msgSend(0, "removeAllObjects", (void)v17);
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](0LL, 0LL, 0);
  }

- (OS_dispatch_queue)listenerQueue
{
  return self->_listenerQueue;
}

- (void).cxx_destruct
{
}

- (id)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 packetDelegate:(void *)a6 listenerQueue:(void *)a7 delegate:(void *)a8 delegateQueue:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v49 = a8;
  if (a1)
  {
    v51.receiver = a1;
    v51.super_class = (Class)&OBJC_CLASS___NEIKEv2Listener;
    id v21 = objc_msgSendSuper2(&v51, sel_init);
    if (v21)
    {
      uint64_t v22 = (uint64_t)v21;
      id v48 = v17;
      id v23 = v16;
      id v24 = objc_alloc_init(MEMORY[0x189603FE0]);
      int v25 = *(void **)(v22 + 56);
      *(void *)(v22 + 56) = v24;

      id v26 = objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v27 = *(void **)(v22 + 64);
      *(void *)(v22 + 64) = v26;

      uint64_t v28 = [v15 copy];
      uint64_t v29 = *(void **)(v22 + 24);
      *(void *)(v22 + 24) = v28;

      [*(id *)(v22 + 24) setServerMode:1];
      objc_storeStrong((id *)(v22 + 32), a3);
      objc_storeStrong((id *)(v22 + 40), a4);
      if (v19)
      {
        id v30 = v19;
        id v31 = *(dispatch_queue_attr_s **)(v22 + 16);
        *(void *)(v22 + 16) = v30;
      }

      else
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        id v31 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v32 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v31);
        id v33 = *(void **)(v22 + 16);
        *(void *)(v22 + 16) = v32;
      }

      objc_storeWeak((id *)(v22 + 80), v20);
      objc_storeStrong((id *)(v22 + 88), a8);
      objc_storeWeak((id *)(v22 + 96), v18);
      [v15 localEndpoint];
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0) {
        [v15 localEndpoint];
      }
      else {
        [MEMORY[0x189608DE8] endpointWithHostname:@"::" port:@"500"];
      }
      id v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 remoteEndpoint];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v38 = objc_opt_isKindOfClass();

      if ((v38 & 1) != 0) {
        [v15 remoteEndpoint];
      }
      else {
        [MEMORY[0x189608DE8] endpointWithHostname:@"::1" port:@"500"];
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v22 listenerQueue];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      id v41 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]( (uint64_t)&OBJC_CLASS___NEIKEv2Transport,  0LL,  v39,  v36,  0,  0LL,  v40,  0LL,  v18);
      v42 = *(void **)(v22 + 72);
      *(void *)(v22 + 72) = v41;

      uint64_t v43 = *(void *)(v22 + 72);
      if (v43)
      {
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](v43, (void *)v22, 1);
        id v44 = (id)v22;
        id v16 = v23;
      }

      else
      {
        ne_log_obj();
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v16 = v23;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( &dword_1876B1000,  v45,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Transport createTransport] failed",  buf,  2u);
        }

        id v44 = 0LL;
      }

      id v17 = v48;
    }

    else
    {
      uint64_t v22 = ne_log_obj();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v22, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
      }

      id v44 = 0LL;
    }

    v46 = v49;
  }

  else
  {
    id v44 = 0LL;
    v46 = v49;
  }

  return v44;
}

- (id)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 listenerUDPPort:(void *)a6 listenerInterface:(void *)a7 listenerQueue:(void *)a8 delegate:(void *)a9 delegateQueue:(char)a10 includeP2P:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v17 = a2;
  id v18 = a3;
  id v53 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v52 = a9;
  if (!a1)
  {
    id v24 = 0LL;
    id v48 = v52;
    int v25 = v53;
    goto LABEL_22;
  }

  if ((unint64_t)([v19 longLongValue] - 0x10000) > 0xFFFFFFFFFFFF0000)
  {
    v54.receiver = a1;
    v54.super_class = (Class)&OBJC_CLASS___NEIKEv2Listener;
    id v26 = objc_msgSendSuper2(&v54, sel_init);
    if (v26)
    {
      uint64_t v27 = (uint64_t)v26;
      id obj = v22;
      id v28 = objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v29 = *(void **)(v27 + 56);
      *(void *)(v27 + 56) = v28;

      uint64_t v30 = [v17 copy];
      id v31 = *(void **)(v27 + 24);
      *(void *)(v27 + 24) = v30;

      [*(id *)(v27 + 24) setServerMode:1];
      objc_storeStrong((id *)(v27 + 32), a3);
      objc_storeStrong((id *)(v27 + 40), a4);
      if (v21)
      {
        id v32 = v21;
        id v33 = *(dispatch_queue_attr_s **)(v27 + 16);
        *(void *)(v27 + 16) = v32;
      }

      else
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        id v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v34 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v33);
        v35 = *(void **)(v27 + 16);
        *(void *)(v27 + 16) = v34;
      }

      objc_storeWeak((id *)(v27 + 80), v22);
      objc_storeStrong((id *)(v27 + 88), a9);
      legacy_tcp_socket = (nw_parameters *)nw_parameters_create_legacy_tcp_socket();
      uint64_t v37 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
      options = nw_udp_create_options();
      nw_protocol_stack_set_transport_protocol(v37, options);

      nw_parameters_set_data_mode();
      host = nw_endpoint_create_host("::", (const char *)[v19 UTF8String]);
      nw_parameters_set_local_endpoint(legacy_tcp_socket, host);
      if (a10) {
        nw_parameters_set_use_awdl();
      }
      if (v20)
      {
        id v40 = v18;
        [v20 UTF8String];
        id v41 = (nw_interface *)nw_interface_create_with_name();
        if (v41) {
          nw_parameters_require_interface(legacy_tcp_socket, v41);
        }

        id v18 = v40;
      }

      if ([v17 forceUDPEncapsulation] && v37)
      {
        id v50 = v19;
        id v42 = v21;
        id v43 = v20;
        id v44 = v17;
        id v45 = v18;
        v46 = (nw_protocol_definition *)NEIKEv2TransportCopyNATTFramerDefinition();
        id v47 = nw_framer_create_options(v46);
        nw_protocol_stack_prepend_application_protocol(v37, v47);

        id v18 = v45;
        id v17 = v44;
        id v20 = v43;
        id v21 = v42;
        id v19 = v50;
      }

      -[NEIKEv2Listener createListenerWithParameters:attempt:](v27, legacy_tcp_socket, 0);
      a1 = (id)v27;

      id v24 = a1;
      int v25 = v53;
      id v22 = obj;
      goto LABEL_21;
    }

    ne_log_obj();
    a1 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v19;
      _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, "Invalid listenerUDPPort \"%@\"", buf, 0xCu);
    }
  }

  id v24 = 0LL;
  int v25 = v53;
LABEL_21:
  id v48 = v52;

LABEL_22:
  return v24;
}

- (void)createListenerWithParameters:(unsigned int)a3 attempt:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v5 = a2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if (a3 >= 5)
    {
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location) = 67109378;
        HIDWORD(location) = a3;
        __int16 v31 = 2112;
        id v32 = v5;
        _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "failed to create a listener after %u retries (parameters %@)",  (uint8_t *)&location,  0x12u);
      }

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[6] != *(void *)(a1 + 32) || (WeakRetained[1] & 1) != 0)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v7[6];
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        uint64_t v19 = v12;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "ignoring update for a stale listener %p != %p",  buf,  0x16u);
      }

      nw_listener_cancel(*(nw_listener_t *)(a1 + 32));
    }

    else if (a2 == 3 && nw_error_get_error_code(v5) == 48)
    {
      dispatch_time_t v8 = dispatch_time(0x8000000000000000LL, 200000000LL * *(unsigned __int8 *)(a1 + 56) + 200000000);
      [v7 listenerQueue];
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2;
      block[3] = &unk_18A08D348;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      id v15 = *(id *)(a1 + 40);
      char v17 = *(_BYTE *)(a1 + 56);
      dispatch_after(v8, v9, block);

      objc_destroyWeak(&v16);
    }
  }

  else
  {
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = a2;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "IKE listener released, ignoring state change to %d",  buf,  8u);
    }
  }
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  objc_super v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    uint64_t v12 = "IKE listener released, cancelling connection %@";
LABEL_51:
    uint64_t v13 = v9;
    uint32_t v14 = 12;
    goto LABEL_52;
  }

  uint64_t v6 = WeakRetained[6];
  uint64_t v7 = *(void *)(a1 + 32);
  ne_log_obj();
  dispatch_time_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *((void *)v5 + 6);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v11;
      uint64_t v12 = "ignoring new connection for a stale listener %p != %p";
      uint64_t v13 = v9;
      uint32_t v14 = 22;
LABEL_52:
      _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    -[NEIKEv2Listener createListenerWithParameters:attempt:]( WeakRetained,  *(void *)(a1 + 32),  (*(_BYTE *)(a1 + 48) + 1));
  }

  else
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "IKE listener released, not setting up listener",  v5,  2u);
    }
  }
}

void __43__NEIKEv2Listener_receivePacket_transport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    char v4 = objc_opt_respondsToSelector();
    objc_super v3 = v5;
    if ((v4 & 1) != 0)
    {
      [v5 listener:*(void *)(a1 + 32) receivedNewSession:*(void *)(a1 + 40)];
      objc_super v3 = v5;
    }
  }
}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2;
  v8[3] = &unk_18A08D2F8;
  v8[4] = v3;
  id v10 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 48);
  [v2 requestConfigurationForListener:v3 session:v4 sessionConfig:v5 childConfig:v6 validateAuthBlock:v7 responseBlock:v8];
}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  [v7 listenerQueue];
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = *(void *)(a1 + 48);
  id v13 = (id)[v9 copy];

  uint64_t v12 = (void *)[v8 copy];
  (*(void (**)(uint64_t, id, void *, uint64_t))(v11 + 16))(v11, v13, v12, a4);
}

@end