@interface PowerManager
- (PowerManager)initWithTransport:(id)a3;
- (Transport)transport;
- (unsigned)getCurrentLimit;
- (unsigned)getPowerMode;
- (void)enableUHPM;
- (void)setTransport:(id)a3;
@end

@implementation PowerManager

- (PowerManager)initWithTransport:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PowerManager;
  v5 = -[PowerManager init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_transport, v4);
  }

  return v6;
}

- (unsigned)getPowerMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([WeakRetained portNumber]);

  if ((_DWORD)ServiceWithPrimaryPort)
  {
    uint64_t PowerMode = IOAccessoryManagerGetPowerMode(ServiceWithPrimaryPort);
    unsigned __int16 v5 = 0;
    switch((int)PowerMode)
    {
      case 0:
        NSLog(@"ERROR: Unable to get power mode");
        goto LABEL_7;
      case 1:
        break;
      case 2:
        unsigned __int16 v5 = 1;
        break;
      case 4:
        unsigned __int16 v5 = 2;
        break;
      default:
        NSLog(@"### WARNING: Unhandled power mode: %d", PowerMode);
        goto LABEL_7;
    }
  }

  else
  {
    NSLog(@"%s ERROR: Primary port ioService = NULL !\n", "-[PowerManager getPowerMode]");
LABEL_7:
    unsigned __int16 v5 = -1;
  }

  IOObjectRelease(ServiceWithPrimaryPort);
  return v5;
}

- (unsigned)getCurrentLimit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([WeakRetained portNumber]);

  if (!(_DWORD)ServiceWithPrimaryPort)
  {
    NSLog(@"%s ERROR: Primary port ioService = NULL !\n", "-[PowerManager getCurrentLimit]");
LABEL_8:
    unsigned int v6 = 0xFFFF;
    goto LABEL_9;
  }

  uint64_t PowerMode = IOAccessoryManagerGetPowerMode(ServiceWithPrimaryPort);
  if (!(_DWORD)PowerMode)
  {
    NSLog(@"ERROR: Unable to get power mode");
    goto LABEL_8;
  }

  int v5 = IOAccessoryManagerPowerModeCurrentLimit(ServiceWithPrimaryPort, PowerMode);
  if (!v5)
  {
    NSLog(@"ERROR: Accessory power mode not supported");
    goto LABEL_8;
  }

  unsigned int v6 = (unsigned __int16)v5;
LABEL_9:
  IOObjectRelease(ServiceWithPrimaryPort);
  return v6;
}

- (void)enableUHPM
{
  p_transport = &self->_transport;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([WeakRetained portNumber]);

  if (!ServiceWithPrimaryPort)
  {
    int v5 = __stderrp;
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

  mach_error_t v8 = IOAccessoryManagerConfigurePower(connect, 4LL);
  if (v8)
  {
    v9 = __stderrp;
    v10 = mach_error_string(v8);
    fprintf(v9, "could not configure high current mode: %s\n", v10);
  }

  else
  {
    NSLog(@"Enabled Ulta High Current Mode");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:@"NotificationPowerModeChanged" object:0];
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