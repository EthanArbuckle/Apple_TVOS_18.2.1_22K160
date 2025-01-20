@interface TRMPort
- (BOOL)_startInterestNotifications;
- (BOOL)_updatePropertiesFromService;
- (BOOL)authorizationPending;
- (BOOL)authorizationRequired;
- (BOOL)builtIn;
- (BOOL)connectionActive;
- (BOOL)interestNotificationsStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInactive;
- (BOOL)userAuthorizationPending;
- (IONotificationPort)ioNotificationPort;
- (NSArray)transportsUnauthorized;
- (NSDictionary)servicePropertiesFiltered;
- (NSString)connectionUUID;
- (NSString)portDescription;
- (NSString)portTypeDescription;
- (NSString)userAuthorizationStatusDescription;
- (OS_dispatch_queue)queue;
- (TRMPort)initWithService:(unsigned int)a3 andDelegate:(id)a4;
- (TRMPortDelegate)delegate;
- (id)description;
- (int)portNumber;
- (int)portType;
- (int)userAuthorizationStatus;
- (unint64_t)registryEntryID;
- (unsigned)ioNotification;
- (unsigned)service;
- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_stopInterestNotifications;
- (void)dealloc;
- (void)setAuthorizationPending:(BOOL)a3;
- (void)setAuthorizationRequired:(BOOL)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setConnectionActive:(BOOL)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setInterestNotificationsStarted:(BOOL)a3;
- (void)setIoNotification:(unsigned int)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setPortDescription:(id)a3;
- (void)setPortNumber:(int)a3;
- (void)setPortType:(int)a3;
- (void)setPortTypeDescription:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistryEntryID:(unint64_t)a3;
- (void)setService:(unsigned int)a3;
- (void)setServicePropertiesFiltered:(id)a3;
- (void)setTransportsUnauthorized:(id)a3;
- (void)setUserAuthorizationPending:(BOOL)a3;
- (void)setUserAuthorizationStatus:(int)a3;
- (void)setUserAuthorizationStatus:(int)a3 completionHandler:(id)a4;
- (void)setUserAuthorizationStatusDescription:(id)a3;
@end

@implementation TRMPort

- (TRMPort)initWithService:(unsigned int)a3 andDelegate:(id)a4
{
  kern_return_t RegistryEntryID;
  kern_return_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 1024;
    v25 = a3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initializing %@... (service: %u)",  buf,  0x12u);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TRMPort;
  v10 = -[TRMPort init](&v21, "init");
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      v10->_service = a3;
      IOObjectRetain(a3);
      objc_storeWeak((id *)&v11->_delegate, v6);
      RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &v11->_registryEntryID);
      if (!RegistryEntryID)
      {
        v14 = (objc_class *)objc_opt_class(v11);
        v15 = NSStringFromClass(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%llu", v16, v11->_registryEntryID));
        v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
        queue = v11->_queue;
        v11->_queue = (OS_dispatch_queue *)v18;

        -[TRMPort _startInterestNotifications](v11, "_startInterestNotifications");
        -[TRMPort _updatePropertiesFromService](v11, "_updatePropertiesFromService");
        goto LABEL_11;
      }

      v13 = RegistryEntryID;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v13;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryGetRegistryEntryID failed: %08x",  buf,  8u);
      }

      IOObjectRelease(a3);
    }

    v11 = 0LL;
  }

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort portDescription](self, "portDescription"));
  unint64_t v7 = -[TRMPort registryEntryID](self, "registryEntryID");
  unsigned int v8 = -[TRMPort authorizationPending](self, "authorizationPending");
  unsigned int v9 = -[TRMPort userAuthorizationPending](self, "userAuthorizationPending");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort userAuthorizationStatusDescription](self, "userAuthorizationStatusDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort transportsUnauthorized](self, "transportsUnauthorized"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, portDescription: %@, registryEntryID: %llu, authorizationPending: %d, userAuthorizationPending: %d, userAuthorizationStatusDescription: [%@], transportsUnauthorized: %@>",  v5,  self,  v6,  v7,  v8,  v9,  v10,  v11));

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = [v4 registryEntryID];
    BOOL v7 = v6 == (id)-[TRMPort registryEntryID](self, "registryEntryID");
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class(self);
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    *(_DWORD *)buf = 138412546;
    unsigned int v9 = v5;
    __int16 v10 = 2048;
    unint64_t v11 = -[TRMPort registryEntryID](self, "registryEntryID");
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deallocating %@... (self.registryEntryID: %llu)",  buf,  0x16u);
  }

  -[TRMPort _stopInterestNotifications](self, "_stopInterestNotifications");
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TRMPort;
  -[TRMPort dealloc](&v7, "dealloc");
}

- (void)setUserAuthorizationStatus:(int)a3 completionHandler:(id)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPort queue](self, "queue", *(void *)&a3, a4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke;
  v7[3] = &unk_14DE0;
  v7[4] = self;
  int v8 = a3;
  dispatch_async(v6, v7);
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke(uint64_t a1)
{
  io_connect_t connect = -1431655766;
  io_service_t v2 = [*(id *)(a1 + 32) service];
  uint64_t v3 = IOServiceOpen(v2, mach_task_self_, 1u, &connect);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TRMPortErrorDomain",  -2LL,  0LL));
  }

  else
  {
    uint64_t v22 = *(unsigned int *)(a1 + 40);
    uint64_t v13 = IOConnectCallScalarMethod(connect, 0, &v22, 1u, 0LL, 0LL);
    if ((_DWORD)v13)
    {
      uint64_t v14 = v13;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_1( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TRMPortErrorDomain",  -2LL,  0LL));
    }

    else
    {
      v12 = 0LL;
    }

    IOServiceClose(connect);
  }
}

- (BOOL)_updatePropertiesFromService
{
  kern_return_t CFProperties;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  kern_return_t v28;
  _DWORD v29[4];
  _BYTE buf[24];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = -[TRMPort registryEntryID](self, "registryEntryID");
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Updating properties... (self.registryEntryID: %llu)",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  if (_updatePropertiesFromService_onceToken != -1) {
    dispatch_once(&_updatePropertiesFromService_onceToken, &__block_literal_global_2);
  }
  if (!-[TRMPort service](self, "service")) {
    return 0;
  }
  CFProperties = IORegistryEntryCreateCFProperties( -[TRMPort service](self, "service"),  (CFMutableDictionaryRef *)buf,  kCFAllocatorDefault,  0);
  if (CFProperties)
  {
    v28 = CFProperties;
    uint64_t v13 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    v29[0] = 67109120;
    v29[1] = v28;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryCreateCFProperties failed: %08x",  (uint8_t *)v29,  8u);
    return 0;
  }

  uint64_t v4 = *(void **)buf;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)buf dictionaryWithValuesForKeys:_updatePropertiesFromService_propertyFilter]);
  uint64_t v6 = [v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeysForObject:v7]);
  [v6 removeObjectsForKeys:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort servicePropertiesFiltered](self, "servicePropertiesFiltered"));
  uint64_t v10 = [v6 isEqualToDictionary:v9];

  uint64_t v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v11)
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No properties have changed!",  (uint8_t *)v29,  2u);
    }
  }

  else
  {
    if (v11)
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Properties have changed!",  (uint8_t *)v29,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort servicePropertiesFiltered](self, "servicePropertiesFiltered"));
    printDictionaryDelta(v12, v6);

    -[TRMPort setServicePropertiesFiltered:](self, "setServicePropertiesFiltered:", v6);
  }

  uint64_t v13 = v10 ^ 1;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PortDescription"]);
  -[TRMPort setPortDescription:](self, "setPortDescription:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PortType"]);
  -[TRMPort setPortType:](self, "setPortType:", [v15 intValue]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PortTypeDescription"]);
  -[TRMPort setPortTypeDescription:](self, "setPortTypeDescription:", v16);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PortNumber"]);
  -[TRMPort setPortNumber:](self, "setPortNumber:", [v17 intValue]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BuiltIn"]);
  -[TRMPort setBuiltIn:](self, "setBuiltIn:", [v18 BOOLValue]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ConnectionActive"]);
  -[TRMPort setConnectionActive:](self, "setConnectionActive:", [v19 BOOLValue]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ConnectionUUID"]);
  -[TRMPort setConnectionUUID:](self, "setConnectionUUID:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AuthorizationRequired"]);
  -[TRMPort setAuthorizationRequired:](self, "setAuthorizationRequired:", [v21 BOOLValue]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AuthorizationPending"]);
  -[TRMPort setAuthorizationPending:](self, "setAuthorizationPending:", [v22 BOOLValue]);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UserAuthorizationPending"]);
  -[TRMPort setUserAuthorizationPending:](self, "setUserAuthorizationPending:", [v23 BOOLValue]);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TransportsUnauthorized"]);
  -[TRMPort setTransportsUnauthorized:](self, "setTransportsUnauthorized:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UserAuthorizationStatus"]);
  -[TRMPort setUserAuthorizationStatus:](self, "setUserAuthorizationStatus:", [v25 intValue]);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UserAuthorizationStatusDescription"]);
  -[TRMPort setUserAuthorizationStatusDescription:](self, "setUserAuthorizationStatusDescription:", v26);

  return v13;
}

void __39__TRMPort__updatePropertiesFromService__block_invoke(id a1)
{
  v1 = (void *)_updatePropertiesFromService_propertyFilter;
  _updatePropertiesFromService_propertyFilter = (uint64_t)&off_18DA8;
}

- (BOOL)_startInterestNotifications
{
  kern_return_t v5;
  int v7;
  unint64_t v8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = 134217984;
    uint64_t v8 = -[TRMPort registryEntryID](self, "registryEntryID");
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Registering for interest notifications... (self.registryEntryID: %llu)",  (uint8_t *)&v7,  0xCu);
  }

  -[TRMPort setIoNotificationPort:](self, "setIoNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
  uint64_t v3 = -[TRMPort ioNotificationPort](self, "ioNotificationPort");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TRMPort queue](self, "queue"));
  IONotificationPortSetDispatchQueue(v3, v4);

  uint64_t v5 = IOServiceAddInterestNotification( -[TRMPort ioNotificationPort](self, "ioNotificationPort"),  -[TRMPort service](self, "service"),  "IOGeneralInterest",  (IOServiceInterestCallback)_serviceNotification,  self,  &self->_ioNotification);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = 67109120;
      LODWORD(v8) = v5;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IOServiceAddInterestNotification failed: %08x",  (uint8_t *)&v7,  8u);
    }
  }

  else
  {
    -[TRMPort setInterestNotificationsStarted:](self, "setInterestNotificationsStarted:", 1LL);
  }

  return v5 == 0;
}

- (void)_stopInterestNotifications
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    unint64_t v4 = -[TRMPort registryEntryID](self, "registryEntryID");
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disabling interest notifications... (self.registryEntryID: %llu)",  (uint8_t *)&v3,  0xCu);
  }

  if (-[TRMPort ioNotification](self, "ioNotification")) {
    IOObjectRelease(-[TRMPort ioNotification](self, "ioNotification"));
  }
  if (-[TRMPort ioNotificationPort](self, "ioNotificationPort")) {
    IONotificationPortDestroy(-[TRMPort ioNotificationPort](self, "ioNotificationPort"));
  }
  -[TRMPort setInterestNotificationsStarted:](self, "setInterestNotificationsStarted:", 0LL);
}

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  switch(a4)
  {
    case 0xE0000010:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "messageType: kIOMessageServiceIsTerminated",  v18,  2u);
      }

      -[TRMPort setIsInactive:](self, "setIsInactive:", 1LL);
      -[TRMPort _stopInterestNotifications](self, "_stopInterestNotifications");
      io_object_t service = self->_service;
      if (service) {
        IOObjectRelease(service);
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
      char v11 = objc_opt_respondsToSelector(v10, "portDidTerminate:");

      if ((v11 & 1) != 0)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
        [v8 portDidTerminate:self];
        goto LABEL_22;
      }

      break;
    case 0xE3FF80CB:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "messageType: kIOPort_Message_AuthorizationStateChange",  v17,  2u);
      }

      if (-[TRMPort _updatePropertiesFromService](self, "_updatePropertiesFromService"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
        char v13 = objc_opt_respondsToSelector(v12, "portDidUpdate:");

        if ((v13 & 1) != 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
          [v14 portDidUpdate:self];
        }
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
      char v16 = objc_opt_respondsToSelector(v15, "portDidUpdateAuthorizationState:");

      if ((v16 & 1) != 0)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
        [v8 portDidUpdateAuthorizationState:self];
        goto LABEL_22;
      }

      break;
    case 0xE0000130:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "messageType: kIOMessageServicePropertyChange",  buf,  2u);
      }

      if (-[TRMPort _updatePropertiesFromService](self, "_updatePropertiesFromService"))
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
        char v7 = objc_opt_respondsToSelector(v6, "portDidUpdate:");

        if ((v7 & 1) != 0)
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRMPort delegate](self, "delegate"));
          [v8 portDidUpdate:self];
LABEL_22:
        }
      }

      break;
  }

- (TRMPortDelegate)delegate
{
  return (TRMPortDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (void)setRegistryEntryID:(unint64_t)a3
{
  self->_registryEntryID = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (NSString)portDescription
{
  return self->_portDescription;
}

- (void)setPortDescription:(id)a3
{
}

- (int)portType
{
  return self->_portType;
}

- (void)setPortType:(int)a3
{
  self->_portType = a3;
}

- (NSString)portTypeDescription
{
  return self->_portTypeDescription;
}

- (void)setPortTypeDescription:(id)a3
{
}

- (int)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(int)a3
{
  self->_portNumber = a3;
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (BOOL)connectionActive
{
  return self->_connectionActive;
}

- (void)setConnectionActive:(BOOL)a3
{
  self->_connectionActive = a3;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (BOOL)authorizationRequired
{
  return self->_authorizationRequired;
}

- (void)setAuthorizationRequired:(BOOL)a3
{
  self->_authorizationRequired = a3;
}

- (BOOL)authorizationPending
{
  return self->_authorizationPending;
}

- (void)setAuthorizationPending:(BOOL)a3
{
  self->_authorizationPending = a3;
}

- (BOOL)userAuthorizationPending
{
  return self->_userAuthorizationPending;
}

- (void)setUserAuthorizationPending:(BOOL)a3
{
  self->_userAuthorizationPending = a3;
}

- (NSArray)transportsUnauthorized
{
  return self->_transportsUnauthorized;
}

- (void)setTransportsUnauthorized:(id)a3
{
}

- (int)userAuthorizationStatus
{
  return self->_userAuthorizationStatus;
}

- (void)setUserAuthorizationStatus:(int)a3
{
  self->_userAuthorizationStatus = a3;
}

- (NSString)userAuthorizationStatusDescription
{
  return self->_userAuthorizationStatusDescription;
}

- (void)setUserAuthorizationStatusDescription:(id)a3
{
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
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

- (unsigned)ioNotification
{
  return self->_ioNotification;
}

- (void)setIoNotification:(unsigned int)a3
{
  self->_ioNotification = a3;
}

- (BOOL)interestNotificationsStarted
{
  return self->_interestNotificationsStarted;
}

- (void)setInterestNotificationsStarted:(BOOL)a3
{
  self->_interestNotificationsStarted = a3;
}

- (NSDictionary)servicePropertiesFiltered
{
  return self->_servicePropertiesFiltered;
}

- (void)setServicePropertiesFiltered:(id)a3
{
}

- (void).cxx_destruct
{
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_0_1( &dword_0,  (os_log_s *)&_os_log_default,  a3,  "Failed to set user authorization status! IOConnectCallScalarMethod returned 0x%08x",  a5,  a6,  a7,  a8,  0);
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_0_1( &dword_0,  (os_log_s *)&_os_log_default,  a3,  "Failed to open user client! IOServiceOpen returned 0x%08x",  a5,  a6,  a7,  a8,  0);
}

@end