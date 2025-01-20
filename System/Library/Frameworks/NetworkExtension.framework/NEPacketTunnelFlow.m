@interface NEPacketTunnelFlow
- (BOOL)writePacketObjects:(NSArray *)packets;
- (BOOL)writePackets:(NSArray *)packets withProtocols:(NSArray *)protocols;
- (NSFileHandle)socket;
- (void)closeVirtualInterface;
- (void)dealloc;
- (void)readPacketObjectsWithCompletionHandler:(void *)completionHandler;
- (void)readPacketsWithCompletionHandler:(void *)completionHandler;
- (void)setSocket:(id)a3;
@end

@implementation NEPacketTunnelFlow

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEPacketTunnelFlow;
  -[NEPacketTunnelFlow dealloc](&v3, sel_dealloc);
}

- (void)readPacketsWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    if (!objc_getProperty(v5, v6, 96LL, 1))
    {
      objc_setProperty_atomic_copy(v5, v7, v4, 96LL);
      uint64_t interface = (uint64_t)v5->_interface;
      if (interface)
      {
        if (!v5->_handlerSetup)
        {
          objc_initWeak(&location, v5);
          v9 = v5->_interface;
          if (v9)
          {
            *((_BYTE *)v9 + 73) = 0;
            v10 = v5->_interface;
          }

          else
          {
            v10 = 0LL;
          }

          v13[0] = MEMORY[0x1895F87A8];
          v13[1] = 3221225472LL;
          v13[2] = __55__NEPacketTunnelFlow_readPacketsWithCompletionHandler___block_invoke;
          v13[3] = &unk_18A08E820;
          objc_copyWeak(&v14, &location);
          v13[4] = v5;
          if (NEVirtualInterfaceSetReadMultipleIPPacketsHandler(v10, v13))
          {
            v5->_handlerSetup = 1;
          }

          else
          {
            ne_log_obj();
            v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v12 = 0;
              _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to set the multiple packet read handler",  v12,  2u);
            }
          }

          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
          uint64_t interface = (uint64_t)v5->_interface;
        }

        NEVirtualInterfaceReadyToReadMultiple(interface, 0x40u);
      }
    }
  }

  objc_sync_exit(v5);
}

- (void)readPacketObjectsWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    id v7 = objc_getProperty(v5, v6, 32LL, 1);
    if (v7)
    {
    }

    else if (v5->_interface)
    {
      objc_setProperty_atomic_copy(v5, v8, v4, 32LL);
      if (!v5->_handlerSetup)
      {
        objc_initWeak(&location, v5);
        uint64_t interface = v5->_interface;
        if (interface)
        {
          *((_BYTE *)interface + 73) = 0;
          v10 = v5->_interface;
        }

        else
        {
          v10 = 0LL;
        }

        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __61__NEPacketTunnelFlow_readPacketObjectsWithCompletionHandler___block_invoke;
        v13[3] = &unk_18A08E820;
        objc_copyWeak(&v14, &location);
        v13[4] = v5;
        if (NEVirtualInterfaceSetReadMultipleIPPacketsHandler(v10, v13))
        {
          v5->_handlerSetup = 1;
        }

        else
        {
          ne_log_obj();
          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v12 = 0;
            _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to set the multiple packet read handler",  v12,  2u);
          }
        }

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }

      NEVirtualInterfaceReadyToReadMultiple((uint64_t)v5->_interface, 0x40u);
    }
  }

  objc_sync_exit(v5);
}

- (BOOL)writePackets:(NSArray *)packets withProtocols:(NSArray *)protocols
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v6 = packets;
  id v7 = protocols;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_interfaceType == 1)
  {
    uint64_t v9 = -[NSArray count](v6, "count");
    if (v9 != -[NSArray count](v7, "count"))
    {
      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315650;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        __int16 v24 = 2048;
        uint64_t v25 = -[NSArray count](v6, "count");
        __int16 v26 = 2048;
        uint64_t v27 = -[NSArray count](v7, "count");
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%s: packets count (%lu) does not equal protocols count (%lu)",  (uint8_t *)&v22,  0x20u);
      }

      goto LABEL_38;
    }
  }

  unint64_t buffersSize = v8->_buffersSize;
  if (buffersSize < -[NSArray count](v6, "count"))
  {
    v11 = (char **)realloc(v8->_packetDataArray, 8 * -[NSArray count](v6, "count"));
    if (v11)
    {
      v8->_uint64_t packetDataArray = v11;
      if (v8->_interfaceType != 1)
      {
LABEL_10:
        v13 = (unint64_t *)realloc(v8->_packetLengths, 8 * -[NSArray count](v6, "count"));
        if (v13)
        {
          v8->_packetLengths = v13;
          v8->_unint64_t buffersSize = -[NSArray count](v6, "count");
          goto LABEL_12;
        }

        ne_log_obj();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136315138;
          v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
          _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet lengths",  (uint8_t *)&v22,  0xCu);
        }

        goto LABEL_38;
      }

      v12 = (unsigned int *)realloc(v8->_packetProtocols, 4 * -[NSArray count](v6, "count"));
      if (v12)
      {
        v8->_packetProtocols = v12;
        goto LABEL_10;
      }

      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet protocols",  (uint8_t *)&v22,  0xCu);
      }
    }

    else
    {
      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet data pointers",  (uint8_t *)&v22,  0xCu);
      }
    }

- (BOOL)writePacketObjects:(NSArray *)packets
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v4 = packets;
  v5 = self;
  objc_sync_enter(v5);
  unint64_t buffersSize = v5->_buffersSize;
  if (buffersSize < -[NSArray count](v4, "count"))
  {
    id v7 = (char **)realloc(v5->_packetDataArray, 8 * -[NSArray count](v4, "count"));
    if (v7)
    {
      v5->_uint64_t packetDataArray = v7;
      v8 = (unsigned int *)realloc(v5->_packetProtocols, 4 * -[NSArray count](v4, "count"));
      if (v8)
      {
        v5->_packetProtocols = v8;
        uint64_t v9 = (unint64_t *)realloc(v5->_packetLengths, 8 * -[NSArray count](v4, "count"));
        if (v9)
        {
          v5->_packetLengths = v9;
          v5->_unint64_t buffersSize = -[NSArray count](v4, "count");
          goto LABEL_8;
        }

        ne_log_obj();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315138;
          v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
          _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet lengths",  (uint8_t *)&v20,  0xCu);
        }
      }

      else
      {
        ne_log_obj();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v20 = 136315138;
          v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
          _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet protocols",  (uint8_t *)&v20,  0xCu);
        }
      }
    }

    else
    {
      ne_log_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315138;
        v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to allocate memory for packet data pointers",  (uint8_t *)&v20,  0xCu);
      }
    }

LABEL_29:
    BOOL v17 = 0;
    goto LABEL_30;
  }

- (NSFileHandle)socket
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSocket:(id)a3
{
}

- (void).cxx_destruct
{
}

void __61__NEPacketTunnelFlow_readPacketObjectsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3,  uint64_t a4,  uint64_t *a5,  uint64_t *a6,  unsigned int a7)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    objc_sync_enter(v13);
    v15 = (void (**)(void, void *))objc_getProperty(v13, v14, 32LL, 1);
    objc_setProperty_atomic_copy(v13, v16, 0LL, 32LL);
    objc_sync_exit(v13);

    if (v15)
    {
      memset(v39, 0, sizeof(v39));
      if (a7 > 0x40) {
        __assert_rtn( "-[NEPacketTunnelFlow readPacketObjectsWithCompletionHandler:]_block_invoke",  "NEPacketTunnelFlow.m",  227,  "num_packets <= NEVPNPluginMaxPendingPackets");
      }
      v34 = v12;
      uint64_t v35 = a7;
      v36 = v15;
      if (a7)
      {
        BOOL v17 = (void **)v39;
        uint64_t v18 = a4;
        uint64_t v19 = v35;
        do
        {
          if (a4)
          {
            v21 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v18];
            if (v21)
            {
              id Property = *(id *)(a1 + 32);
              if (Property) {
                id Property = objc_getProperty(Property, v20, 72LL, 1);
              }
              [Property objectForKeyedSubscript:v21];
              unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              unint64_t v23 = 0LL;
            }
          }

          else
          {
            unint64_t v23 = 0LL;
            v21 = 0LL;
          }

          uint64_t v24 = objc_alloc(&OBJC_CLASS___NEPacket);
          id v25 = objc_alloc(MEMORY[0x189603F48]);
          uint64_t v27 = *a5++;
          uint64_t v26 = v27;
          uint64_t v28 = *a6++;
          v29 = (void *)[v25 initWithBytes:v26 length:v28];
          LOBYTE(v28) = *a3;
          a3 += 4;
          v30 = -[NEPacket initWithData:protocolFamily:metadata:]((id *)&v24->super.isa, v29, v28, v23);
          v31 = *v17;
          *v17++ = v30;

          v18 += 16LL;
          --v19;
        }

        while (v19);
      }

      v32 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v39 count:v35];
      v36[2](v36, v32);

      for (uint64_t i = 504LL; i != -8; i -= 8LL)
      v12 = v34;
      v15 = v36;
    }
  }
}

void __55__NEPacketTunnelFlow_readPacketsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  unsigned int *a3,  uint64_t a4,  void *a5,  uint64_t *a6,  unsigned int a7)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    objc_sync_enter(v14);
    SEL v16 = (void (**)(id, void *, id))objc_getProperty(v14, v15, 96LL, 1);
    objc_setProperty_atomic_copy(v14, v17, 0LL, 96LL);
    objc_sync_exit(v14);

    if (v16)
    {
      memset(v36, 0, sizeof(v36));
      memset(v35, 0, sizeof(v35));
      if (a7 > 0x40) {
        __assert_rtn( "-[NEPacketTunnelFlow readPacketsWithCompletionHandler:]_block_invoke",  "NEPacketTunnelFlow.m",  170,  "num_packets <= NEVPNPluginMaxPendingPackets");
      }
      v33 = v16;
      uint64_t v34 = a7;
      if (a7)
      {
        uint64_t v18 = (void **)v35;
        uint64_t v19 = (void **)v36;
        uint64_t v20 = v34;
        do
        {
          id v21 = objc_alloc(MEMORY[0x189603F48]);
          uint64_t v22 = *a6++;
          uint64_t v23 = [v21 initWithBytes:*a5 length:v22];
          uint64_t v24 = *v19;
          *uint64_t v19 = (void *)v23;

          uint64_t v25 = *(void *)(a1 + 32);
          if (v25 && *(void *)(v25 + 80) == 1LL)
          {
            uint64_t v26 = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedInt:*a3];
            uint64_t v27 = *v18;
            os_log_s *v18 = (void *)v26;
          }

          ++v18;
          ++a3;
          ++v19;
          ++a5;
          --v20;
        }

        while (v20);
      }

      uint64_t v28 = *(void *)(a1 + 32);
      if (v28 && *(void *)(v28 + 80) == 1LL)
      {
        SEL v16 = v33;
        id v29 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v35 count:v34];
      }

      else
      {
        id v29 = objc_alloc_init(MEMORY[0x189603F18]);
        SEL v16 = v33;
      }

      v30 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v36 count:v34];
      v16[2](v16, v30, v29);

      for (uint64_t i = 504LL; i != -8; i -= 8LL)
      for (uint64_t j = 504LL; j != -8; j -= 8LL)
    }
  }
}

- (void)closeVirtualInterface
{
  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    uint64_t v1 = self[11];
    if (v1)
    {
      NEVirtualInterfaceInvalidate(v1);
      CFRelease((CFTypeRef)self[11]);
      self[11] = 0LL;
      *((_BYTE *)self + 8) = 0;
      objc_setProperty_atomic_copy(self, v2, 0LL, 96LL);
      objc_super v3 = (void *)self[5];
      if (v3)
      {
        free(v3);
        self[5] = 0LL;
      }

      v4 = (void *)self[6];
      if (v4)
      {
        free(v4);
        self[6] = 0LL;
      }

      v5 = (void *)self[7];
      if (v5)
      {
        free(v5);
        self[7] = 0LL;
      }
    }

    objc_sync_exit(self);
  }

@end