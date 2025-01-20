@interface NEIKEv2Transport
+ (__CFString)stringForTransport:(uint64_t)a1;
+ (id)createTransport:(void *)a3 remote:(void *)a4 local:(unsigned int)a5 localPort:(void *)a6 boundInterface:(void *)a7 queue:(void *)a8 socketGetBlock:(void *)a9 packetDelegate:;
- (NEIKEv2Transport)init;
- (NSString)description;
- (uint64_t)sendData:(void *)a3 sendCompletionHandler:;
- (void)addClient:(void *)a3 delegate:;
- (void)callConnectedBlocks;
- (void)cancelClient:(int)a3 shouldInvalidate:;
- (void)cancelInvalidationTimer;
- (void)dealloc;
- (void)handleConnectionEventWithState:(void *)a3 error:;
- (void)invalidate;
- (void)port;
- (void)readOnConnection;
- (void)receivePacket:(id *)a1;
- (void)receivePacketData:(id)a3;
- (void)reportConnectionError:(void *)a1;
- (void)setRemoteSPI:(void *)a3 forClient:;
- (void)setWildcardDelegate:(char)a3 preventsInvalidation:;
- (void)startInvalidationTimer;
- (void)waitForTransport:(uint64_t)a1;
@end

@implementation NEIKEv2Transport

- (NEIKEv2Transport)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2Transport;
  v2 = -[NEIKEv2Transport init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "deallocating %@", buf, 0xCu);
  }

  if (self)
  {
    self->_cancelled = 1;
    objc_storeWeak((id *)&self->_packetDelegate, 0LL);
    if (objc_getProperty(self, v4, 56LL, 1))
    {
      Property = (nw_connection *)objc_getProperty(self, v5, 56LL, 1);
      nw_connection_cancel(Property);
      objc_setProperty_atomic(self, v7, 0LL, 56LL);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2Transport;
  -[NEIKEv2Transport dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    +[NEIKEv2Transport stringForTransport:]((uint64_t)&OBJC_CLASS___NEIKEv2Transport, self->_transportType);
    SEL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_packetDelegate);
    if (WeakRetained) {
      SEL v7 = " PacketDelegate";
    }
    else {
      SEL v7 = "";
    }
    id v8 = objc_getProperty(self, v5, 16LL, 1);
    id v10 = objc_getProperty(self, v9, 24LL, 1);
    if (self->_cancelled) {
      uint64_t v11 = " (Closed)";
    }
    else {
      uint64_t v11 = "";
    }
  }

  else
  {
    objc_opt_self();
    id v8 = 0LL;
    id WeakRetained = 0LL;
    id v10 = 0LL;
    SEL v7 = "";
    SEL v4 = @"UDP";
    uint64_t v11 = "";
  }

  v12 = (void *)[v3 initWithFormat:@"<NEIKEv2Transport> %@%s %@ -> %@%s", v4, v7, v8, v10, v11];

  return (NSString *)v12;
}

- (void)receivePacketData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data";
    goto LABEL_15;
  }

  if (![v4 length])
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data.length";
    goto LABEL_15;
  }

  if (!self) {
    goto LABEL_16;
  }
  if (self->_cancelled)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    LOWORD(v16) = 0;
    v13 = "Transport cancelled, ignoring";
LABEL_12:
    _os_log_debug_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 2u);
    goto LABEL_17;
  }

  if (!objc_msgSend(objc_getProperty(self, v6, 80, 1), "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wildcardDelegate);

    if (!WeakRetained)
    {
LABEL_16:
      ne_log_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v16) = 0;
      v13 = "Transport has no clients, ignoring";
      goto LABEL_12;
    }
  }

  if (!objc_getProperty(self, v7, 72LL, 1))
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null self.receiveQueue";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v16, 0xCu);
    goto LABEL_17;
  }

  Property = (dispatch_queue_s *)objc_getProperty(self, v9, 72LL, 1);
  dispatch_assert_queue_V2(Property);
  uint64_t v11 = (os_log_s *)+[NEIKEv2Packet createPacketFromReceivedData:]((uint64_t)&OBJC_CLASS___NEIKEv2Packet, v5);
  if (v11)
  {
    v12 = v11;
    -[NEIKEv2Transport receivePacket:]((id *)&self->super.isa, v11);
  }

  else
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Packet packetFromReceivedData] failed",  (uint8_t *)&v16,  2u);
    }

    v12 = 0LL;
  }

- (void).cxx_destruct
{
}

- (void)receivePacket:(id *)a1
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v5 = (id)objc_msgSend(objc_getProperty(a1, v3, 80, 1), "copy");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      v30 = a1;
      id v31 = v5;
      char v32 = 0;
      uint64_t v9 = *(void *)v34;
      while (1)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(id **)(*((void *)&v33 + 1) + 8 * v10);
          if (v11) {
            id Property = objc_getProperty(*(id *)(*((void *)&v33 + 1) + 8 * v10), v7, 8LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v14 = Property;
          if ((v4[11] & 1) != 0) {
            ptrdiff_t v15 = 40LL;
          }
          else {
            ptrdiff_t v15 = 32LL;
          }
          id v16 = objc_getProperty(v4, v13, v15, 1);
          int v17 = [v14 isEqual:v16];

          if (v17)
          {

            if (!v11) {
              goto LABEL_26;
            }
LABEL_14:
            id WeakRetained = objc_loadWeakRetained(v11 + 3);
            if (!WeakRetained) {
              goto LABEL_26;
            }
            id v16 = WeakRetained;
            [WeakRetained receivePacket:v4];
            char v32 = 1;
LABEL_25:

            goto LABEL_26;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          if (v11) {
            id v20 = objc_getProperty(v11, v19, 16LL, 1);
          }
          else {
            id v20 = 0LL;
          }
          id v22 = v20;
          if ((v4[11] & 1) != 0) {
            ptrdiff_t v23 = 32LL;
          }
          else {
            ptrdiff_t v23 = 40LL;
          }
          id v24 = objc_getProperty(v4, v21, v23, 1);
          int v25 = [v22 isEqual:v24];

          if (v25)
          {
            id v5 = v31;
            if (v11) {
              goto LABEL_14;
            }
          }

          else
          {
            id v5 = v31;
          }

+ (__CFString)stringForTransport:(uint64_t)a1
{
  if (a2 >= 4) {
    id v3 = (__CFString *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"Unknown (%u)", a2);
  }
  else {
    id v3 = off_18A08DBE8[a2];
  }
  return v3;
}

- (void)startInvalidationTimer
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NEIKEv2Transport cancelInvalidationTimer](a1, a2);
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 72LL, 1);
  id v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, Property);
  dispatch_time_t v6 = dispatch_time(0x8000000000000000LL, 5000000000LL);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, a1);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __42__NEIKEv2Transport_startInvalidationTimer__block_invoke;
  handler[3] = &unk_18A08DB50;
  objc_copyWeak(&v12, &location);
  SEL v7 = v5;
  uint64_t v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  objc_setProperty_atomic(a1, v8, v7, 96LL);
  dispatch_activate(v7);
  ne_log_obj();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    ptrdiff_t v15 = a1;
    _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_INFO, "%@ started invalidation timer", buf, 0xCu);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)cancelInvalidationTimer
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (objc_getProperty(a1, a2, 96LL, 1))
  {
    id Property = (dispatch_source_s *)objc_getProperty(a1, v3, 96LL, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v5, 0LL, 96LL);
    ne_log_obj();
    dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      SEL v8 = a1;
      _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "%@ cancelled invalidation timer", (uint8_t *)&v7, 0xCu);
    }
  }

void __42__NEIKEv2Transport_startInvalidationTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained
    && (WeakRetained[9] & 1) == 0
    && !objc_msgSend(objc_getProperty(WeakRetained, v3, 80, 1), "count")
    && objc_getProperty(v4, v5, 96LL, 1) == *(id *)(a1 + 32))
  {
    ne_log_obj();
    dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ has no clients after 5s, invalidating",  (uint8_t *)&v8,  0xCu);
    }

    -[NEIKEv2Transport invalidate]((uint64_t)v4, v7);
  }
}

- (void)invalidate
{
  if (objc_getProperty((id)a1, a2, 56LL, 1))
  {
    id Property = (nw_connection *)objc_getProperty((id)a1, v3, 56LL, 1);
    nw_connection_cancel(Property);
    objc_setProperty_atomic((id)a1, v5, 0LL, 56LL);
  }

  *(_BYTE *)(a1 + 9) = 1;
  objc_storeWeak((id *)(a1 + 48), 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained invalidatingTransport:a1];

  objc_storeWeak((id *)(a1 + 88), 0LL);
  -[NEIKEv2Transport cancelInvalidationTimer]((void *)a1, v7);
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  [(id)g_transports removeObject:a1];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
}

- (void)addClient:(void *)a3 delegate:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  dispatch_time_t v6 = a3;
  if (a1)
  {
    if (v5)
    {
      ne_log_obj();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      p_isa = (id *)v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412802;
          v19 = v6;
          __int16 v20 = 2112;
          id v21 = v5;
          __int16 v22 = 2112;
          ptrdiff_t v23 = a1;
          _os_log_impl( &dword_1876B1000,  (os_log_t)p_isa,  OS_LOG_TYPE_DEFAULT,  "NEIKEv2Transport: Adding client %@ with SPI %@ on %@",  (uint8_t *)&v18,  0x20u);
        }

        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NEIKEv2TransportClient);
        if (v9)
        {
          p_isa = (id *)&v9->super.isa;
          objc_setProperty_atomic(v9, v10, v5, 8LL);
          objc_storeWeak(p_isa + 3, v6);
          if (!objc_getProperty(a1, v11, 80LL, 1))
          {
            id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
            objc_setProperty_atomic(a1, v14, v13, 80LL);
          }

          objc_msgSend(objc_getProperty(a1, v12, 80, 1), "addObject:", p_isa);
          -[NEIKEv2Transport cancelInvalidationTimer](a1, v15);
        }

        else
        {
          ne_log_obj();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v18) = 0;
            _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2TransportClient alloc] init] failed",  (uint8_t *)&v18,  2u);
          }

          p_isa = 0LL;
        }

        goto LABEL_13;
      }

      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        int v17 = "%s called with null delegate";
        goto LABEL_19;
      }
    }

    else
    {
      ne_log_obj();
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)p_isa, OS_LOG_TYPE_FAULT))
      {
        int v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        int v17 = "%s called with null clientSPI";
LABEL_19:
        _os_log_fault_impl(&dword_1876B1000, (os_log_t)p_isa, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
      }
    }

- (void)setWildcardDelegate:(char)a3 preventsInvalidation:
{
  id v5 = a2;
  if (a1)
  {
    int v8 = v5;
    objc_storeWeak((id *)(a1 + 88), v5);
    *(_BYTE *)(a1 + 10) = a3;
    uint64_t v7 = objc_msgSend(objc_getProperty((id)a1, v6, 80, 1), "count");
    id v5 = (char *)v8;
    if (!v7)
    {
      if (v8)
      {
        if ((a3 & 1) != 0) {
          -[NEIKEv2Transport cancelInvalidationTimer]((void *)a1, v8);
        }
        else {
          -[NEIKEv2Transport startInvalidationTimer]((void *)a1, v8);
        }
      }

      else
      {
        -[NEIKEv2Transport invalidate](a1, 0LL);
      }

      id v5 = (char *)v8;
    }
  }
}

- (void)setRemoteSPI:(void *)a3 forClient:
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = objc_getProperty(a1, v6, 80LL, 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    while (1)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        SEL v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if (v14)
        {
          if (!objc_msgSend( objc_getProperty(*(id *)(*((void *)&v17 + 1) + 8 * v13), v10, 8, 1),  "isEqual:",  v7)
            || objc_getProperty(v14, v10, 16LL, 1))
          {
            goto LABEL_14;
          }

          objc_setProperty_atomic(v14, v10, v5, 16LL);
        }

        else if (([0 isEqual:v7] & 1) == 0)
        {
          goto LABEL_14;
        }

        ne_log_obj();
        ptrdiff_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v22 = v14;
          __int16 v23 = 2112;
          uint64_t v24 = a1;
          _os_log_impl(&dword_1876B1000, v15, OS_LOG_TYPE_DEFAULT, "Set remote SPI for client %@ on %@", buf, 0x16u);
        }

LABEL_14:
        ++v13;
      }

      while (v11 != v13);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v11 = v16;
      if (!v16)
      {
LABEL_19:

        break;
      }
    }
  }
}

- (void)cancelClient:(int)a3 shouldInvalidate:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  if (a1)
  {
    if (a3) {
      -[NEIKEv2Transport invalidate](a1, v5);
    }
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "";
      *(_DWORD *)buf = 136315650;
      if (a3) {
        id v8 = " and invalidating";
      }
      uint64_t v33 = (uint64_t)v8;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v6;
      __int16 v36 = 2112;
      uint64_t v37 = a1;
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling%s client %@ for %@", buf, 0x20u);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = objc_getProperty((id)a1, v9, 80LL, 1);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
          if (v16) {
            id Property = objc_getProperty(*(id *)(*((void *)&v27 + 1) + 8 * v15), v12, 8LL, 1);
          }
          else {
            id Property = 0LL;
          }
          if (objc_msgSend(Property, "isEqual:", v6, (void)v27))
          {
            ne_log_obj();
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v33 = (uint64_t)v16;
              __int16 v34 = 2112;
              uint64_t v35 = a1;
              _os_log_impl(&dword_1876B1000, v20, OS_LOG_TYPE_INFO, "Removing client %@ for %@", buf, 0x16u);
            }

            id v21 = v16;
            if (v16)
            {
              objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "removeObject:", v21);
              goto LABEL_26;
            }

            goto LABEL_25;
          }

          ++v15;
        }

        while (v13 != v15);
        uint64_t v18 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        uint64_t v13 = v18;
        if (v18) {
          continue;
        }
        break;
      }
    }

LABEL_25:
    id v21 = 0LL;
LABEL_26:
    if ((*(_BYTE *)(a1 + 9) & 1) == 0 && !objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "count"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));

      if (WeakRetained)
      {
        if ((*(_BYTE *)(a1 + 10) & 1) == 0)
        {
          ne_log_obj();
          __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = a1;
            _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ out of clients, starting invalidation timer",  buf,  0xCu);
          }

          -[NEIKEv2Transport startInvalidationTimer]((void *)a1, v24);
        }
      }

      else
      {
        ne_log_obj();
        int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = a1;
          _os_log_impl(&dword_1876B1000, v25, OS_LOG_TYPE_DEFAULT, "%@ out of clients, invalidating", buf, 0xCu);
        }

        -[NEIKEv2Transport invalidate](a1, v26);
      }
    }
  }
}

- (void)port
{
  if (result)
  {
    v2 = result;
    result = (void *)objc_msgSend(objc_getProperty(result, a2, 16, 1), "address");
    if (result) {
      return (void *)(bswap32(*(unsigned __int16 *)(objc_msgSend(objc_getProperty(v2, v3, 16, 1), "address") + 2)) >> 16);
    }
  }

  return result;
}

- (void)readOnConnection
{
  if (self)
  {
    if ((*((_BYTE *)self + 9) & 1) != 0)
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      SEL v9 = "Transport cancelled, ignoring";
    }

    else
    {
      if (objc_getProperty(self, a2, 56LL, 1))
      {
        if (objc_msgSend(objc_getProperty(self, v3, 80, 1), "count")
          || (id WeakRetained = objc_loadWeakRetained(self + 11), WeakRetained, WeakRetained))
        {
          os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
          char v5 = [(id)g_transports containsObject:self];
          os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
          if ((v5 & 1) != 0)
          {
            id Property = (nw_connection *)objc_getProperty(self, v6, 56LL, 1);
            completion[0] = MEMORY[0x1895F87A8];
            completion[1] = 3221225472LL;
            completion[2] = __36__NEIKEv2Transport_readOnConnection__block_invoke;
            completion[3] = &unk_18A08DB78;
            completion[4] = self;
            nw_connection_receive_message(Property, completion);
            return;
          }

          ne_log_obj();
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_17;
          }
          *(_WORD *)buf = 0;
          SEL v9 = "Transport not found in list, ignoring";
          goto LABEL_16;
        }

        ne_log_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          SEL v9 = "Transport has no clients, ignoring";
          goto LABEL_16;
        }

void __36__NEIKEv2Transport_readOnConnection__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = a5;
  if (v11)
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, "Connection receive error %@ for %@", buf, 0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v11);
    if (nw_error_get_error_code(v11) == 89) {
      goto LABEL_23;
    }
LABEL_22:
    -[NEIKEv2Transport readOnConnection](*(id *)(a1 + 32));
    goto LABEL_23;
  }

  if (!v9 || !a4) {
    goto LABEL_22;
  }
  id v13 = v9;
  if ([v13 length] == 1)
  {
    LOBYTE(v22[0]) = 0;
    [v13 getBytes:v22 length:1];
    if (LOBYTE(v22[0]) == 255)
    {
      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_INFO, "Ignoring keepalive packet", buf, 2u);
      }

      goto LABEL_21;
    }
  }

  memset(buf, 0, sizeof(buf));
  unsigned int v26 = 0;
  if ((unint64_t)[v13 length] <= 0x1B)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v13 length];
      v22[0] = 67109376;
      v22[1] = v15;
      __int16 v23 = 1024;
      int v24 = 28;
      uint64_t v16 = "Packet shorter than header size (size: %u, minimum expected: %u)";
      __int128 v17 = v14;
      uint32_t v18 = 14;
LABEL_16:
      _os_log_error_impl(&dword_1876B1000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v22, v18);
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  [v13 getBytes:buf length:28];
  if (bswap32(v26) >= 0x10000)
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22[0]) = 0;
      uint64_t v16 = "The length in the IKE header is too big";
      __int128 v17 = v14;
      uint32_t v18 = 2;
      goto LABEL_16;
    }

- (void)reportConnectionError:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t error_code = nw_error_get_error_code(error);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = (id)objc_msgSend(objc_getProperty(a1, v4, 80, 1), "copy");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
          if (v10)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v10 + 24));
            if (WeakRetained)
            {
              uint64_t v12 = WeakRetained;
              objc_msgSend(WeakRetained, "reportError:", error_code, (void)v13);
            }
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }
  }

- (void)callConnectedBlocks
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v1 = *(void **)(a1 + 64);
  if (v1)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16LL))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 64), "removeAllObjects", (void)v9);
    uint64_t v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0LL;
  }

void __56__NEIKEv2Transport_createTransportWithConnection_queue___block_invoke(uint64_t a1, int a2, void *a3)
{
}

- (void)handleConnectionEventWithState:(void *)a3 error:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a3;
  if (a1 && objc_getProperty(a1, v5, 56LL, 1))
  {
    if (a2 == 4)
    {
      a1[8] = 0;
      ne_log_obj();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412546;
        uint64_t v20 = v6;
        __int16 v21 = 2112;
        __int16 v22 = a1;
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "Connection failed with error %@ for %@",  (uint8_t *)&v19,  0x16u);
      }

      -[NEIKEv2Transport reportConnectionError:](a1, v6);
      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
    }

    else if (a2 == 3)
    {
      a1[8] = 1;
      objc_getProperty(a1, v7, 56LL, 1);
      uint64_t v8 = (nw_path *)nw_connection_copy_connected_path();
      __int128 v9 = v8;
      if (v8)
      {
        nw_endpoint_t v10 = nw_path_copy_effective_local_endpoint(v8);
        if (v10)
        {
          [MEMORY[0x189608DF0] endpointWithCEndpoint:v10];
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(a1, v12, v11, 16LL);
        }

        __int128 v13 = (nw_interface *)nw_path_copy_interface();
        if (v13)
        {
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189608E00]) initWithInterfaceIndex:nw_interface_get_index(v13)];
          objc_setProperty_atomic(a1, v15, v14, 32LL);
        }
      }

      ne_log_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = (nw_error *)a1;
        _os_log_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEFAULT, "Connection ready for %@", (uint8_t *)&v19, 0xCu);
      }

      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
      -[NEIKEv2Transport readOnConnection]((id *)a1, v17);
    }
  }
}

+ (id)createTransport:(void *)a3 remote:(void *)a4 local:(unsigned int)a5 localPort:(void *)a6 boundInterface:(void *)a7 queue:(void *)a8 socketGetBlock:(void *)a9 packetDelegate:
{
  uint64_t v194 = *MEMORY[0x1895F89C0];
  unint64_t v13 = a3;
  id v14 = a4;
  id v15 = a6;
  __int128 v16 = a7;
  id v17 = a8;
  unint64_t v18 = a9;
  objc_opt_self();
  ne_log_obj();
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  p_isa = (id *)v19;
  if (!(v13 | v18))
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v187 = 136315138;
      *(void *)v188 = "+[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]";
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)p_isa, OS_LOG_TYPE_FAULT, "%s called with null remote", v187, 0xCu);
    }

    goto LABEL_132;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v69 = +[NEIKEv2Transport stringForTransport:]((uint64_t)&OBJC_CLASS___NEIKEv2Transport, a2);
    *(_DWORD *)v187 = 138413314;
    *(void *)v188 = v69;
    *(_WORD *)&v188[8] = 2112;
    *(void *)&v188[10] = v14;
    *(_WORD *)&v188[18] = 1024;
    *(_DWORD *)&v188[20] = a5;
    *(_WORD *)&v188[24] = 2112;
    *(void *)&v188[26] = v13;
    __int16 v189 = 2112;
    id v190 = v15;
    _os_log_debug_impl( &dword_1876B1000,  (os_log_t)p_isa,  OS_LOG_TYPE_DEBUG,  "Creating %@ transport %@(%u) to %@ on \"%@\"",  v187,  0x30u);
  }

  id v175 = (id)v13;
  id v21 = v14;
  id v22 = v15;
  id v179 = (id)v18;
  objc_opt_self();
  if (!a5 && !v18)
  {
    id v23 = 0LL;
    goto LABEL_101;
  }

  v177 = v22;
  id v165 = v17;
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  memset(v183, 0, sizeof(v183));
  id v24 = (id)g_transports;
  uint64_t v25 = [v24 countByEnumeratingWithState:v183 objects:v187 count:16];
  if (!v25)
  {
    id v23 = 0LL;
    goto LABEL_100;
  }

  uint64_t v26 = v25;
  v157 = v16;
  id v158 = v14;
  uint64_t v27 = **(void **)&v183[1];
  unint64_t v28 = a2;
  id v162 = v24;
  v167 = v21;
LABEL_9:
  uint64_t v29 = 0LL;
  while (1)
  {
    if (**(void **)&v183[1] != v27) {
      objc_enumerationMutation(v24);
    }
    uint64_t v30 = *(void *)(*((void *)&v183[0] + 1) + 8 * v29);
    if (v30)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v30 + 48));
      if (v18)
      {
        char v32 = *(_BYTE *)(v30 + 9) & 1;
LABEL_15:
        if ((v32 & 1) == 0 && WeakRetained == v179) {
          goto LABEL_98;
        }
        goto LABEL_79;
      }

      if ((*(_BYTE *)(v30 + 9) & 1) != 0 || WeakRetained) {
        goto LABEL_79;
      }
      uint64_t v33 = *(void *)(v30 + 40);
    }

    else
    {
      if (v18)
      {
        id WeakRetained = 0LL;
        char v32 = 0;
        unint64_t v28 = a2;
        id v24 = v162;
        goto LABEL_15;
      }

      uint64_t v33 = 0LL;
      unint64_t v18 = 0LL;
      unint64_t v28 = a2;
      id v24 = v162;
    }

    if (v33 != v28)
    {
      id WeakRetained = 0LL;
      goto LABEL_79;
    }

    uint64_t v35 = [v177 length];
    if (v35)
    {
      id v36 = v30 ? objc_getProperty((id)v30, v34, 32LL, 1) : 0LL;
      id v170 = v36;
      [v170 interfaceName];
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v177, "isEqualToString:"))
      {
        id v46 = v168;
        v47 = v170;
        goto LABEL_77;
      }
    }

    if (!v13) {
      break;
    }
    unint64_t v37 = v13;
    id v38 = v15;
    if (v30) {
      id Property = objc_getProperty((id)v30, v34, 24LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v40 = Property;
    v163 = v40;
    if ([v175 isEqual:v40])
    {
      unsigned int v42 = -[NEIKEv2Transport port]((void *)v30, v41);
      id v44 = v21;
      int v45 = v42 == a5;
      id v15 = v38;
      unint64_t v13 = v37;
      if (v44)
      {
        id v24 = v162;
        if (v42 == a5)
        {
LABEL_37:
          if (v30) {
            id v50 = objc_getProperty((id)v30, v43, 16LL, 1);
          }
          else {
            id v50 = 0LL;
          }
          int v45 = [v167 isEqual:v50];
          if (!v13) {
            goto LABEL_40;
          }
        }
      }

      else
      {
        id v24 = v162;
      }

      if (!v35) {
        goto LABEL_71;
      }
LABEL_41:

      if ((v45 & 1) == 0) {
        goto LABEL_72;
      }
      goto LABEL_42;
    }

    if (v35)
    {
      id v46 = v168;
      v47 = v170;
      id v15 = v38;
      unint64_t v13 = v37;
      id v24 = v162;
LABEL_77:

      id WeakRetained = 0LL;
      goto LABEL_78;
    }

    id WeakRetained = 0LL;
    unint64_t v28 = a2;
    id v15 = v38;
    unint64_t v13 = v37;
    id v24 = v162;
LABEL_79:

    if (++v29 == v26)
    {
      uint64_t v68 = [v24 countByEnumeratingWithState:v183 objects:v187 count:16];
      uint64_t v26 = v68;
      if (!v68)
      {
        id v23 = 0LL;
        goto LABEL_99;
      }

      goto LABEL_9;
    }
  }

  unsigned int v48 = -[NEIKEv2Transport port]((void *)v30, v34);
  id v49 = v21;
  int v45 = v48 == a5;
  if (v49 && v48 == a5) {
    goto LABEL_37;
  }
LABEL_40:
  if (v35) {
    goto LABEL_41;
  }
LABEL_71:
  if (!v45)
  {
LABEL_72:
    id WeakRetained = 0LL;
    id v21 = v167;
LABEL_78:
    unint64_t v28 = a2;
    goto LABEL_79;
  }

void __110__NEIKEv2Transport_createTransport_remote_local_localPort_boundInterface_queue_socketGetBlock_packetDelegate___block_invoke( uint64_t a1,  int a2,  void *a3)
{
}

- (void)waitForTransport:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    aBlock = v3;
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    {
      v3[2](v3);
    }

    else
    {
      uint64_t v4 = *(void **)(a1 + 64);
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v6 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v5;

        uint64_t v4 = *(void **)(a1 + 64);
      }

      id v7 = v4;
      uint64_t v8 = _Block_copy(aBlock);
      [v7 addObject:v8];
    }

    id v3 = (void (**)(void))aBlock;
  }
}

- (uint64_t)sendData:(void *)a3 sendCompletionHandler:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  if (![v5 length])
  {
    ne_log_obj();
    nw_endpoint_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v34 = "-[NEIKEv2Transport sendData:sendCompletionHandler:]";
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null data.length", buf, 0xCu);
    }

    goto LABEL_19;
  }

  id WeakRetained = objc_loadWeakRetained(a1 + 6);

  if (!WeakRetained)
  {
    if (objc_getProperty(a1, v8, 56LL, 1))
    {
      uint64_t v12 = 1LL;
      __int128 v16 = (nw_connection *)objc_getProperty(a1, v15, 56LL, 1);
      id v17 = (dispatch_data_s *)[v5 _createDispatchData];
      unint64_t v18 = (nw_content_context *)*MEMORY[0x189608E88];
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4;
      v24[3] = &unk_18A08DBC8;
      v24[4] = a1;
      uint64_t v25 = (os_log_s *)v6;
      nw_connection_send(v16, v17, v18, 1, v24);

      nw_endpoint_t v10 = v25;
      goto LABEL_14;
    }

    if (v6)
    {
      id Property = (dispatch_queue_s *)objc_getProperty(a1, v15, 72LL, 1);
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3;
      v26[3] = &unk_18A090940;
      uint64_t v27 = (os_log_s *)v6;
      dispatch_async(Property, v26);
      uint64_t v12 = 0LL;
      nw_endpoint_t v10 = v27;
      goto LABEL_14;
    }

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0LL);
  }
  if (v3)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Connection send error %@ for %@",  (uint8_t *)&v7,  0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v3);
  }
}

@end