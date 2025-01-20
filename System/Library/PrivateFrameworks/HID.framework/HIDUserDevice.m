@interface HIDUserDevice
- (BOOL)handleReport:(id)a3 error:(id *)a4;
- (BOOL)handleReport:(id)a3 withTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (HIDUserDevice)initWithProperties:(id)a3;
- (id)description;
- (id)propertyForKey:(id)a3;
- (unsigned)service;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGetReportHandler:(id)a3;
- (void)setSetReportHandler:(id)a3;
@end

@implementation HIDUserDevice

- (HIDUserDevice)initWithProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HIDUserDevice;
  v5 = -[HIDUserDevice init](&v12, sel_init);
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"HIDUserDeviceCreateInactive"];
  if (v6)
  {
    v7 = (void *)v6;
    [v4 objectForKeyedSubscript:@"HIDUserDeviceCreateInactive"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 isEqual:MEMORY[0x189604A88]];
  }

  uint64_t v9 = IOHIDUserDeviceCreateWithOptions();
  v5->_device = (__IOHIDUserDevice *)v9;
  if (v9)
  {
    v5->_service = IOHIDUserDeviceCopyService();
    v10 = v5;
  }

  else
  {
LABEL_6:
    v10 = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  device = self->_device;
  if (device) {
    CFRelease(device);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HIDUserDevice;
  -[HIDUserDevice dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_device];
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)IOHIDUserDeviceCopyProperty(self->_device, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDUserDeviceSetProperty(self->_device, (CFStringRef)a4, a3) != 0;
}

- (void)setCancelHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v4;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  device = self->_device;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __25__HIDUserDevice_activate__block_invoke;
  handler[3] = &unk_18A02DA40;
  handler[4] = self;
  IOHIDUserDeviceSetCancelHandler(device, handler);
  IOHIDUserDeviceActivate(self->_device);
}

void __25__HIDUserDevice_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;
  }

- (void)cancel
{
}

- (void)setGetReportHandler:(id)a3
{
  id v4 = a3;
  if (self->_getReportHandler) {
    -[HIDUserDevice setGetReportHandler:].cold.1();
  }
  id v7 = v4;
  objc_super v5 = _Block_copy(v4);
  id getReportHandler = self->_getReportHandler;
  self->_id getReportHandler = v5;

  IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
}

- (void)setSetReportHandler:(id)a3
{
  id v4 = a3;
  if (self->_setReportHandler) {
    -[HIDUserDevice setSetReportHandler:].cold.1();
  }
  id v7 = v4;
  objc_super v5 = _Block_copy(v4);
  id setReportHandler = self->_setReportHandler;
  self->_id setReportHandler = v5;

  IOHIDUserDeviceRegisterSetReportCallback();
}

- (BOOL)handleReport:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = IOHIDUserDeviceHandleReport();
  int v7 = v6;
  if (a4 && (_DWORD)v6)
  {
    [MEMORY[0x189607870] errorWithIOReturn:v6];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 0;
}

- (BOOL)handleReport:(id)a3 withTimestamp:(unint64_t)a4 error:(id *)a5
{
  device = self->_device;
  id v8 = a3;
  uint64_t v9 = (const uint8_t *)[v8 bytes];
  CFIndex v10 = [v8 length];

  uint64_t v11 = IOHIDUserDeviceHandleReportWithTimeStamp(device, a4, v9, v10);
  int v12 = v11;
  if (a5 && (_DWORD)v11)
  {
    [MEMORY[0x189607870] errorWithIOReturn:v11];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12 == 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

- (void)setGetReportHandler:.cold.1()
{
}

- (void)setSetReportHandler:.cold.1()
{
  v0 = (const __CFAllocator *)_os_crash();
  __break(1u);
  CFArrayCreateMutable(v0, v1, v2);
}

@end