@interface AppleTVRemoteIRInterfaceListener
+ (__CFDictionary)createATVRemoteMatchingDictionary;
- (AppleTVRemoteIRInterfaceListener)initWithInterfaceController:(id)a3;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation AppleTVRemoteIRInterfaceListener

+ (__CFDictionary)createATVRemoteMatchingDictionary
{
  v2 = IOServiceMatching("AppleEmbeddedBluetoothInfrared");
  v3 = v2;
  if (v2)
  {
    CFDictionaryAddValue(v2, @"PrimaryUsagePage", &off_83D8);
    CFDictionaryAddValue(v3, @"PrimaryUsage", &off_83F0);
    CFDictionaryAddValue(v3, @"AppleBluetoothRemote", &__kCFBooleanTrue);
  }

  return v3;
}

- (AppleTVRemoteIRInterfaceListener)initWithInterfaceController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTVRemoteIRInterfaceListener;
  result = -[AppleTVRemoteIRInterfaceListener initWithInterfaceController:](&v4, "initWithInterfaceController:", a3);
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
  v6.super_class = (Class)&OBJC_CLASS___AppleTVRemoteIRInterfaceListener;
  -[AppleTVRemoteIRInterfaceListener dealloc](&v6, "dealloc");
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  kern_return_t v7;
  kern_return_t v8;
  dispatch_queue_s *queue;
  queue = (dispatch_queue_s *)a3;
  -[AppleTVRemoteIRInterfaceListener setQueue:](self, "setQueue:", queue);
  objc_super v4 = IONotificationPortCreate(kIOMasterPortDefault);
  v5 = queue;
  self->_notificationPort = v4;
  if (v4)
  {
    IONotificationPortSetDispatchQueue(v4, queue);
    p_io_object_t arrivalNotification = &self->_arrivalNotification;
    v7 = IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceMatched",  +[AppleTVRemoteIRInterfaceListener createATVRemoteMatchingDictionary]( &OBJC_CLASS___AppleTVRemoteIRInterfaceListener,  "createATVRemoteMatchingDictionary"),  (IOServiceMatchingCallback)sub_4730,  self,  &self->_arrivalNotification);
    v5 = queue;
    if (!v7)
    {
      if (!*p_arrivalNotification
        || (v8 = IOServiceAddMatchingNotification( self->_notificationPort,  "IOServiceTerminate",  +[AppleTVRemoteIRInterfaceListener createATVRemoteMatchingDictionary]( &OBJC_CLASS___AppleTVRemoteIRInterfaceListener,  "createATVRemoteMatchingDictionary",  queue),  (IOServiceMatchingCallback)sub_47CC,  self,  &self->_terminateNotification),  v5 = queue,  !v8))
      {
        v5 = queue;
        if (self->_terminateNotification)
        {
          sub_4730(self, *p_arrivalNotification);
          sub_47CC(self, self->_terminateNotification);
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

  -[AppleTVRemoteIRInterfaceListener setQueue:](self, "setQueue:", 0LL);
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