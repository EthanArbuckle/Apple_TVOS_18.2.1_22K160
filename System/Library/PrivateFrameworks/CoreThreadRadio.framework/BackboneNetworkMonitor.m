@interface BackboneNetworkMonitor
- (BOOL)isConnected;
- (NSString)interfaceName;
- (NSString)mBackhaulName;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path_monitor)monitor;
- (const)getCurrentBackhaul;
- (const)getInterfaceName;
- (unsigned)getAndReset2GDuration;
- (unsigned)getAndReset5GDuration;
- (unsigned)getAndReset6GDuration;
- (unsigned)getAndResetEthernetDuration;
- (unsigned)getAndResetOdeonDuration;
- (unsigned)getAndResetUnknownDuration;
- (void)setInterfaceName:(id)a3;
- (void)setInterfaceNameEnum:(unsigned __int8)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setMBackhaulName:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)startNetworkMonitoring;
- (void)startTimeAndGetCurrentDimension;
- (void)stopNetworkMonitoring;
- (void)stopTimeAndCalculateCurrentDuration;
@end

@implementation BackboneNetworkMonitor

- (void)startNetworkMonitoring
{
  v3 = objc_autoreleasePoolPush();
  nw_path_monitor_t v4 = nw_path_monitor_create();
  -[BackboneNetworkMonitor setMonitor:](self, "setMonitor:", v4);

  v5 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));
  nw_path_monitor_prohibit_interface_type(v5, nw_interface_type_other);

  v6 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitorQueue](self, "monitorQueue"));
  nw_path_monitor_set_queue(v6, v7);

  v8 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472LL;
  update_handler[2] = sub_1001051D0;
  update_handler[3] = &unk_1002B3688;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v8, update_handler);

  v9 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));
  nw_path_monitor_start(v9);

  objc_autoreleasePoolPop(v3);
}

- (void)stopNetworkMonitoring
{
  v3 = objc_autoreleasePoolPush();
  nw_path_monitor_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));

  if (v4)
  {
    v5 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor monitor](self, "monitor"));
    nw_path_monitor_cancel(v5);
  }

  -[BackboneNetworkMonitor setMonitor:](self, "setMonitor:", 0LL);
  objc_autoreleasePoolPop(v3);
}

- (const)getInterfaceName
{
  id v2 = objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor interfaceName](self, "interfaceName"));
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (OS_nw_path_monitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)mBackhaulName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMBackhaulName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setInterfaceNameEnum:(unsigned __int8)a3
{
  byte_1002D1930 = a3;
}

- (const)getCurrentBackhaul
{
  else {
    v3 = off_1002B45D0[qword_1002D1938];
  }
  -[BackboneNetworkMonitor setMBackhaulName:](self, "setMBackhaulName:", v3);
  id v4 = objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor mBackhaulName](self, "mBackhaulName"));
  [v4 cStringUsingEncoding:4];

  id v5 = objc_claimAutoreleasedReturnValue(-[BackboneNetworkMonitor mBackhaulName](self, "mBackhaulName"));
  v6 = (const char *)[v5 cStringUsingEncoding:4];

  return v6;
}

- (unsigned)getAndReset2GDuration
{
  if (qword_1002D1938 == 3)
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v3 = word_1002D1940;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  else
  {
    unsigned __int16 v3 = word_1002D1940;
  }

  word_1002D1940 = 0;
  return v3;
}

- (unsigned)getAndReset5GDuration
{
  if (qword_1002D1938 == 4)
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v3 = word_1002D1942;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  else
  {
    unsigned __int16 v3 = word_1002D1942;
  }

  word_1002D1942 = 0;
  return v3;
}

- (unsigned)getAndReset6GDuration
{
  if (qword_1002D1938 == 5)
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v3 = word_1002D1944;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  else
  {
    unsigned __int16 v3 = word_1002D1944;
  }

  word_1002D1944 = 0;
  return v3;
}

- (unsigned)getAndResetOdeonDuration
{
  if (qword_1002D1938 == 2)
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v3 = word_1002D1946;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  else
  {
    unsigned __int16 v3 = word_1002D1946;
  }

  word_1002D1946 = 0;
  return v3;
}

- (unsigned)getAndResetEthernetDuration
{
  if (qword_1002D1938 == 1)
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v3 = word_1002D1948;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  else
  {
    unsigned __int16 v3 = word_1002D1948;
  }

  word_1002D1948 = 0;
  return v3;
}

- (unsigned)getAndResetUnknownDuration
{
  if (qword_1002D1938)
  {
    unsigned __int16 v2 = word_1002D194A;
  }

  else
  {
    -[BackboneNetworkMonitor stopTimeAndCalculateCurrentDuration](self, "stopTimeAndCalculateCurrentDuration");
    unsigned __int16 v2 = word_1002D194A;
    -[BackboneNetworkMonitor startTimeAndGetCurrentDimension](self, "startTimeAndGetCurrentDimension");
  }

  word_1002D194A = 0;
  return v2;
}

- (void)startTimeAndGetCurrentDimension
{
  qword_1002D1950 = v5.tv_sec;
  switch(byte_1002D1930)
  {
    case 1:
      int v2 = sub_10010FD60();
      uint64_t v3 = (v2 - 1) + 3LL;
      break;
    case 2:
      uint64_t v3 = 6LL;
      break;
    case 3:
      uint64_t v3 = 1LL;
      break;
    case 4:
      uint64_t v3 = 7LL;
      break;
    case 5:
      uint64_t v3 = 2LL;
      break;
    default:
      uint64_t v3 = 0LL;
      break;
  }

  qword_1002D1938 = v3;
}

- (void)stopTimeAndCalculateCurrentDuration
{
  __darwin_time_t v2 = v5.tv_sec - qword_1002D1950;
  if (v5.tv_sec <= qword_1002D1950)
  {
    if (v5.tv_sec < qword_1002D1950) {
      NSLog(@"Invalid state => mtimeWhenBackhaulStopped is less than mtimeWhenBackhaulStarted");
    }
  }

  else if (__OFSUB__(v5.tv_sec, qword_1002D1950))
  {
    __break(0x5515u);
LABEL_26:
    __break(0x5500u);
  }

  else
  {
    switch(qword_1002D1938)
    {
      case 1LL:
        if ((unsigned __int16)word_1002D1948 - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D1948, v2);
          LOWORD(v2) = word_1002D1948 + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D1948 = v2;
        break;
      case 2LL:
        if ((unsigned __int16)word_1002D1946 - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D1946, v2);
          LOWORD(v2) = word_1002D1946 + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D1946 = v2;
        break;
      case 3LL:
        if ((unsigned __int16)word_1002D1940 - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D1940, v2);
          LOWORD(v2) = word_1002D1940 + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D1940 = v2;
        break;
      case 4LL:
        if ((unsigned __int16)word_1002D1942 - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D1942, v2);
          LOWORD(v2) = word_1002D1942 + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D1942 = v2;
        break;
      case 5LL:
        if ((unsigned __int16)word_1002D1944 - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D1944, v2);
          LOWORD(v2) = word_1002D1944 + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D1944 = v2;
        break;
      default:
        if ((unsigned __int16)word_1002D194A - 1 <= 0xE11)
        {
          BOOL v3 = __OFADD__((unsigned __int16)word_1002D194A, v2);
          LOWORD(v2) = word_1002D194A + v2;
          if (v3) {
            goto LABEL_26;
          }
        }

        word_1002D194A = v2;
        break;
    }
  }

@end