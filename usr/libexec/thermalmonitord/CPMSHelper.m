@interface CPMSHelper
+ (id)sharedInstance;
- (BOOL)isCPMSSupportedClient:(int)a3;
- (CPMSHelper)init;
- (IONotificationPort)notificationPort;
- (OS_dispatch_queue)cpmsHelperQueue;
- (int)getMitigationTypeForClientID:(unsigned __int8)a3;
- (unsigned)cpmsService;
- (unsigned)getMaxPowerForComponent:(int)a3;
- (unsigned)getMinPowerForComponent:(int)a3;
- (unsigned)ioIterator;
- (unsigned)notification;
- (void)addToCPMSMitigationArray:(unsigned int)a3 forComponent:(int)a4;
- (void)addToCPMSMitigationArray:(unsigned int)a3 withDetails:(unint64_t)a4 forComponent:(int)a5;
- (void)dealloc;
- (void)publishDetailedMitigationArrayToCPMS;
- (void)requestCurrentPowerCallbackForComponent:(int)a3;
- (void)setCpmsHelperQueue:(id)a3;
- (void)setCpmsService:(unsigned int)a3;
- (void)setIoIterator:(unsigned int)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setPowerBudget:(unsigned int)a3 withDetails:(unint64_t)a4 forCPMSClient:(unsigned __int8)a5 atIdx:(int)a6;
- (void)setProduct:(id)a3;
- (void)updateCPMSClientState:(int)a3;
@end

@implementation CPMSHelper

+ (id)sharedInstance
{
  if (qword_100074AD8 != -1) {
    dispatch_once(&qword_100074AD8, &stru_100061170);
  }
  return (id)qword_100074AE0;
}

- (CPMSHelper)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CPMSHelper;
  v2 = -[CPMSHelper init](&v30, "init");
  v3 = v2;
  if (v2)
  {
    v2->detailMitigationArray.count = 0;
    v4 = IOServiceMatching("ApplePPM");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    v3->cpmsService = MatchingService;
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v3->connect))
      {
        v6 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPMSHelper: Could not open connection to PPM service",  v29,  2u);
        }
      }

      if (byte_10007CB30)
      {
        v7 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPMS Helper, creating peak pressure token",  v29,  2u);
        }
      }

      if (notify_register_check("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerPressureNotificationToken))
      {
        v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100039328(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }

      dispatch_queue_t v16 = dispatch_queue_create("com.apple.ThermalMonitor.CPMSHelper", 0LL);
      v3->_cpmsHelperQueue = (OS_dispatch_queue *)v16;
      if (!v16)
      {
        v17 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_1000392B8(v17, v18, v19, v20, v21, v22, v23, v24);
        }
      }

      -[CPMSHelper setNotificationPort:](v3, "setNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
      IOServiceAddInterestNotification( v3->notificationPort,  v3->cpmsService,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10000D6A0,  v3,  &v3->_notification);
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource(-[CPMSHelper notificationPort](v3, "notificationPort"));
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    }

    else
    {
      v27 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "<Notice> CPMSHelper: Could not find PPM service",  v29,  2u);
      }
    }
  }

  return v3;
}

- (void)dealloc
{
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  io_object_t ioIterator = self->_ioIterator;
  if (ioIterator) {
    IOObjectRelease(ioIterator);
  }
  if (-[CPMSHelper notificationPort](self, "notificationPort")) {
    IONotificationPortDestroy(-[CPMSHelper notificationPort](self, "notificationPort"));
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPMSHelper;
  -[CPMSHelper dealloc](&v5, "dealloc");
}

- (BOOL)isCPMSSupportedClient:(int)a3
{
  return byte_100061190[24 * a3] != 255LL
      && byte_100074AE8[1552 * byte_100061190[24 * a3] + 280] != 0;
}

- (void)setPowerBudget:(unsigned int)a3 withDetails:(unint64_t)a4 forCPMSClient:(unsigned __int8)a5 atIdx:(int)a6
{
  v6 = (char *)self + 16 * a6;
  v6[16] = a5;
  *((_DWORD *)v6 + 5) = a3;
  *((void *)v6 + 3) = a4;
  ++self->detailMitigationArray.count;
}

- (void)addToCPMSMitigationArray:(unsigned int)a3 forComponent:(int)a4
{
}

- (void)addToCPMSMitigationArray:(unsigned int)a3 withDetails:(unint64_t)a4 forComponent:(int)a5
{
  uint64_t v7 = *(void *)&a3;
  if (-[CPMSHelper isCPMSSupportedClient:](self, "isCPMSSupportedClient:", *(void *)&a5))
  {
    uint64_t count = self->detailMitigationArray.count;
    if ((int)count > 29)
    {
      uint64_t v13 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100039358(count, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    else
    {
      if (byte_10007CB30)
      {
        uint64_t v10 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)&byte_100061190[24 * a5 + 8];
          v20[0] = 67109890;
          v20[1] = v7;
          __int16 v21 = 2048;
          unint64_t v22 = a4;
          __int16 v23 = 2080;
          uint64_t v24 = v11;
          __int16 v25 = 1024;
          int v26 = count;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> Setting power budget of %dmW with details: 0x%llx for client %s at index(detailMitigationArray.count): %d",  (uint8_t *)v20,  0x22u);
          uint64_t count = self->detailMitigationArray.count;
        }
      }

      -[CPMSHelper setPowerBudget:withDetails:forCPMSClient:atIdx:]( self,  "setPowerBudget:withDetails:forCPMSClient:atIdx:",  v7,  a4,  byte_100061190[24 * a5],  count);
    }
  }

  else
  {
    uint64_t v12 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000393BC(a5, v12);
    }
  }

- (void)publishDetailedMitigationArrayToCPMS
{
  int count = self->detailMitigationArray.count;
  if (count >= 1)
  {
    p_detailMitigationArray = &self->detailMitigationArray;
    if (byte_10007CB30)
    {
      objc_super v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 67109120;
        v15[1] = count;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Publishing detailed mitigation array to CPMS with mitigation count: %d",  (uint8_t *)v15,  8u);
      }
    }

    uint64_t v6 = IOConnectCallStructMethod(self->connect, 0x23u, p_detailMitigationArray, 0x1E8uLL, 0LL, 0LL);
    if ((_DWORD)v6)
    {
      uint64_t v7 = v6;
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003945C(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }

    self->detailMitigationArray.int count = 0;
  }

- (unsigned)getMaxPowerForComponent:(int)a3
{
  if (!byte_100074AE8[1552 * byte_100061190[24 * a3] + 280])
  {
    uint64_t v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)&byte_100061190[24 * a3 + 8];
      int v10 = 136315138;
      v11[0] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Client:%s is not currently registered.",  (uint8_t *)&v10,  0xCu);
    }

    goto LABEL_10;
  }

  unsigned int v4 = *(_DWORD *)&byte_100074AE8[1552 * byte_100061190[24 * a3] + 304];
  if (byte_10007CB30)
  {
    objc_super v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)&byte_100061190[24 * a3 + 8];
      int v10 = 67109378;
      LODWORD(v11[0]) = v4;
      WORD2(v11[0]) = 2080;
      *(void *)((char *)v11 + 6) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Got maxPower of %dmW for client:%s",  (uint8_t *)&v10,  0x12u);
    }
  }

  if (!v4)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000394C0();
    }
    return 0;
  }

  return v4;
}

- (unsigned)getMinPowerForComponent:(int)a3
{
  if (!byte_100074AE8[1552 * byte_100061190[24 * a3] + 280])
  {
    uint64_t v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)&byte_100061190[24 * a3 + 8];
      int v10 = 136315138;
      v11[0] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Client:%s is not currently registered.",  (uint8_t *)&v10,  0xCu);
    }

    goto LABEL_10;
  }

  unsigned int v4 = *(_DWORD *)&byte_100074AE8[1552 * byte_100061190[24 * a3] + 292];
  if (byte_10007CB30)
  {
    objc_super v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)&byte_100061190[24 * a3 + 8];
      int v10 = 67109378;
      LODWORD(v11[0]) = v4;
      WORD2(v11[0]) = 2080;
      *(void *)((char *)v11 + 6) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Got minPower of %dmW for client:%s",  (uint8_t *)&v10,  0x12u);
    }
  }

  if (v4 == -1)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039530();
    }
    return -1;
  }

  return v4;
}

- (void)requestCurrentPowerCallbackForComponent:(int)a3
{
  kern_return_t v6;
  kern_return_t v7;
  os_log_s *v8;
  uint64_t v9;
  uint64_t input;
  uint8_t buf[4];
  kern_return_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t reference[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  if ((a3 - 15) >= 3)
  {
    input = byte_100061190[24 * a3];
    if (input == 255)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_1000395A0();
      }
    }

    else
    {
      reference[0] = 0LL;
      uint64_t v19 = 0u;
      uint64_t v20 = 0u;
      reference[1] = (uint64_t)sub_10000E068;
      uint64_t v18 = (unint64_t)self;
      mach_port_t connect = self->connect;
      mach_port_t MachPort = IONotificationPortGetMachPort(-[CPMSHelper notificationPort](self, "notificationPort"));
      uint64_t v6 = IOConnectCallAsyncScalarMethod(connect, 0x20u, MachPort, reference, 8u, &input, 1u, 0LL, 0LL);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)&byte_100061190[24 * a3 + 8];
          *(_DWORD *)buf = 67109634;
          uint64_t v12 = v7;
          uint64_t v13 = 2048;
          uint64_t v14 = input;
          uint64_t v15 = 2080;
          uint64_t v16 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "<Error> IOConnect call to kAppleCPMSPPMGetCurrentPowerConsumption returned 0x%08x for clientID: %llu %s\n",  buf,  0x1Cu);
        }
      }
    }
  }

- (void)updateCPMSClientState:(int)a3
{
  uint64_t v3 = byte_100061190[24 * a3];
  uint64_t input = v3;
  if (v3 != 255)
  {
    size_t v9 = 1552LL;
    if (byte_10007CB30)
    {
      uint64_t v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)&byte_100061190[24 * a3 + 8];
        *(_DWORD *)buf = 67109634;
        int v12 = a3;
        __int16 v13 = 2080;
        uint64_t v14 = v8;
        __int16 v15 = 2048;
        uint64_t v16 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating client state for mitigationType:%d, ClientName:%s PPMClientId:%llu",  buf,  0x1Cu);
      }
    }

    if (IOConnectCallMethod( self->connect,  0x1Du,  &input,  1u,  0LL,  0LL,  0LL,  0LL,  &byte_100074AE8[1552 * v3],  &v9))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100039710();
      }
    }
  }

- (void)setProduct:(id)a3
{
  self->productObj = (CommonProduct *)a3;
}

- (int)getMitigationTypeForClientID:(unsigned __int8)a3
{
  uint64_t v3 = 0LL;
  unsigned int v4 = byte_100061190;
  while (1)
  {
    int v5 = *v4;
    v4 += 24;
    if (v5 == a3) {
      break;
    }
    if (++v3 == 18)
    {
      LODWORD(v3) = -1;
      return v3;
    }
  }

  return v3;
}

- (unsigned)cpmsService
{
  return self->cpmsService;
}

- (void)setCpmsService:(unsigned int)a3
{
  self->cpmsService = a3;
}

- (IONotificationPort)notificationPort
{
  return self->notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->notificationPort = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_io_object_t notification = a3;
}

- (unsigned)ioIterator
{
  return self->_ioIterator;
}

- (void)setIoIterator:(unsigned int)a3
{
  self->_io_object_t ioIterator = a3;
}

- (OS_dispatch_queue)cpmsHelperQueue
{
  return self->_cpmsHelperQueue;
}

- (void)setCpmsHelperQueue:(id)a3
{
  self->_cpmsHelperQueue = (OS_dispatch_queue *)a3;
}

@end