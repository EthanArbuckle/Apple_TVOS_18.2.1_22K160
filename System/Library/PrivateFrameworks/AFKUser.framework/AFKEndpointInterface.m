@interface AFKEndpointInterface
+ (id)withService:(unsigned int)a3;
+ (id)withService:(unsigned int)a3 properties:(id)a4;
- (AFKEndpointInterface)initWithService:(unsigned int)a3;
- (int)compleOOBBuffer:(unint64_t)a3;
- (int)enqueueCommand:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 outputPayloadSize:(unint64_t)a6 context:(void *)a7 options:(unsigned int)a8;
- (int)enqueueCommand:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 outputPayloadSize:(unint64_t)a7 context:(void *)a8 options:(unsigned int)a9;
- (int)enqueueCommandSync:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 responseTimestamp:(unint64_t *)a7 outputBuffer:(void *)a8 inOutBufferSize:(unint64_t *)a9 options:(unsigned int)a10;
- (int)enqueueDescriptor:(id)a3 packetType:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6;
- (int)enqueueReport:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 options:(unsigned int)a6;
- (int)enqueueReport:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 options:(unsigned int)a7;
- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 outputBuffer:(void *)a5 outputBufferSize:(unint64_t)a6 options:(unsigned int)a7;
- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 timestamp:(unint64_t)a5 outputBuffer:(void *)a6 outputBufferSize:(unint64_t)a7 options:(unsigned int)a8;
- (int)startSession:(BOOL)a3;
- (unint64_t)regID;
- (void)_cancel;
- (void)activate;
- (void)activate:(unsigned int)a3;
- (void)cancel;
- (void)dealloc;
- (void)dequeueDataMessage:(_IODataQueueMemory *)a3;
- (void)handleCommand:(char *)a3 size:(unsigned int)a4;
- (void)handleDescriptor:(char *)a3 size:(unsigned int)a4;
- (void)handleQueue:(char *)a3 size:(unsigned int)a4;
- (void)handleReport:(char *)a3 size:(unsigned int)a4;
- (void)handleResponse:(char *)a3 size:(unsigned int)a4;
- (void)setCommandHandler:(id)a3;
- (void)setCommandHandlerWithReturn:(id)a3;
- (void)setDescriptorHandler:(id)a3;
- (void)setDescriptorManagers:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setReportHandler:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation AFKEndpointInterface

+ (id)withService:(unsigned int)a3
{
  return  -[AFKEndpointInterface initWithService:]( objc_alloc(&OBJC_CLASS___AFKEndpointInterface),  "initWithService:",  *(void *)&a3);
}

+ (id)withService:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = -[AFKEndpointInterface initWithService:](objc_alloc(&OBJC_CLASS___AFKEndpointInterface), "initWithService:", v4);
  if (v6)
  {
    uint64_t v7 = [v5 mutableCopy];
    properties = v6->_properties;
    v6->_properties = (NSMutableDictionary *)v7;
  }

  return v6;
}

- (AFKEndpointInterface)initWithService:(unsigned int)a3
{
  if (IOObjectRetain(a3))
  {
    id v5 = 0LL;
  }

  else
  {
    self->_service = a3;
    IORegistryEntryGetRegistryEntryID(a3, &self->_regID);
    id v5 = self;
  }

  return v5;
}

- (void)activate
{
}

- (void)activate:(unsigned int)a3
{
  kern_return_t v10;
  NSMutableDictionary *properties;
  void *v12;
  NSSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  size_t v18;
  IONotificationPort *v19;
  unint64_t v20;
  mach_port_t NotificationPort;
  OS_dispatch_mach *v22;
  OS_dispatch_mach *dataQueueMachChannel;
  uint64_t v24;
  os_log_s *v25;
  os_log_s *v26;
  OS_dispatch_queue *queue;
  uint64_t v28;
  unint64_t v29;
  NSMutableDictionary *v30;
  void *v31;
  void block[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void v37[4];
  id v38;
  id location;
  unint64_t v40;
  _IODataQueueMemory *v41;
  __int128 v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  AFKEndpointInterface *v46;
  _BYTE v47[128];
  void v48[4];
  uint8_t buf[32];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t input[5];
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = 0LL;
  input[1] = a3;
  v40 = 0LL;
  v41 = 0LL;
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __33__AFKEndpointInterface_activate___block_invoke;
  v37[3] = &unk_18A131C58;
  objc_copyWeak(&v38, &location);
  v31 = (void *)MEMORY[0x1895B543C](v37);
  p_state = &self->_state;
  do
    unsigned int v6 = __ldaxr(p_state);
  while (__stlxr(v6 | 1, p_state));
  if ((v6 & 1) != 0) {
    goto LABEL_34;
  }
  uint64_t v7 = self->_queue;
  if (!v7)
  {
    v48[0] = 0LL;
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    LODWORD(v42) = 134217984;
    *(void *)((char *)&v42 + 4) = 0LL;
    _os_log_send_and_compose_impl();
    v24 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v24);
  }

  v8 = (unsigned int *)MEMORY[0x1895FBBE0];
  p_connect = &self->_connect;
  v10 = IOServiceOpen(self->_service, *MEMORY[0x1895FBBE0], 0x696F706Bu, &self->_connect);
  if (v10)
  {
    _AFKUserLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[AFKEndpointInterface regID](self, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.3();
    }

    goto LABEL_54;
  }

  properties = self->_properties;
  if (properties)
  {
    v10 = IOConnectSetCFProperties(*p_connect, properties);
    if (v10)
    {
      _AFKUserLog();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = -[AFKEndpointInterface regID](self, "regID");
        v30 = self->_properties;
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v30;
        _os_log_error_impl( &dword_187D3B000,  v25,  OS_LOG_TYPE_ERROR,  "0x%llx: Set IOConnectSetCFProperties:0x%x for:%@",  buf,  0x1Cu);
      }

void __33__AFKEndpointInterface_activate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = v9;
    uint64_t v7 = WeakRetained;
    v8 = v7;
    if (a2 == 8)
    {
      [v7 _cancel];
    }

    else if (a2 == 2)
    {
      [v7 dequeueDataMessage:v7[13]];
    }
  }
}

uint64_t __33__AFKEndpointInterface_activate___block_invoke_18(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 96LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancel
{
}

uint64_t __30__AFKEndpointInterface_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  if (self->_queue)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v5 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v5);
  }

  self->_queue = v4;
}

- (void)setResponseHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = v4;
}

- (void)setReportHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id reportHandler = self->_reportHandler;
  self->_id reportHandler = v4;
}

- (void)setCommandHandlerWithReturn:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id commandHandlerWithReturn = self->_commandHandlerWithReturn;
  self->_id commandHandlerWithReturn = v4;
}

- (void)setCommandHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id commandHandler = self->_commandHandler;
  self->_id commandHandler = v4;
}

- (void)setDescriptorHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id descriptorHandler = self->_descriptorHandler;
  self->_id descriptorHandler = v4;
}

- (void)setDescriptorManagers:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v5 = v4;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v7 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v7);
  }

  if (-[NSSet count](v4, "count") >= 0x10000)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v8 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v8);
  }

  descriptorManagers = self->_descriptorManagers;
  self->_descriptorManagers = v5;
}

- (void)setEventHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  uint64_t v4 = (void *)MEMORY[0x1895B543C]();
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (self->_queue && self->_state != 7)
  {
    uint64_t v8 = 0LL;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v11 = 0u;
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    unsigned int state = self->_state;
    int v9 = 67109120;
    unsigned int v10 = state;
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }

  mach_port_name_t dataQueuePort = self->_dataQueuePort;
  if (dataQueuePort) {
    mach_port_mod_refs(*MEMORY[0x1895FBBE0], dataQueuePort, 1u, -1);
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AFKEndpointInterface;
  -[AFKEndpointInterface dealloc](&v7, sel_dealloc);
}

- (int)enqueueCommand:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 outputPayloadSize:(unint64_t)a7 context:(void *)a8 options:(unsigned int)a9
{
  kern_return_t v17;
  uint64_t v19;
  uint64_t input[11];
  input[10] = *MEMORY[0x1895F89C0];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1( &v19,  input);
  }
  kdebug_trace();
  uint64_t v16 = calloc(0x18uLL, 1uLL);
  v16[2] = a7;
  *uint64_t v16 = a8;
  input[0] = a3;
  input[1] = a4;
  input[2] = (uint64_t)a5;
  input[3] = a6;
  input[4] = (uint64_t)v16;
  input[5] = a7;
  input[6] = ~(a9 >> 2) & 8 | a9;
  v17 = IOConnectCallMethod(self->_connect, 2u, input, 7u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v17) {
    free(v16);
  }
  return v17;
}

- (int)enqueueCommand:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 outputPayloadSize:(unint64_t)a6 context:(void *)a7 options:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:]( self,  "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:",  *(void *)&a3,  0LL,  a4,  a5,  a6,  a7,  v9);
}

- (int)enqueueCommandSync:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 responseTimestamp:(unint64_t *)a7 outputBuffer:(void *)a8 inOutBufferSize:(unint64_t *)a9 options:(unsigned int)a10
{
  input[10] = *MEMORY[0x1895F89C0];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1( &outputCnt,  input);
  }
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = a10;
  input[3] = (uint64_t)a8;
  input[4] = *a9;
  LODWORD(outputCnt) = 2;
  int result = IOConnectCallMethod(self->_connect, 7u, input, 5u, a5, a6, &v18, (uint32_t *)&outputCnt, 0LL, 0LL);
  if (!result)
  {
    int result = -536870210;
    if ((_DWORD)outputCnt == 2)
    {
      if (v19 <= *a9)
      {
        *a9 = v19;
        int result = 0;
        if (a7) {
          *a7 = v18;
        }
      }
    }

    else
    {
      return -536870199;
    }
  }

  return result;
}

- (int)enqueueReport:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  input[10] = *MEMORY[0x1895F89C0];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1( &v14,  input);
  }
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = ~(4 * a7) & 0x20 | a7;
  return IOConnectCallMethod(self->_connect, 4u, input, 3u, a5, a6, 0LL, 0LL, 0LL, 0LL);
}

- (int)enqueueReport:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 options:(unsigned int)a6
{
  return -[AFKEndpointInterface enqueueReport:timestamp:inputBuffer:inputBufferSize:options:]( self,  "enqueueReport:timestamp:inputBuffer:inputBufferSize:options:",  *(void *)&a3,  0LL,  a4,  a5,  *(void *)&a6);
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 timestamp:(unint64_t)a5 outputBuffer:(void *)a6 outputBufferSize:(unint64_t)a7 options:(unsigned int)a8
{
  input[10] = *MEMORY[0x1895F89C0];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1( &v16,  input);
  }
  kdebug_trace();
  input[0] = (uint64_t)a3;
  input[1] = a4;
  input[2] = a5;
  input[3] = a8 | 8;
  return IOConnectCallMethod(self->_connect, 3u, input, 4u, a6, a7, 0LL, 0LL, 0LL, 0LL);
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 outputBuffer:(void *)a5 outputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  return -[AFKEndpointInterface enqueueResponseForContext:status:timestamp:outputBuffer:outputBufferSize:options:]( self,  "enqueueResponseForContext:status:timestamp:outputBuffer:outputBufferSize:options:",  a3,  *(void *)&a4,  0LL,  a5,  a6,  *(void *)&a7);
}

- (int)enqueueDescriptor:(id)a3 packetType:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  kern_return_t v13;
  uint64_t v15;
  uint64_t input[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  v21 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  __int128 v11 = v10;
  if (self->_state != 1)
  {
    unint64_t v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    uint64_t v18 = 0u;
    *(_OWORD *)input = 0u;
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    __int128 v15 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v15);
  }

  [v10 token];
  kdebug_trace();
  if (v11)
  {
    input[0] = a4;
    input[1] = a5;
    *(void *)&v17 = [v11 token];
    [v11 manager];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&v17 + 1) = [v12 regID];
    *(void *)&uint64_t v18 = ~(a6 >> 2) & 8 | a6;

    __int128 v13 = IOConnectCallScalarMethod(self->_connect, 6u, input, 5u, 0LL, 0LL);
    if (!v13) {
      [v11 handleEnqueue];
    }
  }

  else
  {
    __int128 v13 = -536870206;
  }

  return v13;
}

- (void)dequeueDataMessage:(_IODataQueueMemory *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v5 = IODataQueuePeek(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      uint32_t dataSize = v6->size;
      if (dataSize > 0xF)
      {
        int v9 = v6->data[0];
        data = v6->data;
        switch(v9)
        {
          case 1:
            -[AFKEndpointInterface handleReport:size:](self, "handleReport:size:", data);
            break;
          case 2:
            -[AFKEndpointInterface handleCommand:size:](self, "handleCommand:size:", data);
            break;
          case 3:
            -[AFKEndpointInterface handleDescriptor:size:](self, "handleDescriptor:size:", data);
            break;
          case 4:
            -[AFKEndpointInterface handleResponse:size:](self, "handleResponse:size:", data);
            break;
          case 5:
            -[AFKEndpointInterface handleQueue:size:](self, "handleQueue:size:", data);
            break;
          default:
            _AFKUserLog();
            objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              unint64_t v11 = -[AFKEndpointInterface regID](self, "regID");
              uint32_t v12 = *data;
              *(_DWORD *)buf = 134218240;
              unint64_t v19 = v11;
              __int16 v20 = 1024;
              uint32_t v21 = v12;
              _os_log_error_impl( &dword_187D3B000,  v7,  OS_LOG_TYPE_ERROR,  "0x%llx: Unknown message type:0x%x",  buf,  0x12u);
            }

            goto LABEL_6;
        }
      }

      else
      {
        _AFKUserLog();
        objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          unint64_t v10 = -[AFKEndpointInterface regID](self, "regID");
          *(_DWORD *)buf = 134218240;
          unint64_t v19 = v10;
          __int16 v20 = 1024;
          uint32_t v21 = dataSize;
          _os_log_error_impl(&dword_187D3B000, v7, OS_LOG_TYPE_ERROR, "0x%llx: Data queue entry size:0x%x", buf, 0x12u);
        }

- (void)handleReport:(char *)a3 size:(unsigned int)a4
{
  uint64_t v6 = a3 + 24;
  kdebug_trace();
  id reportHandler = self->_reportHandler;
  uint64_t v8 = *((unsigned int *)a3 + 1);
  uint64_t v9 = *((void *)a3 + 1);
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    (*((void (**)(id, AFKEndpointInterface *, uint64_t, uint64_t, void, void))reportHandler + 2))( reportHandler,  self,  v8,  v9,  *((void *)a3 + 3),  *((void *)a3 + 2));
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((void *)a3 + 3));
  }

  else
  {
    (*((void (**)(id, AFKEndpointInterface *, uint64_t, uint64_t, char *, void))reportHandler + 2))( reportHandler,  self,  v8,  v9,  v6,  *((void *)a3 + 2));
  }

- (void)handleCommand:(char *)a3 size:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleCommand:size:].cold.1(&v8, v9);
    }
    kdebug_trace();
    id commandHandlerWithReturn = self->_commandHandlerWithReturn;
    if (commandHandlerWithReturn || (id commandHandlerWithReturn = self->_commandHandler) != 0LL) {
      (*((void (**)(id, AFKEndpointInterface *, void, void, void, void, void, void))commandHandlerWithReturn
    }
       + 2))( commandHandlerWithReturn,  self,  *((void *)a3 + 3),  *((unsigned int *)a3 + 1),  *((void *)a3 + 1),  *((void *)a3 + 5),  *((void *)a3 + 4),  *((unsigned int *)a3 + 4));
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((void *)a3 + 5));
  }

  else
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleCommand:size:].cold.1(&v8, v9);
    }
    kdebug_trace();
    id commandHandler = self->_commandHandlerWithReturn;
    if (commandHandler || (id commandHandler = self->_commandHandler) != 0LL) {
      (*((void (**)(id, AFKEndpointInterface *, void, void, void, char *, void, void))commandHandler
    }
       + 2))( commandHandler,  self,  *((void *)a3 + 3),  *((unsigned int *)a3 + 1),  *((void *)a3 + 1),  a3 + 40,  *((void *)a3 + 4),  *((unsigned int *)a3 + 4));
  }

- (void)handleResponse:(char *)a3 size:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleResponse:size:].cold.1(&v7, v8);
    }
    uint64_t v6 = (void *)*((void *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((void *)a3 + 5));
  }

  else
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleResponse:size:].cold.1(&v7, v8);
    }
    uint64_t v6 = (void *)*((void *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
  }

  free(v6);
}

- (void)handleDescriptor:(char *)a3 size:(unsigned int)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a4 <= 7) {
    -[AFKEndpointInterface handleDescriptor:size:].cold.2(&v22, buf);
  }
  kdebug_trace();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v6 = self->_descriptorManagers;
  uint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
LABEL_4:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      if (objc_msgSend(v10, "regID", (void)v18) == *((void *)a3 + 3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }

    id v11 = v10;

    if (!v11) {
      goto LABEL_17;
    }
    if (a3[36]) {
      uint32_t v12 = off_18A1319E8;
    }
    else {
      uint32_t v12 = off_18A1319F8;
    }
    -[__objc2_class withManager:capacity:token:]( *v12,  "withManager:capacity:token:",  v11,  *((unsigned int *)a3 + 8),  *((void *)a3 + 2));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      (*((void (**)(void))self->_descriptorHandler + 2))();
      goto LABEL_21;
    }

    _AFKUserLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = -[AFKEndpointInterface regID](self, "regID");
      uint64_t v17 = *((void *)a3 + 2);
      uint64_t v16 = *((void *)a3 + 3);
      *(_DWORD *)buf = 134218496;
      unint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_error_impl( &dword_187D3B000,  v14,  OS_LOG_TYPE_ERROR,  "0x%llx: Couldn't create descriptor for AFKDescMsg (regID:0x%llx token:0x%llx)",  buf,  0x20u);
    }
  }

  else
  {
LABEL_10:

LABEL_17:
    _AFKUserLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AFKEndpointInterface handleDescriptor:size:].cold.1( (uint64_t)a3,  buf,  -[AFKEndpointInterface regID](self, "regID"),  v14);
    }
    id v11 = 0LL;
  }

  __int128 v13 = 0LL;
LABEL_21:
}

- (void)handleQueue:(char *)a3 size:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a4 <= 7) {
    -[AFKEndpointInterface handleQueue:size:].cold.1( &v10,  v11,  (uint64_t)a3,  *(uint64_t *)&a4,  v4,  v5,  v6,  v7,  v10,  *(size_t **)&v11[0]);
  }
  -[AFKEndpointInterface dequeueDataMessage:](self, "dequeueDataMessage:", *((void *)a3 + 3));
  -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((void *)a3 + 3));
}

- (int)compleOOBBuffer:(unint64_t)a3
{
  kern_return_t v5;
  os_log_s *v6;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  kern_return_t v13;
  uint64_t input[2];
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  uint64_t v5 = IOConnectCallMethod(self->_connect, 9u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v5)
  {
    _AFKUserLog();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v9 = -[AFKEndpointInterface regID](self, "regID");
      uint64_t v10 = 2048;
      id v11 = a3;
      uint64_t v12 = 1024;
      __int128 v13 = v5;
      _os_log_error_impl( &dword_187D3B000,  v6,  OS_LOG_TYPE_ERROR,  "0x%llx: kDataQueueFreeOOBMsgMethod (%llx):0x%x",  buf,  0x1Cu);
    }
  }

  return v5;
}

- (int)startSession:(BOOL)a3
{
  input[10] = *MEMORY[0x1895F89C0];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1( &v4,  input);
  }
  input[0] = a3;
  return IOConnectCallMethod(self->_connect, 5u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

- (unint64_t)regID
{
  return self->_regID;
}

- (void).cxx_destruct
{
}

- (void)activate:(os_log_s *)a3 .cold.2(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_187D3B000, a2, a3, "0x%llx: _asyncPort", (uint8_t *)a1);
}

- (void)activate:(os_log_s *)a3 .cold.3(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_187D3B000, a2, a3, "0x%llx: IODataQueueAllocateNotificationPort", (uint8_t *)a1);
}

- (void)activate:(os_log_s *)a3 .cold.4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_187D3B000, a2, a3, "0x%llx: dispatch_mach_create", (uint8_t *)a1);
}

- (void)activate:.cold.5()
{
}

- (void)activate:.cold.6()
{
}

- (void)enqueueCommand:(void *)a1 timestamp:(_OWORD *)a2 inputBuffer:inputBufferSize:outputPayloadSize:context:options:.cold.1( void *a1,  _OWORD *a2)
{
}

- (void)dequeueDataMessage:.cold.1()
{
}

- (void)handleCommand:(void *)a1 size:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)handleResponse:(void *)a1 size:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)handleDescriptor:(uint64_t)a3 size:(os_log_t)log .cold.1( uint64_t a1,  uint8_t *buf,  uint64_t a3,  os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 24);
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl( &dword_187D3B000,  log,  OS_LOG_TYPE_ERROR,  "0x%llx: Couldn't find manager for AFKDescMsg (regID:0x%llx)",  buf,  0x16u);
}

- (void)handleDescriptor:(void *)a1 size:(_OWORD *)a2 .cold.2(void *a1, _OWORD *a2)
{
}

- (void)handleQueue:(uint64_t)a3 size:(uint64_t)a4 .cold.1( void *a1,  _OWORD *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  void *a9,  size_t *a10)
{
  mach_port_t v10 = OUTLINED_FUNCTION_4();
  __break(1u);
  IOConnectCallMethod(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

@end