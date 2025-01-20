@interface UEIRemoteIRInterfaceListener
+ (__CFDictionary)createUEIRemoteMatchingDictionary;
- (OS_dispatch_queue)queue;
- (UEIRemoteIRInterfaceListener)initWithInterfaceController:(id)a3;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation UEIRemoteIRInterfaceListener

+ (__CFDictionary)createUEIRemoteMatchingDictionary
{
  v2 = IOServiceMatching("IOHIDEventDriver");
  v3 = v2;
  if (v2)
  {
    CFDictionaryAddValue(v2, @"VendorID", &off_4388);
    CFDictionaryAddValue(v3, @"ProductID", &off_43A0);
    CFDictionaryAddValue(v3, @"PrimaryUsagePage", &off_43B8);
    CFDictionaryAddValue(v3, @"PrimaryUsage", &off_43D0);
  }

  return v3;
}

- (UEIRemoteIRInterfaceListener)initWithInterfaceController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UEIRemoteIRInterfaceListener;
  result = -[UEIRemoteIRInterfaceListener initWithInterfaceController:](&v4, "initWithInterfaceController:", a3);
  if (result)
  {
    result->_arrivalNotification = 0;
    result->_terminateNotification = 0;
    result->_notificationPort = 0LL;
  }

  return result;
}

- (void)dealloc
{
  io_object_t arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification)
  {
    IOObjectRelease(arrivalNotification);
    self->_io_object_t arrivalNotification = 0;
  }

  io_object_t terminateNotification = self->_terminateNotification;
  if (terminateNotification)
  {
    IOObjectRelease(terminateNotification);
    self->_io_object_t terminateNotification = 0;
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UEIRemoteIRInterfaceListener;
  -[UEIRemoteIRInterfaceListener dealloc](&v6, "dealloc");
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  kern_return_t v7;
  kern_return_t v8;
  dispatch_queue_s *queue;
  queue = (dispatch_queue_s *)a3;
  -[UEIRemoteIRInterfaceListener setQueue:](self, "setQueue:", queue);
  objc_super v4 = IONotificationPortCreate(kIOMasterPortDefault);
  v5 = queue;
  self->_notificationPort = v4;
  if (v4)
  {
    IONotificationPortSetDispatchQueue(v4, queue);
    p_io_object_t arrivalNotification = &self->_arrivalNotification;
    v7 = IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceMatched",  +[UEIRemoteIRInterfaceListener createUEIRemoteMatchingDictionary]( &OBJC_CLASS___UEIRemoteIRInterfaceListener,  "createUEIRemoteMatchingDictionary"),  (IOServiceMatchingCallback)sub_1160,  self,  &self->_arrivalNotification);
    v5 = queue;
    if (!v7)
    {
      if (!*p_arrivalNotification
        || (v8 = IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceTerminate",  +[UEIRemoteIRInterfaceListener createUEIRemoteMatchingDictionary]( &OBJC_CLASS___UEIRemoteIRInterfaceListener,  "createUEIRemoteMatchingDictionary",  queue),  (IOServiceMatchingCallback)sub_11FC,  self,  &self->_terminateNotification),  v5 = queue,  !v8))
      {
        v5 = queue;
        if (self->_terminateNotification)
        {
          sub_1160(self, *p_arrivalNotification);
          sub_11FC(self, self->_terminateNotification);
          v5 = queue;
        }
      }
    }
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  id v7 = a3;
  io_object_t arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification)
  {
    IOObjectRelease(arrivalNotification);
    self->_io_object_t arrivalNotification = 0;
  }

  io_object_t terminateNotification = self->_terminateNotification;
  if (terminateNotification)
  {
    IOObjectRelease(terminateNotification);
    self->_io_object_t terminateNotification = 0;
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0LL;
  }

  -[UEIRemoteIRInterfaceListener setQueue:](self, "setQueue:", 0LL);
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 10LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }
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