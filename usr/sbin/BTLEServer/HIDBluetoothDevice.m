@interface HIDBluetoothDevice
+ (BOOL)reportsHaveMultipleReportIDs:(id)a3;
+ (id)hidDeviceWithProperties:(id)a3 reports:(id)a4;
- (CBPeripheral)peripheral;
- (HIDBluetoothDevice)init;
- (HIDBluetoothDevice)initWithProperties:(id)a3 reports:(id)a4;
- (HIDServiceProtocol)service;
- (id)allocHIDQueue;
- (id)desiredConnectionParameters;
- (int)getReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5;
- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (unsigned)state;
- (void)dealloc;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)notifyDesiredConnectionParametersDidChange;
- (void)notifyDidStart;
- (void)notifyDidStop;
- (void)setPeripheral:(id)a3;
- (void)setService:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDBluetoothDevice

+ (id)hidDeviceWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"VendorIDSource"];
  if ([v8 unsignedCharValue] == 1)
  {
    v9 = [v6 objectForKeyedSubscript:@"VendorID"];
    unsigned int v10 = [v9 unsignedShortValue];

    if (v10 == 76)
    {
      v11 = [v6 objectForKeyedSubscript:@"ProductID"];
      unsigned int v12 = [v11 unsignedShortValue];

      if (v12 - 788 < 2 || v12 == 621 || v12 == 614)
      {
        v13 = [v6 objectForKeyedSubscript:@"Authenticated"];
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___HIDAppleSiriRemoteDevice, v15);
          if (v16) {
            goto LABEL_13;
          }
        }
      }
    }
  }

  else
  {
  }

  unsigned int v17 = [a1 reportsHaveMultipleReportIDs:v7];
  v19 = off_10005C388;
  if (!v17) {
    v19 = &off_10005C390;
  }
  v16 = (objc_class *)objc_opt_class(*v19, v18);
LABEL_13:
  id v20 = [[v16 alloc] initWithProperties:v6 reports:v7];

  return v20;
}

- (void)start
{
  id v2 = [PolicyManager instance];
  objc_msgSend(v2, "setActiveHIDDeviceCount:", (char *)objc_msgSend(v2, "activeHIDDeviceCount") + 1);
}

- (void)stop
{
  id v2 = [PolicyManager instance];
  objc_msgSend(v2, "setActiveHIDDeviceCount:", (char *)objc_msgSend(v2, "activeHIDDeviceCount") - 1);
}

- (id)desiredConnectionParameters
{
  id v2 = objc_alloc_init(&OBJC_CLASS___ConnectionParameters);
  LODWORD(v3) = 15.0;
  -[ConnectionParameters setMinInterval:](v2, "setMinInterval:", v3);
  LODWORD(v4) = 15.0;
  -[ConnectionParameters setPreferredInterval:](v2, "setPreferredInterval:", v4);
  LODWORD(v5) = 1140457472;
  -[ConnectionParameters setMaxInterval:](v2, "setMaxInterval:", v5);
  -[ConnectionParameters setMinCELength:](v2, "setMinCELength:", 2LL);
  -[ConnectionParameters setMaxCELength:](v2, "setMaxCELength:", 6LL);
  -[ConnectionParameters setPreferredPeripheralLatency:](v2, "setPreferredPeripheralLatency:", 4LL);
  -[ConnectionParameters setMaxPeripheralLatency:](v2, "setMaxPeripheralLatency:", 4LL);
  -[ConnectionParameters setTimeout:](v2, "setTimeout:", 1000LL);
  return v2;
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
}

- (HIDBluetoothDevice)init
{
  double v3 = [NSString stringWithUTF8String:];
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Calling %@ is not allowed",  v3);

  return 0LL;
}

- (HIDBluetoothDevice)initWithProperties:(id)a3 reports:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HIDBluetoothDevice;
  result = -[HIDBluetoothDevice init](&v5, "init", a3, a4);
  if (result) {
    result->_state = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___HIDBluetoothDevice;
  -[HIDBluetoothDevice dealloc](&v2, "dealloc");
}

- (void)notifyDidStart
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012670;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012720;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)notifyDesiredConnectionParametersDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000127C0;
  block[3] = &unk_10005CB58;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (int)getReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  unsigned int v10 = [self service];
  LODWORD(a6) = [v10 readReportData:a3 reportID:v8 reportType:v7 error:a6];

  return (int)a6;
}

- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  v11 = -[HIDBluetoothDevice service];
  LODWORD(a6) = [v11 writeReportData:v10 reportID:v8 reportType:v7 withResponse:1 error:a6];

  return (int)a6;
}

- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice service](self, "service"));
  LODWORD(v5) = [v9 writeReportData:v8 reportID:v6 reportType:v5 withResponse:0 error:0];

  return v5;
}

- (id)allocHIDQueue
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  double v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(self, v5));
  id v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v4);

  return v8;
}

+ (BOOL)reportsHaveMultipleReportIDs:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) ID:v10];
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v6 = v8;
        }

        else if (v6 != v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (HIDServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end