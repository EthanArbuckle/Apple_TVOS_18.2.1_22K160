@interface HIDGenericDevice
- (HIDGenericDevice)initWithProperties:(id)a3 reports:(id)a4;
- (OS_dispatch_queue)queue;
- (__IOHIDUserDevice)device;
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDGenericDevice

- (HIDGenericDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HIDGenericDevice;
  v7 = -[HIDBluetoothDevice initWithProperties:reports:](&v10, "initWithProperties:reports:", v6, a4);
  if (v7)
  {
    uint64_t v8 = IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v6, 1LL);
    v7->_device = (__IOHIDUserDevice *)v8;
    if (v8)
    {
      IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_100038920, v7);
      IOHIDUserDeviceRegisterSetReportCallback(v7->_device, sub_100038938, v7);
    }

    else
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  if (-[HIDGenericDevice device](self, "device")) {
    CFRelease(-[HIDGenericDevice device](self, "device"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDGenericDevice;
  -[HIDBluetoothDevice dealloc](&v3, "dealloc");
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HIDGenericDevice;
  -[HIDBluetoothDevice start](&v6, "start");
  id v3 = -[HIDBluetoothDevice allocHIDQueue](self, "allocHIDQueue");
  -[HIDGenericDevice setQueue:](self, "setQueue:", v3);

  v4 = -[HIDGenericDevice device](self, "device");
  v5 = [self queue];
  IOHIDUserDeviceScheduleWithDispatchQueue(v4, v5);

  -[HIDBluetoothDevice notifyDidStart](self, "notifyDidStart");
}

- (void)stop
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HIDGenericDevice;
  -[HIDBluetoothDevice stop](&v7, "stop");
  id v3 = -[HIDGenericDevice device](self, "device");
  v4 = [self queue];
  IOHIDUserDeviceUnscheduleFromDispatchQueue(v3, v4);

  v5 = [self queue];
  dispatch_set_context(v5, self);

  objc_super v6 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[HIDGenericDevice queue](self, "queue"));
  dispatch_set_finalizer_f(v6, (dispatch_function_t)j__objc_msgSend_notifyDidStop_1);

  -[HIDGenericDevice setQueue:](self, "setQueue:", 0LL);
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  return -536870212;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  return -536870212;
}

- (__IOHIDUserDevice)device
{
  return self->_device;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end