@interface NEFilterPacketExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)dealloc;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEFilterPacketExtensionProviderContext

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-packet";
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEFilterPacketExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:]( &v10,  sel_startFilterWithOptions_completionHandler_,  v7,  v6);

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v9[3] = &unk_18A0907E8;
  v9[4] = self;
  [v8 startFilterWithCompletionHandler:v9];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEFilterPacketExtensionProviderContext;
  -[NEExtensionProviderContext dealloc](&v4, sel_dealloc);
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    if (objc_getProperty(self, v6, 112LL, 1))
    {
      objc_getProperty(self, v7, 112LL, 1);
      nw_interpose_cancel();
      objc_setProperty_atomic(self, v8, 0LL, 112LL);
    }

    if (objc_getProperty(self, v7, 120LL, 1))
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      objc_msgSend(objc_getProperty(self, v9, 120, 1), "allValues");
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            -[NEFilterPacketInterpose close](*(os_unfair_lock_s **)(*((void *)&v19 + 1) + 8 * v14++));
          }

          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }

        while (v12);
      }

      objc_setProperty_atomic(self, v15, 0LL, 120LL);
    }
  }

  os_unfair_lock_unlock(p_lock);
  ne_log_obj();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = ne_session_stop_reason_to_string();
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2080;
    uint64_t v26 = v17;
    _os_log_impl(&dword_1876B1000, v16, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEFilterPacketExtensionProviderContext;
  -[NEFilterExtensionProviderContext stopWithReason:](&v18, sel_stopWithReason_, v3);
}

- (void).cxx_destruct
{
}

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 startedWithError:a2];
  }

  else
  {
    -[NEExtensionProviderContext hostContext](v3, 0LL);
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2;
    v5[3] = &unk_18A08EFF8;
    v5[4] = *(void *)(a1 + 32);
    [v4 createPacketChannelWithCompletionHandler:v5];
  }

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  id v4 = a2;
  if (!v3) {
    goto LABEL_12;
  }
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    __int128 v19 = v3;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, " %@: necpClientClaimWithUUID <%@>", buf, 0x16u);
  }

  if (!v4) {
    goto LABEL_12;
  }
  [v4 getUUIDBytes:v17];
  id v6 = (void *)nw_interpose_client_claim();
  objc_setProperty_atomic(v3, v7, v6, 112LL);

  if (!objc_getProperty(v3, v8, 112LL, 1))
  {
    ne_log_obj();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v19 = v3;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%@: necpClientClaimWithUUID <%@>: failed claim",  buf,  0x16u);
    }

LABEL_12:
    SEL v15 = *(void **)(a1 + 32);
    id v16 = (id)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
    objc_msgSend(v15, "startedWithError:");

    return;
  }

  if (!objc_getProperty(v3, v9, 120LL, 1))
  {
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    objc_setProperty_atomic(v3, v12, v11, 120LL);
  }

  v3[26] = 0;
  objc_getProperty(v3, v10, 112LL, 1);
  nw_interpose_set_flow_event_handler();
  objc_getProperty(v3, v13, 112LL, 1);
  nw_interpose_start();

  [*(id *)(a1 + 32) startedWithError:0];
}

void __65__NEFilterPacketExtensionProviderContext_interposeClaimWithUUID___block_invoke( uint64_t a1,  int a2,  void *a3,  const unsigned __int8 *a4,  const char *a5,  int a6,  uint64_t a7,  int a8)
{
  v96[2] = *MEMORY[0x1895F89C0];
  SEL v15 = *(os_unfair_lock_s **)(a1 + 32);
  id v16 = a3;
  if (v15)
  {
    os_unfair_lock_lock(v15 + 26);
    self = v15;
    uint64_t v17 = (void *)NSString;
    name = nw_interface_get_name(v16);
    __int128 v19 = v17;
    __int16 v20 = self;
    uint64_t v89 = [v19 stringWithUTF8String:name];
    objc_msgSend(objc_getProperty(self, v21, 120, 1), "objectForKeyedSubscript:", v89);
    uint64_t v22 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v88 = v16;
    if (a2 == 1)
    {
      if (!v22)
      {
        id v27 = 0LL;
        goto LABEL_19;
      }

      if (-[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4))
      {
        ne_log_obj();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)v89;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v91 = 138412290;
          *(void *)&v91[4] = v23;
          _os_log_debug_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_DEBUG,  "%@: interposeHandleFlowEvent: removing channel",  v91,  0xCu);
        }

        -[NEFilterPacketInterpose close](v23);
        objc_msgSend(objc_getProperty(self, v30, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        id v27 = v23;
        goto LABEL_39;
      }
    }

    else
    {
      if (!a2)
      {
        if (v22)
        {
          BOOL v24 = -[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4);
          ne_log_obj();
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
          if (v24)
          {
            if (v26)
            {
              *(_DWORD *)v91 = 138412290;
              *(void *)&v91[4] = v23;
              _os_log_debug_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_DEBUG,  "%@: interposeHandleFlowEvent: flow already exists",  v91,  0xCu);
            }

            id v27 = v23;
            __int16 v20 = self;
            goto LABEL_19;
          }

          if (v26)
          {
            *(_DWORD *)v91 = 138412290;
            *(void *)&v91[4] = v23;
            _os_log_debug_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_DEBUG,  "%@: interposeHandleFlowEvent: removing channel",  v91,  0xCu);
          }

          -[NEFilterPacketInterpose close](v23);
          __int16 v20 = self;
          objc_msgSend(objc_getProperty(self, v33, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        }
        v34 = -[os_unfair_lock_s _principalObject](v20, "_principalObject");
        v35 = objc_alloc(&OBJC_CLASS___NEFilterPacketInterpose);
        v36 = v16;
        id v27 = v35;
        v37 = v36;
        id v87 = v34;
        if (v27)
        {
          *(void *)v91 = v27;
          *(void *)&v91[8] = &OBJC_CLASS___NEFilterPacketInterpose;
          v38 = (id *)objc_msgSendSuper2((objc_super *)v91, sel_init);
          id v27 = v38;
          if (v38)
          {
            *((_DWORD *)v38 + 2) = 0;
            objc_storeStrong(v38 + 17, a3);
            uint64_t v39 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a5];
            v40 = (void *)*((void *)v27 + 22);
            *((void *)v27 + 22) = v39;

            *((void *)v27 + 23) = a7;
            *((_DWORD *)v27 + 39) = a6;
            *((_DWORD *)v27 + 40) = a8;
            uint64_t v41 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a4];
            v42 = (void *)*((void *)v27 + 21);
            *((void *)v27 + 21) = v41;

            objc_storeStrong((id *)v27 + 16, v34);
            v43 = objc_alloc_init(&OBJC_CLASS___NEFilterPacketContext);
            v44 = (void *)*((void *)v27 + 18);
            *((void *)v27 + 18) = v43;
          }
        }

        v45 = v87;

        v29 = (void *)v89;
        __int16 v20 = self;
        if (!v27) {
          goto LABEL_36;
        }
        v46 = (void *)*((void *)v27 + 16);
        if (v46
          && ([v46 packetHandler],
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v47,
              v47))
        {
          uint64_t v48 = *((void *)v27 + 2);
          ne_log_obj();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
          if (v48)
          {
            if (v50)
            {
              *(_DWORD *)buf = 138412290;
              id v93 = v27;
              _os_log_debug_impl( &dword_1876B1000,  v49,  OS_LOG_TYPE_DEBUG,  "%@: createChannel: channel already exists",  buf,  0xCu);
            }

            objc_msgSend(objc_getProperty(self, v51, 120, 1), "setObject:forKeyedSubscript:", v27, v89);
            ne_log_obj();
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v91 = 138412290;
              *(void *)&v91[4] = v27;
              _os_log_debug_impl( &dword_1876B1000,  v52,  OS_LOG_TYPE_DEBUG,  "%@: interposeHandleFlowEvent: added channel",  v91,  0xCu);
            }

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_17933 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_17933, &__block_literal_global_17934);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_17935;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_17929 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_17929, &__block_literal_global_62_17930);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_17931;
}

void __73__NEFilterPacketExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F75D8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_17931;
  _extensionAuxiliaryHostProtocol_protocol_17931 = v0;
}

void __75__NEFilterPacketExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB0E8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_17935;
  _extensionAuxiliaryVendorProtocol_protocol_17935 = v0;
}

@end