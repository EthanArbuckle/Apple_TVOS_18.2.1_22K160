@interface AFKMemoryDescriptorManager
+ (id)withService:(unsigned int)a3;
- (AFKMemoryDescriptorManager)initWithService:(unsigned int)a3;
- (unint64_t)regID;
- (unsigned)connect;
- (void)dealloc;
@end

@implementation AFKMemoryDescriptorManager

+ (id)withService:(unsigned int)a3
{
  return  -[AFKMemoryDescriptorManager initWithService:]( objc_alloc(&OBJC_CLASS___AFKMemoryDescriptorManager),  "initWithService:",  *(void *)&a3);
}

- (AFKMemoryDescriptorManager)initWithService:(unsigned int)a3
{
  output[1] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AFKMemoryDescriptorManager;
  v4 = -[AFKMemoryDescriptorManager init](&v8, sel_init);
  if (!v4 || IOObjectRetain(a3)) {
    goto LABEL_16;
  }
  v4->_service = a3;
  if (IOServiceOpen(a3, *MEMORY[0x1895FBBE0], 0x6D646D72u, &v4->_connect))
  {
    _AFKUserLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[AFKMemoryDescriptorManager regID](v4, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.3();
    }

    goto LABEL_15;
  }

  if (IOConnectCallScalarMethod(v4->_connect, 9u, 0LL, 0, output, &outputCnt))
  {
    _AFKUserLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[AFKMemoryDescriptorManager regID](v4, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.2();
    }

    goto LABEL_15;
  }

  if (outputCnt != 1)
  {
    _AFKUserLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AFKMemoryDescriptorManager initWithService:].cold.1( (uint64_t)&outputCnt,  (uint64_t)v10,  -[AFKMemoryDescriptorManager regID](v4, "regID"));
    }
LABEL_15:

LABEL_16:
    v5 = 0LL;
    goto LABEL_17;
  }

  v4->_regID = output[0];
  v5 = v4;
LABEL_17:

  return v5;
}

- (void)dealloc
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }

  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AFKMemoryDescriptorManager;
  -[AFKMemoryDescriptorManager dealloc](&v5, sel_dealloc);
}

- (unint64_t)regID
{
  return self->_regID;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)initWithService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)initWithService:.cold.2()
{
}

- (void)initWithService:.cold.3()
{
}

@end