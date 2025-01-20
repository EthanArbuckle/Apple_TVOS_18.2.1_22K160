@interface IOUSBHostObject
- (BOOL)abortDeviceRequestsWithError:(NSError *)error;
- (BOOL)abortDeviceRequestsWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)openWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error;
- (IONotificationPort)ioNotificationPortRef;
- (IOUSBHostInterestNotifier)interestNotifier;
- (IOUSBHostObject)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (IOUSBHostObject)initWithIOService:(io_service_t)ioService queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (NSArray)supportedStringLanguages;
- (NSMutableData)ioDataWithCapacity:(NSUInteger)capacity error:(NSError *)error;
- (NSMutableDictionary)descriptorCache;
- (NSMutableSet)invalidDescriptorCache;
- (NSUInteger)deviceAddress;
- (const)capabilityDescriptors;
- (const)configurationDescriptorWithConfigurationValue:(NSUInteger)configurationValue error:(NSError *)error;
- (const)configurationDescriptorWithIndex:(NSUInteger)index error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error;
- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID requestType:(tIOUSBDeviceRequestTypeValue)requestType requestRecipient:(tIOUSBDeviceRequestRecipientValue)requestRecipient error:(NSError *)error;
- (const)deviceDescriptor;
- (const)stringWithIndex:(NSUInteger)index error:(NSError *)error;
- (const)stringWithIndex:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error;
- (dispatch_queue_t)queue;
- (id)interestHandler;
- (io_service_t)ioService;
- (uint64_t)frameNumberWithTime:(IOUSBHostTime *)time;
- (unint64_t)debugLoggingMask;
- (unsigned)ioConnection;
- (void)closeWithOptions:(unsigned int)a3;
- (void)dealloc;
- (void)destroy;
- (void)destroyWithOptions:(unint64_t)a3;
- (void)setDebugLoggingMask:(unint64_t)a3;
- (void)setDescriptorCache:(id)a3;
- (void)setDeviceDescriptor:(const IOUSBDeviceDescriptor *)a3;
- (void)setInterestHandler:(id)a3;
- (void)setInterestNotifier:(id)a3;
- (void)setInvalidDescriptorCache:(id)a3;
- (void)setIoConnection:(unsigned int)a3;
- (void)setIoNotificationPortRef:(IONotificationPort *)a3;
- (void)setIoService:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setSupportedStringLanguages:(id)a3;
@end

@implementation IOUSBHostObject

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  return -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:]( self,  "initWithIOService:options:queue:error:interestHandler:",  *(void *)&ioService,  0LL,  queue,  error,  interestHandler);
}

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  uint64_t v10 = *(void *)&ioService;
  uint64_t v130 = *MEMORY[0x1895F89C0];
  v12 = queue;
  IOUSBHostInterestHandler v13 = interestHandler;
  v123.receiver = self;
  v123.super_class = (Class)&OBJC_CLASS___IOUSBHostObject;
  v14 = -[IOUSBHostObject init](&v123, sel_init);
  v15 = v14;
  if (!v14)
  {
    if (error)
    {
      v118 = v12;
      IOUSBHostInterestHandler v20 = v13;
      uint64_t v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v22;
      uint64_t v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:@"Failed [super init]" value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v24;
      uint64_t v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v27];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v28 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v28) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.1(v28, v29);
      }

      IOUSBHostInterestHandler v13 = v20;
      v12 = v118;
    }

    goto LABEL_10;
  }

  -[IOUSBHostObject setDebugLoggingMask:](v14, "setDebugLoggingMask:", 1LL);
  -[IOUSBHostObject setIoService:](v15, "setIoService:", v10);
  IOObjectRetain(-[IOUSBHostObject ioService](v15, "ioService"));
  -[IOUSBHostObject setIoConnection:](v15, "setIoConnection:", 0LL);
  -[IOUSBHostObject setIoNotificationPortRef:](v15, "setIoNotificationPortRef:", 0LL);
  -[IOUSBHostObject setInvalidDescriptorCache:](v15, "setInvalidDescriptorCache:", 0LL);
  -[IOUSBHostObject setDescriptorCache:](v15, "setDescriptorCache:", 0LL);
  -[IOUSBHostObject setInterestHandler:](v15, "setInterestHandler:", 0LL);
  v16 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:1];
  -[IOUSBHostObject setInvalidDescriptorCache:](v15, "setInvalidDescriptorCache:", v16);
  v17 = -[IOUSBHostObject invalidDescriptorCache](v15, "invalidDescriptorCache");
  if (!v17)
  {
    if (error)
    {
      v119 = v12;
      IOUSBHostInterestHandler v31 = v13;
      uint64_t v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v33;
      uint64_t v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 localizedStringForKey:@"Unable to allocateNSMutableSet." value:&stru_18A275388 table:0];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v35;
      uint64_t v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v37;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v38];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v39 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v39) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.2(v39, v40);
      }
      goto LABEL_33;
    }

    goto LABEL_40;
  }

  v18 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
  -[IOUSBHostObject setDescriptorCache:](v15, "setDescriptorCache:", v18);
  v19 = -[IOUSBHostObject descriptorCache](v15, "descriptorCache");
  if (!v19)
  {
    if (error)
    {
      v119 = v12;
      IOUSBHostInterestHandler v31 = v13;
      uint64_t v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v42;
      uint64_t v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 localizedStringForKey:@"Unable to allocate NSMutableDictionary." value:&stru_18A275388 table:0];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v44;
      uint64_t v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v46;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v38];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v47 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v47) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.3(v47, v48);
      }
      goto LABEL_33;
    }

    goto LABEL_40;
  }

  if (v12)
  {
    -[IOUSBHostObject setQueue:](v15, "setQueue:", v12);
  }

  else
  {
    dispatch_queue_t v49 = dispatch_queue_create("IOUSBHostDispatchQueue", 0LL);
    -[IOUSBHostObject setQueue:](v15, "setQueue:", v49);
  }
  v50 = -[IOUSBHostObject queue](v15, "queue");
  if (!v50)
  {
    if (error)
    {
      v119 = v12;
      IOUSBHostInterestHandler v31 = v13;
      uint64_t v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      [v65 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v66;
      uint64_t v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      [v67 localizedStringForKey:@"Unable to allocate dispatch queue." value:&stru_18A275388 table:0];
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v68;
      uint64_t v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      [v69 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v70;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v38];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v71 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v71) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.4(v71, v72);
      }
      goto LABEL_33;
    }

- (void)destroy
{
}

- (void)destroyWithOptions:(unint64_t)a3
{
  char v3 = a3;
  p_destroyed = &self->destroyed;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_destroyed))
    {
      __clrex();
      return;
    }
  }

  while (__stlxr(1u, (unsigned __int8 *)p_destroyed));
  v7 = -[IOUSBHostObject interestNotifier](self, "interestNotifier");
  if (v7)
  {
    v8 = -[IOUSBHostObject interestNotifier](self, "interestNotifier");
    [v8 destroy];

    -[IOUSBHostObject setInterestNotifier:](self, "setInterestNotifier:", 0LL);
  }

  if (-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"))
  {
    IONotificationPortDestroy(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
    -[IOUSBHostObject setIoNotificationPortRef:](self, "setIoNotificationPortRef:", 0LL);
  }

  if (-[IOUSBHostObject ioConnection](self, "ioConnection")) {
    -[IOUSBHostObject closeWithOptions:](self, "closeWithOptions:", (v3 & 1) << 16);
  }
  if (-[IOUSBHostObject ioService](self, "ioService"))
  {
    IOObjectRelease(-[IOUSBHostObject ioService](self, "ioService"));
    -[IOUSBHostObject setIoService:](self, "setIoService:", 0LL);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IOUSBHostObject;
  -[IOUSBHostObject dealloc](&v3, sel_dealloc);
}

- (BOOL)openWithOptions:(unint64_t)a3 error:(id *)a4
{
  kern_return_t v10;
  kern_return_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  const char *v20;
  uint64_t v22;
  uint64_t MachPort;
  kern_return_t v24;
  kern_return_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  const char *v34;
  io_connect_t connect;
  uint64_t input;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  v43 = *MEMORY[0x1895F89C0];
  unsigned int v7 = -[IOUSBHostObject ioConnection](self, "ioConnection");
  if (a3 || !v7)
  {
    connect = 0;
    io_service_t v9 = -[IOUSBHostObject ioService](self, "ioService");
    uint64_t v10 = IOServiceOpen(v9, *MEMORY[0x1895FBBE0], 0, &connect);
    if (v10)
    {
      if (a4)
      {
        v11 = v10;
        v37 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 localizedStringForKey:@"Unable to open io_service_t object and create user client." value:&stru_18A275388 table:0];
        IOUSBHostInterestHandler v13 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v13;
        v38 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 localizedStringForKey:@"IOServiceOpen failed." value:&stru_18A275388 table:0];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v15;
        BOOL v39 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v40 forKeys:&v37 count:3];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v11 userInfo:v18];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v19) {
          -[IOUSBHostObject openWithOptions:error:].cold.2(v19, v20);
        }
      }

      return 0;
    }

    else
    {
      -[IOUSBHostObject setIoConnection:](self, "setIoConnection:", connect);
      v22 = -[IOUSBHostObject ioConnection](self, "ioConnection");
      MachPort = IONotificationPortGetMachPort(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
      MEMORY[0x1895CAE84](v22, 0LL, MachPort, 0LL);
      input = a3 & 1 | (((a3 >> 1) & 1) << 16);
      v24 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0, &input, 1u, 0LL, 0LL);
      BOOL v8 = v24 == 0;
      if (v24 && a4)
      {
        v25 = v24;
        v37 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 localizedStringForKey:@"Unable to open io_service_t object and create user client." value:&stru_18A275388 table:0];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v27;
        v38 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 localizedStringForKey:@"Exclusive open of usb object failed." value:&stru_18A275388 table:0];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v29;
        BOOL v39 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 localizedStringForKey:@"Another client likely has exclusive access." value:&stru_18A275388 table:0];
        IOUSBHostInterestHandler v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v31;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v40 forKeys:&v37 count:3];
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v25 userInfo:v32];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v33) {
          -[IOUSBHostObject openWithOptions:error:].cold.1(v33, v34);
        }
      }
    }
  }

  else
  {
    if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 0x80) != 0) {
      NSLog( @"[Line %d of %s] %sservice is already opened",  240LL,  "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m",  "-[IOUSBHostObject openWithOptions:error:]");
    }
    return 1;
  }

  return v8;
}

- (void)closeWithOptions:(unsigned int)a3
{
  input[1] = *MEMORY[0x1895F89C0];
  if (-[IOUSBHostObject ioConnection](self, "ioConnection"))
  {
    input[0] = a3;
    IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 1u, input, 1u, 0LL, 0LL);
    IOServiceClose(-[IOUSBHostObject ioConnection](self, "ioConnection"));
    -[IOUSBHostObject setIoConnection:](self, "setIoConnection:", 0LL);
  }

  else if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0)
  {
    NSLog( @"[Line %d of %s] %sservice is not opened",  302LL,  "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m",  "-[IOUSBHostObject closeWithOptions:]");
  }

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:]( self,  "sendDeviceRequest:data:bytesTransferred:completionTimeout:error:",  request,  0LL,  0LL,  error,  5.0);
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:]( self,  "sendDeviceRequest:data:bytesTransferred:completionTimeout:error:",  request,  data,  bytesTransferred,  error,  5.0);
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v27;
  kern_return_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  const char *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSError **v47;
  void *v48;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;
  unint64_t bRequest;
  unint64_t wValue;
  uint64_t wIndex;
  unint64_t v55;
  uint64_t (*__ptr32 *v56)();
  NSMutableData *v57;
  void v58[3];
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  v62 = *MEMORY[0x1895F89C0];
  unint64_t wLength = request.wLength;
  IOUSBHostInterestHandler v13 = data;
  v14 = v13;
  if (v13)
  {
    if (-[NSMutableData length](v13, "length") < wLength)
    {
      if (error)
      {
        v15 = error;
        v59 = (void *)*MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 localizedStringForKey:@"Unable to send device request." value:&stru_18A275388 table:0];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        input = (uint64_t)v17;
        v60 = (void *)*MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 localizedStringForKey:@"Data buffer is smaller than request wLength." value:&stru_18A275388 table:0];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        bRequest = (unint64_t)v19;
        v61 = (void *)*MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        IOUSBHostInterestHandler v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 localizedStringForKey:@"The wLength field of the request must be less than or equal to the data's length" value:&stru_18A275388 table:0];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        wValue = (unint64_t)v21;
        [MEMORY[0x189603F68] dictionaryWithObjects:&input forKeys:&v59 count:3];
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v22];
        IOUSBHostObject *v15 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v23) {
          -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:].cold.2(v23, v24);
        }
      }

      BOOL v25 = 0;
      goto LABEL_21;
    }

    BOOL v47 = error;
    IOUSBHostInterestHandler v13 = -[NSMutableData mutableBytes](v14, "mutableBytes");
  }

  else
  {
    BOOL v47 = error;
  }

  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v26 = &off_188763000;
  LODWORD(v26) = vcvtad_u64_f64(completionTimeout * 1000.0);
  unint64_t v55 = wLength;
  v56 = v26;
  v57 = v13;
  outputCnt = 1;
  output = 0LL;
  v27 = IOConnectCallScalarMethod( -[IOUSBHostObject ioConnection](self, "ioConnection", v47),  2u,  &input,  7u,  &output,  &outputCnt);
  BOOL v28 = v27;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  BOOL v25 = v27 == 0;
  if (v27)
  {
    if (v48)
    {
      v58[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 localizedStringForKey:@"Unable to send device request." value:&stru_18A275388 table:0];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v30;
      v58[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      IOUSBHostInterestHandler v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v32;
      v58[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v34;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v59 forKeys:v58 count:3];
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v28 userInfo:v35];
      const char *v48 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v36) {
        -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:].cold.1(v36, v37);
      }
    }
  }

  else if (*(unsigned __int16 *)&request.bmRequestType == 1792LL)
  {
    v38 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    objc_sync_enter(v38);
    -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
    [MEMORY[0x189607968] numberWithUnsignedInteger:v40];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 objectForKey:v41];
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
      [MEMORY[0x189607968] numberWithUnsignedInteger:v40];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 removeObjectForKey:v44];
      v45 = -[IOUSBHostObject invalidDescriptorCache](self, "invalidDescriptorCache");
      [v45 addObject:v42];
    }

    objc_sync_exit(v38);
  }

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:]( self,  "enqueueDeviceRequest:data:completionTimeout:error:completionHandler:",  request,  0LL,  error,  completionHandler,  5.0);
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:]( self,  "enqueueDeviceRequest:data:completionTimeout:error:completionHandler:",  request,  data,  error,  completionHandler,  5.0);
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  const char *v40;
  BOOL v41;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableData *v50;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t input;
  uint64_t bRequest;
  uint64_t wValue;
  uint64_t wIndex;
  unint64_t v61;
  uint64_t (*__ptr32 *v62)();
  uint64_t v63;
  uint64_t v64;
  v64 = *MEMORY[0x1895F89C0];
  unint64_t wLength = request.wLength;
  IOUSBHostInterestHandler v13 = data;
  IOUSBHostCompletionHandler v14 = completionHandler;
  v50 = v13;
  if (v13)
  {
    if (-[NSMutableData length](v13, "length") < wLength)
    {
      if (error)
      {
        input = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 localizedStringForKey:@"Unable to enqueue device request." value:&stru_18A275388 table:0];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        reference[0] = (uint64_t)v16;
        bRequest = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 localizedStringForKey:@"Data buffer is smaller than request wLength." value:&stru_18A275388 table:0];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        reference[1] = (uint64_t)v18;
        wValue = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 localizedStringForKey:@"The wLength field of the request must be less than or equal to the data's length." value:&stru_18A275388 table:0];
        IOUSBHostInterestHandler v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)&v54 = v20;
        [MEMORY[0x189603F68] dictionaryWithObjects:reference forKeys:&input count:3];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v21];
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        BOOL v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v22) {
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:].cold.2(v22, v23);
        }
      }

      int v24 = -536870174;
      if (!error) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }

    uint64_t v25 = -[NSMutableData mutableBytes](v13, "mutableBytes");
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v26 = &off_188763000;
  LODWORD(v26) = vcvtad_u64_f64(completionTimeout * 1000.0);
  v61 = wLength;
  v62 = v26;
  BOOL v63 = v25;
  outputCnt = 1;
  output = 0LL;
  *(void *)&__int128 v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v55 = v27;
  v56 = v27;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v54 = v27;
  reference[1] = (uint64_t)_ioCompletionCallback_1;
  if (v14)
  {
    uint64_t v28 = MEMORY[0x1895CB13C](v14);
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  *(void *)&v54 = v28;
  mach_port_t v29 = -[IOUSBHostObject ioConnection](self, "ioConnection");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
  IOUSBHostInterestHandler v31 = IOConnectCallAsyncScalarMethod(v29, 2u, MachPort, reference, 3u, &input, 7u, &output, &outputCnt);
  int v24 = v31;
  if (v31)
  {
    IOUSBHostCompletionHandler v14 = (IOUSBHostCompletionHandler)v54;
    if ((void)v54)
    {
      if (error)
      {
LABEL_17:
        input = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 localizedStringForKey:@"Unable to enqueue device request." value:&stru_18A275388 table:0];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        reference[0] = (uint64_t)v33;
        bRequest = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        reference[1] = (uint64_t)v35;
        wValue = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)&v54 = v37;
        [MEMORY[0x189603F68] dictionaryWithObjects:reference forKeys:&input count:3];
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v24 userInfo:v38];
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        BOOL v39 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v39) {
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:].cold.1(v39, v40);
        }
      }

- (BOOL)abortDeviceRequestsWithError:(NSError *)error
{
  return -[IOUSBHostObject abortDeviceRequestsWithOption:error:]( self,  "abortDeviceRequestsWithOption:error:",  0LL,  error);
}

- (BOOL)abortDeviceRequestsWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
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
  v5 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", option), 3u, &v16, 1u, 0LL, 0LL);
  if (v5 && error)
  {
    v17[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 localizedStringForKey:@"Failed to abort device requests." value:&stru_18A275388 table:0];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 localizedStringForKey:0 value:&stru_18A275388 table:0];
    io_service_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    v17[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v5 userInfo:v12];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    IOUSBHostInterestHandler v13 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v13) {
      -[IOUSBHostObject abortDeviceRequestsWithOption:error:].cold.1(v13, v14);
    }
  }

  return v5 == 0;
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length error:(NSError *)error
{
  return -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:]( self,  "descriptorWithType:length:index:languageID:requestType:requestRecipient:error:",  *(void *)&type,  length,  0LL,  0LL,  0LL,  0LL,  error);
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  return -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:]( self,  "descriptorWithType:length:index:languageID:requestType:requestRecipient:error:",  *(void *)&type,  length,  index,  languageID,  0LL,  0LL,  error);
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID requestType:(tIOUSBDeviceRequestTypeValue)requestType requestRecipient:(tIOUSBDeviceRequestRecipientValue)requestRecipient error:(NSError *)error
{
  kern_return_t v22;
  kern_return_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  const char *v36;
  uint32_t outputCnt;
  size_t v41;
  uint64_t outputStruct;
  uint64_t output;
  uint64_t input[5];
  void v45[3];
  void v46[5];
  v46[3] = *MEMORY[0x1895F89C0];
  *length = 0LL;
  v41 = -3LL;
  outputStruct = 0LL;
  -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  IOUSBHostCompletionHandler v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  v15 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  uint64_t v16 = type;
  unint64_t v17 = type | ((unint64_t)index << 8) | ((_DWORD)languageID << 16);
  [MEMORY[0x189607968] numberWithUnsignedInteger:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKey:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v14);
  if (v19)
  {
    id v20 = v19;
    v21 = (const IOUSBDescriptor *)[v20 bytes];
    *length = [v20 length];
  }

  else
  {
    input[0] = v16;
    input[1] = index;
    uint64_t input[2] = languageID;
    input[3] = requestType;
    input[4] = requestRecipient;
    output = 0LL;
    outputCnt = 1;
    BOOL v22 = IOConnectCallMethod( -[IOUSBHostObject ioConnection](self, "ioConnection"),  4u,  input,  5u,  0LL,  0LL,  &output,  &outputCnt,  &outputStruct,  &v41);
    BOOL v23 = v22;
    if (!outputStruct) {
      goto LABEL_11;
    }
    if (v22)
    {
      v21 = 0LL;
    }

    else
    {
      -[IOUSBHostObject descriptorCache](self, "descriptorCache");
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v24);
      [MEMORY[0x189603F48] dataWithBytes:outputStruct length:v41];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
        [MEMORY[0x189607968] numberWithUnsignedInteger:v17];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 setObject:v25 forKey:v27];

        v21 = (const IOUSBDescriptor *)[v25 bytes];
        *length = (unsigned __int16)output;
      }

      else
      {
        v21 = 0LL;
      }

      objc_sync_exit(v24);
    }

    MEMORY[0x1895CB274](*MEMORY[0x1895FBBE0]);
    if (!v21)
    {
LABEL_11:
      if (error)
      {
        v45[0] = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 localizedStringForKey:@"Failed to get descriptor." value:&stru_18A275388 table:0];
        mach_port_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v29;
        v45[1] = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 localizedStringForKey:@"Requested descriptor likely does not exist." value:&stru_18A275388 table:0];
        IOUSBHostInterestHandler v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v31;
        v45[2] = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v33;
        [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:3];
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v23 userInfo:v34];
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v35) {
          -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:].cold.1( v35,  v36);
        }
      }

      v21 = 0LL;
    }
  }

  return v21;
}

- (const)capabilityDescriptors
{
  unint64_t v3 = 0LL;
  result = -[IOUSBHostObject descriptorWithType:length:error:](self, "descriptorWithType:length:error:", 15LL, &v3, 0LL);
  if (result)
  {
    if (v3 < result->bLength) {
      return 0LL;
    }
  }

  return result;
}

- (const)configurationDescriptorWithIndex:(NSUInteger)index error:(NSError *)error
{
  v17[3] = *MEMORY[0x1895F89C0];
  unint64_t v15 = 0LL;
  result = -[IOUSBHostObject descriptorWithType:length:index:languageID:error:]( self,  "descriptorWithType:length:index:languageID:error:",  2LL,  &v15,  index,  0LL,  error);
  if (result && v15 < result->wTotalLength)
  {
    if (error)
    {
      v16[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 localizedStringForKey:@"Unable to get configuration descriptor." value:&stru_18A275388 table:0];
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v16[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 localizedStringForKey:@"The length is less than descriptor's wTotalLength." value:&stru_18A275388 table:0];
      io_service_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v9;
      v16[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:3];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v12];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v13) {
        -[IOUSBHostObject configurationDescriptorWithIndex:error:].cold.1(v13, v14);
      }
    }

    return 0LL;
  }

  return result;
}

- (const)configurationDescriptorWithConfigurationValue:(NSUInteger)configurationValue error:(NSError *)error
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!configurationValue)
  {
    if (error)
    {
      uint64_t v26 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:@"Failed to get configuration descriptor." value:&stru_18A275388 table:0];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      mach_port_t v29 = v19;
      uint64_t v27 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 localizedStringForKey:@"ConfigurationValue of 0 is invalid" value:&stru_18A275388 table:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v21;
      uint64_t v28 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
      IOUSBHostInterestHandler v31 = v23;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v26 count:3];
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v15];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v24) {
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:].cold.1(v24, v25);
      }
      goto LABEL_13;
    }

    return 0LL;
  }

  if (!(_BYTE)-[IOUSBHostObject deviceDescriptor](self, "deviceDescriptor")[17])
  {
LABEL_7:
    if (error)
    {
      uint64_t v26 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      io_service_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 localizedStringForKey:@"Failed to get configuration descriptor." value:&stru_18A275388 table:0];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      mach_port_t v29 = v10;
      uint64_t v27 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localizedStringForKey:@"Unable to find configuration descriptor with specified value" value:&stru_18A275388 table:0];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      uint64_t v28 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
      IOUSBHostCompletionHandler v14 = (void *)objc_claimAutoreleasedReturnValue();
      IOUSBHostInterestHandler v31 = v14;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v26 count:3];
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870160 userInfo:v15];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v16) {
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:].cold.2(v16, v17);
      }
LABEL_13:

      return 0LL;
    }

    return 0LL;
  }

  uint64_t v7 = 0LL;
  while (1)
  {
    result = -[IOUSBHostObject configurationDescriptorWithIndex:error:]( self,  "configurationDescriptorWithIndex:error:",  v7,  error);
    if (result)
    {
      if (result->bConfigurationValue == configurationValue) {
        return result;
      }
    }
  }

- (const)stringWithIndex:(NSUInteger)index error:(NSError *)error
{
  return -[IOUSBHostObject stringWithIndex:languageID:error:]( self,  "stringWithIndex:languageID:error:",  index,  1033LL,  error);
}

- (const)stringWithIndex:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  unint64_t v9 = 0LL;
  v5 = -[IOUSBHostObject descriptorWithType:length:index:languageID:error:]( self,  "descriptorWithType:length:index:languageID:error:",  3LL,  &v9,  index,  languageID,  error);
  v6 = 0LL;
  if (v5 && v9 >= 3)
  {
    unint64_t bLength = v5->bLength;
    if (v9 < bLength) {
      return (const NSString *)0LL;
    }
    [NSString stringWithCharacters:&v5[1] length:(bLength - 2) >> 1];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (const NSString *)v6;
}

- (uint64_t)frameNumberWithTime:(IOUSBHostTime *)time
{
  kern_return_t v4;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  IOUSBHostTime v8;
  uint64_t v9;
  unint64_t v9 = *MEMORY[0x1895F89C0];
  output = 0xAAAAAAAAAAAAAAAALL;
  BOOL v8 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  v4 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 7u, 0LL, 0, &output, &outputCnt);
  result = 0LL;
  if (!v4)
  {
    result = output;
    if (time) {
      *time = v8;
    }
  }

  return result;
}

- (NSMutableData)ioDataWithCapacity:(NSUInteger)capacity error:(NSError *)error
{
  kern_return_t v7;
  uint64_t v8;
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
  IOBufferMutableData *v19;
  IOBufferMutableData *v21;
  void v22[5];
  uint32_t outputCnt;
  uint64_t v24;
  uint64_t input;
  uint64_t output;
  void v27[3];
  void v28[4];
  v28[3] = *MEMORY[0x1895F89C0];
  input = capacity;
  output = 0LL;
  outputCnt = 1;
  uint64_t v7 = IOConnectCallScalarMethod( -[IOUSBHostObject ioConnection](self, "ioConnection"),  8u,  &input,  1u,  &output,  &outputCnt);
  if (!v7)
  {
    v28[0] = 0xAAAAAAAAAAAAAAAALL;
    v27[0] = 0xAAAAAAAAAAAAAAAALL;
    BOOL v8 = -[IOUSBHostObject ioConnection](self, "ioConnection");
    unint64_t v9 = MEMORY[0x1895CAE6C](v8, output, *MEMORY[0x1895FBBE0], v28, v27, 1LL);
    if (!v9)
    {
      v21 = objc_alloc(&OBJC_CLASS___IOBufferMutableData);
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke;
      v22[3] = &unk_18A274A18;
      v22[4] = self;
      v19 = -[IOBufferMutableData initWithBytesNoCopy:length:bufferID:deallocator:]( v21,  "initWithBytesNoCopy:length:bufferID:deallocator:",  v28[0],  capacity,  output,  v22);
      if (v19) {
        return (NSMutableData *)v19;
      }
      uint64_t v7 = 0;
      if (error) {
        goto LABEL_5;
      }
      goto LABEL_8;
    }

    uint64_t v7 = v9;
    BOOL v24 = output;
    IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 9u, &v24, 1u, 0LL, 0LL);
  }

  if (error)
  {
LABEL_5:
    v27[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 localizedStringForKey:@"Unable to allocate IOData Buffer." value:&stru_18A275388 table:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    v27[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    v27[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    IOUSBHostCompletionHandler v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 localizedStringForKey:0 value:&stru_18A275388 table:0];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:3];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v16];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    unint64_t v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[IOUSBHostObject ioDataWithCapacity:error:].cold.1(v17, v18);
    }
  }

uint64_t __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 ioConnection];
  uint64_t v6 = [v4 bufferID];
  uint64_t v7 = *MEMORY[0x1895FBBE0];
  id v8 = v4;
  MEMORY[0x1895CAE90](v5, v6, v7, [v8 bytes]);
  LODWORD(v5) = [v8 bufferID];

  return IOConnectCallScalarMethod( objc_msgSend(*(id *)(a1 + 32), "ioConnection", v5, v11),  9u,  &v10,  1u,  0,  0);
}

- (NSUInteger)deviceAddress
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 5u, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)v3) {
    return (unsigned __int16)output;
  }
  uint64_t v4 = v3;
  if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0) {
    NSLog( @"[Line %d of %s] %sconnect call failed with 0x%x",  931LL,  "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m",  "-[IOUSBHostObject deviceAddress]",  v4);
  }
  return 0LL;
}

- (io_service_t)ioService
{
  return self->_ioService;
}

- (void)setIoService:(unsigned int)a3
{
  self->_ioService = a3;
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (const)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (void)setDeviceDescriptor:(const IOUSBDeviceDescriptor *)a3
{
  self->_deviceDescriptor = a3;
}

- (unint64_t)debugLoggingMask
{
  return self->_debugLoggingMask;
}

- (void)setDebugLoggingMask:(unint64_t)a3
{
  self->_debugLoggingMask = a3;
}

- (unsigned)ioConnection
{
  return self->_ioConnection;
}

- (void)setIoConnection:(unsigned int)a3
{
  self->_ioConnection = a3;
}

- (IONotificationPort)ioNotificationPortRef
{
  return self->_ioNotificationPortRef;
}

- (void)setIoNotificationPortRef:(IONotificationPort *)a3
{
  self->_ioNotificationPortRef = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
}

- (id)interestHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInterestHandler:(id)a3
{
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
}

- (NSMutableDictionary)descriptorCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDescriptorCache:(id)a3
{
}

- (NSArray)supportedStringLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSupportedStringLanguages:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.3( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.4( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.5( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.6( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.7( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(void *)a1 options:(const char *)a2 queue:error:interestHandler:.cold.8( void *a1,  const char *a2)
{
  id v3 = a1;
  OUTLINED_FUNCTION_2(v3, v4);
  OUTLINED_FUNCTION_1(&dword_18874A000, MEMORY[0x1895F8DA0], v5, "Error:%s with reason: %s", v6, v7, v8, v9, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)openWithOptions:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)openWithOptions:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
}

- (void)sendDeviceRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)sendDeviceRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)enqueueDeviceRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enqueueDeviceRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)abortDeviceRequestsWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)descriptorWithType:(uint64_t)a1 length:(const char *)a2 index:languageID:requestType:requestRecipient:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)configurationDescriptorWithIndex:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)configurationDescriptorWithConfigurationValue:(uint64_t)a1 error:(const char *)a2 .cold.1( uint64_t a1,  const char *a2)
{
}

- (void)configurationDescriptorWithConfigurationValue:(uint64_t)a1 error:(const char *)a2 .cold.2( uint64_t a1,  const char *a2)
{
}

- (void)ioDataWithCapacity:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

@end