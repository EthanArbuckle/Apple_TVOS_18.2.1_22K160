@interface IAPTransportManager
- (IAPTransportManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4;
- (NSNumber)portNumber;
- (int)accResistorID;
- (unsigned)service;
- (void)_setAccResistorID:(int)a3;
- (void)dealloc;
@end

@implementation IAPTransportManager

- (IAPTransportManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IAPTransportManager;
  v6 = -[IAPTransportManager init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_accResistorID = -1;
    v6->_notificationPortRef = a4;
    v6->_service = a3;
    NSLog(@"Spoofing port manager 1 for ATV...");
    v7->_portNumber = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
  }

  return v7;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  io_object_t notification = self->_notification;
  if (notification)
  {
    IOObjectRelease(notification);
    self->_io_object_t notification = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IAPTransportManager;
  -[IAPTransportManager dealloc](&v5, "dealloc");
}

- (int)accResistorID
{
  uint64_t service = self->_service;
  if (!(_DWORD)service) {
    return 100;
  }
  int result = self->_accResistorID;
  if (result == -1)
  {
    int result = IOAccessoryManagerGetAccessoryID(service, a2);
    self->_accResistorID = result;
  }

  if (result == -1) {
    return 100;
  }
  return result;
}

- (void)_setAccResistorID:(int)a3
{
  self->_accResistorID = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (NSNumber)portNumber
{
  return self->_portNumber;
}

@end