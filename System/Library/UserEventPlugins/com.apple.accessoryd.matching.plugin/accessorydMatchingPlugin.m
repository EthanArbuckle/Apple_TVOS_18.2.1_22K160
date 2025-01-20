@interface accessorydMatchingPlugin
- (IONotificationPort)systemPowerNotifyPortRef;
- (NSMutableSet)btServiceTokenSet;
- (NSMutableSet)digitalIDTokenSet;
- (OS_dispatch_queue)accPowerQueue;
- (OS_dispatch_queue)systemPowerQueue;
- (OS_dispatch_source)accPowerTimer;
- (accessorydMatchingPlugin)initWithModule:(void *)a3;
- (unsigned)systemPowerIterator;
- (unsigned)systemPowerPort;
- (void)btServiceEventProvider;
- (void)dealloc;
- (void)digitalIDEventProvider;
- (void)eventModule;
- (void)setAccPowerQueue:(id)a3;
- (void)setAccPowerTimer:(id)a3;
- (void)setBtServiceEventProvider:(void *)a3;
- (void)setBtServiceTokenSet:(id)a3;
- (void)setDigitalIDEventProvider:(void *)a3;
- (void)setDigitalIDTokenSet:(id)a3;
- (void)setEventModule:(void *)a3;
- (void)setSystemPowerIterator:(unsigned int)a3;
- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3;
- (void)setSystemPowerPort:(unsigned int)a3;
- (void)setSystemPowerQueue:(id)a3;
- (void)startAccPowerTimer:(unsigned int)a3;
@end

@implementation accessorydMatchingPlugin

- (accessorydMatchingPlugin)initWithModule:(void *)a3
{
  v3 = self;
  if (a3)
  {
    init_logging();
    v5 = -[accessorydMatchingPlugin init](v3, "init");
    v3 = v5;
    if (v5)
    {
      v5->_eventModule = (void **)a3;
      v6 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 1LL);
      digitalIDTokenSet = v3->_digitalIDTokenSet;
      v3->_digitalIDTokenSet = v6;

      v8 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 1LL);
      btServiceTokenSet = v3->_btServiceTokenSet;
      v3->_btServiceTokenSet = v8;

      dispatch_queue_t v10 = dispatch_queue_create("accessorydMatchingPlugin_AccPowerTimerQueue", 0LL);
      accPowerQueue = v3->_accPowerQueue;
      v3->_accPowerQueue = (OS_dispatch_queue *)v10;

      accPowerTimer = v3->_accPowerTimer;
      v3->_accPowerTimer = 0LL;

      dispatch_queue_t v13 = dispatch_queue_create("accessorydMatchingPlugin_SystemPowerQueue", 0LL);
      systemPowerQueue = v3->_systemPowerQueue;
      v3->_systemPowerQueue = (OS_dispatch_queue *)v13;

      v3->_systemPowerNotifyPortRef = 0LL;
      *(void *)&v3->_systemPowerPort = 0LL;
      xpc_event_provider_create();
    }
  }

  else if (self)
  {

    return 0LL;
  }

  return v3;
}

- (void)dealloc
{
  unsigned int systemPowerIterator = self->_systemPowerIterator;
  p_unsigned int systemPowerIterator = &self->_systemPowerIterator;
  if (systemPowerIterator) {
    IODeregisterForSystemPower(p_systemPowerIterator);
  }
  systemPowerNotifyPortRef = self->_systemPowerNotifyPortRef;
  if (systemPowerNotifyPortRef) {
    IONotificationPortDestroy(systemPowerNotifyPortRef);
  }
  io_connect_t systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort) {
    IOServiceClose(systemPowerPort);
  }
  accPowerTimer = self->_accPowerTimer;
  if (accPowerTimer) {
    dispatch_source_cancel((dispatch_source_t)accPowerTimer);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___accessorydMatchingPlugin;
  -[accessorydMatchingPlugin dealloc](&v8, "dealloc");
}

- (void)startAccPowerTimer:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __47__accessorydMatchingPlugin_startAccPowerTimer___block_invoke;
  v3[3] = &unk_14DE0;
  v3[4] = self;
  unsigned int v4 = a3;
  if (startAccPowerTimer__initAccPowerTimerOnce != -1) {
    dispatch_once(&startAccPowerTimer__initAccPowerTimerOnce, v3);
  }
}

- (void)eventModule
{
  return self->_eventModule;
}

- (void)setEventModule:(void *)a3
{
  self->_eventModule = a3;
}

- (void)digitalIDEventProvider
{
  return self->_digitalIDEventProvider;
}

- (void)setDigitalIDEventProvider:(void *)a3
{
  self->_digitalIDEventProvider = a3;
}

- (NSMutableSet)digitalIDTokenSet
{
  return self->_digitalIDTokenSet;
}

- (void)setDigitalIDTokenSet:(id)a3
{
}

- (void)btServiceEventProvider
{
  return self->_btServiceEventProvider;
}

- (void)setBtServiceEventProvider:(void *)a3
{
  self->_btServiceEventProvider = a3;
}

- (NSMutableSet)btServiceTokenSet
{
  return self->_btServiceTokenSet;
}

- (void)setBtServiceTokenSet:(id)a3
{
}

- (OS_dispatch_queue)accPowerQueue
{
  return self->_accPowerQueue;
}

- (void)setAccPowerQueue:(id)a3
{
}

- (OS_dispatch_source)accPowerTimer
{
  return self->_accPowerTimer;
}

- (void)setAccPowerTimer:(id)a3
{
}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_io_connect_t systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_unsigned int systemPowerIterator = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithModule:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "IORegisterForSystemPower failed!!  Accesssory power will not be turned on after system sleep.",  v1,  2u);
}

@end