@interface IOUSBHostPipe
- (BOOL)abortWithError:(NSError *)error;
- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)adjustPipeWithDescriptors:(const IOUSBHostIOSourceDescriptors *)descriptors error:(NSError *)error;
- (BOOL)clearStallWithError:(NSError *)error;
- (BOOL)disableStreamsWithError:(NSError *)error;
- (BOOL)enableStreamsWithError:(NSError *)error;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error completionHandler:(IOUSBHostIsochronousCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error completionHandler:(IOUSBHostIsochronousTransactionCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(id)a3 frameList:(IOUSBHostIsochronousFrame *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 completionHandler:(id)a9 version:(unint64_t)a10;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error;
- (BOOL)sendIORequestWithData:(id)a3 frameList:(void *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 version:(unint64_t)a9;
- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error;
- (BOOL)streamsEnabled;
- (IOUSBHostPipe)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7;
- (IOUSBHostStream)copyStreamWithStreamID:(NSUInteger)streamID error:(NSError *)error;
- (NSData)currentDescriptorsCache;
- (NSData)originalDescriptorsCache;
- (NSMutableSet)invalidDescriptorCache;
- (NSTimeInterval)idleTimeout;
- (const)descriptors;
- (const)ioSourceDescriptorsWithOption:(unint64_t)a3;
- (const)originalDescriptors;
- (void)setCurrentDescriptorsCache:(id)a3;
- (void)setInvalidDescriptorCache:(id)a3;
- (void)setOriginalDescriptorsCache:(id)a3;
- (void)setStreamsEnabled:(BOOL)a3;
@end

@implementation IOUSBHostPipe

- (IOUSBHostPipe)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IOUSBHostPipe;
  v7 = -[IOUSBHostIOSource initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:]( &v12,  sel_initWithHostInterface_endpointAddress_ioConnection_ioNotificationPortRef_deviceAddress_,  a3,  a4,  *(void *)&a5,  a6,  a7);
  v8 = v7;
  if (v7)
  {
    -[IOUSBHostPipe setStreamsEnabled:](v7, "setStreamsEnabled:", 0LL);
    v9 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:1];
    -[IOUSBHostPipe setInvalidDescriptorCache:](v8, "setInvalidDescriptorCache:", v9);
    v10 = -[IOUSBHostPipe invalidDescriptorCache](v8, "invalidDescriptorCache");
    if (!v10)
    {

      return 0LL;
    }
  }

  return v8;
}

- (const)originalDescriptors
{
  return -[IOUSBHostPipe ioSourceDescriptorsWithOption:](self, "ioSourceDescriptorsWithOption:", 0LL);
}

- (const)descriptors
{
  return -[IOUSBHostPipe ioSourceDescriptorsWithOption:](self, "ioSourceDescriptorsWithOption:", 1LL);
}

- (const)ioSourceDescriptorsWithOption:(unint64_t)a3
{
  kern_return_t v9;
  const IOUSBHostIOSourceDescriptors *v10;
  id v11;
  const IOUSBHostIOSourceDescriptors *v12;
  id v14;
  void *v15;
  size_t v16;
  uint64_t input[3];
  input[2] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v5 = -[IOUSBHostPipe currentDescriptorsCache](self, "currentDescriptorsCache");
  }

  else
  {
    v5 = -[IOUSBHostPipe originalDescriptorsCache](self, "originalDescriptorsCache");
    if (v5)
    {
      v11 = -[IOUSBHostPipe originalDescriptorsCache](self, "originalDescriptorsCache");
      objc_super v12 = (const IOUSBHostIOSourceDescriptors *)[v11 bytes];

      return v12;
    }
  }

  v16 = 24LL;
  [MEMORY[0x189603FB8] dataWithLength:24];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = a3;
  mach_port_t v7 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  id v8 = v6;
  v9 = IOConnectCallMethod(v7, 0x11u, input, 2u, 0, 0, 0, 0, (void *)[v8 mutableBytes], &v16);
  v10 = 0LL;
  if (!v9)
  {
    if ([v8 isEqualToData:v5])
    {
      v10 = (const IOUSBHostIOSourceDescriptors *)[v5 bytes];
    }

    else
    {
      v14 = v8;
      v10 = (const IOUSBHostIOSourceDescriptors *)[v14 bytes];
      if (v5)
      {
        v15 = -[IOUSBHostPipe invalidDescriptorCache](self, "invalidDescriptorCache");
        [v15 addObject:v5];
      }

      if (a3) {
        -[IOUSBHostPipe setCurrentDescriptorsCache:](self, "setCurrentDescriptorsCache:", v14);
      }
      else {
        -[IOUSBHostPipe setOriginalDescriptorsCache:](self, "setOriginalDescriptorsCache:", v14);
      }
    }
  }

  return v10;
}

- (BOOL)adjustPipeWithDescriptors:(const IOUSBHostIOSourceDescriptors *)descriptors error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  uint64_t input;
  void v19[3];
  void v20[4];
  v20[3] = *MEMORY[0x1895F89C0];
  input = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  mach_port_t v7 = IOConnectCallMethod( -[IOUSBHostIOSource ioConnection](self, "ioConnection"),  0xDu,  &input,  1u,  descriptors,  0x18uLL,  0LL,  0LL,  0LL,  0LL);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 localizedStringForKey:@"Unable to adjust pipe." value:&stru_18A275388 table:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v15) {
      -[IOUSBHostPipe adjustPipeWithDescriptors:error:].cold.1(v15, v16);
    }
  }

  return v7 == 0;
}

- (NSTimeInterval)idleTimeout
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection](self, "ioConnection"),  0xFu,  input,  1u,  &output,  &outputCnt);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    double v5 = 0.0;
    if ((-[IOUSBHostIOSource debugLoggingMask](self, "debugLoggingMask") & 1) != 0) {
      NSLog( @"[Line %d of %s] %sconnect call failed with 0x%x",  183LL,  "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostPipe.m",  "-[IOUSBHostPipe idleTimeout]",  v4);
    }
  }

  else
  {
    double v5 = (double)output;
  }

  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  kern_return_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  const char *v18;
  uint64_t input[2];
  void v21[3];
  void v22[4];
  v22[3] = *MEMORY[0x1895F89C0];
  NSUInteger v7 = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  id v8 = &off_188763000;
  LODWORD(v8) = vcvtad_u64_f64(idleTimeout * 1000.0);
  input[0] = v7;
  input[1] = (uint64_t)v8;
  v9 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0xEu, input, 2u, 0LL, 0LL);
  if (v9 && error)
  {
    v21[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:@"Unable to set an idle timeout." value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    v21[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v9 userInfo:v16];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[IOUSBHostPipe setIdleTimeout:error:].cold.1(v17, v18);
    }
  }

  return v9 == 0;
}

- (BOOL)clearStallWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  const char *v13;
  uint64_t v15;
  void v16[3];
  void v17[4];
  v17[3] = *MEMORY[0x1895F89C0];
  uint64_t v4 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection]( self,  "ioConnection",  -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")),  0x10u,  &v15,  1u,  0LL,  0LL);
  if (v4 && error)
  {
    v16[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 localizedStringForKey:@"Unable to clear stall." value:&stru_18A275388 table:0];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v16[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 localizedStringForKey:0 value:&stru_18A275388 table:0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    v16[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:3];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v4 userInfo:v11];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    objc_super v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[IOUSBHostPipe clearStallWithError:].cold.1(v12, v13);
    }
  }

  return v4 == 0;
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:]( self,  "sendControlRequest:data:bytesTransferred:completionTimeout:error:",  request,  0LL,  0LL,  error,  5.0);
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:]( self,  "sendControlRequest:data:bytesTransferred:completionTimeout:error:",  request,  data,  bytesTransferred,  error,  5.0);
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v16;
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  const char *v26;
  uint64_t v28;
  uint32_t outputCnt;
  uint64_t input[8];
  void v31[3];
  void v32[5];
  v32[3] = *MEMORY[0x1895F89C0];
  uint64_t wLength = request.wLength;
  v13 = data;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = request.bmRequestType;
  uint64_t input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  v14 = &off_188763000;
  LODWORD(v14) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v14;
  if (v13) {
    uint64_t v15 = -[NSMutableData mutableBytes](v13, "mutableBytes");
  }
  else {
    uint64_t v15 = 0LL;
  }
  input[7] = v15;
  uint32_t outputCnt = 1;
  v16 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection](self, "ioConnection", 0LL),  0x12u,  input,  8u,  &v28,  &outputCnt);
  v17 = v16;
  if (bytesTransferred) {
    *bytesTransferred = v28;
  }
  if (v16 && error)
  {
    v31[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 localizedStringForKey:@"Unable to send control request." value:&stru_18A275388 table:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v31[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    v31[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v17 userInfo:v24];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v25) {
      -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:].cold.1(v25, v26);
    }
  }

  return v17 == 0;
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:]( self,  "enqueueControlRequest:data:completionTimeout:error:completionHandler:",  request,  0LL,  error,  completionHandler,  5.0);
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:]( self,  "enqueueControlRequest:data:completionTimeout:error:completionHandler:",  request,  data,  error,  completionHandler,  5.0);
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  const char *v31;
  NSError **v33;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t input[8];
  void v41[3];
  void v42[5];
  v42[3] = *MEMORY[0x1895F89C0];
  uint64_t wLength = request.wLength;
  v13 = data;
  IOUSBHostCompletionHandler v14 = completionHandler;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = request.bmRequestType;
  uint64_t input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  uint64_t v15 = &off_188763000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v15;
  if (v13) {
    uint64_t v16 = -[NSMutableData mutableBytes](v13, "mutableBytes");
  }
  else {
    uint64_t v16 = 0LL;
  }
  input[7] = v16;
  uint32_t outputCnt = 1;
  uint64_t output = 0LL;
  *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v17;
  v39 = v17;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v37 = v17;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v14)
  {
    uint64_t v18 = MEMORY[0x1895CB13C](v14);
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  *(void *)&v37 = v18;
  mach_port_t v19 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v21 = IOConnectCallAsyncScalarMethod(v19, 0x12u, MachPort, reference, 3u, input, 8u, &output, &outputCnt);
  if (v21)
  {
    v22 = (void *)v37;
    if (error)
    {
      v41[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = error;
      [v23 localizedStringForKey:@"Unable to enqueue control request." value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v24;
      v41[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v26;
      v41[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v28;
      [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:3];
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v21 userInfo:v29];
      *v33 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v30) {
        -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:].cold.1(v30, v31);
      }
    }
  }

  return v21 == 0;
}

- (BOOL)abortWithError:(NSError *)error
{
  return -[IOUSBHostPipe abortWithOption:error:](self, "abortWithOption:error:", 1LL, error);
}

- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  uint64_t input[2];
  void v19[3];
  void v20[4];
  v20[3] = *MEMORY[0x1895F89C0];
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = option;
  NSUInteger v7 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x13u, input, 2u, 0LL, 0LL);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 localizedStringForKey:@"Unable to abort IO." value:&stru_18A275388 table:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
    IOUSBHostCompletionHandler v14 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v15) {
      -[IOUSBHostPipe abortWithOption:error:].cold.1(v15, v16);
    }
  }

  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  const char *v27;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  void v32[3];
  void v33[4];
  v33[3] = *MEMORY[0x1895F89C0];
  v10 = data;
  v11 = v10;
  if (v10)
  {
    objc_super v12 = v10;
    uint64_t v13 = -[NSMutableData mutableBytes](v12, "mutableBytes");
    uint64_t v14 = -[NSMutableData length](v12, "length");
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  NSUInteger v15 = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  uint64_t v16 = &off_188763000;
  LODWORD(v16) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[0] = v15;
  input[1] = v14;
  uint64_t input[2] = (uint64_t)v16;
  input[3] = v13;
  uint32_t outputCnt = 1;
  uint64_t output = 0LL;
  __int128 v17 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection](self, "ioConnection"),  0x14u,  input,  4u,  &output,  &outputCnt);
  uint64_t v18 = v17;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  if (v17 && error)
  {
    v32[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    mach_port_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 localizedStringForKey:@"Unable to send IO." value:&stru_18A275388 table:0];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    v32[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    v32[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:3];
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v18 userInfo:v25];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v26) {
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:].cold.1(v26, v27);
    }
  }

  return v18 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  const char *v30;
  NSError **v32;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t input[4];
  void v40[3];
  void v41[5];
  v41[3] = *MEMORY[0x1895F89C0];
  v10 = data;
  IOUSBHostCompletionHandler v11 = completionHandler;
  if (v10)
  {
    objc_super v12 = v10;
    uint64_t v13 = -[NSMutableData mutableBytes](v12, "mutableBytes");
    uint64_t v14 = -[NSMutableData length](v12, "length");
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = v14;
  NSUInteger v15 = &off_188763000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  uint64_t input[2] = (uint64_t)v15;
  input[3] = v13;
  uint32_t outputCnt = 1;
  uint64_t output = 0LL;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v16;
  v38 = v16;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v36 = v16;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v11)
  {
    uint64_t v17 = MEMORY[0x1895CB13C](v11);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  *(void *)&v36 = v17;
  mach_port_t v18 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v20 = IOConnectCallAsyncScalarMethod(v18, 0x14u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v20)
  {
    v21 = (void *)v36;
    if (error)
    {
      v40[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 localizedStringForKey:@"Unable to enqueue IO." value:&stru_18A275388 table:0];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v23;
      v40[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v32 = error;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v25;
      v40[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v27;
      [MEMORY[0x189603F68] dictionaryWithObjects:v41 forKeys:v40 count:3];
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v20 userInfo:v28];
      *v32 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v29) {
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:].cold.1(v29, v30);
      }
    }
  }

  return v20 == 0;
}

- (BOOL)sendIORequestWithData:(id)a3 frameList:(void *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 version:(unint64_t)a9
{
  kern_return_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  const char *v31;
  uint64_t input[8];
  void v34[3];
  void v35[4];
  v35[3] = *MEMORY[0x1895F89C0];
  id v15 = a3;
  __int128 v16 = v15;
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = [v17 mutableBytes];
    uint64_t v19 = [v17 length];
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
  }

  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = (uint64_t)a4;
  uint64_t input[2] = a5;
  input[3] = v18;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a9;
  if (a9 == 1)
  {
    uint32_t v20 = 21;
  }

  else
  {
    if (a9 != 2)
    {
      v21 = -536870199;
      goto LABEL_11;
    }

    uint32_t v20 = 26;
  }

  v21 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), v20, input, 8u, 0LL, 0LL);
  if (!v21)
  {
    v22 = 1;
    goto LABEL_16;
  }

- (BOOL)sendIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error
{
  return -[IOUSBHostPipe sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:]( self,  "sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:",  data,  frameList,  frameListCount,  firstFrameNumber,  0LL,  error,  1LL);
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error
{
  return -[IOUSBHostPipe sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:]( self,  "sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:",  data,  transactionList,  transactionListCount,  firstFrameNumber,  *(void *)&options,  error,  2LL);
}

- (BOOL)enqueueIORequestWithData:(id)a3 frameList:(IOUSBHostIsochronousFrame *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 completionHandler:(id)a9 version:(unint64_t)a10
{
  kern_return_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  const char *v37;
  BOOL v38;
  void *v41;
  uint64_t reference[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t input[8];
  void v47[3];
  void v48[5];
  v48[3] = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a9;
  id v17 = v15;
  if (v15)
  {
    id v18 = v15;
    id v15 = (id)[v18 mutableBytes];
    uint64_t v19 = [v18 length];
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = (uint64_t)a4;
  uint64_t input[2] = a5;
  input[3] = (uint64_t)v15;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a10;
  *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v20;
  v45 = v20;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v43 = v20;
  reference[1] = (uint64_t)_isochCompletionCallback;
  if (v16)
  {
    v21 = (void *)MEMORY[0x1895CB13C](v16);
  }

  else
  {
    v21 = 0LL;
  }

  v22 = v17;
  *(void *)&v43 = v21;
  if (a10 == 1)
  {
    uint32_t v23 = 21;
  }

  else
  {
    if (a10 != 2)
    {
      v28 = -536870199LL;
      v24 = a8;
      if (!a8) {
        goto LABEL_18;
      }
LABEL_15:
      v41 = v22;
      v47[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 localizedStringForKey:@"Unable to enqueue IO." value:&stru_18A275388 table:0];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v30;
      v47[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v32;
      v47[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v34;
      [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:v47 count:3];
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v28 userInfo:v35];
      id *v24 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v36) {
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:].cold.1(v36, v37);
      }

      v22 = v41;
      goto LABEL_18;
    }

    uint32_t v23 = 26;
  }

  v24 = a8;
  mach_port_t v25 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v27 = IOConnectCallAsyncMethod(v25, v23, MachPort, reference, 3u, input, 8u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (!v27)
  {
    v38 = 1;
    goto LABEL_20;
  }

  v21 = (void *)v43;
  v28 = v27;
  if (a8) {
    goto LABEL_15;
  }
LABEL_18:

  v38 = 0;
LABEL_20:

  return v38;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error completionHandler:(IOUSBHostIsochronousCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:]( self,  "enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:",  data,  frameList,  frameListCount,  firstFrameNumber,  0LL,  error,  completionHandler,  1LL);
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error completionHandler:(IOUSBHostIsochronousTransactionCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:]( self,  "enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:",  data,  transactionList,  transactionListCount,  firstFrameNumber,  *(void *)&options,  error,  completionHandler,  2LL);
}

- (BOOL)enableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  uint64_t v16;
  void v17[3];
  void v18[4];
  v18[3] = *MEMORY[0x1895F89C0];
  double v5 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection]( self,  "ioConnection",  -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")),  0x16u,  &v16,  1u,  0LL,  0LL);
  if (v5)
  {
    if (error)
    {
      v17[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 localizedStringForKey:@"Unable to enable streams." value:&stru_18A275388 table:0];
      NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v17[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v9;
      v17[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
      IOUSBHostCompletionHandler v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v5 userInfo:v12];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v13) {
        -[IOUSBHostPipe enableStreamsWithError:].cold.1(v13, v14);
      }
    }
  }

  else
  {
    -[IOUSBHostPipe setStreamsEnabled:](self, "setStreamsEnabled:", 1LL);
  }

  return v5 == 0;
}

- (BOOL)disableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  BOOL v6;
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  const char *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  v34 = *MEMORY[0x1895F89C0];
  if (-[IOUSBHostPipe streamsEnabled](self, "streamsEnabled"))
  {
    double v5 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection]( self,  "ioConnection",  -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")),  0x17u,  &v27,  1u,  0LL,  0LL);
    v6 = v5 == 0;
    if (v5)
    {
      if (error)
      {
        NSUInteger v7 = v5;
        v28 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 localizedStringForKey:@"Unable to disable streams." value:&stru_18A275388 table:0];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v9;
        v29 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
        IOUSBHostCompletionHandler v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v11;
        v30 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v13;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v31 forKeys:&v28 count:3];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        id v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v15) {
          -[IOUSBHostPipe disableStreamsWithError:].cold.1(v15, v16);
        }
      }
    }

    else
    {
      -[IOUSBHostPipe setStreamsEnabled:](self, "setStreamsEnabled:", 0LL);
    }
  }

  else
  {
    if (error)
    {
      v28 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 localizedStringForKey:@"Unable to disable streams." value:&stru_18A275388 table:0];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      v29 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 localizedStringForKey:@"Streams were never enabled." value:&stru_18A275388 table:0];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      v30 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Enable streams before disabling streams." value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v31 forKeys:&v28 count:3];
      uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v23];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v24) {
        -[IOUSBHostPipe disableStreamsWithError:].cold.2(v24, v25);
      }
    }

    return 0;
  }

  return v6;
}

- (IOUSBHostStream)copyStreamWithStreamID:(NSUInteger)streamID error:(NSError *)error
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (!-[IOUSBHostPipe streamsEnabled](self, "streamsEnabled"))
  {
    if (error)
    {
      uint64_t v48 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Unable to copy stream." value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v22;
      uint64_t v49 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:@"Streams were never enabled." value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v24;
      uint64_t v50 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      mach_port_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:@"Enable streams before copying a stream." value:&stru_18A275388 table:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v48 count:3];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v27];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v28 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v28) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.4(v28, v29);
      }
      goto LABEL_20;
    }

    return 0LL;
  }

  unsigned __int8 valuePtr = 0;
  -[IOUSBHostIOSource hostInterface](self, "hostInterface");
  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue();
  io_registry_entry_t v8 = [v7 ioService];
  CFTypeRef v9 = IORegistryEntrySearchCFProperty(v8, "IOService", @"USBSpeed", (CFAllocatorRef)*MEMORY[0x189604DB0], 3u);

  if (!v9)
  {
    if (error)
    {
      uint64_t v48 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 localizedStringForKey:@"Unable to copy stream." value:&stru_18A275388 table:0];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v31;
      uint64_t v49 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 localizedStringForKey:@"Unable to get device speed." value:&stru_18A275388 table:0];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v33;
      uint64_t v50 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v35;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v48 count:3];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v27];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v36 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v36) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.1(v36, v37);
      }
      goto LABEL_20;
    }

    return 0LL;
  }

  CFTypeID v10 = CFGetTypeID(v9);
  if (v10 == CFNumberGetTypeID()) {
    CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt8Type, &valuePtr);
  }
  CFRelease(v9);
  if (streamID - 1 >= IOUSBGetEndpointMaxStreams( valuePtr,  (const IOUSBEndpointDescriptor *)(-[IOUSBHostPipe descriptors](self, "descriptors") + 2),  (const IOUSBSuperSpeedEndpointCompanionDescriptor *)(-[IOUSBHostPipe descriptors]( self,  "descriptors")
                                                                            + 9)))
  {
    if (error)
    {
      uint64_t v48 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 localizedStringForKey:@"Unable to copy stream." value:&stru_18A275388 table:0];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v39;
      uint64_t v49 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 localizedStringForKey:@"StreamID out of bounds." value:&stru_18A275388 table:0];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v41;
      uint64_t v50 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 localizedStringForKey:@"Select a valid streamID." value:&stru_18A275388 table:0];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v43;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v48 count:3];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v27];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v44 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v44) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.3(v44, v45);
      }
LABEL_20:

      return 0LL;
    }

    return 0LL;
  }

  IOUSBHostCompletionHandler v11 = -[IOUSBHostStream initWithHostPipe:streamID:ioConnection:ioNotificationPortRef:]( objc_alloc(&OBJC_CLASS___IOUSBHostStream),  "initWithHostPipe:streamID:ioConnection:ioNotificationPortRef:",  self,  streamID,  -[IOUSBHostIOSource ioConnection](self, "ioConnection"),  -[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  if (!v11 && error)
  {
    uint64_t v48 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:@"Unable to copy stream." value:&stru_18A275388 table:0];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v13;
    uint64_t v49 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 localizedStringForKey:@"IOUSBHostStream init failed." value:&stru_18A275388 table:0];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v15;
    uint64_t v50 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v48 count:3];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v18];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v19) {
      -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.2(v19, v20);
    }
  }

  return v11;
}

- (NSData)originalDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setOriginalDescriptorsCache:(id)a3
{
}

- (NSData)currentDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCurrentDescriptorsCache:(id)a3
{
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
}

- (BOOL)streamsEnabled
{
  return self->_streamsEnabled;
}

- (void)setStreamsEnabled:(BOOL)a3
{
  self->_streamsEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)adjustPipeWithDescriptors:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)setIdleTimeout:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)clearStallWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)sendControlRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enqueueControlRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)abortWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)sendIORequestWithData:(uint64_t)a1 bytesTransferred:(const char *)a2 completionTimeout:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enqueueIORequestWithData:(uint64_t)a1 completionTimeout:(const char *)a2 error:completionHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enableStreamsWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)disableStreamsWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)disableStreamsWithError:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
{
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.3(uint64_t a1, const char *a2)
{
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.4(uint64_t a1, const char *a2)
{
}

@end