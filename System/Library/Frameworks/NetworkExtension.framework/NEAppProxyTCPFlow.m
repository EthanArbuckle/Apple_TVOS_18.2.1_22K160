@interface NEAppProxyTCPFlow
- (NEAppProxyTCPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NWEndpoint)remoteEndpoint;
- (OS_nw_endpoint)remoteFlowEndpoint;
- (id)description;
- (void)readDataWithCompletionHandler:(void *)completionHandler;
- (void)writeData:(NSData *)data withCompletionHandler:(void *)completionHandler;
@end

@implementation NEAppProxyTCPFlow

- (NEAppProxyTCPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEAppProxyTCPFlow;
  v7 = -[NEAppProxyFlow initWithNEFlow:queue:](&v11, sel_initWithNEFlow_queue_, a3, v6);
  if (v7)
  {
    v8 = +[NEAppProxyFlow copyRemoteEndpointFromFlow:]();
    remoteFlowEndpoint = v7->_remoteFlowEndpoint;
    v7->_remoteFlowEndpoint = v8;

    if (!v7->_remoteFlowEndpoint) {
      __assert_rtn( "-[NEAppProxyTCPFlow initWithNEFlow:queue:]",  "NEAppProxyTCPFlow.m",  20,  "_remoteFlowEndpoint != nil");
    }
  }

  return v7;
}

- (void)readDataWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  v17 = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke;
  v18 = &unk_18A08B1C0;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = NEFlowAsyncRead();
  if (v7)
  {
    uint64_t v9 = v7;
    if (self) {
      id Property = objc_getProperty(self, v8, 40LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_super v11 = (dispatch_queue_s *)Property;
    block[0] = v5;
    block[1] = 3221225472LL;
    block[2] = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2;
    block[3] = &unk_18A08FC28;
    id v13 = v6;
    uint64_t v14 = v9;
    dispatch_async(v11, block);
  }
}

- (void)writeData:(NSData *)data withCompletionHandler:(void *)completionHandler
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = completionHandler;
  uint64_t v7 = data;
  char v8 = isa_nsdata(v7);
  uint64_t v9 = MEMORY[0x1895F87A8];
  if ((v8 & 1) == 0)
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        flow = self->super._flow;
      }
      else {
        flow = 0LL;
      }
      *(_DWORD *)buf = 134217984;
      CFHashCode v34 = CFHash(flow);
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "%lu: Data object passed is not an NSData",  buf,  0xCu);
    }

    if (self) {
      id Property = objc_getProperty(self, v11, 40LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v13 = (dispatch_queue_s *)Property;
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v32 = v6;
    dispatch_async(v13, block);
  }

  uint64_t v26 = v9;
  uint64_t v27 = 3221225472LL;
  v28 = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2;
  v29 = &unk_18A08B210;
  id v14 = v6;
  id v30 = v14;
  uint64_t v15 = NEFlowWrite();

  if (v15)
  {
    ne_log_obj();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        v20 = self->super._flow;
      }
      else {
        v20 = 0LL;
      }
      CFHashCode v21 = CFHash(v20);
      *(_DWORD *)buf = 134217984;
      CFHashCode v34 = v21;
      _os_log_error_impl(&dword_1876B1000, v16, OS_LOG_TYPE_ERROR, "%lu: Failed to write flow Data", buf, 0xCu);
    }

    if (self) {
      id v18 = objc_getProperty(self, v17, 40LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    id v19 = (dispatch_queue_s *)v18;
    v23[0] = v9;
    v23[1] = 3221225472LL;
    v23[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5;
    v23[3] = &unk_18A08FC28;
    id v24 = v14;
    uint64_t v25 = v15;
    dispatch_async(v19, v23);
  }
}

- (NWEndpoint)remoteEndpoint
{
  v2 = (void *)MEMORY[0x189608DF0];
  v3 = -[NEAppProxyTCPFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  [v2 endpointWithCEndpoint:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NWEndpoint *)v4;
}

- (id)description
{
  v3 = (void *)NSString;
  -[NEAppProxyFlow metaData](self, "metaData");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyTCPFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyFlow networkInterface](self, "networkInterface");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[NEAppProxyFlow isBound](self, "isBound");
  char v8 = &stru_18A0915E8;
  if (v7) {
    char v8 = @"(bound)";
  }
  [v3 stringWithFormat:@"TCP %@ remote: %@ interface %@%@", v4, v5, v6, v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (v8) {
    id v5 = v8;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a3);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

@end