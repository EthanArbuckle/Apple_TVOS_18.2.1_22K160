@interface USBDeviceMode
+ (id)sharedInstance;
- (BOOL)isACPowered;
- (BOOL)isDeviceMode;
- (BOOL)powerassertion;
- (BOOL)readBootArgOverride;
- (BOOL)start;
- (BOOL)startMatchingNotifications;
- (IONotificationPort)ioNotificationPort;
- (NSMutableDictionary)dataRole;
- (NSMutableDictionary)transportNotifiers;
- (OS_dispatch_queue)queue;
- (USBDeviceMode)init;
- (unsigned)ioServiceAddedIterator;
- (unsigned)powerassertionID;
- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_handleServiceAdded:(unsigned int)a3;
- (void)acquirePowerAssertion;
- (void)dealloc;
- (void)evaluatePowerAssertion;
- (void)registerForPowerSourceUpdates;
- (void)releasePowerAssertion;
- (void)setDataRole:(id)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setIsACPowered:(BOOL)a3;
- (void)setPowerassertion:(BOOL)a3;
- (void)setPowerassertionID:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setTransportNotifiers:(id)a3;
- (void)stopMatchingNotifications;
@end

@implementation USBDeviceMode

+ (id)sharedInstance
{
  if (qword_1000674F0 != -1) {
    dispatch_once(&qword_1000674F0, &stru_10005A288);
  }
  return (id)qword_1000674E8;
}

- (USBDeviceMode)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___USBDeviceMode;
  v2 = -[USBDeviceMode init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.powerd.usbdevicemode", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_ioNotificationPort = 0LL;
    v2->_ioServiceAddedIterator = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transportNotifiers = v2->_transportNotifiers;
    v2->_transportNotifiers = (NSMutableDictionary *)v7;

    os_log_t v9 = os_log_create("com.apple.powerd", "usbdevicemode");
    v10 = (void *)qword_100068808;
    qword_100068808 = (uint64_t)v9;

    v2->_powerassertionID = 0;
    v2->_powerassertion = 0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    dataRole = v2->_dataRole;
    v2->_dataRole = (NSMutableDictionary *)v11;

    v2->_isACPowered = IOPSDrawingUnlimitedPower(v13, v14);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    dispatch_queue_t v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocating %@...", buf, 0xCu);
  }

  -[USBDeviceMode stopMatchingNotifications](self, "stopMatchingNotifications");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___USBDeviceMode;
  -[USBDeviceMode dealloc](&v8, "dealloc");
}

- (BOOL)start
{
  unsigned int v3 = -[USBDeviceMode readBootArgOverride](self, "readBootArgOverride");
  if (v3)
  {
    v4 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Boot arg enable-acsleep is set. Not preventing idle sleep for usb device mode",  v6,  2u);
    }
  }

  else
  {
    -[USBDeviceMode startMatchingNotifications](self, "startMatchingNotifications");
    -[USBDeviceMode registerForPowerSourceUpdates](self, "registerForPowerSourceUpdates");
  }

  return v3 ^ 1;
}

- (void)registerForPowerSourceUpdates
{
  v2 = self;
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F6A0;
  v5[3] = &unk_10005A2B0;
  v5[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.system.powersources.source", &out_token, v3, v5);

  if ((_DWORD)v2)
  {
    v4 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_100043394(v4);
    }
  }

- (BOOL)readBootArgOverride
{
  uint64_t v4 = 0LL;
  v2 = (os_log_s *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "enable-acsleep bootarg override %lld",  buf,  0xCu);
  }

  return v4 != 0;
}

- (BOOL)startMatchingNotifications
{
  kern_return_t v9;
  uint8_t v11[16];
  unsigned int v3 = (os_log_s *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Adding transport matching notifications",  v11,  2u);
  }

  -[USBDeviceMode setIoNotificationPort:](self, "setIoNotificationPort:", IONotificationPortCreate(kIOMainPortDefault));
  uint64_t v4 = -[USBDeviceMode ioNotificationPort](self, "ioNotificationPort");
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode queue](self, "queue"));
  IONotificationPortSetDispatchQueue(v4, v5);

  CFMutableDictionaryRef v6 = IOServiceMatching("IOPortTransportStateUSB");
  -[__CFDictionary setObject:forKey:](v6, "setObject:forKey:", &off_1000604D0, @"IOPropertyMatch");
  uint64_t v7 = -[USBDeviceMode ioNotificationPort](self, "ioNotificationPort");
  objc_super v8 = v6;
  os_log_t v9 = IOServiceAddMatchingNotification( v7,  "IOServiceMatched",  v8,  (IOServiceMatchingCallback)sub_10002F99C,  self,  &self->_ioServiceAddedIterator);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_1000433D0();
    }
  }

  else
  {
    sub_10002F99C(self, -[USBDeviceMode ioServiceAddedIterator](self, "ioServiceAddedIterator"));
  }

  return v9 == 0;
}

- (void)stopMatchingNotifications
{
  unsigned int v3 = (os_log_s *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removing transport matching notifications...",  v4,  2u);
  }

  if (-[USBDeviceMode ioServiceAddedIterator](self, "ioServiceAddedIterator")) {
    IOObjectRelease(-[USBDeviceMode ioServiceAddedIterator](self, "ioServiceAddedIterator"));
  }
  if (-[USBDeviceMode ioNotificationPort](self, "ioNotificationPort")) {
    IONotificationPortDestroy(-[USBDeviceMode ioNotificationPort](self, "ioNotificationPort"));
  }
}

- (void)_handleServiceAdded:(unsigned int)a3
{
  dispatch_queue_t v5 = (os_log_s *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Service matching notification callback fired!",  buf,  2u);
  }

  uint64_t entryID = 0LL;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_100043508();
    }
    goto LABEL_17;
  }

  CFMutableDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode transportNotifiers](self, "transportNotifiers"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", entryID));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  if (v8)
  {
    v19 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_100043490((uint64_t *)&entryID, v19);
    }
LABEL_17:
    CFProperty = 0LL;
    goto LABEL_12;
  }

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"TransportDescription", kCFAllocatorDefault, 0);
  v10 = (os_log_s *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = CFProperty;
    __int16 v24 = 2048;
    uint64_t v25 = entryID;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding transport interest notifications for %@ (registryEntryID: %llu)",  buf,  0x16u);
  }

  io_object_t notification = 0;
  if (IOServiceAddInterestNotification( -[USBDeviceMode ioNotificationPort](self, "ioNotificationPort"),  a3,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10002FDE4,  self,  &notification))
  {
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_100043430();
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode transportNotifiers](self, "transportNotifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", notification));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
    [v11 setObject:v12 forKey:v13];

    CFTypeRef v14 = IORegistryEntryCreateCFProperty(a3, @"DataRole", kCFAllocatorDefault, 0);
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
      [v16 setObject:v15 forKey:v17];

      v18 = (os_log_s *)qword_100068808;
      if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = entryID;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Initial datarole %@ for registryID %llu",  buf,  0x16u);
      }

      -[USBDeviceMode evaluatePowerAssertion](self, "evaluatePowerAssertion");
    }
  }

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  uint64_t entryID = 0LL;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_ERROR)) {
      sub_100043508();
    }
    CFProperty = 0LL;
  }

  else
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"TransportDescription", kCFAllocatorDefault, 0);
    os_log_t v9 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v32 = a4;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = CFProperty;
      *(_WORD *)&v32[14] = 2048;
      *(void *)&v32[16] = entryID;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Transport message arrived! (messageType: 0x%08x, transportDescription: %@, registryEntryID: %llu)",  buf,  0x1Cu);
    }

    if (a4 == -536870896)
    {
      v18 = (os_log_s *)qword_100068808;
      if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v32 = -536870896;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = CFProperty;
        *(_WORD *)&v32[14] = 2048;
        *(void *)&v32[16] = entryID;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Transport terminated! (messageType: 0x%08x, transportDescription: %@, registryEntryID: %llu)",  buf,  0x1Cu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode transportNotifiers](self, "transportNotifiers"));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v20]);

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode transportNotifiers](self, "transportNotifiers"));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
        [v22 removeObjectForKey:v23];

        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
        [v24 removeObjectForKey:v25];

        v26 = (void *)qword_100068808;
        if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Current date roles %@", buf, 0xCu);
        }

        io_object_t v29 = [v21 unsignedIntValue];
        if (v29) {
          IOObjectRelease(v29);
        }
        -[USBDeviceMode releasePowerAssertion](self, "releasePowerAssertion");
      }
    }

    else if (a4 == -536870608)
    {
      v10 = (void *)IORegistryEntryCreateCFProperty(a3, @"DataRole", kCFAllocatorDefault, 0);
      if (v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
        [v11 setObject:v10 forKey:v12];

        uint64_t v13 = (void *)qword_100068808;
        if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
        {
          CFTypeRef v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current date roles %@", buf, 0xCu);
        }

        objc_super v16 = (void *)IORegistryEntryCreateCFProperty(a3, @"DataRoleDescription", kCFAllocatorDefault, 0);
        v17 = (os_log_s *)qword_100068808;
        if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v32 = v10;
          *(_WORD *)&v32[8] = 2112;
          *(void *)&v32[10] = v16;
          *(_WORD *)&v32[18] = 2048;
          *(void *)&v32[20] = entryID;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "messageType: kIOMessageServicePropertyChange dataRole: %@ [%@] for registryID: %llu",  buf,  0x20u);
        }

        -[USBDeviceMode evaluatePowerAssertion](self, "evaluatePowerAssertion");
      }
    }
  }
}

- (void)acquirePowerAssertion
{
  dispatch_queue_t v3 = sub_100038248();
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000302D4;
  block[3] = &unk_100058F38;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)releasePowerAssertion
{
  dispatch_queue_t v3 = sub_100038248();
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030490;
  block[3] = &unk_100058F38;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)isDeviceMode
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[USBDeviceMode dataRole](self, "dataRole"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        BOOL v12 = [v11 intValue] == 1;

        v6 |= v12;
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)evaluatePowerAssertion
{
  if (-[USBDeviceMode isDeviceMode](self, "isDeviceMode") && -[USBDeviceMode isACPowered](self, "isACPowered")) {
    -[USBDeviceMode acquirePowerAssertion](self, "acquirePowerAssertion");
  }
  else {
    -[USBDeviceMode releasePowerAssertion](self, "releasePowerAssertion");
  }
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

- (NSMutableDictionary)transportNotifiers
{
  return self->_transportNotifiers;
}

- (void)setTransportNotifiers:(id)a3
{
}

- (unsigned)powerassertionID
{
  return self->_powerassertionID;
}

- (void)setPowerassertionID:(unsigned int)a3
{
  self->_powerassertionID = a3;
}

- (BOOL)powerassertion
{
  return self->_powerassertion;
}

- (void)setPowerassertion:(BOOL)a3
{
  self->_powerassertion = a3;
}

- (NSMutableDictionary)dataRole
{
  return self->_dataRole;
}

- (void)setDataRole:(id)a3
{
}

- (BOOL)isACPowered
{
  return self->_isACPowered;
}

- (void)setIsACPowered:(BOOL)a3
{
  self->_isACPowered = a3;
}

- (void).cxx_destruct
{
}

@end