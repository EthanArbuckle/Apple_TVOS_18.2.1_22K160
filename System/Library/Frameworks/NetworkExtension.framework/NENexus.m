@interface NENexus
- (BOOL)handleRequestNexusFromClient:(id)a3;
- (BOOL)isAsserted;
- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7;
- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7 netifRingSize:(unsigned int)a8 kernelPipeTxRingSize:(unsigned int)a9 kernelPipeRxRingSize:(unsigned int)a10 execUUID:(id)a11;
- (NENexus)initWithName:(id)a3 delegate:(id)a4;
- (NEVirtualInterface_s)virtualInterface;
- (NSArray)dnsServerAddresses;
- (NSArray)localAddresses;
- (NSString)interfaceName;
- (NSString)name;
- (unint64_t)availability;
- (unint64_t)level;
- (unint64_t)maximumTransmissionUnit;
- (void)cancel;
- (void)closeFlowWithClientIdentifier:(id)a3;
- (void)dealloc;
- (void)handleAssertFromClient:(id)a3;
- (void)handleStartFromClient:(id)a3;
- (void)handleUnassertFromClient:(id)a3;
- (void)rejectFlowWithClientIdentifier:(void *)a1;
- (void)setAsserted:(BOOL)a3;
- (void)setAvailability:(unint64_t)a3;
- (void)setDnsServerAddresses:(id)a3;
- (void)setLocalAddresses:(id)a3;
- (void)setMaximumTransmissionUnit:(unint64_t)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
@end

@implementation NENexus

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7
{
  return -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:]( self,  "initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRx RingSize:execUUID:",  a3,  a4,  a5,  a6,  *(void *)&a7,  0LL,  0LL,  0LL);
}

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7 netifRingSize:(unsigned int)a8 kernelPipeTxRingSize:(unsigned int)a9 kernelPipeRxRingSize:(unsigned int)a10 execUUID:(id)a11
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v18 = a4;
  id v19 = a6;
  id v20 = a11;
  if (!v18)
  {
    ne_log_obj();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_DWORD *)uuid_t uu = 136315138;
    *(void *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    v78 = "%s called with null name";
    goto LABEL_78;
  }

  if (!v19)
  {
    ne_log_obj();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_DWORD *)uuid_t uu = 136315138;
    *(void *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    v78 = "%s called with null delegate";
LABEL_78:
    v81 = uu;
    v82 = v73;
    uint32_t v83 = 12;
    goto LABEL_66;
  }

  v86.receiver = self;
  v86.super_class = (Class)&OBJC_CLASS___NENexus;
  v21 = -[NENexus init](&v86, sel_init);
  if (!v21)
  {
    ne_log_obj();
    self = (NENexus *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", uu, 2u);
    }

    goto LABEL_49;
  }

  self = v21;
  if (a3 == 2)
  {
    int v22 = 2;
  }

  else
  {
    if (a3 != 4)
    {
      ne_log_obj();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uuid_t uu = 67109120;
        *(_DWORD *)&uu[4] = a3;
        _os_log_error_impl(&dword_1876B1000, v73, OS_LOG_TYPE_ERROR, "Nexus level %u is invalid", uu, 8u);
      }

      goto LABEL_48;
    }

    int v22 = 4;
  }

  v21->_level = a3;
  v21->_availability = 0LL;
  objc_storeStrong((id *)&v21->_name, a4);
  objc_storeWeak((id *)&self->_delegate, v19);
  v23 = calloc(1uLL, 0x40uLL);
  if (!v23)
  {
    ne_log_obj();
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uuid_t uu = 134217984;
      *(void *)&uu[4] = 64LL;
      _os_log_fault_impl(&dword_1876B1000, v74, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", uu, 0xCu);
    }

LABEL_47:
    ne_log_obj();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      v78 = "setupFlowManager failed";
      goto LABEL_64;
    }

    goto LABEL_48;
  }

  v24 = v23;
  v84 = v20;
  if (setupFlowManager_onceToken != -1) {
    dispatch_once(&setupFlowManager_onceToken, &__block_literal_global_16255);
  }
  v24[2] = &NENexusFlowIdentifier;
  v24[3] = &NENexusFlowCallbacks;
  v25 = objc_alloc_init(&OBJC_CLASS___NENexusFlowManager);
  objc_setProperty_atomic(self, v26, v25, 112LL);

  if (!objc_getProperty(self, v27, 112LL, 1))
  {
    ne_log_obj();
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v20 = v84;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_1876B1000, v75, OS_LOG_TYPE_FAULT, "[NENexusFlowManager init] failed", uu, 2u);
    }

    free(v24);
    goto LABEL_47;
  }

  v24[5] = objc_getProperty(self, v28, 112LL, 1);
  Property = objc_getProperty(self, v29, 112LL, 1);
  if (Property) {
    Property[2] = v24;
  }
  v31 = objc_alloc_init(&OBJC_CLASS___NEPolicySession);
  objc_setProperty_atomic(self, v32, v31, 120LL);

  if (!objc_getProperty(self, v33, 120LL, 1))
  {
    ne_log_obj();
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v20 = v84;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_1876B1000, v77, OS_LOG_TYPE_FAULT, "[NEPolicySession init] failed", uu, 2u);
    }

    ne_log_obj();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_WORD *)uuid_t uu = 0;
    v78 = "setupPolicySession failed";
    goto LABEL_64;
  }

  if (a3 == 4 || !a7)
  {
    [v18 UTF8String];
    v34 = (OS_nw_nexus *)nw_nexus_create();
    userNexus = self->_userNexus;
    self->_userNexus = v34;

    if (!self->_userNexus)
    {
      ne_log_obj();
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uuid_t uu = 0;
        v80 = "nw_nexus_create failed";
        goto LABEL_73;
      }

- (NENexus)initWithName:(id)a3 delegate:(id)a4
{
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, "Cannot instantiate an NENexus directly", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NENexus;
  -[NENexus doesNotRecognizeSelector:](&v8, sel_doesNotRecognizeSelector_, a2);

  return 0LL;
}

- (void)cancel
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  if (self) {
    self = (NENexus *)objc_getProperty(self, a2, 88LL, 1);
  }
  v3 = self;
  uint64_t v4 = -[NENexus countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NENexus closeFlowWithClientIdentifier:]( v2,  "closeFlowWithClientIdentifier:",  *(void *)(*((void *)&v33 + 1) + 8 * i));
      }

      uint64_t v5 = -[NENexus countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    }

    while (v5);
  }

  if (!v2)
  {
    SEL v29 = 0LL;
    id v27 = 0LL;
    goto LABEL_23;
  }

  id v9 = objc_getProperty(v2, v8, 112LL, 1);
  id v11 = v9;
  if (!v9) {
    goto LABEL_18;
  }
  id Property = objc_getProperty(v9, v10, 8LL, 1);

  if (Property)
  {
    id v14 = objc_getProperty(v2, v13, 112LL, 1);
    id v16 = objc_getProperty(v2, v15, 112LL, 1);
    id v18 = v16;
    if (v16) {
      id v16 = objc_getProperty(v16, v17, 8LL, 1);
    }
    id v19 = v16;

    id v20 = (void *)nw_context_copy_implicit_context();
    v31 = v19;
    SEL v32 = v14;
    id v11 = v14;
    id v21 = v19;
    nw_queue_context_async_if_needed();

    id v23 = objc_getProperty(v2, v22, 112LL, 1);
    if (v23)
    {
      v25 = v23;
      objc_setProperty_atomic(v23, v24, 0LL, 8LL);
    }

LABEL_18:
  }

  if (objc_getProperty(v2, v13, 64LL, 1))
  {
    objc_getProperty(v2, v26, 64LL, 1);
    nw_nexus_close();
  }

  id v27 = objc_getProperty(v2, v26, 128LL, 1);
  SEL v29 = v27;
  if (v27) {
    id v27 = objc_getProperty(v27, v28, 32LL, 1);
  }
LABEL_23:
  [v27 unregisterNetworkAgent];

  uint64_t v30 = -[NENexus virtualInterface](v2, "virtualInterface");
  if (!v30 || *(void *)(v30 + 256) != 2LL) {
    NEVirtualInterfaceInvalidate((uint64_t)-[NENexus virtualInterface](v2, "virtualInterface"));
  }
}

- (void)dealloc
{
  if (-[NENexus virtualInterface](self, "virtualInterface"))
  {
    CFRelease(-[NENexus virtualInterface](self, "virtualInterface"));
    -[NENexus setVirtualInterface:](self, "setVirtualInterface:", 0LL);
  }

  if (self)
  {
    id Property = objc_getProperty(self, v3, 128LL, 1);
    uint64_t v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 32LL, 1);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    id Property = 0LL;
  }

  [Property unregisterNetworkAgent];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NENexus;
  -[NENexus dealloc](&v7, sel_dealloc);
}

- (NSString)interfaceName
{
  v3 = -[NENexus virtualInterface](self, "virtualInterface");
  if (v3)
  {
    v3 = -[NENexus virtualInterface](self, "virtualInterface");
    if (v3) {
      v3 = (__CFString *)CFStringCreateWithCString( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const char *)&v3[8].info + 1,  0x600u);
    }
  }

  return (NSString *)v3;
}

- (BOOL)handleRequestNexusFromClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189608E18] pathForClientID:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 parameters];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x2020000000LL;
    int v25 = [v7 pid];
    int v8 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);
    BOOL v9 = v8 != 0;
    if (!v8)
    {
      ne_log_obj();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)SEL v22 = 0;
        _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, "Client has no pid, cannot assign nexus", v22, 2u);
      }

      goto LABEL_14;
    }

    v10 = -[NENexusPathFlow initWithPath:]((id *)objc_alloc(&OBJC_CLASS___NENexusPathFlow), v6);
    [v10 setState:1];
    if (self)
    {
      id Property = objc_getProperty(self, v11, 112LL, 1);
      if (!v10)
      {
LABEL_6:
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        }
        else {
          id WeakRetained = 0LL;
        }
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 3221225472LL;
        v16[2] = __40__NENexus_handleRequestNexusFromClient___block_invoke;
        v16[3] = &unk_18A08E7B8;
        id v14 = v10;
        v17 = v14;
        id v18 = self;
        p___int128 buf = &buf;
        id v19 = v4;
        id v20 = v7;
        [WeakRetained acceptNewFlow:v14 fromNexus:self completionHandler:v16];

LABEL_14:
        _Block_object_dispose(&buf, 8);
        goto LABEL_15;
      }
    }

    else
    {
      id Property = 0LL;
      if (!v10) {
        goto LABEL_6;
      }
    }

    objc_storeWeak(v10 + 4, Property);
    goto LABEL_6;
  }

  ne_log_obj();
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_error_impl( &dword_1876B1000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Failed to get path for client %@",  (uint8_t *)&buf,  0xCu);
  }

  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (void)closeFlowWithClientIdentifier:(id)a3
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 88LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property objectForKeyedSubscript:v5];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v7;
    if (v7 && (id v10 = objc_getProperty(v7, v8, 24LL, 1)) != 0LL)
    {
      id v11 = v10;
      [v9 setState:3];
      if (self)
      {
        objc_msgSend(objc_getProperty(self, v12, 88, 1), "setObject:forKeyedSubscript:", 0, v5);
        id v14 = objc_getProperty(self, v13, 80LL, 1);
      }

      else
      {
        [0 setObject:0 forKeyedSubscript:v5];
        id v14 = 0LL;
      }

      [v14 objectForKeyedSubscript:v11];
      SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v16 = [v15 unsignedIntegerValue];
      if (v16 > 1)
      {
        [MEMORY[0x189607968] numberWithUnsignedInteger:v16 - 1];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (self) {
          id v53 = objc_getProperty(self, v52, 80LL, 1);
        }
        else {
          id v53 = 0LL;
        }
        [v53 setObject:v48 forKeyedSubscript:v11];
      }

      else
      {
        if (self)
        {
          objc_msgSend(objc_getProperty(self, v17, 80, 1), "setObject:forKeyedSubscript:", 0, v11);
          id v19 = objc_getProperty(self, v18, 112LL, 1);
          id v21 = v19;
          if (v19) {
            id v19 = objc_getProperty(v19, v20, 32LL, 1);
          }
        }

        else
        {
          [0 setObject:0 forKeyedSubscript:v11];
          id v21 = 0LL;
          id v19 = 0LL;
        }

        [v19 objectForKeyedSubscript:v11];
        SEL v22 = (void *)objc_claimAutoreleasedReturnValue();

        id v23 = (void *)nw_context_copy_implicit_context();
        uint64_t v65 = MEMORY[0x1895F87A8];
        uint64_t v66 = 3221225472LL;
        v67 = __41__NENexus_closeFlowWithClientIdentifier___block_invoke;
        v68 = &unk_18A08F098;
        id v69 = v22;
        id v70 = v9;
        nw_queue_context_async();

        [MEMORY[0x189603FA8] array];
        int v25 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        v56 = v9;
        id v54 = v69;
        if (self) {
          id v26 = objc_getProperty(self, v24, 72LL, 1);
        }
        else {
          id v26 = 0LL;
        }
        v55 = v15;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v28)
        {
          uint64_t v30 = v28;
          uint64_t v31 = *(void *)v62;
          do
          {
            uint64_t v32 = 0LL;
            do
            {
              if (*(void *)v62 != v31) {
                objc_enumerationMutation(v27);
              }
              uint64_t v33 = *(void *)(*((void *)&v61 + 1) + 8 * v32);
              if (self) {
                id v34 = objc_getProperty(self, v29, 72LL, 1);
              }
              else {
                id v34 = 0LL;
              }
              [v34 objectForKeyedSubscript:v33];
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35 == v11) {
                [v25 addObject:v33];
              }
              ++v32;
            }

            while (v30 != v32);
            uint64_t v36 = [v27 countByEnumeratingWithState:&v61 objects:v72 count:16];
            uint64_t v30 = v36;
          }

          while (v36);
        }

        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v37 = v25;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v38)
        {
          uint64_t v40 = v38;
          uint64_t v41 = *(void *)v58;
          do
          {
            uint64_t v42 = 0LL;
            do
            {
              if (*(void *)v58 != v41) {
                objc_enumerationMutation(v37);
              }
              uint64_t v43 = *(void *)(*((void *)&v57 + 1) + 8 * v42);
              if (self) {
                id v44 = objc_getProperty(self, v39, 72LL, 1);
              }
              else {
                id v44 = 0LL;
              }
              [v44 setObject:0 forKeyedSubscript:v43];
              ++v42;
            }

            while (v40 != v42);
            uint64_t v45 = [v37 countByEnumeratingWithState:&v57 objects:v71 count:16];
            uint64_t v40 = v45;
          }

          while (v45);
        }

        if (self)
        {
          v48 = v54;
          SEL v15 = v55;
          if (objc_getProperty(self, v46, 64LL, 1))
          {
            objc_getProperty(self, v47, 64LL, 1);
            nw_nexus_close_channel_and_instance();
          }

          id v49 = objc_getProperty(self, v47, 112LL, 1);
          v51 = v49;
          BOOL v9 = v56;
          if (v49) {
            id v49 = objc_getProperty(v49, v50, 32LL, 1);
          }
        }

        else
        {
          v51 = 0LL;
          id v49 = 0LL;
          SEL v15 = v55;
          BOOL v9 = v56;
          v48 = v54;
        }

        [v49 setObject:0 forKeyedSubscript:v11];

        -[NENexus rejectFlowWithClientIdentifier:](self, v5);
      }
    }

    else
    {
      -[NENexus rejectFlowWithClientIdentifier:](self, v5);
    }
  }

  else
  {
    ne_log_obj();
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v74 = "-[NENexus closeFlowWithClientIdentifier:]";
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)v9, OS_LOG_TYPE_FAULT, "%s called with null clientUUID", buf, 0xCu);
    }
  }
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
  objc_msgSend(objc_getProperty(self, a2, 128, 1), "setActive:", a3 != 0);
  id Property = objc_getProperty(self, v5, 128LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 32LL, 1);
  }
  id v8 = Property;
  objc_msgSend(v8, "updateNetworkAgent:", objc_getProperty(self, v9, 128, 1));

  id v10 = -[NENexus virtualInterface](self, "virtualInterface");
  if (v10 && !*((_BYTE *)v10 + 264))
  {
    char v11 = *((_BYTE *)v10 + 312);
    if (((v11 & 1) == 0) == (a3 == 3)) {
      *((_BYTE *)v10 + 312) = v11 & 0xFE | (a3 == 3);
    }
    char v12 = *((_BYTE *)v10 + 312);
    if (((v12 & 2) == 0) == (a3 == 2)) {
      *((_BYTE *)v10 + 312) = v12 & 0xFD | (2 * (a3 == 2));
    }
    char v13 = *((_BYTE *)v10 + 312);
    if (((v13 & 4) == 0) == (a3 == 4)) {
      *((_BYTE *)v10 + 312) = v13 & 0xFB | (4 * (a3 == 4));
    }
    char v14 = *((_BYTE *)v10 + 312);
    if (((v14 & 8) == 0) == a3 < 2) {
      *((_BYTE *)v10 + 312) = v14 & 0xF7 | (8 * (a3 < 2));
    }
  }

  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0LL, 1);
}

- (void)handleStartFromClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189608E18] pathForClientID:v4];
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 parameters];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 pid])
    {
      id v8 = -[NENexusPathFlow initWithPath:]((id *)objc_alloc(&OBJC_CLASS___NENexusPathFlow), v6);
      [v8 setState:1];
      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      else {
        id WeakRetained = 0LL;
      }
      [WeakRetained handleRequestToActivateNexus:self fromFlow:v8];
    }

    else
    {
      ne_log_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Client has no pid, cannot assign nexus",  (uint8_t *)&v11,  2u);
      }
    }
  }

  else
  {
    ne_log_obj();
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Failed to get path for client %@",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)handleAssertFromClient:(id)a3
{
  id v23 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  objc_sync_enter(v6);
  if (self) {
    id v8 = objc_getProperty(self, v7, 96LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;
  [v9 objectForKeyedSubscript:v23];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self) {
      id v13 = objc_getProperty(self, v11, 96LL, 1);
    }
    else {
      id v13 = 0LL;
    }
    id v14 = v13;
    [v14 setObject:v12 forKeyedSubscript:v23];
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:1];
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (self) {
      id v17 = objc_getProperty(self, v15, 96LL, 1);
    }
    else {
      id v17 = 0LL;
    }
    id v18 = v17;
    [v18 setObject:v16 forKeyedSubscript:v23];

    if (!-[NENexus isAsserted](self, "isAsserted"))
    {
      id v20 = self ? objc_getProperty(self, v19, 96LL, 1) : 0LL;
      id v21 = v20;
      uint64_t v22 = [v21 count];

      if (v22) {
        -[NENexus setAsserted:](self, "setAsserted:", 1LL);
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)handleUnassertFromClient:(id)a3
{
  id v22 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  objc_sync_enter(v6);
  if (self) {
    id v8 = objc_getProperty(self, v7, 96LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;
  [v9 objectForKeyedSubscript:v22];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if ((unint64_t)[v10 unsignedIntegerValue] > 1)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") - 1);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (self) {
        id v20 = objc_getProperty(self, v18, 96LL, 1);
      }
      else {
        id v20 = 0LL;
      }
      id v21 = v20;
      [v21 setObject:v19 forKeyedSubscript:v22];
    }

    else
    {
      if (self) {
        id v12 = objc_getProperty(self, v11, 96LL, 1);
      }
      else {
        id v12 = 0LL;
      }
      id v13 = v12;
      [v13 setObject:0 forKeyedSubscript:v22];

      if (-[NENexus isAsserted](self, "isAsserted"))
      {
        if (self) {
          id v15 = objc_getProperty(self, v14, 96LL, 1);
        }
        else {
          id v15 = 0LL;
        }
        id v16 = v15;
        uint64_t v17 = [v16 count];

        if (!v17) {
          -[NENexus setAsserted:](self, "setAsserted:", 0LL);
        }
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)setLocalAddresses:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:v5];
  [MEMORY[0x189604010] setWithArray:self->_localAddresses];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 minusSet:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:self->_localAddresses];
  [MEMORY[0x189604010] setWithArray:v5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 minusSet:v9];

  objc_storeStrong((id *)&self->_localAddresses, a3);
  id v10 = -[NENexus virtualInterface](self, "virtualInterface");
  if ([v8 count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    int v11 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v17 hostname];
            id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            NEVirtualInterfaceRemoveAddress((uint64_t)v10, v18);
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v14);
    }

    id v8 = v11;
  }

  if ([v6 count])
  {
    uint64_t v30 = v8;
    uint64_t v31 = v6;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (!v20) {
      goto LABEL_27;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    while (1)
    {
      for (uint64_t j = 0LL; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v25 = v24;
          if ([v25 addressFamily] == 2)
          {
            [v25 hostname];
            id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v27 = (uint64_t)v10;
            uint64_t v28 = v26;
            SEL v29 = @"255.255.255.255";
            goto LABEL_23;
          }

          if ([v25 addressFamily] == 30)
          {
            [v25 hostname];
            id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v27 = (uint64_t)v10;
            uint64_t v28 = v26;
            SEL v29 = @"FFFF:FFFF:FFFF:FFFF::";
LABEL_23:
            NEVirtualInterfaceAddAddressInternal(v27, v28, v29, 0LL);
          }

          continue;
        }
      }

      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (!v21)
      {
LABEL_27:

        id v6 = v31;
        id v8 = v30;
        break;
      }
    }
  }

  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0LL, 1);
}

- (void)setDnsServerAddresses:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_dnsServerAddresses, a3);
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "hostname", (void)v15);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v6 addObject:v13];
          }

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  uint64_t v14 = -[NENexus virtualInterface](self, "virtualInterface", (void)v15);
  NEVirtualInterfaceSetDNSServers((uint64_t)v14, v6);
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v14, 0LL, 1);
}

- (void)setMaximumTransmissionUnit:(unint64_t)a3
{
  self->_maximumTransmissionUnit = a3;
  NEVirtualInterfaceSetMTU((uint64_t)-[NENexus virtualInterface](self, "virtualInterface"), a3);
}

- (unint64_t)level
{
  return self->_level;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (unint64_t)availability
{
  return self->_availability;
}

- (BOOL)isAsserted
{
  return self->_asserted;
}

- (void)setAsserted:(BOOL)a3
{
  self->_asserted = a3;
}

- (NSArray)localAddresses
{
  return self->_localAddresses;
}

- (NSArray)dnsServerAddresses
{
  return self->_dnsServerAddresses;
}

- (unint64_t)maximumTransmissionUnit
{
  return self->_maximumTransmissionUnit;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (void).cxx_destruct
{
}

- (void)rejectFlowWithClientIdentifier:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    uint64_t v15 = 0LL;
    uuid_clear(uu);
    uint64_t assign_message = nw_path_create_assign_message();
    if (!assign_message)
    {
      ne_log_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_fault_impl(&dword_1876B1000, v13, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", v14, 2u);
      }

      goto LABEL_10;
    }

    id v6 = (void *)assign_message;
    id Property = objc_getProperty(a1, v5, 128LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v8, 32LL, 1);
    }
    uint64_t v9 = (void *)MEMORY[0x189603F48];
    id v10 = Property;
    [v9 dataWithBytes:v6 length:v15];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v10 assignNexusData:v11 toClient:v3];

    free(v6);
    if ((v12 & 1) == 0)
    {
      ne_log_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", v14, 2u);
      }

uint64_t __41__NENexus_closeFlowWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  uint64_t result = [*(id *)(a1 + 40) protocol];
  if (protocol_handler) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(protocol_handler + 24) + 8LL))( protocol_handler,  result,  1LL);
  }
  return result;
}

void __40__NENexus_handleRequestNexusFromClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_73;
  }
  [v4 setState:2];
  int v89 = 0;
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 72LL, 1);
  }
  id v7 = (void *)MEMORY[0x189607968];
  uint64_t v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  id v9 = Property;
  [v7 numberWithInt:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = *(id *)(a1 + 40);
  if (v11)
  {
    if (v13) {
      id v13 = objc_getProperty(v13, v12, 80LL, 1);
    }
    [v13 objectForKeyedSubscript:v11];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      __int128 v16 = v14;
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v17 = (os_log_s *)&unk_18A0CFA20;
    }

    id v26 = *(id *)(a1 + 40);
    if (v26) {
      id v26 = objc_getProperty(v26, v15, 80LL, 1);
    }
    [v26 setObject:v17 forKeyedSubscript:v11];
    id v28 = *(id *)(a1 + 40);
    if (v28)
    {
      id v28 = objc_getProperty(v28, v27, 112LL, 1);
      uint64_t v30 = v28;
      if (v28) {
        id v28 = objc_getProperty(v28, v29, 32LL, 1);
      }
    }

    else
    {
      uint64_t v30 = 0LL;
    }

    [v28 objectForKeyedSubscript:v11];
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v31) {
      nw_channel_get_key();
    }
    __int128 v32 = (void *)nw_context_copy_implicit_context();
    uint64_t v81 = MEMORY[0x1895F87A8];
    uint64_t v82 = 3221225472LL;
    uint32_t v83 = __40__NENexus_handleRequestNexusFromClient___block_invoke_184;
    v84 = &unk_18A08E790;
    uint64_t v33 = *(void *)(a1 + 40);
    __int128 v34 = *(void **)(a1 + 48);
    __int16 v85 = v31;
    uint64_t v86 = v33;
    id v87 = v34;
    id v88 = *(id *)(a1 + 32);
    uint64_t v20 = v31;
    nw_queue_context_async();

    __int128 v35 = v85;
    goto LABEL_27;
  }

  if (v13) {
    objc_getProperty(v13, v12, 64LL, 1);
  }
  uint64_t channel_to_new_instance = nw_nexus_create_channel_to_new_instance();
  if (!channel_to_new_instance)
  {
    ne_log_obj();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v91 = 0;
      _os_log_fault_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_FAULT,  "nw_nexus_create_channel_to_new_instance failed",  v91,  2u);
    }

    goto LABEL_72;
  }

  id v19 = (os_log_s *)channel_to_new_instance;
  [0 getUUIDBytes:v91];
  if ((nw_channel_get_nexus_instance() & 1) == 0)
  {
    ne_log_obj();
    __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v90 = 0;
      _os_log_fault_impl(&dword_1876B1000, v57, OS_LOG_TYPE_FAULT, "nw_channel_get_nexus_instance failed", v90, 2u);
    }

    goto LABEL_72;
  }

  nw_channel_get_key();
  [*(id *)(a1 + 56) processUUID];
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 56) effectiveProcessUUID];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  char v22 = [v21 isEqual:v20];

  if ((v22 & 1) != 0)
  {
    if (v20)
    {
      -[os_log_s getUUIDBytes:](v20, "getUUIDBytes:", v90);
      id v25 = *(void **)(a1 + 40);
      if (v25) {
        objc_getProperty(v25, v24, 64LL, 1);
      }
    }

    else
    {
      __int128 v60 = *(void **)(a1 + 40);
      if (v60) {
        objc_getProperty(v60, v23, 64LL, 1);
      }
    }
  }

  else if (v20)
  {
    -[os_log_s getUUIDBytes:](v20, "getUUIDBytes:", v90);
    __int128 v59 = *(void **)(a1 + 40);
    if (v59) {
      objc_getProperty(v59, v58, 64LL, 1);
    }
  }

  else
  {
    __int128 v61 = *(void **)(a1 + 40);
    if (v61) {
      objc_getProperty(v61, v23, 64LL, 1);
    }
  }

  if ((nw_nexus_bind_client_port() & 1) == 0)
  {
    ne_log_obj();
    uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      int v76 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      *(_DWORD *)v90 = 67109120;
      *(_DWORD *)&v90[4] = v76;
      _os_log_error_impl(&dword_1876B1000, v75, OS_LOG_TYPE_ERROR, "Failed to bind nexus port for %d", v90, 8u);
    }

LABEL_72:
    BOOL v4 = *(void **)(a1 + 32);
LABEL_73:
    [v4 setState:3];
    goto LABEL_74;
  }

  __int128 v62 = (void *)nw_context_copy_implicit_context();
  uint64_t v77 = MEMORY[0x1895F87A8];
  uint64_t v17 = v19;
  id v78 = *(id *)(a1 + 48);
  id v79 = *(id *)(a1 + 32);
  nw_queue_context_async();

  uint64_t v11 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]),  "initWithUUIDBytes:",  v91,  v77,  3221225472,  __40__NENexus_handleRequestNexusFromClient___block_invoke_185,  &unk_18A08E790);
  id v64 = *(id *)(a1 + 40);
  if (v64)
  {
    id v64 = objc_getProperty(v64, v63, 112LL, 1);
    uint64_t v66 = v64;
    if (v64) {
      id v64 = objc_getProperty(v64, v65, 32LL, 1);
    }
  }

  else
  {
    uint64_t v66 = 0LL;
  }

  [v64 setObject:v17 forKeyedSubscript:v11];

  id v68 = *(id *)(a1 + 40);
  if (v68) {
    id v68 = objc_getProperty(v68, v67, 72LL, 1);
  }
  id v69 = (void *)MEMORY[0x189607968];
  uint64_t v70 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  id v71 = v68;
  [v69 numberWithInt:v70];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  [v71 setObject:v11 forKeyedSubscript:v72];

  id v74 = *(id *)(a1 + 40);
  if (v74) {
    id v74 = objc_getProperty(v74, v73, 80LL, 1);
  }
  [v74 setObject:&unk_18A0CFA20 forKeyedSubscript:v11];

  __int128 v35 = v17;
LABEL_27:

  __int128 v37 = *(void **)(a1 + 32);
  if (v37) {
    objc_setProperty_atomic(v37, v36, v11, 24LL);
  }
  [v3 localEndpoint];
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v39 = v38;
  if (v38)
  {
    uint64_t v40 = (void *)[v38 copyCEndpoint];
  }

  else
  {
    [*(id *)(a1 + 40) localAddresses];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 firstObject];
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = (void *)[v42 copyCEndpoint];
  }

  *(void *)v90 = 0LL;
  [v11 getUUIDBytes:v91];
  uint64_t assign_message = nw_path_create_assign_message();
  if (assign_message)
  {
    uint64_t v45 = (void *)assign_message;
    id v46 = *(id *)(a1 + 40);
    if (v46)
    {
      id v46 = objc_getProperty(v46, v44, 128LL, 1);
      v48 = v46;
      if (v46) {
        id v46 = objc_getProperty(v46, v47, 32LL, 1);
      }
    }

    else
    {
      v48 = 0LL;
    }

    id v49 = (void *)MEMORY[0x189603F48];
    uint64_t v50 = *(void *)v90;
    id v51 = v46;
    [v49 dataWithBytes:v45 length:v50];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = [v51 assignNexusData:v52 toClient:*(void *)(a1 + 48)];

    free(v45);
    if ((v50 & 1) != 0)
    {
      uint64_t v55 = *(void *)(a1 + 32);
      id v54 = *(id *)(a1 + 40);
      if (v54) {
        id v54 = objc_getProperty(v54, v53, 88LL, 1);
      }
      [v54 setObject:v55 forKeyedSubscript:*(void *)(a1 + 48)];
      goto LABEL_45;
    }

    ne_log_obj();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl(&dword_1876B1000, v56, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v56, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", buf, 2u);
    }
  }

  [*(id *)(a1 + 32) setState:3];
LABEL_45:

LABEL_74:
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_184(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))( protocol_handler,  [*(id *)(a1 + 56) protocol]);
    if ((result & 1) != 0) {
      return result;
    }
    ne_log_obj();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      id v5 = "Failed to attach network protocol to user channel";
      id v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }

  else
  {
    ne_log_obj();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      id v5 = "Could not get channel protocol";
      id v6 = buf;
      goto LABEL_9;
    }
  }

  return [*(id *)(a1 + 40) closeFlowWithClientIdentifier:*(void *)(a1 + 48)];
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_185(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))( protocol_handler,  [*(id *)(a1 + 56) protocol]);
    if ((result & 1) != 0) {
      return result;
    }
    ne_log_obj();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      id v5 = "Failed to attach network protocol to user channel";
      id v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }

  else
  {
    ne_log_obj();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      id v5 = "Could not get channel protocol";
      id v6 = buf;
      goto LABEL_9;
    }
  }

  return [*(id *)(a1 + 40) closeFlowWithClientIdentifier:*(void *)(a1 + 48)];
}

void __17__NENexus_cancel__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  nw_channel_close();
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Closed channel for nexus %@ flow manager %@",  (uint8_t *)&v5,  0x16u);
  }
}

void __27__NENexus_setupFlowManager__block_invoke()
{
  dword_18C6E3400 = 4;
  NENexusFlowCallbacks = (uint64_t)nw_nexus_flow_add_input_handler;
  qword_18C6E3310 = (uint64_t)nw_nexus_flow_input_available;
  unk_18C6E3318 = nw_nexus_flow_output_available;
  qword_18C6E3320 = (uint64_t)nw_nexus_flow_get_input_frames;
  unk_18C6E3328 = nw_nexus_flow_get_output_frames;
  qword_18C6E3330 = (uint64_t)nw_nexus_flow_finalize_output_frames;
}

@end