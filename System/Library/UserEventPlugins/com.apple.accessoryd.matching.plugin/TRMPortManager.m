@interface TRMPortManager
- (BOOL)_startMatchingNotifications;
- (BOOL)matchingNotificationsStarted;
- (IONotificationPort)ioNotificationPort;
- (NSArray)ports;
- (NSDictionary)ioMatchingDictionary;
- (NSMutableDictionary)portsMutable;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (TRMPortManager)initWithMatchingDictionary:(id)a3;
- (TRMPortManager)initWithMatchingDictionary:(id)a3 andDelegate:(id)a4;
- (TRMPortManagerDelegate)delegate;
- (unsigned)ioServiceAddedIterator;
- (void)_handleServiceAdded:(unsigned int)a3;
- (void)_stopMatchingNotifications;
- (void)dealloc;
- (void)portDidTerminate:(id)a3;
- (void)portDidUpdate:(id)a3;
- (void)portDidUpdateAuthorizationState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIoMatchingDictionary:(id)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setMatchingNotificationsStarted:(BOOL)a3;
- (void)setPortsMutable:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TRMPortManager

- (TRMPortManager)initWithMatchingDictionary:(id)a3
{
  return -[TRMPortManager initWithMatchingDictionary:andDelegate:]( self,  "initWithMatchingDictionary:andDelegate:",  a3,  0LL);
}

- (TRMPortManager)initWithMatchingDictionary:(id)a3 andDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412802;
    v25 = v11;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initializing %@... (matchingDictionary: %@, delegate: %@)",  buf,  0x20u);
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TRMPortManager;
  v12 = -[TRMPortManager init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    if (v7)
    {
      objc_storeWeak((id *)&v12->_delegate, v8);
      objc_storeStrong((id *)&v13->_ioMatchingDictionary, a3);
      v14 = (objc_class *)objc_opt_class(v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v16));
      dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v18;

      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      portsMutable = v13->_portsMutable;
      v13->_portsMutable = (NSMutableDictionary *)v20;

      -[TRMPortManager _startMatchingNotifications](v13, "_startMatchingNotifications");
    }

    else
    {

      v13 = 0LL;
    }
  }

  return v13;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TRMPortManager;
  v2 = -[TRMPortManager description](&v4, "description");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    objc_super v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deallocating %@...", buf, 0xCu);
  }

  -[TRMPortManager _stopMatchingNotifications](self, "_stopMatchingNotifications");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TRMPortManager;
  -[TRMPortManager dealloc](&v6, "dealloc");
}

- (NSArray)ports
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager portsMutable](self, "portsMutable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return (NSArray *)v3;
}

- (BOOL)_startMatchingNotifications
{
  kern_return_t v8;
  int v10;
  void *v11;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager ioMatchingDictionary](self, "ioMatchingDictionary"));
    v10 = 138412290;
    v11 = v3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Adding matching notifications... (ioMatchingDictionary: %@)",  (uint8_t *)&v10,  0xCu);
  }

  if (-[TRMPortManager matchingNotificationsStarted](self, "matchingNotificationsStarted")) {
    -[TRMPortManager _stopMatchingNotifications](self, "_stopMatchingNotifications");
  }
  -[TRMPortManager setIoNotificationPort:](self, "setIoNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
  objc_super v4 = -[TRMPortManager ioNotificationPort](self, "ioNotificationPort");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPortManager queue](self, "queue"));
  IONotificationPortSetDispatchQueue(v4, v5);

  objc_super v6 = -[TRMPortManager ioNotificationPort](self, "ioNotificationPort");
  id v7 = idobjc_claimAutoreleasedReturnValue(-[TRMPortManager ioMatchingDictionary](self, "ioMatchingDictionary"));
  id v8 = IOServiceAddMatchingNotification( v6,  "IOServiceMatched",  v7,  (IOServiceMatchingCallback)_serviceAdded,  self,  &self->_ioServiceAddedIterator);

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109120;
      LODWORD(v11) = v8;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IOServiceAddMatchingNotification failed: %08x",  (uint8_t *)&v10,  8u);
    }
  }

  else
  {
    _serviceAdded(self, -[TRMPortManager ioServiceAddedIterator](self, "ioServiceAddedIterator"));
    -[TRMPortManager setMatchingNotificationsStarted:](self, "setMatchingNotificationsStarted:", 1LL);
  }

  return v8 == 0;
}

- (void)_stopMatchingNotifications
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager ioMatchingDictionary](self, "ioMatchingDictionary"));
    int v4 = 138412290;
    v5 = v3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing matching notifications... (ioMatchingDictionary: %@)",  (uint8_t *)&v4,  0xCu);
  }

  if (-[TRMPortManager ioServiceAddedIterator](self, "ioServiceAddedIterator")) {
    IOObjectRelease(-[TRMPortManager ioServiceAddedIterator](self, "ioServiceAddedIterator"));
  }
  if (-[TRMPortManager ioNotificationPort](self, "ioNotificationPort")) {
    IONotificationPortDestroy(-[TRMPortManager ioNotificationPort](self, "ioNotificationPort"));
  }
  -[TRMPortManager setMatchingNotificationsStarted:](self, "setMatchingNotificationsStarted:", 0LL);
}

- (void)_handleServiceAdded:(unsigned int)a3
{
  kern_return_t RegistryEntryID;
  void *v6;
  void *v7;
  void *v8;
  TRMPort *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t entryID;
  uint8_t buf[4];
  TRMPort *v17;
  uint64_t v3 = *(void *)&a3;
  entryID = 0LL;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &entryID);
  if (RegistryEntryID)
  {
    v14 = RegistryEntryID;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[TRMPortManager _handleServiceAdded:].cold.2(v14);
    }
    goto LABEL_12;
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager portsMutable](self, "portsMutable"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", entryID));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      -[TRMPortManager _handleServiceAdded:].cold.1((uint64_t *)&entryID);
    }
LABEL_12:
    v9 = 0LL;
    goto LABEL_7;
  }

  v9 = -[TRMPort initWithService:andDelegate:]( objc_alloc(&OBJC_CLASS___TRMPort),  "initWithService:andDelegate:",  v3,  self);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "New port added: %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager portsMutable](self, "portsMutable"));
  v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", entryID));
  [v10 setObject:v9 forKey:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager delegate](self, "delegate"));
  LOBYTE(v11) = objc_opt_respondsToSelector(v12, "portManager:didAddPort:");

  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPortManager delegate](self, "delegate"));
    [v13 portManager:self didAddPort:v9];
  }

- (void)portDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPortManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __32__TRMPortManager_portDidUpdate___block_invoke;
  v7[3] = &unk_14CD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __32__TRMPortManager_portDidUpdate___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "portManager:didUpdatePort:");

  if ((v3 & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v4 portManager:*(void *)(a1 + 32) didUpdatePort:*(void *)(a1 + 40)];
  }

- (void)portDidUpdateAuthorizationState:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_claimAutoreleasedReturnValue([v4 description]);
    *(_DWORD *)buf = 136315138;
    id v11 = [v5 UTF8String];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "portDidUpdateAuthorizationState: %s\n",  buf,  0xCu);
  }

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPortManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __50__TRMPortManager_portDidUpdateAuthorizationState___block_invoke;
  v8[3] = &unk_14CD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __50__TRMPortManager_portDidUpdateAuthorizationState___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "portManager:didUpdateAuthorizationStateForPort:");

  if ((v3 & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v4 portManager:*(void *)(a1 + 32) didUpdateAuthorizationStateForPort:*(void *)(a1 + 40)];
  }

- (void)portDidTerminate:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_claimAutoreleasedReturnValue([v4 description]);
    *(_DWORD *)buf = 136315138;
    id v11 = [v5 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "portDidTerminate: %s\n", buf, 0xCu);
  }

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPortManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __35__TRMPortManager_portDidTerminate___block_invoke;
  v8[3] = &unk_14CD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __35__TRMPortManager_portDidTerminate___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) portsMutable]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(a1 + 40) registryEntryID]));
  [v2 removeObjectForKey:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  LOBYTE(v3) = objc_opt_respondsToSelector(v4, "portManager:didRemovePort:");

  if ((v3 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v5 portManager:*(void *)(a1 + 32) didRemovePort:*(void *)(a1 + 40)];
  }

- (TRMPortManagerDelegate)delegate
{
  return (TRMPortManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)ioMatchingDictionary
{
  return self->_ioMatchingDictionary;
}

- (void)setIoMatchingDictionary:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (BOOL)matchingNotificationsStarted
{
  return self->_matchingNotificationsStarted;
}

- (void)setMatchingNotificationsStarted:(BOOL)a3
{
  self->_matchingNotificationsStarted = a3;
}

- (NSMutableDictionary)portsMutable
{
  return self->_portsMutable;
}

- (void)setPortsMutable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_handleServiceAdded:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Port object already exists for service, ignoring... (registryEntryID: %llu)",  (uint8_t *)&v2,  0xCu);
}

- (void)_handleServiceAdded:(int)a1 .cold.2(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "IORegistryEntryGetRegistryEntryID failed: %08x",  (uint8_t *)v1,  8u);
}

@end