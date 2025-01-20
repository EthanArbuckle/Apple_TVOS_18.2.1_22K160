@interface NEAppProxyFlow
+ (CFErrorRef)convertFlowErrorToCFError:(uint64_t)a1;
+ (id)errorForFlowError:(uint64_t)a1;
+ (nw_endpoint)copyRemoteEndpointFromFlow:;
- (BOOL)isBound;
- (NEAppProxyFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NEFlowMetaData)metaData;
- (NSData)applicationData;
- (NSString)remoteHostname;
- (id)description;
- (nw_interface_t)networkInterface;
- (uint64_t)clearEventHandlers;
- (unint64_t)hash;
- (void)closeReadWithError:(NSError *)error;
- (void)closeWriteWithError:(NSError *)error;
- (void)dealloc;
- (void)openWithLocalEndpoint:(NWHostEndpoint *)localEndpoint completionHandler:(void *)completionHandler;
- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4;
- (void)setApplicationData:(id)a3;
- (void)setIsBound:(BOOL)a3;
- (void)setMetadata:(nw_parameters_t)parameters;
- (void)setNetworkInterface:(nw_interface_t)networkInterface;
@end

@implementation NEAppProxyFlow

- (NEAppProxyFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NEAppProxyFlow;
  v8 = -[NEAppProxyFlow init](&v39, sel_init);
  if (!v8) {
    goto LABEL_23;
  }
  v8->_flow = (_NEFlow *)CFRetain(a3);
  objc_storeStrong((id *)&v8->_queue, a4);
  v9 = -[NEAppProxyFlow applicationData](v8, "applicationData");
  id v38 = 0LL;
  v10 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v9 error:&v38];
  id v11 = v38;
  if (v11)
  {
    ne_log_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

LABEL_6:
      v13 = objc_alloc(&OBJC_CLASS___NEFlowMetaData);
      if (v13)
      {
        v40.receiver = v13;
        v40.super_class = (Class)&OBJC_CLASS___NEFlowMetaData;
        v14 = -[NEAppProxyFlow init](&v40, sel_init);
        if (v14)
        {
          uint64_t v15 = NEFlowCopyProperty();
          remoteHostname = v14->_remoteHostname;
          v14->_remoteHostname = (NSString *)v15;

          uint64_t v17 = NEFlowCopyProperty();
          metaData = v14->_metaData;
          v14->_metaData = (NEFlowMetaData *)v17;

          uint64_t v19 = NEFlowCopyProperty();
          flow = v14->_flow;
          v14->_flow = (_NEFlow *)v19;

          v21 = (void *)NEFlowCopyProperty();
          if (isa_nsnumber(v21))
          {
            v14->_isBound = ([v21 unsignedIntValue] & 2) != 0;
            *(&v14->_isBound + 1) = ([v21 unsignedIntValue] & 4) != 0;
          }

          v22 = (void *)NEFlowCopyProperty();
          if (isa_nsdata(v22) && [v22 length] == 16)
          {
            uint64_t v23 = objc_msgSend( objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", objc_msgSend(v22, "bytes"));
            queue = v14->_queue;
            v14->_queue = (OS_dispatch_queue *)v23;
          }
        }
      }

      else
      {
        v14 = 0LL;
      }

      v25 = 0LL;
      v26 = v8->_metaData;
      v8->_metaData = (NEFlowMetaData *)v14;
      goto LABEL_15;
    }

    LODWORD(v40.receiver) = 138412290;
    *(id *)((char *)&v40.receiver + 4) = v11;
    v35 = "Failed to decode the application data: %@";
    v36 = (os_log_s *)v12;
    uint32_t v37 = 12;
LABEL_29:
    _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v40, v37);
    goto LABEL_5;
  }

  uint64_t v33 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"MetaData"];
  if (!v33)
  {
    ne_log_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    LOWORD(v40.receiver) = 0;
    v35 = "Failed to decode the meta data from the application data";
    v36 = (os_log_s *)v12;
    uint32_t v37 = 2;
    goto LABEL_29;
  }

  v34 = (void *)v33;

  v25 = v34;
  v26 = v8->_metaData;
  v8->_metaData = v25;
LABEL_15:

  NEFlowSetDispatchQueue();
  v27 = (void *)NEFlowCopyProperty();
  v28 = (void *)NEFlowCopyProperty();
  if (isa_nsnumber(v28))
  {
    [v28 unsignedIntValue];
    v29 = (void *)nw_interface_create_with_index();
    objc_setProperty_atomic(v8, v30, v29, 48LL);
  }

  v31 = (void *)NEFlowCopyProperty();

LABEL_23:
  return v8;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NEAppProxyFlow *)self->_flow;
  }
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___NEAppProxyFlow;
  -[NEAppProxyFlow dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  if (self) {
    self = (NEAppProxyFlow *)self->_flow;
  }
  return CFHash(self);
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_flow);
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  v6 = (nw_endpoint *)a3;
  id v7 = a4;
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    __int16 v49 = 2112;
    v50 = v6;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "opening flow %@ with local %@", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = MEMORY[0x1895F87A8];
  if (v6)
  {
    address = nw_endpoint_get_address(v6);
    if (address)
    {
      [MEMORY[0x189603F48] dataWithBytes:address length:address->sa_len];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }

    if (!NEFlowSetProperty())
    {

      goto LABEL_19;
    }

    v13 = (void *)NEFlowCopyProperty();
    if (isa_nsnumber(v13))
    {
      [v13 unsignedIntValue];
      uint64_t v15 = (void *)nw_interface_create_with_index();
      if (v9) {
        objc_setProperty_atomic(v9, v14, v15, 48LL);
      }
    }
  }

  uint64_t v41 = v10;
  uint64_t v42 = 3221225472LL;
  v43 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v44 = &unk_18A08B198;
  id v16 = v7;
  v45 = v9;
  id v46 = v16;
  BOOL v17 = NEFlowSetEventHandler() == 0;

  if (v17) {
    goto LABEL_19;
  }
  uint64_t v35 = v10;
  uint64_t v36 = 3221225472LL;
  uint32_t v37 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2;
  id v38 = &unk_18A08B198;
  id v18 = v16;
  objc_super v39 = v9;
  id v40 = v18;
  BOOL v19 = NEFlowSetEventHandler() == 0;

  if (v19) {
    goto LABEL_19;
  }
  uint64_t v29 = v10;
  uint64_t v30 = 3221225472LL;
  v31 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3;
  v32 = &unk_18A08B198;
  uint64_t v33 = v9;
  id v34 = v18;
  BOOL v20 = NEFlowSetEventHandler() == 0;

  if (v20 || !NEFlowOpen())
  {
LABEL_19:
    -[NEAppProxyFlow clearEventHandlers]((uint64_t)v9);
    v21 = (void *)NEFlowCopyError();
    uint64_t v23 = v21;
    if (v21)
    {
      uint64_t v24 = [v21 code];
      if (v9)
      {
LABEL_21:
        Property = (dispatch_queue_s *)objc_getProperty(v9, v22, 40LL, 1);
LABEL_22:
        v26[0] = v10;
        v26[1] = 3221225472LL;
        v26[2] = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4;
        v26[3] = &unk_18A08FC28;
        id v27 = v7;
        uint64_t v28 = v24;
        dispatch_async(Property, v26);

        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v24 = 0LL;
      if (v9) {
        goto LABEL_21;
      }
    }

    Property = 0LL;
    goto LABEL_22;
  }

- (void)openWithLocalEndpoint:(NWHostEndpoint *)localEndpoint completionHandler:(void *)completionHandler
{
  v6 = completionHandler;
  id v7 = (id)-[NWHostEndpoint copyCEndpoint](localEndpoint, "copyCEndpoint");
  -[NEAppProxyFlow openWithLocalFlowEndpoint:completionHandler:]( self,  "openWithLocalFlowEndpoint:completionHandler:",  v7,  v6);
}

- (void)closeReadWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v4 = error;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "closing read on flow %@ with error %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v4) {
    CFErrorRef v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, v4);
  }
  else {
    CFErrorRef v6 = 0LL;
  }
  NEFlowReadClose();
  if (v6) {
    CFRelease(v6);
  }
}

- (void)closeWriteWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v4 = error;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "closing write on flow %@ with error %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v4) {
    CFErrorRef v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, v4);
  }
  else {
    CFErrorRef v6 = 0LL;
  }
  NEFlowWriteClose();
  if (v6) {
    CFRelease(v6);
  }
}

- (NSData)applicationData
{
  return (NSData *)(id)NEFlowCopyProperty();
}

- (void)setApplicationData:(id)a3
{
}

- (nw_interface_t)networkInterface
{
  if (self) {
    self = (NEAppProxyFlow *)objc_getProperty(self, a2, 48LL, 1);
  }
  return (nw_interface_t)self;
}

- (void)setNetworkInterface:(nw_interface_t)networkInterface
{
  if (networkInterface)
  {
    v4 = networkInterface;
    nw_interface_get_index(v4);
    v5 = (void *)nw_interface_create_with_index();
    int v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 48LL);

      Property = (nw_interface *)objc_getProperty(self, v8, 48LL, 1);
    }

    else
    {

      Property = 0LL;
    }

    id v10 = (id)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedInt:nw_interface_get_index(Property)];
    NEFlowSetProperty();
  }

- (void)setMetadata:(nw_parameters_t)parameters
{
  v4 = (objc_class *)MEMORY[0x1896078F8];
  v5 = parameters;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  -[NEAppProxyFlow metaData](self, "metaData");
  CFErrorRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v6 forKey:@"MetaData"];

  [v9 finishEncoding];
  id v7 = [v9 encodedData];
  xpc_object_t v8 = xpc_data_create((const void *)[v7 bytes], objc_msgSend(v7, "length"));
  nw_parameters_set_metadata();
}

- (NEFlowMetaData)metaData
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)isBound
{
  return self->_isBound;
}

- (void)setIsBound:(BOOL)a3
{
  self->_isBound = a3;
}

- (void).cxx_destruct
{
}

+ (CFErrorRef)convertFlowErrorToCFError:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  switch([v2 code])
  {
    case 1LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 1LL;
      break;
    case 2LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 2LL;
      break;
    case 3LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 3LL;
      break;
    case 4LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 4LL;
      break;
    case 5LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 5LL;
      break;
    case 6LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 6LL;
      break;
    case 7LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 7LL;
      break;
    case 9LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 100LL;
      break;
    case 10LL:
      objc_super v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 101LL;
      break;
    default:
      CFErrorRef v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      id v7 = (const __CFString *)*MEMORY[0x189604F58];
      CFIndex v5 = [v2 code];
      objc_super v3 = v6;
      v4 = v7;
      break;
  }

  CFErrorRef v8 = CFErrorCreate(v3, v4, v5, 0LL);

  return v8;
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke(uint64_t a1)
{
  return -[NEAppProxyFlow clearEventHandlers](*(void *)(a1 + 32));
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 5LL);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return -[NEAppProxyFlow clearEventHandlers](*(void *)(a1 + 32));
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 5LL);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return -[NEAppProxyFlow clearEventHandlers](*(void *)(a1 + 32));
}

- (uint64_t)clearEventHandlers
{
  if (result)
  {
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    return NEFlowSetEventHandler();
  }

  return result;
}

void __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)errorForFlowError:(uint64_t)a1
{
  v34[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  switch(a2)
  {
    case 1LL:
      objc_super v3 = (void *)MEMORY[0x189607870];
      uint64_t v33 = *MEMORY[0x1896075E0];
      v34[0] = @"The operation could not be completed because the flow is not connected";
      [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v3;
      uint64_t v6 = 1LL;
      goto LABEL_13;
    case 2LL:
      CFErrorRef v8 = (void *)MEMORY[0x189607870];
      uint64_t v31 = *MEMORY[0x1896075E0];
      v32 = @"The peer closed the flow";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v8;
      uint64_t v6 = 2LL;
      goto LABEL_13;
    case 3LL:
      id v9 = (void *)MEMORY[0x189607870];
      uint64_t v27 = *MEMORY[0x1896075E0];
      uint64_t v28 = @"The destination could host could not be reached";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v9;
      uint64_t v6 = 3LL;
      goto LABEL_13;
    case 4LL:
      id v10 = (void *)MEMORY[0x189607870];
      uint64_t v29 = *MEMORY[0x1896075E0];
      uint64_t v30 = @"An invalid argument was passed";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v10;
      uint64_t v6 = 4LL;
      goto LABEL_13;
    case 5LL:
      uint64_t v11 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x1896075E0];
      v22 = @"The flow was aborted";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v11;
      uint64_t v6 = 5LL;
      goto LABEL_13;
    case 6LL:
      v12 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x1896075E0];
      uint64_t v24 = @"The flow was refused";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v12;
      uint64_t v6 = 6LL;
      goto LABEL_13;
    case 7LL:
      v13 = (void *)MEMORY[0x189607870];
      uint64_t v25 = *MEMORY[0x1896075E0];
      v26 = @"The flow timed out";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFIndex v5 = v13;
      uint64_t v6 = 7LL;
      goto LABEL_13;
    default:
      if (a2 == 100)
      {
        v14 = (void *)MEMORY[0x189607870];
        uint64_t v19 = *MEMORY[0x1896075E0];
        BOOL v20 = @"The datagram was too large";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        CFIndex v5 = v14;
        uint64_t v6 = 9LL;
        goto LABEL_13;
      }

      if (a2 == 101)
      {
        id v7 = (void *)MEMORY[0x189607870];
        uint64_t v17 = *MEMORY[0x1896075E0];
        id v18 = @"A read operation is already pending";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        CFIndex v5 = v7;
        uint64_t v6 = 10LL;
LABEL_13:
        [v5 errorWithDomain:@"NEAppProxyFlowErrorDomain" code:v6 userInfo:v4];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        return v15;
      }

      return 0LL;
  }

+ (nw_endpoint)copyRemoteEndpointFromFlow:
{
  v0 = (void *)NEFlowCopyProperty();
  if (isa_nsdata(v0))
  {
    address = nw_endpoint_create_address((const sockaddr *)[v0 bytes]);
    id v2 = (sockaddr *)nw_endpoint_get_address(address);
    if (NEIsWildcardAddress(&v2->sa_len))
    {
      nw_endpoint_get_port(address);
    }

    else if (address)
    {
      goto LABEL_9;
    }
  }

  objc_super v3 = (void *)NEFlowCopyProperty();
  if (isa_nsstring(v3))
  {
    [v3 UTF8String];
    address = (nw_endpoint *)nw_endpoint_create_host_with_numeric_port();
  }

  else
  {
    address = 0LL;
  }

LABEL_9:
  return address;
}

@end