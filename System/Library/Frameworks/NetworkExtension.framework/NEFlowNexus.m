@interface NEFlowNexus
- (BOOL)setDiscoveredEndpoints:(id)a3 forClient:(id)a4;
- (BOOL)supportsBrowseRequests;
- (NEFlowNexus)initWithName:(id)a3 delegate:(id)a4;
- (void)dealloc;
- (void)handleAssertFromClient:(id)a3;
- (void)handleUnassertFromClient:(id)a3;
- (void)setRemoteConnectionDirector:(id)a3;
- (void)setSupportsBrowseRequests:(BOOL)a3;
@end

@implementation NEFlowNexus

- (NEFlowNexus)initWithName:(id)a3 delegate:(id)a4
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___NEFlowNexus;
  v4 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:]( &v61,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_,  4LL,  a3,  1LL,  a4,  0LL);
  if (!v4)
  {
    ne_log_obj();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_FAULT,  "[super initWithLevel:name:delegate:] failed",  v70,  2u);
    }

    goto LABEL_40;
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v6 = dispatch_queue_create("FlowDivertDirector", v5);
  objc_setProperty_atomic(v4, v7, v6, 176LL);

  if (!objc_getProperty(v4, v8, 176LL, 1))
  {
    ne_log_obj();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "dispatch_queue_create failed";
    goto LABEL_15;
  }

  id v9 = -[NEFlowDivertFileHandle initFlowDivertControlSocket]( objc_alloc(&OBJC_CLASS___NEFlowDivertFileHandle),  "initFlowDivertControlSocket");
  objc_setProperty_atomic(v4, v10, v9, 168LL);

  if (!objc_getProperty(v4, v11, 168LL, 1))
  {
    ne_log_obj();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "[NEFlowDivertFileHandle initFlowDivertControlSocket] failed";
    goto LABEL_15;
  }

  objc_msgSend(objc_getProperty(v4, v12, 168, 1), "controlUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_flowDivertControlUnit = [v13 unsignedIntValue];

  objc_msgSend(objc_getProperty(v4, v14, 168, 1), "keyMaterial");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v4, v16, v15, 184LL);

  objc_msgSend(objc_getProperty(v4, v17, 168, 1), "handle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 fileDescriptor];
  objc_getProperty(v4, v19, 176LL, 1);
  v4->_flowDivertDirector = (_NEFlowDirector *)NEFlowDirectorCreate();

  if (!v4->_flowDivertDirector)
  {
    ne_log_obj();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v32 = "NEFlowDirectorCreate failed";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v31, OS_LOG_TYPE_FAULT, v32, buf, 2u);
LABEL_16:

    ne_log_obj();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_1876B1000, v33, OS_LOG_TYPE_FAULT, "setupFlowDivertDirector failed", v70, 2u);
    }

    goto LABEL_40;
  }

  int v69 = 0;
  uint64_t v67 = 0LL;
  v20 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  objc_msgSend(objc_getProperty(v4, v21, 168, 1), "handle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 fileDescriptor];
  ssize_t v24 = send(v23, v20, v67 - v68, 0);

  if (v24 < 0)
  {
    ne_log_obj();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v55 = __error();
      v56 = strerror(*v55);
      *(_DWORD *)buf = 136315138;
      v76 = v56;
      _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s",  buf,  0xCu);
    }

    if (v20) {
      CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], v20);
    }
  }

  else
  {
    v25 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], v20);
    int v69 = 1;
    v26 = (void *)NEFlowTLVMsgCreate();
    NEFlowTLVAdd();
    NEFlowTLVAdd();
    objc_msgSend(objc_getProperty(v4, v27, 168, 1), "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    int v29 = [v28 fileDescriptor];
    ssize_t v30 = send(v29, v26, v67 - v68, 0);

    if (v30 >= 0)
    {
      if (!v26) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }

    ne_log_obj();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = v67;
      uint64_t v58 = v68;
      v59 = __error();
      v60 = strerror(*v59);
      *(_DWORD *)buf = 134218242;
      v76 = (char *)(v57 - v58);
      __int16 v77 = 2080;
      v78 = v60;
      _os_log_error_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s",  buf,  0x16u);
    }

    if (v26) {
LABEL_26:
    }
      CFAllocatorDeallocate(v25, v26);
  }

- (void)dealloc
{
  if (self && self->_flowDivertDirector)
  {
    NEFlowDirectorDestroy();
    self->_flowDivertDirector = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEFlowNexus;
  -[NENexus dealloc](&v3, sel_dealloc);
}

- (void)setRemoteConnectionDirector:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 192LL);
  }
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  BOOL v3 = a3;
  self->_supportsBrowseRequests = a3;
  id v5 = objc_getProperty(self, a2, 128LL, 1);
  [v5 setSupportsBrowseRequests:v3];

  id Property = objc_getProperty(self, v6, 128LL, 1);
  id v12 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v8, 32LL, 1);
  }
  id v9 = Property;
  id v11 = objc_getProperty(self, v10, 128LL, 1);
  [v9 updateNetworkAgent:v11];
}

- (BOOL)setDiscoveredEndpoints:(id)a3 forClient:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  SEL v8 = (char *)a4;
  if (!v8)
  {
    ne_log_obj();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NEFlowNexus setDiscoveredEndpoints:forClient:]";
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null clientID", buf, 0xCu);
    }

    goto LABEL_28;
  }

  if (self) {
    id Property = objc_getProperty(self, v7, 200LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (([Property containsObject:v8] & 1) == 0)
  {
    ne_log_obj();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Client %@ has not asserted browse, cannot assign discovered endpoints",  buf,  0xCu);
    }

    goto LABEL_28;
  }

  if ([v6 count])
  {
    SEL v10 = (os_log_s *)nw_array_create();
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          SEL v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyCEndpoint];
          nw_array_append();
        }

        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v13);
    }
  }

  else
  {
    SEL v10 = 0LL;
  }

  uint64_t browse_result = nw_path_create_browse_result();
  if (!browse_result)
  {
    ne_log_obj();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v26, OS_LOG_TYPE_FAULT, "nw_path_create_browse_result failed", buf, 2u);
    }

    goto LABEL_27;
  }

  SEL v19 = (void *)browse_result;
  if (self)
  {
    v20 = (NEFlowNexus *)objc_getProperty(self, v18, 128LL, 1);
    self = v20;
    if (v20) {
      v20 = (NEFlowNexus *)objc_getProperty(v20, v21, 32LL, 1);
    }
  }

  else
  {
    v20 = 0LL;
  }

  v22 = v20;
  [MEMORY[0x189603F48] dataWithBytes:v19 length:0];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  char v24 = -[NEFlowNexus assignNexusData:toClient:](v22, "assignNexusData:toClient:", v23, v8);

  free(v19);
  if ((v24 & 1) == 0)
  {
    ne_log_obj();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_ERROR,  "Could not assign browse result to client %@",  buf,  0xCu);
    }

- (void)handleAssertFromClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NEFlowNexus;
  -[NENexus handleAssertFromClient:](&v20, sel_handleAssertFromClient_, v4);
  [MEMORY[0x189608E18] pathForClientID:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (!v5)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, "Failed to get path for assert client %@", buf, 0xCu);
    }

    goto LABEL_16;
  }

  if ([v5 hasBrowseDescriptor])
  {
    if (self) {
      id Property = objc_getProperty(self, v7, 200LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = (os_log_s *)Property;
    objc_sync_enter(v9);
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
      id v12 = objc_getProperty(self, v11, 200LL, 1);
    }

    else
    {
      id WeakRetained = 0LL;
      id v12 = 0LL;
    }

    uint64_t v13 = (NENexusBrowse *)v12;
    if ((-[NENexusBrowse containsObject:](v13, "containsObject:", v4) & 1) == 0)
    {
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_13:

        objc_sync_exit(v9);
LABEL_16:

        goto LABEL_17;
      }

      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NENexusBrowse);
      -[NENexusBrowse setClientIdentifier:](v13, "setClientIdentifier:", v4);
      [v6 browseDescriptor];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NENexusBrowse setDescriptor:](v13, "setDescriptor:", v15);

      [v6 parameters];
      SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NENexusBrowse setParameters:](v13, "setParameters:", v16);

      [WeakRetained startBrowse:v13 fromNexus:self];
      if (self) {
        id v18 = objc_getProperty(self, v17, 200LL, 1);
      }
      else {
        id v18 = 0LL;
      }
      id v19 = v18;
      [v19 addObject:v4];
    }

    goto LABEL_13;
  }

- (void)handleUnassertFromClient:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEFlowNexus;
  -[NENexus handleUnassertFromClient:](&v17, sel_handleUnassertFromClient_, v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 200LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  objc_sync_enter(v7);
  if (self) {
    id v9 = objc_getProperty(self, v8, 200LL, 1);
  }
  else {
    id v9 = 0LL;
  }
  id v10 = v9;
  int v11 = [v10 containsObject:v4];

  if (v11)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    }
    else {
      id WeakRetained = 0LL;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NENexusBrowse);
      -[NENexusBrowse setClientIdentifier:](v13, "setClientIdentifier:", v4);
      [WeakRetained stopBrowse:v13 fromNexus:self];
    }

    -[NEFlowNexus setDiscoveredEndpoints:forClient:](self, "setDiscoveredEndpoints:forClient:", 0LL, v4);
    if (self) {
      id v15 = objc_getProperty(self, v14, 200LL, 1);
    }
    else {
      id v15 = 0LL;
    }
    id v16 = v15;
    [v16 removeObject:v4];
  }

  objc_sync_exit(v7);
}

- (BOOL)supportsBrowseRequests
{
  return self->_supportsBrowseRequests;
}

- (void).cxx_destruct
{
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  self = (id *)objc_loadWeakRetained(v4);
  id v6 = v5;
  if (!self) {
    goto LABEL_26;
  }
  id v7 = objc_alloc(&OBJC_CLASS___NENexusFlowDivertFlow);
  if (!v7)
  {
    __int128 v30 = 0LL;
    goto LABEL_23;
  }

  SEL v8 = (os_log_s *)v7;
  if (a2)
  {
    v38.receiver = v7;
    v38.super_class = (Class)&OBJC_CLASS___NENexusFlowDivertFlow;
    id v9 = objc_msgSendSuper2(&v38, sel_init);
    if (v9)
    {
      id v10 = v9;
      v9[8] = CFRetain(a2);
      uint64_t v11 = [MEMORY[0x189607AB8] UUID];
      id v12 = (void *)*((void *)v10 + 5);
      *((void *)v10 + 5) = v11;

      -[NENexusFlow setupFlowProtocolWithUUID:](v10, *((void **)v10 + 5));
      uint64_t v13 = (void *)NEFlowCopyProperty();
      char v14 = (void *)NEFlowCopyProperty();
      int v15 = isa_nsstring(v14);
      int v16 = isa_nsdata(v13);
      if (v15)
      {
        if (v16 && (uint64_t v17 = [v13 bytes]) != 0)
        {
          int v18 = *(unsigned __int8 *)(v17 + 1);
          if (v18 == 30 || v18 == 2) {
            unsigned int v19 = *(unsigned __int16 *)(v17 + 2);
          }
          else {
            unsigned int v19 = 0;
          }
          uint64_t v22 = __rev16(v19);
        }

        else
        {
          uint64_t v22 = 0LL;
        }

        uint64_t v23 = (void *)MEMORY[0x189608DF8];
        [MEMORY[0x189607968] numberWithUnsignedShort:v22];
        SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 stringValue];
        char v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = [v23 endpointWithHostname:v14 port:v24];
        v26 = (void *)*((void *)v10 + 6);
        *((void *)v10 + 6) = v25;
      }

      else
      {
        if (!v16)
        {
LABEL_18:
          id v27 = objc_alloc_init(MEMORY[0x189608E10]);
          __int128 v28 = (void *)*((void *)v10 + 7);
          *((void *)v10 + 7) = v27;

          if (NEFlowGetFlowType() == 1) {
            uint64_t v29 = 2LL;
          }
          else {
            uint64_t v29 = 1LL;
          }
          [*((id *)v10 + 7) setDataMode:v29];
          SEL v8 = (os_log_s *)v10;

          __int128 v30 = (id *)v8;
          goto LABEL_22;
        }

        uint64_t v20 = objc_msgSend(MEMORY[0x189608DE8], "endpointWithAddress:", objc_msgSend(v13, "bytes"));
        SEL v21 = (void *)*((void *)v10 + 6);
        *((void *)v10 + 6) = v20;
      }

      goto LABEL_18;
    }

    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v38.receiver) = 136315138;
      *(id *)((char *)&v38.receiver + 4) = "-[NENexusFlowDivertFlow initWithFlowDivertFlow:]";
      _os_log_fault_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null flowDivertFlow",  (uint8_t *)&v38,  0xCu);
    }
  }

  __int128 v30 = 0LL;
LABEL_22:

LABEL_23:
  [v30 setState:1];
  id v32 = objc_getProperty(self, v31, 112LL, 1);
  if (v30) {
    objc_storeWeak(v30 + 4, v32);
  }

  id WeakRetained = objc_loadWeakRetained(self + 17);
  v38.receiver = (id)MEMORY[0x1895F87A8];
  v38.super_class = (Class)3221225472LL;
  v39 = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke;
  v40 = &unk_18A08C570;
  v41 = v30;
  id v43 = v6;
  v42 = self;
  v34 = v30;
  [WeakRetained acceptNewFlow:v34 fromNexus:self completionHandler:&v38];

LABEL_26:
}

void __38__NEFlowNexus_setupFlowDivertDirector__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = a4;
    _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "Allowing flow from %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NEFlowDirectorHandleMatchRulesResult();
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  location[3] = *(id *)MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      objc_getProperty(v5, v3, 176LL, 1);
    }
    NEFlowSetDispatchQueue();
    [v4 localEndpoint];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || ([v4 localEndpoint],
          int v8 = (void *)objc_claimAutoreleasedReturnValue(),
          [v8 addressData],
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(),
          int v10 = NEFlowSetProperty(),
          v9,
          v8,
          v10))
    {
      objc_initWeak(location, *(id *)(a1 + 40));
      uint64_t v11 = (void *)MEMORY[0x1895F87A8];
      v33[1] = (id)MEMORY[0x1895F87A8];
      v33[2] = (id)3221225472LL;
      v33[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26;
      v33[4] = &unk_18A08C520;
      id v34 = *(id *)(a1 + 32);
      int v12 = NEFlowSetEventHandler();
      v31[1] = v11;
      v31[2] = (id)3221225472LL;
      v31[3] = __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2;
      v31[4] = &unk_18A08C548;
      id v32 = *(id *)(a1 + 32);
      objc_copyWeak(v33, location);
      int v13 = NEFlowSetEventHandler();
      id v30 = *(id *)(a1 + 32);
      objc_copyWeak(v31, location);
      int v14 = NEFlowSetEventHandler();
      if (v12)
      {
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        char v16 = !v15;
        objc_destroyWeak(v31);

        objc_destroyWeak(v33);
        objc_destroyWeak(location);
        if ((v16 & 1) != 0)
        {
          if (NEFlowOpen())
          {
            uint64_t v19 = *(void *)(a1 + 32);
            id Property = *(id *)(a1 + 40);
            if (Property) {
              id Property = objc_getProperty(Property, v17, 144LL, 1);
            }
            id v21 = Property;
            uint64_t v22 = *(void **)(a1 + 32);
            if (v22) {
              id v23 = objc_getProperty(v22, v20, 40LL, 1);
            }
            else {
              id v23 = 0LL;
            }
            [v21 setObject:v19 forKeyedSubscript:v23];

            (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
            goto LABEL_26;
          }

          ne_log_obj();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v29 = *(id *)(a1 + 32);
            if (v29) {
              id v29 = objc_getProperty(v29, v27, 40LL, 1);
            }
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v29;
            _os_log_error_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_ERROR,  "NEFlowOpen failed for client %@",  (uint8_t *)location,  0xCu);
          }
        }
      }

      else
      {
        objc_destroyWeak(v31);

        objc_destroyWeak(v33);
        objc_destroyWeak(location);
      }
    }

    [*(id *)(a1 + 32) setState:3];
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    goto LABEL_26;
  }

  ne_log_obj();
  char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    id v28 = *(id *)(a1 + 32);
    if (v28) {
      id v28 = objc_getProperty(v28, v25, 40LL, 1);
    }
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v28;
    _os_log_debug_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_DEBUG,  "Rejecting new flow for client %@",  (uint8_t *)location,  0xCu);
  }

  [*(id *)(a1 + 32) setState:3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_26:
}

uint64_t __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2];
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v3, 144LL, 1);
  }
  id v5 = WeakRetained;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id Property = objc_getProperty(v6, v4, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v5 setObject:0 forKeyedSubscript:Property];
}

void __51__NEFlowNexus_flowDivertNewFlow_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v3, 144LL, 1);
  }
  id v5 = WeakRetained;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id Property = objc_getProperty(v6, v4, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v5 setObject:0 forKeyedSubscript:Property];
}

@end