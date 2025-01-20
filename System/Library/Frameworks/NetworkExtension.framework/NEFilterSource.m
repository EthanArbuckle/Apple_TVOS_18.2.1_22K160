@interface NEFilterSource
+ (BOOL)filterRequired;
+ (void)setDelegation:(id *)a3;
- (NEFilterSource)initWithDecisionQueue:(id)a3;
- (NEFilterSource)initWithURL:(id)a3 direction:(int64_t)a4 socketIdentifier:(unint64_t)a5;
- (NSString)sourceAppIdentifier;
- (NSURL)url;
- (id)filterOptions;
- (id)replacementData;
- (int)sourceAppPid;
- (int64_t)direction;
- (int64_t)status;
- (uint64_t)generateCryptoSignature:(_DWORD *)a3 length:;
- (uint64_t)sendDataToPluginWithConnection:(void *)a3 completionHandler:;
- (unint64_t)socketIdentifier;
- (void)addData:(id)a3 withCompletionQueue:(id)a4 completionHandler:(id)a5;
- (void)connectToFilterUnit:(void *)a3 withCompletionHandler:;
- (void)dataCompleteWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)finishedLoadingWithDecisionHandler:(id)a3;
- (void)initGlobals;
- (void)prepareAgentForResponse:(void *)a3 handler:;
- (void)prepareAgentForURL:(void *)a3 urlRequest:(void *)a4 urlResponse:(void *)a5 parentURL:(uint64_t)a6 direction:(void *)a7 flowUUID:(void *)a8 handler:;
- (void)prepareAgentWithHandler:(void *)a1;
- (void)receivedData:(id)a3 decisionHandler:(id)a4;
- (void)receivedResponse:(id)a3 decisionHandler:(id)a4;
- (void)remediateWithDecisionHandler:(id)a3;
- (void)setSourceAppIdentifier:(id)a3;
- (void)setSourceAppPid:(int)a3;
- (void)setUrl:(id)a3;
- (void)willSendRequest:(id)a3 decisionHandler:(id)a4;
@end

@implementation NEFilterSource

- (NEFilterSource)initWithURL:(id)a3 direction:(int64_t)a4 socketIdentifier:(unint64_t)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEFilterSource;
  v10 = -[NEFilterSource init](&v18, sel_init);
  uint64_t v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_registered = 0;
    objc_storeStrong((id *)&v10->_url, a3);
    *(void *)(v11 + 40) = a4;
    *(void *)(v11 + 48) = a5;
    v12 = *(void **)(v11 + 56);
    *(void *)(v11 + 56) = 0LL;

    *(_DWORD *)(v11 + 12) = 0;
    *(void *)(v11 + 24) = 3LL;
    *(_OWORD *)(v11 + 112) = xmmword_187873210;
    uint64_t v13 = [MEMORY[0x189607AB8] UUID];
    v14 = *(void **)(v11 + 80);
    *(void *)(v11 + 80) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:0];
    v16 = *(void **)(v11 + 64);
    *(void *)(v11 + 64) = v15;

    *(void *)(v11 + 104) = 0LL;
    -[NEFilterSource initGlobals](v11);
  }

  return (NEFilterSource *)v11;
}

- (void)addData:(id)a3 withCompletionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke;
  v14[3] = &unk_18A08C4E0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  -[NEFilterSource prepareAgentWithHandler:](self, v14);
}

- (void)dataCompleteWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke;
  v10[3] = &unk_18A08C440;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[NEFilterSource prepareAgentWithHandler:](self, v10);
}

- (NEFilterSource)initWithDecisionQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEFilterSource;
  id v6 = -[NEFilterSource init](&v13, sel_init);
  id v7 = v6;
  if (v6)
  {
    v6->_registered = 0;
    v6->_status = 3LL;
    *(_OWORD *)&v6->_peekIndex = xmmword_187873210;
    uint64_t v8 = [objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:0];
    pendingData = v7->_pendingData;
    v7->_pendingData = (NSMutableData *)v8;

    v7->_pendingDataStartIndex = 0LL;
    objc_storeStrong((id *)&v7->_queue, a3);
    dispatch_group_t v10 = dispatch_group_create();
    sendDataGroup = v7->_sendDataGroup;
    v7->_sendDataGroup = (OS_dispatch_group *)v10;

    -[NEFilterSource initGlobals]((uint64_t)v7);
  }

  return v7;
}

- (void)willSendRequest:(id)a3 decisionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1895F87A8];
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke;
    aBlock[3] = &unk_18A08FB50;
    aBlock[4] = self;
    id v23 = v6;
    id v9 = v7;
    id v24 = v9;
    dispatch_group_t v10 = (void (**)(void))_Block_copy(aBlock);
    v20[0] = v8;
    v20[1] = 3221225472LL;
    v20[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4;
    v20[3] = &unk_18A0908C8;
    v20[4] = self;
    id v11 = v9;
    id v21 = v11;
    objc_super v13 = _Block_copy(v20);
    if (self && objc_getProperty(self, v12, 128LL, 1))
    {
      id Property = objc_getProperty(self, v14, 128LL, 1);
      v16[0] = v8;
      v16[1] = 3221225472LL;
      v16[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6;
      v16[3] = &unk_18A08C490;
      v16[4] = self;
      id v17 = v11;
      id v18 = v13;
      v19 = v10;
      -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, Property, v16);
    }

    else
    {
      v10[2](v10);
    }
  }
}

- (void)receivedResponse:(id)a3 decisionHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke;
    v8[3] = &unk_18A08C748;
    v8[4] = self;
    id v9 = v6;
    -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, a3, v8);
  }
}

- (void)receivedData:(id)a3 decisionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    if (self && self->_controlUnit)
    {
      if (objc_getProperty(self, v7, 128LL, 1))
      {
        uint64_t v10 = MEMORY[0x1895F87A8];
        aBlock[0] = MEMORY[0x1895F87A8];
        aBlock[1] = 3221225472LL;
        aBlock[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3;
        aBlock[3] = &unk_18A0908C8;
        aBlock[4] = self;
        id v11 = v8;
        id v26 = v11;
        id v12 = _Block_copy(aBlock);
        id Property = (dispatch_group_s *)objc_getProperty(self, v13, 216LL, 1);
        dispatch_group_enter(Property);
        id v16 = objc_getProperty(self, v15, 128LL, 1);
        v21[0] = v10;
        v21[1] = 3221225472LL;
        v21[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5;
        v21[3] = &unk_18A08C4B8;
        v21[4] = self;
        id v23 = v11;
        id v24 = v12;
        id v22 = v6;
        id v17 = v12;
        -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, v16, v21);

        id v18 = v26;
      }

      else
      {
        v20 = (dispatch_queue_s *)objc_getProperty(self, v9, 144LL, 1);
        v27[0] = MEMORY[0x1895F87A8];
        v27[1] = 3221225472LL;
        v27[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2;
        v27[3] = &unk_18A090940;
        id v28 = v8;
        dispatch_async(v20, v27);
        id v18 = v28;
      }
    }

    else
    {
      self->_status = 1LL;
      v19 = (dispatch_queue_s *)objc_getProperty(self, v7, 144LL, 1);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke;
      block[3] = &unk_18A0908C8;
      block[4] = self;
      id v30 = v8;
      dispatch_async(v19, block);
      id v18 = v30;
    }
  }
}

- (void)finishedLoadingWithDecisionHandler:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id v6 = (dispatch_group_s *)objc_getProperty(self, v4, 216LL, 1);
    id Property = (dispatch_queue_s *)objc_getProperty(self, v7, 144LL, 1);
  }

  else
  {
    id v6 = 0LL;
    id Property = 0LL;
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke;
  v10[3] = &unk_18A0908C8;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_group_notify(v6, Property, v10);
}

- (void)remediateWithDecisionHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self && (objc_setProperty_atomic(self, v4, 0LL, 160LL), self->_expectRemediation))
    {
      -[NEFilterSource url](self, "url");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = objc_getProperty(self, v9, 184LL, 1);
      uint64_t controlUnit = self->_controlUnit;
      if ((_DWORD)controlUnit)
      {
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3;
        v15[3] = &unk_18A08C4E0;
        v15[4] = self;
        id v18 = v5;
        id v16 = v8;
        id v17 = v11;
        -[NEFilterSource connectToFilterUnit:withCompletionHandler:]((uint64_t)self, controlUnit, v15);

        SEL v13 = v18;
      }

      else
      {
        self->_status = 1LL;
        id Property = (dispatch_queue_s *)objc_getProperty(self, v10, 144LL, 1);
        v19[0] = MEMORY[0x1895F87A8];
        v19[1] = 3221225472LL;
        v19[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2;
        v19[3] = &unk_18A0908C8;
        v19[4] = self;
        id v20 = v5;
        dispatch_async(Property, v19);
        SEL v13 = v20;
      }
    }

    else
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "remediateWithDecisionHandler: dont expect remediation",  buf,  2u);
      }

      if (self) {
        self = (NEFilterSource *)objc_getProperty(self, v7, 144LL, 1);
      }
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke;
      block[3] = &unk_18A090940;
      id v22 = v5;
      dispatch_async((dispatch_queue_t)self, block);
      id v8 = v22;
    }
  }
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (unint64_t)socketIdentifier
{
  return self->_socketIdentifier;
}

- (NSString)sourceAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSourceAppIdentifier:(id)a3
{
}

- (int)sourceAppPid
{
  return self->_sourceAppPid;
}

- (void)setSourceAppPid:(int)a3
{
  self->_sourceAppPid = a3;
}

- (void).cxx_destruct
{
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 80LL, 1);
    }
    [Property getUUIDBytes:uuid];
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v6, "command", 5LL);
    xpc_dictionary_set_uuid(v6, "flow-uuid", uuid);
    id v7 = [*(id *)(a1 + 40) absoluteString];
    xpc_dictionary_set_string(v6, "url", (const char *)[v7 UTF8String]);

    id v8 = *(void **)(a1 + 48);
    if (v8)
    {
      id v9 = [v8 absoluteString];
      xpc_dictionary_set_string(v6, "parent-url", (const char *)[v9 UTF8String]);
    }

    id v15 = *(id *)(a1 + 56);
    ne_filter_send_message();
  }

  else
  {
    *(void *)(*(void *)(a1 + 32) + 24LL) = 2LL;
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uuid = 0;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "remediateWithDecisionHandler: could not establish connection to data provider",  uuid,  2u);
    }

    id v12 = *(void **)(a1 + 32);
    if (v12) {
      SEL v13 = (dispatch_queue_s *)objc_getProperty(v12, v11, 144LL, 1);
    }
    else {
      SEL v13 = 0LL;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_71;
    block[3] = &unk_18A0908C8;
    id v14 = *(id *)(a1 + 56);
    void block[4] = *(void *)(a1 + 32);
    id v17 = v14;
    dispatch_async(v13, block);
  }
}

- (void)connectToFilterUnit:(void *)a3 withCompletionHandler:
{
  v3 = a3;
  if (v3)
  {
    id v4 = (void *)ne_filter_copy_connection();
    if (v4)
    {
      v3[2](v3, v4);
    }

    else
    {
      id v5 = v3;
      ne_filter_request_connection();
    }
  }
}

void __60__NEFilterSource_connectToFilterUnit_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (id)ne_filter_copy_connection();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2_72(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80LL, 1);
    }
    *(_DWORD *)buf = 138412546;
    id v17 = Property;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "NEFilterSource got remediation reply %@: %@",  buf,  0x16u);
  }

  if (!v3 || MEMORY[0x1895ADD58](v3) != MEMORY[0x1895F9250])
  {
    uint64_t v7 = *(void *)(a1 + 32);
LABEL_5:
    uint64_t v8 = 2LL;
    goto LABEL_6;
  }

  BOOL v12 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v7 = *(void *)(a1 + 32);
  if (v12) {
    goto LABEL_5;
  }
  uint64_t v8 = 1LL;
LABEL_6:
  *(void *)(v7 + 24) = v8;
  id v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v10 = (dispatch_queue_s *)objc_getProperty(v9, v6, 144LL, 1);
  }
  else {
    uint64_t v10 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_73;
  v14[3] = &unk_18A0908C8;
  id v11 = *(id *)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v11;
  dispatch_async(v10, v14);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_73(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  uint64_t v4 = v1[3];
  -[NEFilterSource filterOptions](v1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (id)filterOptions
{
  if (!a1) {
    goto LABEL_17;
  }
  if ([a1 status] == 2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NEFilterBlockPage);
    [a1 url];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 absoluteString];
    xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      objc_setProperty_atomic_copy(v3, v5, v6, 24LL);
    }

    if (objc_getProperty(a1, v7, 160LL, 1))
    {
      id Property = objc_getProperty(a1, v8, 160LL, 1);
      if (v3)
      {
        objc_setProperty_atomic_copy(v3, v10, Property, 32LL);
        objc_setProperty_atomic_copy(v3, v11, &stru_18A0915E8, 40LL);
      }

      if (objc_msgSend(objc_getProperty(a1, v10, 168, 1), "length"))
      {
        BOOL v12 = (__CFString *)objc_getProperty(a1, v8, 168LL, 1);
        if (v3)
        {
          SEL v13 = v12;
LABEL_20:
          v25 = v3;
          ptrdiff_t v26 = 48LL;
          goto LABEL_21;
        }
      }

      else if (v3)
      {
        SEL v13 = @"Request Access";
        goto LABEL_20;
      }
    }

    else if (v3)
    {
      SEL v13 = @"display:none";
      v25 = v3;
      ptrdiff_t v26 = 40LL;
LABEL_21:
      objc_setProperty_atomic_copy(v25, v8, v13, v26);
    }

    if (objc_getProperty(a1, v8, 176LL, 1))
    {
      id v28 = objc_getProperty(a1, v27, 176LL, 1);
      v29 = v28;
      if (v3)
      {
        if (v28 && [v28 length])
        {
          uint64_t v30 = [NSString stringWithFormat:@" by &ldquo%@&rdquo;", v29];;
          organization = v3->_organization;
          v3->_organization = (NSString *)v30;
        }

        else
        {
          organization = v3->_organization;
          v3->_organization = (NSString *)&stru_18A0915E8;
        }
      }
    }
    v32 = -[NEFilterBlockPage page](v3);
    if (v32)
    {
      id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v32 dataUsingEncoding:4];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)[v33 copy];
      [v14 setObject:v34 forKeyedSubscript:@"PageData"];

      if (objc_getProperty(a1, v35, 160LL, 1)) {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_getProperty(a1, v36, 160, 1), @"RemediationURL");
      }
    }

    else
    {
      id v14 = 0LL;
    }

    return v14;
  }

  if (!objc_getProperty(a1, v2, 152LL, 1))
  {
LABEL_17:
    id v14 = 0LL;
    return v14;
  }

  id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
  [a1 url];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [a1 url];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 absoluteString];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = objc_getProperty(a1, v19, 152LL, 1);
    id v21 = v18;
    id v22 = v20;
    id v23 = &stru_18A0915E8;
    if ([v21 containsString:@"?"])
    {
      id v24 = @"&";
    }

    else
    {
      id v24 = @"?";
    }

    [MEMORY[0x189607810] URLQueryAllowedCharacterSet];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 stringByAddingPercentEncodingWithAllowedCharacters:v37];
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    [NSString stringWithFormat:@"%@%@%@%@", v21, v23, v24, v38];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604030] URLWithString:v39];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40) {
      id v41 = v39;
    }
    else {
      id v41 = 0LL;
    }

    if (v41) {
      [v14 setObject:v41 forKeyedSubscript:@"RedirectURL"];
    }
  }

  v42 = (void *)objc_msgSend(objc_getProperty(a1, v16, 152, 1), "copy");
  [v14 setObject:v42 forKeyedSubscript:@"URLAppendString"];

  objc_setProperty_atomic(a1, v43, 0LL, 152LL);
  return v14;
}

void __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v4 = v2;
  if (v1) {
    BOOL v5 = v2 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if ((*(_BYTE *)(v1 + 8) & 1) != 0 && !*(_DWORD *)(v1 + 16))
    {
      *(void *)(v1 + 24) = 1LL;
      id Property = (dispatch_queue_s *)objc_getProperty((id)v1, v3, 144LL, 1);
      uint64_t v16 = MEMORY[0x1895F87A8];
      uint64_t v17 = 3221225472LL;
      __int16 v18 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke;
      SEL v19 = &unk_18A0908C8;
      uint64_t v20 = v1;
      id v21 = v4;
      dispatch_async(Property, &v16);
      id v14 = v21;
    }

    else
    {
      if (!objc_getProperty((id)v1, v3, 128LL, 1))
      {
        SEL v7 = (dispatch_queue_s *)objc_getProperty((id)v1, v6, 144LL, 1);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2;
        block[3] = &unk_18A090940;
        id v26 = v4;
        dispatch_async(v7, block);
      }

      uint64_t v8 = MEMORY[0x1895F87A8];
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3;
      aBlock[3] = &unk_18A0908C8;
      aBlock[4] = v1;
      id v9 = v4;
      id v24 = v9;
      uint64_t v10 = _Block_copy(aBlock);
      id v12 = objc_getProperty((id)v1, v11, 128LL, 1);
      uint64_t v16 = v8;
      uint64_t v17 = 3221225472LL;
      __int16 v18 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5;
      SEL v19 = &unk_18A08C468;
      uint64_t v20 = v1;
      id v21 = v9;
      id v22 = v10;
      id v13 = v10;
      -[NEFilterSource prepareAgentForResponse:handler:](v1, v12, &v16);

      id v14 = v24;
    }
  }
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3( uint64_t a1,  const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v3, a2, 144LL, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
    id Property = 0LL;
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4;
  v6[3] = &unk_18A0908C8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_16;
  }
  int v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v14 = 2LL;
LABEL_17:
      *(void *)(v5 + 24) = v14;
      id v15 = *(void **)(a1 + 32);
      if (v15) {
        id Property = (dispatch_queue_s *)objc_getProperty(v15, v3, 144LL, 1);
      }
      else {
        id Property = 0LL;
      }
      length_4[0] = MEMORY[0x1895F87A8];
      length_4[1] = 3221225472LL;
      length_4[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6;
      length_4[3] = &unk_18A0908C8;
      id v17 = *(id *)(a1 + 40);
      length_4[4] = *(void *)(a1 + 32);
      id v24 = v17;
      dispatch_async(Property, length_4);

      goto LABEL_23;
    }

- (void)prepareAgentForResponse:(void *)a3 handler:
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    [v6 URL];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)a1, v8, v6, 128LL);

    [(id)a1 setUrl:v7];
    if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x189608E10]);
      [v9 setUrl:v7];
      objc_msgSend(v9, "setPid:", objc_msgSend((id)a1, "sourceAppPid"));
      [(id)a1 sourceAppIdentifier];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 isEqualToString:@"com.apple.SafariViewService"])
      {
        int v11 = [v9 pid];

        if (v11 >= 1) {
          [(id)a1 setSourceAppIdentifier:0];
        }
      }

      else
      {
      }

      [(id)a1 sourceAppIdentifier];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setSourceApplicationWithBundleID:v12];

      if (![v9 pid])
      {
        [v9 effectiveBundleID];
        int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          ne_log_obj();
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buffer = 0;
            _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "WebKit did not give us any information",  buffer,  2u);
          }
        }
      }

      if ((int)[(id)a1 sourceAppPid] >= 1)
      {
        int v15 = [(id)a1 sourceAppPid];
        if (v15 != getpid())
        {
          if (proc_pidinfo([(id)a1 sourceAppPid], 17, 1uLL, buffer, 56) == 56)
          {
            uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
            [v9 setProcessUUID:v16];

            id v17 = (os_log_s *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
            [v9 setEffectiveProcessUUID:v17];
          }

          else
          {
            ne_log_obj();
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v45 = [(id)a1 sourceAppPid];
              _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to UUID",  buf,  8u);
            }
          }
        }
      }

      [v7 host];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        [v7 port];
        SEL v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 stringValue];
        id v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          id v21 = (void *)MEMORY[0x189608DF8];
          [v7 host];
          id v43 = v5;
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 port];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 stringValue];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 endpointWithHostname:v22 port:v24];
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          id v5 = v43;
        }

        else
        {
          v25 = 0LL;
        }
      }

      else
      {
        v25 = 0LL;
      }

      id v26 = (void *)[objc_alloc(MEMORY[0x189608E20]) initWithEndpoint:v25 parameters:v9];
      objc_setProperty_atomic((id)a1, v27, v26, 72LL);

      objc_msgSend(objc_getProperty((id)a1, v28, 72, 1), "path");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 clientID];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic((id)a1, v31, v30, 80LL);

      objc_msgSend(objc_getProperty((id)a1, v32, 72, 1), "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1 + 16) = [v33 filterControlUnit];
    }

    [(id)a1 url];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    id v36 = objc_getProperty((id)a1, v35, 136LL, 1);
    id v38 = objc_getProperty((id)a1, v37, 128LL, 1);
    id v40 = objc_getProperty((id)a1, v39, 184LL, 1);
    id Property = objc_getProperty((id)a1, v41, 80LL, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:]( a1,  v34,  v36,  v38,  v40,  2LL,  Property,  v5);
  }

- (void)prepareAgentForURL:(void *)a3 urlRequest:(void *)a4 urlResponse:(void *)a5 parentURL:(uint64_t)a6 direction:(void *)a7 flowUUID:(void *)a8 handler:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void (**)(void, void))v20;
  if (v20)
  {
    uint64_t v22 = *(unsigned int *)(a1 + 16);
    if ((_DWORD)v22)
    {
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke;
      v24[3] = &unk_18A08C418;
      v24[4] = a1;
      id v30 = v20;
      id v25 = v19;
      id v26 = v15;
      id v27 = v18;
      id v28 = v16;
      id v29 = v17;
      uint64_t v31 = a6;
      -[NEFilterSource connectToFilterUnit:withCompletionHandler:](a1, v22, v24);
    }

    else
    {
      *(void *)(a1 + 24) = 1LL;
      ne_log_obj();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEBUG,  "prepareAgentForURL: uint64_t controlUnit = 0, skipping content filtering",  buf,  2u);
      }

      v21[2](v21, 0LL);
    }
  }
}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    *(void *)(v4 + 24) = 2LL;
    id v16 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
LABEL_18:
    v16();
    goto LABEL_25;
  }

  if (v4 && (*(_BYTE *)(v4 + 8) & 1) != 0)
  {
    id v16 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
    goto LABEL_18;
  }

  [*(id *)(a1 + 40) getUUIDBytes:uuid];
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v5, "command", 2LL);
  xpc_dictionary_set_uuid(v5, "flow-uuid", uuid);
  id v6 = [*(id *)(a1 + 48) absoluteString];
  xpc_dictionary_set_string(v5, "url", (const char *)[v6 UTF8String]);

  [*(id *)(a1 + 32) sourceAppIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) sourceAppIdentifier];
    xpc_dictionary_set_string(v5, "source-app-bundle-id", (const char *)[v8 UTF8String]);
  }

  pid_t v9 = getpid();
  xpc_dictionary_set_uint64(v5, "source-pid", v9);
  uint64_t v10 = *(void **)(a1 + 56);
  if (v10)
  {
    id v11 = [v10 absoluteString];
    xpc_dictionary_set_string(v5, "parent-url", (const char *)[v11 UTF8String]);
  }

  if (*(void *)(a1 + 64))
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    [v12 encodeObject:*(void *)(a1 + 64) forKey:@"URL_Request"];
    [v12 finishEncoding];
    [v12 encodedData];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v5, "url-request", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  }

  if (*(void *)(a1 + 72))
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    [v14 encodeObject:*(void *)(a1 + 72) forKey:@"URL_Response"];
    [v14 finishEncoding];
    [v14 encodedData];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v5, "url-response", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  }

  xpc_dictionary_set_int64(v5, "direction", *(void *)(a1 + 88));
  xpc_dictionary_set_uint64(v5, "connection-direction", 1uLL);
  xpc_dictionary_set_uint64(v5, "socket-identifier", [*(id *)(a1 + 32) socketIdentifier]);
  if (-[NEFilterSource generateCryptoSignature:length:](*(void **)(a1 + 32), bytes, &length))
  {
    xpc_dictionary_set_data(v5, "crypto-signature", bytes, length);
  }

  else
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      int length_4 = 138412290;
      uint64_t v26 = v20;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "NEFilterSource failed to sign new flow message for %@",  (uint8_t *)&length_4,  0xCu);
    }
  }

  ne_log_obj();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    int length_4 = 138412290;
    uint64_t v26 = v19;
    _os_log_debug_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_DEBUG,  "NEFilterSource send new flow %@",  (uint8_t *)&length_4,  0xCu);
  }

  id v21 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 80);
  id v22 = v3;
  ne_filter_send_message();

LABEL_25:
}

- (uint64_t)generateCryptoSignature:(_DWORD *)a3 length:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v26 = 0LL;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  if (a2 && a3)
  {
    objc_msgSend(objc_getProperty(a1, a2, 80, 1), "getUUIDBytes:", &v16);
    DWORD2(v17) = 1;
    HIDWORD(v21) = [a1 sourceAppPid];
    DWORD2(v21) = getpid();
    uint64_t v6 = a1[26];
    *((void *)&v25 + 1) = a1[25];
    uint64_t v26 = v6;
    id v7 = [a1 sourceAppIdentifier];
    id v8 = (const char *)[v7 UTF8String];

    [a1 url];
    pid_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 absoluteString];
    id v11 = (const char *)[v10 UTF8String];

    *a3 = 32;
    if (v8)
    {
      strlen(v8);
      if (!v11)
      {
LABEL_8:
        uint64_t v3 = ne_filter_sign_data();
        ne_log_obj();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        int64_t v13 = v12;
        if ((v3 & 1) != 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEBUG,  "generateCryptoSignature: signed flow message",  buf,  2u);
          }
        }

        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "generateCryptoSignature: Failed to sign flow message",  buf,  2u);
        }

        return v3;
      }
    }

    else if (!v11)
    {
      goto LABEL_8;
    }

    strlen(v11);
    goto LABEL_8;
  }

  return v3;
}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke_19( void *a1,  void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || MEMORY[0x1895ADD58](v3) != MEMORY[0x1895F9250])
  {
    *(void *)(a1[4] + 24LL) = 2LL;
    ne_log_obj();
    xpc_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v32) = 0;
      _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "NEFilterSource could not add new flow",  (uint8_t *)&v32,  2u);
    }

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80LL, 1);
    }
    int v25 = 138412546;
    id v26 = Property;
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "NEFilterSource finishedLoadingWithDecisionHandler got inbound-data-completion reply %@: %@",  (uint8_t *)&v25,  0x16u);
  }

  if (!v3 || MEMORY[0x1895ADD58](v3) != MEMORY[0x1895F9250])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2LL;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }

  BOOL v8 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v8)
  {
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  *(void *)(v6 + 24) = 2LL;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v10, v11, 160LL);
    }

    id v14 = *(id *)(a1 + 32);
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 160LL, 1);
    }
    if ([v14 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v15 = *(void *)(a1 + 32);
      if (v15) {
        *(_BYTE *)(v15 + 9) = 1;
      }
    }
  }

  __int128 v16 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v16)
  {
    [NSString stringWithUTF8String:v16];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = *(void **)(a1 + 32);
    if (v19) {
      objc_setProperty_atomic(v19, v17, v18, 168LL);
    }
  }

  __int128 v20 = xpc_dictionary_get_string(v3, "organization");
  if (v20)
  {
    [NSString stringWithUTF8String:v20];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v23 = *(void **)(a1 + 32);
    if (v23) {
      objc_setProperty_atomic(v23, v21, v22, 176LL);
    }
  }

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4( uint64_t a1,  const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, 0LL, 128LL);
    id v3 = *(void **)(a1 + 32);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [v3 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v3, a2, 144LL, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
    id Property = 0LL;
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4;
  v6[3] = &unk_18A0908C8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_15;
  }
  int v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v13 = 2LL;
LABEL_16:
      *(void *)(v5 + 24) = v13;
      id v14 = *(void **)(a1 + 32);
      if (v14) {
        id Property = (dispatch_queue_s *)objc_getProperty(v14, v3, 144LL, 1);
      }
      else {
        id Property = 0LL;
      }
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6;
      block[3] = &unk_18A0908C8;
      id v16 = *(id *)(a1 + 48);
      void block[4] = *(void *)(a1 + 32);
      id v22 = v16;
      dispatch_async(Property, block);
      __int128 v18 = *(dispatch_group_s **)(a1 + 32);
      if (v18) {
        __int128 v18 = (dispatch_group_s *)objc_getProperty(v18, v17, 216LL, 1);
      }
      dispatch_group_leave(v18);
      uint64_t v12 = v22;
      goto LABEL_21;
    }

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (uint64_t)sendDataToPluginWithConnection:(void *)a3 completionHandler:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_22;
  }
  if (*(void *)(a1 + 120) == -1LL
    || !objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length")
    || (unint64_t v8 = *(void *)(a1 + 120),
        uint64_t v9 = *(void *)(a1 + 104),
        v8 >= objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length") + v9))
  {
    id v12 = objc_getProperty((id)a1, v6, 64LL, 1);
    objc_msgSend( v12,  "replaceBytesInRange:withBytes:length:",  0,  objc_msgSend(objc_getProperty((id)a1, v13, 64, 1), "length"),  0,  0);

    goto LABEL_8;
  }

  unint64_t v10 = *(void *)(a1 + 120);
  unint64_t v11 = *(void *)(a1 + 104);
  if (v10 > v11)
  {
    objc_msgSend( objc_getProperty((id)a1, v6, 64, 1),  "replaceBytesInRange:withBytes:length:",  0,  v10 - v11,  0,  0);
LABEL_8:
    *(void *)(a1 + 104) = *(void *)(a1 + 120);
  }

  unint64_t v14 = objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length");
  uint64_t v16 = *(void *)(a1 + 104);
  if (v14 >= *(void *)(a1 + 112) - v16) {
    size_t v17 = *(void *)(a1 + 112) - v16;
  }
  else {
    size_t v17 = v14;
  }
  if (*(void *)(a1 + 88) == v16 && *(void *)(a1 + 96) == v17)
  {
    ne_log_obj();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1876B1000, v18, OS_LOG_TYPE_INFO, "Duplicate request made.", buf, 2u);
    }

    goto LABEL_21;
  }

  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v17;
  if (!v17)
  {
LABEL_21:
    a1 = 0LL;
    goto LABEL_22;
  }

  objc_msgSend(objc_getProperty((id)a1, v15, 80, 1), "getUUIDBytes:", buf);
  xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v19, "command", 3LL);
  xpc_dictionary_set_uuid(v19, "flow-uuid", buf);
  __int128 v21 = (const void *)objc_msgSend(objc_getProperty( (id) a1, v20, 64, 1), "bytes");
  xpc_dictionary_set_data(v19, "data", v21, v17);
  xpc_dictionary_set_uint64(v19, "data-start-offset", *(void *)(a1 + 104));
  xpc_dictionary_set_int64(v19, "direction", 2LL);
  if (objc_getProperty((id)a1, v22, 128LL, 1))
  {
    __int128 v23 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    objc_msgSend(v23, "encodeObject:forKey:", objc_getProperty((id)a1, v24, 128, 1), @"URL_Response");
    [v23 finishEncoding];
    [v23 encodedData];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v19, "url-response", (const void *)[v25 bytes], objc_msgSend(v25, "length"));
  }

  id v27 = v5;
  id v28 = v7;
  ne_filter_send_message();

  a1 = 1LL;
LABEL_22:

  return a1;
}

void __67__NEFilterSource_sendDataToPluginWithConnection_completionHandler___block_invoke( void *a1,  void *a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80LL, 1);
    }
    int v28 = 138412546;
    id v29 = Property;
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "NEFilterSource got send-inbound-data reply %@: %@",  (uint8_t *)&v28,  0x16u);
  }

  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9250])
  {
    if (xpc_dictionary_get_BOOL(v3, "verdict-drop"))
    {
      *(void *)(a1[4] + 24LL) = 2LL;
      string = xpc_dictionary_get_string(v3, "remediation-url");
      if (string)
      {
        [NSString stringWithUTF8String:string];
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v11 = (void *)a1[4];
        if (v11) {
          objc_setProperty_atomic(v11, v9, v10, 160LL);
        }

        id v13 = (id)a1[4];
        if (v13) {
          id v13 = objc_getProperty(v13, v12, 160LL, 1);
        }
        if ([v13 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
        {
          uint64_t v14 = a1[4];
          if (v14) {
            *(_BYTE *)(v14 + 9) = 1;
          }
        }
      }

      uint64_t v15 = xpc_dictionary_get_string(v3, "remediation-button-text");
      if (v15)
      {
        [NSString stringWithUTF8String:v15];
        size_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v18 = (void *)a1[4];
        if (v18) {
          objc_setProperty_atomic(v18, v16, v17, 168LL);
        }
      }

      xpc_object_t v19 = xpc_dictionary_get_string(v3, "organization");
      if (v19)
      {
        [NSString stringWithUTF8String:v19];
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
        SEL v22 = (void *)a1[4];
        if (v22) {
          objc_setProperty_atomic(v22, v20, v21, 176LL);
        }
      }

      goto LABEL_6;
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "verdict-peek");
    uint64_t v24 = a1[4];
    if (v24) {
      *(void *)(v24 + 112) = uint64;
    }
    uint64_t v25 = xpc_dictionary_get_uint64(v3, "verdict-pass");
    uint64_t v6 = a1[4];
    uint64_t v26 = *(void *)(v6 + 120);
    if (v25 > v26)
    {
      *(void *)(v6 + 120) = v25;
      uint64_t v6 = a1[4];
      uint64_t v26 = *(void *)(v6 + 120);
    }

    if (v26 != -1LL)
    {
      *(void *)(v6 + 24) = 3LL;
      if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](a1[4], a1[5], a1[6]) & 1) != 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }

    uint64_t v7 = 1LL;
  }

  else
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = 2LL;
  }

  *(void *)(v6 + 24) = v7;
LABEL_6:
  (*(void (**)(void))(a1[6] + 16LL))();
LABEL_7:
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0LL, 128LL);
    id v4 = *(void **)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  id Property = *(dispatch_group_s **)(a1 + 32);
  if (Property) {
    id Property = (dispatch_group_s *)objc_getProperty(Property, v8, 216LL, 1);
  }
  dispatch_group_leave(Property);
}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v3, a2, 144LL, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
    id Property = 0LL;
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2;
  v6[3] = &unk_18A0908C8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0LL, 128LL);
    id v4 = *(void **)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2;
  v48[3] = &unk_18A08C748;
  v48[4] = v2;
  id v3 = *(id *)(a1 + 48);
  id v49 = v3;
  if (v2)
  {
    id v4 = v48;
    id v5 = v1;
    [v5 URL];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)v2, v7, 0LL, 128LL);
    id v8 = objc_alloc_init(MEMORY[0x189608E10]);
    [v8 setUrl:v6];
    objc_msgSend(v8, "setPid:", objc_msgSend((id)v2, "sourceAppPid"));
    [(id)v2 sourceAppIdentifier];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 isEqualToString:@"com.apple.SafariViewService"])
    {
      int v10 = [v8 pid];

      if (v10 >= 1) {
        [(id)v2 setSourceAppIdentifier:0];
      }
    }

    else
    {
    }

    [(id)v2 sourceAppIdentifier];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setSourceApplicationWithBundleID:v11];

    if (![v8 pid])
    {
      [v8 effectiveBundleID];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        ne_log_obj();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buffer = 0;
          _os_log_debug_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEBUG,  "WebKit did not give us any information",  buffer,  2u);
        }
      }
    }

    if ((int)[(id)v2 sourceAppPid] >= 1)
    {
      int v14 = [(id)v2 sourceAppPid];
      if (v14 != getpid())
      {
        if (proc_pidinfo([(id)v2 sourceAppPid], 17, 1uLL, buffer, 56) == 56)
        {
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
          [v8 setProcessUUID:v15];

          uint64_t v16 = (os_log_s *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
          [v8 setEffectiveProcessUUID:v16];
        }

        else
        {
          ne_log_obj();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v45 = [(id)v2 sourceAppPid];
            *(_DWORD *)buf = 67109120;
            int v51 = v45;
            _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to UUID",  buf,  8u);
          }
        }
      }
    }

    [v6 host];
    size_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      id v47 = v5;
      [v6 port];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 stringValue];
      xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        SEL v20 = (void *)MEMORY[0x189608DF8];
        [v6 host];
        id v46 = v8;
        __int128 v21 = v4;
        SEL v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 port];
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 stringValue];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 endpointWithHostname:v22 port:v24];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

        id v4 = v21;
        id v8 = v46;
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      id v5 = v47;
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x189608E20]) initWithEndpoint:v25 parameters:v8];
    objc_setProperty_atomic((id)v2, v27, v26, 72LL);

    objc_msgSend(objc_getProperty((id)v2, v28, 72, 1), "path");
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 clientID];
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)v2, v31, v30, 80LL);

    objc_setProperty_atomic((id)v2, v32, v5, 136LL);
    [v5 HTTPBody];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

    *(void *)(v2 + 208) += [v33 length];
    [(id)v2 setUrl:v6];
    objc_msgSend(objc_getProperty((id)v2, v34, 72, 1), "path");
    SEL v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v2 + 16) = [v35 filterControlUnit];

    [(id)v2 url];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    id v38 = objc_getProperty((id)v2, v37, 136LL, 1);
    id v40 = objc_getProperty((id)v2, v39, 128LL, 1);
    id v42 = objc_getProperty((id)v2, v41, 184LL, 1);
    id Property = objc_getProperty((id)v2, v43, 80LL, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:]( v2,  v36,  v38,  v40,  v42,  1LL,  Property,  v4);

    id v3 = v49;
  }
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v3, a2, 144LL, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
    id Property = 0LL;
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5;
  v6[3] = &unk_18A0908C8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6(id *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  uint64_t v5 = a1[4];
  if (!v5) {
    goto LABEL_17;
  }
  int v6 = v5[4];
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v8 = 2LL;
LABEL_18:
      *((void *)v5 + 3) = v8;
      id v16 = a1[4];
      if (v16) {
        id Property = (dispatch_queue_s *)objc_getProperty(v16, v3, 144LL, 1);
      }
      else {
        id Property = 0LL;
      }
      length_4[0] = MEMORY[0x1895F87A8];
      length_4[1] = 3221225472LL;
      length_4[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7;
      length_4[3] = &unk_18A0908C8;
      id v18 = a1[5];
      length_4[4] = a1[4];
      id v26 = v18;
      dispatch_async(Property, length_4);

      goto LABEL_26;
    }

uint64_t __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80LL, 1);
    }
    int v26 = 138412546;
    id v27 = Property;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "NEFilterSource willSendRequest got inbound-data-completion reply %@: %@",  (uint8_t *)&v26,  0x16u);
  }

  if (!v3 || MEMORY[0x1895ADD58](v3) != MEMORY[0x1895F9250])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2LL;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v9)
  {
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  *(void *)(v6 + 24) = 2LL;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v13 = *(void **)(a1 + 32);
    if (v13) {
      objc_setProperty_atomic(v13, v11, v12, 160LL);
    }

    id v15 = *(id *)(a1 + 32);
    if (v15) {
      id v15 = objc_getProperty(v15, v14, 160LL, 1);
    }
    if ([v15 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        *(_BYTE *)(v16 + 9) = 1;
      }
    }
  }

  size_t v17 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v17)
  {
    [NSString stringWithUTF8String:v17];
    xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v20 = *(void **)(a1 + 32);
    if (v20) {
      objc_setProperty_atomic(v20, v18, v19, 168LL);
    }
  }

  id v21 = xpc_dictionary_get_string(v3, "organization");
  if (v21)
  {
    [NSString stringWithUTF8String:v21];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = *(void **)(a1 + 32);
    if (v24) {
      objc_setProperty_atomic(v24, v22, v23, 176LL);
    }
  }

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0LL, 128LL);
    id v4 = *(void **)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    id Property = (dispatch_queue_s *)objc_getProperty(v3, a2, 144LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3;
  v6[3] = &unk_18A0908C8;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(Property, v6);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (void)initGlobals
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  id v3 = (id)nw_context_copy_implicit_context();
  id v4 = v2;
  nw_queue_context_async();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  *(void *)(a1 + 192) = v6[3];

  _Block_object_dispose(&v5, 8);
}

uint64_t __29__NEFilterSource_initGlobals__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = nw_context_get_globals_for_protocol();

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_16;
  }
  int v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      uint64_t v13 = 2LL;
LABEL_17:
      *(void *)(v4 + 24) = v13;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_18A0908C8;
      size_t v17 = *(dispatch_queue_s **)(a1 + 40);
      id v18 = *(id *)(a1 + 48);
      void block[4] = *(void *)(a1 + 32);
      id v28 = v18;
      dispatch_async(v17, block);
      uint64_t v16 = v28;
      goto LABEL_18;
    }

- (void)prepareAgentWithHandler:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    [a1 url];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = objc_getProperty(a1, v4, 136LL, 1);
    id v7 = objc_getProperty(a1, v6, 128LL, 1);
    id v9 = objc_getProperty(a1, v8, 184LL, 1);
    uint64_t v10 = [a1 direction];
    id Property = objc_getProperty(a1, v11, 80LL, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:]( (uint64_t)a1,  v13,  v5,  v7,  v9,  v10,  Property,  v3);
  }

uint64_t __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_67( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80LL, 1);
    }
    *(_DWORD *)buf = 138412546;
    id v30 = Property;
    __int16 v31 = 2112;
    id v32 = v3;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "NEFilterSource got inbound-data-completion reply %@: %@",  buf,  0x16u);
  }

  if (!v3 || MEMORY[0x1895ADD58](v3) != MEMORY[0x1895F9250])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2LL;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }

  BOOL v10 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v10)
  {
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  *(void *)(v6 + 24) = 2LL;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = *(void **)(a1 + 32);
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 160LL);
    }

    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v15, 160LL, 1);
    }
    if ([v16 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        *(_BYTE *)(v17 + 9) = 1;
      }
    }
  }

  id v18 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v18)
  {
    [NSString stringWithUTF8String:v18];
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = *(void **)(a1 + 32);
    if (v21) {
      objc_setProperty_atomic(v21, v19, v20, 168LL);
    }
  }

  id v22 = xpc_dictionary_get_string(v3, "organization");
  if (v22)
  {
    [NSString stringWithUTF8String:v22];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = *(void **)(a1 + 32);
    if (v25) {
      objc_setProperty_atomic(v25, v23, v24, 176LL);
    }
  }

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (id)replacementData
{
  id v1 = a1;
  if (a1)
  {
    if ([a1 status] == 2)
    {
      uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NEFilterBlockPage);
      [v1 url];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 absoluteString];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2) {
        objc_setProperty_atomic_copy(v2, v4, v5, 24LL);
      }

      -[NEFilterBlockPage page](v2);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        uint64_t v7 = v6;
        [v6 dataUsingEncoding:4];
        id v1 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v1 = 0LL;
      }
    }

    else
    {
      id v1 = 0LL;
    }
  }

  return v1;
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_13;
  }
  int v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      uint64_t v14 = 2LL;
LABEL_14:
      *(void *)(v4 + 24) = v14;
      id v15 = *(dispatch_queue_s **)(a1 + 40);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_18A0908C8;
      SEL v11 = &v27;
      id v18 = *(id *)(a1 + 56);
      void block[4] = *(void *)(a1 + 32);
      id v27 = v18;
      uint64_t v17 = block;
      goto LABEL_15;
    }

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) status],  0);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 32);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5;
  v4[3] = &unk_18A0908C8;
  id v3 = *(id *)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

+ (BOOL)filterRequired
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (g_delegation_audit_token)
  {
    id v2 = objc_alloc_init(MEMORY[0x189608E10]);
    __int128 v3 = *(_OWORD *)(g_delegation_audit_token + 16);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)g_delegation_audit_token;
    *(_OWORD *)&v14[16] = v3;
    [v2 setSourceApplicationWithToken:v14];
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)&v14[4] = "+[NEFilterSource filterRequired]";
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v2;
      _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%s: parameters %@", v14, 0x16u);
    }

    uint64_t v5 = [objc_alloc(MEMORY[0x189608E20]) initWithEndpoint:0 parameters:v2];
    uint64_t v6 = (void *)g_pathEvaluator;
    g_pathEvaluator = v5;

    id v7 = (void *)g_pathEvaluator;
  }

  else
  {
    [MEMORY[0x189608E20] sharedDefaultEvaluator];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v2 = v7;
  }

  [v7 path];
  SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 filterControlUnit];

  BOOL v11 = (v9 & 0x40000000) == 0 && v9 != 0;
  ne_log_obj();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)&v14[4] = "+[NEFilterSource filterRequired]";
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = v11;
    _os_log_debug_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEBUG, "%s: result %d", v14, 0x12u);
  }

  return v11;
}

+ (void)setDelegation:(id *)a3
{
  g_delegation_audit_token = (uint64_t)a3;
}

@end