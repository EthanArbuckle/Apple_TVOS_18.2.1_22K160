@interface USBManager
- (Transport)transport;
- (USBManager)initWithTransport:(id)a3;
- (unsigned)getUSBMode;
- (void)enableUSBHostMode;
- (void)setTransport:(id)a3;
@end

@implementation USBManager

- (USBManager)initWithTransport:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___USBManager;
  v5 = -[USBManager init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_transport, v4);
  }

  return v6;
}

- (unsigned)getUSBMode
{
  unsigned int v8 = -1;
  char v7 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([WeakRetained portNumber]);

  if ((_DWORD)ServiceWithPrimaryPort)
  {
    uint64_t USBConnectType = IOAccessoryManagerGetUSBConnectType(ServiceWithPrimaryPort, &v8, &v7);
    if ((_DWORD)USBConnectType)
    {
      NSLog(@"%s ERROR: Get USB connect type error:%02X !\n", "-[USBManager getUSBMode]", USBConnectType);
    }

    else
    {
      if (v8 == 2)
      {
        unsigned __int16 v5 = 1;
        goto LABEL_6;
      }

      if ((v8 & 0xFFFFFFFB) == 0)
      {
        unsigned __int16 v5 = 0;
        goto LABEL_6;
      }

      NSLog(@"ERROR: Unknown USB connect type: %d", v8);
    }
  }

  else
  {
    NSLog(@"%s ERROR: Primary port ioService = NULL !\n", "-[USBManager getUSBMode]");
  }

  unsigned __int16 v5 = -1;
LABEL_6:
  IOObjectRelease(ServiceWithPrimaryPort);
  return v5;
}

- (void)enableUSBHostMode
{
  p_transport = &self->_transport;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([WeakRetained portNumber]);

  if (!ServiceWithPrimaryPort)
  {
    unsigned __int16 v5 = __stderrp;
    id v6 = objc_loadWeakRetained((id *)p_transport);
    fprintf(v5, "could not find IOAccessoryManager service for port %llu\n", [v6 portNumber]);
  }

  io_connect_t connect = -1431655766;
  mach_error_t v7 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
  if (v7)
  {
    v12 = __stderrp;
    v13 = mach_error_string(v7);
    fprintf(v12, "could not open IOAccessoryManager service: %s\n", v13);
    exit(1);
  }

  mach_error_t v8 = IOAccessoryManagerConfigureUSBMode(connect, 2LL);
  if (v8)
  {
    v9 = __stderrp;
    v10 = mach_error_string(v8);
    fprintf(v9, "could not configure USB mode: %s\n", v10);
  }

  else
  {
    dispatch_time_t v11 = dispatch_time(0LL, 500000000LL);
    dispatch_after(v11, &_dispatch_main_q, &stru_10001CD18);
  }

  IOServiceClose(connect);
  IOObjectRelease(ServiceWithPrimaryPort);
}

- (Transport)transport
{
  return (Transport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end