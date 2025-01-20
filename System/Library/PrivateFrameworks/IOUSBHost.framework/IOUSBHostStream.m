@interface IOUSBHostStream
- (BOOL)abortWithError:(NSError *)error;
- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (IOUSBHostPipe)hostPipe;
- (IOUSBHostStream)initWithHostPipe:(id)a3 streamID:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6;
- (NSUInteger)streamID;
- (void)setHostPipe:(id)a3;
- (void)setStreamID:(unint64_t)a3;
@end

@implementation IOUSBHostStream

- (IOUSBHostStream)initWithHostPipe:(id)a3 streamID:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  [v10 hostInterface];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IOUSBHostIOSource initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:]( self,  "initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:",  v11,  [v10 endpointAddress],  v7,  a6,  objc_msgSend(v10, "deviceAddress"));

  if (v12)
  {
    -[IOUSBHostStream setStreamID:](v12, "setStreamID:", a4);
    -[IOUSBHostStream setHostPipe:](v12, "setHostPipe:", v10);
  }

  return v12;
}

- (BOOL)abortWithError:(NSError *)error
{
  return -[IOUSBHostStream abortWithOption:error:](self, "abortWithOption:error:", 1LL, error);
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
  uint64_t v18[3];
  void v19[3];
  void v20[4];
  v20[3] = *MEMORY[0x1895F89C0];
  v18[1] = -[IOUSBHostIOSource endpointAddress]( self,  "endpointAddress",  -[IOUSBHostIOSource endpointAddress](self, "endpointAddress"));
  v18[2] = option;
  uint64_t v7 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x18u, v18, 3u, 0LL, 0LL);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 localizedStringForKey:@"Unable to abort stream." value:&stru_18A275388 table:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v15) {
      -[IOUSBHostStream abortWithOption:error:].cold.1(v15, v16);
    }
  }

  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  kern_return_t v13;
  kern_return_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  const char *v23;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  void v28[3];
  void v29[4];
  v29[3] = *MEMORY[0x1895F89C0];
  v8 = data;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = -[NSMutableData mutableBytes](v10, "mutableBytes");
    uint64_t v12 = -[NSMutableData length](v10, "length");
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = -[IOUSBHostStream streamID](self, "streamID");
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0LL;
  v13 = IOConnectCallScalarMethod( -[IOUSBHostIOSource ioConnection](self, "ioConnection"),  0x19u,  input,  4u,  &output,  &outputCnt);
  v14 = v13;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  if (v13 && error)
  {
    v28[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 localizedStringForKey:@"Unable to send IO with stream." value:&stru_18A275388 table:0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v28[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    v28[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v20;
    [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:3];
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v14 userInfo:v21];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v22) {
      -[IOUSBHostStream sendIORequestWithData:bytesTransferred:error:].cold.1(v22, v23);
    }
  }

  return v14 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  const char *v27;
  NSError **v29;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t input[4];
  void v37[3];
  void v38[5];
  v38[3] = *MEMORY[0x1895F89C0];
  v8 = data;
  IOUSBHostCompletionHandler v9 = completionHandler;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = -[NSMutableData mutableBytes](v10, "mutableBytes");
    uint64_t v12 = -[NSMutableData length](v10, "length");
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = -[IOUSBHostStream streamID](self, "streamID");
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0LL;
  *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v13;
  v35 = v13;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v33 = v13;
  reference[1] = (uint64_t)_ioCompletionCallback;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x1895CB13C](v9);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  *(void *)&v33 = v14;
  mach_port_t v15 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v17 = IOConnectCallAsyncScalarMethod(v15, 0x19u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v17)
  {
    v18 = (void *)v33;
    if (error)
    {
      v37[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 localizedStringForKey:@"Unable to enqueue IO with stream." value:&stru_18A275388 table:0];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v20;
      v37[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v29 = error;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v22;
      v37[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v24;
      [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:3];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v17 userInfo:v25];
      *v29 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v26) {
        -[IOUSBHostStream enqueueIORequestWithData:error:completionHandler:].cold.1(v26, v27);
      }
    }
  }

  return v17 == 0;
}

- (IOUSBHostPipe)hostPipe
{
  return (IOUSBHostPipe *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setHostPipe:(id)a3
{
}

- (NSUInteger)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
}

- (void)abortWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)sendIORequestWithData:(uint64_t)a1 bytesTransferred:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)enqueueIORequestWithData:(uint64_t)a1 error:(const char *)a2 completionHandler:.cold.1(uint64_t a1, const char *a2)
{
}

@end